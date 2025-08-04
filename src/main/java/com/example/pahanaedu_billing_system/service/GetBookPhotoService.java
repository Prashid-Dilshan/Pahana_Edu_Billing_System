package com.example.pahanaedu_billing_system.service;

import com.example.pahanaedu_billing_system.dao.BookDAO;
import com.example.pahanaedu_billing_system.mapper.GetBookPhotoMapper;
import com.example.pahanaedu_billing_system.dto.GetBookPhotoDTO;
import com.example.pahanaedu_billing_system.model.Book;

public class GetBookPhotoService {
    private final BookDAO bookDAO = new BookDAO();

    public GetBookPhotoDTO getBookPhotoById(String bookid) {
        Book book = bookDAO.getBookById(bookid);
        return GetBookPhotoMapper.toDTO(book);
    }
}
