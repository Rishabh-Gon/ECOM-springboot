<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.example.ecom.model.Admin"%>
<%@page import="com.example.ecom.model.Customer"%>
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
            <th style="justify-content: center;text-align: justify;padding: 5px; background-color: black; 
                border-top-left-radius: 20px; border-top-right-radius: 20px; border: 1px solid black">
                <a href="customerlist" style="color: yellow; text-decoration: none;">
                <b>Customers</b>
                </a>
            </th>
            <th style="justify-content: center;text-align: justify;padding: 5px; background-color: #c0c0c0; 
                border-top-left-radius: 20px; border-top-right-radius: 20px; border: 1px solid black">
                <a href="orderslist" style="color: black; text-decoration: none;">
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
                List<Customer> perm_pd=(List<Customer>)request.getAttribute("allcust");
                    if(perm_pd.isEmpty()){
                %>
                    No objects present now
                <%
                    }else{
                %>
                <table style="border: 2px solid yellow; font-size: 48 px; border-radius: 5px; border-color: yellow; 
                             background-color: black; text-align: center; color:yellow; justify-content: center;">
                    <tr>
                    <th style="background-color: yellow; color: black">CUSTOMER ID</th>
                    <th style="background-color: yellow; color: black">SELLER NAME</th>
                    <th style="background-color: yellow; color: black">SELLER MAIL</th>
                    <th style="background-color: yellow; color: black">CUSTOMER DETAILS</th>                    
                    </tr>
                <%
                    for(Customer x: perm_pd) {
                        String p_name=x.getName();
                        String p_id=String.valueOf(x.getId());
                        String p_mail=x.getEmail();
                %>     
                            <tr>
                                <td><%=p_id%></td>
                                <td><%=p_name%></td>
                                <td><%=p_mail%></td>
                                <td>
                                    <form action="customer_det" method="post" style="font-size: 15px;">   
                                        <div style="align-items: center">                                            
                                            <input type="hidden" name="cust_id" value="<%=p_id%>">
                                            <button type="submit"                                         
                                                    style="padding: 10px; background: yellow; color: black;
                                                    border: none; border-radius: 5px;">
                                                <b>See Details</b>
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