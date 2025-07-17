<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.util.*,com.example.pahanaedu_billing_system.model.Book" %>
<%
    List<Book> bookList = (List<Book>) request.getAttribute("bookList");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>All Books - Administration</title>
    <!-- Tailwind CSS CDN -->
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@700;400&display=swap" rel="stylesheet"/>
    <style>
        body { font-family: 'Inter', 'Segoe UI', Arial, sans-serif; }
        .img-thumb { width: 90px; height: 110px; object-fit: cover; border-radius: 0.375rem; border: 2px solid #38bdf8; background: #f2f8fc; margin: 0 auto; }
    </style>
</head>
<body class="bg-gradient-to-br from-yellow-50 via-orange-50 to-blue-100 min-h-screen flex flex-col items-center justify-center">
<div class="w-full max-w-6xl bg-white rounded-3xl shadow-xl px-8 py-10 flex flex-col items-center mb-10">

    <svg class="w-14 h-14 text-blue-500 mb-5" fill="none" viewBox="0 0 48 48">
        <circle cx="24" cy="24" r="22" stroke="currentColor" stroke-width="3" fill="#E3F0FF"/>
        <path d="M18 24a6 6 0 1 1 12 0 6 6 0 0 1 -12 0zM10 38c0-4 8-6 14-6s14 2 14 6v2H10v-2z" stroke="#38BDF8" stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round"/>
    </svg>
    <h2 class="text-2xl font-bold text-blue-700 mb-2 text-center">All Books</h2>
    <span class="text-xs text-gray-400 mb-8 text-center">Pahana Edu Billing System - Admin</span>

    <!-- Success/Error Message area -->
    <% if (request.getAttribute("message") != null) { %>
    <div class="w-full mb-4 bg-green-100 text-green-800 border border-green-400 rounded-lg px-4 py-2 text-center">
        <strong><%= request.getAttribute("message") %></strong>
    </div>
    <% } else if (request.getAttribute("error") != null) { %>
    <div class="w-full mb-4 bg-red-100 text-red-700 border border-red-400 rounded-lg px-4 py-2 text-center">
        <%= request.getAttribute("error") %>
    </div>
    <% } %>

    <% if (bookList != null && !bookList.isEmpty()) { %>
    <div class="w-full overflow-x-auto rounded-lg shadow">
        <table class="min-w-full border border-gray-200 bg-white">
            <thead>
            <tr class="bg-blue-100 text-blue-900">
                <th class="px-3 py-2 border-b">Book ID</th>
                <th class="px-3 py-2 border-b">Title</th>
                <th class="px-3 py-2 border-b">Author(s)</th>
                <th class="px-3 py-2 border-b">Price</th>
                <th class="px-3 py-2 border-b">Stock</th>
                <th class="px-3 py-2 border-b">Photo</th>
                <th class="px-3 py-2 border-b" style="width:160px;">Actions</th>
            </tr>
            </thead>
            <tbody>
            <% for (Book b : bookList) { %>
            <tr class="hover:bg-orange-50 even:bg-blue-50 text-gray-900">
                <td class="px-3 py-2 text-center"><%= b.getBookid() %></td>
                <td class="px-3 py-2"><%= b.getTitle() %></td>
                <td class="px-3 py-2 italic text-gray-600"><%= b.getAuthor() %></td>
                <td class="px-3 py-2">Rs. <%= b.getPrice() %></td>
                <td class="px-3 py-2"><%= b.getStockbookcount() %></td>
                <td class="px-3 py-2 text-center">
                    <% if (b.getBookphoto() != null && b.getBookphoto().length > 0) { %>
                    <img class="img-thumb" src="GetBookPhotoServlet?bookid=<%=b.getBookid()%>" alt="Book Image"/>
                    <% } else { %>
                    <span class="text-gray-400 text-sm">No Image</span>
                    <% } %>
                </td>
                <td class="px-3 py-2">
                    <form action="Admin_FetchEditBookServlet" method="get" class="inline">
                        <input type="hidden" name="bookid" value="<%= b.getBookid() %>"/>
                        <button type="submit" class="bg-green-500 hover:bg-green-600 text-white px-3 py-1 rounded-lg text-sm font-semibold shadow transition">Edit</button>
                    </form>
                    <form action="Admin_DeleteBookServlet" method="get" class="inline" onsubmit="return confirm('Are you sure you want to delete this book?');">
                        <input type="hidden" name="bookid" value="<%= b.getBookid() %>"/>
                        <button type="submit" class="bg-red-500 hover:bg-red-700 text-white px-3 py-1 rounded-lg text-sm font-semibold shadow transition">Delete</button>
                    </form>
                </td>
            </tr>
            <% } %>
            </tbody>
        </table>
    </div>
    <% } else { %>
    <div class="text-red-600 font-semibold text-center my-8 text-lg">❌ No books found in the database.</div>
    <% } %>

    <div class="mt-9 text-center">
        <a href="admin_add_book.jsp" class="text-blue-700 hover:text-blue-900 font-bold text-base underline">+ Add New Book</a>
    </div>
</div>

<a href="admin_dashboard.html"
   class="fixed bottom-7 left-7 bg-gray-600 hover:bg-gray-700 text-white px-6 py-2 rounded-2xl text-base font-semibold shadow transition">
    ← Back to Admin Dashboard
</a>
</body>
</html>
