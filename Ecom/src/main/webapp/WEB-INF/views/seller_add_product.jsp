<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.example.ecom.model.Seller"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Seller Add Product</title>
    </head>
    <%
        Seller c=(Seller)session.getAttribute("seller");
        int seller_id=c.getId();
        String sellrname=c.getName();
        String sellrperm=c.getPerm();
        if(sellrperm.equals("NO")){
        %>
        <body>  
        <h1>Welcome to SwiftMart, <%=sellrname%></h1>
        <h2>Your request to do business is being evaluated. Contact with admin.</h2>
        <form action="Logout" method="post" style="font-size: 15px;">   
            <div style="align-items: center; margin-left: 250px">                       
                <button type="submit" style="padding: 10px; background: yellow; color: black;
                        border: none; border-radius: 5px;"><b>Logout</b></button><br>                                           
            </div>
        </form>
        </body>
        <%
        }else{
        %>
        <body style="background-image: url(images/shop.jpg)">
        <div style="display: inline-block; justify-content: center; text-align: center; 
            border-top-left-radius: 20px; background-color: white; flex-direction: column; 
            border-top-right-radius: 20px; margin-left: auto; margin-right: auto; margin-bottom: auto; width: 1214px;">
            <h2>Welcome to SwiftMart, <%=sellrname%></h2>
        </div>
        <div style="display: inline-block; justify-content: center; align-items: center; font-size: 22px; 
             background-color: white; flex-direction: column; 
             margin-left: auto; margin-right: auto; margin-bottom: auto; width: 1214px">
            <table style="margin-right: auto; margin-top: auto; border-spacing: 0px">
            <tr>
            <th style="justify-content: center; text-align: justify; padding: 5px; background-color: #c0c0c0; 
                border-top-left-radius: 20px; border-top-right-radius: 20px; border: 1px solid black">
                <a href="sellerhome"style="color: black; text-decoration: none;">
                    <b>Products You sell</b>                    
                </a>
            </th>
            <th style="justify-content: center;text-align: justify;padding: 5px; background-color: #c0c0c0; 
                border-top-left-radius: 20px; border-top-right-radius: 20px; border: 1px solid black">
                <a href="seller_permission_pending" style="color:black; text-decoration: none;">
                <b>Products Pending permission</b>
                </a>
            </th>
            <th style="justify-content: center;text-align: justify;padding: 5px; background-color: black; 
                border-top-left-radius: 20px; border-top-right-radius: 20px;">
                <a href="seller_add_product" style="color: yellow; text-decoration: none;">
                <b>Add product</b>
                </a>
            </th>
            <th style="justify-content: center;text-align: justify;padding: 5px; background-color: #c0c0c0; 
                border-top-left-radius: 20px; border-top-right-radius: 20px; border: 1px solid black">
                <a href="logout_seller" style="color: black; text-decoration: none;">
                <b>Logout</b>
                </a>
            </th>
            </tr>
            </table>
            <div style="margin-bottom: auto; justify-content: center; padding: 5px;
                 background-color: black; color: yellow; width: 1204px ">
				<form action="RegisterProduct" method="post" enctype="multipart/form-data" style="font-size: 15px;"> 
                    <div style="align-items: center; margin-left: 250px">
                        <br>
					    Product Image<br>
					    <input type="file" name="product_image" accept="image/*" required 
					           style="width: 200px; padding: 10px; margin: 10px 0;"><br>
                        Product Name<br>
                        <input type="text" name="prod_name" placeholder="Product Name" required 
                        style="width: 200px; padding: 10px; margin: 10px 0; border: 1px solid #ccc; border-radius: 5px;"><br>
                        Product Price(in Rs.)<br>
                        <input type="text" name="product_price" placeholder="100.00 (enter price of your product)" required 
                        style="width: 200px; padding: 10px; margin: 10px 0; border: 1px solid #ccc; border-radius: 5px;"><br>
                        Product Description<br>
                        <textarea placeholder="Describe your product&#10;in 300-500 characters" 
                                  style="width: 200px;" name="product_pd"></textarea><br>
                        Product Quantity(in whole numbers)<br>
                        <input type="text" name="prod_quant" placeholder="minimum 1" required 
                        style="width: 200px; padding: 10px; margin: 10px 0; border: 1px solid #ccc; border-radius: 5px;"><br>
                        <button type="submit" style="width: 200px; padding: 10px; background: yellow; color: black;
                        border: none; border-radius: 5px;">Submit</button><br>
                        
                        <%
                            String getm=String.valueOf(request.getAttribute("addProdmsg"));                            
                            if(getm.equals("Added"))
                            {                                
                        %>
                            <p> 
                             Added the new product   
                            </p>
                        <%
                                }
                                else if(getm.equals("null")){}
                                else{
                        %>
                            <p style="font-family: Arial, sans-serif; color: red; font-size: 16px;"> 
                                <%= getm %>
                            </p>
                        <%                                
                            }
                        %>
                        
                        
                    </div>
                    </form>
            </div>
        </div>
        </body>
        <%
        }
        %>
</html>
