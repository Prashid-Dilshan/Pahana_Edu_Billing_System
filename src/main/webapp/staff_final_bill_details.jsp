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
    <title>Bill Preview</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gradient-to-b from-blue-50 via-white to-green-50 min-h-screen flex flex-col items-center py-10 font-sans">

<div class="w-full max-w-2xl mx-auto">
    <div class="bg-white drop-shadow-lg rounded-2xl px-6 py-7 mb-9">
        <h2 class="text-3xl md:text-4xl font-extrabold text-center text-green-700 flex items-center justify-center gap-2 mb-2 tracking-tight">
            <span>📓</span>
            Bill Preview
        </h2>
        <% if (cart == null || cart.isEmpty() || customerId == null || customer == null) { %>
        <p class="text-center text-red-600 py-8 font-semibold text-lg">
            ❌ Cart or customer details not found.<br>
            <a href="staff_cart.jsp" class="mt-2 text-blue-600 underline font-medium inline-block">⬅ Back to Cart</a>
        </p>
        <% } else { %>

        <!-- Customer Details -->
        <div class="mb-7 border-l-4 border-green-400 pl-5 py-4 bg-green-50 rounded-xl">
            <h3 class="text-lg font-bold text-green-700 mb-1 flex items-center gap-2">
                <span>👤</span> Customer Details</h3>
            <div class="text-gray-800 grid sm:grid-cols-2 gap-y-1">
                <div><span class="font-semibold">ID:</span> <%= customer.getCustomerid() %></div>
                <div><span class="font-semibold">Name:</span> <%= customer.getName() %></div>
                <div><span class="font-semibold">Phone:</span> <%= customer.getPhonenumber() %></div>
                <div><span class="font-semibold">Address:</span> <%= customer.getAddress() %></div>
                <div class="col-span-2"><span class="font-semibold">Email:</span> <%= customer.getEmail() %></div>
            </div>
        </div>

        <!-- Cart Table -->
        <div class="overflow-x-auto mb-7">
            <table class="min-w-full table-auto bg-white rounded-xl border border-gray-200 overflow-hidden shadow-sm">
                <thead class="bg-gradient-to-r from-green-600 to-blue-600 text-white">
                <tr>
                    <th class="py-2 px-4 text-left">Book ID</th>
                    <th class="py-2 px-4 text-left">Title</th>
                    <th class="py-2 px-4 text-right">Quantity</th>
                    <th class="py-2 px-4 text-right">Unit Price</th>
                    <th class="py-2 px-4 text-right">Total</th>
                </tr>
                </thead>
                <tbody>
                <% double grandTotal = 0;
                    for (CartItem item : cart) {
                        double total = item.getTotalPrice();
                        grandTotal += total;
                %>
                <tr class="border-t border-gray-200 hover:bg-green-50 transition">
                    <td class="py-2 px-4 text-gray-700"><%= item.getBookId() %></td>
                    <td class="py-2 px-4 font-medium text-gray-900"><%= item.getTitle() %></td>
                    <td class="py-2 px-4 text-right text-gray-700"><%= item.getQuantity() %></td>
                    <td class="py-2 px-4 text-right text-gray-700">Rs. <%= String.format("%.2f", item.getPrice()) %></td>
                    <td class="py-2 px-4 text-right font-semibold text-green-900">Rs. <%= String.format("%.2f", total) %></td>
                </tr>
                <% } %>
                <tr>
                    <td colspan="4" class="py-3 px-4 text-right font-bold text-lg bg-green-100 rounded-bl-xl">Grand Total</td>
                    <td class="py-3 px-4 text-right bg-green-100 font-extrabold text-xl rounded-br-xl text-green-700">
                        Rs. <%= String.format("%.2f", grandTotal) %>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>

        <!-- Confirm Bill Button -->
        <form action="ConfirmGenerateBillServlet" method="post" class="flex justify-center mt-8 mb-2">
            <button type="submit"
                    class="bg-gradient-to-r from-green-600 to-blue-600 transform transition active:scale-95 active:shadow-inner
                               hover:from-green-700 hover:to-blue-700 shadow-lg text-white text-lg font-semibold px-8 py-3
                               rounded-xl flex items-center gap-2">
                ✅ Confirm and Generate Bill
            </button>
        </form>
        <% } %>
    </div>
</div>
</body>
</html>
