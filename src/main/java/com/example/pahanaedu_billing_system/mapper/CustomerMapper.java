package com.example.pahanaedu_billing_system.mapper;


import com.example.pahanaedu_billing_system.model.Customer;
import com.example.pahanaedu_billing_system.dto.CustomerDTO;

public class CustomerMapper {

    public static CustomerDTO toDTO(Customer customer) {
        CustomerDTO dto = new CustomerDTO();
        dto.customerid = customer.getCustomerid();
        dto.name = customer.getName();
        dto.address = customer.getAddress();
        dto.phonenumber = customer.getPhonenumber();
        dto.email = customer.getEmail();
        return dto;
    }

    public static Customer toModel(CustomerDTO dto) {
        Customer customer = new Customer();
        customer.setCustomerid(dto.customerid);
        customer.setName(dto.name);
        customer.setAddress(dto.address);
        customer.setPhonenumber(dto.phonenumber);
        customer.setEmail(dto.email);
        return customer;
    }
}