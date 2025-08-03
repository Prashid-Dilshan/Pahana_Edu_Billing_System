package com.example.pahanaedu_billing_system.dao;

import com.example.pahana_edu_billing_system.model.Staff;
import java.sql.*;
import java.util.*;

public class AdminManageStaffDAO {
    private final String jdbcURL = "jdbc:mysql://localhost:3306/pahana_edu";
    private final String jdbcUsername = "root";
    private final String jdbcPassword = "";

    private Connection getConnection() throws SQLException {
        try { Class.forName("com.mysql.cj.jdbc.Driver"); }
        catch (ClassNotFoundException e) { throw new SQLException("Driver not found", e);}
        return DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
    }

    public Staff getStaffById(String staffid) {
        String sql = "SELECT * FROM staff WHERE staffid=?";
        try (Connection c = getConnection(); PreparedStatement s = c.prepareStatement(sql)) {
            s.setString(1, staffid); ResultSet rs = s.executeQuery();
            if (rs.next()) {
                return new Staff(rs.getString("staffid"), rs.getString("name"), rs.getString("address"),
                        rs.getString("mobilenumber"), rs.getString("username"), rs.getString("password"));
            }
        } catch (SQLException e) { e.printStackTrace(); }
        return null;
    }

    public List<Staff> getAllStaff() {
        List<Staff> list = new ArrayList<>();
        String sql = "SELECT * FROM staff";
        try (Connection c = getConnection(); PreparedStatement s = c.prepareStatement(sql)) {
            ResultSet rs = s.executeQuery();
            while (rs.next()) {
                list.add(new Staff(rs.getString("staffid"), rs.getString("name"), rs.getString("address"),
                        rs.getString("mobilenumber"), rs.getString("username"), rs.getString("password")));
            }
        } catch (SQLException e) { e.printStackTrace(); }
        return list;
    }

    public String addStaff(Staff staff) {
        String sql = "INSERT INTO staff (staffid, name, address, mobilenumber, username, password) VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection c = getConnection(); PreparedStatement s = c.prepareStatement(sql)) {
            s.setString(1, staff.getStaffid());
            s.setString(2, staff.getName());
            s.setString(3, staff.getAddress());
            s.setString(4, staff.getMobilenumber());
            s.setString(5, staff.getUsername());
            s.setString(6, staff.getPassword());
            return (s.executeUpdate() > 0) ? "success" : "insert_failed";
        } catch (SQLException e) { return e.getMessage(); }
    }

    public boolean deleteStaff(String staffid) {
        String sql = "DELETE FROM staff WHERE staffid=?";
        try (Connection c = getConnection(); PreparedStatement s = c.prepareStatement(sql)) {
            s.setString(1, staffid);
            return s.executeUpdate() > 0;
        } catch (SQLException e) { e.printStackTrace(); return false;}
    }

    public boolean updateStaff(Staff staff) {
        String sql = "UPDATE staff SET name=?, address=?, mobilenumber=?, username=?, password=? WHERE staffid=?";
        try (Connection c = getConnection(); PreparedStatement s = c.prepareStatement(sql)) {
            s.setString(1, staff.getName());
            s.setString(2, staff.getAddress());
            s.setString(3, staff.getMobilenumber());
            s.setString(4, staff.getUsername());
            s.setString(5, staff.getPassword());
            s.setString(6, staff.getStaffid());
            return s.executeUpdate() > 0;
        } catch (SQLException e) { e.printStackTrace(); return false;}
    }
}
