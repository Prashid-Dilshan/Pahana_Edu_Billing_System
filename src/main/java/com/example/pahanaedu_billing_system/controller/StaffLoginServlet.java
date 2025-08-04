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

        StaffLoginDTO staffDTO = loginService.validateStaff(username, password);
        if (staffDTO != null) {
            // You can store staffDTO in session for later use (optional)
            request.getSession().setAttribute("staff", staffDTO);
            response.sendRedirect("staff_dashboard.html");
        } else {
            request.setAttribute("error", "Invalid staff username or password!");
            request.getRequestDispatcher("staff_login.jsp").forward(request, response);
        }
    }
}
