package com.example.pahanaedu_billing_system.controller;

import com.example.pahanaedu_billing_system.dto.AdminManageStaffDTO;
import com.example.pahanaedu_billing_system.service.AdminManageStaffService;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;
import java.io.IOException;
import java.util.List;

@WebServlet("/AdminManageStaffServlet")
public class AdminManageStaffServlet extends HttpServlet {
    private final AdminManageStaffService staffService = new AdminManageStaffService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if (action == null || action.equalsIgnoreCase("view")) {
            List<AdminManageStaffDTO> staffList = staffService.getAllStaff();
            request.setAttribute("staffList", staffList);
            request.getRequestDispatcher("Admin_view_staff.jsp").forward(request, response);

        } else if ("fetchEdit".equalsIgnoreCase(action)) {
            String staffid = request.getParameter("staffid");
            AdminManageStaffDTO staffDTO = staffService.getStaffById(staffid);
            request.setAttribute("staff", staffDTO);
            request.getRequestDispatcher("Admin_edit_staff.jsp").forward(request, response);
            return;

        } else if (action.equalsIgnoreCase("delete")) {
            String staffid = request.getParameter("staffid");
            if (staffid != null && !staffid.isEmpty() && staffService.deleteStaff(staffid)) {
                request.setAttribute("message", "✅ Staff member deleted successfully!");
            } else {
                request.setAttribute("error", "❌ Invalid staff ID for deletion.");
            }
            List<AdminManageStaffDTO> staffList = staffService.getAllStaff();
            request.setAttribute("staffList", staffList);
            request.getRequestDispatcher("Admin_view_staff.jsp").forward(request, response);
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

        AdminManageStaffDTO staffDTO = new AdminManageStaffDTO(staffid, name, address, mobilenumber, username, password);

        if (action == null || action.equalsIgnoreCase("add")) {
            // Check if staff ID already exists
            AdminManageStaffDTO existingStaff = staffService.getStaffById(staffid);
            if (existingStaff != null) {
                request.setAttribute("error", "❌ Cannot add staff: Staff ID already exists.");
                request.getRequestDispatcher("Admin_add_staff.jsp").forward(request, response);
                return;
            }

            boolean success = staffService.addStaff(staffDTO);
            if (success) {
                request.setAttribute("message", "✅ Staff member added successfully!");
            } else {
                request.setAttribute("error", "❌ Failed to add staff.");
            }
            request.getRequestDispatcher("Admin_add_staff.jsp").forward(request, response);

        } else if (action.equalsIgnoreCase("edit")) {
            boolean updated = staffService.updateStaff(staffDTO);
            if (updated) {
                request.setAttribute("message", "✅ Staff member updated successfully!");
            } else {
                request.setAttribute("error", "❌ Failed to update staff.");
            }
            List<AdminManageStaffDTO> staffList = staffService.getAllStaff();
            request.setAttribute("staffList", staffList);
            request.getRequestDispatcher("Admin_view_staff.jsp").forward(request, response);
        }
    }
}
