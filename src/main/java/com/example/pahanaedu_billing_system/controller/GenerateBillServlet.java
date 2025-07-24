package com.example.pahanaedu_billing_system.controller;

import com.example.pahanaedu_billing_system.model.*;
import com.example.pahanaedu_billing_system.dao.CustomerDAO;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/GenerateBillServlet")
public class GenerateBillServlet extends HttpServlet {

    private final CustomerDAO customerDAO = new CustomerDAO(); // ✅ CustomerDAO instance

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        // 🛒 Retrieve cart from session
        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
        String customerIdParam = request.getParameter("customerId");

        // ✅ Validate inputs
        if (cart == null || cart.isEmpty() || customerIdParam == null || customerIdParam.isEmpty()) {
            response.sendRedirect("staff_cart.jsp");
            return;
        }

        try {
            int customerId = Integer.parseInt(customerIdParam);

            // ✅ Fetch full customer object
            Customer customer = customerDAO.getCustomerById(customerId);
            if (customer == null) {
                response.getWriter().println("❌ Customer not found.");
                return;
            }

            // ✅ Store everything in session for preview page
            session.setAttribute("selectedCustomerId", customerId);
            session.setAttribute("selectedCustomer", customer);
            session.setAttribute("cart", cart);

            // ✅ Redirect to preview page
            response.sendRedirect("staff_final_bill_details.jsp");

        } catch (NumberFormatException e) {
            response.getWriter().println("❌ Invalid customer ID format.");
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("❌ An unexpected error occurred.");
        }
    }
}
