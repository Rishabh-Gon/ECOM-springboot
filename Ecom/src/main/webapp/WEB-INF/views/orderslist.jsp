<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.example.ecom.model.Admin"%>
<%@page import="com.example.ecom.model.Orderhist"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Customers List</title>
    </head>
        <%
    		Admin admi=(Admin)session.getAttribute("admin");
    	%>
        <body style="background-image: url(images/shop.jpg)">         
        <div style="display: flex; justify-content: center; align-items: center; font-size: 32px; 
            border-top-left-radius: 20px; background-color: white; flex-direction: column; 
            border-top-right-radius: 20px; margin-left: auto; margin-right: auto; margin-bottom: auto; width: 950px">
            <h1>Welcome Admin <%=admi.getUsername() %></h1>
        </div>
        <div style="display: flex; justify-content: center; align-items: center; font-size: 22px; 
             background-color: white; flex-direction: column; 
             margin-left: auto; margin-right: auto; margin-bottom: auto; width: 950px">
            <table style="margin-right: auto; margin-top: auto; border-spacing: 0px">
            <tr>
            <th style="justify-content: center; text-align: justify; padding: 5px; background-color: #c0c0c0; 
                border-top-left-radius: 20px; border-top-right-radius: 20px; border: 1px solid black">
                <a href="adminhome"style="color: black; text-decoration: none;">
                    <b>Active Sellers</b>                    
                </a>
            </th>
            <th style="justify-content: center;text-align: justify;padding: 5px; background-color: #c0c0c0; 
                border-top-left-radius: 20px; border-top-right-radius: 20px; border: 1px solid black">
                <a href="passivesellers" style="color: black; text-decoration: none;">
                <b>Sellers Pending Permission</b>
                </a>
            </th>
            <th style="justify-content: center;text-align: justify;padding: 5px; background-color: #c0c0c0; 
                border-top-left-radius: 20px; border-top-right-radius: 20px; border: 1px solid black">
                <a href="customerlist" style="color: black; text-decoration: none;">
                <b>Customers</b>
                </a>
            </th>
            <th style="justify-content: center;text-align: justify;padding: 5px; background-color: black; 
                border-top-left-radius: 20px; border-top-right-radius: 20px; border: 1px solid black">
                <a href="orderslist" style="color: yellow; text-decoration: none;">
                <b>Orders</b>
                </a>
            </th>
            <th style="justify-content: center;text-align: justify;padding: 5px; background-color: #c0c0c0; 
                border-top-left-radius: 20px; border-top-right-radius: 20px; border: 1px solid black">
                <a href="logoutadmin" style="color: black; text-decoration: none;">
                <b>Logout</b>
                </a>
            </th>
            </tr>
            </table>
            <div style="margin-bottom: auto; justify-content: center;text-align: justify;padding: 5px;
                 background-color: black; color: yellow; width: 940px ">
                <%
                    List<Orderhist> op=(List<Orderhist>)request.getAttribute("allordhist");
                    if(op.isEmpty()){
                %>
                    No objects present now
                <%
                    }else{
                %>
                <table style="border: 2px solid yellow; font-size: 48 px; border-radius: 5px; border-color: yellow; 
                             background-color: black; color:yellow; justify-content: center; text-align: center">
                    <tr>
                    <th style="background-color: yellow; color: black">ORDER-ID</th>
                    <th style="background-color: yellow; color: black">PRODUCT</th>
                    <th style="background-color: yellow; color: black">PRICE</th>
                    <th style="background-color: yellow; color: black">DESCRIPTION</th>                    
                    <th style="background-color: yellow; color: black">CUSTOMER</th>                    
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
                        int c_id=x.getCustid();
                        int s_id=x.getSelrid();
                        String c_name=x.getCustname();
                        String s_name=x.getSellername();
                        Double cost=p_price*bqty;
                        String dt=x.getDatetime();
                        Double taken=x.getTaken();
                        Double ref=x.getRefunded();
                %>     
                <tr>
                	<td><%=oid%></td>
                    <td><%=p_name%></td>
                    <td><%=p_price%></td>
                    <td><%=p_pd%></td>                    
                    <td>
                    	ID-<%=c_id%><br>
                    	<%=c_name%>
                    </td>
                    <td>
                    	ID-<%=s_id%><br>
                    	<%=s_name%>
                    </td>
                    <td><%=bqty%></td>
                    <td>
                    	<%
                    		if(ref>0){
                		%>
                			Refunded<br>
	                  	<%
	                    	}
	                    %>                    
                    	<%=cost%>
                    </td>
                    <td><%=dt%></td>             
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