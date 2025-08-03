<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*, com.example.pahana_edu_billing_system.model.Staff" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Staff List - Admin Dashboard</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!-- Tailwind CSS CDN -->
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@700;400&display=swap" rel="stylesheet"/>
    <style>
        body { font-family: 'Inter', 'Segoe UI', Arial, sans-serif; }
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


    <h2 class="text-2xl sm:text-3xl font-extrabold text-blue-700 mb-1 text-center tracking-tight">Staff Members List</h2>
    <span class="text-xs text-gray-400 mb-10 text-center">Admin Dashboard</span>

    <!-- Success/Error Messages -->
    <% if (request.getAttribute("message") != null) { %>
    <div class="w-full mb-6 bg-green-100 text-green-800 border border-green-400 rounded-lg px-5 py-3 text-center shadow-md transition">
        <strong><%= request.getAttribute("message") %></strong>
    </div>
    <% } else if (request.getAttribute("error") != null) { %>
    <div class="w-full mb-6 bg-red-100 text-red-700 border border-red-400 rounded-lg px-5 py-3 text-center shadow-md transition">
        <%= request.getAttribute("error") %>
    </div>
    <% } %>

    <div class="w-full overflow-x-auto rounded-2xl border border-gray-200 shadow-lg">
        <table class="min-w-full bg-white rounded-lg">
            <thead>
            <tr class="bg-blue-100 text-blue-900 text-base select-none">
                <th class="px-6 py-3 font-semibold text-center">Staff ID</th>
                <th class="px-6 py-3 font-semibold text-center">Name</th>
                <th class="px-6 py-3 font-semibold text-center">Address</th>
                <th class="px-6 py-3 font-semibold text-center">Mobile</th>
                <th class="px-6 py-3 font-semibold text-center">Username</th>
                <th class="px-6 py-3 font-semibold text-center">Actions</th>
            </tr>
            </thead>
            <tbody>
            <%
                List<Staff> staffList = (List<Staff>) request.getAttribute("staffList");
                if (staffList != null && !staffList.isEmpty()) {
                    for (Staff s : staffList) {
            %>
            <tr class="hover:bg-gray-100 transition">
                <td class="px-6 py-4 text-center whitespace-nowrap"><%= s.getStaffid() %></td>
                <td class="px-6 py-4 text-center whitespace-nowrap"><%= s.getName() %></td>
                <td class="px-6 py-4 text-center whitespace-nowrap"><%= s.getAddress() %></td>
                <td class="px-6 py-4 text-center whitespace-nowrap"><%= s.getMobilenumber() %></td>
                <td class="px-6 py-4 text-center whitespace-nowrap"><%= s.getUsername() %></td>
                <td class="px-6 py-4 text-center whitespace-nowrap flex items-center justify-center gap-2">
                    <form action="Admin_edit_staff.jsp" method="get" class="inline">
                        <input type="hidden" name="staffid" value="<%= s.getStaffid() %>" />
                        <input type="hidden" name="name" value="<%= s.getName() %>" />
                        <input type="hidden" name="address" value="<%= s.getAddress() %>" />
                        <input type="hidden" name="mobilenumber" value="<%= s.getMobilenumber() %>" />
                        <input type="hidden" name="username" value="<%= s.getUsername() %>" />
                        <input type="hidden" name="password" value="<%= s.getPassword() %>" />
                        <input type="submit" value="Edit"
                               class="bg-emerald-500 hover:bg-emerald-600 text-white rounded px-3 py-1 text-sm font-semibold shadow-sm cursor-pointer transition" />
                    </form>
                    <a href="StaffServlet?action=delete&staffid=<%= s.getStaffid() %>"
                       onclick="return confirm('Are you sure you want to delete this staff member?');"
                       class="bg-red-500 hover:bg-red-600 text-white rounded px-3 py-1 text-sm font-semibold shadow-sm transition cursor-pointer">
                        Delete
                    </a>
                </td>
            </tr>
            <%
                }
            } else {
            %>
            <tr>
                <td colspan="6" class="px-6 py-10 text-center text-gray-400 text-lg select-none">
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

</body>
</html>
