<%@ page contentType="text/html; charset=UTF-8" language="java" import="com.example.pahanaedu_billing_system.model.Book" %>
<%
    Book book = (Book) request.getAttribute("book");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Edit Book - Admin Dashboard</title>
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

<div class="bg-white max-w-3xl w-full rounded-3xl shadow-xl p-10 md:p-14">
    <h2 class="text-3xl font-bold text-blue-700 mb-8 text-center">Edit Book</h2>
    <form action="Admin_EditBookServlet" method="post" enctype="multipart/form-data" class="space-y-8">

        <div class="flex flex-col md:flex-row md:items-center gap-4">
            <label for="bookid" class="md:w-40 font-semibold text-gray-700">Book ID:</label>
            <input type="text" name="bookid" id="bookid" readonly
                   value="<%= book != null ? book.getBookid() : "" %>"
                   class="flex-1 rounded-lg border border-gray-300 bg-gray-100 px-4 py-2 text-gray-600 focus:outline-none focus:ring-2 focus:ring-blue-400 cursor-not-allowed" />
        </div>

        <div class="flex flex-col md:flex-row md:items-center gap-4">
            <label for="title" class="md:w-40 font-semibold text-gray-700">Title:</label>
            <input type="text" name="title" id="title" required
                   value="<%= book != null ? book.getTitle() : "" %>"
                   class="flex-1 rounded-lg border border-gray-300 bg-blue-50 px-4 py-2 text-gray-800 focus:outline-none focus:ring-2 focus:ring-blue-400" />
        </div>

        <div class="flex flex-col md:flex-row md:items-center gap-4">
            <label for="author" class="md:w-40 font-semibold text-gray-700">Author:</label>
            <input type="text" name="author" id="author" required
                   value="<%= book != null ? book.getAuthor() : "" %>"
                   class="flex-1 rounded-lg border border-gray-300 bg-blue-50 px-4 py-2 text-gray-800 focus:outline-none focus:ring-2 focus:ring-blue-400" />
        </div>

        <div class="flex flex-col md:flex-row md:items-center gap-4">
            <label for="price" class="md:w-40 font-semibold text-gray-700">Price:</label>
            <input type="number" step="0.01" name="price" id="price" required
                   value="<%= book != null ? book.getPrice() : "" %>"
                   class="flex-1 rounded-lg border border-gray-300 bg-blue-50 px-4 py-2 text-gray-800 focus:outline-none focus:ring-2 focus:ring-blue-400" />
        </div>

        <div class="flex flex-col md:flex-row md:items-center gap-4">
            <label for="stockbookcount" class="md:w-40 font-semibold text-gray-700">Stock Count:</label>
            <input type="number" name="stockbookcount" id="stockbookcount" required
                   value="<%= book != null ? book.getStockbookcount() : "" %>"
                   class="flex-1 rounded-lg border border-gray-300 bg-blue-50 px-4 py-2 text-gray-800 focus:outline-none focus:ring-2 focus:ring-blue-400" />
        </div>

        <div class="flex flex-col md:flex-row md:items-center gap-4">
            <label for="bookphoto" class="md:w-40 font-semibold text-gray-700">Book Photo:</label>
            <div class="flex items-center gap-4">
                <% if (book != null && book.getBookphoto() != null) { %>
                <img src="GetBookPhotoServlet?bookid=<%= book.getBookid() %>" alt="Book Photo"
                     class="w-28 h-32 object-cover rounded-lg bg-blue-100" />
                <% } %>
                <div class="flex flex-col">
                    <input type="file" name="bookphoto" id="bookphoto" accept="image/*"
                           class="rounded-lg border border-gray-300 px-3 py-2 cursor-pointer focus:outline-none focus:ring-2 focus:ring-blue-400" />
                    <span class="text-xs text-gray-500 mt-1 italic">(Leave blank to keep current photo)</span>
                </div>
            </div>
        </div>

        <input type="submit" value="Update Book"
               class="w-full bg-blue-600 hover:bg-blue-700 text-white py-3 rounded-lg font-semibold text-lg shadow transition focus:outline-none focus:ring-2 focus:ring-blue-500 cursor-pointer" />
    </form>

    <% if (request.getAttribute("message") != null) { %>
    <div class="mt-6 text-center font-semibold text-green-700">
        <%= request.getAttribute("message") %>
    </div>
    <% } else if (request.getAttribute("error") != null) { %>
    <div class="mt-6 text-center font-semibold text-red-700">
        <%= request.getAttribute("error") %>
    </div>
    <% } %>
</div>
</body>
</html>
