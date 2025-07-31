<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, com.example.pahanaedu_billing_system.model.*" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<html>
<head>
    <title>Staff View Bills</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 p-8">

<h1 class="text-2xl font-bold mb-6 text-center text-purple-700">📋 All Bills</h1>

<!-- All Bills Table -->
<div class="overflow-x-auto mb-10">
    <table class="min-w-full bg-white shadow-md rounded-xl">
        <thead class="bg-gray-200">
        <tr>
            <th class="py-3 px-4 text-left">Bill ID</th>
            <th class="py-3 px-4 text-left">Customer Name</th>
            <th class="py-3 px-4 text-left">Phone</th>
            <th class="py-3 px-4 text-left">Date</th>
            <th class="py-3 px-4 text-left">Total</th>
            <th class="py-3 px-4 text-left">Action</th>
        </tr>
        </thead>
        <tbody>
        <%
            List<Bill> bills = (List<Bill>) request.getAttribute("bills");
            if (bills != null && !bills.isEmpty()) {
                for (Bill billObj : bills) {
                    Customer cust = billObj.getCustomer();
                    String formattedDate = billObj.getDateTime().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm"));
        %>
        <tr class="border-t hover:bg-gray-50">
            <td class="py-2 px-4"><%= billObj.getBillId() %></td>
            <td class="py-2 px-4"><%= (cust != null ? cust.getName() : "N/A") %></td>
            <td class="py-2 px-4"><%= (cust != null ? cust.getPhonenumber() : "N/A") %></td>
            <td class="py-2 px-4"><%= formattedDate %></td>
            <td class="py-2 px-4">Rs. <%= String.format("%.2f", billObj.getTotal()) %></td>
            <td class="py-2 px-4 space-x-2">
                <a href="StaffViewBillDetailsServlet?billId=<%= billObj.getBillId() %>"
                   class="bg-blue-600 hover:bg-blue-700 text-white py-1 px-3 rounded">View</a>
            </td>
        </tr>
        <%
            }
        } else {
        %>
        <tr>
            <td colspan="6" class="py-4 text-center text-red-600">No bills found.</td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>
</div>

<!-- Bill Details Section (if selected) -->
<%
    Bill selectedBill = (Bill) request.getAttribute("bill");
    if (selectedBill != null) {
        Customer sc = selectedBill.getCustomer();
        List<BillItem> items = selectedBill.getItems();
        String detailDate = selectedBill.getDateTime().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm"));
%>
<div class="bg-white p-6 rounded-xl shadow-md">
    <h2 class="text-xl font-semibold mb-4 text-purple-700">Bill Details (ID: <%= selectedBill.getBillId() %>)</h2>
    <p><strong>Customer Name:</strong> <%= (sc != null ? sc.getName() : "N/A") %></p>
    <p><strong>Phone:</strong> <%= (sc != null ? sc.getPhonenumber() : "N/A") %></p>
    <p><strong>Date:</strong> <%= detailDate %></p>
    <p><strong>Total:</strong> Rs. <%= String.format("%.2f", selectedBill.getTotal()) %></p>

    <h3 class="text-lg font-bold mt-6 mb-2">📚 Purchased Items</h3>
    <table class="min-w-full bg-gray-50 rounded">
        <thead>
        <tr>
            <th class="py-2 px-4 text-left">Book Title</th>
            <th class="py-2 px-4 text-left">Price</th>
            <th class="py-2 px-4 text-left">Quantity</th>
            <th class="py-2 px-4 text-left">Subtotal</th>
        </tr>
        </thead>
        <tbody>
        <%
            if (items != null && !items.isEmpty()) {
                for (BillItem item : items) {
                    String bookTitle = (item.getBook() != null && item.getBook().getTitle() != null)
                            ? item.getBook().getTitle() : item.getBookId();
        %>
        <tr class="border-t hover:bg-gray-100">
            <td class="py-2 px-4"><%= bookTitle %></td>
            <td class="py-2 px-4">Rs. <%= String.format("%.2f", item.getPrice()) %></td>
            <td class="py-2 px-4"><%= item.getQuantity() %></td>
            <td class="py-2 px-4">Rs. <%= String.format("%.2f", item.getPrice() * item.getQuantity()) %></td>
        </tr>
        <%
            }
        } else {
        %>
        <tr>
            <td colspan="4" class="py-2 text-center text-red-500">No items found.</td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>
</div>
<%
    }
%>

<a href="staff_dashboard.html"
   class="fixed bottom-7 left-7 bg-gray-600 hover:bg-gray-700 text-white px-6 py-2 rounded-2xl text-base font-semibold shadow transition">
    ← Back to Staff Dashboard
</a>

</body>
</html>
