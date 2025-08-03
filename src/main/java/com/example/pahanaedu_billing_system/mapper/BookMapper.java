package com.example.pahanaedu_billing_system.mapper;

import com.example.pahanaedu_billing_system.model.Book;
import com.example.pahanaedu_billing_system.dto.BookDTO;

public class BookMapper {
    // Entity → DTO
    public static BookDTO toDTO(Book book) {
        if (book == null) return null;
        BookDTO dto = new BookDTO();
        dto.setBookid(book.getBookid());
        dto.setTitle(book.getTitle());
        dto.setAuthor(book.getAuthor());
        dto.setPrice(book.getPrice());
        dto.setStockbookcount(book.getStockbookcount());
        dto.setBookphoto(book.getBookphoto());
        return dto;
    }

    // DTO → Entity
    public static Book toEntity(BookDTO dto) {
        if (dto == null) return null;
        Book book = new Book();
        book.setBookid(dto.getBookid());
        book.setTitle(dto.getTitle());
        book.setAuthor(dto.getAuthor());
        book.setPrice(dto.getPrice());
        book.setStockbookcount(dto.getStockbookcount());
        book.setBookphoto(dto.getBookphoto());
        return book;
    }
}
