package com.example.pahanaedu_billing_system.mapper;

import com.example.pahanaedu_billing_system.dto.StaffLoginDTO;
import com.example.pahana_edu_billing_system.model.Staff;

public class StaffLoginMapper {
    public static StaffLoginDTO toDTO(Staff staff) {
        if (staff == null) return null;
        return new StaffLoginDTO(
                staff.getStaffid(),
                staff.getName(),
                staff.getUsername()
        );
    }

    public static Staff toEntity(StaffLoginDTO dto, String password) {
        if (dto == null) return null;
        return new Staff(
                dto.getStaffid(),
                dto.getName(),
                "",         // address - not needed here
                "",         // mobilenumber - not needed here
                dto.getUsername(),
                password    // only used for login, do not keep password in DTO
        );
    }
}
