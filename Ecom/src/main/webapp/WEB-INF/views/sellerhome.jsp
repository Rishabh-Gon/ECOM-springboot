<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.example.ecom.model.Seller"%>
<%@page import="com.example.ecom.model.Product"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Seller Home</title>
        <link rel="stylesheet" href="style1.css" />
    </head>
    
        <%
        Seller c=(Seller)session.getAttribute("seller");
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
            <th style="justify-content: center; text-align: justify; padding: 5px; background-color: black; 
                border-top-left-radius: 20px; border-top-right-radius: 20px;">
                <a href="sellerhome"style="color: yellow; text-decoration: none;">
                    <b>Products You sell</b>                    
                </a>
            </th>
            <th style="justify-content: center;text-align: justify;padding: 5px; background-color: #c0c0c0; 
                border-top-left-radius: 20px; border-top-right-radius: 20px; border: 1px solid black">
                <a href="seller_permission_pending" style="color: black; text-decoration: none;">
                <b>Products Pending permission</b>
                </a>
            </th>
            <th style="justify-content: center;text-align: justify;padding: 5px; background-color: #c0c0c0; 
                border-top-left-radius: 20px; border-top-right-radius: 20px; border: 1px solid black">
                <a href="seller_add_product" style="color: black; text-decoration: none;">
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
            <div style="margin-bottom: auto; justify-content: center;text-align: justify;padding: 5px;
                 background-color: black; color: yellow; width: 1204px ">
                 <section class="products">
                <%
                	List<Product> perm_pd=(List<Product>)request.getAttribute("prod_W_perm");
                    if(perm_pd.isEmpty()){
                %>
                    No objects present now
                <%
                    }else{            	
                    for(Product x: perm_pd) {
                    	int p_id=x.getId();
                        String p_name=x.getName();
                        String p_pd=x.getPd();
                        Double p_price=x.getPrice();
                        int p_quant=x.getQuantity();
                        String path=x.getImgp();
                %>
                <div class="product-card">
					        <img src="<%=path%>" alt="Product <%=p_name%>">
					        <h3><%=p_name%></h3>
					        <p><%=p_pd%></p>
					        <p class="extra-info">Remaining: <%=p_quant%></p>					        
					        <span class="price">₹<%=p_price%></span>
					        <div class="button-group">
					        	<form action="slctslrhmprod" method="post">					        		                     
                                    <input type="hidden" name="prod_id" value="<%=p_id%>">
                                     <button type="submit" href="editquantsellr" class="add-cart">                                       
                                      Edit Quantity
                                      </button>
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
        <%
        }
        %>
</html>
