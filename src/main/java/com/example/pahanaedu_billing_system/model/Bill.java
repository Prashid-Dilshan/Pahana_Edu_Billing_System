package com.example.pahanaedu_billing_system.model;

import java.time.LocalDateTime;
import java.util.List;

public class Bill {
    private int billId;
    private String customerId;
    private double total;
    private LocalDateTime dateTime;
    private List<BillItem> items;

    public int getBillId() { return billId; }
    public void setBillId(int billId) { this.billId = billId; }

    public String getCustomerId() { return customerId; }
    public void setCustomerId(String customerId) { this.customerId = customerId; }

    public double getTotal() { return total; }
    public void setTotal(double total) { this.total = total; }

    public LocalDateTime getDateTime() { return dateTime; }
    public void setDateTime(LocalDateTime dateTime) { this.dateTime = dateTime; }

    public List<BillItem> getItems() { return items; }
    public void setItems(List<BillItem> items) { this.items = items; }
}
