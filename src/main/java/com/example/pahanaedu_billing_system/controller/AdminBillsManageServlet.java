package com.example.pahanaedu_billing_system.controller;

import com.example.pahanaedu_billing_system.dao.BillDAO;
import com.example.pahanaedu_billing_system.model.Bill;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/AdminBillsManageServlet")
public class AdminBillsManageServlet extends HttpServlet {
    private final BillDAO billDAO = new BillDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if ("details".equalsIgnoreCase(action)) {
            viewBillDetails(request, response);
        } else {
            // Default: view all bills
            viewAllBills(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if ("delete".equalsIgnoreCase(action)) {
            deleteBill(request, response);
        } else {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid action.");
        }
    }

    // ========== ACTION METHODS =============

    // View All Bills
    private void viewAllBills(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Bill> bills = billDAO.getAllBills();
        request.setAttribute("bills", bills);

        // Pass flash message if present, then remove it from session
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("message") != null) {
            request.setAttribute("message", session.getAttribute("message"));
            session.removeAttribute("message");
        }

        request.getRequestDispatcher("/admin_view_bills.jsp").forward(request, response);
    }

    // View Details of a Single Bill (and show all bills in table as well)
    private void viewBillDetails(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Bill> bills = billDAO.getAllBills();                       // all bills for listing
        request.setAttribute("bills", bills);

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
        request.getRequestDispatcher("/admin_view_bills.jsp").forward(request, response);
    }

    // Delete a Bill
    private void deleteBill(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String billIdParam = request.getParameter("billId");
        HttpSession session = request.getSession();

        if (billIdParam != null && !billIdParam.isEmpty()) {
            try {
                int billId = Integer.parseInt(billIdParam);
                boolean deleted = billDAO.deleteBillById(billId);

                if (deleted) {
                    session.setAttribute("message", "Bill deleted successfully.");
                } else {
                    session.setAttribute("message", "Failed to delete bill.");
                }

            } catch (NumberFormatException e) {
                session.setAttribute("message", "Invalid bill ID.");
            }
        } else {
            session.setAttribute("message", "Bill ID is required.");
        }

        // 🔄 Redirect to main bills table after deletion
        response.sendRedirect(request.getContextPath() + "/AdminBillsManageServlet");
    }
}
