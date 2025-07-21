<%@ page import="java.util.*, com.example.pahanaedu_billing_system.dao.BookDAO, com.example.pahanaedu_billing_system.model.Book" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String query = request.getParameter("searchQuery");
    BookDAO bookDAO = new BookDAO();
    List<Book> bookList;

    if (query != null && !query.trim().isEmpty()) {
        bookList = bookDAO.searchBooksByTitleOrAuthor(query.trim());
    } else {
        bookList = bookDAO.getAllBooks();
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Select Books - Generate Bill</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 p-6 font-sans">

<div class="max-w-6xl mx-auto">
    <h2 class="text-4xl font-bold mb-6 text-center text-blue-700">📚 Select Books to Add to Bill</h2>

    <!-- 🔍 Search Box -->
    <form method="get" action="selectBooks" class="flex justify-center mb-6">
        <input type="text" name="searchQuery" placeholder="Search by book title or author..."
               class="w-1/2 p-2 border border-gray-300 rounded-l-md focus:outline-none focus:ring-2 focus:ring-blue-500" />
        <button type="submit"
                class="px-4 py-2 bg-blue-600 text-white rounded-r-md hover:bg-blue-700 transition">Search</button>
    </form>

    <% if (bookList != null && !bookList.isEmpty()) { %>
    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
        <% for (Book book : bookList) { %>
        <div class="bg-white rounded-xl shadow-md p-5 flex flex-col items-center hover:shadow-lg transition">
            <% if (book.getBookphoto() != null) { %>
            <img src="data:image/jpeg;base64,<%= java.util.Base64.getEncoder().encodeToString(book.getBookphoto()) %>"
                 alt="Book Image"
                 class="w-32 h-40 object-cover mb-4 rounded border" />
            <% } else { %>
            <div class="w-32 h-40 bg-gray-200 flex items-center justify-center mb-4 text-gray-500">
                No Image
            </div>
            <% } %>

            <h3 class="text-lg font-semibold text-center text-gray-800"><%= book.getTitle() %></h3>
            <p class="text-sm text-gray-600 mb-2 italic">By <%= book.getAuthor() %></p>
            <p class="text-md font-bold text-green-600 mb-2">Rs. <%= book.getPrice() %></p>

            <form action="addToCart" method="post" class="flex flex-col items-center gap-2">
                <input type="hidden" name="bookId" value="<%= book.getBookid() %>">
                <button type="submit"
                        class="bg-blue-500 hover:bg-blue-600 text-white px-4 py-2 rounded transition text-sm">
                    ➕ Add to Cart
                </button>
            </form>
        </div>
        <% } %>
    </div>

    <!-- View Cart Button -->
    <div class="text-center mt-10">
        <a href="staff_cart.jsp"
           class="inline-block bg-green-600 hover:bg-green-700 text-white px-6 py-3 rounded-xl font-semibold transition">
            🛒 View Cart & Checkout
        </a>
    </div>

    <% } else { %>
    <p class="text-center text-red-500 text-lg mt-10">❗ No books found for your search.</p>
    <div class="text-center mt-6">
        <a href="staff_select_books.jsp"
           class="text-blue-600 hover:underline text-sm">🔄 Reset and show all books</a>
    </div>
    <% } %>

    <!-- Back to Dashboard -->
    <div class="fixed bottom-6 left-6">
        <a href="staff_dashboard.html"
           class="bg-gray-600 hover:bg-gray-700 text-white px-5 py-2 rounded-2xl shadow-lg font-semibold transition">
            ← Back to Dashboard
        </a>
    </div>
</div>

</body>
</html>
