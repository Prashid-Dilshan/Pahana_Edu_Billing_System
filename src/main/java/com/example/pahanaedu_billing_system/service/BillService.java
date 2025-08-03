package com.example.pahanaedu_billing_system.service;

import com.example.pahanaedu_billing_system.dao.BillDAO;
import com.example.pahanaedu_billing_system.dto.BillDTO;
import com.example.pahanaedu_billing_system.mapper.BillMapper;
import com.example.pahanaedu_billing_system.model.Bill;
import java.util.List;
import java.util.stream.Collectors;

public class BillService {
    private final BillDAO billDAO = new BillDAO();

    public List<BillDTO> getAllBills() {
        List<Bill> bills = billDAO.getAllBills();
        return bills.stream()
                .map(BillMapper::toDTO)
                .collect(Collectors.toList());
    }

    public BillDTO getBillById(int billId) {
        Bill bill = billDAO.getBillById(billId);
        return BillMapper.toDTO(bill);
    }

    public boolean deleteBillById(int billId) {
        return billDAO.deleteBillById(billId);
    }

    public boolean saveBill(BillDTO billDTO) {
        Bill bill = BillMapper.toEntity(billDTO);
        return billDAO.saveBill(bill);
    }
}
