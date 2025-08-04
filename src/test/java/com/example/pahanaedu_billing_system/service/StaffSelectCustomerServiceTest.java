package com.example.pahanaedu_billing_system.service;

import com.example.pahanaedu_billing_system.dto.StaffSelectCustomerDTO;
import org.junit.jupiter.api.Test;
import java.util.List;
import static org.junit.jupiter.api.Assertions.*;

class StaffSelectCustomerServiceTest {

    @Test
    void testGetAllCustomers() {
        StaffSelectCustomerService service = new StaffSelectCustomerService();
        List<StaffSelectCustomerDTO> customers = service.getAllCustomers();
        assertNotNull(customers, "Customer list should not be null");
        // Optionally: assertTrue(customers.size() > 0);
    }

    @Test
    void testSearchCustomersByName() {
        StaffSelectCustomerService service = new StaffSelectCustomerService();
        String name = "Test User"; // ඔබේ DB එකේ ඇති customer නාමයක් භාවිතා කරන්න
        List<StaffSelectCustomerDTO> result = service.searchCustomersByName(name);
        assertNotNull(result, "Search result list should not be null");
        // Optionally: assertTrue(result.size() >= 0);
    }
}
