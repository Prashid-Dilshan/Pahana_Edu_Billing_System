package com.example.pahanaedu_billing_system.controller;

import com.example.pahanaedu_billing_system.dao.StaffDAO;
import com.example.pahana_edu_billing_system.model.Staff;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

public class StaffServlet extends HttpServlet {
    private final StaffDAO staffDAO = new StaffDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if (action == null || action.equals("view")) {
            List<Staff> staffList = staffDAO.getAllStaff();
            request.setAttribute("staffList", staffList);
            request.getRequestDispatcher("view_staff.jsp").forward(request, response);

        } else if (action.equals("delete")) {
            String staffid = request.getParameter("staffid");
            if (staffid != null && !staffid.isEmpty()) {
                staffDAO.deleteStaffById(staffid);
                request.setAttribute("message", "✅ Staff member deleted successfully!");
            } else {
                request.setAttribute("error", "❌ Invalid staff ID for deletion.");
            }

            List<Staff> staffList = staffDAO.getAllStaff();
            request.setAttribute("staffList", staffList);
            request.getRequestDispatcher("view_staff.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        String staffid = request.getParameter("staffid");
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        String mobilenumber = request.getParameter("mobilenumber");
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        Staff staff = new Staff(staffid, name, address, mobilenumber, username, password);

        if (action == null || action.equals("add")) {
            String result = staffDAO.addStaff(staff);
            if ("success".equals(result)) {
                request.setAttribute("message", "✅ Staff member added successfully!");
            } else {
                request.setAttribute("error", "❌ Failed to add staff: " );
            }
            request.getRequestDispatcher("add_staff.jsp").forward(request, response);

        } else if (action.equals("edit")) {
            boolean updated = staffDAO.updateStaff(staff);
            if (updated) {
                request.setAttribute("message", "✅ Staff member updated successfully!");
            } else {
                request.setAttribute("error", "❌ Failed to update staff.");
            }

            List<Staff> staffList = staffDAO.getAllStaff();
            request.setAttribute("staffList", staffList);
            request.getRequestDispatcher("view_staff.jsp").forward(request, response);
        }
    }
}
