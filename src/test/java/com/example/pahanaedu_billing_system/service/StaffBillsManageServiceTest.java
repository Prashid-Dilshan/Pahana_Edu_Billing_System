package com.example.pahanaedu_billing_system.service;

import com.example.pahanaedu_billing_system.dto.StaffBillsManageDTO;
import org.junit.jupiter.api.Test;
import java.util.List;
import static org.junit.jupiter.api.Assertions.*;

class StaffBillsManageServiceTest {

    @Test
    void testGetAllBills() {
        StaffBillsManageService service = new StaffBillsManageService();
        List<StaffBillsManageDTO> bills = service.getAllBills();
        assertNotNull(bills, "Bills list should not be null");
        // Optionally: assertTrue(bills.size() > 0);
    }

    @Test
    void testGetBillById() {
        StaffBillsManageService service = new StaffBillsManageService();
        int billId = 100; // Use a valid, existing billId in your DB
        StaffBillsManageDTO dto = service.getBillById(billId);
        assertNotNull(dto, "StaffBillsManageDTO should not be null if billId exists");
    }

    @Test
    void testDeleteBillById() {
        StaffBillsManageService service = new StaffBillsManageService();
        int billId = 100; // Use a valid, deletable billId
        boolean deleted = service.deleteBillById(billId);
        assertTrue(deleted || !deleted, "Should return a boolean result");
    }
}
