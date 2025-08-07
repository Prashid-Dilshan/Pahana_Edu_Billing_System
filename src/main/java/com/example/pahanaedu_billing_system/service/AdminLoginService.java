package com.example.pahanaedu_billing_system.service;

import com.example.pahanaedu_billing_system.dto.AdminLoginDTO;

public class AdminLoginService {
    private static final String ADMIN_USERNAME = "admin";
    private static final String ADMIN_PASSWORD = "12345";

    public boolean loginCheck(AdminLoginDTO credentials) {
        if (!ADMIN_USERNAME.equals(credentials.getUsername())) {
            return false;
        }
        if (!ADMIN_PASSWORD.equals(credentials.getPassword())) {
            return false;
        }
        return true;
    }
}
