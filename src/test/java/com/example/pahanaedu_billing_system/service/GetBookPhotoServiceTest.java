package com.example.pahanaedu_billing_system.service;

import com.example.pahanaedu_billing_system.dto.GetBookPhotoDTO;
import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

class GetBookPhotoServiceTest {

    @Test
    void testGetBookPhotoById() {
        GetBookPhotoService service = new GetBookPhotoService();
        String bookId = "B2"; // Use a BookID that exists in your DB/test data

        GetBookPhotoDTO dto = service.getBookPhotoById(bookId);

        // dto null නම්, ඒ bookId DB එකේ නැහැ. නැතිනම් not null, base test pass වෙයි.
        assertNotNull(dto, "GetBookPhotoDTO should not be null if bookId exists");
        // Optionally:
        // assertNotNull(dto.getBookphoto(), "Book photo (byte[]) should not be null if photo exists");
    }
}
