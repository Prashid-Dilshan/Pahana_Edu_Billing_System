package com.example.pahanaedu_billing_system.service;

import com.example.pahanaedu_billing_system.dao.BookDAO;
import com.example.pahanaedu_billing_system.dto.BookDTO;
import com.example.pahanaedu_billing_system.mapper.BookMapper;
import com.example.pahanaedu_billing_system.model.Book;
import java.util.List;
import java.util.stream.Collectors;

public class BookService {
    private final BookDAO bookDAO = new BookDAO();

    public boolean addBook(BookDTO bookDTO) {
        Book book = BookMapper.toEntity(bookDTO);
        String result = bookDAO.addBook(book);
        return "success".equals(result);
    }

    public boolean updateBook(BookDTO bookDTO) {
        Book book = BookMapper.toEntity(bookDTO);
        return bookDAO.updateBook(book);
    }

    public boolean deleteBook(String bookid) {
        return bookDAO.deleteBook(bookid);
    }

    public List<BookDTO> getAllBooks() {
        List<Book> bookList = bookDAO.getAllBooks();
        return bookList.stream()
                .map(BookMapper::toDTO)
                .collect(Collectors.toList());
    }

    public BookDTO getBookById(String bookid) {
        Book book = bookDAO.getBookById(bookid);
        return BookMapper.toDTO(book);
    }

    public List<BookDTO> searchBooksByTitleOrAuthor(String query) {
        List<Book> books = bookDAO.searchBooksByTitleOrAuthor(query);
        return books.stream()
                .map(BookMapper::toDTO)
                .collect(Collectors.toList());
    }
}
