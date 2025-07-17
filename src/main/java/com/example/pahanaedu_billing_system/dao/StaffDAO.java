package com.example.pahanaedu_billing_system.dao;

import com.example.pahana_edu_billing_system.model.Staff;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class StaffDAO {
    private final String jdbcURL = "jdbc:mysql://localhost:3306/pahana_edu";
    private final String jdbcUsername = "root"; // ✅ Change if your username is different
    private final String jdbcPassword = ""; // ✅ Replace with your actual password

    private Connection getConnection() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");  // Explicitly load MySQL JDBC driver
        } catch (ClassNotFoundException e) {
            throw new SQLException("MySQL JDBC Driver not found!", e);
        }
        return DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
    }

    public String addStaff(Staff staff) {
        String sql = "INSERT INTO staff (staffid, name, address, mobilenumber, username, password) VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection conn = getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, staff.getStaffid());
            stmt.setString(2, staff.getName());
            stmt.setString(3, staff.getAddress());
            stmt.setString(4, staff.getMobilenumber());
            stmt.setString(5, staff.getUsername());
            stmt.setString(6, staff.getPassword());

            int rows = stmt.executeUpdate();
            return (rows > 0) ? "success" : "insert_failed";
        } catch (SQLException e) {
            // Return error message to the servlet to display properly
            return e.getMessage();
        }
    }

    // ✅ Validate staff login
    public Staff validateStaff(String username, String password) {
        String sql = "SELECT * FROM staff WHERE username=? AND password=?";
        try (Connection conn = getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, username);
            stmt.setString(2, password);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return new Staff(
                        rs.getString("staffid"),
                        rs.getString("name"),
                        rs.getString("address"),
                        rs.getString("mobilenumber"),
                        rs.getString("username"),
                        rs.getString("password")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }


    public List<Staff> getAllStaff() {
        List<Staff> staffList = new ArrayList<>();
        String sql = "SELECT * FROM staff";

        try (Connection conn = getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Staff staff = new Staff(
                        rs.getString("staffid"),
                        rs.getString("name"),
                        rs.getString("address"),
                        rs.getString("mobilenumber"),
                        rs.getString("username"),
                        rs.getString("password")
                );
                staffList.add(staff);

                // Debug print
                System.out.println("✅ Found staff: " + staff.getName());
            }

        } catch (SQLException e) {
            e.printStackTrace(); // check for DB connection issues
        }

        return staffList;
    }


    public void deleteStaffById(String staffid) {
        String sql = "DELETE FROM staff WHERE staffid = ?";
        try (Connection conn = getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, staffid);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }



    public boolean deleteStaff(String staffid) {
        String sql = "DELETE FROM staff WHERE staffid = ?";
        try (Connection conn = getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, staffid);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }




    public void updateStaff(Staff staff) {
        String sql = "UPDATE staff SET name=?, address=?, mobilenumber=?, username=?, password=? WHERE staffid=?";
        try (Connection conn = getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, staff.getName());
            stmt.setString(2, staff.getAddress());
            stmt.setString(3, staff.getMobilenumber());
            stmt.setString(4, staff.getUsername());
            stmt.setString(5, staff.getPassword());
            stmt.setString(6, staff.getStaffid());

            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }




}
