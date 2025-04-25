<%@page import="com.example.ecom.model.Orderhist"%>
<%@page import="com.example.ecom.model.Orderprod"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.example.ecom.model.Seller"%>
<%@page import="com.example.ecom.model.Product"%>
<%@page import="com.example.ecom.model.Customer"%>
<%@page import="com.example.ecom.model.Orderprod"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Customer Cart</title>
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
            <th style="justify-content: center; text-align: justify; padding: 5px; background-color: #c0c0c0; 
                border-top-left-radius: 20px; border-top-right-radius: 20px;">
                <a href="customerhome"style="color: black; text-decoration: none;">
                    <b>Products</b>                    
                </a>
            </th>
            <th style="justify-content: center;text-align: justify;padding: 5px; background-color: #c0c0c0; 
                border-top-left-radius: 20px; border-top-right-radius: 20px; border: 1px solid black">
                <a href="custcart" style="color: black; text-decoration: none;">
                <b>Cart</b>
                </a>
            </th>
            <th style="justify-content: center;text-align: justify;padding: 5px; background-color: black; 
                border-top-left-radius: 20px; border-top-right-radius: 20px; border: 1px solid black">
                <a href="custordrhist" style="color: yellow; text-decoration: none;">
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
                    List<Orderhist> op=(List<Orderhist>)request.getAttribute("ordhist");
                    if(op.isEmpty()){
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
                    <th style="background-color: yellow; color: black">DESCRIPTION</th>
                    <th style="background-color: yellow; color: black">SELLER</th>
                    <th style="background-color: yellow; color: black">QTY</th>
                    <th style="background-color: yellow; color: black">COST</th>
                    <th style="background-color: yellow; color: black">DATE & TIME</th>                    
                    </tr>
                <%
                    for(Orderhist x: op) {
                    	int oid=x.getId();
                        String p_name=x.getProductname();
                        String p_pd=x.getProductdesc();
                        Double p_price=x.getProductprice();
                        int bqty=x.getBqty();                        
                        String s_name=x.getSellername();
                        Double cost=p_price*bqty;
                        String dt=x.getDatetime();
                        Double taken=x.getTaken();
                        Double ref=x.getRefunded();
                %>     
                <tr>
                    <td><%=p_name%></td>
                    <td><%=p_price%></td>
                    <td><%=p_pd%></td>
                    <td><%=s_name%></td>
                    <td><%=bqty%></td>
                    <td><%=cost%></td>
                    <td><%=dt%></td>
                    <%
                    	if(ref>0){
                	%>
                	<td>Refunded</td>
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