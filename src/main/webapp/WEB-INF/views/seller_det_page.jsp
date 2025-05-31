<%@page import="com.example.ecom.model.Product" %>
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
        <%@page import="com.example.ecom.model.Seller" %>
            <%@page import="com.example.ecom.model.Admin" %>
                <%@page import="java.util.List" %>
                    <!DOCTYPE html>
                    <html>

                    <head>
                        <meta charset="UTF-8">
                        <title>Seller Details</title>
                    </head>
                    <% Admin admi=(Admin)session.getAttribute("admin"); String
                        retpage=(String)session.getAttribute("page"); Seller
                        s=(Seller)session.getAttribute("sellerinfo"); %>

                        <body style="background-image: url(images/shop.jpg)">
                            <div style="display: inline-block; justify-content: center; text-align: center; 
            border-top-left-radius: 20px; background-color: white; flex-direction: column; 
            border-top-right-radius: 20px; margin-left: auto; margin-right: auto; margin-bottom: auto; width: 1214px;">
                                <h2>Welcome to SwiftMart, Admin <%=admi.getUsername()%>
                                </h2>
                            </div>
                            <div style="display: inline-block; justify-content: center; align-items: center; font-size: 22px; 
             background-color: white; flex-direction: column; 
             margin-left: auto; margin-right: auto; margin-bottom: auto; width: 1214px">
                                <table style="margin-right: auto; margin-top: auto; border-spacing: 0px">
                                    <tr>
                                        <th style="justify-content: center; text-align: justify; padding: 5px; background-color: cyan; 
                border-top-left-radius: 20px; border-top-right-radius: 20px; border: 1px solid black">
                                            <a href="<%=retpage%>" style="color: black; text-decoration: none;">
                                                <b>
                                                    <=< /b>
                                            </a>
                                        </th>
                                        <th style="justify-content: center;text-align: justify;padding: 5px; background-color: #c0c0c0; 
                border-top-left-radius: 20px; border-top-right-radius: 20px; border: 1px solid black">
                                            <a href="seller_det_sp" style="color: blak; text-decoration: none;">
                                                <b>Selling Products</b>
                                            </a>
                                        </th>
                                        <th style="justify-content: center;text-align: justify;padding: 5px; background-color: #c0c0c0; 
                border-top-left-radius: 20px; border-top-right-radius: 20px; border: 1px solid black">
                                            <a href="seller_det_pp" style="color: black; text-decoration: none;">
                                                <b>Pending Permission</b>
                                            </a>
                                        </th>
                                        <th style="justify-content: center;text-align: justify;padding: 5px; background-color: black; 
                border-top-left-radius: 20px; border-top-right-radius: 20px; border: 1px solid black">
                                            <a href="seller_det_page" style="color: yellow; text-decoration: none;">
                                                <b>Details</b>
                                            </a>
                                        </th>
                                    </tr>
                                </table>
                                <div style="margin-bottom: auto; justify-content: center;text-align: justify;padding: 5px;
                 background-color: black; color: yellow; width: 1204px ">
                                    <br>Seller Name: <%=s.getName()%><br>
                                        <br>Seller Email: <%=s.getEmail()%><br>
                                            <br>Seller ID: <%=s.getId()%><br>
                                                <br>Seller Permission: <%=s.getPerm()%><br>
                                                    <br>Seller Documents<br>
                                                    <a href="<%=s.getDocs()%>" target="_blank">View PDF</a>
                                </div>
                            </div>
                        </body>

                    </html>