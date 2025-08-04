package com.example.pahanaedu_billing_system.mapper;

import com.example.pahanaedu_billing_system.model.CartItem;
import com.example.pahanaedu_billing_system.dto.StaffCartManageDTO;

public class StaffCartManageMapper {

    public static StaffCartManageDTO toDTO(CartItem item) {
        if (item == null) return null;
        return new StaffCartManageDTO(
                item.getBookId(),
                item.getTitle(),
                item.getPrice(),
                item.getQuantity()
        );
    }

    public static CartItem toEntity(StaffCartManageDTO dto) {
        if (dto == null) return null;
        return new CartItem(
                dto.getBookId(),
                dto.getTitle(),
                dto.getPrice(),
                dto.getQuantity()
        );
    }
}
