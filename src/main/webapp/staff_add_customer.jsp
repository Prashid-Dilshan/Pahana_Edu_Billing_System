<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Add Customer - Pahana Edu Billing System</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!-- Tailwind CSS CDN -->
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@700;400&display=swap" rel="stylesheet" />
    <style>
        body { font-family: 'Inter', 'Segoe UI', Arial, sans-serif; }
    </style>
</head>
<body class="bg-gradient-to-br from-gray-50 via-blue-50 to-blue-400 min-h-screen flex flex-col items-center justify-center">

<div class="w-full max-w-md bg-white rounded-3xl shadow-xl px-8 py-10 flex flex-col items-center">
    <svg class="w-14 h-14 text-blue-500 mb-5" fill="none" viewBox="0 0 48 48">
        <circle cx="24" cy="24" r="22" stroke="currentColor" stroke-width="3" fill="#E3F0FF" />
        <path d="M17 21a5 5 0 1 1 10 0 5 5 0 0 1-10 0ZM10 39c0-3.5 7.5-6 14-6s14 2.5 14 6v1H10v-1Z"
              stroke="#38BDF8" stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round"/>
    </svg>
    <h2 class="text-2xl font-bold text-blue-700 mb-2 text-center">Add New Customer</h2>
    <span class="text-xs text-gray-400 mb-8 text-center">Pahana Edu Billing System</span>

    <!-- Error message display -->
    <%
        String errorMsg = (String) request.getAttribute("error");
        if (errorMsg != null) {
    %>
    <div class="w-full mb-3 bg-red-100 text-red-700 border border-red-400 rounded-lg px-4 py-2 text-center">
        <%= errorMsg %>
    </div>
    <%
        }
    %>

    <form action="AddCustomerServlet?action=add" method="post" class="w-full">
        <div class="mb-4">
            <label class="block text-gray-700">Name<span class="text-red-500">*</span>:</label>
            <input type="text" name="name" required class="w-full px-3 py-2 border-2 border-blue-200 rounded-lg focus:outline-none focus:border-blue-500"/>
        </div>
        <div class="mb-4">
            <label class="block text-gray-700">Address:</label>
            <input type="text" name="address" class="w-full px-3 py-2 border-2 border-blue-200 rounded-lg focus:outline-none focus:border-blue-500"/>
        </div>
        <div class="mb-4">
            <label class="block text-gray-700">Phone Number:</label>
            <input type="text" name="phonenumber" class="w-full px-3 py-2 border-2 border-blue-200 rounded-lg focus:outline-none focus:border-blue-500"/>
        </div>
        <div class="mb-6">
            <label class="block text-gray-700">Email:</label>
            <input type="email" name="email" class="w-full px-3 py-2 border-2 border-blue-200 rounded-lg focus:outline-none focus:border-blue-500"/>
        </div>
        <button type="submit"
                class="w-full bg-blue-500 hover:bg-blue-600 text-white py-2 rounded-xl font-semibold text-lg shadow transition">
            ➕ Add Customer
        </button>
    </form>
</div>

<a href="staff_dashboard.html"
   class="fixed bottom-7 left-7 bg-gray-600 hover:bg-gray-700 text-white px-6 py-2 rounded-2xl text-base font-semibold shadow transition">
    ← Back to Dashboard
</a>
</body>
</html>
