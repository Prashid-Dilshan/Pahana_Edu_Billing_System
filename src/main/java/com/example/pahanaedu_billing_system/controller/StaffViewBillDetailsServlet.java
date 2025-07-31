package com.example.pahanaedu_billing_system.controller;

import com.example.pahanaedu_billing_system.dao.BillDAO;
import com.example.pahanaedu_billing_system.dao.BookDAO;
import com.example.pahanaedu_billing_system.model.*;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/StaffViewBillDetailsServlet")
public class StaffViewBillDetailsServlet extends HttpServlet {
    private final BillDAO billDAO = new BillDAO();
    private final BookDAO bookDAO = new BookDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Bill> bills = billDAO.getAllBills();  // For sidebar list
        request.setAttribute("bills", bills);

        String billIdParam = request.getParameter("billId");

        if (billIdParam != null && !billIdParam.isEmpty()) {
            try {
                int billId = Integer.parseInt(billIdParam);
                Bill bill = billDAO.getBillById(billId);

                if (bill != null) {
                    // Set book details in BillItem
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

        request.getRequestDispatcher("/staff_display_bills.jsp").forward(request, response);
    }
}
