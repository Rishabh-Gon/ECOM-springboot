<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.example.ecom.model.Seller"%>
<%@page import="com.example.ecom.model.Product"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>SelrEditDetls</title>
    </head>
    
        <%
        Seller c=(Seller)session.getAttribute("seller");
        String sellrname=c.getName();
        String sellrperm=c.getPerm();
        if(sellrperm.equals("NO")){
        %>
        <body>  
        <h1>Welcome <%=sellrname%></h1>
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
        <div style="display: flex; justify-content: center; align-items: center; font-size: 32px; 
            border-top-left-radius: 20px; background-color: white; flex-direction: column; 
            border-top-right-radius: 20px; margin-left: auto; margin-right: auto; margin-bottom: auto; width: 810px">
            <h1>Welcome <%=sellrname%></h1>
        </div>
        <div style="display: flex; justify-content: center; align-items: center; font-size: 22px; 
             background-color: white; flex-direction: column; 
             margin-left: auto; margin-right: auto; margin-bottom: auto; width: 810px">
            <table style="margin-right: auto; margin-top: auto; border-spacing: 0px">
            <tr>
            <th style="justify-content: center; text-align: justify; padding: 5px; background-color: cyan; 
                border-top-left-radius: 20px; border-top-right-radius: 20px;">
                <a href="seller_permission_pending"style="color: black; text-decoration: none;">
                    <b><=</b>                    
                </a>
            </th>
            <th style="justify-content: center;text-align: justify;padding: 5px; background-color: black; 
                border-top-left-radius: 20px; border-top-right-radius: 20px; border: 1px solid black">
                <div style="color: yellow; text-decoration: none;">
                <b>Edit Details</b>
                </div>
            </th>
            </tr>
            </table>
            <div style="margin-bottom: auto; justify-content: center;text-align: justify;padding: 5px;
                 background-color: black; color: yellow; width: 800px ">
                <%
                	Product x=(Product)session.getAttribute("prod_edit");
                    if(x==null){
                %>
                    No ob
                <%
                    }
                    else{
                    	
                    	int p_id=x.getId();
                        String p_name=x.getName();
                        String p_pd=x.getPd();
                        Double p_price=x.getPrice();
                        int p_quant=x.getQuantity();
                %>
                <div style="margin-bottom: auto; justify-content: center; padding: 5px;
                 background-color: black; color: yellow; width: 800px ">
                <form action="EdtProductSelr" method="post" style="font-size: 15px;">   
                    <div style="align-items: center; margin-left: 250px">
                        <br>
                        Product Name<br>
                        <input type="text" name="prod_name" placeholder="<%=p_name %>" 
                        style="width: 200px; padding: 10px; margin: 10px 0; border: 1px solid #ccc; border-radius: 5px;"><br>
                        Product Price(in Rs.)<br>
                        <input type="text" name="product_price" placeholder="<%=p_price %>"
                        style="width: 200px; padding: 10px; margin: 10px 0; border: 1px solid #ccc; border-radius: 5px;"><br>
                        Product Description<br>
                        <textarea placeholder="<%=p_pd %>" 
                                  style="width: 200px;" name="product_pd"></textarea><br>
                        Product Quantity(in whole numbers)<br>
                        <input type="text" name="prod_quant" placeholder="<%=p_quant %>"
                        style="width: 200px; padding: 10px; margin: 10px 0; border: 1px solid #ccc; border-radius: 5px;"><br>
                        <button type="submit" style="width: 200px; padding: 10px; background: yellow; color: black;
                        border: none; border-radius: 5px;">Submit</button><br>
                        
                        <%
                            String getm=String.valueOf(request.getAttribute("msg"));                            
                            if(getm.equals("Success"))
                            {                                
                        %>
                            <p> 
                             Successfully added the details   
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
        </div>
        </body>    
        <%
       			}
			}
		 %>
</html>