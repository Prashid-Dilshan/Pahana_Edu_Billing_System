package com.example.pahanaedu_billing_system.service;

import com.example.pahanaedu_billing_system.dao.BookDAO;
import com.example.pahanaedu_billing_system.dto.StaffSelectBooksDTO;
import com.example.pahanaedu_billing_system.mapper.StaffSelectBooksMapper;
import com.example.pahanaedu_billing_system.model.Book;

import java.util.List;
import java.util.stream.Collectors;

public class StaffSelectBooksService {
    private final BookDAO bookDAO = new BookDAO();

    public List<StaffSelectBooksDTO> getAllBooks() {
        List<Book> books = bookDAO.getAllBooks();
        return books.stream()
                .map(StaffSelectBooksMapper::toDTO)
                .collect(Collectors.toList());
    }

    public List<StaffSelectBooksDTO> searchBooks(String query) {
        List<Book> books = bookDAO.searchBooksByTitleOrAuthor(query);
        return books.stream()
                .map(StaffSelectBooksMapper::toDTO)
                .collect(Collectors.toList());
    }
}
