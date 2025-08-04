package com.example.pahanaedu_billing_system.mapper;

import com.example.pahanaedu_billing_system.model.Customer;
import com.example.pahanaedu_billing_system.dto.StaffSelectCustomerDTO;

public class StaffSelectCustomerMapper {

    public static StaffSelectCustomerDTO toDTO(Customer customer) {
        if (customer == null) return null;
        return new StaffSelectCustomerDTO(
                customer.getCustomerid(),
                customer.getName(),
                customer.getAddress(),
                customer.getPhonenumber(),
                customer.getEmail()
        );
    }

    public static Customer toEntity(StaffSelectCustomerDTO dto) {
        if (dto == null) return null;
        return new Customer(
                dto.getCustomerid(),
                dto.getName(),
                dto.getAddress(),
                dto.getPhonenumber(),
                dto.getEmail()
        );
    }
}
