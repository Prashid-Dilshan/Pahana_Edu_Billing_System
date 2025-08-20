<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.pahanaedu_billing_system.model.Customer" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Edit Customer - Pahana Edu Billing System</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!-- Tailwind CSS CDN -->
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@700;400&display=swap" rel="stylesheet" />
    <style>
        body { font-family: 'Inter', 'Segoe UI', Arial, sans-serif; }
        ::selection { background: #a5b4fc; }
        ::-webkit-scrollbar { width: 8px; height: 8px; }
        ::-webkit-scrollbar-thumb { background-color: #60a5fa; border-radius: 4px; }
    </style>
</head>
<body class="bg-gradient-to-tr from-blue-50 via-blue-100 to-blue-300 min-h-screen flex items-center justify-center p-6">

<div class="w-full max-w-2xl bg-white rounded-3xl shadow-2xl px-8 md:px-12 py-10 flex flex-col items-center">

    <h2 class="text-2xl sm:text-3xl font-extrabold text-blue-700 mb-1 text-center tracking-tight">Edit Customer</h2>
    <span class="text-sm text-gray-400 mb-8 text-center">Pahana Edu Billing System</span>

    <%-- Error display --%>
    <%
        String errorMsg = (String) request.getAttribute("error");
        if (errorMsg != null) {
    %>
    <div class="w-full mb-6 bg-red-100 text-red-700 border border-red-400 rounded-lg px-5 py-3 text-center shadow-md transition">
        <%= errorMsg %>
    </div>
    <%
        }
        Customer customer = (Customer) request.getAttribute("customer");
        if (customer == null) {
    %>
    <div class="text-red-600 text-center mb-4 font-semibold">No customer data loaded.</div>
    <%
        }
    %>

    <form action="AddCustomerServlet?action=edit" method="post" class="w-full space-y-6">
        <input type="hidden" name="customerid" value="<%= customer != null ? customer.getCustomerid() : "" %>"/>

        <!-- Name -->
        <div class="flex flex-col w-full">
            <label for="name" class="font-semibold text-gray-700 mb-1">Name<span class="text-red-500">*</span></label>
            <input type="text" name="name" id="name" required
                   value="<%= customer != null ? customer.getName() : "" %>"
                   class="w-full px-4 py-2 border border-gray-300 rounded-lg text-base focus:ring-2 focus:ring-blue-400 focus:outline-none bg-blue-50 transition"/>
        </div>

        <!-- Address -->
        <div class="flex flex-col w-full">
            <label for="address" class="font-semibold text-gray-700 mb-1">Address</label>
            <input type="text" name="address" id="address"
                   value="<%= customer != null ? customer.getAddress() : "" %>"
                   class="w-full px-4 py-2 border border-gray-300 rounded-lg text-base focus:ring-2 focus:ring-blue-400 focus:outline-none bg-blue-50 transition"/>
        </div>

        <!-- Mobile Number -->
        <div class="flex flex-col w-full">
            <label for="phonenumber" class="font-semibold text-gray-700 mb-1">Mobile Number</label>
            <input type="text" name="phonenumber" id="phonenumber"
                   value="<%= customer != null ? customer.getPhonenumber() : "" %>"
                   class="w-full px-4 py-2 border border-gray-300 rounded-lg text-base focus:ring-2 focus:ring-blue-400 focus:outline-none bg-blue-50 transition"/>
        </div>

        <!-- Email -->
        <div class="flex flex-col w-full">
            <label for="email" class="font-semibold text-gray-700 mb-1">Email</label>
            <input type="email" name="email" id="email"
                   value="<%= customer != null ? customer.getEmail() : "" %>"
                   class="w-full px-4 py-2 border border-gray-300 rounded-lg text-base focus:ring-2 focus:ring-blue-400 focus:outline-none bg-blue-50 transition"/>
        </div>

        <!-- Submit Button -->
        <button type="submit"
                class="w-full bg-blue-600 hover:bg-blue-700 text-white py-3 rounded-lg font-semibold text-lg shadow transition focus:outline-none focus:ring-2 focus:ring-blue-500 mt-4">
            Update Customer
        </button>
    </form>

</div>

</body>
</html>
