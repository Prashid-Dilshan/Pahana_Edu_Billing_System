package com.example.pahanaedu_billing_system.controller;

import com.example.pahanaedu_billing_system.model.*;
import com.example.pahanaedu_billing_system.dao.BillDAO;
import com.example.pahanaedu_billing_system.dao.BookDAO;
import com.example.pahanaedu_billing_system.dao.CustomerDAO;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.*;
import java.time.LocalDateTime;
import java.util.*;

@WebServlet("/ConfirmGenerateBillServlet")
public class ConfirmGenerateBillServlet extends HttpServlet {
    private final BillDAO billDAO = new BillDAO();
    private final BookDAO bookDAO = new BookDAO();
    private final CustomerDAO customerDAO = new CustomerDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
        Integer customerId = (Integer) session.getAttribute("selectedCustomerId");

        if (cart == null || cart.isEmpty() || customerId == null) {
            response.sendRedirect("staff_cart.jsp");
            return;
        }

        try {
            Bill bill = new Bill();
            bill.setCustomerId(customerId);
            bill.setDateTime(LocalDateTime.now());

            // ✅ Load customer details
            Customer customer = customerDAO.getCustomerById(customerId);
            bill.setCustomer(customer);

            double total = 0;
            List<BillItem> items = new ArrayList<>();

            for (CartItem item : cart) {
                BillItem bItem = new BillItem();
                bItem.setBookId(item.getBookId());
                bItem.setPrice(item.getPrice());
                bItem.setQuantity(item.getQuantity());

                Book book = bookDAO.getBookById(item.getBookId());
                bItem.setBook(book);

                total += item.getTotalPrice();
                items.add(bItem);
            }

            bill.setTotal(total);
            bill.setItems(items);

            boolean success = billDAO.saveBill(bill);
            if (success) {
                // ✅ Clear session
                session.removeAttribute("cart");
                session.removeAttribute("selectedCustomerId");
                session.removeAttribute("selectedCustomer");

                // ✅ Store bill in session
                session.setAttribute("generatedBill", bill);



                // ✅ No email sending anymore – directly redirect to success
                response.sendRedirect("bill_success.jsp");
            } else {
                response.getWriter().println("❌ Bill generation failed.");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("❌ Unexpected error occurred: " + e.getMessage());
        }
    }
}
