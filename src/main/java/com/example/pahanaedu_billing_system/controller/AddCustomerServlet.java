package com.example.pahanaedu_billing_system.controller;

import com.example.pahanaedu_billing_system.model.Customer;
import com.example.pahanaedu_billing_system.dao.CustomerDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/addCustomer")
public class AddCustomerServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Get form data
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        String phonenumber = request.getParameter("phonenumber");
        String email = request.getParameter("email");

        // Create Customer object
        Customer customer = new Customer();
        customer.setName(name);
        customer.setAddress(address);
        customer.setPhonenumber(phonenumber);
        customer.setEmail(email);

        // Save to DB via DAO
        CustomerDAO customerDAO = new CustomerDAO();
        boolean success = customerDAO.addCustomer(customer);

        if (success) {
            response.sendRedirect("viewCustomers"); // Redirect to viewing customers
        } else {
            response.sendRedirect("staff_add_customer.jsp?error=1"); // Add Customer page with error
        }
    }
}
