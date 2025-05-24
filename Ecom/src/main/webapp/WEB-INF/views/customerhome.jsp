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
        <link rel="stylesheet" href="style1.css" />
    </head>    
    <%
    Customer c=(Customer)session.getAttribute("customer");
    int custid=c.getId();
    String custname=c.getName();
    %>
    <body style="background-image: url(images/shop.jpg)">         
        <div style="display: inline-block; justify-content: center; text-align: center; 
            border-top-left-radius: 20px; background-color: white; flex-direction: column; 
            border-top-right-radius: 20px; margin-left: auto; margin-right: auto; margin-bottom: auto; width: 1214px;">
            <h2>Welcome to SwiftMart, <%=custname%></h2>
        </div>
        <div style="display: inline-block; justify-content: center; align-items: center; font-size: 22px; 
             background-color: white; flex-direction: column; 
             margin-left: auto; margin-right: auto; margin-bottom: auto; width: 1214px">
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
                 background-color: black; color: yellow; width: 1204px; ">
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
					        	<form action="Addcart" method="post">   
		                            <input type="hidden" name="product_id" value="<%=pd%>">
		                      		<button type="submit" class="add-cart">Add to Cart</button>      
		                        </form>
		                        <%
			                    	if(qty>0){
			                    %>
			                    <form action="Buynowsingle" method="post">   
		                                <input type="hidden" name="product_id" value="<%=pd%>">
		                      			<button type="submit" class="buy-now">Buy Now</button>          
		                        </form>
		                        <%
			                    	}
			                    %>
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