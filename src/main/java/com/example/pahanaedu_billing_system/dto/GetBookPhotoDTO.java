package com.example.pahanaedu_billing_system.dto;

public class GetBookPhotoDTO {
    private String bookid;
    private byte[] bookphoto;

    public GetBookPhotoDTO() {}

    public GetBookPhotoDTO(String bookid, byte[] bookphoto) {
        this.bookid = bookid;
        this.bookphoto = bookphoto;
    }

    public String getBookid() { return bookid; }
    public void setBookid(String bookid) { this.bookid = bookid; }
    public byte[] getBookphoto() { return bookphoto; }
    public void setBookphoto(byte[] bookphoto) { this.bookphoto = bookphoto; }
}
