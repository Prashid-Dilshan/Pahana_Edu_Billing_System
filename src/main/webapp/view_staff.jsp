<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*, com.example.pahana_edu_billing_system.model.Staff" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Staff List - Pahana Edu Billing System</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!-- Tailwind CSS CDN -->
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@700;400&display=swap" rel="stylesheet"/>
    <style>
        body { font-family: 'Inter', 'Segoe UI', Arial, sans-serif; }
    </style>
</head>
<body class="bg-gradient-to-br from-gray-50 via-blue-50 to-blue-200 min-h-screen flex flex-col items-center justify-center">

<div class="w-full max-w-5xl bg-white rounded-3xl shadow-xl px-8 py-10 flex flex-col items-center mb-10">

    <svg class="w-14 h-14 text-blue-400 mb-5" fill="none" viewBox="0 0 48 48">
        <circle cx="24" cy="24" r="22" stroke="currentColor" stroke-width="3" fill="#E3F0FF"/>
        <path d="M17 21a5 5 0 1 1 10 0 5 5 0 0 1-10 0ZM10 39c0-3.5 7.5-6 14-6s14 2.5 14 6v1H10v-1Z"
              stroke="#38BDF8" stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round"/>
    </svg>
    <h2 class="text-2xl md:text-3xl font-bold text-blue-700 mb-2 text-center">Staff Members List</h2>
    <span class="text-xs text-gray-400 mb-8 text-center">Pahana Edu Billing System - Admin</span>

    <%-- Success/Error message area --%>
    <% if (request.getAttribute("message") != null) { %>
    <div class="w-full mb-4 bg-green-100 text-green-800 border border-green-400 rounded-lg px-4 py-2 text-center">
        <strong><%= request.getAttribute("message") %></strong>
    </div>
    <% } else if (request.getAttribute("error") != null) { %>
    <div class="w-full mb-4 bg-red-100 text-red-700 border border-red-400 rounded-lg px-4 py-2 text-center">
        <%= request.getAttribute("error") %>
    </div>
    <% } %>

    <div class="w-full overflow-x-auto rounded-2xl border border-gray-200 shadow">
        <table class="min-w-full bg-white rounded-lg">
            <thead>
            <tr class="bg-blue-100 text-blue-900 text-base">
                <th class="px-5 py-3 font-semibold text-center">Staff ID</th>
                <th class="px-5 py-3 font-semibold text-center">Name</th>
                <th class="px-5 py-3 font-semibold text-center">Address</th>
                <th class="px-5 py-3 font-semibold text-center">Mobile</th>
                <th class="px-5 py-3 font-semibold text-center">Username</th>
                <th class="px-5 py-3 font-semibold text-center">Actions</th>
            </tr>
            </thead>
            <tbody>
            <%
                List<Staff> staffList = (List<Staff>) request.getAttribute("staffList");
                if (staffList != null && !staffList.isEmpty()) {
                    for (Staff s : staffList) {
            %>
            <tr class="hover:bg-gray-100">
                <td class="px-5 py-3 text-center"><%= s.getStaffid() %></td>
                <td class="px-5 py-3 text-center"><%= s.getName() %></td>
                <td class="px-5 py-3 text-center"><%= s.getAddress() %></td>
                <td class="px-5 py-3 text-center"><%= s.getMobilenumber() %></td>
                <td class="px-5 py-3 text-center"><%= s.getUsername() %></td>
                <td class="px-5 py-3 text-center">
                    <form action="edit_staff.jsp" method="get" class="inline">
                        <input type="hidden" name="staffid" value="<%= s.getStaffid() %>" />
                        <input type="hidden" name="name" value="<%= s.getName() %>" />
                        <input type="hidden" name="address" value="<%= s.getAddress() %>" />
                        <input type="hidden" name="mobilenumber" value="<%= s.getMobilenumber() %>" />
                        <input type="hidden" name="username" value="<%= s.getUsername() %>" />
                        <input type="hidden" name="password" value="<%= s.getPassword() %>" />
                        <input type="submit" value="Edit" class="bg-emerald-500 hover:bg-emerald-600 text-white rounded px-3 py-1 font-semibold text-sm shadow-sm cursor-pointer transition"/>
                    </form>
                    <a href="Admin_DeleteStaffServlet?staffid=<%= s.getStaffid() %>"
                       onclick="return confirm('Are you sure you want to delete this staff member?');"
                       class="bg-red-500 hover:bg-red-600 text-white rounded px-3 py-1 font-semibold text-sm shadow-sm ml-1 transition">
                        Delete
                    </a>
                </td>
            </tr>
            <%
                }
            } else {
            %>
            <tr>
                <td colspan="6" class="px-5 py-8 text-center text-gray-400 text-base">
                    No staff records found or staff list not loaded.
                </td>
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
