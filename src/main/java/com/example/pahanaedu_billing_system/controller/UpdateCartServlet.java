package com.example.pahanaedu_billing_system.controller;

import com.example.pahanaedu_billing_system.model.CartItem;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.*;

@WebServlet("/UpdateCartServlet")
public class UpdateCartServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");

        String bookId = request.getParameter("bookId");
        String qtyStr = request.getParameter("quantity");

        if (cart != null && bookId != null && qtyStr != null) {
            try {
                int newQty = Integer.parseInt(qtyStr);
                for (CartItem item : cart) {
                    if (item.getBookId().equals(bookId)) {
                        item.setQuantity(newQty);
                        break;
                    }
                }
            } catch (NumberFormatException ignored) {}
        }

        response.sendRedirect("staff_cart.jsp");
    }
}
