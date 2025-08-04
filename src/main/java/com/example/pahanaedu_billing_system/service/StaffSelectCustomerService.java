package com.example.pahanaedu_billing_system.service;

import com.example.pahanaedu_billing_system.dao.CustomerDAO;
import com.example.pahanaedu_billing_system.dto.StaffSelectCustomerDTO;
import com.example.pahanaedu_billing_system.mapper.StaffSelectCustomerMapper;
import com.example.pahanaedu_billing_system.model.Customer;

import java.util.List;
import java.util.stream.Collectors;

public class StaffSelectCustomerService {
    private final CustomerDAO customerDAO = new CustomerDAO();

    public List<StaffSelectCustomerDTO> getAllCustomers() {
        List<Customer> entityList = customerDAO.getAllCustomers();
        return entityList.stream()
                .map(StaffSelectCustomerMapper::toDTO)
                .collect(Collectors.toList());
    }

    public List<StaffSelectCustomerDTO> searchCustomersByName(String name) {
        List<Customer> customers = customerDAO.searchCustomersByName(name);
        return customers.stream()
                .map(StaffSelectCustomerMapper::toDTO)
                .collect(Collectors.toList());
    }

    // More feature-specific service logic can be added here!
}
