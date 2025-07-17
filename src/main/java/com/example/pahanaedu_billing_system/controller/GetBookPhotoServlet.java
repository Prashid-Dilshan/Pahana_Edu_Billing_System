package com.example.pahanaedu_billing_system.controller;

import com.example.pahanaedu_billing_system.dao.BookDAO;
import com.example.pahanaedu_billing_system.model.Book;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.io.OutputStream;

@WebServlet("/GetBookPhotoServlet")
public class GetBookPhotoServlet extends HttpServlet {
    private final BookDAO bookDAO = new BookDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String bookid = request.getParameter("bookid");

        if (bookid == null || bookid.isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Book ID is required.");
            return;
        }

        Book book = bookDAO.getBookById(bookid);

        if (book == null || book.getBookphoto() == null) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Image not found for book.");
            return;
        }

        // Set content type (adjust if you're storing PNGs)
        response.setContentType("image/jpeg");
        OutputStream out = response.getOutputStream();
        out.write(book.getBookphoto());
        out.flush();
        out.close();
    }
}
