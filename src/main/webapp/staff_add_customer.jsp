<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Add New Customer - Staff Section</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!-- Tailwind CSS CDN -->
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@700;400&display=swap" rel="stylesheet" />
    <style>
        body { font-family: 'Inter', 'Segoe UI', Arial, sans-serif; }
        ::selection { background: #a5b4fc; }

        ::-webkit-scrollbar {
            width: 8px;
            height: 8px;
        }
        ::-webkit-scrollbar-thumb {
            background-color: #60a5fa; /* Tailwind blue-400 */
            border-radius: 4px;
        }
    </style>
</head>
<body class="bg-gradient-to-tr from-blue-50 via-blue-100 to-blue-300 min-h-screen flex items-center justify-center">

<div class="w-full max-w-2xl bg-white/90 backdrop-blur-lg rounded-3xl px-8 py-14 flex flex-col gap-3 items-center">
    <!-- Heading Only (no avatar/profile panel) -->
    <div class="mb-6 flex flex-col items-center">
        <h2 class="text-2xl sm:text-3xl font-extrabold text-blue-700 mb-1 text-center tracking-tight">Add New Customer</h2>
        <span class="text-xs text-gray-400 mb-2 text-center">Staff Section</span>
    </div>

    <!-- Success/Error Messages -->
    <% if (request.getAttribute("message") != null) { %>
    <div class="w-full mb-4 bg-green-100 text-green-800 border border-green-400 rounded-lg px-5 py-3 text-center">
        <strong><%= request.getAttribute("message") %></strong>
    </div>
    <% } else if (request.getAttribute("error") != null) { %>
    <div class="w-full mb-4 bg-red-100 text-red-700 border border-red-400 rounded-lg px-5 py-3 text-center">
        <%= request.getAttribute("error") %>
    </div>
    <% } %>

    <!-- Client-side Error Message Container -->
    <div id="client-error" class="w-full mb-4 bg-red-100 text-red-700 border border-red-400 rounded-lg px-5 py-3 text-center hidden"></div>

    <!-- Main Form -->
    <form action="AddCustomerServlet?action=add" method="post" class="w-full space-y-7" onsubmit="return validateForm()">
        <div class="grid grid-cols-1 md:grid-cols-2 gap-x-10 gap-y-5">
            <div>
                <label for="name" class="block text-gray-700 mb-1 font-semibold">Name <span class="text-red-500">*</span></label>
                <input type="text" name="name" id="name" required
                       class="w-full px-4 py-3 border border-blue-100 rounded-xl bg-blue-50 text-base focus:outline-none focus:border-blue-400 focus:ring-2 focus:ring-blue-200 transition"/>
            </div>
            <div>
                <label for="address" class="block text-gray-700 mb-1 font-semibold">Address</label>
                <input type="text" name="address" id="address"
                       class="w-full px-4 py-3 border border-blue-100 rounded-xl bg-blue-50 text-base focus:outline-none focus:border-blue-400 focus:ring-2 focus:ring-blue-200 transition"/>
            </div>
            <div>
                <label for="phonenumber" class="block text-gray-700 mb-1 font-semibold">Phone Number</label>
                <input type="text" name="phonenumber" id="phonenumber"
                       class="w-full px-4 py-3 border border-blue-100 rounded-xl bg-blue-50 text-base focus:outline-none focus:border-blue-400 focus:ring-2 focus:ring-blue-200 transition"/>
            </div>
            <div>
                <label for="email" class="block text-gray-700 mb-1 font-semibold">Email</label>
                <input type="email" name="email" id="email"
                       class="w-full px-4 py-3 border border-blue-100 rounded-xl bg-blue-50 text-base focus:outline-none focus:border-blue-400 focus:ring-2 focus:ring-blue-200 transition"/>
            </div>
        </div>
        <button type="submit"
                class="w-full mt-4 bg-gradient-to-r from-blue-600 to-indigo-600 hover:from-blue-700 hover:to-indigo-700 text-white py-3 rounded-xl font-semibold text-lg transition focus:outline-none focus:ring-2 focus:ring-blue-400 tracking-wide">
            Add Customer
        </button>
    </form>
</div>

<script>
    function validateForm() {
        var mobileNumber = document.getElementById("phonenumber").value;
        var email = document.getElementById("email").value;
        var errorDiv = document.getElementById("client-error");
        var errorMessage = "";

        // Clear previous errors
        errorDiv.classList.add("hidden");
        errorDiv.innerHTML = "";

        // Check if mobile number contains only numbers (allow empty)
        if (mobileNumber !== "" && !/^\d+$/.test(mobileNumber)) {
            errorMessage += "Mobile number can only contain numbers.<br>";
        }

        // Check if email is a valid Gmail address (allow empty)
        if (email !== "" && !/^[a-zA-Z0-9._%+-]+@gmail\.com$/.test(email)) {
            errorMessage += "Please enter a valid Gmail address.<br>";
        }

        if (errorMessage !== "") {
            errorDiv.innerHTML = errorMessage;
            errorDiv.classList.remove("hidden");
            return false;
        }

        return true;
    }
</script>

</body>
</html>
