package com.example.pahanaedu_billing_system.controller;

import com.example.pahanaedu_billing_system.dao.CustomerDAO;
import com.example.pahanaedu_billing_system.model.Customer;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/AdminManageCustomerServlet")
public class AdminManageCustomerServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String search = request.getParameter("search");
        List<Customer> customers;
        CustomerDAO dao = new CustomerDAO();
        if (search != null && !search.trim().isEmpty()) {
            customers = dao.searchCustomersByName(search.trim());
            request.setAttribute("search", search); // retain value in search box
        } else {
            customers = dao.getAllCustomers();
        }
        request.setAttribute("customers", customers);
        request.getRequestDispatcher("admin_customer_manage.jsp").forward(request, response);
    }
}
