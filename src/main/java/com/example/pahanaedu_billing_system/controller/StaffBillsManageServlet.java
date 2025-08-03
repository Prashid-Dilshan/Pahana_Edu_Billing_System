package com.example.pahanaedu_billing_system.controller;

import com.example.pahanaedu_billing_system.dao.BillDAO;
import com.example.pahanaedu_billing_system.dao.BookDAO;
import com.example.pahanaedu_billing_system.model.*;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/StaffBillsManageServlet")
public class StaffBillsManageServlet extends HttpServlet {
    private final BillDAO billDAO = new BillDAO();
    private final BookDAO bookDAO = new BookDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String billIdParam = request.getParameter("billId");

        // Always load all bills for sidebar/list
        List<Bill> bills = billDAO.getAllBills();
        request.setAttribute("bills", bills);

        if (billIdParam != null && !billIdParam.isEmpty()) {
            try {
                int billId = Integer.parseInt(billIdParam);
                Bill bill = billDAO.getBillById(billId);

                if (bill != null) {
                    // Set Book object inside each BillItem
                    for (BillItem item : bill.getItems()) {
                        item.setBook(bookDAO.getBookById(item.getBookId()));
                    }
                    request.setAttribute("bill", bill);
                } else {
                    request.setAttribute("error", "Bill not found.");
                }
            } catch (NumberFormatException e) {
                request.setAttribute("error", "Invalid Bill ID format.");
            }
        }

        // Forward to the one JSP page for staff bills display
        request.getRequestDispatcher("/staff_display_bills.jsp").forward(request, response);
    }
}
