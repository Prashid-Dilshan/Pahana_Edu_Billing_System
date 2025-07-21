package com.example.pahanaedu_billing_system.controller;

import com.example.pahanaedu_billing_system.model.CartItem;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.*;

@WebServlet("/RemoveFromCartServlet")
public class RemoveFromCartServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");

        String bookIdParam = request.getParameter("bookId");
        String removeAllParam = request.getParameter("removeAll"); // optional flag

        if (bookIdParam != null && cart != null) {
            Iterator<CartItem> iterator = cart.iterator();
            while (iterator.hasNext()) {
                CartItem item = iterator.next();
                if (item.getBookId().equals(bookIdParam)) {
                    if ("true".equalsIgnoreCase(removeAllParam)) {
                        iterator.remove(); // 🗑 Remove whole item
                    } else {
                        if (item.getQuantity() > 1) {
                            item.setQuantity(item.getQuantity() - 1); // ➖ Reduce by 1
                        } else {
                            iterator.remove(); // Remove if quantity is 1
                        }
                    }
                    break;
                }
            }
        }

        response.sendRedirect("staff_cart.jsp");
    }
}
