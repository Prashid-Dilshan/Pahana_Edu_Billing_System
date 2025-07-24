package com.example.pahanaedu_billing_system.controller;

import com.example.pahanaedu_billing_system.dao.BillDAO;
import com.example.pahanaedu_billing_system.model.Bill;
import com.example.pahanaedu_billing_system.util.SMSSender;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/sendSMS")
public class SendSMSServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private BillDAO billDAO = new BillDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String billIdParam = request.getParameter("billId");

        if (billIdParam == null || billIdParam.isEmpty()) {
            response.getWriter().println("❌ Bill ID not provided.");
            return;
        }

        try {
            int billId = Integer.parseInt(billIdParam);
            Bill bill = billDAO.getBillById(billId);

            if (bill == null) {
                response.getWriter().println("❌ Bill not found.");
                return;
            }

            // Customer phone number from bill object (assuming you fetched it along with bill)
            String phoneNumber = bill.getCustomer().getPhonenumber(); // e.g., "+94771234567"

            // Build SMS message
            String message = "📚 Pahana Edu Bill #" + bill.getBillId() +
                    "\nTotal: Rs. " + bill.getTotal() +
                    "\nThank you for shopping with us!";

            // Send the SMS using Twilio
            boolean sent = SMSSender.sendSMS(phoneNumber, message);

            if (sent) {
                response.getWriter().println("✅ SMS sent successfully to " + phoneNumber);
            } else {
                response.getWriter().println("❌ Failed to send SMS.");
            }

        } catch (NumberFormatException e) {
            response.getWriter().println("❌ Invalid Bill ID format.");
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("❌ Unexpected error occurred.");
        }
    }
}
