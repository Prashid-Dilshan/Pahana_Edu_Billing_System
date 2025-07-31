<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Add New Book - Admin Dashboard</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!-- Tailwind CSS CDN -->
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@700;400&display=swap" rel="stylesheet" />
    <style>
        body {
            font-family: 'Inter', 'Segoe UI', Arial, sans-serif;
        }
        ::selection {
            background: #a5b4fc;
        }
    </style>
</head>
<body class="bg-gradient-to-tr from-blue-50 via-blue-100 to-blue-300 min-h-screen flex items-center justify-center p-6">

<div class="w-full max-w-3xl bg-white rounded-3xl shadow-2xl px-6 md:px-10 py-10 my-12">
    <div class="flex flex-col items-center mb-8">
        <svg class="w-16 h-16 text-blue-500 mb-3" fill="none" viewBox="0 0 48 48" aria-hidden="true">
            <circle cx="24" cy="24" r="22" stroke="currentColor" stroke-width="3" fill="#E3F0FF"/>
            <path d="M17 21a5 5 0 1 1 10 0 5 5 0 0 1-10 0ZM10 39c0-3.5 7.5-6 14-6s14 2.5 14 6v1H10v-1Z"
                  stroke="#38BDF8" stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round"/>
        </svg>
        <h2 class="text-2xl font-bold text-blue-700 mb-1 text-center">Add New Book</h2>
        <span class="text-sm text-gray-400 text-center mb-2">Admin Dashboard</span>
    </div>

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

    <form action="Admin_AddBookServlet" method="post" enctype="multipart/form-data" class="space-y-6">
        <div class="grid grid-cols-1 md:grid-cols-2 gap-x-8 gap-y-4">
            <div class="flex flex-col md:flex-row md:items-center gap-3">
                <label for="bookid" class="md:w-36 font-semibold text-gray-700">Book ID</label>
                <input type="text" name="bookid" id="bookid" required
                       class="flex-1 w-full px-4 py-2 border border-gray-300 rounded-lg text-base focus:ring-2 focus:ring-blue-400 focus:outline-none bg-blue-50 transition"/>
            </div>
            <div class="flex flex-col md:flex-row md:items-center gap-3">
                <label for="title" class="md:w-36 font-semibold text-gray-700">Title</label>
                <input type="text" name="title" id="title" required
                       class="flex-1 w-full px-4 py-2 border border-gray-300 rounded-lg text-base focus:ring-2 focus:ring-blue-400 focus:outline-none bg-blue-50 transition"/>
            </div>
            <div class="flex flex-col md:flex-row md:items-center gap-3">
                <label for="author" class="md:w-36 font-semibold text-gray-700">Author</label>
                <input type="text" name="author" id="author" required
                       class="flex-1 w-full px-4 py-2 border border-gray-300 rounded-lg text-base focus:ring-2 focus:ring-blue-400 focus:outline-none bg-blue-50 transition"/>
            </div>
            <div class="flex flex-col md:flex-row md:items-center gap-3">
                <label for="price" class="md:w-36 font-semibold text-gray-700">Price</label>
                <input type="number" name="price" id="price" step="0.01" required
                       class="flex-1 w-full px-4 py-2 border border-gray-300 rounded-lg text-base focus:ring-2 focus:ring-blue-400 focus:outline-none bg-blue-50 transition"/>
            </div>
            <div class="flex flex-col md:flex-row md:items-center gap-3">
                <label for="stockbookcount" class="md:w-36 font-semibold text-gray-700">Stock Count</label>
                <input type="number" name="stockbookcount" id="stockbookcount" required
                       class="flex-1 w-full px-4 py-2 border border-gray-300 rounded-lg text-base focus:ring-2 focus:ring-blue-400 focus:outline-none bg-blue-50 transition"/>
            </div>
            <div class="flex flex-col md:flex-row md:items-center gap-3">
                <label for="bookphoto" class="md:w-36 font-semibold text-gray-700">Book Photo</label>
                <input type="file" name="bookphoto" id="bookphoto" accept="image/*" required
                       class="flex-1 w-full border border-gray-300 rounded-lg bg-white px-4 py-2 text-base focus:ring-2 focus:ring-blue-400 focus:outline-none transition"/>
            </div>
        </div>
        <button type="submit"
                class="w-full bg-blue-600 hover:bg-blue-700 text-white py-3 rounded-lg font-semibold text-lg shadow transition focus:outline-none focus:ring-2 focus:ring-blue-500 mt-4">
            Add Book
        </button>
    </form>
</div>

</body>
</html>
