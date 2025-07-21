package com.example.pahanaedu_billing_system.controller;

import com.example.pahanaedu_billing_system.dao.BookDAO;
import com.example.pahanaedu_billing_system.model.Book;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/selectBooks")
public class SelectBooksServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String searchQuery = request.getParameter("searchQuery");
        BookDAO bookDAO = new BookDAO();
        List<Book> bookList;

        if (searchQuery != null && !searchQuery.trim().isEmpty()) {
            bookList = bookDAO.searchBooksByTitleOrAuthor(searchQuery);
        } else {
            bookList = bookDAO.getAllBooks();
        }

        request.setAttribute("bookList", bookList);
        request.getRequestDispatcher("staff_select_books.jsp").forward(request, response);
    }
}
