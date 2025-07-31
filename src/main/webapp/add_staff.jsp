<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>Add Staff Member</title>
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <script src="https://cdn.tailwindcss.com"></script>
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@700;400&display=swap" rel="stylesheet"/>
  <style>
    body { font-family: 'Inter', 'Segoe UI', Arial, sans-serif; }
  </style>
</head>
<body class="bg-gradient-to-tr from-blue-50 via-blue-100 to-blue-300 min-h-screen flex items-center justify-center p-6">

<div class="w-full max-w-3xl bg-white rounded-3xl shadow-xl flex flex-col md:flex-row overflow-hidden my-12">
  <!-- Left: Icon Panel -->
  <div class="hidden md:flex flex-col items-center justify-center bg-gradient-to-b from-blue-100 to-blue-200 rounded-l-3xl py-12 px-10 w-2/5 border-r border-blue-100">
    <!-- Modern Person Plus icon -->
    <svg class="w-20 h-20 text-blue-500 mb-7" fill="none" stroke="currentColor" stroke-width="1.7" viewBox="0 0 48 48" aria-hidden="true">
      <circle cx="24" cy="18" r="8" stroke="#3b82f6" fill="#dbeafe"/>
      <rect x="8" y="32" width="32" height="10" rx="5" fill="#dbeafe" stroke="#60a5fa"/>
      <path d="M36 14v8M40 18h-8" stroke="#3b82f6" stroke-linecap="round"/>
    </svg>
    <div class="mt-3 text-center">
      <h2 class="text-xl font-bold text-blue-800 mb-1 tracking-tight">Add Staff Member</h2>
      <div class="text-sm text-blue-500 font-medium opacity-70">Admin Panel</div>
    </div>
  </div>

  <!-- Right: Form Area -->
  <div class="w-full md:w-3/5 py-10 px-6 md:px-12 flex flex-col justify-center">
    <div class="md:hidden flex flex-col items-center mb-6">
      <svg class="w-14 h-14 text-blue-500 mb-3" fill="none" stroke="currentColor" stroke-width="1.7" viewBox="0 0 48 48" aria-hidden="true">
        <circle cx="24" cy="18" r="8" stroke="#3b82f6" fill="#dbeafe"/>
        <rect x="8" y="32" width="32" height="10" rx="5" fill="#dbeafe" stroke="#60a5fa"/>
        <path d="M36 14v8M40 18h-8" stroke="#3b82f6" stroke-linecap="round"/>
      </svg>
      <h2 class="text-lg font-bold text-blue-800 mb-1 tracking-tight">Add Staff Member</h2>
    </div>

    <% if (request.getAttribute("message") != null) { %>
    <div class="w-full mb-4 bg-green-50 text-green-800 border border-green-400 rounded-lg px-4 py-2 text-center shadow-sm font-medium">
      <%= request.getAttribute("message") %>
    </div>
    <% } %>
    <% if (request.getAttribute("error") != null) { %>
    <div class="w-full mb-4 bg-red-50 text-red-700 border border-red-300 rounded-lg px-4 py-2 text-center shadow-sm font-medium">
      <%= request.getAttribute("error") %>
    </div>
    <% } %>

    <form action="StaffServlet" method="post" class="space-y-7 mt-2">
      <input type="hidden" name="action" value="add" />

      <div class="flex flex-col md:flex-row md:items-center gap-3">
        <label for="staffid" class="md:w-36 font-medium text-gray-700">Staff ID</label>
        <input type="text" id="staffid" name="staffid" autocomplete="off" required
               class="flex-1 px-4 py-2 border border-blue-200 rounded-lg bg-blue-50 placeholder-gray-400 text-base focus:ring-2 focus:ring-blue-400 focus:outline-none transition"/>
      </div>
      <div class="flex flex-col md:flex-row md:items-center gap-3">
        <label for="name" class="md:w-36 font-medium text-gray-700">Staff Name</label>
        <input type="text" id="name" name="name" required
               class="flex-1 px-4 py-2 border border-blue-200 rounded-lg bg-blue-50 placeholder-gray-400 text-base focus:ring-2 focus:ring-blue-400 focus:outline-none transition"/>
      </div>
      <div class="flex flex-col md:flex-row md:items-center gap-3">
        <label for="address" class="md:w-36 font-medium text-gray-700">Address</label>
        <input type="text" id="address" name="address" required
               class="flex-1 px-4 py-2 border border-blue-200 rounded-lg bg-blue-50 placeholder-gray-400 text-base focus:ring-2 focus:ring-blue-400 focus:outline-none transition"/>
      </div>
      <div class="flex flex-col md:flex-row md:items-center gap-3">
        <label for="mobilenumber" class="md:w-36 font-medium text-gray-700">Mobile Number</label>
        <input type="text" id="mobilenumber" name="mobilenumber" required
               class="flex-1 px-4 py-2 border border-blue-200 rounded-lg bg-blue-50 placeholder-gray-400 text-base focus:ring-2 focus:ring-blue-400 focus:outline-none transition"/>
      </div>
      <div class="flex flex-col md:flex-row md:items-center gap-3">
        <label for="username" class="md:w-36 font-medium text-gray-700">Username</label>
        <input type="text" id="username" name="username" required
               class="flex-1 px-4 py-2 border border-blue-200 rounded-lg bg-blue-50 placeholder-gray-400 text-base focus:ring-2 focus:ring-blue-400 focus:outline-none transition"/>
      </div>
      <div class="flex flex-col md:flex-row md:items-center gap-3">
        <label for="password" class="md:w-36 font-medium text-gray-700">Password</label>
        <input type="password" id="password" name="password" required
               class="flex-1 px-4 py-2 border border-blue-200 rounded-lg bg-blue-50 placeholder-gray-400 text-base focus:ring-2 focus:ring-blue-400 focus:outline-none transition"/>
      </div>

      <button type="submit"
              class="w-full bg-blue-600 hover:bg-blue-700 text-white py-3 rounded-lg font-semibold text-lg shadow transition focus:outline-none focus:ring-2 focus:ring-blue-500">
        Add Staff
      </button>
    </form>
  </div>
</div>

</body>
</html>
