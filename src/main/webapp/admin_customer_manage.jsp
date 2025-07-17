<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.pahanaedu_billing_system.model.Customer" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <title>Manage Customers - Admin | Pahana Edu Billing System</title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@700;400&display=swap" rel="stylesheet"/>
    <style>
        body { font-family: 'Inter', 'Segoe UI', Arial, sans-serif; }
    </style>
</head>
<body class="bg-gradient-to-br from-yellow-50 via-orange-50 to-blue-100 min-h-screen flex flex-col items-center justify-center">
<div class="w-full max-w-5xl bg-white rounded-3xl shadow-xl px-8 py-10 flex flex-col items-center mb-10">
    <svg class="w-14 h-14 text-orange-400 mb-5" fill="none" viewBox="0 0 48 48">
        <circle cx="24" cy="24" r="22" stroke="currentColor" stroke-width="3" fill="#FFEDD5"/>
        <path d="M17 21a5 5 0 1 1 10 0 5 5 0 0 1-10 0ZM10 39c0-3.5 7.5-6 14-6s14 2.5 14 6v1H10v-1Z"
              stroke="#F59E42" stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round"/>
    </svg>
    <h2 class="text-2xl font-bold text-orange-700 mb-2 text-center">Admin - Manage Customers</h2>
    <span class="text-xs text-gray-400 mb-8 text-center">Pahana Edu Billing System</span>

    <!-- Search form -->
    <form action="AdminManageCustomerServlet" method="get" class="flex mb-8 w-full justify-center">
        <input
                type="text"
                name="search"
                placeholder="Search customer by name"
                value="<%= request.getAttribute("search") != null ? request.getAttribute("search") : "" %>"
                class="px-4 py-2 border-2 border-yellow-200 rounded-l-lg focus:outline-none focus:border-yellow-400 w-64"
        />
        <button
                type="submit"
                class="px-6 py-2 bg-yellow-400 hover:bg-yellow-500 text-yellow-900 font-semibold rounded-r-lg transition"
        >🔍 Search</button>
        <%
            if (request.getAttribute("search") != null && !((String)request.getAttribute("search")).isEmpty()) {
        %>
        <a href="AdminManageCustomerServlet"
           class="ml-3 px-4 py-2 bg-gray-200 hover:bg-gray-300 rounded-lg text-gray-800 font-semibold transition">Clear</a>
        <%
            }
        %>
    </form>

    <% String msg = (String) session.getAttribute("msg"); if (msg != null) { %>
    <div class="w-full mb-4 bg-green-100 text-green-800 border border-green-400 rounded-lg px-4 py-2 text-center">
        <strong><%= msg %></strong>
    </div>
    <% session.removeAttribute("msg"); } %>
    <div class="w-full overflow-x-auto">
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
            <tr class="hover:bg-orange-50">
                <td class="px-3 py-2 text-center"><%= customer.getCustomerid() %></td>
                <td class="px-3 py-2"><%= customer.getName() %></td>
                <td class="px-3 py-2"><%= customer.getAddress() %></td>
                <td class="px-3 py-2"><%= customer.getPhonenumber() %></td>
                <td class="px-3 py-2"><%= customer.getEmail() %></td>
                <td class="px-3 py-2 text-center">
                    <form action="DeleteCustomerServlet" method="post" style="display:inline;">
                        <input type="hidden" name="customerid" value="<%= customer.getCustomerid() %>" />
                        <button type="submit"
                                onclick="return confirm('Are you sure you want to delete this customer?');"
                                class="bg-red-500 hover:bg-red-700 text-white px-4 py-1 rounded-xl text-sm transition">
                            🗑️ Delete
                        </button>
                    </form>
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
<a href="admin_dashboard.html"
   class="fixed bottom-7 left-7 bg-gray-600 hover:bg-gray-700 text-white px-6 py-2 rounded-2xl text-base font-semibold shadow transition">
    ← Back to Admin Dashboard
</a>
</body>
</html>
