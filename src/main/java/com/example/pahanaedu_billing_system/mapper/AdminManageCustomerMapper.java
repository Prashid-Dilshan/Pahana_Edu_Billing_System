package com.example.pahanaedu_billing_system.mapper;

import com.example.pahanaedu_billing_system.model.Customer;
import com.example.pahanaedu_billing_system.dto.AdminManageCustomerDTO;

public class AdminManageCustomerMapper {

    // Model → DTO
    public static AdminManageCustomerDTO toDTO(Customer customer) {
        if (customer == null) return null;
        AdminManageCustomerDTO dto = new AdminManageCustomerDTO();
        dto.setCustomerid(customer.getCustomerid());
        dto.setName(customer.getName());
        dto.setAddress(customer.getAddress());
        dto.setPhonenumber(customer.getPhonenumber());
        dto.setEmail(customer.getEmail());
        return dto;
    }

    // DTO → Model
    public static Customer toEntity(AdminManageCustomerDTO dto) {
        if (dto == null) return null;
        Customer customer = new Customer();
        customer.setCustomerid(dto.getCustomerid());
        customer.setName(dto.getName());
        customer.setAddress(dto.getAddress());
        customer.setPhonenumber(dto.getPhonenumber());
        customer.setEmail(dto.getEmail());
        return customer;
    }
}
