package com.example.pahanaedu_billing_system.controller;

import com.example.pahanaedu_billing_system.model.*;
import com.lowagie.text.*;
import com.lowagie.text.pdf.*;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.awt.Color;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.InputStream;
import java.time.format.DateTimeFormatter;

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
            Document document = new Document(PageSize.A4, 44, 44, 36, 48);
            PdfWriter.getInstance(document, out);
            document.open();

            DateTimeFormatter dtfFull = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
            DateTimeFormatter dtfShort = DateTimeFormatter.ofPattern("yyyy-MM-dd");

            // --- Header: Logo (left), Customer Info (left below logo), Shop Info (right) ---
            PdfPTable headerTable = new PdfPTable(2);
            headerTable.setWidthPercentage(100f);
            headerTable.setWidths(new float[]{2.2f, 2.8f});
            headerTable.getDefaultCell().setBorder(PdfPCell.NO_BORDER);

            // -- LEFT CELL: Logo on Top, Customer Info Below --
            PdfPCell leftCell = new PdfPCell();
            leftCell.setBorder(PdfPCell.NO_BORDER);

            // Logo
            String logoPath = getServletContext().getRealPath("/assets/logo.png");
            try (InputStream imgStream = new FileInputStream(logoPath)) {
                Image logo = Image.getInstance(imgStream.readAllBytes());
                logo.scaleToFit(75, 75);
                logo.setAlignment(Element.ALIGN_LEFT);
                leftCell.addElement(logo);
            } catch (Exception e) {
                // If logo missing, skip
            }

            leftCell.addElement(new Paragraph(" ")); // spacing

            // Customer Info (Left, below logo)
            Customer c = bill.getCustomer();
            Font labelFont = new Font(Font.HELVETICA, 10, Font.BOLD, new Color(37, 99, 235));
            Font valueFont = new Font(Font.HELVETICA, 10, Font.NORMAL, new Color(17, 24, 39));
            Phrase customerDetails = new Phrase();
            customerDetails.add(new Chunk("Billed To:\n", labelFont));
            if (c != null) {
                customerDetails.add(new Chunk("Name: " + c.getName() + "\n", valueFont));
                customerDetails.add(new Chunk("Phone: " + c.getPhonenumber() + "\n", valueFont));
                customerDetails.add(new Chunk("Email: " + c.getEmail() + "\n", valueFont));
                customerDetails.add(new Chunk("Address: " + c.getAddress(), valueFont));
            } else {
                customerDetails.add(new Chunk("Customer Info Not Available", valueFont));
            }
            Paragraph customerPara = new Paragraph(customerDetails);
            customerPara.setSpacingBefore(10f);
            leftCell.addElement(customerPara);

            headerTable.addCell(leftCell);

            // -- RIGHT CELL: Shop Details, invoice info --
            PdfPCell infoCell = new PdfPCell();
            infoCell.setBorder(PdfPCell.NO_BORDER);
            infoCell.setHorizontalAlignment(Element.ALIGN_RIGHT);

            Font shopFont = new Font(Font.HELVETICA, 18, Font.BOLD, new Color(29, 78, 216));
            Font taglineFont = new Font(Font.HELVETICA, 9, Font.ITALIC, new Color(120, 113, 108));
            Font metaFont = new Font(Font.HELVETICA, 9, Font.NORMAL, new Color(120, 113, 108));
            Paragraph shopPara = new Paragraph("PAHANA EDU BOOK SHOP", shopFont);
            shopPara.setSpacingAfter(2f);

            infoCell.addElement(shopPara);
            infoCell.addElement(new Paragraph("Educational Books & Stationery", taglineFont));
            infoCell.addElement(new Paragraph("Invoice #" + String.format("%03d", bill.getBillId()), metaFont));
            infoCell.addElement(new Paragraph("Date: " +
                    bill.getDateTime().format(dtfShort), metaFont));
            infoCell.addElement(new Paragraph("Time: " +
                    bill.getDateTime().format(DateTimeFormatter.ofPattern("HH:mm:ss")), metaFont));
            headerTable.addCell(infoCell);

            document.add(headerTable);
            document.add(new Paragraph("\n"));

            // --- Item Details Table ---
            String[] headers = {"Description", "Price (LKR)", "Qty", "Amt. (LKR)"};
            PdfPTable itemsTable = new PdfPTable(headers.length);
            itemsTable.setWidthPercentage(100f);
            itemsTable.setWidths(new float[]{3.1f, 1.2f, 0.9f, 1.3f});
            itemsTable.setSpacingBefore(4f);
            itemsTable.setSpacingAfter(18f);

            Font headerFont = new Font(Font.HELVETICA, 11, Font.BOLD, new Color(29, 78, 216));
            for (String h : headers) {
                PdfPCell cell = new PdfPCell(new Phrase(h, headerFont));
                cell.setBackgroundColor(new Color(219, 234, 254));
                cell.setBorderColor(new Color(191, 219, 254));
                cell.setPadding(7f);
                if ("Amt. (LKR)".equals(h)) cell.setHorizontalAlignment(Element.ALIGN_RIGHT);
                else cell.setHorizontalAlignment(Element.ALIGN_LEFT);
                itemsTable.addCell(cell);
            }

            Font rowFont = new Font(Font.HELVETICA, 10, Font.NORMAL, new Color(30, 41, 59));
            for (BillItem item : bill.getItems()) {
                String desc = item.getBook() != null && item.getBook().getTitle() != null ? item.getBook().getTitle() : "N/A";
                String price = String.format("LKR %.2f", item.getPrice());
                String qty = String.valueOf(item.getQuantity());
                String amt = String.format("LKR %.2f", item.getPrice() * item.getQuantity());

                PdfPCell descCell = new PdfPCell(new Phrase(desc, rowFont));
                descCell.setBorderColor(new Color(239, 246, 255));
                descCell.setPadding(7f);

                PdfPCell priceCell = new PdfPCell(new Phrase(price, rowFont));
                priceCell.setBorderColor(new Color(239, 246, 255));
                priceCell.setPadding(7f);

                PdfPCell qtyCell = new PdfPCell(new Phrase(qty, rowFont));
                qtyCell.setBorderColor(new Color(239, 246, 255));
                qtyCell.setPadding(7f);

                PdfPCell amtCell = new PdfPCell(new Phrase(amt, rowFont));
                amtCell.setBorderColor(new Color(239, 246, 255));
                amtCell.setHorizontalAlignment(Element.ALIGN_RIGHT);
                amtCell.setPadding(7f);

                itemsTable.addCell(descCell);
                itemsTable.addCell(priceCell);
                itemsTable.addCell(qtyCell);
                itemsTable.addCell(amtCell);
            }
            document.add(itemsTable);

            // --- Totals Section (right-aligned, boxed) ---
            PdfPTable totals = new PdfPTable(2);
            totals.setWidthPercentage(34f);
            totals.setHorizontalAlignment(Element.ALIGN_RIGHT);

            String[][] totalRows = {
                    {"Subtotal", String.format("LKR %.2f", bill.getTotal())},
                    {"Discount", "0%"},
                    {"Total:", String.format("LKR %.2f", bill.getTotal())}
            };
            for (int i = 0; i < totalRows.length; ++i) {
                Font rowLabFont = new Font(Font.HELVETICA, i == 2 ? 13 : 11, Font.BOLD, new Color(29, 78, 216));
                Font rowValFont = new Font(Font.HELVETICA, i == 2 ? 13 : 11, Font.BOLD, i == 2 ? new Color(29, 78, 216) : new Color(30, 41, 59));
                PdfPCell l = new PdfPCell(new Phrase(totalRows[i][0], rowLabFont));
                l.setBorder(i == 2 ? PdfPCell.TOP : PdfPCell.NO_BORDER);
                l.setBorderColor(new Color(191, 219, 254));
                l.setPadding(6f);
                PdfPCell v = new PdfPCell(new Phrase(totalRows[i][1], rowValFont));
                v.setHorizontalAlignment(Element.ALIGN_RIGHT);
                v.setBorder(i == 2 ? PdfPCell.TOP : PdfPCell.NO_BORDER);
                v.setBorderColor(new Color(191, 219, 254));
                v.setPadding(6f);
                totals.addCell(l);
                totals.addCell(v);
            }
            document.add(totals);

            // --- Footer: Contact and Thanks, centered ---
            Font footerFont = new Font(Font.HELVETICA, 10, Font.NORMAL, new Color(30, 41, 59));
            Paragraph footer = new Paragraph(
                    "PAHANA EDU BOOK SHOP   •   +94 0765683395   •   pahanaedu@gmail.com\nNo. 123 Main Street, Colombo, Sri Lanka",
                    footerFont
            );
            footer.setAlignment(Element.ALIGN_CENTER);
            footer.setSpacingBefore(20f);
            document.add(footer);

            // --- Add Purchase Date/Time at Bottom ---
            Font purchaseTimeFont = new Font(Font.HELVETICA, 10, Font.BOLD, new Color(29, 78, 216));
            Paragraph purchaseTime = new Paragraph(
                    "Purchase Date & Time: " + bill.getDateTime().format(dtfFull),
                    purchaseTimeFont
            );
            purchaseTime.setAlignment(Element.ALIGN_CENTER);
            purchaseTime.setSpacingBefore(8f);
            document.add(purchaseTime);

            // --- Thank you notice ---
            Font thanksFont = new Font(Font.HELVETICA, 11, Font.ITALIC, new Color(125, 125, 130));
            Paragraph thanks = new Paragraph("Thank you for your purchase!", thanksFont);
            thanks.setAlignment(Element.ALIGN_CENTER);
            thanks.setSpacingBefore(4f);
            document.add(thanks);

            document.close();
            out.close();

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("⚠️ PDF generation failed: " + e.getMessage());
        }
    }
}
