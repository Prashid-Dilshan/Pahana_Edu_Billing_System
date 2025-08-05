package com.example.pahanaedu_billing_system.service;

import com.example.pahanaedu_billing_system.dto.AdminManageCustomerDTO;
import org.junit.jupiter.api.Test;

import java.util.List;

import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

class AdminManageCustomerServiceTest {

    private final AdminManageCustomerService service = new AdminManageCustomerService();

    @Test
    void testGetAllCustomers() {
        List<AdminManageCustomerDTO> customers = service.getAllCustomers();
        assertNotNull(customers, "Customer list should not be null");
        // If you have predictable data, add more assertions like:
        // assertFalse(customers.isEmpty(), "List should not be empty");
    }

    @Test
    void testSearchCustomersByName() {
        String searchName = "customer 1";  // Change to a real name that exists in test data
        List<AdminManageCustomerDTO> result = service.searchCustomersByName(searchName);
        assertNotNull(result, "Search result should not be null");
        // Additional assertion example:
        // assertTrue(result.size() > 0, "Should return at least one customer");
    }

    @Test
    void testDeleteCustomer() {
        int customerId = 105;  // Use a test customer ID that exists; adjust as needed
        boolean deleted = service.deleteCustomer(customerId);
        assertTrue(deleted, "Customer should be deleted successfully");
        // Or if expecting false for non-existing: assertFalse(deleted);
    }
}
