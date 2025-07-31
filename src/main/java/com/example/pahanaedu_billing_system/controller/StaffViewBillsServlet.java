package com.example.pahanaedu_billing_system.controller;

import com.example.pahanaedu_billing_system.dao.BillDAO;
import com.example.pahanaedu_billing_system.model.Bill;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/StaffViewBillsServlet")
public class StaffViewBillsServlet extends HttpServlet {
    private final BillDAO billDAO = new BillDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Bill> bills = billDAO.getAllBills();
        request.setAttribute("bills", bills);
        request.getRequestDispatcher("/staff_display_bills.jsp").forward(request, response);
    }
}
