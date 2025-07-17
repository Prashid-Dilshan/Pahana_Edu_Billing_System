package com.example.pahanaedu_billing_system.controller;

import com.example.pahanaedu_billing_system.dao.BookDAO;
import com.example.pahanaedu_billing_system.model.Book;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.io.InputStream;

@WebServlet("/Admin_AddBookServlet") // ✅ This line registers the servlet URL
@MultipartConfig // This enables file upload
public class Admin_AddBookServlet extends HttpServlet {
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
        }

        Book book = new Book(bookid, title, author, price, stockbookcount, bookphotoBytes);
        String result = bookDAO.addBook(book);

        if ("success".equals(result)) {
            request.setAttribute("message", "✅ Book added successfully!");
        } else {
            request.setAttribute("error", "❌ Failed to add book: " + result);
        }

        request.getRequestDispatcher("admin_add_book.jsp").forward(request, response);
    }
}
