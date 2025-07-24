<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, com.example.pahanaedu_billing_system.model.BillItem, com.example.pahanaedu_billing_system.model.Bill, com.example.pahanaedu_billing_system.model.Book" %>

<%
    Bill bill = (Bill) request.getAttribute("bill");
    List<BillItem> items = bill.getItems();
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>🧾 Bill Details</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 p-8 font-sans">

<div class="max-w-4xl mx-auto bg-white p-8 shadow-md rounded-lg">
    <h2 class="text-3xl font-bold text-blue-700 mb-4 text-center">🧾 Bill Details - ID #<%= bill.getBillId() %></h2>

    <div class="mb-6">
        <p><strong>👤 Customer ID:</strong> <%= bill.getCustomerId() %></p>
        <p><strong>📅 Date & Time:</strong> <%= bill.getDateTime() %></p>
        <p><strong>💵 Total Amount:</strong> Rs. <%= String.format("%.2f", bill.getTotal()) %></p>
    </div>

    <h3 class="text-xl font-semibold mb-2">📚 Purchased Books:</h3>
    <table class="min-w-full bg-white border border-gray-300 rounded">
        <thead class="bg-blue-600 text-white">
        <tr>
            <th class="py-2 px-4 text-left">Book ID</th>
            <th class="py-2 px-4 text-left">Quantity</th>
            <th class="py-2 px-4 text-left">Price</th>
            <th class="py-2 px-4 text-left">Subtotal</th>
        </tr>
        </thead>
        <tbody>
        <%
            double total = 0;
            for (BillItem item : items) {
                double subtotal = item.getPrice() * item.getQuantity();
                total += subtotal;
        %>
        <tr class="border-t border-gray-200 hover:bg-gray-50">
            <td class="py-2 px-4"><%= item.getBookId() %></td>
            <td class="py-2 px-4"><%= item.getQuantity() %></td>
            <td class="py-2 px-4">Rs. <%= item.getPrice() %></td>
            <td class="py-2 px-4 font-medium text-green-600">Rs. <%= String.format("%.2f", subtotal) %></td>
        </tr>
        <% } %>
        </tbody>
        <tfoot class="bg-gray-100">
        <tr>
            <td colspan="3" class="py-3 px-4 font-semibold text-right">Total:</td>
            <td class="py-3 px-4 font-bold text-green-700">Rs. <%= String.format("%.2f", total) %></td>
        </tr>
        </tfoot>
    </table>

    <!-- Back and Download Options -->
    <div class="mt-6 flex justify-between">
        <a href="view_bills.jsp"
           class="bg-gray-600 hover:bg-gray-700 text-white px-6 py-2 rounded-xl transition font-semibold">
            ← Back to All Bills
        </a>

        <form action="DownloadPDFServlet" method="post">
            <input type="hidden" name="billId" value="<%= bill.getBillId() %>" />
            <button type="submit"
                    class="bg-blue-600 hover:bg-blue-700 text-white px-6 py-2 rounded-xl transition font-semibold">
                ⬇ Download PDF
            </button>
        </form>
    </div>
</div>

</body>
</html>
