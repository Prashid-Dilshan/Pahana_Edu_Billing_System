package com.example.pahanaedu_billing_system.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

public class AdminLoginServlet extends HttpServlet {
    private static final String ADMIN_USERNAME = "admin";
    private static final String ADMIN_PASSWORD = "12345";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        if (!ADMIN_USERNAME.equals(username)) {
            request.setAttribute("error", "Incorrect username. Please try again.");
            request.getRequestDispatcher("admin_login.jsp").forward(request, response);
        } else if (!ADMIN_PASSWORD.equals(password)) {
            request.setAttribute("error", "Incorrect password. Please try again.");
            request.getRequestDispatcher("admin_login.jsp").forward(request, response);
        } else {
            response.sendRedirect("admin_dashboard.html");
        }
    }
}
