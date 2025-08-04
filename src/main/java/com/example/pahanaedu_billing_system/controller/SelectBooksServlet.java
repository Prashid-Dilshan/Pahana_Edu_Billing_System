package com.example.pahanaedu_billing_system.controller;

import com.example.pahanaedu_billing_system.dto.StaffSelectBooksDTO;

import com.example.pahanaedu_billing_system.service.StaffSelectBooksService;
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

    private final StaffSelectBooksService staffSelectBooksService = new StaffSelectBooksService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String searchQuery = request.getParameter("searchQuery");
        List<StaffSelectBooksDTO> bookList;

        if (searchQuery != null && !searchQuery.trim().isEmpty()) {
            bookList = staffSelectBooksService.searchBooks(searchQuery.trim());
        } else {
            bookList = staffSelectBooksService.getAllBooks();
        }

        request.setAttribute("bookList", bookList);
        request.getRequestDispatcher("staff_select_books.jsp").forward(request, response);
    }
}