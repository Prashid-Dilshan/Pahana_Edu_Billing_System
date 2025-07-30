package com.example.pahanaedu_billing_system.controller;

import com.example.pahanaedu_billing_system.dao.BillDAO;
import com.example.pahanaedu_billing_system.model.Bill;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/AdminViewBillsServlet")
public class AdminViewBillsServlet extends HttpServlet {
    private final BillDAO billDAO = new BillDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Bill> bills = billDAO.getAllBills();
        System.out.println("Bills found in servlet: " + (bills == null ? "null" : bills.size()));
        request.setAttribute("bills", bills);
        request.getRequestDispatcher("/admin_view_bills.jsp").forward(request, response);

    }
}
