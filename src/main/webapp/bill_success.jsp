<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.pahanaedu_billing_system.model.Bill" %>
<%@ page import="com.example.pahanaedu_billing_system.model.BillItem" %>
<%@ page import="com.example.pahanaedu_billing_system.model.Customer" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Bill Success - Pahana Edu Bookshop</title>
    <style>
        body { font-family: Helvetica, sans-serif; color: #1a2a3b; margin: 0; padding: 20px; background: #f8fafc; }
        .container { max-width: 800px; margin: auto; border: 1px solid #bfdbfe; padding: 24px; background: #fff; box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); border-radius: 8px; }
        .header { display: flex; justify-content: space-between; align-items: flex-start; margin-bottom: 24px; gap: 20px; }
        .left { flex: 1; }
        .logo { width: 80px; height: auto; margin-bottom: 12px; }
        .shop-info { flex: 1; text-align: right; }
        .shop-name { font-size: 26px; font-weight: bold; color: #1d4ed8; }
        .tagline { font-style: italic; color: #6b7280; font-size: 14px; }
        .meta { color: #6b7280; font-size: 14px; line-height: 1.4; }
        .customer-info { font-size: 14px; line-height: 1.5; }
        .label { font-weight: bold; color: #2563eb; display: block; margin-bottom: 4px; }
        table { width: 100%; border-collapse: collapse; margin: 16px 0; }
        th { background: #dbeafe; color: #1d4ed8; padding: 10px; text-align: left; border: 1px solid #bfdbfe; font-weight: bold; }
        td { padding: 10px; border: 1px solid #eff6ff; background: #f9fafb; }
        .total-section { display: flex; flex-direction: column; align-items: flex-end; margin-top: 24px; gap: 8px; font-size: 15px; border-top: 1px solid #bfdbfe; padding-top: 12px; max-width: 300px; align-self: flex-end; }
        .total-label { font-weight: bold; color: #1d4ed8; }
        .footer { text-align: center; margin-top: 48px; color: #1a2a3b; font-size: 14px; line-height: 1.6; border-top: 1px solid #eff6ff; padding-top: 16px; }
        .thanks { font-style: italic; color: #6b7280; margin-top: 8px; }
        .actions { display: flex; justify-content: center; gap: 16px; margin-top: 24px; }
        button, a.button { background: #1d4ed8; color: white; padding: 10px 24px; border: none; cursor: pointer; border-radius: 6px; font-weight: medium; text-decoration: none; transition: background 0.2s; }
        button:hover, a.button:hover { background: #2563eb; }
        a.button { background: #e0f2fe; color: #1d4ed8; }
        a.button:hover { background: #bfdbfe; }
        @media print {
            body { background: white; padding: 0; }
            .container { box-shadow: none; border: none; margin: 0; padding: 0; }
            .actions { display: none; } /* Hide buttons and links when printing */
            @page { margin: 1cm; }
            table { page-break-inside: avoid; }
        }

        ::-webkit-scrollbar { width: 8px; height: 8px; }
        ::-webkit-scrollbar-thumb { background-color: #60a5fa; border-radius: 4px; }
    </style>
</head>
<body>
<div class="container">
    <%
        Bill bill = (Bill) session.getAttribute("generatedBill");
        if (bill == null) {
            out.println("<p>⚠️ Error: No bill found.</p>");
        } else {
            DateTimeFormatter dtfFull = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
            DateTimeFormatter dtfShort = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            Customer c = bill.getCustomer();
    %>
    <div class="header">
        <div class="left">
            <img src="assets/logo1.png" alt="Pahana Edu Bookshop Logo" class="logo">
            <div class="customer-info">
                <span class="label">Billed To:</span>
                Name: <%= c != null ? c.getName() : "N/A" %><br>
                Phone: <%= c != null ? c.getPhonenumber() : "N/A" %><br>
                Email: <%= c != null ? c.getEmail() : "N/A" %><br>
                Address: <%= c != null ? c.getAddress() : "N/A" %>
            </div>
        </div>
        <div class="shop-info">
            <div class="shop-name">PAHANA EDU BOOK SHOP</div>
            <div class="tagline">Educational Books & Stationery</div>
            <div class="meta">
                Invoice #<%= String.format("%03d", bill.getBillId()) %><br>
                Date: <%= bill.getDateTime().format(dtfShort) %><br>
                Time: <%= bill.getDateTime().format(DateTimeFormatter.ofPattern("HH:mm:ss")) %>
            </div>
        </div>
    </div>

    <table>
        <thead>
        <tr>
            <th>Description</th>
            <th>Price (LKR)</th>
            <th>Qty</th>
            <th>Amt. (LKR)</th>
        </tr>
        </thead>
        <tbody>
        <% for (BillItem item : bill.getItems()) { %>
        <tr>
            <td><%= item.getBook() != null && item.getBook().getTitle() != null ? item.getBook().getTitle() : "N/A" %></td>
            <td><%= String.format("%.2f", item.getPrice()) %></td>
            <td><%= item.getQuantity() %></td>
            <td><%= String.format("%.2f", item.getPrice() * item.getQuantity()) %></td>
        </tr>
        <% } %>
        </tbody>
    </table>

    <div class="total-section">
        <div>Subtotal: <span class="total-label">LKR <%= String.format("%.2f", bill.getTotal()) %></span></div>
        <div>Discount: 0%</div>
        <div>Total: <span class="total-label">LKR <%= String.format("%.2f", bill.getTotal()) %></span></div>
    </div>

    <div class="footer">
        PAHANA EDU BOOK SHOP • +94 0765683395 • pahanaedu@gmail.com<br>
        No. 123 Main Street, Colombo, Sri Lanka<br>
        <div>Purchase Date & Time: <%= bill.getDateTime().format(dtfFull) %></div>
        <div class="thanks">Thank you for your purchase!</div>
    </div>
    <% } %>
</div>

<div class="actions">
    <button onclick="window.print()">Print Bill</button>
    <a href="staff_select_books.jsp" class="button">← Back to Select Book Page</a>
</div>

<script>
    // Optional: Uncomment the line below to auto-trigger print dialog on page load
    // window.onload = function() { window.print(); };
</script>
</body>
</html>
