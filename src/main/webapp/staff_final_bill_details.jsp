<%@ page import="java.util.*, com.example.pahanaedu_billing_system.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="true" %>

<%
    List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
    Integer customerId = (Integer) session.getAttribute("selectedCustomerId");
    Customer customer = (Customer) session.getAttribute("selectedCustomer");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>බිල් නසේත් Preview</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-50 font-sans p-10">

<h2 class="text-3xl font-bold text-center text-blue-700 mb-6">📓 බිල් නසේත් Preview</h2>

<% if (cart == null || cart.isEmpty() || customerId == null || customer == null) { %>
<p class="text-center text-red-600">
    ❌ Cart or customer details not found. <br>
    <a href="staff_cart.jsp" class="text-blue-500 underline">⬅ Go back to cart</a>
</p>
<% } else { %>

<div class="bg-white p-6 rounded-xl shadow-md mb-8 max-w-xl mx-auto">
    <h3 class="text-xl font-bold mb-3">👤 Customer Details</h3>
    <p><strong>ID:</strong> <%= customer.getCustomerid() %></p>
    <p><strong>Name:</strong> <%= customer.getName() %></p>
    <p><strong>Phone:</strong> <%= customer.getPhonenumber() %></p>
    <p><strong>Address:</strong> <%= customer.getAddress() %></p>
    <p><strong>Email:</strong> <%= customer.getEmail() %></p>
</div>

<div class="overflow-x-auto mb-6">
    <table class="min-w-full bg-white border border-gray-300 shadow-md rounded-xl">
        <thead class="bg-blue-600 text-white">
        <tr>
            <th class="py-2 px-4">Book ID</th>
            <th class="py-2 px-4">Title</th>
            <th class="py-2 px-4">Quantity</th>
            <th class="py-2 px-4">Price</th>
            <th class="py-2 px-4">Total</th>
        </tr>
        </thead>
        <tbody>
        <% double grandTotal = 0;
            for (CartItem item : cart) {
                double total = item.getTotalPrice();
                grandTotal += total;
        %>
        <tr class="border-t border-gray-200">
            <td class="py-2 px-4"><%= item.getBookId() %></td>
            <td class="py-2 px-4"><%= item.getTitle() %></td>
            <td class="py-2 px-4"><%= item.getQuantity() %></td>
            <td class="py-2 px-4">Rs. <%= String.format("%.2f", item.getPrice()) %></td>
            <td class="py-2 px-4">Rs. <%= String.format("%.2f", total) %></td>
        </tr>
        <% } %>
        <tr class="font-bold bg-gray-100">
            <td colspan="4" class="py-2 px-4 text-right">Grand Total</td>
            <td class="py-2 px-4">Rs. <%= String.format("%.2f", grandTotal) %></td>
        </tr>
        </tbody>
    </table>
</div>

<!-- Confirm Bill Form -->
<form action="ConfirmGenerateBillServlet" method="post" class="text-center mt-6">
    <input type="submit" value="✅ Confirm and Generate Bill"
           class="bg-green-600 hover:bg-green-700 text-white px-6 py-3 rounded-xl shadow text-lg font-semibold" />
</form>

<% } %>

</body>
</html>
