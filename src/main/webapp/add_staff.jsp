<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Add Staff Member</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <style>
    body { background: #f5f8fa; font-family: Arial, sans-serif; }
    .container { max-width: 480px; margin: 60px auto; background: #fff; border-radius: 8px; box-shadow: 0 4px 24px rgba(0,0,0,0.08); padding: 32px; }
    h2 { color: #007bff; margin-bottom: 24px; text-align: center; }
    label { display: block; margin-bottom: 6px; font-weight: 600; }
    input[type="text"], input[type="password"] { width: 100%; padding: 10px; margin-bottom: 16px; border: 1px solid #ccc; border-radius: 4px; }
    button[type="submit"] { width: 100%; background: #007bff; color: #fff; border: none; padding: 12px; border-radius: 4px; font-size: 16px; cursor: pointer; }
    button[type="submit"]:hover { background: #0056b3; }
    .success { color: green; text-align: center; margin-top: 10px; }
    .error { color: #c00; text-align: center; margin-top: 10px; }
  </style>
</head>
<body>
<div class="container">
  <h2>Add New Staff Member</h2>
  <form action="addStaff" method="post">
    <label for="staffid">Staff ID</label>
    <input type="text" id="staffid" name="staffid" required>
    <label for="name">Staff Name</label>
    <input type="text" id="name" name="name" required>
    <label for="address">Address</label>
    <input type="text" id="address" name="address" required>
    <label for="mobilenumber">Mobile Number</label>
    <input type="text" id="mobilenumber" name="mobilenumber" required>
    <label for="username">Username</label>
    <input type="text" id="username" name="username" required>
    <label for="password">Password</label>
    <input type="password" id="password" name="password" required>
    <button type="submit">Add Staff</button>
  </form>
  <div class="success">${message}</div>
  <div class="error">${error}</div>
  <p><a href="admin_dashboard.html">&larr; Back to Admin Dashboard</a></p>
</div>


<%-- Success message --%>
<% if (request.getAttribute("message") != null) { %>
<div style="color: green;"><%= request.getAttribute("message") %></div>
<% } %>

<%-- Error message --%>
<% if (request.getAttribute("error") != null) { %>
<div style="color: red;"><%= request.getAttribute("error") %></div>
<% } %>


</body>
</html>
