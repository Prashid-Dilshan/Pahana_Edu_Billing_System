<%@ page import="java.util.*, com.example.pahanaedu_billing_system.model.CartItem" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page session="true" %>
<html>
<head>
    <title>Shopping Cart</title>
    <style>
        body { font-family: Arial, sans-serif; }
        h2 { margin-bottom: 20px; }
        table { border-collapse: collapse; width: 80%; margin-bottom: 20px; }
        th, td { border: 1px solid #cccccc; padding: 8px 12px; text-align: center; }
        th { background: #eaeaea; }
        .actions a, .actions form { display: inline-block; margin: 0 2px; }
        .no-border { border: none; }
        .btn { padding: 5px 10px; font-size: 14px; cursor: pointer; border-radius: 3px; border: 1px solid #999; }
        .btn-remove { background: #ffdddd; }
        .btn-next { background: #cce5ff; }
        .btn-back { background: #eee; }
    </style>
</head>
<body>
<h2>🛒 Cart Preview</h2>

<%
    List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
    if (cart != null && !cart.isEmpty()) {
        double grandTotal = 0;
%>
<table>
    <tr>
        <th>Title</th>
        <th>Price (Rs.)</th>
        <th>Quantity</th>
        <th>Total (Rs.)</th>
        <th>Actions</th>
    </tr>
    <%
        for (CartItem item : cart) {
            double total = item.getTotalPrice();
            grandTotal += total;
    %>
    <tr>
        <td><%= item.getTitle() %></td>
        <td><%= String.format("%.2f", item.getPrice()) %></td>

        <td>
            <!-- Auto-update quantity form -->
            <form action="UpdateCartServlet" method="post">
                <input type="hidden" name="bookId" value="<%= item.getBookId() %>" />
                <input type="number" name="quantity" value="<%= item.getQuantity() %>" min="1"
                       style="width: 50px;" onchange="this.form.submit();" />
            </form>
        </td>

        <td><%= String.format("%.2f", total) %></td>
        <td class="actions">
            <!-- ➖ Remove one quantity -->
            <a href="RemoveFromCartServlet?bookId=<%= item.getBookId() %>" class="btn btn-remove" title="Remove one">−</a>

            <!-- 🗑 Remove all of this book -->
            <a href="RemoveFromCartServlet?bookId=<%= item.getBookId() %>&removeAll=true"
               class="btn btn-remove" title="Remove all"
               onclick="return confirm('Remove this book from cart completely?');">🗑</a>
        </td>
    </tr>
    <% } %>
    <tr>
        <td colspan="3" style="text-align:right;"><strong>Grand Total:</strong></td>
        <td colspan="2" style="text-align:left;"><strong>Rs. <%= String.format("%.2f", grandTotal) %></strong></td>
    </tr>
</table>

<form action="selectCustomer" method="get">
    <input type="submit" value="Continue to Customer Selection" class="btn btn-next"/>
</form>



<%
} else {
%>
<p>Your cart is empty.</p>
<%
    }
%>

<p>
    <a href="staff_select_books.jsp" class="btn btn-back">⬅ Back to Book Selection</a>
</p>
</body>
</html>
