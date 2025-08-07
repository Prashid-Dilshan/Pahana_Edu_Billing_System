package com.example.pahanaedu_billing_system.service;

import com.example.pahanaedu_billing_system.dto.AdminManageStaffDTO;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

class AdminManageStaffServiceTest {

    private AdminManageStaffService service;

    @BeforeEach
    void setUp() {
        service = new AdminManageStaffService();
    }

    @Test
    void testGetAllStaff() {
        List<AdminManageStaffDTO> staffList = service.getAllStaff();
        assertNotNull(staffList, "Staff list should not be null");
        assertFalse(staffList.isEmpty(), "Staff list should not be empty");
    }

    @Test
    void testGetStaffById() {
        AdminManageStaffDTO staff = service.getStaffById("1");  // Replace "1" with valid ID
        assertNotNull(staff, "Staff should not be null for valid ID");
    }

    @Test
    void testAddStaff() {
        AdminManageStaffDTO staffDTO = new AdminManageStaffDTO();
        // Set DTO fields here or use a constructor
        boolean result = service.addStaff(staffDTO);
        assertTrue(result, "Add staff should return true on success");
    }

    @Test
    void testUpdateStaff() {
        AdminManageStaffDTO staffDTO = new AdminManageStaffDTO();
        // Set DTO fields here or use a constructor
        boolean result = service.updateStaff(staffDTO);
        assertTrue(result, "Update staff should return true on success");
    }

    @Test
    void testDeleteStaff() {
        boolean result = service.deleteStaff("1");  // Replace with valid ID
        assertTrue(result, "Delete staff should return true on success");
    }

    @Test
    void testAddStaffWithNullDTO() {
        AdminManageStaffDTO nullDTO = null;
        assertThrows(NullPointerException.class, () -> service.addStaff(nullDTO), "Adding null DTO should throw NullPointerException");
    }

    @Test
    void testUpdateStaffWithNullDTO() {
        AdminManageStaffDTO nullDTO = null;
        assertThrows(NullPointerException.class, () -> service.updateStaff(nullDTO), "Updating null DTO should throw NullPointerException");
    }
}
