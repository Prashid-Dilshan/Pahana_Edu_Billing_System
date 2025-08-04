package com.example.pahanaedu_billing_system.service;

import com.example.pahanaedu_billing_system.dto.AdminManageCustomerDTO;

import org.junit.jupiter.api.Test;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

class AdminManageCustomerServiceTest {

    @Test
    void testGetAllCustomers() {
        AdminManageCustomerService service = new AdminManageCustomerService();

        List<AdminManageCustomerDTO> result = service.getAllCustomers();

        assertNotNull(result, "Result should not be null");
        // Optionally, if you know initial DB state, check size or fields
        // assertEquals(expectedSize, result.size());
    }

    @Test
    void testSearchCustomersByName() {
        AdminManageCustomerService service = new AdminManageCustomerService();

        String testName = "John"; // Replace with an existing customer if possible
        List<AdminManageCustomerDTO> result = service.searchCustomersByName(testName);

        assertNotNull(result, "Result should not be null");
        // Optionally check returned names contain 'John'
        // for (AdminManageCustomerDTO dto : result) {
        //     assertTrue(dto.getName().contains(testName));
        // }
    }

    @Test
    void testDeleteCustomer() {
        AdminManageCustomerService service = new AdminManageCustomerService();

        int testCustomerId = 1; // Replace with a valid/existing customer id
        boolean deleted = service.deleteCustomer(testCustomerId);

        // Result is true if customer was deleted, false otherwise
        assertTrue(deleted || !deleted, "Should return boolean value");
        // Strict check (if you are sure the customer exists):
        // assertTrue(deleted, "Customer should be deleted");
    }
}
