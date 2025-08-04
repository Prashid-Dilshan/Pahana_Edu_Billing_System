package com.example.pahanaedu_billing_system.mapper;

import com.example.pahanaedu_billing_system.model.Book;
import com.example.pahanaedu_billing_system.dto.StaffSelectBooksDTO;

public class StaffSelectBooksMapper {
    public static StaffSelectBooksDTO toDTO(Book book) {
        if (book == null) return null;
        return new StaffSelectBooksDTO(
                book.getBookid(),
                book.getTitle(),
                book.getAuthor(),
                book.getPrice(),
                book.getStockbookcount(),
                book.getBookphoto()
        );
    }

    public static Book toEntity(StaffSelectBooksDTO dto) {
        if (dto == null) return null;
        return new Book(
                dto.getBookid(),
                dto.getTitle(),
                dto.getAuthor(),
                dto.getPrice(),
                dto.getStockbookcount(),
                dto.getBookphoto()
        );
    }
}
