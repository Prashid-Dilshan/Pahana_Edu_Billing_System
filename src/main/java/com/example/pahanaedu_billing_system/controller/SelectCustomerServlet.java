package com.example.pahanaedu_billing_system.controller;

import com.example.pahanaedu_billing_system.dao.CustomerDAO;
import com.example.pahanaedu_billing_system.model.Customer;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/selectCustomer")
public class SelectCustomerServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String searchName = request.getParameter("searchName");
        CustomerDAO customerDAO = new CustomerDAO();
        List<Customer> customers;

        if (searchName != null && !searchName.trim().isEmpty()) {
            customers = customerDAO.searchCustomersByName(searchName.trim());
        } else {
            customers = customerDAO.getAllCustomers();
        }

        request.setAttribute("customers", customers);
        request.getRequestDispatcher("staff_select_customer.jsp").forward(request, response);
    }
}
