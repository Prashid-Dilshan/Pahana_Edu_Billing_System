package com.example.pahanaedu_billing_system.controller;

import com.example.pahanaedu_billing_system.dto.StaffLoginDTO;
import com.example.pahanaedu_billing_system.service.StaffLoginService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/StaffLoginServlet")
public class StaffLoginServlet extends HttpServlet {
    private final StaffLoginService loginService = new StaffLoginService();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // First, check if username and password are the same
        if (username.equals(password)) {
            request.setAttribute("error", "Username and password cannot be the same. Please try again.");
            request.getRequestDispatcher("staff_login.jsp").forward(request, response);
            return;
        }

        // Check if username is valid
        boolean usernameValid = loginService.isUsernameValid(username);

        // If username is valid, check password
        boolean passwordValid = usernameValid && loginService.isPasswordValid(username, password);

        if (usernameValid && passwordValid) {
            StaffLoginDTO staffDTO = loginService.validateStaff(username, password); // Still use this to get DTO
            if (staffDTO != null) {
                request.getSession().setAttribute("staff", staffDTO);
                response.sendRedirect("staff_dashboard.html");
            } else {
                // Fallback error (should not happen if checks are consistent)
                request.setAttribute("error", "Invalid staff username or password!");
                request.getRequestDispatcher("staff_login.jsp").forward(request, response);
            }
        } else {
            String errorMsg;
            if (!usernameValid) {
                errorMsg = "Invalid username. Please try again.";
            } else {
                errorMsg = "Invalid password. Please try again.";
            }
            request.setAttribute("error", errorMsg);
            request.getRequestDispatcher("staff_login.jsp").forward(request, response);
        }
    }
}
