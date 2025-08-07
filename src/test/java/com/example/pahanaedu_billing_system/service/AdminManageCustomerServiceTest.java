package com.example.pahanaedu_billing_system.service;

import com.example.pahanaedu_billing_system.dto.AdminManageCustomerDTO;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

class AdminManageCustomerServiceTest {

    private AdminManageCustomerService service;

    @BeforeEach
    void setUp() {
        service = new AdminManageCustomerService();
    }

    @Test
    void testGetAllCustomers() {
        List<AdminManageCustomerDTO> customers = service.getAllCustomers();
        assertNotNull(customers, "Customer list should not be null");
        assertFalse(customers.isEmpty(), "Customer list should not be empty");
    }

    @Test
    void testSearchCustomersByName() {
        List<AdminManageCustomerDTO> customers = service.searchCustomersByName("John");
        assertNotNull(customers, "Search result should not be null");
        // Optional: Add asserts to check specific properties if DB data known
    }

    @Test
    void testSearchCustomersByNameNoResults() {
        List<AdminManageCustomerDTO> customers = service.searchCustomersByName("NonExistentName");
        assertNotNull(customers, "Search result should not be null even when empty");
        assertTrue(customers.isEmpty(), "Search with no matches should return empty list");
    }

    @Test
    void testSearchCustomersByNameEmptyString() {
        List<AdminManageCustomerDTO> customers = service.searchCustomersByName("");
        assertNotNull(customers, "Search with empty string should not be null");
        // Depending on DAO impl, could be empty or full list - adjust assertion accordingly
    }

    @Test
    void testDeleteCustomerWithValidId() {
        boolean deleted = service.deleteCustomer(123); // Replace 101 with valid ID
        assertTrue(deleted, "Customer should be deleted successfully");
    }

    @Test
    void testDeleteCustomerWithNonExistentId() {
        boolean deleted = service.deleteCustomer(999999); // Non-existent ID
        assertFalse(deleted, "Deleting non-existent customer should fail");
    }

    @Test
    void testDeleteCustomerWithNegativeId() {
        boolean deleted = service.deleteCustomer(-1);
        assertFalse(deleted, "Deleting with negative ID should fail");
    }

    @Test
    void testDeleteCustomerWithZeroId() {
        boolean deleted = service.deleteCustomer(0);
        assertFalse(deleted, "Deleting with zero ID should fail");
    }
}
