package com.example.pahanaedu_billing_system.util;

import com.example.pahanaedu_billing_system.model.Bill;
import com.example.pahanaedu_billing_system.model.BillItem;
import com.lowagie.text.*;
import com.lowagie.text.pdf.*;

import java.io.OutputStream;
import java.awt.Color;

public class PDFGenerator {

    public static void generateBillPDF(Bill bill, OutputStream out) throws Exception {
        Document document = new Document();
        PdfWriter.getInstance(document, out);
        document.open();

        Font titleFont = FontFactory.getFont(FontFactory.HELVETICA_BOLD, 18, Color.BLUE);
        Font normalFont = FontFactory.getFont(FontFactory.HELVETICA, 12, Color.BLACK);

        // 🧾 Title
        Paragraph title = new Paragraph("🧾 Pahana Edu Bookshop - Bill #" + bill.getBillId(), titleFont);
        title.setAlignment(Element.ALIGN_CENTER);
        document.add(title);
        document.add(new Paragraph(" ")); // Spacer

        // 📄 Customer & Bill Info
        document.add(new Paragraph("👤 Customer ID: " + bill.getCustomerId(), normalFont));
        document.add(new Paragraph("📅 Date: " + bill.getDateTime().toString(), normalFont));
        document.add(new Paragraph("💰 Total Amount: Rs. " + String.format("%.2f", bill.getTotal()), normalFont));
        document.add(new Paragraph(" "));

        // 🧾 Table with Book Details
        PdfPTable table = new PdfPTable(4); // Columns: Book ID | Qty | Price | Subtotal
        table.setWidthPercentage(100);

        // Add table headers
        table.addCell("📘 Book ID");
        table.addCell("📦 Quantity");
        table.addCell("💵 Price");
        table.addCell("🧮 Subtotal");

        for (BillItem item : bill.getItems()) {
            table.addCell(item.getBookId());
            table.addCell(String.valueOf(item.getQuantity()));
            table.addCell("Rs. " + item.getPrice());
            table.addCell("Rs. " + (item.getPrice() * item.getQuantity()));
        }

        document.add(table);
        document.add(new Paragraph(" "));
        document.add(new Paragraph("🙏 Thank you for shopping with us!", normalFont));

        document.close();
    }
}
