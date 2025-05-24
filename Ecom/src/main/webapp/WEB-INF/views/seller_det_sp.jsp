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
        <link rel="stylesheet" href="style1.css" />
    </head>
    	<%
    	Admin admi=(Admin)session.getAttribute("admin");
    	String retpage=(String)session.getAttribute("page");
    	Seller s=(Seller)session.getAttribute("sellerinfo");
    	List<Product> plist=(List<Product>)request.getAttribute("permprodfsid");
    	%>
        <body style="background-image: url(images/shop.jpg)">         
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
            <th style="justify-content: center; text-align: justify; padding: 5px; background-color: cyan; 
                border-top-left-radius: 20px; border-top-right-radius: 20px; border: 1px solid black">
                <a href="<%=retpage%>"style="color: black; text-decoration: none;">
                    <b><=</b>                    
                </a>
            </th>
            <th style="justify-content: center;text-align: justify;padding: 5px; background-color: black; 
                border-top-left-radius: 20px; border-top-right-radius: 20px; border: 1px solid black">
                <a href="seller_det_sp" style="color: yellow; text-decoration: none;">
                <b>Selling Products</b>
                </a>
            </th>
            <th style="justify-content: center;text-align: justify;padding: 5px; background-color: #c0c0c0; 
                border-top-left-radius: 20px; border-top-right-radius: 20px; border: 1px solid black">
                <a href="seller_det_pp" style="color: black; text-decoration: none;">
                <b>Pending Permission</b>
                </a>
            </th>
            <th style="justify-content: center;text-align: justify;padding: 5px; background-color: #c0c0c0; 
                border-top-left-radius: 20px; border-top-right-radius: 20px; border: 1px solid black">
                <a href="seller_det_page" style="color: black; text-decoration: none;">
                <b>Details</b>
                </a>
            </th>
            </tr>
            </table>
            <div style="margin-bottom: auto; justify-content: center;text-align: justify;padding: 5px;
                 background-color: black; color: yellow; width: 1204px ">
                 <section class="products">
                <%
                    if(plist.isEmpty()){
                %>
                    No objects present now
                <%
                    }else{                
                    for(Product x: plist) {
                        String p_name=x.getName();
                        int p_id=x.getId();
                        String p_price=String.valueOf(x.getPrice());
                        String p_qty=String.valueOf(x.getQuantity());                        
                        String p_pd=x.getPd();
                        String path=x.getImgp();
                %>
                <div class="product-card">
			        <img src="<%=path%>" alt="Product <%=p_id%>">
			        <h3><%=p_name%></h3>
			        <p><%=p_pd%></p>
			        <p class="extra-info">Remaining: <%=p_qty%></p>
			        <span class="price">₹<%=p_price%></span>
			        <div class="button-group">
			        	<form action="Remprodperm" method="post">   
	                           <input type="hidden" name="prodid" value="<%=p_id%>">
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