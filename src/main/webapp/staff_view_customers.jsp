<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.pahanaedu_billing_system.model.Customer" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <title>View Customers - Pahana Edu Billing System</title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <!-- Tailwind CSS CDN -->
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@700;400&display=swap" rel="stylesheet"/>
    <style>
        body { font-family: 'Inter', 'Segoe UI', Arial, sans-serif; }
    </style>
</head>
<body class="bg-gradient-to-br from-gray-50 via-blue-50 to-blue-400 min-h-screen flex flex-col items-center justify-center">

<div class="w-full max-w-4xl bg-white rounded-3xl shadow-xl px-6 py-10 flex flex-col items-center">
    <svg class="w-14 h-14 text-blue-500 mb-3" fill="none" viewBox="0 0 48 48">
        <circle cx="24" cy="24" r="22" stroke="currentColor" stroke-width="3" fill="#E3F0FF" />
        <path d="M17 21a5 5 0 1 1 10 0 5 5 0 0 1-10 0ZM10 39c0-3.5 7.5-6 14-6s14 2.5 14 6v1H10v-1Z"
              stroke="#38BDF8" stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round"/>
    </svg>
    <h2 class="text-2xl font-bold text-blue-700 mb-2 text-center">Customer List</h2>
    <span class="text-xs text-gray-400 mb-5 text-center">Pahana Edu Billing System</span>
    <!-- Success message display, if customer was just added -->
    <%
        String msg = (String) session.getAttribute("msg");
        if (msg != null) {
    %>
    <div class="w-full mb-4 bg-green-100 text-green-800 border border-green-400 rounded-lg px-4 py-2 text-center">
        <strong><%= msg %></strong>
    </div>
    <%
            session.removeAttribute("msg");
        }
    %>
    <div class="overflow-x-auto w-full">
        <table class="min-w-full border border-gray-200 shadow-sm bg-white rounded-lg">
            <thead>
            <tr class="bg-blue-100 text-blue-900">
                <th class="px-3 py-2 border-b">Customer ID</th>
                <th class="px-3 py-2 border-b">Name</th>
                <th class="px-3 py-2 border-b">Address</th>
                <th class="px-3 py-2 border-b">Phone Number</th>
                <th class="px-3 py-2 border-b">Email</th>
                <th class="px-3 py-2 border-b">Actions</th>
            </tr>
            </thead>
            <tbody>
            <%
                List<Customer> customers = (List<Customer>) request.getAttribute("customers");
                if (customers != null && !customers.isEmpty()) {
                    for (Customer customer : customers) {
            %>
            <tr class="hover:bg-blue-50">
                <td class="px-3 py-2 text-center"><%= customer.getCustomerid() %></td>
                <td class="px-3 py-2"><%= customer.getName() %></td>
                <td class="px-3 py-2"><%= customer.getAddress() %></td>
                <td class="px-3 py-2"><%= customer.getPhonenumber() %></td>
                <td class="px-3 py-2"><%= customer.getEmail() %></td>
                <td class="px-3 py-2 text-center">
                    <a href="EditCustomerServlet?customerid=<%= customer.getCustomerid() %>"
                       class="bg-yellow-400 hover:bg-yellow-500 text-yellow-900 font-semibold px-4 py-1 rounded-xl transition text-sm">
                        ✏️ Edit
                    </a>
                </td>
            </tr>
            <%
                }
            } else {
            %>
            <tr>
                <td class="px-3 py-4 text-center text-gray-400" colspan="6">No customers found.</td>
            </tr>
            <%
                }
            %>
            </tbody>
        </table>
    </div>
</div>

<a href="staff_dashboard.html"
   class="fixed bottom-7 left-7 bg-gray-600 hover:bg-gray-700 text-white px-6 py-2 rounded-2xl text-base font-semibold shadow transition">
    ← Back to Dashboard
</a>
<a href="staff_add_customer.jsp"
   class="fixed bottom-7 right-7 bg-blue-500 hover:bg-blue-600 text-white px-6 py-2 rounded-2xl text-base font-semibold shadow transition">
    ➕ Add Customer
</a>
</body>
</html>
