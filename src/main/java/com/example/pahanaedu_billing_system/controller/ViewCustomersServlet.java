package com.example.pahanaedu_billing_system.controller;

import com.example.pahanaedu_billing_system.model.Customer;
import com.example.pahanaedu_billing_system.dao.CustomerDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/viewCustomers")
public class ViewCustomersServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        CustomerDAO customerDAO = new CustomerDAO();
        List<Customer> customers = customerDAO.getAllCustomers();

        request.setAttribute("customers", customers);
        request.getRequestDispatcher("staff_view_customers.jsp").forward(request, response);
    }
}
