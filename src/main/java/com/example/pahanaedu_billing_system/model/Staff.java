package com.example.pahana_edu_billing_system.model;

public class Staff {
    private String staffid;
    private String name;
    private String address;
    private String mobilenumber;
    private String username;
    private String password;

    public Staff(String staffid, String name, String address, String mobilenumber, String username, String password) {
        this.staffid = staffid;
        this.name = name;
        this.address = address;
        this.mobilenumber = mobilenumber;
        this.username = username;
        this.password = password;
    }

    // ✅ Getters
    public String getStaffid() {
        return staffid;
    }

    public String getName() {
        return name;
    }

    public String getAddress() {
        return address;
    }

    public String getMobilenumber() {
        return mobilenumber;
    }

    public String getUsername() {
        return username;
    }

    public String getPassword() {
        return password;
    }

    // ✅ Setters
    public void setStaffid(String staffid) {
        this.staffid = staffid;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public void setMobilenumber(String mobilenumber) {
        this.mobilenumber = mobilenumber;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
