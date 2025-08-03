package com.example.pahanaedu_billing_system.mapper;

import com.example.pahanaedu_billing_system.model.Bill;
import com.example.pahanaedu_billing_system.dto.BillDTO;

import java.util.stream.Collectors;

public class BillMapper {
    public static BillDTO toDTO(Bill bill) {
        if (bill == null) return null;
        BillDTO dto = new BillDTO();
        dto.setBillId(bill.getBillId());
        dto.setCustomerId(bill.getCustomerId());
        dto.setTotal(bill.getTotal());
        dto.setDateTime(bill.getDateTime());
        if (bill.getItems() != null) {
            dto.setItems(
                    bill.getItems().stream()
                            .map(BillItemMapper::toDTO)
                            .collect(Collectors.toList())
            );
        }
        dto.setCustomer(CustomerMapper.toDTO(bill.getCustomer()));
        return dto;
    }

    public static Bill toEntity(BillDTO dto) {
        if (dto == null) return null;
        Bill bill = new Bill();
        bill.setBillId(dto.getBillId());
        bill.setCustomerId(dto.getCustomerId());
        bill.setTotal(dto.getTotal());
        bill.setDateTime(dto.getDateTime());
        if (dto.getItems() != null) {
            bill.setItems(
                    dto.getItems().stream()
                            .map(BillItemMapper::toEntity)
                            .collect(Collectors.toList())
            );
        }
        bill.setCustomer(CustomerMapper.toEntity(dto.getCustomer()));
        return bill;
    }
}
