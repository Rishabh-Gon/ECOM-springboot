<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.example.ecom.model.Seller"%>
<%@page import="com.example.ecom.model.Admin"%>
<%@page import="com.example.ecom.model.Product"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>ADMIN HOME</title>
        <link rel="stylesheet" href="style1.css" />
    </head>
    	<%
    	Admin admi=(Admin)session.getAttribute("admin");
    	%>
        <body style="background-image: url(images/shop.jpg)">         
        <div style="display: inline-block; justify-content: center; text-align: center; 
            border-top-left-radius: 20px; background-color: white; flex-direction: column; 
            border-top-right-radius: 20px; margin-left: auto; margin-right: auto; margin-bottom: auto; width: 1214px;">
            <h2>Welcome to SwiftMart, Admin <%=admi.getUsername()%></h2>
        </div>
        <div style="display: inline-block; justify-content: center; align-items: center; font-size: 22px; 
             background-color: white; flex-direction: column; 
             margin-left: auto; margin-right: auto; margin-bottom: auto; width: 1214px">
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
                <a href="productlist" style="color: yellow; text-decoration: none;">
                <b>Selling Products</b>
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
                 background-color: black; color: yellow; width: 1204px ">
                 <section class="products">
                <%
                    List<Product> perm_p=(List<Product>)request.getAttribute("prod_y_perm");
                    if(perm_p.isEmpty()){
                %>
                    No objects present now
                <%
                    }else{
                
                    for(Product x: perm_p) {
                        int pd=x.getId();
                        int sd=x.getSeller().getId();
                        String p_name=x.getName();
                        String p_pd=x.getPd();
                        Double p_price=x.getPrice();
                        int qty=x.getQuantity();
                        String s_name=x.getSeller().getName();
                        String path=x.getImgp();
                %>     
                	
					      <!-- Product Card Example -->
					      <div class="product-card">
					        <img src="<%=path%>" alt="Product <%=pd%>">
					        <h3><%=p_name%></h3>
					        <p><%=p_pd%></p>
					        <p class="extra-info">Remaining: <%=qty%></p>
					        <p class="extra-info">Seller: <%=s_name%></p>
					        <span class="price">₹<%=p_price%></span>
					        <div class="button-group">
					        	<form action="Remadminprodperm" method="post">   
		                            <input type="hidden" name="prodid" value="<%=pd%>">
		                      		<button type="submit" class="buy-now">Remove</button>      
		                        </form>			              
					        </div>
					      </div>  
                <%
                        }
                    }
                %>
                </section>
            </div>
        </div>
        <script>			    
			    setInterval(function() {
			        location.reload();
			    }, 5000);
			</script>
        </body>    
</html>