<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.util.*,com.example.pahanaedu_billing_system.model.Book" %>
<%
    List<Book> bookList = (List<Book>) request.getAttribute("bookList");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>All Books - Administration</title>
    <style>
        body { background: #f2f4fa; font-family: Arial, sans-serif; }
        .container { max-width: 1200px; margin: 50px auto; background: #fff; border-radius: 14px; box-shadow: 0 4px 24px rgba(0,0,0,0.08); padding: 36px; }
        h2 { color: #0366d6; text-align: center; margin-bottom: 22px; }
        table { border-collapse: collapse; width: 100%; background: #fff; box-shadow: 0 0 10px rgba(0,0,0,0.07); }
        th, td { padding: 14px 14px; border: 1.5px solid #b6cfef; text-align: left; font-size: 15px; }
        th { background: #0366d6; color: #fff; font-weight: 600; }
        tr:nth-child(even) { background-color: #f3f6fb; }
        tr:hover { background-color: #e7f1ff; }
        .authors-cell {
            color: #415475;
            font-style: italic;
            letter-spacing: 0.5px;
            font-size: 15px;
        }
        .btn { padding: 7px 15px; font-size: 15px; border: none; border-radius: 4px; cursor: pointer; font-weight: 600; margin-right: 4px; }
        .btn-edit { background: #21af59; color: #fff; }
        .btn-edit:hover { background: #189946; }
        .btn-delete { background: #d02727; color: #fff; }
        .btn-delete:hover { background: #a41c1c; }
        .img-thumb {
            width: 100px; height: 120px; object-fit: cover;
            border-radius: 6px; border: 2.5px solid #58a4f7; background: #eaf3fb;
            display: block; margin: 0 auto;
        }
        .msg { font-weight: bold; margin-bottom: 16px; text-align:center; }
        .msg.success { color: #099424; }
        .msg.error { color: #d02626; }
        .nobooks { color:#d02626; font-weight:bold; text-align:center; margin:32px 0; font-size:17px; }
        .back-btn {
            display:inline-block; margin-bottom: 18px; padding:9px 24px;
            background:#0366d6; color:#fff; font-weight:600; border:none;
            border-radius: 6px; font-size:16px; text-decoration: none;
            box-shadow: 0 2px 7px rgba(3,102,214,0.06); transition: background .2s;
        }
        .back-btn:hover {
            background:#234289; color:#fff; text-decoration:none;
        }
        @media (max-width: 700px) {
            .container { padding: 10px; }
            th, td { padding: 9px 6px; font-size: 12px; }
            .img-thumb { width:60px; height:72px;}
        }
    </style>
</head>
<body>
<div class="container">

    <a href="admin_dashboard.html" class="back-btn">&larr; Back to Admin Dashboard</a>

    <h2>All Books</h2>
    <% if (request.getAttribute("message") != null) { %>
    <div class="msg success"><%= request.getAttribute("message") %></div>
    <% } else if (request.getAttribute("error") != null) { %>
    <div class="msg error"><%= request.getAttribute("error") %></div>
    <% } %>

    <% if (bookList != null && !bookList.isEmpty()) { %>
    <div style="overflow-x:auto;">
        <table>
            <thead>
            <tr>
                <th>Book ID</th>
                <th>Title</th>
                <th>Author(s)</th>
                <th>Price</th>
                <th>Stock</th>
                <th>Photo</th>
                <th style="width:160px;">Actions</th>
            </tr>
            </thead>
            <tbody>
            <% for (Book b : bookList) { %>
            <tr>
                <td><%= b.getBookid() %></td>
                <td><%= b.getTitle() %></td>
                <td class="authors-cell"><%= b.getAuthor() %></td>
                <td>Rs. <%= b.getPrice() %></td>
                <td><%= b.getStockbookcount() %></td>
                <td style="text-align:center;">
                    <% if (b.getBookphoto() != null && b.getBookphoto().length > 0) { %>
                    <img class="img-thumb" src="GetBookPhotoServlet?bookid=<%=b.getBookid()%>" alt="Book Image"/>
                    <% } else { %>
                    <span style="color:#aaa;">No Image</span>
                    <% } %>
                </td>
                <td>
                    <form action="Admin_FetchEditBookServlet" method="get" style="display:inline;">
                        <input type="hidden" name="bookid" value="<%= b.getBookid() %>"/>
                        <button type="submit" class="btn btn-edit">Edit</button>
                    </form>
                    <form action="Admin_DeleteBookServlet" method="get" style="display:inline;" onsubmit="return confirm('Are you sure you want to delete this book?');">
                        <input type="hidden" name="bookid" value="<%= b.getBookid() %>"/>
                        <button type="submit" class="btn btn-delete">Delete</button>
                    </form>
                </td>
            </tr>
            <% } %>
            </tbody>
        </table>
    </div>
    <% } else { %>
    <div class="nobooks">❌ No books found in the database.</div>
    <% } %>

    <div style="margin-top:24px;text-align:center;">
        <a href="admin_add_book.jsp" style="color:#0366d6; font-size:15px;text-decoration:underline;">➕ Add New Book</a>
    </div>
</div>
</body>
</html>
