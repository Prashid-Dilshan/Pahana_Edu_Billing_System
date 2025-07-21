package com.example.pahanaedu_billing_system.dao;

import com.example.pahanaedu_billing_system.model.Book;
import java.sql.*;
import java.util.*;

public class BookDAO {
    private final String jdbcURL = "jdbc:mysql://localhost:3306/pahana_edu";
    private final String jdbcUsername = "root";
    private final String jdbcPassword = "";

    private Connection getConnection() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new SQLException("JDBC Driver not found", e);
        }
        return DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
    }

    /** ADD BOOK (binary photo) */
    public String addBook(Book book) {
        String sql = "INSERT INTO books (bookid, title, author, price, stockbookcount, bookphoto) VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection conn = getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, book.getBookid());
            stmt.setString(2, book.getTitle());
            stmt.setString(3, book.getAuthor());
            stmt.setDouble(4, book.getPrice());
            stmt.setInt(5, book.getStockbookcount());
            stmt.setBytes(6, book.getBookphoto()); // Store the image as bytes
            int rows = stmt.executeUpdate();
            return (rows > 0) ? "success" : "insert_failed";
        } catch (SQLException e) {
            return e.getMessage();
        }
    }

    /** GET ALL BOOKS */
    public List<Book> getAllBooks() {
        List<Book> books = new ArrayList<>();
        String sql = "SELECT * FROM books";
        try (Connection conn = getConnection(); PreparedStatement stmt = conn.prepareStatement(sql); ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                books.add(new Book(
                        rs.getString("bookid"),
                        rs.getString("title"),
                        rs.getString("author"),
                        rs.getDouble("price"),
                        rs.getInt("stockbookcount"),
                        rs.getBytes("bookphoto")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return books;
    }

    /** SEARCH BOOKS BY TITLE OR AUTHOR */
    public List<Book> searchBooksByTitleOrAuthor(String query) {
        List<Book> books = new ArrayList<>();
        String sql = "SELECT * FROM books WHERE title LIKE ? OR author LIKE ?";
        try (Connection conn = getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            String wildcard = "%" + query + "%";
            stmt.setString(1, wildcard);
            stmt.setString(2, wildcard);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                books.add(new Book(
                        rs.getString("bookid"),
                        rs.getString("title"),
                        rs.getString("author"),
                        rs.getDouble("price"),
                        rs.getInt("stockbookcount"),
                        rs.getBytes("bookphoto")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return books;
    }

    /** GET BOOK BY ID */
    public Book getBookById(String bookid) {
        String sql = "SELECT * FROM books WHERE bookid = ?";
        try (Connection conn = getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, bookid);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return new Book(
                        rs.getString("bookid"),
                        rs.getString("title"),
                        rs.getString("author"),
                        rs.getDouble("price"),
                        rs.getInt("stockbookcount"),
                        rs.getBytes("bookphoto")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    /** UPDATE BOOK */
    public boolean updateBook(Book book) {
        String sql = "UPDATE books SET title=?, author=?, price=?, stockbookcount=?, bookphoto=? WHERE bookid=?";
        try (Connection conn = getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, book.getTitle());
            stmt.setString(2, book.getAuthor());
            stmt.setDouble(3, book.getPrice());
            stmt.setInt(4, book.getStockbookcount());
            stmt.setBytes(5, book.getBookphoto());
            stmt.setString(6, book.getBookid());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    /** DELETE BOOK */
    public boolean deleteBook(String bookid) {
        String sql = "DELETE FROM books WHERE bookid = ?";
        try (Connection conn = getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, bookid);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}
