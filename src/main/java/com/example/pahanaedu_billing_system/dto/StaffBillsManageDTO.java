package com.example.pahanaedu_billing_system.dto;

import java.time.LocalDateTime;
import java.util.List;

public class StaffBillsManageDTO {
    private int billId;
    private StaffBillsManageCustomerDTO customer;
    private double total;
    private LocalDateTime dateTime;
    private List<StaffBillsManageItemDTO> items;

    public StaffBillsManageDTO() {}

    public StaffBillsManageDTO(int billId, StaffBillsManageCustomerDTO customer, double total, LocalDateTime dateTime, List<StaffBillsManageItemDTO> items) {
        this.billId = billId;
        this.customer = customer;
        this.total = total;
        this.dateTime = dateTime;
        this.items = items;
    }

    public int getBillId() { return billId; }
    public void setBillId(int billId) { this.billId = billId; }

    public StaffBillsManageCustomerDTO getCustomer() { return customer; }
    public void setCustomer(StaffBillsManageCustomerDTO customer) { this.customer = customer; }

    public double getTotal() { return total; }
    public void setTotal(double total) { this.total = total; }

    public LocalDateTime getDateTime() { return dateTime; }
    public void setDateTime(LocalDateTime dateTime) { this.dateTime = dateTime; }

    public List<StaffBillsManageItemDTO> getItems() { return items; }
    public void setItems(List<StaffBillsManageItemDTO> items) { this.items = items; }
}
