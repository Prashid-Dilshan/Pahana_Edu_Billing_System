<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Edit Staff - Pahana Edu Billing System</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!-- Tailwind CSS CDN -->
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@700;400&display=swap" rel="stylesheet"/>
    <style>
        body { font-family: 'Inter', 'Segoe UI', Arial, sans-serif; }
    </style>
</head>
<body class="bg-gradient-to-br from-gray-50 via-blue-50 to-blue-300 min-h-screen flex items-center justify-center">
<div class="w-full max-w-2xl bg-white rounded-3xl shadow-xl p-8">
    <div class="flex flex-col items-center mb-6">
        <svg class="w-12 h-12 text-blue-500 mb-2" fill="none" viewBox="0 0 48 48">
            <circle cx="24" cy="24" r="22" stroke="currentColor" stroke-width="3" fill="#E3F0FF"/>
            <path d="M17 21a5 5 0 1 1 10 0 5 5 0 0 1-10 0ZM10 39c0-3.5 7.5-6 14-6s14 2.5 14 6v1H10v-1Z" stroke="#38BDF8" stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round"/>
        </svg>
        <h2 class="text-2xl font-bold text-blue-700 mb-1 text-center">Edit Staff Member</h2>
        <span class="text-xs text-gray-400 text-center">Pahana Edu Billing System</span>
    </div>
    <form action="Admin_EditStaffServlet" method="post" class="space-y-4">
        <div class="flex flex-col md:flex-row md:items-center gap-2">
            <label class="md:w-40 font-semibold text-gray-700">Staff ID:</label>
            <input type="text" name="staffid"
                   value="<%= request.getParameter("staffid") %>" readonly
                   class="bg-gray-100 text-gray-500 px-3 py-2 rounded-lg border border-gray-300 w-full md:flex-1 focus:outline-none cursor-not-allowed" />
        </div>
        <div class="flex flex-col md:flex-row md:items-center gap-2">
            <label class="md:w-40 font-semibold text-gray-700">Name:</label>
            <input type="text" name="name"
                   value="<%= request.getParameter("name") %>"
                   class="px-3 py-2 rounded-lg border border-gray-300 w-full md:flex-1 focus:ring-2 focus:ring-blue-300 focus:outline-none bg-blue-50" />
        </div>
        <div class="flex flex-col md:flex-row md:items-center gap-2">
            <label class="md:w-40 font-semibold text-gray-700">Address:</label>
            <input type="text" name="address"
                   value="<%= request.getParameter("address") %>"
                   class="px-3 py-2 rounded-lg border border-gray-300 w-full md:flex-1 focus:ring-2 focus:ring-blue-300 focus:outline-none bg-blue-50" />
        </div>
        <div class="flex flex-col md:flex-row md:items-center gap-2">
            <label class="md:w-40 font-semibold text-gray-700">Mobile Number:</label>
            <input type="text" name="mobilenumber"
                   value="<%= request.getParameter("mobilenumber") %>"
                   class="px-3 py-2 rounded-lg border border-gray-300 w-full md:flex-1 focus:ring-2 focus:ring-blue-300 focus:outline-none bg-blue-50" />
        </div>
        <div class="flex flex-col md:flex-row md:items-center gap-2">
            <label class="md:w-40 font-semibold text-gray-700">Username:</label>
            <input type="text" name="username"
                   value="<%= request.getParameter("username") %>"
                   class="px-3 py-2 rounded-lg border border-gray-300 w-full md:flex-1 focus:ring-2 focus:ring-blue-300 focus:outline-none bg-blue-50" />
        </div>
        <div class="flex flex-col md:flex-row md:items-center gap-2">
            <label class="md:w-40 font-semibold text-gray-700">Password:</label>
            <input type="text" name="password"
                   value="<%= request.getParameter("password") %>"
                   class="px-3 py-2 rounded-lg border border-gray-300 w-full md:flex-1 focus:ring-2 focus:ring-blue-300 focus:outline-none bg-blue-50" />
        </div>
        <button type="submit"
                class="w-full bg-blue-600 hover:bg-blue-700 text-white py-3 rounded-lg font-semibold text-lg shadow transition focus:outline-none focus:ring-2 focus:ring-blue-400 mt-3">
            Update
        </button>
    </form>
    <a href="Admin_ViewStaffServlet"
       class="block mt-8 text-blue-700 text-center font-medium hover:underline hover:text-blue-800 transition">
        &larr; Back to Staff List
    </a>
</div>
</body>
</html>
