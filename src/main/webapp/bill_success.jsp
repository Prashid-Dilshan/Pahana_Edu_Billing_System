<%@ page import="com.example.pahanaedu_billing_system.model.Bill" %>
<%@ page import="java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page session="true" %>

<%
    Bill bill = (Bill) session.getAttribute("generatedBill");
%>

<html>
<head>
    <title>Bill Success</title>
</head>
<body>
<% if (bill == null) { %>
<p style="color:red;">⚠️ Error: Bill data not available in session.</p>
<a href="staff_dashboard.html">Back to Dashboard</a>
<% } else { %>
<h2>✅ Bill Generated Successfully!</h2>
<p><strong>Customer ID:</strong> <%= bill.getCustomerId() %></p>
<p><strong>Total:</strong> Rs. <%= String.format("%.2f", bill.getTotal()) %></p>
<p><strong>Time:</strong> <%= bill.getDateTime() %></p>

<!-- 👉 Download PDF or go to dashboard -->
<a href="DownloadPDFServlet?billId=<%= bill.getBillId() %>">📥 Download PDF</a>
<br><br>
<a href="staff_dashboard.html">🏠 Go to Dashboard</a>
<% } %>
</body>
</html>
