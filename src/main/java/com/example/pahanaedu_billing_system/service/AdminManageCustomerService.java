package com.example.pahanaedu_billing_system.service;

import com.example.pahanaedu_billing_system.dao.CustomerDAO;
import com.example.pahanaedu_billing_system.mapper.AdminManageCustomerMapper;
import com.example.pahanaedu_billing_system.dto.AdminManageCustomerDTO;
import com.example.pahanaedu_billing_system.model.Customer;

import java.util.List;
import java.util.stream.Collectors;

public class AdminManageCustomerService {
    private final CustomerDAO customerDAO = new CustomerDAO();

    public List<AdminManageCustomerDTO> getAllCustomers() {
        List<Customer> list = customerDAO.getAllCustomers();
        return list.stream()
                .map(AdminManageCustomerMapper::toDTO)
                .collect(Collectors.toList());
    }

    public List<AdminManageCustomerDTO> searchCustomersByName(String name) {
        List<Customer> list = customerDAO.searchCustomersByName(name);
        return list.stream()
                .map(AdminManageCustomerMapper::toDTO)
                .collect(Collectors.toList());
    }

    public boolean deleteCustomer(int customerid) {
        return customerDAO.deleteCustomer(customerid);
    }
}
