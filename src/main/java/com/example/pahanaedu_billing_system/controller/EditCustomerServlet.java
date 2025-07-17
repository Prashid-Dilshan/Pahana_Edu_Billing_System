package com.example.pahanaedu_billing_system.controller;

import com.example.pahanaedu_billing_system.dao.CustomerDAO;
import com.example.pahanaedu_billing_system.model.Customer;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/EditCustomerServlet")
public class EditCustomerServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Show the edit form (GET)
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String customeridParam = request.getParameter("customerid");
        if (customeridParam == null) {
            response.sendRedirect("viewCustomers");
            return;
        }

        int customerid = Integer.parseInt(customeridParam);
        CustomerDAO dao = new CustomerDAO();
        Customer customer = dao.getCustomerById(customerid);

        if (customer == null) {
            // Customer not found, redirect to list
            response.sendRedirect("viewCustomers");
            return;
        }

        request.setAttribute("customer", customer);
        request.getRequestDispatcher("staff_edit_customer.jsp").forward(request, response);
    }

    // Handle the form submission (POST)
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int customerid = Integer.parseInt(request.getParameter("customerid"));
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        String phonenumber = request.getParameter("phonenumber");
        String email = request.getParameter("email");

        Customer customer = new Customer();
        customer.setCustomerid(customerid);
        customer.setName(name);
        customer.setAddress(address);
        customer.setPhonenumber(phonenumber);
        customer.setEmail(email);

        CustomerDAO dao = new CustomerDAO();
        boolean success = dao.updateCustomer(customer);

        if (success) {
            request.getSession().setAttribute("msg", "Customer updated successfully!");
            response.sendRedirect("viewCustomers");
        } else {
            request.setAttribute("error", "Error updating customer. Try again.");
            request.setAttribute("customer", customer); // So the form is pre-filled
            request.getRequestDispatcher("staff_edit_customer.jsp").forward(request, response);
        }
    }
}
