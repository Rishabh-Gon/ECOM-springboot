<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>Seller Login</title>
        <link rel="stylesheet" href="css/output.css" />
    </head>

    <body class="bg-gray-900 min-h-screen flex items-center justify-center px-4">

        <div class="max-w-md bg-gray-200 rounded-xl shadow-xl p-6 space-y-6" style="width: 50vw;">

            <!-- Brand Heading -->
            <div class="text-center">
                <img src="/images/SwiftMart.png" alt="SwiftMart Logo" class="mx-auto shadow-xl"
                    style="height: 80px; border-radius: 25%;" />
                <h1 class="text-3xl font-bold text-blue-700 mt-3">Login as Seller</h1>
                <p class="text-sm text-gray-500 mt-1">Your trusted seller login platform</p>
                <a href="/" class="text-sm text-blue-600 hover:underline mt-2 inline-block">← Return to Home Page</a>
            </div>

            <!-- Seller Login Form -->
            <form action="LoginSeller" method="post" class="space-y-5">
                <!-- Email Field -->
                <div>
                    <label for="seller_mail" class="block text-sm font-medium text-gray-700 mb-1">Email Address</label>
                    <input type="email" id="seller_mail" name="seller_mail" placeholder="Enter your email" required
                        class="w-full px-4 py-2 bg-gray-100 shadow border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500 transition">
                </div>

                <!-- Password Field -->
                <div>
                    <label for="seller_password" class="block text-sm font-medium text-gray-700 mb-1">Password</label>
                    <input type="password" id="seller_password" name="seller_password" placeholder="•••••••••"
                        required
                        class="w-full px-4 py-2 bg-gray-100 shadow border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500 transition">
                </div>



                <!-- Error Message -->
                <% String getm=String.valueOf(request.getAttribute("msg")); String showMessage="" ; if(getm!=null){
                    if(getm.equals("slfail")){ showMessage="Wrong credentials. Please try again!" ; %>
                    <p class="text-center text-sm text-red-600 font-medium">
                        <%= showMessage %>
                    </p>
                    <% } }%>

                        <!-- Login Button -->
                        <div>
                            <button type="submit"
                                class="w-full bg-blue-600 hover:bg-blue-700 text-white font-semibold py-2 rounded-lg transition duration-300">
                                Login
                            </button>
                        </div>
            </form>

            <!-- Registration Prompt -->
            <p class="text-center text-sm text-gray-600">
                Don't have a seller account?
                <a href="register_seller" class="text-blue-600 hover:underline font-medium">Register Here</a>
            </p>
        </div>

    </body>


    </html>