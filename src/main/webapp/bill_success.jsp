<%@ page import="com.example.pahanaedu_billing_system.model.Bill" %>
<%@ page import="java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page session="true" %>
<%
    Bill bill = (Bill) session.getAttribute("generatedBill");
    // Prepare date/time formatting (only if bill is not null)
    String formattedDateTime = "";
    if (bill != null) {
        String raw = String.valueOf(bill.getDateTime()); // Example: "2025-08-02T00:34:04.823607"
        java.time.LocalDateTime dateTime = java.time.LocalDateTime.parse(raw);
        formattedDateTime = dateTime.format(java.time.format.DateTimeFormatter.ofPattern("yyyy-MM-dd, HH:mm"));
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Bill Success</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Tailwind CDN -->
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="min-h-screen flex items-center justify-center bg-gradient-to-tr from-blue-50 via-blue-100 to-blue-300 font-sans">
<% if (bill == null) { %>
<div class="bg-white rounded-2xl shadow-xl p-8 w-full max-w-sm flex flex-col items-center text-center">
    <div class="text-red-600 text-2xl mb-4">⚠️</div>
    <div class="text-red-600 text-lg font-semibold mb-6">Error: Bill data not available in session.</div>
    <a href="staff_dashboard.html"
       class="inline-block px-6 py-2 bg-blue-100 text-blue-700 rounded-lg font-medium shadow hover:bg-blue-200 transition duration-150">
        ← Back to Dashboard
    </a>
</div>
<% } else { %>
<div class="bg-white rounded-2xl shadow-xl p-8 w-full max-w-sm flex flex-col items-center text-center">
    <div class="text-green-500 text-5xl mb-2"></div>
    <h2 class="text-green-600 text-2xl font-bold mb-4">Bill Generated Successfully</h2>
    <div class="mb-6 text-gray-700">
        <p class="mb-2"><span class="font-semibold">Customer ID:</span> <%= bill.getCustomerId() %></p>
        <p class="mb-2"><span class="font-semibold">Total:</span> Rs. <%= String.format("%.2f", bill.getTotal()) %></p>
        <p><span class="font-semibold">Time:</span> <%= formattedDateTime %></p>
    </div>
    <a href="DownloadPDFServlet?billId=<%= bill.getBillId() %>"
       class="inline-block px-6 py-2 bg-green-500 text-white rounded-lg font-medium shadow hover:bg-green-600 transition duration-150 mb-2">
        Download PDF
    </a>
    <a href="staff_select_books.jsp"
       class="inline-block px-6 py-2 bg-blue-100 text-blue-700 rounded-lg font-medium shadow hover:bg-blue-200 transition duration-150 mt-2">
        ← Back to Select Book Page
    </a>
</div>
<% } %>
</body>
</html>
