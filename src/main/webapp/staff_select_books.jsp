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
<html lang="en" class="scroll-smooth">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Select Books - Generate Bill</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        /* Multi-line truncate for Tailwind (for 2 lines) */
        .line-clamp-2 {
            display: -webkit-box;
            -webkit-line-clamp: 2;
            -webkit-box-orient: vertical;
            overflow: hidden;
        }
        /* Scrollbar styling */
        ::-webkit-scrollbar { width: 8px; height: 8px; }
        ::-webkit-scrollbar-thumb { background-color: #60a5fa; border-radius: 4px; }
    </style>
</head>
<body class="bg-gradient-to-tr from-blue-50 via-blue-100 to-blue-300 font-sans min-h-screen flex flex-col">

<header class="from-blue-600 to-indigo-700">
    <div class="max-w-7xl mx-auto py-6 px-4 sm:px-6 lg:px-8">
        <h1 class="text-2xl sm:text-3xl font-extrabold text-blue-700 mb-1 text-center tracking-tight">
            Select Books to Add to Bill
        </h1>
    </div>
</header>

<main class="flex-grow max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8">

    <!-- Search Bar w/ "X" clear icon -->
    <!-- Search Bar w/ "X" clear icon placed left of Search button -->
    <form method="get" action="selectBooks"
          class="max-w-xl mx-auto flex items-center border border-gray-300 rounded-lg shadow-sm overflow-hidden focus-within:ring-2 focus-within:ring-blue-500 transition mb-10">

        <label for="searchQuery" class="sr-only">Search books</label>
        <input
                id="searchQuery"
                name="searchQuery"
                type="search"
                value="<%= query != null ? query : "" %>"
                placeholder="Search by book title or author..."
                autocomplete="off"
                class="flex-grow px-4 py-3 text-gray-700 placeholder-gray-400 focus:outline-none"
        />

        <% if (query != null && !query.trim().isEmpty()) { %>
        <button type="button"
                onclick="window.location.href='staff_select_books.jsp'"
                class="ml-2 mr-2 p-1"
                title="Clear search">
            <!-- X mark SVG -->
            <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 text-gray-400 hover:text-red-500 transition" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"/>
            </svg>
        </button>
        <% } %>

        <button
                type="submit"
                class="bg-blue-600 hover:bg-blue-700 text-white px-5 py-3 flex items-center justify-center transition">
            <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 mr-2" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                <path stroke-linecap="round" stroke-linejoin="round" d="M21 21l-4.35-4.35m0 0A7.5 7.5 0 1110.5 3a7.5 7.5 0 016.15 13.15z"/>
            </svg>
            Search
        </button>
    </form>


    <!-- Book Grid -->
    <% if (bookList != null && !bookList.isEmpty()) { %>
    <div class="grid gap-8 grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4">
        <% for (Book book : bookList) { %>
        <div class="bg-white rounded-xl shadow-lg hover:shadow-2xl transition p-5 flex flex-col items-center w-full">
            <% if (book.getBookphoto() != null) { %>
            <img src="data:image/jpeg;base64,<%= java.util.Base64.getEncoder().encodeToString(book.getBookphoto()) %>"
                 alt="<%= book.getTitle() %>"
                 class="w-32 h-44 object-cover rounded-md mb-4 border border-gray-200 shadow-sm" />
            <% } else { %>
            <div class="w-32 h-44 bg-gray-200 rounded-md flex items-center justify-center mb-4 text-gray-400 select-none border border-gray-300">
                No Image
            </div>
            <% } %>

            <!-- Multi-line ellipsis for long titles, tooltip on hover -->
            <h3 class="text-base font-semibold text-center text-gray-900 line-clamp-2 w-full mb-1" title="<%= book.getTitle() %>">
                <%= book.getTitle() %>
            </h3>
            <p class="text-sm text-gray-600 italic mb-2 truncate w-full text-center" title="By <%= book.getAuthor() %>">
                By <%= book.getAuthor() %>
            </p>
            <p class="text-md font-bold text-green-600 mb-4 text-center">Rs. <%= String.format("%.2f", book.getPrice()) %></p>

            <form action="addToCart" method="post" class="w-full flex justify-center">
                <input type="hidden" name="bookId" value="<%= book.getBookid() %>" />
                <button type="submit"
                        class="bg-blue-600 hover:bg-blue-700 text-white px-5 py-2 rounded-lg shadow-sm transition w-full text-sm font-semibold">
                    Add to Cart
                </button>
            </form>
        </div>
        <% } %>
    </div>

    <!-- View Cart Button -->
    <div class="text-center mt-12">
        <a href="staff_cart.jsp"
           class="inline-block bg-green-600 hover:bg-green-700 text-white px-6 py-2 rounded-xl font-semibold shadow-md transition">
            View Cart & Checkout
        </a>

    </div>

    <% } else { %>
    <!-- No books found -->
    <div class="mt-20 text-center space-y-6">
        <p class="text-red-600 text-xl font-semibold">❗ No books found for your search.</p>
        <a href="staff_select_books.jsp"
           class="inline-block text-blue-600 hover:underline font-medium text-sm transition">
            🔄 Reset and show all books
        </a>
    </div>
    <% } %>
</main>

</body>
</html>
