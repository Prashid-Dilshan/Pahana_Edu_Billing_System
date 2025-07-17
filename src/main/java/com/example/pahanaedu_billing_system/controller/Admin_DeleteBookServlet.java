package com.example.pahanaedu_billing_system.controller;

import com.example.pahanaedu_billing_system.dao.BookDAO;
import com.example.pahanaedu_billing_system.model.Book;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/Admin_DeleteBookServlet")
public class Admin_DeleteBookServlet extends HttpServlet {
    private final BookDAO bookDAO = new BookDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String bookid = request.getParameter("bookid");
        boolean deleted = false;

        if (bookid != null && !bookid.isEmpty()) {
            deleted = bookDAO.deleteBook(bookid);
        }

        if (deleted) {
            request.setAttribute("message", "✅ Book deleted successfully!");
        } else {
            request.setAttribute("error", "❌ Failed to delete book. Invalid Book ID or DB error.");
        }

        // ✅ Fix: Reload the book list from DB and attach to request
        List<Book> updatedBookList = bookDAO.getAllBooks();
        request.setAttribute("bookList", updatedBookList);

        // ✅ Forward with updated list
        request.getRequestDispatcher("admin_view_books.jsp").forward(request, response);
    }
}
