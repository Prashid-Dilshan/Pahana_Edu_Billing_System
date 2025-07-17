package com.example.pahanaedu_billing_system.controller;

import com.example.pahana_edu_billing_system.dao.StaffDAO;
import com.example.pahana_edu_billing_system.model.Staff;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import java.io.IOException;

public class AddStaffServlet extends HttpServlet {
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
        String result = staffDAO.addStaff(staff);

        if ("success".equals(result)) {
            request.setAttribute("message", "✅ Staff member added successfully!");
        } else {
            request.setAttribute("error", "❌ Failed to add staff: " + result);
        }

        request.getRequestDispatcher("add_staff.jsp").forward(request, response);
    }
}
