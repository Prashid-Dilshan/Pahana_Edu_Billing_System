<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.pahanaedu_billing_system.dto.AdminManageStaffDTO" %>
<%
    // Staff was set by servlet: request.setAttribute("staff", staffDTO);
    AdminManageStaffDTO staff = (AdminManageStaffDTO) request.getAttribute("staff");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Edit Staff - Admin Dashboard</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!-- Tailwind CSS CDN -->
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Inter:wght@700;400&display=swap"/>
    <style>
        body { font-family: 'Inter', 'Segoe UI', Arial, sans-serif; }
        ::-webkit-scrollbar { width: 8px; height: 8px; }
        ::-webkit-scrollbar-thumb { background-color: #60a5fa; border-radius: 4px; }
    </style>
</head>
<body class="bg-gradient-to-tr from-blue-50 via-blue-100 to-blue-300 min-h-screen flex items-center justify-center p-6">

<div class="w-full max-w-3xl bg-white rounded-3xl shadow-xl md:flex my-12 overflow-hidden">
    <!-- Left: Logo & Title -->
    <div class="hidden md:flex flex-col items-center justify-center bg-blue-50 rounded-l-3xl py-14 px-10 w-2/5">
        <svg class="w-16 h-16 text-blue-500 mb-6" fill="none" viewBox="0 0 48 48" aria-hidden="true">
            <circle cx="24" cy="24" r="22" stroke="currentColor" stroke-width="3" fill="#E3F0FF"/>
            <path d="M17 21a5 5 0 1 1 10 0 5 5 0 0 1-10 0ZM10 39c0-3.5 7.5-6 14-6s14 2.5 14 6v1H10v-1Z"
                  stroke="#38BDF8" stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round"/>
        </svg>
        <h2 class="text-2xl font-bold text-blue-700 mb-2 text-center">Edit Staff Member</h2>
        <span class="text-sm text-gray-400 text-center">Admin Dashboard</span>
    </div>

    <!-- Right: Form -->
    <div class="w-full md:w-3/5 py-10 px-6 md:px-12">
        <div class="md:hidden flex flex-col items-center mb-6">
            <svg class="w-14 h-14 text-blue-500 mb-3" fill="none" viewBox="0 0 48 48" aria-hidden="true">
                <circle cx="24" cy="24" r="22" stroke="currentColor" stroke-width="3" fill="#E3F0FF"/>
                <path d="M17 21a5 5 0 1 1 10 0 5 5 0 0 1-10 0ZM10 39c0-3.5 7.5-6 14-6s14 2.5 14 6v1H10v-1Z"
                      stroke="#38BDF8" stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round"/>
            </svg>
            <h2 class="text-xl font-bold text-blue-700 mb-1 text-center">Edit Staff Member</h2>
            <span class="text-xs text-gray-400 text-center mb-4">Admin Dashboard</span>
        </div>
        <% if (request.getAttribute("message") != null) { %>
        <div class="w-full mb-4 bg-green-100 text-green-800 border border-green-400 rounded-lg px-4 py-2 text-center transition shadow-sm">
            <strong><%= request.getAttribute("message") %></strong>
        </div>
        <% } %>
        <% if (request.getAttribute("error") != null) { %>
        <div class="w-full mb-4 bg-red-100 text-red-700 border border-red-400 rounded-lg px-4 py-2 text-center transition shadow-sm">
            <%= request.getAttribute("error") %>
        </div>
        <% } %>
        <form action="AdminManageStaffServlet" method="post" class="space-y-6">
            <input type="hidden" name="action" value="edit" />
            <div class="flex flex-col md:flex-row md:items-center gap-4">
                <label class="md:w-36 font-semibold text-gray-700">Staff ID</label>
                <input type="text" name="staffid" readonly
                       value="<%= staff != null ? staff.getStaffid() : "" %>"
                       class="bg-gray-100 text-gray-500 px-4 py-2 rounded-lg border border-gray-300 w-full md:flex-1 focus:outline-none cursor-not-allowed" />
            </div>
            <div class="flex flex-col md:flex-row md:items-center gap-4">
                <label class="md:w-36 font-semibold text-gray-700">Staff Name</label>
                <input type="text" name="name"
                       value="<%= staff != null ? staff.getName() : "" %>"
                       class="flex-1 px-4 py-2 border border-gray-300 rounded-lg text-base focus:ring-2 focus:ring-blue-300 focus:outline-none bg-blue-50 transition"/>
            </div>
            <div class="flex flex-col md:flex-row md:items-center gap-4">
                <label class="md:w-36 font-semibold text-gray-700">Address</label>
                <input type="text" name="address"
                       value="<%= staff != null ? staff.getAddress() : "" %>"
                       class="flex-1 px-4 py-2 border border-gray-300 rounded-lg text-base focus:ring-2 focus:ring-blue-300 focus:outline-none bg-blue-50 transition"/>
            </div>
            <div class="flex flex-col md:flex-row md:items-center gap-4">
                <label class="md:w-36 font-semibold text-gray-700">Mobile Number</label>
                <input type="text" name="mobilenumber"
                       value="<%= staff != null ? staff.getMobilenumber() : "" %>"
                       class="flex-1 px-4 py-2 border border-gray-300 rounded-lg text-base focus:ring-2 focus:ring-blue-300 focus:outline-none bg-blue-50 transition"/>
            </div>
            <div class="flex flex-col md:flex-row md:items-center gap-4">
                <label class="md:w-36 font-semibold text-gray-700">Username</label>
                <input type="text" name="username"
                       value="<%= staff != null ? staff.getUsername() : "" %>"
                       class="flex-1 px-4 py-2 border border-gray-300 rounded-lg text-base focus:ring-2 focus:ring-blue-300 focus:outline-none bg-blue-50 transition"/>
            </div>
            <div class="flex flex-col md:flex-row md:items-center gap-4">
                <label class="md:w-36 font-semibold text-gray-700">Password</label>
                <input type="text" name="password"
                       value="<%= staff != null ? staff.getPassword() : "" %>"
                       class="flex-1 px-4 py-2 border border-gray-300 rounded-lg text-base focus:ring-2 focus:ring-blue-300 focus:outline-none bg-blue-50 transition"/>
            </div>
            <button type="submit"
                    class="w-full bg-blue-600 hover:bg-blue-700 text-white py-3 rounded-lg font-semibold text-lg shadow transition focus:outline-none focus:ring-2 focus:ring-blue-400">
                Update Staff
            </button>
        </form>
    </div>
</div>
</body>
</html>
