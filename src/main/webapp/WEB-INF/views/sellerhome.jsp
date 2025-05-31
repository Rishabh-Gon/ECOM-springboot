<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@page import="com.example.ecom.model.Seller" %>
        <%@page import="com.example.ecom.model.Product" %>
            <%@page import="java.util.List" %>
                <!DOCTYPE html>
                <html>

                <head>
                    <meta charset="UTF-8">
                    <title>Seller Home</title>
                    <link rel="stylesheet" href="css/output.css" />
                </head>

                <% Seller c=(Seller)session.getAttribute("seller"); String sellrname=c.getName(); String
                    sellrperm=c.getPerm(); if(sellrperm.equals("NO")){ %>

                    <body class="bg-white">
                        <h1 class="">Welcome to SwiftMart, <%=sellrname%>
                        </h1>
                        <h2>Your request to do business is being evaluated. Contact with admin.</h2>
                        <form action="Logout" method="post" style="font-size: 15px;">
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
                                        class="bg-gray-600 border shadow px-6 py-3 rounded font-medium">Your
                                        Products</a>
                                    <a href="seller_permission_pending"
                                        class="bg-gray-800 shadow px-6 py-3 rounded hover:bg-gray-700 font-medium">Pending
                                        Permissions</a>
                                    <a href="seller_add_product"
                                        class="bg-gray-800 shadow px-6 py-3 rounded hover:bg-gray-700 font-medium">Add
                                        Product</a>
                                    <form action="Logout" method="post" class="inline-block">
                                        <button type="submit"
                                            class="bg-gray-800 shadow px-6 py-3 rounded hover:bg-gray-700 font-medium">Logout</button>
                                    </form>
                                </div>
                            </section>

                            <!-- Message -->
                            <section class="py-6 px-4 text-center">
                                <h2 class="text-2xl font-bold">Welcome to SwiftMart, <%=sellrname%>!</h2>
                                <p class="text-lg text-gray-700">Here you can manage your products and permissions.</p>
                            </section>

                            <!-- Product Section -->
                            <div class="p-6 rounded-lg">
                                <section
                                    class="products grid grid-cols-2 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-6">
                                    <% List<Product> perm_pd = (List<Product>) request.getAttribute("prod_W_perm");
                                            if (perm_pd.isEmpty()) {
                                            %>
                                            <p class="col-span-full text-center text-lg text-gray-500">No products
                                                pending permission.</p>
                                            <% } else { for (Product x : perm_pd) { int p_id=x.getId(); String
                                                p_name=x.getName(); String p_pd=x.getPd(); Double p_price=x.getPrice();
                                                int p_quant=x.getQuantity(); String path=x.getImgp(); %>
                                                <div
                                                    class="bg-white rounded-xl shadow hover:shadow-lg transition-all duration-300 p-4 flex flex-col items-center text-center">
                                                    <img src="<%=path%>" alt="Product <%=p_name%>"
                                                        class="w-full h-48 object-cover rounded mb-4">
                                                    <h3 class="text-xl font-semibold mb-2">
                                                        <%=p_name%>
                                                    </h3>
                                                    <p class="text-gray-600 mb-1">
                                                        <%=p_pd%>
                                                    </p>
                                                    <p class="text-sm text-gray-500 mb-2">Remaining: <%=p_quant%>
                                                    </p>
                                                    <span class="text-lg font-bold text-green-600 mb-4">₹<%=p_price%>
                                                    </span>
                                                    <form action="slctslrhmprod" method="post" class="w-full">
                                                        <input type="hidden" name="prod_id" value="<%=p_id%>">
                                                        <button type="submit"
                                                            class="w-full bg-blue-500 text-white font-semibold py-2 rounded-md hover:bg-blue-600 transition duration-200">
                                                            Edit Quantity
                                                        </button>
                                                    </form>
                                                </div>
                                                <% } } %>
                                </section>
                            </div>

                            <!-- footer -->
                            <footer class="rounded-lg shadow-sm bg-gray-900 m-4">
                                <div class="w-full max-w-screen-xl mx-auto p-4 md:py-8">
                                    <div class="sm:flex sm:items-center sm:justify-between">
                                        <a href="/sellerhome"
                                            class="flex items-center mb-4 sm:mb-0 space-x-3 rtl:space-x-reverse">
                                            <img src="images/SwiftMart.png" class="h-12 rounded-xl"
                                                alt="SwiftMart Logo" />
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
                            <script>
                                setInterval(function () {
                                    location.reload();
                                }, 3000);
                            </script>
                        </body>
                        <% } %>

                </html>