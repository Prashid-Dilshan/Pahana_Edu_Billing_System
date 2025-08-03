package com.example.pahanaedu_billing_system.controller;

import com.example.pahanaedu_billing_system.dto.BillDTO;
import com.example.pahanaedu_billing_system.service.BillService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/AdminBillsManageServlet")
public class AdminBillsManageServlet extends HttpServlet {
    private final BillService billService = new BillService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("details".equalsIgnoreCase(action)) {
            viewBillDetails(request, response);
        } else {
            viewAllBills(request, response);
        }
    }

    private void viewAllBills(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<BillDTO> bills = billService.getAllBills();
        request.setAttribute("bills", bills);
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("message") != null) {
            request.setAttribute("message", session.getAttribute("message"));
            session.removeAttribute("message");
        }
        request.getRequestDispatcher("/admin_view_bills.jsp").forward(request, response);
    }

    private void viewBillDetails(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<BillDTO> bills = billService.getAllBills();
        request.setAttribute("bills", bills);
        String billIdParam = request.getParameter("billId");
        if (billIdParam != null && !billIdParam.isEmpty()) {
            try {
                int billId = Integer.parseInt(billIdParam);
                BillDTO bill = billService.getBillById(billId);
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

    private void deleteBill(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String billIdParam = request.getParameter("billId");
        HttpSession session = request.getSession();
        if (billIdParam != null && !billIdParam.isEmpty()) {
            try {
                int billId = Integer.parseInt(billIdParam);
                boolean deleted = billService.deleteBillById(billId);
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
        response.sendRedirect(request.getContextPath() + "/AdminBillsManageServlet");
    }
}
