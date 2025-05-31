<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>Register Customer</title>
        <link rel="stylesheet" href="css/output.css" />
    </head>

    <body class="bg-gray-900 min-h-screen flex items-center justify-center px-4">
        <div class="max-w-md bg-gray-200 rounded-xl shadow-xl p-6 space-y-6 w-full" style="width: 50vw;">

            <!-- Header Section -->
            <div class="text-center">
                <img src="/images/SwiftMart.png" alt="SwiftMart Logo" class="mx-auto shadow-xl"
                    style="height: 80px; border-radius: 25%;" />
                <h1 class="text-3xl font-bold text-blue-700 mt-3">Register as Customer</h1>
                <p class="text-sm text-gray-500 mt-1">Create your customer account and start shopping</p>
                <a href="customer_login" class="text-sm text-blue-600 hover:underline mt-2 inline-block">← Return to
                    Customer Login Page</a>
            </div>

            <!-- Registration Form -->
            <form action="RegisterCustomer" method="post" class="space-y-5">
                <!-- Name Field -->
                <div>
                    <label for="cust_name" class="block text-sm font-medium text-gray-700 mb-1">Name</label>
                    <input type="text" id="cust_name" name="cust_name" placeholder="Your Name" required
                        class="w-full px-4 py-2 bg-gray-100 shadow border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500 transition">
                </div>

                <!-- Email Field -->
                <div>
                    <label for="cust_mail" class="block text-sm font-medium text-gray-700 mb-1">Email Address</label>
                    <input type="email" id="cust_mail" name="cust_mail" placeholder="xyz@gmail.com" required
                        class="w-full px-4 py-2 bg-gray-100 shadow border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500 transition">
                </div>

                <!-- Password Field -->
                <div>
                    <label for="cust_password" class="block text-sm font-medium text-gray-700 mb-1">Password</label>
                    <input type="password" id="cust_password" name="cust_password" placeholder="Password" required
                        class="w-full px-4 py-2 bg-gray-100 shadow border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500 transition">
                </div>

                <!-- Confirm Password Field -->
                <div>
                    <label for="cust_re_password" class="block text-sm font-medium text-gray-700 mb-1">Confirm
                        Password</label>
                    <input type="password" id="cust_re_password" name="cust_re_password" placeholder="Re-type Password"
                        required
                        class="w-full px-4 py-2 bg-gray-100 shadow border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500 transition">
                </div>

                <!-- Feedback Messages -->
                <% String getm=String.valueOf(request.getAttribute("msg")); if (getm !=null) { if
                    (getm.equals("success")) { %>
                    <p class="text-green-600 text-sm text-center font-medium">
                        Registration Successful. Click here to
                        <a href="customer_login" class="text-blue-600 hover:underline">Login</a>
                    </p>
                    <% } else { String showMessage="" ; if (getm.equals("pfail")) { showMessage="Passwords don't match."
                        ; } else if (getm.equals("emfail")) { showMessage="Invalid email." ; } else if
                        (getm.equals("mxstfail")) {
                        showMessage="Email is already registered with a customer account. Please login." ; } %>
                        <p class="text-red-600 text-sm text-center font-medium">
                            <%= showMessage %>
                        </p>
                        <% } } %>

                            <!-- Submit Button -->
                            <div>
                                <button type="submit"
                                    class="w-full bg-blue-600 hover:bg-blue-700 text-white font-semibold py-2 rounded-lg transition duration-300">
                                    Submit
                                </button>
                            </div>
            </form>
        </div>
    </body>


    </html>