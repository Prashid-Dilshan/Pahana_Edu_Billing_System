package com.example.pahanaedu_billing_system.service;

import com.example.pahanaedu_billing_system.dto.StaffLoginDTO;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertNull;

class StaffLoginServiceTest {

    @Test
    void testValidateStaff_ValidCredentials() {
        StaffLoginService service = new StaffLoginService();

        String username = "s1";     // Use a real, valid username
        String password = "12345";     // Use real, valid password

        StaffLoginDTO dto = service.validateStaff(username, password);

        // If credentials are correct and exist in DB, dto should not be null
        assertNotNull(dto, "DTO should not be null for valid credentials");
        // Optionally, check certain dto fields as well
        // assertEquals(username, dto.getUsername());
    }

    @Test
    void testValidateStaff_InvalidCredentials() {
        StaffLoginService service = new StaffLoginService();

        String username = "invaliduser";
        String password = "wrongpass";

        StaffLoginDTO dto = service.validateStaff(username, password);

        // For invalid credentials, dto should be null
        assertNull(dto, "DTO should be null for invalid credentials");
    }
}
