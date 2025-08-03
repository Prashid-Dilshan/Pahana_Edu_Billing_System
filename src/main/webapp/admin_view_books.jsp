<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.util.*,com.example.pahanaedu_billing_system.model.Book" %>
<%
    List<Book> bookList = (List<Book>) request.getAttribute("bookList");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>All Books - Admin Dashboard</title>
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
        .img-thumb {
            width: 90px;
            height: 110px;
            object-fit: cover;
            border-radius: 0.375rem; /* rounded-md */
            background: #f2f8fc;
            margin: 0 auto;
        }
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

    <h2 class="text-2xl sm:text-3xl font-extrabold text-blue-700 mb-1 text-center tracking-tight">All Books</h2>
    <span class="text-xs text-gray-400 mb-8 text-center">Admin Dashboard</span>

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

    <% if (bookList != null && !bookList.isEmpty()) { %>
    <div class="w-full overflow-x-auto rounded-2xl shadow-lg">
        <table class="min-w-full bg-white rounded-lg">
            <thead>
            <tr class="bg-blue-100 text-blue-900 select-none border-b border-gray-300">
                <th class="px-4 py-3 border-b border-blue-200 text-center font-semibold">Book ID</th>
                <th class="px-4 py-3 border-b border-blue-200 font-semibold">Title</th>
                <th class="px-4 py-3 border-b border-blue-200 font-semibold">Author(s)</th>
                <th class="px-4 py-3 border-b border-blue-200 text-center font-semibold">Price</th>
                <th class="px-4 py-3 border-b border-blue-200 text-center font-semibold">Stock</th>
                <th class="px-4 py-3 border-b border-blue-200 text-center font-semibold">Photo</th>
                <th class="px-4 py-3 border-b border-blue-200 text-center font-semibold" style="width:160px;">Actions</th>
            </tr>
            </thead>
            <tbody>
            <% for (Book b : bookList) { %>
            <tr class="bg-white text-gray-900 border-b border-gray-300">
                <td class="px-4 py-3 text-center whitespace-nowrap"><%= b.getBookid() %></td>
                <td class="px-4 py-3 whitespace-normal max-w-xs"><%= b.getTitle() %></td>
                <td class="px-4 py-3 italic text-gray-600 whitespace-normal max-w-md"><%= b.getAuthor() %></td>
                <td class="px-4 py-3 text-center whitespace-nowrap">Rs. <%= b.getPrice() %></td>
                <td class="px-4 py-3 text-center whitespace-nowrap"><%= b.getStockbookcount() %></td>
                <td class="px-4 py-3 text-center">
                    <% if (b.getBookphoto() != null && b.getBookphoto().length > 0) { %>
                    <img class="img-thumb" src="GetBookPhotoServlet?bookid=<%= b.getBookid() %>" alt="Book Image" />
                    <% } else { %>
                    <span class="text-gray-400 text-sm">No Image</span>
                    <% } %>
                </td>
                <td class="px-4 py-3 text-center whitespace-nowrap flex justify-center gap-2">
                    <!-- Fetch for Edit: -->
                    <form action="AdminBooksManageServlet" method="get" class="inline">
                        <input type="hidden" name="action" value="fetchEdit" />
                        <input type="hidden" name="bookid" value="<%= b.getBookid() %>" />
                        <button type="submit" class="bg-green-500 hover:bg-green-600 text-white rounded px-3 py-1 text-sm font-semibold shadow transition">
                            Edit
                        </button>
                    </form>
                    <!-- Delete: -->
                    <form action="AdminBooksManageServlet" method="get" class="inline" onsubmit="return confirm('Are you sure you want to delete this book?');">
                        <input type="hidden" name="action" value="delete" />
                        <input type="hidden" name="bookid" value="<%= b.getBookid() %>" />
                        <button type="submit" class="bg-red-500 hover:bg-red-700 text-white rounded px-3 py-1 text-sm font-semibold shadow transition">
                            Delete
                        </button>
                    </form>
                </td>
            </tr>
            <% } %>
            </tbody>
        </table>
    </div>
    <% } else { %>
    <div class="text-red-600 font-semibold text-center my-8 text-lg select-none">
        ❌ No books found in the database.
    </div>
    <% } %>

</div>

</body>
</html>
