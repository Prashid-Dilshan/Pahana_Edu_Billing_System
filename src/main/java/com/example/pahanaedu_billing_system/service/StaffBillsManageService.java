package com.example.pahanaedu_billing_system.service;

import com.example.pahanaedu_billing_system.dao.BillDAO;
import com.example.pahanaedu_billing_system.dao.BookDAO;
import com.example.pahanaedu_billing_system.dto.StaffBillsManageDTO;
import com.example.pahanaedu_billing_system.mapper.StaffBillsManageMapper;
import com.example.pahanaedu_billing_system.model.Bill;
import com.example.pahanaedu_billing_system.model.Book;

import java.util.List;
import java.util.stream.Collectors;

public class StaffBillsManageService {
    private final BillDAO billDAO = new BillDAO();
    private final BookDAO bookDAO = new BookDAO();

    public List<StaffBillsManageDTO> getAllBills() {
        List<Bill> bills = billDAO.getAllBills();
        List<Book> allBooks = bookDAO.getAllBooks();
        return bills.stream()
                .map(bill -> StaffBillsManageMapper.toBillDTO(bill, allBooks))
                .collect(Collectors.toList());
    }

    public StaffBillsManageDTO getBillById(int billId) {
        Bill bill = billDAO.getBillById(billId);
        List<Book> allBooks = bookDAO.getAllBooks();
        return StaffBillsManageMapper.toBillDTO(bill, allBooks);
    }

    public boolean deleteBillById(int billId) {
        return billDAO.deleteBillById(billId);
    }
}
