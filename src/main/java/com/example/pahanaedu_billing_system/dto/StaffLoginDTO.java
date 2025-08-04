package com.example.pahanaedu_billing_system.dto;

public class StaffLoginDTO {
    private String staffid;
    private String name;
    private String username;

    public StaffLoginDTO() {}

    public StaffLoginDTO(String staffid, String name, String username) {
        this.staffid = staffid;
        this.name = name;
        this.username = username;
    }

    public String getStaffid() { return staffid; }
    public void setStaffid(String staffid) { this.staffid = staffid; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getUsername() { return username; }
    public void setUsername(String username) { this.username = username; }
}
