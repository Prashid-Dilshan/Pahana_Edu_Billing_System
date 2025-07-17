package com.example.pahanaedu_billing_system.controller;

import com.example.pahana_edu_billing_system.dao.StaffDAO;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;

public class Admin_DeleteStaffServlet extends HttpServlet {
    private final StaffDAO staffDAO = new StaffDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String staffid = request.getParameter("staffid");

        if (staffid != null && !staffid.isEmpty()) {
            staffDAO.deleteStaffById(staffid);
        }

        response.sendRedirect("Admin_ViewStaffServlet"); // refresh staff list
    }
}
