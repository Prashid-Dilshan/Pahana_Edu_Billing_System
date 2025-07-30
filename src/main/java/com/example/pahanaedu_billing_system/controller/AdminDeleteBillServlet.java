package com.example.pahanaedu_billing_system.controller;

import com.example.pahanaedu_billing_system.dao.BillDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/AdminDeleteBillServlet")
public class AdminDeleteBillServlet extends HttpServlet {
    private final BillDAO billDAO = new BillDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String billIdParam = request.getParameter("billId");

        if (billIdParam != null && !billIdParam.isEmpty()) {
            try {
                int billId = Integer.parseInt(billIdParam);
                boolean deleted = billDAO.deleteBillById(billId);

                if (deleted) {
                    request.getSession().setAttribute("message", "Bill deleted successfully.");
                } else {
                    request.getSession().setAttribute("message", "Failed to delete bill.");
                }

            } catch (NumberFormatException e) {
                request.getSession().setAttribute("message", "Invalid bill ID.");
            }
        } else {
            request.getSession().setAttribute("message", "Bill ID is required.");
        }

        // Redirect back to the bills list page
        response.sendRedirect(request.getContextPath() + "/AdminViewBillsServlet");
    }
}
