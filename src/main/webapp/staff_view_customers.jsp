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
<body class="bg-gradient-to-tr from-blue-50 via-blue-100 to-blue-300 min-h-screen flex flex-col items-center justify-center p-6">

<div class="w-full max-w-4xl bg-white rounded-3xl shadow-2xl px-8 py-10 my-12 flex flex-col items-center">
    <!-- Header Icon & Title -->
    <h2 class="text-2xl sm:text-3xl font-extrabold text-blue-700 mb-1 text-center tracking-tight">Customer List</h2>
    <span class="text-sm text-gray-400 mb-6 text-center">Pahana Edu Billing System</span>

    <!-- Success message display -->
    <%
        String msg = (String) session.getAttribute("msg");
        if (msg != null) {
    %>
    <div class="w-full mb-8 bg-green-100 text-green-800 border border-green-400 rounded-lg px-6 py-3 text-center shadow-md transition">
        <strong><%= msg %></strong>
    </div>
    <%
            session.removeAttribute("msg");
        }
    %>

    <div class="overflow-x-auto w-full rounded-lg border border-gray-200 shadow-sm">
        <table class="min-w-full table-auto bg-white rounded-lg">
            <thead>
            <tr class="bg-blue-100 text-blue-900 text-left">
                <th class="px-6 py-3 border-b font-semibold text-sm">Customer ID</th>
                <th class="px-6 py-3 border-b font-semibold text-sm">Name</th>
                <th class="px-6 py-3 border-b font-semibold text-sm">Address</th>
                <th class="px-6 py-3 border-b font-semibold text-sm">Phone Number</th>
                <th class="px-6 py-3 border-b font-semibold text-sm">Email</th>
                <th class="px-6 py-3 border-b font-semibold text-sm text-center">Actions</th>
            </tr>
            </thead>
            <tbody>
            <%
                List<Customer> customers = (List<Customer>) request.getAttribute("customers");
                if (customers != null && !customers.isEmpty()) {
                    for (Customer customer : customers) {
            %>
            <tr class="hover:bg-blue-50 transition">
                <td class="px-6 py-3 border-b text-sm text-gray-900 font-medium"><%= customer.getCustomerid() %></td>
                <td class="px-6 py-3 border-b text-sm text-gray-700"><%= customer.getName() %></td>
                <td class="px-6 py-3 border-b text-sm text-gray-700"><%= customer.getAddress() %></td>
                <td class="px-6 py-3 border-b text-sm text-gray-700"><%= customer.getPhonenumber() %></td>
                <td class="px-6 py-3 border-b text-sm text-gray-700"><%= customer.getEmail() %></td>
                <td class="px-6 py-3 border-b text-center">
                    <a href="AddCustomerServlet?action=edit&customerid=<%= customer.getCustomerid() %>"
                       class="inline-block bg-emerald-500 hover:bg-emerald-600 text-white font-bold px-5 py-2 rounded-lg shadow-sm transition text-sm focus:outline-none focus:ring-2 focus:ring-emerald-400 select-none">
                        Edit
                    </a>

                </td>
            </tr>
            <%
                }
            } else {
            %>
            <tr>
                <td class="px-6 py-4 text-center text-gray-400 italic" colspan="6">No customers found.</td>
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
