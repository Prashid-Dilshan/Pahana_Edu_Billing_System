package com.example.pahanaedu_billing_system.dto;

public class StaffSelectBooksDTO {
    private String bookid;
    private String title;
    private String author;
    private double price;
    private int stockbookcount;
    private byte[] bookphoto;

    public StaffSelectBooksDTO() {}

    public StaffSelectBooksDTO(String bookid, String title, String author,
                               double price, int stockbookcount, byte[] bookphoto) {
        this.bookid = bookid;
        this.title = title;
        this.author = author;
        this.price = price;
        this.stockbookcount = stockbookcount;
        this.bookphoto = bookphoto;
    }

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
