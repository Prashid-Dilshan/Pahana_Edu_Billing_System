package com.example.pahanaedu_billing_system.dto;

public class AdminManageStaffDTO {
    private String staffid, name, address, mobilenumber, username, password;

    public AdminManageStaffDTO() {}
    public AdminManageStaffDTO(String staffid, String name, String address, String mobilenumber, String username, String password) {
        this.staffid = staffid; this.name = name; this.address = address;
        this.mobilenumber = mobilenumber; this.username = username; this.password = password;
    }
    public String getStaffid() { return staffid; }
    public void setStaffid(String staffid) { this.staffid = staffid; }
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    public String getAddress() { return address; }
    public void setAddress(String address) { this.address = address; }
    public String getMobilenumber() { return mobilenumber; }
    public void setMobilenumber(String mobilenumber) { this.mobilenumber = mobilenumber; }
    public String getUsername() { return username; }
    public void setUsername(String username) { this.username = username; }
    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }
}
