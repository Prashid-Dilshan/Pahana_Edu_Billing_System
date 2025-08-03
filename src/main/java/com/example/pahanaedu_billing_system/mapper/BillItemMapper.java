package com.example.pahanaedu_billing_system.mapper;

import com.example.pahanaedu_billing_system.model.BillItem;
import com.example.pahanaedu_billing_system.dto.BillItemDTO;

public class BillItemMapper {
    public static BillItemDTO toDTO(BillItem item) {
        if (item == null) return null;
        BillItemDTO dto = new BillItemDTO();
        dto.setBillId(item.getBillId());
        dto.setBookId(item.getBookId());
        dto.setPrice(item.getPrice());
        dto.setQuantity(item.getQuantity());
        if (item.getBook() != null) {
            dto.setBook(BookMapper.toDTO(item.getBook()));
        }
        return dto;
    }

    public static BillItem toEntity(BillItemDTO dto) {
        if (dto == null) return null;
        BillItem item = new BillItem();
        item.setBillId(dto.getBillId());
        item.setBookId(dto.getBookId());
        item.setPrice(dto.getPrice());
        item.setQuantity(dto.getQuantity());
        if (dto.getBook() != null) {
            item.setBook(BookMapper.toEntity(dto.getBook()));
        }
        return item;
    }
}
