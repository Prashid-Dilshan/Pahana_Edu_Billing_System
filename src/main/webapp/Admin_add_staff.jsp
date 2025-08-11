<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>Add Staff Member - Admin Panel</title>
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <script src="https://cdn.tailwindcss.com"></script>
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@700;400&display=swap" rel="stylesheet"/>
  <style>
    body { font-family: 'Inter', 'Segoe UI', Arial, sans-serif; }
    ::selection { background: #a5b4fc; }
    ::-webkit-scrollbar { width: 8px; height: 8px; }
    ::-webkit-scrollbar-thumb { background-color: #60a5fa; border-radius: 4px; }
  </style>
</head>
<body class="bg-gradient-to-tr from-blue-50 via-blue-100 to-blue-300 min-h-screen flex items-center justify-center p-6">

<div class="w-full max-w-2xl bg-white/90 backdrop-blur-lg rounded-3xl px-8 py-14 flex flex-col gap-3 items-center">

  <!-- Title -->
  <div class="mb-6 flex flex-col items-center">
    <h2 class="text-2xl sm:text-3xl font-extrabold text-blue-700 mb-1 text-center tracking-tight">Add Staff Member</h2>
    <span class="text-xs text-gray-400 mb-2 text-center">Admin Panel</span>
  </div>

  <!-- Messages -->
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

  <!-- Form -->
  <form action="AdminManageStaffServlet" method="post" class="w-full space-y-7" onsubmit="return validateForm()">
    <input type="hidden" name="action" value="add" />

    <div class="grid grid-cols-1 md:grid-cols-2 gap-x-10 gap-y-5">
      <div>
        <label for="staffid" class="block text-gray-700 mb-1 font-semibold">Staff ID <span class="text-red-500">*</span></label>
        <input type="text" id="staffid" name="staffid" required
               class="w-full px-4 py-3 border border-blue-100 rounded-xl bg-blue-50 text-base focus:outline-none focus:border-blue-400 focus:ring-2 focus:ring-blue-200 transition"/>
      </div>
      <div>
        <label for="name" class="block text-gray-700 mb-1 font-semibold">Name <span class="text-red-500">*</span></label>
        <input type="text" id="name" name="name" required
               class="w-full px-4 py-3 border border-blue-100 rounded-xl bg-blue-50 text-base focus:outline-none focus:border-blue-400 focus:ring-2 focus:ring-blue-200 transition"/>
      </div>
      <div>
        <label for="address" class="block text-gray-700 mb-1 font-semibold">Address</label>
        <input type="text" id="address" name="address"
               class="w-full px-4 py-3 border border-blue-100 rounded-xl bg-blue-50 text-base focus:outline-none focus:border-blue-400 focus:ring-2 focus:ring-blue-200 transition"/>
      </div>
      <div>
        <label for="mobilenumber" class="block text-gray-700 mb-1 font-semibold">Mobile Number</label>
        <input type="text" id="mobilenumber" name="mobilenumber"
               class="w-full px-4 py-3 border border-blue-100 rounded-xl bg-blue-50 text-base focus:outline-none focus:border-blue-400 focus:ring-2 focus:ring-blue-200 transition"/>
      </div>
      <div>
        <label for="username" class="block text-gray-700 mb-1 font-semibold">Username</label>
        <input type="text" id="username" name="username" required
               class="w-full px-4 py-3 border border-blue-100 rounded-xl bg-blue-50 text-base focus:outline-none focus:border-blue-400 focus:ring-2 focus:ring-blue-200 transition"/>
      </div>
      <div>
        <label for="password" class="block text-gray-700 mb-1 font-semibold">Password</label>
        <input type="password" id="password" name="password" required
               class="w-full px-4 py-3 border border-blue-100 rounded-xl bg-blue-50 text-base focus:outline-none focus:border-blue-400 focus:ring-2 focus:ring-blue-200 transition"/>
      </div>
    </div>

    <button type="submit"
            class="w-full mt-4 bg-gradient-to-r from-blue-600 to-indigo-600 hover:from-blue-700 hover:to-indigo-700 text-white py-3 rounded-xl font-semibold text-lg transition focus:outline-none focus:ring-2 focus:ring-blue-400 tracking-wide">
      Add Staff
    </button>
  </form>
</div>

<script>
  function validateForm() {
    var username = document.getElementById("username").value;
    var password = document.getElementById("password").value;
    var mobileNumber = document.getElementById("mobilenumber").value;
    var errorDiv = document.getElementById("client-error");
    var errorMessage = "";

    // Clear previous errors
    errorDiv.classList.add("hidden");
    errorDiv.innerHTML = "";

    // Check if username and password are the same
    if (username === password && username !== "") {
      errorMessage += "Username and password cannot be the same.<br>";
    }

    // Check if mobile number contains only numbers (allow empty)
    if (mobileNumber !== "" && !/^\d+$/.test(mobileNumber)) {
      errorMessage += "Mobile number can only contain numbers.<br>";
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
