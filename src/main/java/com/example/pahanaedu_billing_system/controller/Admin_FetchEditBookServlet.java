package com.example.pahanaedu_billing_system.controller;

import com.example.pahanaedu_billing_system.dao.BookDAO;
import com.example.pahanaedu_billing_system.model.Book;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/Admin_FetchEditBookServlet")
public class Admin_FetchEditBookServlet extends HttpServlet {
    private final BookDAO bookDAO = new BookDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String bookid = request.getParameter("bookid");
        Book book = bookDAO.getBookById(bookid);

        if (book != null) {
            request.setAttribute("book", book);
            request.getRequestDispatcher("admin_edit_book.jsp").forward(request, response);
        } else {
            request.setAttribute("error", "❌ Book not found for editing.");
            request.getRequestDispatcher("admin_view_books.jsp").forward(request, response);
        }
    }
}
