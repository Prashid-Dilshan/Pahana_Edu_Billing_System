package com.example.pahanaedu_billing_system.dto;

public class StaffCartManageDTO {
    private String bookId;
    private String title;
    private double price;
    private int quantity;

    public StaffCartManageDTO() {}

    public StaffCartManageDTO(String bookId, String title, double price, int quantity) {
        this.bookId = bookId;
        this.title = title;
        this.price = price;
        this.quantity = quantity;
    }

    public String getBookId() { return bookId; }
    public void setBookId(String bookId) { this.bookId = bookId; }

    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }

    public double getPrice() { return price; }
    public void setPrice(double price) { this.price = price; }

    public int getQuantity() { return quantity; }
    public void setQuantity(int quantity) { this.quantity = quantity; }

    public double getTotalPrice() { return price * quantity; }
}
