<%@ page import="java.util.*, com.example.pahanaedu_billing_system.model.Bill" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>🧾 All Generated Bills</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-50 font-sans p-10">

<h2 class="text-3xl font-bold text-center text-blue-700 mb-8">🧾 All Generated Bills</h2>

<%
    List<Bill> billList = (List<Bill>) request.getAttribute("billList");
    if (billList == null || billList.isEmpty()) {
%>
<p class="text-center text-red-600 text-lg">❌ No bills found in the system.</p>
<%
} else {
%>

<table class="min-w-full bg-white border border-gray-300 shadow-lg rounded-xl overflow-hidden">
    <thead class="bg-blue-600 text-white">
    <tr>
        <th class="py-3 px-4 text-left">Bill ID</th>
        <th class="py-3 px-4 text-left">Customer ID</th>
        <th class="py-3 px-4 text-left">Date & Time</th>
        <th class="py-3 px-4 text-right">Total Amount (Rs)</th>
    </tr>
    </thead>
    <tbody>
    <%
        for (Bill bill : billList) {
    %>
    <tr class="border-t border-gray-200 hover:bg-gray-100">
        <td class="py-2 px-4"><%= bill.getBillId() %></td>
        <td class="py-2 px-4"><%= bill.getCustomerId() %></td>
        <td class="py-2 px-4"><%= bill.getDateTime() %></td>
        <td class="py-2 px-4 text-right font-semibold text-green-600">Rs. <%= String.format("%.2f", bill.getTotal()) %></td>
    </tr>
    <%
        }
    %>
    </tbody>
</table>

<%
    }
%>

<!-- Back to Dashboard -->
<div class="text-center mt-10">
    <a href="staff_dashboard.html" class="bg-gray-600 hover:bg-gray-700 text-white px-6 py-3 rounded-xl transition font-semibold">
        ← Back to Dashboard
    </a>
</div>

</body>
</html>
