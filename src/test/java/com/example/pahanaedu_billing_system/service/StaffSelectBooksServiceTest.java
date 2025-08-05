package com.example.pahanaedu_billing_system.service;

import com.example.pahanaedu_billing_system.dto.StaffSelectBooksDTO;
import org.junit.jupiter.api.Test;

import java.util.List;

import static org.junit.jupiter.api.Assertions.assertNotNull;

class StaffSelectBooksServiceTest {

    @Test
    void testGetAllBooks() {
        StaffSelectBooksService service = new StaffSelectBooksService();
        List<StaffSelectBooksDTO> books = service.getAllBooks();
        assertNotNull(books, "Books list should not be null");
        // Optionally: assertTrue(books.size() > 0);
    }

    @Test
    void testSearchBooks() {
        StaffSelectBooksService service = new StaffSelectBooksService();
        String query = "JUnit"; // Use an author or book title substring that exists
        List<StaffSelectBooksDTO> result = service.searchBooks(query);
        assertNotNull(result, "Search result list should not be null");
        // Optionally: assertTrue(result.size() >= 0);
    }
}
