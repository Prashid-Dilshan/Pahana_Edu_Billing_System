package com.example.pahanaedu_billing_system.controller;

import com.example.pahanaedu_billing_system.dao.BillDAO;
import com.example.pahanaedu_billing_system.model.Bill;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/viewAllBills")
public class ViewAllBillsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private BillDAO billDAO = new BillDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Bill> allBills = billDAO.getAllBills();

        request.setAttribute("bills", allBills);
        request.getRequestDispatcher("staff_view_all_bills.jsp").forward(request, response);
    }
}
