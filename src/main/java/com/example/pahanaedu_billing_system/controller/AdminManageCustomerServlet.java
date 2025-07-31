package com.example.pahanaedu_billing_system.controller;

import com.example.pahanaedu_billing_system.model.Customer;
import com.example.pahanaedu_billing_system.dao.CustomerDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet("/AdminManageCustomerServlet")
public class AdminManageCustomerServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private final CustomerDAO customerDAO = new CustomerDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Get and forward any session messages (like delete success/error)
        HttpSession session = request.getSession(false);
        if (session != null) {
            String msg = (String) session.getAttribute("msg");
            if (msg != null) {
                request.setAttribute("msg", msg);
                session.removeAttribute("msg");
            }
        }

        // Get search term and trim it
        String search = request.getParameter("search");
        if (search != null) {
            search = search.trim();
        }

        List<Customer> customers;
        if (search != null && !search.isEmpty()) {
            // Search customers by name
            customers = customerDAO.searchCustomersByName(search);
            request.setAttribute("search", search); // Keep value in search box
        } else {
            // Get all customers
            customers = customerDAO.getAllCustomers();
        }
        request.setAttribute("customers", customers);

        // Forward to JSP to display customer list
        request.getRequestDispatcher("admin_customer_manage.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        HttpSession session = request.getSession();

        if ("delete".equalsIgnoreCase(action)) {
            String idStr = request.getParameter("customerid");
            if (idStr != null && !idStr.isEmpty()) {
                try {
                    int customerid = Integer.parseInt(idStr);
                    boolean deleted = customerDAO.deleteCustomer(customerid);
                    if (deleted) {
                        session.setAttribute("msg", "Customer deleted successfully.");
                    } else {
                        session.setAttribute("msg", "Failed to delete customer.");
                    }
                } catch (NumberFormatException e) {
                    session.setAttribute("msg", "Invalid customer ID.");
                }
            } else {
                session.setAttribute("msg", "Customer ID missing.");
            }
            // Redirect back to servlet doGet() for fresh list and message display
            response.sendRedirect("AdminManageCustomerServlet?action=view");
            return;
        }

        // Handle other POST actions (add/edit) as needed...

        // Default fallback, forward to doGet
        doGet(request, response);
    }
}
