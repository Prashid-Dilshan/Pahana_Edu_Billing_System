package com.example.pahanaedu_billing_system.controller;

import com.example.pahanaedu_billing_system.dto.AdminManageCustomerDTO;
import com.example.pahanaedu_billing_system.service.AdminManageCustomerService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/AdminManageCustomerServlet")
public class AdminManageCustomerServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final AdminManageCustomerService customerService = new AdminManageCustomerService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session != null) {
            String msg = (String) session.getAttribute("msg");
            if (msg != null) {
                request.setAttribute("msg", msg);
                session.removeAttribute("msg");
            }
        }

        String search = request.getParameter("search");
        if (search != null) {
            search = search.trim();
        }

        List<AdminManageCustomerDTO> customers;
        if (search != null && !search.isEmpty()) {
            customers = customerService.searchCustomersByName(search);
            request.setAttribute("search", search);
        } else {
            customers = customerService.getAllCustomers();
        }
        request.setAttribute("customers", customers);

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
                    boolean deleted = customerService.deleteCustomer(customerid);
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
            response.sendRedirect("AdminManageCustomerServlet?action=view");
            return;
        }

        // Handle other POST actions...

        doGet(request, response);
    }
}
