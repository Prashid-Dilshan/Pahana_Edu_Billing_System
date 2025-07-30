package com.example.pahanaedu_billing_system.controller;

import com.example.pahanaedu_billing_system.dao.BillDAO;
import com.example.pahanaedu_billing_system.model.Bill;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/AdminViewBillDetailsServlet")
public class AdminViewBillDetailsServlet extends HttpServlet {
    private final BillDAO billDAO = new BillDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Always load all bills for the table
        List<Bill> bills = billDAO.getAllBills();
        request.setAttribute("bills", bills);

        // If a specific billId is passed, load full bill details
        String billIdParam = request.getParameter("billId");

        if (billIdParam != null && !billIdParam.isEmpty()) {
            try {
                int billId = Integer.parseInt(billIdParam);
                Bill bill = billDAO.getBillById(billId);
                if (bill != null) {
                    request.setAttribute("bill", bill);
                } else {
                    request.setAttribute("error", "Bill not found.");
                }
            } catch (NumberFormatException e) {
                request.setAttribute("error", "Invalid bill ID format.");
            }
        }

        request.getRequestDispatcher("admin_view_bills.jsp").forward(request, response);
    }
}
