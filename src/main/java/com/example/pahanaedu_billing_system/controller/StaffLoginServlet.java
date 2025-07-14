package com.example.pahana_edu_billing_system.controller;

import com.example.pahana_edu_billing_system.dao.StaffDAO;
import com.example.pahana_edu_billing_system.model.Staff;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import java.io.IOException;

public class StaffLoginServlet extends HttpServlet {
    private StaffDAO staffDAO = new StaffDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        Staff staff = staffDAO.validateStaff(username, password);
        if (staff != null) {
            response.sendRedirect("staff_dashboard.html");
        } else {
            request.setAttribute("error", "Invalid staff username or password!");
            request.getRequestDispatcher("staff_login.jsp").forward(request, response);
        }
    }
}
