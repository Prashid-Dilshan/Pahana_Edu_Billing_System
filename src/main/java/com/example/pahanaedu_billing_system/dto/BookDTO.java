package com.example.pahanaedu_billing_system.dto;

public class BookDTO {
    private String bookid;
    private String title;
    private String author;
    private double price;
    private int stockbookcount;
    private byte[] bookphoto;

    public BookDTO() {}

    public String getBookid() { return bookid; }
    public void setBookid(String bookid) { this.bookid = bookid; }
    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }
    public String getAuthor() { return author; }
    public void setAuthor(String author) { this.author = author; }
    public double getPrice() { return price; }
    public void setPrice(double price) { this.price = price; }
    public int getStockbookcount() { return stockbookcount; }
    public void setStockbookcount(int stockbookcount) { this.stockbookcount = stockbookcount; }
    public byte[] getBookphoto() { return bookphoto; }
    public void setBookphoto(byte[] bookphoto) { this.bookphoto = bookphoto; }
}
