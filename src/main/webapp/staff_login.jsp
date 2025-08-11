<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>Staff Login - Pahana Edu Billing System</title>
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <!-- Tailwind CSS CDN -->
  <script src="https://cdn.tailwindcss.com"></script>
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@700;400&display=swap" rel="stylesheet" />
  <style>
    body {
      font-family: 'Inter', 'Segoe UI', Arial, sans-serif;
    }
  </style>
</head>
<body class="bg-gradient-to-br from-gray-50 via-blue-50 to-blue-400 min-h-screen flex items-center justify-center relative">

<!-- Staff Login Container -->
<div class="w-full max-w-sm bg-white rounded-3xl shadow-xl px-8 py-10">
  <div class="flex flex-col items-center mb-6">
    <!-- Bigger and correctly sized logo -->
    <img src="./assets/logo1.png" alt="Logo" class="w-32 h-32 rounded-md object-contain mb-4" />
    <h2 class="text-2xl font-bold text-blue-700 mb-1 text-center">Billing System - Staff Login</h2>
    <span class="text-xs text-gray-400 text-center">User Correct Username And Passowrd</span>
  </div>

  <form action="staffLogin" method="post" class="space-y-5">
    <div>
      <label for="username" class="block font-semibold text-gray-700 mb-1">Staff Username</label>
      <input
              type="text"
              id="username"
              name="username"
              required
              class="w-full px-3 py-3 border border-gray-300 rounded-lg text-base focus:ring-2 focus:ring-blue-300 focus:outline-none transition bg-blue-50"
      />
    </div>
    <div>
      <label for="password" class="block font-semibold text-gray-700 mb-1">Password</label>
      <div class="relative">
        <input
                type="password"
                id="password"
                name="password"
                required
                class="w-full px-3 py-3 border border-gray-300 rounded-lg text-base focus:ring-2 focus:ring-blue-300 focus:outline-none transition bg-blue-50"
        />
        <span id="togglePassword" class="absolute inset-y-0 right-0 flex items-center pr-3 cursor-pointer text-gray-500 hover:text-blue-600">
          <!-- Eye icon (closed by default) -->
          <svg id="eyeIcon" xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z" />
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z" />
          </svg>
        </span>
      </div>
    </div>
    <button
            type="submit"
            class="w-full bg-blue-400 hover:bg-blue-600 text-white py-3 rounded-lg font-semibold text-lg shadow transition focus:outline-none focus:ring-2 focus:ring-blue-200"
    >
      Login
    </button>
    <c:if test="${not empty error}">
      <div class="text-red-600 text-center font-semibold mt-2">${error}</div>
    </c:if>
  </form>
  <a
          href="login.html"
          class="block mt-7 text-blue-700 text-center font-medium hover:underline hover:text-blue-800 transition"
  >&larr; Back to Login Options</a
  >
</div>

<!-- Floating ? Icon Button in Bottom Right Corner -->
<button
        type="button"
        id="openModalBtn"
        aria-label="Staff Login Guidelines"
        title="Staff Login Guidelines"
        class="fixed bottom-7 right-8 bg-white text-blue-600 text-3xl font-extrabold
           rounded-full shadow-lg flex items-center justify-center w-14 h-14
           border-2 border-blue-400 hover:bg-blue-50 z-50 transition"
        style="box-shadow: 0 4px 24px rgba(44,132,235,0.14);"
>
  ?
</button>

<!-- Guideline Modal -->
<div
        id="loginGuidelineModal"
        class="fixed inset-0 z-50 hidden items-center justify-center bg-black/40"
        role="dialog"
        aria-modal="true"
        aria-labelledby="modalTitle"
>
  <div class="bg-white rounded-2xl p-6 w-full max-w-xs mx-4 shadow-lg relative">
    <button
            type="button"
            id="closeModalBtn"
            class="absolute top-2 right-2 text-gray-500 hover:text-blue-500 transition text-3xl leading-none"
            aria-label="Close"
    >
      &times;
    </button>
    <h3 id="modalTitle" class="text-lg font-bold text-blue-600 mb-2 text-center">Staff Login Guidelines</h3>
    <ul class="text-sm text-gray-700 list-disc list-inside space-y-1">
      <li>Use your assigned staff username and password.</li>
      <li>Password is case-sensitive.</li>
      <li>If you forgot your password, contact the system administrator.</li>
      <li>Do not share your login details with anyone.</li>
      <li>Contact support for Admin.</li>
    </ul>
    <button
            type="button"
            id="okBtn"
            class="mt-5 w-full bg-blue-400 hover:bg-blue-600 text-white py-2 rounded font-semibold transition"
    >
      OK
    </button>
  </div>
</div>

<script>
  // Existing modal script
  const modal = document.getElementById('loginGuidelineModal');
  const openBtn = document.getElementById('openModalBtn');
  const closeBtn = document.getElementById('closeModalBtn');
  const okBtn = document.getElementById('okBtn');

  function openModal() {
    modal.classList.remove('hidden');
    modal.classList.add('flex');
  }
  function closeModal() {
    modal.classList.remove('flex');
    modal.classList.add('hidden');
  }

  openBtn.addEventListener('click', openModal);
  closeBtn.addEventListener('click', closeModal);
  okBtn.addEventListener('click', closeModal);

  // Close modal when clicking outside modal content
  modal.addEventListener('click', (e) => {
    if (e.target === modal) {
      closeModal();
    }
  });

  // Optional: Close modal on Escape key
  document.addEventListener('keydown', (e) => {
    if (e.key === 'Escape' && !modal.classList.contains('hidden')) {
      closeModal();
    }
  });

  // New script for password toggle
  const togglePassword = document.getElementById('togglePassword');
  const password = document.getElementById('password');
  const eyeIcon = document.getElementById('eyeIcon');

  togglePassword.addEventListener('click', function () {
    const type = password.getAttribute('type') === 'password' ? 'text' : 'password';
    password.setAttribute('type', type);

    // Toggle eye icon (open/closed)
    if (type === 'text') {
      eyeIcon.innerHTML = '<path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13.875 18.825A10.05 10.05 0 0112 19c-4.478 0-8.268-2.943-9.543-7a9.97 9.97 0 011.563-3.029m5.858.908a3 3 0 114.243 4.243M9.878 9.878l4.242 4.242M9.88 9.88l-3.29-3.29m7.532 7.532l3.29 3.29M3 3l3.59 3.59m0 0A9.953 9.953 0 0112 5c4.478 0 8.268 2.943 9.543 7a10.025 10.025 0 01-4.132 5.411m0 0L21 21" />';
    } else {
      eyeIcon.innerHTML = '<path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z" /><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z" />';
    }
  });
</script>
</body>
</html>
