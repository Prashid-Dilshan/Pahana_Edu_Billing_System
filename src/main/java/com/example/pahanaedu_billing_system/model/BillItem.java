package com.example.pahanaedu_billing_system.model;

public class BillItem {
    private int billId;
    private String bookId; // ✅ use String to match bookId in books table
    private double price;
    private int quantity;

    public int getBillId() { return billId; }
    public void setBillId(int billId) { this.billId = billId; }

    public String getBookId() { return bookId; }
    public void setBookId(String bookId) { this.bookId = bookId; }

    public double getPrice() { return price; }
    public void setPrice(double price) { this.price = price; }

    public int getQuantity() { return quantity; }
    public void setQuantity(int quantity) { this.quantity = quantity; }
}
