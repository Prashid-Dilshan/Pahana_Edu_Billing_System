package com.example.pahanaedu_billing_system.mapper;

import com.example.pahana_edu_billing_system.model.Staff;
import com.example.pahanaedu_billing_system.dto.AdminManageStaffDTO;

public class AdminManageStaffMapper {
    public static AdminManageStaffDTO toDTO(Staff staff) {
        if (staff == null) return null;
        return new AdminManageStaffDTO(
                staff.getStaffid(), staff.getName(), staff.getAddress(),
                staff.getMobilenumber(), staff.getUsername(), staff.getPassword()
        );
    }

    public static Staff toEntity(AdminManageStaffDTO dto) {
        if (dto == null) return null;
        return new Staff(
                dto.getStaffid(), dto.getName(), dto.getAddress(),
                dto.getMobilenumber(), dto.getUsername(), dto.getPassword()
        );
    }
}
