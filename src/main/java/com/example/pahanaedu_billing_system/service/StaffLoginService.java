package com.example.pahanaedu_billing_system.service;

import com.example.pahanaedu_billing_system.dao.StaffDAO;
import com.example.pahanaedu_billing_system.dto.StaffLoginDTO;
import com.example.pahanaedu_billing_system.mapper.StaffLoginMapper;
import com.example.pahana_edu_billing_system.model.Staff;

public class StaffLoginService {
    private final StaffDAO staffDAO = new StaffDAO();

    // Returns StaffLoginDTO if valid, else null
    public StaffLoginDTO validateStaff(String username, String password) {
        Staff staff = staffDAO.validateStaff(username, password);
        return StaffLoginMapper.toDTO(staff);
    }
}
