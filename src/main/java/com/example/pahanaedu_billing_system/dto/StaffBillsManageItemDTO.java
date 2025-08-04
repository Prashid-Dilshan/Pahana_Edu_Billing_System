package com.example.pahanaedu_billing_system.dto;

public class StaffBillsManageItemDTO {
    private String bookId;
    private String title; // Book title for display
    private int quantity;
    private double price;

    public StaffBillsManageItemDTO() {}

    public StaffBillsManageItemDTO(String bookId, String title, int quantity, double price) {
        this.bookId = bookId;
        this.title = title;
        this.quantity = quantity;
        this.price = price;
    }

    public String getBookId() { return bookId; }
    public void setBookId(String bookId) { this.bookId = bookId; }
    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }
    public int getQuantity() { return quantity; }
    public void setQuantity(int quantity) { this.quantity = quantity; }
    public double getPrice() { return price; }
    public void setPrice(double price) { this.price = price; }
}
