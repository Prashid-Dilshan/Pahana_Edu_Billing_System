// ✅ DownloadPDFServlet.java - Generate PDF from session bill using OpenPDF
package com.example.pahanaedu_billing_system.controller;

import com.example.pahanaedu_billing_system.model.*;
import com.lowagie.text.*;
import com.lowagie.text.pdf.*;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.io.OutputStream;
import java.time.format.DateTimeFormatter;
import java.util.List;

@WebServlet("/DownloadPDFServlet")
public class DownloadPDFServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        Bill bill = (Bill) session.getAttribute("generatedBill");

        if (bill == null) {
            response.getWriter().println("⚠️ Error: No bill found to generate PDF.");
            return;
        }

        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "attachment; filename=Bill_" + bill.getBillId() + ".pdf");

        try {
            OutputStream out = response.getOutputStream();
            Document document = new Document();
            PdfWriter.getInstance(document, out);
            document.open();

            Font titleFont = new Font(Font.HELVETICA, 18, Font.BOLD);
            Font normalFont = new Font(Font.HELVETICA, 12);

            document.add(new Paragraph("Pahana Edu Bookshop - Bill", titleFont));
            document.add(new Paragraph("\n"));

            Customer c = bill.getCustomer();
            if (c != null) {
                document.add(new Paragraph("Customer ID: " + c.getCustomerid(), normalFont));
                document.add(new Paragraph("Name: " + c.getName(), normalFont));
                document.add(new Paragraph("Phone: " + c.getPhonenumber(), normalFont));
                document.add(new Paragraph("Address: " + c.getAddress(), normalFont));
                document.add(new Paragraph("Email: " + c.getEmail(), normalFont));
                document.add(new Paragraph("\n"));
            }

            document.add(new Paragraph("Bill ID: " + bill.getBillId(), normalFont));
            document.add(new Paragraph("Date: " + bill.getDateTime().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm")), normalFont));
            document.add(new Paragraph("\n"));

            PdfPTable table = new PdfPTable(5);
            table.setWidthPercentage(100);
            table.addCell("Book ID");
            table.addCell("Title");
            table.addCell("Qty");
            table.addCell("Price");
            table.addCell("Total");

            for (BillItem item : bill.getItems()) {
                String bookId = item.getBookId();
                String title = "N/A";
                if (item.getBook() != null && item.getBook().getTitle() != null) {
                    title = item.getBook().getTitle();
                }

                table.addCell(bookId);
                table.addCell(title);
                table.addCell(String.valueOf(item.getQuantity()));
                table.addCell("Rs. " + String.format("%.2f", item.getPrice()));
                table.addCell("Rs. " + String.format("%.2f", item.getQuantity() * item.getPrice()));
            }

            document.add(table);

            document.add(new Paragraph("\nTotal Amount: Rs. " + String.format("%.2f", bill.getTotal()), titleFont));

            document.close();
            out.close();

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("⚠️ PDF generation failed: " + e.getMessage());
        }
    }
}
