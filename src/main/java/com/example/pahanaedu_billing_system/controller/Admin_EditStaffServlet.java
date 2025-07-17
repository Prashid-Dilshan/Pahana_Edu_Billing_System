package com.example.pahanaedu_billing_system.controller;


import com.example.pahanaedu_billing_system.dao.StaffDAO;
import com.example.pahana_edu_billing_system.model.Staff;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;

public class Admin_EditStaffServlet extends HttpServlet {
    private final StaffDAO staffDAO = new StaffDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String staffid = request.getParameter("staffid");
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        String mobilenumber = request.getParameter("mobilenumber");
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        Staff staff = new Staff(staffid, name, address, mobilenumber, username, password);
        staffDAO.updateStaff(staff);

        // Redirect to view page after update
        response.sendRedirect("Admin_ViewStaffServlet");
    }
}
