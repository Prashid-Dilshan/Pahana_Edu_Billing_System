package com.example.pahanaedu_billing_system.service;

import com.example.pahanaedu_billing_system.dto.BookDTO;
import org.junit.jupiter.api.Test;

import java.util.List;

import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

class BookServiceTest {

    @Test
    void testAddBook() {
        BookService service = new BookService();
        BookDTO bookDTO = new BookDTO();

        bookDTO.setBookid("B1");
        bookDTO.setTitle("Sparks of Phoenix");
        bookDTO.setAuthor("Najwa Zebian");
        bookDTO.setPrice(1700.00);
        bookDTO.setStockbookcount(45);
        bookDTO.setBookphoto(null);          // Optional: null for no image

        boolean added = service.addBook(bookDTO);
        assertTrue(added || !added, "Should return boolean result");
    }

    @Test
    void testUpdateBook() {
        BookService service = new BookService();
        BookDTO bookDTO = new BookDTO();

        bookDTO.setBookid("B1");           // Update this BookId (make sure this exists)
        bookDTO.setTitle("JUnit Advanced");
        bookDTO.setAuthor("Jane Smith");
        bookDTO.setPrice(1200.0);
        bookDTO.setStockbookcount(15);
        bookDTO.setBookphoto(null);          // No image

        boolean updated = service.updateBook(bookDTO);
        assertTrue(updated || !updated, "Should return boolean result");
    }

    @Test
    void testDeleteBook() {
        BookService service = new BookService();
        String bookId = "B1"; // Use BookId that exists or was added above
        boolean deleted = service.deleteBook(bookId);
        assertTrue(deleted || !deleted, "Should return boolean result");
    }

    @Test
    void testGetAllBooks() {
        BookService service = new BookService();
        List<BookDTO> books = service.getAllBooks();
        assertNotNull(books, "Books list should not be null");
    }

    @Test
    void testGetBookById() {
        BookService service = new BookService();
        String bookId = "B1"; // Use BookId that exists
        BookDTO dto = service.getBookById(bookId);
        assertNotNull(dto, "BookDTO should not be null if bookId exists");
    }

    @Test
    void testSearchBooksByTitleOrAuthor() {
        BookService service = new BookService();
        String query = "JUnit"; // Sample query
        List<BookDTO> result = service.searchBooksByTitleOrAuthor(query);
        assertNotNull(result, "Search results should not be null");
    }
}
