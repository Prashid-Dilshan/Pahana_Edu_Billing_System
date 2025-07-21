<%@ page import="java.util.*, com.example.pahanaedu_billing_system.model.Customer" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page session="true" %>
<html>
<head>
    <title>Select Customer</title>
</head>
<body>
<h2>👤 Select a Customer for Billing</h2>

<!-- 🔍 Search Form -->
<form method="get" action="selectCustomer">
    <input type="text" name="searchName" placeholder="Search by customer name" />
    <input type="submit" value="Search" />
</form>
<br>

<%
    List<Customer> customers = (List<Customer>) request.getAttribute("customers");
    if (customers != null && !customers.isEmpty()) {
%>
<form action="GenerateBillServlet" method="post">
    <table border="1">
        <tr>
            <th>Select</th>
            <th>ID</th>
            <th>Name</th>
            <th>Address</th>
            <th>Phone</th>
            <th>Email</th>
        </tr>
        <% for (Customer c : customers) { %>
        <tr>
            <td><input type="radio" name="customerId" value="<%= c.getCustomerid() %>" required /></td>
            <td><%= c.getCustomerid() %></td>
            <td><%= c.getName() %></td>
            <td><%= c.getAddress() %></td>
            <td><%= c.getPhonenumber() %></td>
            <td><%= c.getEmail() %></td>
        </tr>
        <% } %>
    </table>
    <br>
    <input type="submit" value="✅ Generate Bill" />
</form>
<% } else { %>
<p>No customers found.</p>
<% } %>

<p><a href="staff_cart.jsp">⬅ Back to Cart</a></p>
</body>
</html>
