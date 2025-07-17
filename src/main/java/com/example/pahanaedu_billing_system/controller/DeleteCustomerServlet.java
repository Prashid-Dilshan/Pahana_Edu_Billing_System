package com.example.pahanaedu_billing_system.controller;

import com.example.pahanaedu_billing_system.dao.CustomerDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/DeleteCustomerServlet")
public class DeleteCustomerServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int customerid = Integer.parseInt(request.getParameter("customerid"));
        CustomerDAO dao = new CustomerDAO();
        dao.deleteCustomer(customerid);
        request.getSession().setAttribute("msg", "Customer deleted successfully!");
        response.sendRedirect("AdminManageCustomerServlet");
    }
}
