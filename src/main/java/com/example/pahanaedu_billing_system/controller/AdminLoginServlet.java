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

        AdminLoginService authService = new AdminLoginService();
        boolean isAuthenticated = authService.loginCheck(credentials);

        if (!isAuthenticated) {
            request.setAttribute("error", "Invalid username or password. Please try again.");
            request.getRequestDispatcher("admin_login.jsp").forward(request, response);
        } else {
            response.sendRedirect("admin_dashboard.html");
        }
    }
}
