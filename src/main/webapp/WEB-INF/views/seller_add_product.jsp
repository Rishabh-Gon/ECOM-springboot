<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@page import="com.example.ecom.model.Seller" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <title>Seller Add Product</title>
            <link rel="stylesheet" href="/css/output.css" />
        </head>
        <% Seller c=(Seller)session.getAttribute("seller"); int seller_id=c.getId(); String sellrname=c.getName();
            String sellrperm=c.getPerm(); if(sellrperm.equals("NO")){ %>

            <body>


                <h1>Welcome to SwiftMart, <%=sellrname%>
                </h1>
                <h2>Your request to do business is being evaluated. Contact with admin.</h2>
                <form action="Logout" method="post" class="">
                    <div class="">
                        <button type="submit" class=""><b>Logout</b></button><br>
                    </div>
                </form>

            </body>
            <% }else{ %>

                <body class="bg-sky-200 text-gray-800 min-h-screen flex flex-col justify-between">

                    <!-- navbar -->
                    <section class="bg-gray-900 text-gray-100 px-4">
                        <a href="/sellerhome" class="flex m-4 items-center space-x-3 rtl:space-x-reverse">
                            <img src="/images/SwiftMart.png" class="h-14 rounded-xl" alt="SwiftMart Logo" />
                            <span
                                class="self-center text-2xl font-semibold whitespace-nowrap text-white">SwiftMart™</span>
                        </a>

                        <div class="flex flex-wrap justify-center gap-4 mb-6">
                            <a href="sellerhome"
                                class="bg-gray-800 shadow px-6 py-3 rounded hover:bg-gray-100 dark:hover:bg-gray-700 font-medium">Your
                                Products</a>
                            <a href="seller_permission_pending"
                                class="bg-gray-800 shadow px-6 py-3 rounded hover:bg-gray-100 dark:hover:bg-gray-700 font-medium">Pending
                                Permissions</a>
                            <a href="seller_add_product"
                                class="bg-gray-600 border shadow px-6 py-3 rounded font-medium">Add
                                Product</a>
                            <form action="Logout" method="post" class="inline-block">
                                <button type="submit"
                                    class="bg-gray-800 shadow px-6 py-3 rounded hover:bg-gray-700 font-medium">Logout</button>
                            </form>
                        </div>
                    </section>


                    <!-- Message -->
                    <section class="py-6 px-4 text-center">
                        <h2 class="text-2xl font-bold">Add Your Product</h2>
                    </section>



                    <!-- Product Registration Form -->
                    <section class="px-4">
                        <div class="max-w-xl mx-auto bg-gray-200 p-6 rounded-lg shadow-lg">
                            <form action="RegisterProduct" method="post" enctype="multipart/form-data"
                                class="space-y-5">
                                <div>
                                    <label class="block font-medium mb-1">Upload Product Image</label>
                                    <input type="file" name="product_image" accept="image/*" required
                                        class="block w-full text-sm border border-gray-300 dark:border-gray-600 rounded-md p-2">
                                </div>
                                <div>
                                    <label class="block font-medium mb-1">Product Name</label>
                                    <input type="text" name="prod_name" placeholder="Product Name" required
                                        class="w-full border border-gray-300 dark:border-gray-600 rounded-md p-2">
                                </div>
                                <div>
                                    <label class="block font-medium mb-1">Product Price (in Rs.)</label>
                                    <input type="text" name="product_price" placeholder="100.00" required
                                        class="w-full border border-gray-300 dark:border-gray-600 rounded-md p-2">
                                </div>
                                <div>
                                    <label class="block font-medium mb-1">Product Description</label>
                                    <textarea name="product_pd"
                                        placeholder="Describe your product in 300-500 characters" rows="4" required
                                        class="w-full border border-gray-300 dark:border-gray-600 rounded-md p-2"></textarea>
                                </div>
                                <div>
                                    <label class="block font-medium mb-1">Product Quantity</label>
                                    <input type="text" name="prod_quant" placeholder="Minimum 1" required
                                        class="w-full border border-gray-300 dark:border-gray-600 rounded-md p-2">
                                </div>
                                <button type="submit"
                                    class="bg-blue-600 text-white px-6 py-2 rounded-md hover:bg-blue-700 transition">Submit</button>

                                <% String getm=String.valueOf(request.getAttribute("addProdmsg"));
                                    if(getm.equals("Added")) { %>
                                    <p class="text-green-600 font-medium">Added the new product</p>
                                    <% } else if(!getm.equals("null")) { %>
                                        <p class="text-red-600 font-medium">
                                            <%= getm %>
                                        </p>
                                        <% } %>
                            </form>
                        </div>
                    </section>

                    <!-- footer -->
                    <footer class="rounded-lg shadow-sm bg-gray-900 m-4">
                        <div class="w-full max-w-screen-xl mx-auto p-4 md:py-8">
                            <div class="sm:flex sm:items-center sm:justify-between">
                                <a href="/sellerhome"
                                    class="flex items-center mb-4 sm:mb-0 space-x-3 rtl:space-x-reverse">
                                    <img src="images/SwiftMart.png" class="h-12 rounded-xl" alt="SwiftMart Logo" />
                                    <span
                                        class="self-center text-2xl font-semibold whitespace-nowrap text-white">SwiftMart™</span>
                                </a>
                                <ul
                                    class="flex flex-wrap items-center mb-6 text-sm font-medium text-gray-500 sm:mb-0 dark:text-gray-400">
                                    <li>
                                        <a href="#" class="hover:underline me-4 md:me-6">About</a>
                                    </li>
                                    <li>
                                        <a href="#" class="hover:underline me-4 md:me-6">Privacy Policy</a>
                                    </li>
                                    <li>
                                        <a href="#" class="hover:underline me-4 md:me-6">Licensing</a>
                                    </li>
                                    <li>
                                        <a href="#" class="hover:underline">Contact</a>
                                    </li>
                                </ul>
                            </div>
                            <hr class="my-6 border-gray-200 sm:mx-auto dark:border-gray-700 lg:my-8" />
                            <span class="block text-sm text-gray-500 sm:text-center dark:text-gray-400">© 2023
                                <a href="https://flowbite.com/" class="hover:underline">SwiftMart™</a>. All
                                Rights Reserved.</span>
                        </div>
                    </footer>
                </body>
                <% } %>

        </html>