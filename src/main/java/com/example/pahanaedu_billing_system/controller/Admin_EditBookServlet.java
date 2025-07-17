package com.example.pahanaedu_billing_system.controller;

import com.example.pahanaedu_billing_system.dao.BookDAO;
import com.example.pahanaedu_billing_system.model.Book;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.io.InputStream;

@WebServlet("/Admin_EditBookServlet")  // Make sure this is registered
@MultipartConfig
public class Admin_EditBookServlet extends HttpServlet {
    private final BookDAO bookDAO = new BookDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String bookid = request.getParameter("bookid");
        String title = request.getParameter("title");
        String author = request.getParameter("author");
        double price = Double.parseDouble(request.getParameter("price"));
        int stockbookcount = Integer.parseInt(request.getParameter("stockbookcount"));

        Part filePart = request.getPart("bookphoto");
        byte[] bookphotoBytes = null;

        if (filePart != null && filePart.getSize() > 0) {
            try (InputStream inputStream = filePart.getInputStream()) {
                bookphotoBytes = inputStream.readAllBytes();
            }
        } else {
            Book oldBook = bookDAO.getBookById(bookid);
            if (oldBook != null) {
                bookphotoBytes = oldBook.getBookphoto();
            }
        }

        Book book = new Book(bookid, title, author, price, stockbookcount, bookphotoBytes);
        boolean result = bookDAO.updateBook(book);

        if (result) {
            // ✅ Redirect to view books page with success message
            response.sendRedirect("Admin_ViewBooksServlet?msg=updated");
        } else {
            // ❌ If error, stay on same page and show error
            request.setAttribute("error", "❌ Failed to update book. Please check your input.");
            request.setAttribute("book", book); // Keep data on reload
            request.getRequestDispatcher("admin_edit_book.jsp").forward(request, response);
        }
    }
}
