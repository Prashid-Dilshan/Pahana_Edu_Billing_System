package com.example.pahanaedu_billing_system.dto;

public class StaffBillsManageCustomerDTO {
    private int customerid;
    private String name;
    private String address;
    private String phonenumber;
    private String email;

    public StaffBillsManageCustomerDTO() {}

    public StaffBillsManageCustomerDTO(int customerid, String name, String address, String phonenumber, String email) {
        this.customerid = customerid;
        this.name = name;
        this.address = address;
        this.phonenumber = phonenumber;
        this.email = email;
    }

    public int getCustomerid() { return customerid; }
    public void setCustomerid(int customerid) { this.customerid = customerid; }
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    public String getAddress() { return address; }
    public void setAddress(String address) { this.address = address; }
    public String getPhonenumber() { return phonenumber; }
    public void setPhonenumber(String phonenumber) { this.phonenumber = phonenumber; }
    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }
}
