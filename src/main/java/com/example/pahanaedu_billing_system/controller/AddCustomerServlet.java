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

@WebServlet("/AddCustomerServlet")
public class AddCustomerServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private final CustomerDAO customerDAO = new CustomerDAO();

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if (action == null || action.equals("view")) {
            // View all customers
            List<Customer> customers = customerDAO.getAllCustomers();
            request.setAttribute("customers", customers);
            request.getRequestDispatcher("staff_view_customers.jsp").forward(request, response);

        } else if (action.equals("edit")) {
            // Show edit customer form
            String customeridParam = request.getParameter("customerid");
            if (customeridParam == null) {
                response.sendRedirect("AddCustomerServlet?action=view");
                return;
            }
            int customerid = Integer.parseInt(customeridParam);
            Customer customer = customerDAO.getCustomerById(customerid);

            if (customer == null) {
                response.sendRedirect("AddCustomerServlet?action=view");
                return;
            }
            request.setAttribute("customer", customer);
            request.getRequestDispatcher("staff_edit_customer.jsp").forward(request, response);

        } else if (action.equals("add")) {
            // Show add form
            request.getRequestDispatcher("staff_add_customer.jsp").forward(request, response);
        }
        // If needed, you can handle 'delete' confirmation in GET with &origin etc.
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if (action == null) {
            response.sendRedirect("AddCustomerServlet?action=view");
            return;
        }

        if (action.equals("add")) {
            // Add customer
            String name = request.getParameter("name");
            String address = request.getParameter("address");
            String phonenumber = request.getParameter("phonenumber");
            String email = request.getParameter("email");

            Customer customer = new Customer();
            customer.setName(name);
            customer.setAddress(address);
            customer.setPhonenumber(phonenumber);
            customer.setEmail(email);

            boolean success = customerDAO.addCustomer(customer);

            if (success) {
                request.getSession().setAttribute("msg", "Customer added successfully!");
                response.sendRedirect("AddCustomerServlet?action=view");
            } else {
                response.sendRedirect("staff_add_customer.jsp?error=1");
            }

        } else if (action.equals("edit")) {
            // Edit customer
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

            boolean success = customerDAO.updateCustomer(customer);

            if (success) {
                request.getSession().setAttribute("msg", "Customer updated successfully!");
                response.sendRedirect("AddCustomerServlet?action=view");
            } else {
                request.setAttribute("error", "Error updating customer. Try again.");
                request.setAttribute("customer", customer);
                request.getRequestDispatcher("staff_edit_customer.jsp").forward(request, response);
            }

        } else if (action.equals("delete")) {
            // Delete customer
            int customerid = Integer.parseInt(request.getParameter("customerid"));
            boolean deleted = customerDAO.deleteCustomer(customerid);

            String origin = request.getParameter("origin");

            if (deleted) {
                request.getSession().setAttribute("msg", "Customer deleted successfully!");
            } else {
                request.getSession().setAttribute("msg", "Error deleting customer!");
            }

            if ("admin".equalsIgnoreCase(origin)) {
                // Redirect to Admin Dashboard or Admin Customers page
                response.sendRedirect("admin_dashboard.html");
            } else {
                // Default redirect to staff view customers page
                response.sendRedirect("AddCustomerServlet?action=view");
            }
        }
    }
}
