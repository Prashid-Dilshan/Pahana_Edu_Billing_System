<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Staff Guidelines - Pahana Edu Billing System</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@700;400&display=swap" rel="stylesheet" />
    <style>
        body { font-family: 'Inter', 'Segoe UI', Arial, sans-serif; }
        .section-icon { width: 2.5rem; height: 2.5rem; }
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
<body class="bg-gradient-to-tr from-blue-50 via-blue-100 to-blue-300 min-h-screen flex flex-col items-center justify-center py-12 px-3">

<div class="w-full max-w-3xl bg-white/90 rounded-3xl shadow-2xl backdrop-blur p-10 border border-blue-100">
    <div class="flex flex-col sm:flex-row items-center gap-5 mb-6">
        <div class="flex-shrink-0">

        </div>
        <div>
            <h1 class="text-3xl sm:text-4xl font-extrabold text-transparent bg-clip-text bg-gradient-to-r from-blue-500 to-indigo-600 mb-2">Staff Guidelines</h1>
            <p class="text-gray-500 text-md">Empower yourself to deliver your best—follow each step below for success!</p>
        </div>
    </div>

    <div class="mb-8 bg-gradient-to-r from-blue-100 via-blue-50 to-indigo-100 rounded-xl p-6 border border-blue-200 shadow">
        <span class="text-blue-600 font-semibold text-lg">Welcome!</span>
        <span class="text-gray-600">This guide introduces you to your essential duties and helps you excel as a valued staff member of the Pahana Edu Billing System. Each step is crafted for smooth daily workflows and top-notch service.</span>
    </div>

    <div class="divide-y divide-blue-100 space-y-4">

        <!-- Step 1 -->
        <section class="pt-4 flex gap-4 items-start">
            <div>
                <span class="inline-flex items-center justify-center rounded-xl bg-sky-100 p-2 section-icon"><span class="text-sky-600 text-2xl font-bold">1</span></span>
            </div>
            <div>
                <h2 class="text-xl font-semibold text-blue-700 mb-1 flex items-center gap-2">Add Customer</h2>
                <p class="text-gray-700 mb-2">Start every day by onboarding new customers. Collect all details accurately: name, contact, and billing information. Double-check for typos—a correct record saves everyone time.</p>
                <ul class="list-disc list-inside text-blue-500 text-sm pl-2">
                    <li>Ask customers to verify their information before submission.</li>
                    <li>Update old records as needed.</li>
                </ul>
            </div>
        </section>

        <!-- Step 2 -->
        <section class="pt-4 flex gap-4 items-start">
            <div>
                <span class="inline-flex items-center justify-center rounded-xl bg-indigo-100 p-2 section-icon"><span class="text-indigo-600 text-2xl font-bold">2</span></span>
            </div>
            <div>
                <h2 class="text-xl font-semibold text-indigo-700 mb-1 flex items-center gap-2">Select Customer &amp; Add Bill</h2>
                <p class="text-gray-700 mb-2">When billing, always select the correct customer from the list. Verify their updated profile to avoid errors and mistaken charges. It's best practice to confirm their contact details before proceeding.</p>
                <ul class="list-disc list-inside text-indigo-500 text-sm pl-2">
                    <li>Check for duplicate customers before creating a new bill.</li>
                    <li>If unsure, verify customer identity with a secondary contact.</li>
                </ul>
            </div>
        </section>

        <!-- Step 3 -->
        <section class="pt-4 flex gap-4 items-start">
            <div>
                <span class="inline-flex items-center justify-center rounded-xl bg-pink-100 p-2 section-icon"><span class="text-pink-600 text-2xl font-bold">3</span></span>
            </div>
            <div>
                <h2 class="text-xl font-semibold text-pink-700 mb-1 flex items-center gap-2">Bill Preview</h2>
                <p class="text-gray-700 mb-2">Preview every bill before finalizing. Make sure all items, quantities, and totals are correct. Mistakes caught here prevent later confusion.</p>
                <ul class="list-disc list-inside text-pink-500 text-sm pl-2">
                    <li>Ask another staff member to cross-check high-value bills.</li>
                    <li>Use the preview feature for a detailed breakdown.</li>
                </ul>
            </div>
        </section>

        <!-- Step 4 -->
        <section class="pt-4 flex gap-4 items-start">
            <div>
                <span class="inline-flex items-center justify-center rounded-xl bg-green-100 p-2 section-icon"><span class="text-green-600 text-2xl font-bold">4</span></span>
            </div>
            <div>
                <h2 class="text-xl font-semibold text-green-700 mb-1 flex items-center gap-2">View Full Bill Details</h2>
                <p class="text-gray-700 mb-2">You can access the full details of any generated bill anytime for transparency and follow-up. Use this for customer queries, audits, and record-keeping.</p>
                <ul class="list-disc list-inside text-green-500 text-sm pl-2">
                    <li>Take notes for bills with special conditions.</li>
                    <li>Respond promptly to any customer inquiries based on these records.</li>
                </ul>
            </div>
        </section>

        <!-- Additional -->
        <section class="pt-4 flex gap-4 items-start">
            <div>
                <span class="inline-flex items-center justify-center rounded-xl bg-orange-100 p-2 section-icon"><span class="text-orange-600 text-xl font-bold">!</span></span>
            </div>
            <div>
                <h2 class="text-xl font-semibold text-orange-700 mb-1 flex items-center gap-2">Best Practices &amp; Security</h2>
                <ul class="list-disc list-inside text-gray-700 text-base space-y-1">
                    <li>Keep your login credentials confidential and never share them.</li>
                    <li>Log out at the end of your shift to safeguard data.</li>
                    <li>Report any system issues or suspicious activity immediately.</li>
                    <li>Be courteous and helpful to all customers—your professionalism matters!</li>
                    <li>Contact support for password resets or troubleshooting.</li>
                </ul>
            </div>
        </section>
    </div>

</div>

</body>
</html>
