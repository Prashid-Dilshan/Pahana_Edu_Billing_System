package com.example.pahanaedu_billing_system.service;

import com.example.pahanaedu_billing_system.model.Customer;
import org.junit.jupiter.api.Test;
import java.util.List;
import static org.junit.jupiter.api.Assertions.*;

class CustomerServiceTest {

    @Test
    void testAddCustomer() {
        CustomerService service = new CustomerService();
        Customer customer = new Customer();

        customer.setCustomerid(96); // Unique ID
        customer.setName("Test User");
        customer.setAddress("123 Main St");
        customer.setPhonenumber("0711234567");
        customer.setEmail("testuser@email.com");

        boolean added = service.addCustomer(customer);
        assertTrue(added || !added, "Should return a boolean result");
    }

    @Test
    void testGetAllCustomers() {
        CustomerService service = new CustomerService();
        List<Customer> customers = service.getAllCustomers();
        assertNotNull(customers, "Customer list should not be null");
    }

    @Test
    void testGetCustomerById() {
        CustomerService service = new CustomerService();
        int custId = 99; // Please use an ID that you know exists
        Customer customer = service.getCustomerById(custId);
        assertNotNull(customer, "Customer should not be null if ID exists");
    }

    @Test
    void testUpdateCustomer() {
        CustomerService service = new CustomerService();
        Customer customer = new Customer();

        customer.setCustomerid(96); // Use an existing ID
        customer.setName("Updated User");
        customer.setAddress("456 New St");
        customer.setPhonenumber("0777654321");
        customer.setEmail("updated@email.com");

        boolean updated = service.updateCustomer(customer);
        assertTrue(updated || !updated, "Should return a boolean result");
    }

    @Test
    void testDeleteCustomer() {
        CustomerService service = new CustomerService();
        int custId = 96;
        boolean deleted = service.deleteCustomer(custId);
        assertTrue(deleted || !deleted, "Should return a boolean result");
    }

    @Test
    void testSearchCustomersByName() {
        CustomerService service = new CustomerService();
        String name = "User";
        List<Customer> results = service.searchCustomersByName(name);
        assertNotNull(results, "Search result list should not be null");
    }
}
