package com.example.pahanaedu_billing_system.service;

import com.example.pahanaedu_billing_system.dto.AdminLoginDTO;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class AdminLoginServiceTest {

    private AdminLoginService adminLoginService;

    @BeforeEach
    void setUp() {
        adminLoginService = new AdminLoginService();
    }

    @Test
    void testLoginCheckWithCorrectCredentials() {
        AdminLoginDTO credentials = new AdminLoginDTO("admin", "12345");
        assertTrue(adminLoginService.loginCheck(credentials));
    }

    @Test
    void testLoginCheckWithIncorrectUsername() {
        AdminLoginDTO credentials = new AdminLoginDTO("wrongUser", "12345");
        assertFalse(adminLoginService.loginCheck(credentials));
    }

    @Test
    void testLoginCheckWithIncorrectPassword() {
        AdminLoginDTO credentials = new AdminLoginDTO("admin", "wrongPass");
        assertFalse(adminLoginService.loginCheck(credentials));
    }

    @Test
    void testLoginCheckWithNullUsername() {
        AdminLoginDTO credentials = new AdminLoginDTO(null, "12345");
        assertFalse(adminLoginService.loginCheck(credentials));
    }

    @Test
    void testLoginCheckWithNullPassword() {
        AdminLoginDTO credentials = new AdminLoginDTO("admin", null);
        assertFalse(adminLoginService.loginCheck(credentials));
    }

    @Test
    void testLoginCheckWithEmptyUsername() {
        AdminLoginDTO credentials = new AdminLoginDTO("", "12345");
        assertFalse(adminLoginService.loginCheck(credentials));
    }

    @Test
    void testLoginCheckWithEmptyPassword() {
        AdminLoginDTO credentials = new AdminLoginDTO("admin", "");
        assertFalse(adminLoginService.loginCheck(credentials));
    }
}
