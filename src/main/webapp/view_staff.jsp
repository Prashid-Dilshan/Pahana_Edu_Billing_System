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
    <style>body { font-family: 'Inter', 'Segoe UI', Arial, sans-serif; }</style>
</head>
<body class="bg-gradient-to-br from-gray-50 via-blue-50 to-blue-200 min-h-screen px-2 py-8">

<div class="max-w-5xl bg-white mx-auto rounded-3xl shadow-2xl p-8">
    <h2 class="text-2xl md:text-3xl font-bold text-blue-700 mb-7 flex items-center gap-3">
        <svg class="w-7 h-7 text-blue-400" fill="none" viewBox="0 0 48 48">
            <circle cx="24" cy="24" r="22" stroke="currentColor" stroke-width="3" fill="#E3F0FF"/>
            <path d="M17 21a5 5 0 1 1 10 0 5 5 0 0 1-10 0ZM10 39c0-3.5 7.5-6 14-6s14 2.5 14 6v1H10v-1Z" stroke="#38BDF8" stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round"/>
        </svg>
        Staff Members List
    </h2>

    <%
        List<Staff> staffList = (List<Staff>) request.getAttribute("staffList");
        if (staffList != null && !staffList.isEmpty()) {
    %>
    <div class="overflow-x-auto rounded-2xl">
        <table class="min-w-full border">
            <thead>
            <tr class="bg-blue-600 text-white text-base">
                <th class="py-3 px-5 font-semibold">Staff ID</th>
                <th class="py-3 px-5 font-semibold">Name</th>
                <th class="py-3 px-5 font-semibold">Address</th>
                <th class="py-3 px-5 font-semibold">Mobile</th>
                <th class="py-3 px-5 font-semibold">Username</th>
                <th class="py-3 px-5 font-semibold">Actions</th>
            </tr>
            </thead>
            <tbody>
            <%
                for (Staff s : staffList) {
            %>
            <tr class="even:bg-blue-50 hover:bg-blue-100 transition">
                <td class="py-2 px-4"><%= s.getStaffid() %></td>
                <td class="py-2 px-4"><%= s.getName() %></td>
                <td class="py-2 px-4"><%= s.getAddress() %></td>
                <td class="py-2 px-4"><%= s.getMobilenumber() %></td>
                <td class="py-2 px-4"><%= s.getUsername() %></td>
                <td class="py-2 px-4">
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
            %>
            </tbody>
        </table>
    </div>
    <%
    } else {
    %>
    <p class="text-red-600 text-lg font-semibold mt-7 flex items-center gap-2">
        <span>❌</span> No staff records found or staff list not loaded.
    </p>
    <%
        }
    %>
    <a href="admin_dashboard.html"
       class="inline-block mt-8 text-blue-700 font-medium hover:underline hover:text-blue-900 transition text-base">
        &larr; Back to Admin Dashboard
    </a>
</div>
</body>
</html>
