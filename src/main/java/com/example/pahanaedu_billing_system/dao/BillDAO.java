package com.example.pahanaedu_billing_system.dao;


import com.example.pahanaedu_billing_system.model.Bill;
import com.example.pahanaedu_billing_system.model.BillItem;

import java.sql.*;
import java.util.List;

public class BillDAO {
    private final String jdbcURL = "jdbc:mysql://localhost:3306/pahana_edu";
    private final String jdbcUsername = "root";
    private final String jdbcPassword = "";

    private Connection getConnection() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new SQLException("Driver not found", e);
        }
        return DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
    }

    public boolean saveBill(Bill bill) {
        String insertBill = "INSERT INTO bills (customerid, total_amount, bill_date) VALUES (?, ?, ?)";
        String insertItem = "INSERT INTO bill_items (bill_id, book_id, quantity, price) VALUES (?, ?, ?, ?)";

        try (Connection conn = getConnection()) {
            conn.setAutoCommit(false);

            try (PreparedStatement psBill = conn.prepareStatement(insertBill, Statement.RETURN_GENERATED_KEYS)) {
                psBill.setString(1, bill.getCustomerId());
                psBill.setDouble(2, bill.getTotal());
                psBill.setTimestamp(3, Timestamp.valueOf(bill.getDateTime()));
                psBill.executeUpdate();

                ResultSet rs = psBill.getGeneratedKeys();
                if (rs.next()) {
                    int billId = rs.getInt(1);

                    for (BillItem item : bill.getItems()) {
                        try (PreparedStatement psItem = conn.prepareStatement(insertItem)) {
                            psItem.setInt(1, billId);
                            psItem.setString(2, item.getBookId()); // ✅ fixed here
                            psItem.setInt(3, item.getQuantity());
                            psItem.setDouble(4, item.getPrice());
                            psItem.executeUpdate();
                        }
                    }


                    conn.commit();
                    return true;
                }
            } catch (SQLException ex) {
                conn.rollback();
                ex.printStackTrace();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }
}


