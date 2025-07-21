package com.example.pahanaedu_billing_system.controller;

import com.example.pahanaedu_billing_system.model.*;
import com.example.pahanaedu_billing_system.dao.BillDAO;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.time.LocalDateTime;
import java.util.*;

public class GenerateBillServlet extends HttpServlet {
    private BillDAO billDAO = new BillDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
        String customerId = request.getParameter("customerId");

        if (cart == null || cart.isEmpty() || customerId == null) {
            response.sendRedirect("staff_cart.jsp");
            return;
        }

        Bill bill = new Bill();
        bill.setCustomerId(customerId);
        bill.setDateTime(LocalDateTime.now());

        double total = 0;
        List<BillItem> items = new ArrayList<>();

        for (CartItem item : cart) {
            BillItem bItem = new BillItem();
            bItem.setBookId(item.getBookId());
            bItem.setPrice(item.getPrice());
            bItem.setQuantity(item.getQuantity());
            total += item.getTotalPrice();
            items.add(bItem);
        }

        bill.setTotal(total);
        bill.setItems(items);

        boolean success = billDAO.saveBill(bill);
        if (success) {
            session.removeAttribute("cart");
            response.sendRedirect("bill_success.jsp");
        } else {
            response.getWriter().println("❌ Failed to generate bill.");
        }
    }
}
