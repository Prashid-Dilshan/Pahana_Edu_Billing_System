package com.example.pahanaedu_billing_system.mapper;

import com.example.pahanaedu_billing_system.dto.*;
import com.example.pahanaedu_billing_system.model.*;

import java.util.List;
import java.util.stream.Collectors;
import java.util.Collections;

public class StaffBillsManageMapper {
    public static StaffBillsManageCustomerDTO toCustomerDTO(Customer c) {
        if (c == null) return null;
        return new StaffBillsManageCustomerDTO(
                c.getCustomerid(),
                c.getName(),
                c.getAddress(),
                c.getPhonenumber(),
                c.getEmail()
        );
    }

    public static StaffBillsManageItemDTO toItemDTO(BillItem item, Book book) {
        return new StaffBillsManageItemDTO(
                item.getBookId(),
                (book != null) ? book.getTitle() : "",
                item.getQuantity(),
                item.getPrice()
        );
    }

    public static StaffBillsManageDTO toBillDTO(Bill bill, List<Book> allBooks) {
        if (bill == null) return null;

        // --- Defensive: Always use a non-null list ---
        List<BillItem> billItems = bill.getItems();
        if (billItems == null) billItems = Collections.emptyList();

        List<StaffBillsManageItemDTO> items = billItems.stream()
                .map(item -> {
                    Book b = allBooks.stream()
                            .filter(book -> book.getBookid().equals(item.getBookId()))
                            .findFirst().orElse(null);
                    return toItemDTO(item, b);
                })
                .collect(Collectors.toList());
        return new StaffBillsManageDTO(
                bill.getBillId(),
                toCustomerDTO(bill.getCustomer()),
                bill.getTotal(),
                bill.getDateTime(),
                items
        );
    }
}
