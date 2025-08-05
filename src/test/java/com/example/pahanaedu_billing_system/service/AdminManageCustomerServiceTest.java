package com.example.pahanaedu_billing_system.service;

import com.example.pahanaedu_billing_system.dto.AdminManageCustomerDTO;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

class AdminManageCustomerServiceTest {

    private final AdminManageCustomerService service = new AdminManageCustomerService();

    @BeforeEach
    void setUp() {
        // Optional: add a customer to ensure the ID exists before testing delete
        // service.addCustomer(new AdminManageCustomerDTO(105, "Test Customer", "Test Address", "1234567890", "test@example.com"));
        // Note: Uncomment and implement if addCustomer method exists.
    }

    @Test
    void testGetAllCustomers() {
        List<AdminManageCustomerDTO> customers = service.getAllCustomers();
        assertNotNull(customers, "Customer list should not be null");
        // Optional: assertFalse(customers.isEmpty(), "List should not be empty if data exists");
    }

    @Test
    void testSearchCustomersByName() {
        String searchName = "customer 1";  // Update to match actual data
        List<AdminManageCustomerDTO> result = service.searchCustomersByName(searchName);
        assertNotNull(result, "Search result should not be null");
        // Optional: assertTrue(result.size() > 0, "Should return at least one customer");
    }

    @Test
    void testDeleteCustomer() {
        int customerId = 109;  // Ensure this customer exists in the test DB before running
        boolean deleted = service.deleteCustomer(customerId);
        assertTrue(deleted, "Customer should be deleted successfully");
    }
}
