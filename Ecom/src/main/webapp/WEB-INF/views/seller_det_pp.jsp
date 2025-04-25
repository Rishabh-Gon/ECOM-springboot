<%@page import="com.example.ecom.model.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.example.ecom.model.Seller"%>
<%@page import="com.example.ecom.model.Admin"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Seller Details</title>
    </head>
    	<%
    	Admin admi=(Admin)session.getAttribute("admin");
    	String retpage=(String)session.getAttribute("page");
    	Seller s=(Seller)session.getAttribute("sellerinfo");
    	List<Product> plist=(List<Product>)request.getAttribute("nonpermprodfsid");
    	%>
        <body style="background-image: url(images/shop.jpg)">         
        <div style="display: flex; justify-content: center; align-items: center; font-size: 32px; 
            border-top-left-radius: 20px; background-color: white; flex-direction: column; 
            border-top-right-radius: 20px; margin-left: auto; margin-right: auto; margin-bottom: auto; width: 950px">
            <h1>Welcome Admin <%=admi.getUsername() %></h1>
        </div>
       <div style="display: flex; align-items: left; font-size: 15px; 
             background-color: white; flex-direction: column; margin-left: auto; margin-right: auto; margin-bottom: auto; width: 950px">
            <table style="border: 2px solid black; ; border-radius: 5px; justify-content: center; text-align: center">
                   <tr>
           				<td style="border: 1px solid black">Seller ID</td>
           				<td style="border: 1px solid black"><%=s.getId() %></td>
           				<td style="border: 1px solid black">Seller name</td>
           				<td style="border: 1px solid black"><%=s.getName() %></td>
           				<td style="border: 1px solid black">Seller mail</td>
           				<td style="border: 1px solid black"><%=s.getEmail()%></td>
           				<td style="border: 1px solid black">Permission</td>
           				<td style="border: 1px solid black"><%=s.getPerm().equals("NO")?"Not Allowed":"Allowed" %></td>
         			</tr>
            </table>
        </div>
        <div style="display: flex; justify-content: center; align-items: center; font-size: 22px; 
             background-color: white; flex-direction: column; 
             margin-left: auto; margin-right: auto; margin-bottom: auto; width: 950px">
            <table style="margin-right: auto; margin-top: auto; border-spacing: 0px">
            <tr>
            <th style="justify-content: center; text-align: justify; padding: 5px; background-color: cyan; 
                border-top-left-radius: 20px; border-top-right-radius: 20px; border: 1px solid black">
                <a href="<%=retpage%>"style="color: black; text-decoration: none;">
                    <b><=</b>                    
                </a>
            </th>
            <th style="justify-content: center;text-align: justify;padding: 5px; background-color: #c0c0c0; 
                border-top-left-radius: 20px; border-top-right-radius: 20px; border: 1px solid black">
                <a href="seller_det_sp" style="color: blak; text-decoration: none;">
                <b>Selling Products</b>
                </a>
            </th>
            <th style="justify-content: center;text-align: justify;padding: 5px; background-color: black; 
                border-top-left-radius: 20px; border-top-right-radius: 20px; border: 1px solid black">
                <a href="seller_det_pp" style="color: yellow; text-decoration: none;">
                <b>Pending Permission</b>
                </a>
            </th>
            </tr>
            </table>
            <div style="margin-bottom: auto; justify-content: center;text-align: justify;padding: 5px;
                 background-color: black; color: yellow; width: 940px ">
                <%
                    if(plist.isEmpty()){
                %>
                    No objects present now
                <%
                    }else{
                %>
                <table style="border: 2px solid yellow; font-size: 48 px; border-radius: 5px; border-color: yellow; 
                             background-color: black; text-align: center; color:yellow; justify-content: center;">
                    <tr>
                    <th style="background-color: yellow; color: black">PRODUCT ID</th>
                    <th style="background-color: yellow; color: black">PRODUCT NAME</th>
                    <th style="background-color: yellow; color: black">PRODUCT PRICE</th>
                    <th style="background-color: yellow; color: black">PRODUCT DESCRIPTION</th>
                    <th style="background-color: yellow; color: black">PRODUCT QUANTITY</th>
                    <th style="background-color: yellow; color: black">PERMISSION</th>
                    </tr>
                <%
                    for(Product x: plist) {
                        String p_name=x.getName();
                        String p_id=String.valueOf(x.getId());
                        String p_price=String.valueOf(x.getPrice());
                        String p_qty=String.valueOf(x.getQuantity());                        
                        String p_pd=x.getPd();
                %>     
                            <tr>
                                <td><%=p_id%></td>
                                <td><%=p_name%></td>
                                <td><%=p_price%></td>
                                <td><%=p_pd%></td>
                                <td><%=p_qty%></td>                             
                                <td>
                                    <form action="Giveprodperm" method="post" style="font-size: 15px;">   
                                        <div style="align-items: center">                                            
                                            <input type="hidden" name="prodid" value="<%=p_id%>">
                                            <button type="submit"                                         
                                                    style="padding: 10px; background: yellow; color: black;
                                                    border: none; border-radius: 5px;">
                                                <b>Give permission</b>
                                            </button>                                           
                                        </div>
                                    </form>
                                </td>
                            </tr>        
                <%
                        }
                    }
                %>
                </table>
            </div>
        </div>
        </body>    
</html>