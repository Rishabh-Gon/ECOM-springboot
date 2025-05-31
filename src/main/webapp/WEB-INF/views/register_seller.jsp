<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>Register Seller</title>
        <link rel="stylesheet" href="css/output.css" />
    </head>

    <body class="bg-gray-900 min-h-screen flex items-center justify-center px-4 py-10">

        <div class="max-w-lg bg-gray-200 shadow-xl rounded-xl p-6 space-y-6" style="width: 50vw;">

            <!-- Header -->
            <div class="text-center">
                <img src="/images/SwiftMart.png" alt="SwiftMart Logo" class="mx-auto shadow"
                    style="height: 80px; border-radius: 25%;" />
                <h2 class="text-2xl font-bold text-blue-700 mt-3">Be an Authorized Seller</h2>
                <p class="text-sm text-gray-500">Register to start selling on SwiftMart</p>
                <a href="seller_login" class="text-sm text-blue-600 hover:underline inline-block mt-2">
                    ← Return to Seller Login Page
                </a>
            </div>

            <!-- Registration Form -->
            <form action="RegisterSeller" method="post" enctype="multipart/form-data" class="space-y-5">

                <!-- Document Upload -->
                <div>
                    <label for="pdfFile" class="block text-sm font-medium text-gray-700 mb-1">Upload Business Document
                        (PDF)</label>
                    <input type="file" name="pdfFile" accept="application/pdf" required
                        class="block p-2 w-full text-sm text-gray-600 bg-gray-100 border border-gray-300 rounded-lg cursor-pointer shadow file:mr-4 file:py-2 file:px-4 file:rounded file:border-0 file:text-sm file:bg-blue-600 file:text-white hover:file:bg-blue-700 transition" />
                </div>

                <!-- Name -->
                <div>
                    <label for="seller_name" class="block text-sm font-medium text-gray-700 mb-1">Full Name</label>
                    <input type="text" id="seller_name" name="seller_name" placeholder="Enter your name" required
                        class="w-full px-4 py-2 border bg-gray-100 border-gray-300 rounded-lg shadow focus:outline-none focus:ring-2 focus:ring-blue-500 transition" />
                </div>

                <!-- Email -->
                <div>
                    <label for="seller_mail" class="block text-sm font-medium text-gray-700 mb-1">Email Address</label>
                    <input type="email" id="seller_mail" name="seller_mail" placeholder="xyz@gmail.com" required
                        class="w-full px-4 py-2 border bg-gray-100 border-gray-300 rounded-lg shadow focus:outline-none focus:ring-2 focus:ring-blue-500 transition" />
                </div>

                <!-- Password -->
                <div>
                    <label for="seller_password" class="block text-sm font-medium text-gray-700 mb-1">Password</label>
                    <input type="password" id="seller_password" name="seller_password" placeholder="Enter password"
                        required
                        class="w-full px-4 py-2 bg-gray-100 border border-gray-300 rounded-lg shadow focus:outline-none focus:ring-2 focus:ring-blue-500 transition" />
                </div>

                <!-- Confirm Password -->
                <div>
                    <label for="seller_re_password" class="block text-sm font-medium text-gray-700 mb-1">Confirm
                        Password</label>
                    <input type="password" id="seller_re_password" name="seller_re_password"
                        placeholder="Re-type password" required
                        class="w-full px-4 py-2 bg-gray-100 border border-gray-300 rounded-lg shadow focus:outline-none focus:ring-2 focus:ring-blue-500 transition" />
                </div>

                <!-- Server-Side Messages -->
                <% String getm=String.valueOf(request.getAttribute("msg")); String showMessage="" ; if (getm !=null) {
                    if (getm.equals("success")) { %>
                    <p class="text-green-600 font-medium text-center">
                        Registration successful. <a href="seller_login" class="text-blue-600 underline">Login</a>
                    </p>
                    <% } else { if(getm.equals("pfail")) { showMessage="Passwords do not match." ; }
                        if(getm.equals("tfail")) { showMessage="File upload failed. Please try again." ; }
                        if(getm.equals("emfail")) { showMessage="Invalid email address." ; } if(getm.equals("mxstfail"))
                        { showMessage="Email already registered. Please login." ; } %>
                        <p class="text-red-600 font-medium text-center">
                            <%= showMessage %>
                        </p>
                        <% } } %>

                            <!-- Submit Button -->
                            <button type="submit"
                                class="w-full bg-blue-600 hover:bg-blue-700 text-white font-semibold py-2 rounded-lg transition duration-300">
                                Register
                            </button>
            </form>
        </div>
    </body>


    </html>