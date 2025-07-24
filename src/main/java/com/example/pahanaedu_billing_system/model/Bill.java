package com.example.pahanaedu_billing_system.model;

import java.time.LocalDateTime;
import java.util.List;

public class Bill {
    private int billId;
    private int customerId; // ✅ Changed from String to int
    private double total;
    private LocalDateTime dateTime;
    private List<BillItem> items;

    // Optional: Customer object for detailed views
    private Customer customer;

    // --- Getters & Setters ---

    public int getBillId() {
        return billId;
    }

    public void setBillId(int billId) {
        this.billId = billId;
    }

    public int getCustomerId() {  // ✅ Updated to int
        return customerId;
    }

    public void setCustomerId(int customerId) {  // ✅ Updated to int
        this.customerId = customerId;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public LocalDateTime getDateTime() {
        return dateTime;
    }

    public void setDateTime(LocalDateTime dateTime) {
        this.dateTime = dateTime;
    }

    public List<BillItem> getItems() {
        return items;
    }

    public void setItems(List<BillItem> items) {
        this.items = items;
    }

    public Customer getCustomer() {  // ✅ For displaying detailed info
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }
}
