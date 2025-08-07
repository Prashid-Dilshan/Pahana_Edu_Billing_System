package com.example.pahanaedu_billing_system.service;

import com.example.pahanaedu_billing_system.dto.BillDTO;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

class BillServiceTest {

    private BillService service;

    @BeforeEach
    void setUp() {
        service = new BillService();
    }

    @Test
    void testGetAllBills() {
        List<BillDTO> bills = service.getAllBills();
        assertNotNull(bills, "Bills list should not be null");
        assertFalse(bills.isEmpty(), "Bills list should not be empty");
    }

    @Test
    void testGetBillById() {
        BillDTO bill = service.getBillById(1);  // Replace 1 with valid ID
        assertNotNull(bill, "Bill should not be null for valid ID");
    }

    @Test
    void testDeleteBillById() {
        boolean deleted = service.deleteBillById(1);  // Replace 1 with valid ID
        assertTrue(deleted, "Delete bill should return true on success");
    }

    @Test
    void testSaveBill() {
        BillDTO billDTO = new BillDTO();
        // Set DTO fields here or use constructor
        boolean result = service.saveBill(billDTO);
        assertTrue(result, "Save bill should return true on success");
    }

    @Test
    void testSaveBillWithNullDTO() {
        BillDTO nullDTO = null;
        assertThrows(NullPointerException.class, () -> service.saveBill(nullDTO), "Saving null DTO should throw NullPointerException");
    }
}
