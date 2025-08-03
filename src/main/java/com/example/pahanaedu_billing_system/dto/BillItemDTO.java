package com.example.pahanaedu_billing_system.dto;

public class BillItemDTO {
    private int billId;
    private String bookId;
    private double price;
    private int quantity;
    private BookDTO book; // For display (optional)

    // Getters and Setters
    public int getBillId() { return billId; }
    public void setBillId(int billId) { this.billId = billId; }

    public String getBookId() { return bookId; }
    public void setBookId(String bookId) { this.bookId = bookId; }

    public double getPrice() { return price; }
    public void setPrice(double price) { this.price = price; }

    public int getQuantity() { return quantity; }
    public void setQuantity(int quantity) { this.quantity = quantity; }

    public BookDTO getBook() { return book; }
    public void setBook(BookDTO book) { this.book = book; }
}
