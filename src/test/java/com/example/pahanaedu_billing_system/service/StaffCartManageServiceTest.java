package com.example.pahanaedu_billing_system.service;

import com.example.pahanaedu_billing_system.dto.StaffCartManageDTO;
import com.example.pahanaedu_billing_system.model.CartItem;
import org.junit.jupiter.api.Test;

import java.util.ArrayList;
import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

class StaffCartManageServiceTest {

    @Test
    void testToDTOList_WithItems() {
        StaffCartManageService service = new StaffCartManageService();
        List<CartItem> cart = new ArrayList<>();

        // Sample CartItem, adjust fields as per your CartItem constructor
        CartItem item = new CartItem();
        // item.setXxx(); // set required fields
        cart.add(item);

        List<StaffCartManageDTO> dtoList = service.toDTOList(cart);
        assertNotNull(dtoList, "DTO list should not be null");
        assertEquals(cart.size(), dtoList.size(), "Sizes should match");
    }

    @Test
    void testToDTOList_NullCart() {
        StaffCartManageService service = new StaffCartManageService();
        List<StaffCartManageDTO> dtoList = service.toDTOList(null);
        assertNotNull(dtoList, "DTO list should not be null even when input is null");
        assertEquals(0, dtoList.size(), "DTO list should be empty when input is null");
    }

    @Test
    void testToEntityList_WithDTOs() {
        StaffCartManageService service = new StaffCartManageService();
        List<StaffCartManageDTO> dtoList = new ArrayList<>();

        StaffCartManageDTO dto = new StaffCartManageDTO();
        // dto.setXxx(); // set required fields if any
        dtoList.add(dto);

        List<CartItem> entityList = service.toEntityList(dtoList);
        assertNotNull(entityList, "Entity list should not be null");
        assertEquals(dtoList.size(), entityList.size(), "Sizes should match");
    }

    @Test
    void testToEntityList_NullDTOList() {
        StaffCartManageService service = new StaffCartManageService();
        List<CartItem> entityList = service.toEntityList(null);
        assertNotNull(entityList, "Entity list should not be null even when input is null");
        assertEquals(0, entityList.size(), "Entity list should be empty when input is null");
    }
}
