package com.example.pahanaedu_billing_system.controller;

import com.example.pahanaedu_billing_system.dto.AdminLoginDTO;
import com.example.pahanaedu_billing_system.service.AdminLoginService;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

public class AdminLoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Map request parameters to DTO
        AdminLoginDTO credentials = new AdminLoginDTO(
                request.getParameter("username"),
                request.getParameter("password")
        );

        String username = credentials.getUsername();
        String password = credentials.getPassword();

        AdminLoginService authService = new AdminLoginService();

        // First, check if username and password are the same
        if (username.equals(password)) {
            request.setAttribute("error", "Username and password cannot be the same. Please try again.");
            request.getRequestDispatcher("admin_login.jsp").forward(request, response);
            return;
        }

        // Check if username is valid
        boolean usernameValid = authService.isUsernameValid(username);

        // If username is valid, check password
        boolean passwordValid = usernameValid && authService.isPasswordValid(username, password);

        if (usernameValid && passwordValid) {
            response.sendRedirect("admin_dashboard.html");
        } else {
            String errorMsg;
            if (!usernameValid) {
                errorMsg = "Invalid username. Please try again.";
            } else {
                errorMsg = "Invalid password. Please try again.";
            }
            request.setAttribute("error", errorMsg);
            request.getRequestDispatcher("admin_login.jsp").forward(request, response);
        }
    }
}
