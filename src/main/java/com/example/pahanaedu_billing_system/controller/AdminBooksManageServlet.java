package com.example.pahanaedu_billing_system.controller;

import com.example.pahanaedu_billing_system.dto.BookDTO;
import com.example.pahanaedu_billing_system.service.BookService;

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
    private final BookService bookService = new BookService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("delete".equalsIgnoreCase(action)) {
            deleteBook(request, response);
        } else if ("fetchEdit".equalsIgnoreCase(action)) {
            fetchForEdit(request, response);
        } else {
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
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid action");
        }
    }

    private void addBook(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        BookDTO bookDTO = getBookDTOFromRequest(request);

        // Check if book ID already exists
        BookDTO existingBook = bookService.getBookById(bookDTO.getBookid());
        if (existingBook != null) {
            request.setAttribute("error", "❌ Cannot add book: Book ID already exists.");
            request.getRequestDispatcher("admin_add_book.jsp").forward(request, response);
            return;
        }

        boolean success = bookService.addBook(bookDTO);

        if (success) {
            request.setAttribute("message", "✅ Book added successfully!");
        } else {
            request.setAttribute("error", "❌ Failed to add book. Duplicate ID or DB Error.");
        }
        request.getRequestDispatcher("admin_add_book.jsp").forward(request, response);
    }

    private void deleteBook(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String bookid = request.getParameter("bookid");
        boolean deleted = (bookid != null && !bookid.isEmpty()) && bookService.deleteBook(bookid);

        if (deleted) {
            request.setAttribute("message", "✅ Book deleted successfully!");
        } else {
            request.setAttribute("error", "❌ Failed to delete book. Invalid Book ID or DB error.");
        }
        List<BookDTO> updatedBookList = bookService.getAllBooks();
        request.setAttribute("bookList", updatedBookList);
        request.getRequestDispatcher("admin_view_books.jsp").forward(request, response);
    }

    private void editBook(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        BookDTO bookDTO = getBookDTOFromRequest(request);

        // Handle photo update
        if (bookDTO.getBookphoto() == null || bookDTO.getBookphoto().length == 0) {
            BookDTO oldBook = bookService.getBookById(bookDTO.getBookid());
            if (oldBook != null) {
                bookDTO.setBookphoto(oldBook.getBookphoto());
            }
        }

        boolean result = bookService.updateBook(bookDTO);

        if (result) {
            response.sendRedirect("AdminBooksManageServlet?action=view&msg=updated");
        } else {
            request.setAttribute("error", "❌ Failed to update book. Please check your input.");
            request.setAttribute("book", bookDTO);
            request.getRequestDispatcher("admin_edit_book.jsp").forward(request, response);
        }
    }

    private void fetchForEdit(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String bookid = request.getParameter("bookid");
        BookDTO bookDTO = bookService.getBookById(bookid);
        if (bookDTO != null) {
            request.setAttribute("book", bookDTO);
            request.getRequestDispatcher("admin_edit_book.jsp").forward(request, response);
        } else {
            request.setAttribute("error", "❌ Book not found for editing.");
            request.getRequestDispatcher("admin_view_books.jsp").forward(request, response);
        }
    }

    private void viewBooks(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<BookDTO> books = bookService.getAllBooks();
        request.setAttribute("bookList", books);

        // New: Check for msg parameter from update redirect and set success message
        String msg = request.getParameter("msg");
        if ("updated".equalsIgnoreCase(msg)) {
            request.setAttribute("message", "✅ Book updated successfully!");
        }

        request.getRequestDispatcher("admin_view_books.jsp").forward(request, response);
    }

    /** Helper: extract BookDTO from request */
    private BookDTO getBookDTOFromRequest(HttpServletRequest request) throws IOException, ServletException {
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

        BookDTO bookDTO = new BookDTO();
        bookDTO.setBookid(bookid);
        bookDTO.setTitle(title);
        bookDTO.setAuthor(author);
        bookDTO.setPrice(price);
        bookDTO.setStockbookcount(stockbookcount);
        bookDTO.setBookphoto(bookphotoBytes);

        return bookDTO;
    }
}
