package com.example.pahanaedu_billing_system.controller;

import com.example.pahana_edu_billing_system.dao.StaffDAO;
import com.example.pahana_edu_billing_system.model.Staff;
import jakarta.servlet.*;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

public class Admin_ViewStaffServlet extends HttpServlet {
    private final StaffDAO staffDAO = new StaffDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Staff> staffList = staffDAO.getAllStaff();

        System.out.println("🟡 Staff list size: " + (staffList == null ? "NULL" : staffList.size()));

        if (staffList == null || staffList.isEmpty()) {
            request.setAttribute("error", "No data in the database or the search failed again.");

        } else {
            request.setAttribute("staffList", staffList);
        }

        request.getRequestDispatcher("view_staff.jsp").forward(request, response);
    }



}
