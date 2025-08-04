package com.example.pahanaedu_billing_system.service;

import com.example.pahanaedu_billing_system.dto.StaffCartManageDTO;
import com.example.pahanaedu_billing_system.mapper.StaffCartManageMapper;
import com.example.pahanaedu_billing_system.model.CartItem;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

public class StaffCartManageService {

    // Convert session cart (List<CartItem>) to List<DTO>
    public List<StaffCartManageDTO> toDTOList(List<CartItem> cart) {
        if (cart == null) return new ArrayList<>();
        return cart.stream().map(StaffCartManageMapper::toDTO).collect(Collectors.toList());
    }

    // Convert List<DTO> to List<CartItem> (if needed)
    public List<CartItem> toEntityList(List<StaffCartManageDTO> dtoList) {
        if (dtoList == null) return new ArrayList<>();
        return dtoList.stream().map(StaffCartManageMapper::toEntity).collect(Collectors.toList());
    }

    // Add/Remove/Update logic can be placed here, if you want to move from direct servlet code.
}
