<%@ page contentType="text/html; charset=UTF-8" language="java" import="com.example.pahanaedu_billing_system.model.Book" %>
<%
    Book book = (Book) request.getAttribute("book");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Edit Book</title>
    <style>
        body { background: #f2f4fa; font-family: Arial, sans-serif; }
        .container { max-width: 700px; margin: 60px auto; background: #fff; border-radius: 14px; box-shadow: 0 4px 24px rgba(0,0,0,0.08); padding: 36px; }
        h2 { color: #0366d6; text-align: center; margin-bottom: 20px; }
        form { display: flex; flex-direction: column; gap: 20px; }
        .form-row {
            display: flex;
            align-items: center;
            margin-bottom: 0;
            gap: 12px;
        }
        .form-row label {
            width: 160px;
            font-weight: 600;
            color: #333;
        }
        .form-row input[type="text"],
        .form-row input[type="number"],
        .form-row input[type="file"] {
            flex: 1;
            padding: 10px;
            border: 1px solid #bbb;
            border-radius: 5px;
            background: #f6faff;
            font-size: 15px;
        }
        .form-row input[readonly] { background: #efefef; color: #888; }
        .image-row { display: flex; align-items: center; gap: 12px; }
        .image-row .preview { border-radius: 5px; border: 2px solid #7cc1fc; width: 110px; height: 130px; object-fit: cover; }
        .msg { text-align: center; font-weight: bold; margin-top: 22px; font-size: 15px;}
        .msg.success { color: #099424; }
        .msg.error { color: #d02626; }
        input[type="submit"] {
            margin-top: 16px; width: 100%; padding: 14px; background: #0366d6; color: #fff; font-weight: 600;
            border: none; border-radius: 5px; font-size: 17px; cursor: pointer; transition: background .15s;
        }
        input[type="submit"]:hover { background: #024c9a; }
        .note { color: #888; font-size: 13px; margin-left: 12px; }
        @media (max-width: 700px) {
            .container { padding: 10px;}
            .form-row, .image-row { flex-direction: column; align-items: stretch; }
            .form-row label { width: 100%; margin-bottom: 3px;}
            input[type="submit"] { font-size: 15px; padding: 10px;}
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Edit Book</h2>
    <form action="Admin_EditBookServlet" method="post" enctype="multipart/form-data">

        <div class="form-row">
            <label for="bookid">Book ID:</label>
            <input type="text" name="bookid" id="bookid" value="<%=book != null ? book.getBookid() : ""%>" readonly />
        </div>
        <div class="form-row">
            <label for="title">Title:</label>
            <input type="text" name="title" id="title" required value="<%=book != null ? book.getTitle() : ""%>" />
        </div>
        <div class="form-row">
            <label for="author">Author:</label>
            <input type="text" name="author" id="author" required value="<%=book != null ? book.getAuthor() : ""%>" />
        </div>
        <div class="form-row">
            <label for="price">Price:</label>
            <input type="number" step="0.01" name="price" id="price" required value="<%=book != null ? book.getPrice() : ""%>" />
        </div>
        <div class="form-row">
            <label for="stockbookcount">Stock Count:</label>
            <input type="number" name="stockbookcount" id="stockbookcount" required value="<%=book != null ? book.getStockbookcount() : ""%>" />
        </div>
        <div class="form-row image-row">
            <label for="bookphoto">Book Photo:</label>
            <%-- preview old image if you have a photo rendering servlet --%>
            <% if (book != null && book.getBookphoto() != null) { %>
            <img class="preview" src="GetBookPhotoServlet?bookid=<%=book.getBookid()%>" alt="Book Photo"/>
            <% } %>
            <input type="file" name="bookphoto" id="bookphoto" accept="image/*" />
            <span class="note">(Leave blank to keep old photo)</span>
        </div>

        <input type="submit" value="Update Book" />
    </form>

    <% if (request.getAttribute("message") != null) { %>
    <div class="msg success"><%= request.getAttribute("message") %></div>
    <% } else if (request.getAttribute("error") != null) { %>
    <div class="msg error"><%= request.getAttribute("error") %></div>
    <% } %>

</div>
</body>
</html>
