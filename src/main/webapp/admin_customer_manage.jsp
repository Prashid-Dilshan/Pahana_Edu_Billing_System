<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.pahanaedu_billing_system.model.Customer" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <title>Manage Customers - Admin Dashboard</title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@700;400&display=swap" rel="stylesheet"/>
    <style>
        body { font-family: 'Inter', 'Segoe UI', Arial, sans-serif; }
        ::selection { background: #a5b4fc; }
        ::selection { background: #a5b4fc; }
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
<body class="bg-gradient-to-tr from-blue-50 via-blue-100 to-blue-300 min-h-screen flex flex-col items-center py-10 px-4">

<div class="w-full max-w-6xl bg-white rounded-3xl shadow-xl px-8 py-10 flex flex-col items-center">

    <!-- SVG Icon -->
    <svg class="w-14 h-14 text-blue-400 mb-6" fill="none" viewBox="0 0 48 48" aria-hidden="true">
        <circle cx="24" cy="24" r="22" stroke="currentColor" stroke-width="3" fill="#E3F0FF"/>
        <path d="M17 21a5 5 0 1 1 10 0 5 5 0 0 1-10 0ZM10 39c0-3.5 7.5-6 14-6s14 2.5 14 6v1H10v-1Z"
              stroke="#38BDF8" stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round"/>
    </svg>
    <h2 class="text-3xl font-bold text-blue-700 mb-2 text-center">Customer Management</h2>
    <span class="text-xs text-gray-400 mb-10 text-center">Admin Dashboard</span>

    <!-- Search -->
    <form action="AdminManageCustomerServlet?action=view" method="get" class="flex mb-8 w-full justify-center max-w-md">
        <input
                type="text"
                name="search"
                placeholder="Search customer by name"
                value="<%= request.getAttribute("search") != null ? request.getAttribute("search") : "" %>"
                class="px-4 py-2 border-2 border-blue-200 rounded-l-lg focus:outline-none focus:border-blue-400 w-full"
        />
        <button
                type="submit"
                class="px-6 py-2 bg-blue-400 hover:bg-blue-500 text-white font-semibold rounded-r-lg transition"
        > Search</button>
        <%
            if (request.getAttribute("search") != null && !((String)request.getAttribute("search")).isEmpty()) {
        %>
        <a href="AdminManageCustomerServlet?action=view"
           class="ml-3 px-4 py-2 bg-gray-200 hover:bg-gray-300 rounded-lg text-gray-800 font-semibold transition whitespace-nowrap">Clear</a>
        <%
            }
        %>
    </form>

    <!-- Success Message -->
    <%
        String msg = (String) request.getAttribute("msg");
        if (msg != null) {
    %>
    <div class="w-full mb-6 bg-green-100 text-green-800 border border-green-400 rounded-lg px-5 py-3 text-center shadow-md transition">
        <strong><%= msg %></strong>
    </div>
    <%
        }
    %>

    <!-- Table -->
    <div class="w-full overflow-x-auto rounded-2xl border border-gray-200 shadow-lg">
        <table class="min-w-full bg-white rounded-lg">
            <thead>
            <tr class="bg-blue-100 text-blue-900 text-base select-none">
                <th class="px-6 py-3 font-semibold text-center">Customer ID</th>
                <th class="px-6 py-3 font-semibold text-center">Name</th>
                <th class="px-6 py-3 font-semibold text-center">Address</th>
                <th class="px-6 py-3 font-semibold text-center">Phone Number</th>
                <th class="px-6 py-3 font-semibold text-center">Email</th>
                <th class="px-6 py-3 font-semibold text-center" style="min-width:160px;">Actions</th>
            </tr>
            </thead>
            <tbody>
            <%
                List<Customer> customers = (List<Customer>) request.getAttribute("customers");
                if (customers != null && !customers.isEmpty()) {
                    for (Customer c : customers) {
            %>
            <tr class="hover:bg-gray-100 transition">
                <td class="px-6 py-4 text-center whitespace-nowrap"><%= c.getCustomerid() %></td>
                <td class="px-6 py-4 text-center whitespace-nowrap"><%= c.getName() %></td>
                <td class="px-6 py-4 text-center whitespace-nowrap"><%= c.getAddress() %></td>
                <td class="px-6 py-4 text-center whitespace-nowrap"><%= c.getPhonenumber() %></td>
                <td class="px-6 py-4 text-center whitespace-nowrap"><%= c.getEmail() %></td>
                <td class="px-6 py-4 text-center whitespace-nowrap flex items-center justify-center gap-2">
                    <form action="AdminManageCustomerServlet" method="post" onsubmit="return confirm('Are you sure you want to delete this customer?');" style="display:inline;">
                        <input type="hidden" name="action" value="delete" />
                        <input type="hidden" name="customerid" value="<%= c.getCustomerid() %>" />
                        <button type="submit"
                                class="bg-red-500 hover:bg-red-600 text-white rounded px-3 py-1 text-sm font-semibold shadow-sm transition">
                            Delete
                        </button>
                    </form>
                </td>
            </tr>
            <%
                }
            } else {
            %>
            <tr>
                <td colspan="6" class="px-6 py-10 text-center text-gray-400 text-lg select-none">
                    No customer records found.
                </td>
            </tr>
            <%
                }
            %>
            </tbody>
        </table>
    </div>
</div>

</body>
</html>
