package com.example.pahanaedu_billing_system.controller;

import com.example.pahanaedu_billing_system.model.Book;
import com.example.pahanaedu_billing_system.model.CartItem;
import com.example.pahanaedu_billing_system.dao.BookDAO;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.*;

@WebServlet("/addToCart")
public class AddToCartServlet extends HttpServlet {
    private BookDAO bookDAO = new BookDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        String bookIdParam = request.getParameter("bookId");  // This is a String (like "B001")

        if (bookIdParam != null) {
            String qtyParam = request.getParameter("quantity_" + bookIdParam);
            int quantity = qtyParam != null ? Integer.parseInt(qtyParam) : 1;

            Book book = bookDAO.getBookById(bookIdParam); // Now this works: accepts String
            if (book != null) {
                List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
                if (cart == null) {
                    cart = new ArrayList<>();
                }

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
                            bookIdParam,
                            book.getTitle(),
                            book.getPrice(),
                            quantity
                    );
                    cart.add(newItem);
                }

                session.setAttribute("cart", cart);
            }
        }

        response.sendRedirect("staff_select_books.jsp");  // reload book list
    }
}
