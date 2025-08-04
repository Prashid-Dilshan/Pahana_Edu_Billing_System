package com.example.pahanaedu_billing_system.controller;

import com.example.pahanaedu_billing_system.dto.StaffBillsManageDTO;
import com.example.pahanaedu_billing_system.service.StaffBillsManageService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/StaffBillsManageServlet")
public class StaffBillsManageServlet extends HttpServlet {
    private final StaffBillsManageService service = new StaffBillsManageService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String billIdParam = request.getParameter("billId");

        // 1. Load all bills for the sidebar/list as DTO
        List<StaffBillsManageDTO> bills = service.getAllBills();
        request.setAttribute("bills", bills);

        // 2. Show selected bill details if needed
        if (billIdParam != null && !billIdParam.isEmpty()) {
            try {
                int billId = Integer.parseInt(billIdParam);
                StaffBillsManageDTO bill = service.getBillById(billId);
                if (bill != null) {
                    request.setAttribute("bill", bill);
                } else {
                    request.setAttribute("error", "Bill not found.");
                }
            } catch (NumberFormatException e) {
                request.setAttribute("error", "Invalid Bill ID format.");
            }
        }

        // 3. Forward as before
        request.getRequestDispatcher("/staff_display_bills.jsp").forward(request, response);
    }
}
