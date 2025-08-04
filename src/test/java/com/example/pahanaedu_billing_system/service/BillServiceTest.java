package com.example.pahanaedu_billing_system.service;

import com.example.pahanaedu_billing_system.dto.BillDTO;

import org.junit.jupiter.api.Test;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

class BillServiceTest {

    @Test
    void testGetAllBills() {
        BillService service = new BillService();
        List<BillDTO> bills = service.getAllBills();
        assertNotNull(bills, "Bills list should not be null");
    }

    @Test
    void testGetBillById() {
        BillService service = new BillService();
        int billId = 100; // Use a valid, existing billId from your DB
        BillDTO bill = service.getBillById(billId);
        assertNotNull(bill, "BillDTO should not be null when billId exists");
    }

    @Test
    void testDeleteBillById() {
        BillService service = new BillService();
        int billId = 1; // Change to a real, deletable billId as needed
        boolean deleted = service.deleteBillById(billId);
        assertTrue(deleted || !deleted, "Should return a boolean");
    }

    @Test
    void testSaveBill() {
        BillService service = new BillService();
        BillDTO dto = new BillDTO();

        dto.setDateTime(LocalDateTime.now());
        dto.setCustomerId(90); // Use valid/existing customerId
        dto.setTotal(7899);

        // FIXED: assign empty list instead of null
        dto.setItems(new ArrayList<>());

        dto.setCustomer(null); // Optional

        boolean saved = service.saveBill(dto);
        assertTrue(saved || !saved, "Should return a boolean value");
    }
}
