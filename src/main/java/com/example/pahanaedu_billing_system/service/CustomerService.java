package com.example.pahanaedu_billing_system.service;





import java.util.List;


import com.example.pahanaedu_billing_system.dao.CustomerDAO;
import com.example.pahanaedu_billing_system.model.Customer;

public class CustomerService {

    private final CustomerDAO customerDAO = new CustomerDAO();

    public boolean addCustomer(Customer customer) {
        return customerDAO.addCustomer(customer);
    }

    public List<Customer> getAllCustomers() {
        return customerDAO.getAllCustomers();
    }

    public Customer getCustomerById(int id) {
        return customerDAO.getCustomerById(id);
    }

    public boolean updateCustomer(Customer customer) {
        return customerDAO.updateCustomer(customer);
    }

    public boolean deleteCustomer(int customerid) {
        return customerDAO.deleteCustomer(customerid);
    }

    public List<Customer> searchCustomersByName(String name) {
        return customerDAO.searchCustomersByName(name);
    }
}
