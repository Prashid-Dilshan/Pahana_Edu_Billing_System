<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%
    int customerTotal = 0;
    int staffTotal = 0;
    int bookTotal = 0;
    int billsTotal = 0;
    int billsToday = 0;
    double billsTodaySum = 0.0;

    String url = "jdbc:mysql://localhost:3306/pahana_edu";
    String dbUser = "root";
    String dbPass = "";

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection(url, dbUser, dbPass);
        Statement stmt = con.createStatement();

        // Customer count
        ResultSet rs = stmt.executeQuery("SELECT COUNT(*) FROM customer");
        if(rs.next()){ customerTotal = rs.getInt(1); }
        rs.close();

        // Staff count
        rs = stmt.executeQuery("SELECT COUNT(*) FROM staff");
        if(rs.next()){ staffTotal = rs.getInt(1); }
        rs.close();

        // Book count
        rs = stmt.executeQuery("SELECT COUNT(*) FROM books");
        if(rs.next()){ bookTotal = rs.getInt(1); }
        rs.close();

        // Total bills count
        rs = stmt.executeQuery("SELECT COUNT(*) FROM bills");
        if(rs.next()){ billsTotal = rs.getInt(1); }
        rs.close();

        // Today's bills count
        rs = stmt.executeQuery("SELECT COUNT(*) FROM bills WHERE DATE(billdate) = CURDATE()");
        if(rs.next()){ billsToday = rs.getInt(1); }
        rs.close();

        // Today's bills sum
        rs = stmt.executeQuery("SELECT IFNULL(SUM(total),0) FROM bills WHERE DATE(billdate) = CURDATE()");
        if(rs.next()){ billsTodaySum = rs.getDouble(1); }
        rs.close();

        stmt.close(); con.close();
    } catch(Exception ex){
        out.println("<span style='color:red;'>Count error: " + ex.getMessage() + "</span>");
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Admin Home - Pahana Edu Billing System</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!-- Tailwind CSS -->
    <script src="https://cdn.tailwindcss.com"></script>
    <!-- Google Material Icons -->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <!-- Font family -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@700;400&display=swap" rel="stylesheet" />
    <style>
        body { font-family: 'Inter', 'Segoe UI', Arial, sans-serif; }
        ::-webkit-scrollbar { width: 8px; height: 8px; }
        ::-webkit-scrollbar-thumb { background-color: #60a5fa; border-radius: 4px; }
    </style>
</head>
<body class="bg-gradient-to-br from-gray-50 to-gray-200 min-h-screen flex items-center justify-center">
<div class="w-full max-w-5xl min-h-[80vh] py-10 px-4">
    <!-- Header -->
    <div class="mb-8">
        <h1 class="text-3xl font-extrabold text-gray-700 mb-2 tracking-tight">Dashboard Overview</h1>
        <div class="text-sm text-gray-400 font-medium">Pahana Edu Billing System</div>
    </div>
    <!-- Stat cards grid -->
    <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 xl:grid-cols-6 gap-6">
        <!-- Customers -->
        <div class="bg-white rounded-xl p-6 shadow-sm flex flex-col items-center transition hover:shadow-md">
            <span class="material-icons text-gray-300 text-4xl mb-1">people</span>
            <div class="text-3xl font-bold text-gray-700 mb-1"><%= customerTotal %></div>
            <div class="text-sm font-medium text-gray-500 tracking-wide">Customers</div>
        </div>
        <!-- Staff -->
        <div class="bg-white rounded-xl p-6 shadow-sm flex flex-col items-center transition hover:shadow-md">
            <span class="material-icons text-gray-300 text-4xl mb-1">supervisor_account</span>
            <div class="text-3xl font-bold text-gray-700 mb-1"><%= staffTotal %></div>
            <div class="text-sm font-medium text-gray-500 tracking-wide">Staff</div>
        </div>
        <!-- Books -->
        <div class="bg-white rounded-xl p-6 shadow-sm flex flex-col items-center transition hover:shadow-md">
            <span class="material-icons text-gray-300 text-4xl mb-1">menu_book</span>
            <div class="text-3xl font-bold text-gray-700 mb-1"><%= bookTotal %></div>
            <div class="text-sm font-medium text-gray-500 tracking-wide">Books</div>
        </div>
        <!-- Total Bills -->
        <div class="bg-white rounded-xl p-6 shadow-sm flex flex-col items-center transition hover:shadow-md">
            <span class="material-icons text-gray-300 text-4xl mb-1">receipt_long</span>
            <div class="text-3xl font-bold text-gray-700 mb-1"><%= billsTotal %></div>
            <div class="text-sm font-medium text-gray-500 tracking-wide">Total Bills</div>
        </div>
        <!-- Today's Bills -->
        <div class="bg-white rounded-xl p-6 shadow-sm flex flex-col items-center transition hover:shadow-md">
            <span class="material-icons text-gray-300 text-4xl mb-1">today</span>
            <div class="text-3xl font-bold text-gray-700 mb-1"><%= billsToday %></div>
            <div class="text-sm font-medium text-gray-500 tracking-wide">Today's Bills</div>
        </div>
        <!-- Today's Bill Amount -->
        <div class="bg-white rounded-xl p-6 shadow-sm flex flex-col items-center transition hover:shadow-md">
            <span class="material-icons text-gray-300 text-4xl mb-1">request_quote</span>
            <div class="text-2xl font-bold text-gray-700 mb-1">
                <%= String.format("Rs. %.2f", billsTodaySum) %>
            </div>
            <div class="text-sm font-medium text-gray-500 tracking-wide">Today's Bill Total</div>
        </div>

    </div>
    <!-- Footer -->
    <footer class="text-center mt-12">
        <span class="text-xs text-gray-400">Pahana Edu Billing System &copy; 2025</span>
    </footer>
</div>
</body>
</html>
