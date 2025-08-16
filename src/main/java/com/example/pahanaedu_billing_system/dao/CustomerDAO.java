package com.example.pahanaedu_billing_system.dao;

import com.example.pahanaedu_billing_system.model.Customer;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CustomerDAO {
    private final String jdbcURL = "jdbc:mysql://localhost:3306/pahana_edu"; // Your DB URL
    private final String jdbcUsername = "root"; // Your DB username
    private final String jdbcPassword = ""; // Your DB password

    // DB Connection helper
    private Connection getConnection() throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
    }

    // 1. Add new customer
    public boolean addCustomer(Customer customer) {
        String sql = "INSERT INTO customer (name, address, phonenumber, email) VALUES (?, ?, ?, ?)";
        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, customer.getName());
            stmt.setString(2, customer.getAddress());
            stmt.setString(3, customer.getPhonenumber());
            stmt.setString(4, customer.getEmail());

            return stmt.executeUpdate() > 0;
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return false;
    }

    // 2. List all customers
    public List<Customer> getAllCustomers() {
        List<Customer> customers = new ArrayList<>();
        String sql = "SELECT * FROM customer";

        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Customer customer = new Customer();
                customer.setCustomerid(rs.getInt("customerid"));
                customer.setName(rs.getString("name"));
                customer.setAddress(rs.getString("address"));
                customer.setPhonenumber(rs.getString("phonenumber"));
                customer.setEmail(rs.getString("email"));
                customers.add(customer);
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return customers;
    }

    // 3. Get customer by ID (for edit)
    public Customer getCustomerById(int customerid) {
        String sql = "SELECT * FROM customer WHERE customerid = ?";
        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, customerid);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                Customer customer = new Customer();
                customer.setCustomerid(rs.getInt("customerid"));
                customer.setName(rs.getString("name"));
                customer.setAddress(rs.getString("address"));
                customer.setPhonenumber(rs.getString("phonenumber"));
                customer.setEmail(rs.getString("email"));
                return customer;
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return null;
    }

    // 4. Update customer
    public boolean updateCustomer(Customer customer) {
        String sql = "UPDATE customer SET name=?, address=?, phonenumber=?, email=? WHERE customerid=?";
        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, customer.getName());
            stmt.setString(2, customer.getAddress());
            stmt.setString(3, customer.getPhonenumber());
            stmt.setString(4, customer.getEmail());
            stmt.setInt(5, customer.getCustomerid());

            return stmt.executeUpdate() > 0;
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return false;
    }

    // 5. Delete customer with auto-reset if table becomes empty
    public boolean deleteCustomer(int customerid) {
        String deleteSql = "DELETE FROM customer WHERE customerid = ?";
        String countSql = "SELECT COUNT(*) FROM customer";
        String resetSql = "ALTER TABLE customer AUTO_INCREMENT = 1";

        try (Connection conn = getConnection()) {
            // Start transaction for safety
            conn.setAutoCommit(false);

            // Delete the customer
            try (PreparedStatement pstmtDelete = conn.prepareStatement(deleteSql)) {
                pstmtDelete.setInt(1, customerid);
                int rowsAffected = pstmtDelete.executeUpdate();
                if (rowsAffected == 0) {
                    conn.rollback();
                    return false;  // No customer found to delete
                }
            }

            // Check if table is now empty
            try (PreparedStatement pstmtCount = conn.prepareStatement(countSql);
                 ResultSet rs = pstmtCount.executeQuery()) {
                if (rs.next() && rs.getInt(1) == 0) {
                    // Table is empty – reset auto-increment to 1
                    try (PreparedStatement pstmtReset = conn.prepareStatement(resetSql)) {
                        pstmtReset.executeUpdate();
                    }
                }
            }

            conn.commit();
            return true;
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            try (Connection conn = getConnection()) {
                conn.rollback();
            } catch (SQLException | ClassNotFoundException ex) {
                ex.printStackTrace();
            }
            return false;
        }
    }

    // 6. Search customers by name
    public List<Customer> searchCustomersByName(String name) {
        List<Customer> customers = new ArrayList<>();
        String sql = "SELECT * FROM customer WHERE name LIKE ?";
        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, "%" + name + "%");
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Customer customer = new Customer();
                customer.setCustomerid(rs.getInt("customerid"));
                customer.setName(rs.getString("name"));
                customer.setAddress(rs.getString("address"));
                customer.setPhonenumber(rs.getString("phonenumber"));
                customer.setEmail(rs.getString("email"));
                customers.add(customer);
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return customers;
    }
}
