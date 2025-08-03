package com.example.pahanaedu_billing_system.controller;

import com.example.pahanaedu_billing_system.dao.BookDAO;
import com.example.pahanaedu_billing_system.model.Book;
import com.example.pahanaedu_billing_system.model.CartItem;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.*;

@WebServlet("/StaffCartManageServlet")
public class StaffCartManageServlet extends HttpServlet {

    private final BookDAO bookDAO = new BookDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action"); // add, update

        if ("add".equalsIgnoreCase(action)) {
            addToCart(request, response);
        } else if ("update".equalsIgnoreCase(action)) {
            updateCart(request, response);
        } else {
            response.sendRedirect("staff_cart.jsp");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action"); // remove

        if ("remove".equalsIgnoreCase(action)) {
            removeFromCart(request, response);
        } else {
            response.sendRedirect("staff_cart.jsp");
        }
    }

    // ----------------------------
    // --- HANDLER METHODS BELOW --
    // ----------------------------

    private void addToCart(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        HttpSession session = request.getSession();
        String bookIdParam = request.getParameter("bookId");

        if (bookIdParam != null) {
            String qtyParam = request.getParameter("quantity_" + bookIdParam);
            int quantity = qtyParam != null ? Integer.parseInt(qtyParam) : 1;

            Book book = bookDAO.getBookById(bookIdParam);
            if (book != null) {
                List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
                if (cart == null) cart = new ArrayList<>();

                boolean found = false;
                for (CartItem item : cart) {
                    if (item.getBookId().equals(bookIdParam)) {
                        item.setQuantity(item.getQuantity() + quantity);
                        found = true;
                        break;
                    }
                }
                if (!found) {
                    CartItem newItem = new CartItem(
                            bookIdParam, book.getTitle(), book.getPrice(), quantity
                    );
                    cart.add(newItem);
                }
                session.setAttribute("cart", cart);
            }
        }
        response.sendRedirect("staff_select_books.jsp");
    }

    private void updateCart(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
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

    private void removeFromCart(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        HttpSession session = request.getSession();
        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");

        String bookIdParam = request.getParameter("bookId");
        String removeAllParam = request.getParameter("removeAll"); // optional

        if (bookIdParam != null && cart != null) {
            Iterator<CartItem> iterator = cart.iterator();
            while (iterator.hasNext()) {
                CartItem item = iterator.next();
                if (item.getBookId().equals(bookIdParam)) {
                    if ("true".equalsIgnoreCase(removeAllParam)) {
                        iterator.remove(); // Remove whole item
                    } else {
                        if (item.getQuantity() > 1) {
                            item.setQuantity(item.getQuantity() - 1); // Just -1
                        } else {
                            iterator.remove(); // Remove if only one left
                        }
                    }
                    break;
                }
            }
        }
        response.sendRedirect("staff_cart.jsp");
    }
}
