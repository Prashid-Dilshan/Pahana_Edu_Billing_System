<%@ page import="java.util.*, com.example.pahanaedu_billing_system.dto.StaffSelectCustomerDTO" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en" class="scroll-smooth">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Select Customer</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        ::-webkit-scrollbar { width: 8px; height: 8px; }
        ::-webkit-scrollbar-thumb { background-color: #60a5fa; border-radius: 4px; }
    </style>
</head>
<body class="bg-gradient-to-tr from-blue-50 via-blue-100 to-blue-300 font-sans min-h-screen flex flex-col items-center px-4 py-10">

<h2 style="margin-bottom: 24px;" class="text-2xl sm:text-3xl font-extrabold text-blue-700 mb-1 text-center tracking-tight">
    <span></span>
    <span>Select a Customer for Billing</span>
</h2>

<!-- Search Form -->
<form method="get" action="selectCustomer" class="w-full max-w-md mb-8 mx-auto flex gap-2">
    <input
            type="text"
            name="searchName"
            placeholder="Search by customer name"
            class="flex-grow px-4 py-3 rounded-l-lg border border-gray-300 text-gray-700 focus:outline-none focus:ring-2 focus:ring-blue-500"
            autocomplete="off"
            value="<%= request.getParameter("searchName") != null ? request.getParameter("searchName") : "" %>"
    />
    <button
            type="submit"
            class="px-6 py-3 bg-blue-600 text-white rounded-r-lg hover:bg-blue-700 transition font-semibold">
        Search
    </button>
</form>

<%
    List<StaffSelectCustomerDTO> customers = (List<StaffSelectCustomerDTO>) request.getAttribute("customers");
    if (customers != null && !customers.isEmpty()) {
%>
<form action="GenerateBillServlet" method="post" class="w-full max-w-6xl mx-auto overflow-x-auto rounded-lg shadow-lg bg-white">
    <table class="min-w-full table-auto border-collapse border border-gray-300">
        <thead class="bg-blue-100 text-blue-900 font-semibold select-none">
        <tr>
            <th class="border border-gray-300 px-5 py-3 w-16 text-center">Select</th>
            <th class="border border-gray-300 px-5 py-3 text-left">ID</th>
            <th class="border border-gray-300 px-5 py-3 text-left">Name</th>
            <th class="border border-gray-300 px-5 py-3 text-left">Address</th>
            <th class="border border-gray-300 px-5 py-3 text-left">Phone</th>
            <th class="border border-gray-300 px-5 py-3 text-left">Email</th>
        </tr>
        </thead>
        <tbody class="divide-y divide-gray-200">
        <% for (StaffSelectCustomerDTO c : customers) { %>
        <tr class="hover:bg-blue-50 cursor-pointer">
            <td class="border border-gray-300 px-5 py-3 text-center">
                <input type="radio" name="customerId" value="<%= c.getCustomerid() %>" required class="cursor-pointer"/>
            </td>
            <td class="border border-gray-300 px-5 py-3 whitespace-nowrap"><%= c.getCustomerid() %></td>
            <td class="border border-gray-300 px-5 py-3 max-w-xs truncate" title="<%= c.getName() %>"><%= c.getName() %></td>
            <td class="border border-gray-300 px-5 py-3 max-w-sm truncate" title="<%= c.getAddress() %>"><%= c.getAddress() %></td>
            <td class="border border-gray-300 px-5 py-3 max-w-xs whitespace-nowrap"><%= c.getPhonenumber() %></td>
            <td class="border border-gray-300 px-5 py-3 max-w-xs truncate" title="<%= c.getEmail() %>"><%= c.getEmail() %></td>
        </tr>
        <% } %>
        </tbody>
    </table>

    <div class="flex justify-end mt-6 px-5 pb-5">
        <input type="submit" value="Generate Bill"
               class="bg-green-600 hover:bg-green-700 text-white px-6 py-2 rounded-lg font-semibold shadow-md cursor-pointer transition" />
    </div>
</form>
<% } else { %>
<p class="text-center text-red-600 text-lg font-semibold mt-20 max-w-lg">
    No customers found.
</p>
<% } %>

<div class="mt-10 w-full max-w-6xl px-5">
    <a href="staff_cart.jsp"
       class="inline-block bg-gray-200 text-gray-800 rounded-lg px-6 py-2 font-semibold shadow-sm hover:bg-gray-300 transition">
        ⬅ Back to Cart
    </a>
</div>

</body>
</html>
