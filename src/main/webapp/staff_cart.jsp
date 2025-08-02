<%@ page import="java.util.*, com.example.pahanaedu_billing_system.model.CartItem" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en" class="scroll-smooth">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title> Cart Preview</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gradient-to-tr from-blue-50 via-blue-100 to-blue-300 font-sans min-h-screen flex flex-col items-center px-4 py-10">

<h2 style="margin-bottom: 24px;" class="text-2xl sm:text-3xl font-extrabold text-blue-700 mb-1 text-center tracking-tight">
    <span></span>
    <span>Cart Preview</span>
</h2>

<%
    List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
    if (cart != null && !cart.isEmpty()) {
        double grandTotal = 0;
%>

<div class="overflow-x-auto w-full max-w-6xl shadow-lg rounded-lg bg-white">
    <table class="min-w-full table-auto border-collapse border border-gray-300">
        <thead class="bg-blue-100 text-blue-900 font-semibold">
        <tr>
            <th class="border border-gray-300 px-4 py-3 text-left">Title</th>
            <th class="border border-gray-300 px-4 py-3 text-center">Price (Rs.)</th>
            <th class="border border-gray-300 px-4 py-3 text-center">Quantity</th>
            <th class="border border-gray-300 px-4 py-3 text-center">Total (Rs.)</th>
            <th class="border border-gray-300 px-4 py-3 text-center">Actions</th>
        </tr>
        </thead>
        <tbody class="divide-y divide-gray-200">
        <%
            for (CartItem item : cart) {
                double total = item.getTotalPrice();
                grandTotal += total;
        %>
        <tr class="hover:bg-blue-50">
            <td class="border border-gray-300 px-4 py-3 max-w-xs truncate" title="<%= item.getTitle() %>">
                <%= item.getTitle() %>
            </td>
            <td class="border border-gray-300 px-4 py-3 text-center whitespace-nowrap">
                <%= String.format("%.2f", item.getPrice()) %>
            </td>
            <td class="border border-gray-300 px-4 py-3 text-center">
                <!-- Auto-update quantity form -->
                <form action="UpdateCartServlet" method="post" class="inline-block">
                    <input type="hidden" name="bookId" value="<%= item.getBookId() %>" />
                    <input type="number"
                           name="quantity"
                           value="<%= item.getQuantity() %>"
                           min="1"
                           class="w-20 text-center border border-gray-300 rounded-md px-2 py-1 focus:outline-none focus:ring-2 focus:ring-blue-500"
                           onchange="this.form.submit();" />
                </form>
            </td>
            <td class="border border-gray-300 px-4 py-3 text-center whitespace-nowrap font-semibold text-green-600">
                <%= String.format("%.2f", total) %>
            </td>
            <td class="border border-gray-300 px-4 py-3 text-center space-x-1 whitespace-nowrap">
                <!-- Remove one quantity -->
                <a href="RemoveFromCartServlet?bookId=<%= item.getBookId() %>"
                   class="inline-block bg-red-100 hover:bg-red-200 text-red-700 px-3 py-1 rounded-md text-sm font-semibold transition"
                   title="Remove one">−</a>

                <!-- Remove all this book -->
                <a href="RemoveFromCartServlet?bookId=<%= item.getBookId() %>&removeAll=true"
                   onclick="return confirm('Remove this book from cart completely?');"
                   class="inline-block bg-red-200 hover:bg-red-300 text-red-800 px-3 py-1 rounded-md text-sm font-semibold transition"
                   title="Remove all">🗑</a>
            </td>
        </tr>
        <% } %>
        </tbody>
        <tfoot class="bg-blue-50 font-semibold text-lg text-green-700">
        <tr>
            <td colspan="3" class="border border-gray-300 px-4 py-3 text-right">Grand Total:</td>
            <td colspan="2" class="border border-gray-300 px-4 py-3 text-left">
                Rs. <%= String.format("%.2f", grandTotal) %>
            </td>
        </tr>
        </tfoot>
    </table>
</div>

<div class="max-w-6xl flex justify-between mt-8 w-full px-4 sm:px-0">
    <a href="staff_select_books.jsp"
       class="inline-block bg-gray-200 hover:bg-gray-300 text-gray-800 font-semibold px-6 py-2 rounded-lg shadow-sm transition">
        ⬅ Back to Book Selection
    </a>

    <form action="selectCustomer" method="get" class="inline-block">
        <button type="submit"
                class="bg-green-600 hover:bg-green-700 text-white font-semibold px-6 py-2 rounded-lg shadow-md transition">
            Continue to Customer Selection
        </button>
    </form>
</div>

<%
} else {
%>

<p class="text-center text-red-600 text-xl font-semibold mt-20 max-w-3xl">
    Your cart is empty.
</p>

<div class="mt-10 text-center">
    <a href="staff_select_books.jsp"
       class="inline-block text-blue-600 hover:underline font-medium text-lg transition">
         Back to Book Selection
    </a>
</div>

<%
    }
%>

</body>
</html>
