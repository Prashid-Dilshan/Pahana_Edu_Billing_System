package com.example.pahanaedu_billing_system.dao;

import com.example.pahanaedu_billing_system.model.Bill;
import com.example.pahanaedu_billing_system.model.BillItem;
import com.example.pahanaedu_billing_system.model.Customer;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BillDAO {
    private final String jdbcURL = "jdbc:mysql://localhost:3306/pahana_edu";
    private final String jdbcUsername = "root";
    private final String jdbcPassword = "";

    private Connection getConnection() throws SQLException {
        try { Class.forName("com.mysql.cj.jdbc.Driver"); }
        catch (ClassNotFoundException e) { throw new SQLException("MySQL Driver not found", e); }
        return DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
    }

    public boolean saveBill(Bill bill) {
        String insertBill = "INSERT INTO bills (customerid, total, billdate) VALUES (?, ?, ?)";
        String insertItem = "INSERT INTO bill_items (billid, bookid, quantity, price) VALUES (?, ?, ?, ?)";

        try (Connection conn = getConnection()) {
            conn.setAutoCommit(false);
            try (PreparedStatement psBill = conn.prepareStatement(insertBill, Statement.RETURN_GENERATED_KEYS)) {
                psBill.setInt(1, bill.getCustomerId());
                psBill.setDouble(2, bill.getTotal());
                psBill.setTimestamp(3, Timestamp.valueOf(bill.getDateTime()));
                psBill.executeUpdate();

                ResultSet rs = psBill.getGeneratedKeys();
                if (rs.next()) {
                    int billId = rs.getInt(1);
                    for (BillItem item : bill.getItems()) {
                        try (PreparedStatement psItem = conn.prepareStatement(insertItem)) {
                            psItem.setInt(1, billId);
                            psItem.setString(2, item.getBookId());
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

    public List<Bill> getAllBills() {
        List<Bill> bills = new ArrayList<>();
        String sql = """
            SELECT b.billid, b.customerid, b.total, b.billdate, c.name, c.phonenumber
            FROM bills b
            JOIN customer c ON b.customerid = c.customerid
            ORDER BY b.billid DESC
        """;
        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                Bill bill = new Bill();
                bill.setBillId(rs.getInt("billid"));
                bill.setCustomerId(rs.getInt("customerid"));
                bill.setDateTime(rs.getTimestamp("billdate").toLocalDateTime());
                bill.setTotal(rs.getDouble("total"));
                Customer customer = new Customer();
                customer.setCustomerid(rs.getInt("customerid"));
                customer.setName(rs.getString("name"));
                customer.setPhonenumber(rs.getString("phonenumber"));
                bill.setCustomer(customer);
                bills.add(bill);
            }
        } catch (SQLException e) { e.printStackTrace(); }
        return bills;
    }

    public Bill getBillById(int billId) {
        String billSql = "SELECT * FROM bills WHERE billid = ?";
        String itemSql = "SELECT * FROM bill_items WHERE billid = ?";
        Bill bill = null;

        try (Connection conn = getConnection()) {
            try (PreparedStatement ps = conn.prepareStatement(billSql)) {
                ps.setInt(1, billId);
                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
                    bill = new Bill();
                    bill.setBillId(rs.getInt("billid"));
                    bill.setCustomerId(rs.getInt("customerid"));
                    bill.setDateTime(rs.getTimestamp("billdate").toLocalDateTime());
                    bill.setTotal(rs.getDouble("total"));
                    List<BillItem> items = new ArrayList<>();
                    try (PreparedStatement psItems = conn.prepareStatement(itemSql)) {
                        psItems.setInt(1, billId);
                        ResultSet rsItems = psItems.executeQuery();
                        while (rsItems.next()) {
                            BillItem item = new BillItem();
                            item.setBookId(rsItems.getString("bookid"));
                            item.setQuantity(rsItems.getInt("quantity"));
                            item.setPrice(rsItems.getDouble("price"));
                            items.add(item);
                        }
                    }
                    bill.setItems(items);
                }
            }
        } catch (SQLException e) { e.printStackTrace(); }
        return bill;
    }

    public boolean deleteBillById(int billId) {
        String deleteItemsSql = "DELETE FROM bill_items WHERE billid = ?";
        String deleteBillSql = "DELETE FROM bills WHERE billid = ?";
        try (Connection conn = getConnection()) {
            conn.setAutoCommit(false);
            try (PreparedStatement psItems = conn.prepareStatement(deleteItemsSql);
                 PreparedStatement psBill = conn.prepareStatement(deleteBillSql)) {
                psItems.setInt(1, billId);
                psItems.executeUpdate();
                psBill.setInt(1, billId);
                int affectedRows = psBill.executeUpdate();
                conn.commit();
                return affectedRows > 0;
            } catch (SQLException ex) {
                conn.rollback();
                ex.printStackTrace();
            }
        } catch (SQLException e) { e.printStackTrace(); }
        return false;
    }
}
