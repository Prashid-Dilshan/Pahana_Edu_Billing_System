<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Login - Pahana Edu Billing System</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
        body { background: linear-gradient(120deg, #f5f8fa 60%, #007bff 100%); font-family: 'Segoe UI', Arial, sans-serif; min-height: 100vh; }
        .container { max-width: 400px; margin: 100px auto 0 auto; background: #fff; border-radius: 16px; box-shadow: 0 8px 32px rgba(0,0,0,0.12); padding: 40px 32px 32px 32px; }
        h2 { text-align: center; color: #007bff; margin-bottom: 28px; font-size: 2rem; }
        label { display: block; margin-bottom: 6px; font-weight: 600; color: #333; }
        input[type="text"], input[type="password"] { width: 100%; padding: 12px; margin-bottom: 20px; border: 1px solid #ccc; border-radius: 4px; font-size: 16px; }
        button[type="submit"] { width: 100%; background: #007bff; color: #fff; border: none; padding: 14px; border-radius: 4px; font-size: 18px; cursor: pointer; font-weight: 600; margin-top: 8px; }
        button[type="submit"]:hover { background: #0056b3; }
        .error { color: #c00; text-align: center; margin-top: 14px; font-size: 16px; font-weight: 600; }
        .back-link { display: block; text-align: center; margin-top: 24px; color: #007bff; text-decoration: none; font-size: 15px; }
        .back-link:hover { text-decoration: underline; }
    </style>
</head>
<body>
<div class="container">
    <h2>Admin Login</h2>
    <form action="login" method="post">
        <label for="username">Username</label>
        <input type="text" id="username" name="username" required>
        <label for="password">Password</label>
        <input type="password" id="password" name="password" required>
        <button type="submit">Login</button>
    </form>
    <div class="error">${error}</div>
    <a class="back-link" href="login.html">&larr; Back to Login Options</a>
</div>
</body>
</html>
