<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, com.example.pahanaedu_billing_system.model.*" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Staff View Bills | Pahana Edu</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@700;400&display=swap" rel="stylesheet"/>
    <style>
        body { font-family: 'Inter','Segoe UI',Arial,sans-serif; }
        ::selection { background: #a5b4fc; }
        ::-webkit-scrollbar {
            width: 8px;
            height: 8px;
        }
        ::-webkit-scrollbar-thumb {
            background-color: #60a5fa;
            border-radius: 4px;
        }
    </style>
</head>
<body class="bg-gradient-to-tr from-blue-50 via-blue-100 to-blue-300 min-h-screen py-10 px-4 flex flex-col items-center">

<div class="w-full max-w-6xl bg-white rounded-3xl shadow-xl px-8 py-10">
    <h1 class="text-3xl font-bold text-blue-700 text-center mb-8">All Bills</h1>

    <!-- Bills Table -->
    <div class="overflow-x-auto mb-10 border rounded-2xl shadow-lg">
        <table class="min-w-full bg-white text-sm">
            <thead class="bg-blue-100 text-blue-900 text-base">
            <tr>
                <th class="py-3 px-4 text-center font-semibold">Bill ID</th>
                <th class="py-3 px-4 text-center font-semibold">Customer Name</th>
                <th class="py-3 px-4 text-center font-semibold">Phone</th>
                <th class="py-3 px-4 text-center font-semibold">Date</th>
                <th class="py-3 px-4 text-center font-semibold">Total</th>
                <th class="py-3 px-4 text-center font-semibold">Action</th>
            </tr>
            </thead>
            <tbody>
            <%
                List<Bill> bills = (List<Bill>) request.getAttribute("bills");
                if (bills != null && !bills.isEmpty()) {
                    DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
                    for (Bill billObj : bills) {
                        Customer cust = billObj.getCustomer();
                        String formattedDate = billObj.getDateTime() != null
                                ? billObj.getDateTime().format(dateFormatter) : "N/A";
            %>
            <tr class="hover:bg-gray-100 transition border-t">
                <td class="py-2 px-4 text-center"><%= billObj.getBillId() %></td>
                <td class="py-2 px-4 text-center"><%= (cust != null ? cust.getName() : "N/A") %></td>
                <td class="py-2 px-4 text-center"><%= (cust != null ? cust.getPhonenumber() : "N/A") %></td>
                <td class="py-2 px-4 text-center"><%= formattedDate %></td>
                <td class="py-2 px-4 text-center">Rs. <%= String.format("%.2f", billObj.getTotal()) %></td>
                <td class="py-2 px-4 text-center flex justify-center gap-2">
                    <a href="StaffViewBillDetailsServlet?billId=<%= billObj.getBillId() %>"
                       class="bg-blue-500 hover:bg-blue-600 text-white text-sm font-semibold px-3 py-1 rounded transition">
                        View Details
                    </a>
                </td>
            </tr>
            <%
                }
            } else {
            %>
            <tr>
                <td colspan="6" class="py-6 text-center text-gray-500 font-medium">
                    No bills found.
                </td>
            </tr>
            <%
                }
            %>
            </tbody>
        </table>
    </div>

    <!-- Bill Detail Section -->
    <%
        Bill selectedBill = (Bill) request.getAttribute("bill");
        if (selectedBill != null) {
            Customer sc = selectedBill.getCustomer();
            List<BillItem> items = selectedBill.getItems();
            String detailDate = selectedBill.getDateTime() != null ?
                    selectedBill.getDateTime().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm")) : "N/A";
    %>
    <div class="bg-white border border-gray-200 p-6 rounded-2xl shadow-xl">
        <h2 class="text-xl font-bold text-blue-700 mb-4">
            Bill Details (ID: <%= selectedBill.getBillId() %>)
        </h2>
        <div class="mb-4 space-y-1">
            <p><strong>Customer Name:</strong> <%= (sc != null ? sc.getName() : "N/A") %></p>
            <p><strong>Phone:</strong> <%= (sc != null ? sc.getPhonenumber() : "N/A") %></p>
            <p><strong>Date:</strong> <%= detailDate %></p>
            <p><strong>Total:</strong> Rs. <%= String.format("%.2f", selectedBill.getTotal()) %></p>
        </div>

        <h3 class="text-lg font-semibold mb-2 mt-4 text-blue-600">Purchased Items:</h3>
        <table class="min-w-full bg-blue-50 text-sm rounded border">
            <thead class="bg-blue-100 text-blue-700">
            <tr>
                <th class="py-2 px-4 text-left">Book Title</th>
                <th class="py-2 px-4 text-left">Price</th>
                <th class="py-2 px-4 text-left">Quantity</th>
                <th class="py-2 px-4 text-left">Subtotal</th>
            </tr>
            </thead>
            <tbody>
            <%
                if (items != null && !items.isEmpty()) {
                    for (BillItem item : items) {
                        String bookTitle = (item.getBook() != null && item.getBook().getTitle() != null)
                                ? item.getBook().getTitle() : item.getBookId();
            %>
            <tr class="border-t hover:bg-gray-50">
                <td class="py-2 px-4"><%= bookTitle %></td>
                <td class="py-2 px-4">Rs. <%= String.format("%.2f", item.getPrice()) %></td>
                <td class="py-2 px-4"><%= item.getQuantity() %></td>
                <td class="py-2 px-4">Rs. <%= String.format("%.2f", item.getPrice() * item.getQuantity()) %></td>
            </tr>
            <%
                }
            } else {
            %>
            <tr>
                <td colspan="4" class="py-3 text-center text-red-500">No items found.</td>
            </tr>
            <%
                }
            %>
            </tbody>
        </table>
    </div>
    <%
        }
    %>
</div>

</body>
</html>
