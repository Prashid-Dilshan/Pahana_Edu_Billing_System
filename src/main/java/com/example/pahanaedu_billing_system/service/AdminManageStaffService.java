package com.example.pahanaedu_billing_system.service;

import com.example.pahanaedu_billing_system.dao.AdminManageStaffDAO;
import com.example.pahanaedu_billing_system.dto.AdminManageStaffDTO;
import com.example.pahanaedu_billing_system.mapper.AdminManageStaffMapper;
import com.example.pahana_edu_billing_system.model.Staff;

import java.util.List;
import java.util.stream.Collectors;

public class AdminManageStaffService {
    private final AdminManageStaffDAO staffDAO = new AdminManageStaffDAO();

    public List<AdminManageStaffDTO> getAllStaff() {
        List<Staff> staffList = staffDAO.getAllStaff();
        return staffList.stream().map(AdminManageStaffMapper::toDTO).collect(Collectors.toList());
    }

    public AdminManageStaffDTO getStaffById(String staffid) {
        return AdminManageStaffMapper.toDTO(staffDAO.getStaffById(staffid));
    }

    public boolean addStaff(AdminManageStaffDTO staffDTO) {
        Staff staff = AdminManageStaffMapper.toEntity(staffDTO);
        String result = staffDAO.addStaff(staff);
        return "success".equals(result);
    }

    public boolean updateStaff(AdminManageStaffDTO staffDTO) {
        Staff staff = AdminManageStaffMapper.toEntity(staffDTO);
        return staffDAO.updateStaff(staff);
    }

    public boolean deleteStaff(String staffid) {
        return staffDAO.deleteStaff(staffid);
    }
}
