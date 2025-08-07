package com.example.pahanaedu_billing_system.service;

import com.example.pahanaedu_billing_system.dto.StaffLoginDTO;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class StaffLoginServiceTest {

    private StaffLoginService staffLoginService;

    @BeforeEach
    void setUp() {
        staffLoginService = new StaffLoginService();
    }


    @Test
    void testValidateStaffWithInvalidUsername() {
        StaffLoginDTO dto = staffLoginService.validateStaff("invalidUser", "validPass");
        assertNull(dto, "Invalid username should return null");
    }

    @Test
    void testValidateStaffWithInvalidPassword() {
        StaffLoginDTO dto = staffLoginService.validateStaff("validUser", "invalidPass");
        assertNull(dto, "Invalid password should return null");
    }

    @Test
    void testValidateStaffWithNullUsername() {
        StaffLoginDTO dto = staffLoginService.validateStaff(null, "validPass");
        assertNull(dto, "Null username should return null");
    }

    @Test
    void testValidateStaffWithNullPassword() {
        StaffLoginDTO dto = staffLoginService.validateStaff("validUser", null);
        assertNull(dto, "Null password should return null");
    }

    @Test
    void testValidateStaffWithEmptyUsername() {
        StaffLoginDTO dto = staffLoginService.validateStaff("", "validPass");
        assertNull(dto, "Empty username should return null");
    }

    @Test
    void testValidateStaffWithEmptyPassword() {
        StaffLoginDTO dto = staffLoginService.validateStaff("validUser", "");
        assertNull(dto, "Empty password should return null");
    }
}
