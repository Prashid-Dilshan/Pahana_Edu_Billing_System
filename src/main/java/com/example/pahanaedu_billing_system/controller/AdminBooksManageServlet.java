package com.example.pahanaedu_billing_system.controller;

import com.example.pahanaedu_billing_system.dao.BookDAO;
import com.example.pahanaedu_billing_system.model.Book;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

@WebServlet("/AdminBooksManageServlet")
@MultipartConfig
public class AdminBooksManageServlet extends HttpServlet {
    private final BookDAO bookDAO = new BookDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("delete".equalsIgnoreCase(action)) {
            deleteBook(request, response);
        } else if ("fetchEdit".equalsIgnoreCase(action)) {
            fetchForEdit(request, response);
        } else {
            // Default: view all books
            viewBooks(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("add".equalsIgnoreCase(action)) {
            addBook(request, response);
        } else if ("edit".equalsIgnoreCase(action)) {
            editBook(request, response);
        } else {
            // Optionally handle invalid actions
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid action");
        }
    }

    // --- ACTION METHODS ---
    private void addBook(HttpServletRequest request, HttpServletResponse response)
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

    private void deleteBook(HttpServletRequest request, HttpServletResponse response)
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
        List<Book> updatedBookList = bookDAO.getAllBooks();
        request.setAttribute("bookList", updatedBookList);
        request.getRequestDispatcher("admin_view_books.jsp").forward(request, response);
    }

    private void editBook(HttpServletRequest request, HttpServletResponse response)
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
            response.sendRedirect("AdminBooksManageServlet?action=view&msg=updated");
        } else {
            request.setAttribute("error", "❌ Failed to update book. Please check your input.");
            request.setAttribute("book", book);
            request.getRequestDispatcher("admin_edit_book.jsp").forward(request, response);
        }
    }

    private void fetchForEdit(HttpServletRequest request, HttpServletResponse response)
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

    private void viewBooks(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Book> books = bookDAO.getAllBooks();
        request.setAttribute("bookList", books);
        request.getRequestDispatcher("admin_view_books.jsp").forward(request, response);
    }
}
