<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.example.ecom.model.Seller"%>
<%@page import="com.example.ecom.model.Product"%>
<%@page import="com.example.ecom.model.Customer"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Customer Home</title>
    </head>    
    <%
    Customer c=(Customer)session.getAttribute("customer");
    int custid=c.getId();
    String custname=c.getName();
    %>
    <body style="background-image: url(images/shop.jpg)">         
        <div style="display: flex; justify-content: center; align-items: center; font-size: 32px; 
            border-top-left-radius: 20px; background-color: white; flex-direction: column; 
            border-top-right-radius: 20px; margin-left: auto; margin-right: auto; margin-bottom: auto; width: 910px">
            <h1>Welcome <%=custname%></h1>
        </div>
        <div style="display: flex; justify-content: center; align-items: center; font-size: 22px; 
             background-color: white; flex-direction: column; 
             margin-left: auto; margin-right: auto; margin-bottom: auto; width: 910px">
            <table style="margin-right: auto; margin-top: auto; border-spacing: 0px">
            <tr>
            <th style="justify-content: center; text-align: justify; padding: 5px; background-color: black; 
                border-top-left-radius: 20px; border-top-right-radius: 20px;">
                <a href="customerhome"style="color: yellow; text-decoration: none;">
                    <b>Products</b>                    
                </a>
            </th>
            <th style="justify-content: center;text-align: justify;padding: 5px; background-color: #c0c0c0; 
                border-top-left-radius: 20px; border-top-right-radius: 20px; border: 1px solid black">
                <a href="custcart" style="color: black; text-decoration: none;">
                <b>Cart</b>
                </a>
            </th>
            <th style="justify-content: center;text-align: justify;padding: 5px; background-color: #c0c0c0; 
                border-top-left-radius: 20px; border-top-right-radius: 20px; border: 1px solid black">
                <a href="custordrhist" style="color: black; text-decoration: none;">
                <b>Order History</b>
                </a>
            </th>
            <th style="justify-content: center;text-align: justify;padding: 5px; background-color: #c0c0c0; 
                border-top-left-radius: 20px; border-top-right-radius: 20px; border: 1px solid black">
                <a href="logout_customer" style="color: black; text-decoration: none;">
                <b>Logout</b>
                </a>
            </th>
            </tr>
            </table>
            <div style="margin-bottom: auto; justify-content: center;text-align: justify;padding: 5px;
                 background-color: black; color: yellow; width: 900px ">
                <%
                    List<Product> perm_p=(List<Product>)request.getAttribute("prod_y_perm");
                    if(perm_p.isEmpty()){
                %>
                    No objects present now
                <%
                    }else{
                %>
                <table style="border: 2px solid yellow; font-size: 48 px; border-radius: 5px; border-color: yellow; 
                             background-color: black; color:yellow; justify-content: center; text-align: center">
                    <tr>
                    <th style="background-color: yellow; color: black">PRODUCT</th>
                    <th style="background-color: yellow; color: black">PRICE</th>
                    <th style="background-color: yellow; color: black">PRODUCT DESCRIPTION</th>
                    <th style="background-color: yellow; color: black">SELLER</th>
                    <th style="background-color: yellow; color: black">AVL. QTY</th>
                    <th style="background-color: yellow; color: black">Add to Cart</th>
                    <th style="background-color: yellow; color: black">BUY</th>
                    </tr>
                <%
                    for(Product x: perm_p) {
                        int pd=x.getId();
                        int sd=x.getSeller().getId();
                        String p_name=x.getName();
                        String p_pd=x.getPd();
                        Double p_price=x.getPrice();
                        int qty=x.getQuantity();
                        String s_name=x.getSeller().getName();
                %>     
                <tr>
                    <td><%=p_name%></td>
                    <td><%=p_price%></td>
                    <td><%=p_pd%></td>
                    <td><%=s_name%></td>
                    <td><%=qty%></td>
                    <td>
                        <form action="Addcart" method="post" style="font-size: 15px;">   
                            <div style="align-items: center">
                                <input type="hidden" name="product_id" value="<%=pd%>">
                                <button type="submit" style="width: 100px; padding: 10px;
                                 background: yellow; color: black; border: none; border-radius: 5px;">
                                    <b>Add to Cart</b>
                                </button>                                           
                            </div>
                        </form>
                    </td>
                    <%
                    	if(qty>0){
                    %>
                    <td>
                        <form action="Buynowsingle" method="post" style="font-size: 15px;">   
                            <div style="align-items: center">
                                <input type="hidden" name="product_id" value="<%=pd%>">
                                <button type="submit" style="width: 100px; padding: 10px; 
                                background: yellow; color: black; border: none; border-radius: 5px;">
                                    <b>Buy Now</b>
                                </button>                                           
                            </div>
                        </form>
                    </td>
                    <%
                    	}
                    %>
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