package com.example.pahanaedu_billing_system.mapper;

import com.example.pahanaedu_billing_system.model.Book;
import com.example.pahanaedu_billing_system.dto.GetBookPhotoDTO;

public class GetBookPhotoMapper {
    public static GetBookPhotoDTO toDTO(Book book) {
        if (book == null) return null;
        return new GetBookPhotoDTO(book.getBookid(), book.getBookphoto());
    }
}
