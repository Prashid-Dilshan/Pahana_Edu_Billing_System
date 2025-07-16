<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>Add Staff Member - Pahana Edu Billing System</title>
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <!-- Tailwind CSS CDN -->
  <script src="https://cdn.tailwindcss.com"></script>
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@700;400&display=swap" rel="stylesheet"/>
  <style>
    body { font-family: 'Inter', 'Segoe UI', Arial, sans-serif; }
  </style>
</head>
<body class="bg-gradient-to-br from-gray-50 via-blue-50 to-blue-400 min-h-screen flex items-center justify-center">
<div class="w-full max-w-4xl bg-white rounded-3xl shadow-xl px-0 py-0 md:flex">
  <!-- Left: Logo & Title -->
  <div class="hidden md:flex flex-col items-center justify-center bg-blue-50 rounded-l-3xl py-14 px-10 w-2/5">
    <svg class="w-16 h-16 text-blue-500 mb-6" fill="none" viewBox="0 0 48 48">
      <circle cx="24" cy="24" r="22" stroke="currentColor" stroke-width="3" fill="#E3F0FF"/>
      <path d="M17 21a5 5 0 1 1 10 0 5 5 0 0 1-10 0ZM10 39c0-3.5 7.5-6 14-6s14 2.5 14 6v1H10v-1Z" stroke="#38BDF8" stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round"/>
    </svg>
    <h2 class="text-2xl font-bold text-blue-700 mb-2 text-center">Add New Staff Member</h2>
    <span class="text-sm text-gray-400 text-center mb-2">Pahana Edu Billing System</span>
  </div>

  <!-- Right: Form -->
  <div class="w-full md:w-3/5 py-10 px-6 md:px-12">
    <div class="md:hidden flex flex-col items-center mb-5">
      <svg class="w-14 h-14 text-blue-500 mb-3" fill="none" viewBox="0 0 48 48">
        <circle cx="24" cy="24" r="22" stroke="currentColor" stroke-width="3" fill="#E3F0FF"/>
        <path d="M17 21a5 5 0 1 1 10 0 5 5 0 0 1-10 0ZM10 39c0-3.5 7.5-6 14-6s14 2.5 14 6v1H10v-1Z" stroke="#38BDF8" stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round"/>
      </svg>
      <h2 class="text-xl font-bold text-blue-700 mb-1 text-center">Add New Staff Member</h2>
      <span class="text-xs text-gray-400 text-center mb-4">Pahana Edu Billing System</span>
    </div>
    <form action="addStaff" method="post" class="space-y-4">
      <div class="flex md:items-center gap-4">
        <label for="staffid" class="block w-36 shrink-0 font-semibold text-gray-700">Staff ID</label>
        <input type="text" id="staffid" name="staffid" required
               class="flex-1 px-3 py-2 border border-gray-300 rounded-lg text-base focus:ring-2 focus:ring-blue-300 focus:outline-none transition bg-blue-50"/>
      </div>
      <div class="flex md:items-center gap-4">
        <label for="name" class="block w-36 shrink-0 font-semibold text-gray-700">Staff Name</label>
        <input type="text" id="name" name="name" required
               class="flex-1 px-3 py-2 border border-gray-300 rounded-lg text-base focus:ring-2 focus:ring-blue-300 focus:outline-none transition bg-blue-50"/>
      </div>
      <div class="flex md:items-center gap-4">
        <label for="address" class="block w-36 shrink-0 font-semibold text-gray-700">Address</label>
        <input type="text" id="address" name="address" required
               class="flex-1 px-3 py-2 border border-gray-300 rounded-lg text-base focus:ring-2 focus:ring-blue-300 focus:outline-none transition bg-blue-50"/>
      </div>
      <div class="flex md:items-center gap-4">
        <label for="mobilenumber" class="block w-36 shrink-0 font-semibold text-gray-700">Mobile Number</label>
        <input type="text" id="mobilenumber" name="mobilenumber" required
               class="flex-1 px-3 py-2 border border-gray-300 rounded-lg text-base focus:ring-2 focus:ring-blue-300 focus:outline-none transition bg-blue-50"/>
      </div>
      <div class="flex md:items-center gap-4">
        <label for="username" class="block w-36 shrink-0 font-semibold text-gray-700">Username</label>
        <input type="text" id="username" name="username" required
               class="flex-1 px-3 py-2 border border-gray-300 rounded-lg text-base focus:ring-2 focus:ring-blue-300 focus:outline-none transition bg-blue-50"/>
      </div>
      <div class="flex md:items-center gap-4">
        <label for="password" class="block w-36 shrink-0 font-semibold text-gray-700">Password</label>
        <input type="password" id="password" name="password" required
               class="flex-1 px-3 py-2 border border-gray-300 rounded-lg text-base focus:ring-2 focus:ring-blue-300 focus:outline-none transition bg-blue-50"/>
      </div>
      <button type="submit"
              class="w-full bg-blue-600 hover:bg-blue-700 text-white py-3 rounded-lg font-semibold text-lg shadow transition focus:outline-none focus:ring-2 focus:ring-blue-400 mt-3">
        Add Staff
      </button>
    </form>

    <!-- Success and Error Messages -->
    <% if (request.getAttribute("message") != null) { %>
    <div class="text-green-600 text-center font-semibold mt-4"><%= request.getAttribute("message") %></div>
    <% } %>
    <% if (request.getAttribute("error") != null) { %>
    <div class="text-red-600 text-center font-semibold mt-4"><%= request.getAttribute("error") %></div>
    <% } %>

    <a href="admin_dashboard.html"
       class="block mt-8 text-blue-700 text-center font-medium hover:underline hover:text-blue-800 transition">
      &larr; Back to Admin Dashboard
    </a>
  </div>
</div>
</body>
</html>
