package com.example.pahanaedu_billing_system.model;

public class Book {
    private String bookid;
    private String title;
    private String author;
    private double price;
    private int stockbookcount;
    private byte[] bookphoto; // Actual photo data as byte array

    public Book(String bookid, String title, String author, double price, int stockbookcount, byte[] bookphoto) {
        this.bookid = bookid;
        this.title = title;
        this.author = author;
        this.price = price;
        this.stockbookcount = stockbookcount;
        this.bookphoto = bookphoto;
    }

    // Getters
    public String getBookid() { return bookid; }
    public String getTitle() { return title; }
    public String getAuthor() { return author; }
    public double getPrice() { return price; }
    public int getStockbookcount() { return stockbookcount; }
    public byte[] getBookphoto() { return bookphoto; }

    // Setters
    public void setBookid(String bookid) { this.bookid = bookid; }
    public void setTitle(String title) { this.title = title; }
    public void setAuthor(String author) { this.author = author; }
    public void setPrice(double price) { this.price = price; }
    public void setStockbookcount(int stockbookcount) { this.stockbookcount = stockbookcount; }
    public void setBookphoto(byte[] bookphoto) { this.bookphoto = bookphoto; }
}