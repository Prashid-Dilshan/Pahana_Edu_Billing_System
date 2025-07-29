<%@ page import="com.example.pahanaedu_billing_system.model.Bill" %>
<%@ page import="java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page session="true" %>

<%
    Bill bill = (Bill) session.getAttribute("generatedBill");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Bill Success</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
        body {
            background: linear-gradient(135deg, #f8fffa 0%, #e0ffe9 100%);
            font-family: 'Segoe UI', 'sans-serif';
            min-height: 100vh;
            margin: 0;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .card {
            background: #fff;
            box-shadow: 0 8px 28px 0 rgba(40,167,69,0.08), 0 1.5px 5px rgba(128,128,128,0.10);
            border-radius: 18px;
            padding: 36px 32px 32px 32px;
            max-width: 410px;
            width: 100%;
            text-align: center;
            position: relative;
        }
        .success-icon {
            font-size: 54px;
            color: #3ac569;
        }
        .card h2 {
            margin-top: 16px;
            color: #3ac569;
            font-weight: 600;
            letter-spacing: 0.02em;
        }
        .details {
            /* margin-bottom: 24px; */
            color: #222;
            font-size: 1.09em;
            margin: 28px 0 16px 0;
        }
        .details p {
            margin: 8px 0;
        }
        .btn {
            display: inline-block;
            border: none;
            padding: 11px 30px 11px 28px;
            border-radius: 8px;
            font-size: 1em;
            font-weight: 500;
            margin: 7px 5px 0 5px;
            text-decoration: none;
            transition: background 0.13s;
            cursor: pointer;
            background: #3ac569;
            color: #fff;
            box-shadow: 0 1.5px 8px 0 rgba(60,205,80,0.08);
        }
        .btn:active, .btn:focus {
            outline: none;
            background: #30b35c;
        }
        .btn.secondary {
            background: #e6eefa;
            color: #2a557d;
        }
        .btn.secondary:active, .btn.secondary:focus {
            background: #b9d6f5;
        }
        .error {
            color: #c0392b;
            font-size: 1.08em;
        }
        @media (max-width: 600px) {
            .card {
                padding: 15vw 4vw 8vw 4vw;
            }
        }
    </style>
</head>
<body>
<% if (bill == null) { %>
<div class="card">
    <div class="error">⚠️ Error: Bill data not available in session.</div>
    <a href="staff_dashboard.html" class="btn secondary" style="margin-top:1.2em;">← Back to Dashboard</a>
</div>
<% } else { %>
<div class="card">
    <div class="success-icon">✔️</div>
    <h2>Bill Generated Successfully</h2>
    <div class="details">
        <p><strong>Customer ID:</strong> <%= bill.getCustomerId() %></p>
        <p><strong>Total:</strong> Rs. <%= String.format("%.2f", bill.getTotal()) %></p>
        <p><strong>Time:</strong> <%= bill.getDateTime() %></p>
    </div>
    <a href="DownloadPDFServlet?billId=<%= bill.getBillId() %>" class="btn">📥 Download PDF</a>
    <a href="staff_dashboard.html" class="btn secondary">🏠 Go to Dashboard</a>
</div>
<% } %>
</body>
</html>
