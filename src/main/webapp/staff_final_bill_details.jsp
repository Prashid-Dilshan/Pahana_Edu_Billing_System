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
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Bill Preview</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Inter', sans-serif;
        }

        #loading-overlay {
            position: fixed;
            inset: 0;
            background: rgba(255, 255, 255, 0.75);
            backdrop-filter: blur(3px);
            display: none;
            align-items: center;
            justify-content: center;
            z-index: 9999;
        }

        .spinner {
            border: 6px solid #d1d5db;
            border-top: 6px solid #6366f1;
            border-radius: 50%;
            width: 60px;
            height: 60px;
            animation: spin 1s linear infinite;
        }

        @keyframes spin {
            to { transform: rotate(360deg); }
        }
        ::-webkit-scrollbar {
            width: 8px;
            height: 8px;
        }
        ::-webkit-scrollbar-thumb {
            background-color: #60a5fa;
            border-radius: 4px;
        }
    </style>
</head>

<body class="bg-gradient-to-tr from-blue-50 via-blue-100 to-blue-300 font-sans min-h-screen flex flex-col items-center px-4 py-10">

<div class="max-w-4xl mx-auto bg-white rounded-3xl shadow-xl px-6 py-8">
    <h1 style="margin-bottom: 24px;" class="text-2xl sm:text-3xl font-extrabold text-blue-700 mb-1 text-center tracking-tight">
        Bill Preview
    </h1>


    <% if (cart == null || cart.isEmpty() || customerId == null || customer == null) { %>
    <div class="text-center text-red-600 text-lg font-semibold py-10">
        ❌ Cart or customer details not found.<br>
        <a href="staff_cart.jsp" class="inline-block mt-4 text-blue-700 underline hover:text-blue-900 font-medium">⬅ Back to Cart</a>
    </div>
    <% } else { %>


    <!-- Customer Information -->
    <section class="mb-8  bg-blue-100 border-l-4 border-indigo-400 p-5 rounded-xl">
        <h2 class="text-xl font-bold text-indigo-800 mb-2 flex items-center gap-1">
            👤 Customer Details
        </h2>
        <div class="text-gray-800 grid sm:grid-cols-2 gap-y-1">
            <div><span class="font-semibold">ID:</span> <%= customer.getCustomerid() %></div>
            <div><span class="font-semibold">Name:</span> <%= customer.getName() %></div>
            <div><span class="font-semibold">Phone:</span> <%= customer.getPhonenumber() %></div>
            <div><span class="font-semibold">Address:</span> <%= customer.getAddress() %></div>
            <div class="col-span-2"><span class="font-semibold">Email:</span> <%= customer.getEmail() %></div>
        </div>
    </section>

    <!-- Cart Table -->
    <div class="overflow-x-auto mb-10">
        <table class="min-w-full table-auto rounded-xl border border-gray-200 overflow-hidden shadow-sm text-sm">
            <thead class="bg-blue-100 text-blue-900 font-semibold">
            <tr>
                <th class="py-3 px-4 text-left">Book ID</th>
                <th class="py-3 px-4 text-left">Title</th>
                <th class="py-3 px-4 text-right">Quantity</th>
                <th class="py-3 px-4 text-right">Unit Price</th>
                <th class="py-3 px-4 text-right">Total</th>
            </tr>
            </thead>
            <tbody class="bg-white">
            <%
                double grandTotal = 0;
                for (CartItem item : cart) {
                    double total = item.getTotalPrice();
                    grandTotal += total;
            %>
            <tr class="border-t border-gray-200 hover:bg-indigo-50 transition">
                <td class="py-2 px-4 text-gray-700"><%= item.getBookId() %></td>
                <td class="py-2 px-4 font-medium text-gray-900"><%= item.getTitle() %></td>
                <td class="py-2 px-4 text-right text-gray-700"><%= item.getQuantity() %></td>
                <td class="py-2 px-4 text-right text-gray-700">Rs. <%= String.format("%.2f", item.getPrice()) %></td>
                <td class="py-2 px-4 text-right font-semibold text-indigo-900">Rs. <%= String.format("%.2f", total) %></td>
            </tr>
            <% } %>
            <tr>
                <td colspan="4" class="py-3 px-4 text-right font-bold text-base bg-blue-50 rounded-bl-xl">Grand Total</td>
                <td class="py-3 px-4 text-right font-extrabold text-xl  bg-indigo-100  text-indigo-700 rounded-br-xl">
                    Rs. <%= String.format("%.2f", grandTotal) %>
                </td>
            </tr>
            </tbody>
        </table>
    </div>

    <!-- Confirm Button -->
    <form id="confirmForm" action="ConfirmGenerateBillServlet" method="post" class="flex justify-center">
        <button type="submit"
                id="confirmBtn"
                class="bg-green-600 hover:bg-green-700
                       text-white px-6 py-2 rounded-xl font-semibold text-lg shadow-md transition-all duration-150
                       active:scale-95 active:shadow-inner">
            Confirm and Generate Bill
        </button>
    </form>
    <% } %>
</div>

<!-- Loading Overlay -->
<div id="loading-overlay" class="hidden fixed inset-0 flex items-center justify-center">
    <div class="spinner" role="status" aria-label="Loading"></div>
</div>

<script>
    const form = document.getElementById('confirmForm');
    const loadingOverlay = document.getElementById('loading-overlay');
    const confirmBtn = document.getElementById('confirmBtn');

    form.addEventListener('submit', function() {
        loadingOverlay.style.display = 'flex';
        confirmBtn.disabled = true;
    });
</script>

</body>
</html>
