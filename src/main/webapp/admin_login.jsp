<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Admin Login - Pahana Edu Billing System</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!-- Tailwind CSS CDN -->
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@700;400&display=swap" rel="stylesheet" />
    <style>
        body { font-family: 'Inter', 'Segoe UI', Arial, sans-serif; }
    </style>
</head>
<body class="bg-gradient-to-br from-gray-50 via-blue-100 to-blue-400 min-h-screen flex items-center justify-center">
<div class="w-full max-w-sm bg-white rounded-3xl shadow-xl px-8 py-10">
    <div class="flex flex-col items-center mb-6">
        <!-- Bigger and correctly sized logo -->
        <img src="./assets/logo1.png" alt="Logo" class="w-32 h-32 rounded-md object-contain mb-4" />
        <h2 class="text-2xl font-bold text-blue-700 mb-1 text-center">Billing System - Admin Login</h2>
        <span class="text-xs text-gray-400 text-center">User Correct Username And Passowrd</span>
    </div>
    <form action="login" method="post" class="space-y-5">
        <div>
            <label for="username" class="block font-semibold text-gray-700 mb-1">Username</label>
            <input type="text" id="username" name="username" required
                   class="w-full px-3 py-3 border border-gray-300 rounded-lg text-base focus:ring-2 focus:ring-blue-300 focus:outline-none transition bg-blue-50" />
        </div>
        <div>
            <label for="password" class="block font-semibold text-gray-700 mb-1">Password</label>
            <input type="password" id="password" name="password" required
                   class="w-full px-3 py-3 border border-gray-300 rounded-lg text-base focus:ring-2 focus:ring-blue-300 focus:outline-none transition bg-blue-50" />
        </div>
        <button type="submit"
                class="w-full bg-blue-600 hover:bg-blue-700 text-white py-3 rounded-lg font-semibold text-lg shadow transition focus:outline-none focus:ring-2 focus:ring-blue-400">
            Login
        </button>
        <c:if test="${not empty error}">
            <div class="text-red-600 text-center font-semibold mt-2">${error}</div>
        </c:if>
    </form>
    <a href="login.html"
       class="block mt-7 text-blue-700 text-center font-medium hover:underline hover:text-blue-800 transition">&larr; Back to Login Options</a>
</div>
</body>
</html>
