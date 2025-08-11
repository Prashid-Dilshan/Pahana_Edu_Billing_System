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

    public boolean isUsernameValid(String username) {
        // Check if username exists using DAO
        Staff staff = staffDAO.findStaffByUsername(username); // Assumes you added this method to DAO
        return staff != null;
    }

    public boolean isPasswordValid(String username, String password) {
        // Assume username is valid, check full validation (which includes password)
        Staff staff = staffDAO.validateStaff(username, password);
        return staff != null;
    }
}
