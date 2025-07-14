<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Staff Login</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <style>
    body { background: #f5f8fa; font-family: Arial, sans-serif; }
    .container { max-width: 400px; margin: 80px auto; background: #fff; border-radius: 8px; box-shadow: 0 4px 24px rgba(0,0,0,0.08); padding: 32px; }
    h2 { text-align: center; color: #007bff; margin-bottom: 24px; }
    label { display: block; margin-bottom: 6px; font-weight: 600; }
    input[type="text"], input[type="password"] { width: 100%; padding: 10px; margin-bottom: 16px; border: 1px solid #ccc; border-radius: 4px; }
    button[type="submit"] { width: 100%; background: #007bff; color: #fff; border: none; padding: 12px; border-radius: 4px; font-size: 16px; cursor: pointer; }
    button[type="submit"]:hover { background: #0056b3; }
    .error { color: #c00; text-align: center; margin-top: 8px; }
  </style>
</head>
<body>
<div class="container">
  <h2>Staff Login</h2>
  <form action="staffLogin" method="post">
    <label for="username">Staff Username</label>
    <input type="text" id="username" name="username" required>
    <label for="password">Password</label>
    <input type="password" id="password" name="password" required>
    <button type="submit">Login</button>
  </form>
  <div class="error">${error}</div>
</div>
</body>
</html>
