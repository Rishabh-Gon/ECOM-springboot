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
        <link rel="stylesheet" href="stylecart.css" />
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
            <th style="justify-content: center; text-align: justify; padding: 5px; background-color: #c0c0c0; 
                border-top-left-radius: 20px; border-top-right-radius: 20px; border: 1px solid black">
                <a href="customerhome"style="color: black; text-decoration: none;">
                    <b>Products</b>                    
                </a>
            </th>
            <th style="justify-content: center;text-align: justify;padding: 5px; background-color: black; 
                border-top-left-radius: 20px; border-top-right-radius: 20px; border: 1px solid black">
                <a href="custcart" style="color: yellow; text-decoration: none;">
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
            <div style="margin-bottom: auto; justify-content: center;text-align: justify;padding: 8px;
                 background-color: black; color: yellow; width: 1204px">
                <%
                    List<Orderprod> op=(List<Orderprod>)request.getAttribute("cartprods");
                    if(op.isEmpty()){
                %>
                    No objects present now
                <%
                    }else{
                %>
                <section class="cart-items">
                <%
                	double total=0.0;
                	int nobuy=0;
                    for(Orderprod x: op) {
                    	int oid=x.getId();
                        String p_name=x.getProduct().getName();
                        String p_pd=x.getProduct().getPd();
                        Double p_price=x.getProduct().getPrice();
                        int avlqty=x.getProduct().getQuantity();
                        int bqty=x.getQty();
                        String s_name=x.getProduct().getSeller().getName();
                        Double cost=p_price*bqty;
                        total+=cost;
                        String path=x.getProduct().getImgp();
                %>
                <div class="cart-item">
			        <img src="<%=path%>" alt="Order <%=oid%>" />
			        
			        <div class="cart-name-price">
			          <h2><%=p_name%></h2>
			          <p class="price">₹<%=cost%></p>
			        </div>
			
			        <div class="cart-description">
			          <p><%=p_pd%></p>
			          <p class="seller-info">Seller: <%=s_name%></p>
			          </div>
			          <div class="cart-description">
			          <p class="stock-info">Available: <%=avlqty%></p>
			          <p class="stock-info">Price: ₹<%=p_price%></p>
			        </div>
			        <%
                    	if(avlqty==0){
                    		String prodmsg="Cannot buy this item";
                    		nobuy+=1;                    		
                    %>
                    <div class="cart-description">
			          <p class="stock-info"><%=prodmsg%></p>
			        </div>
          
                    <%
                   		} else if(bqty>avlqty){
                   			String prodmsg="Can't buy this quantity";
                   			nobuy+=1;                   			
                    %>
                    <div class="cart-description">
			          <p class="stock-info"><%=prodmsg%></p>
			        </div>
                    
                    <%
                   		}
                   		else{
                    %>
                    <div class="cart-description">
			          <p class="stock-info">   </p>
			        </div>
			        <%
                   		}
                    %>			        
			        <div class="cart-actions">
			        	<form action="Addprodcartval" method="post">   
				            <input type="hidden" name="order_id" value="<%=oid%>">
				            <button class="qty-btn">+</button>                                           
				        </form>
			          <div class="cart-quantity">
			          <input type="text" value="<%=bqty%>" readonly />
			          </div>
			          	<form action="Subprodcartval" method="post">   
				            <input type="hidden" name="order_id" value="<%=oid%>">
				            <button class="qty-btn">−</button>                                   
				        </form>
				        <form action="Delcart" method="post">   
				            <input type="hidden" name="order_id" value="<%=oid%>">
				            <button type="submit" class="remove-btn">
				                <b><img alt="del" src="/images/bin.png" height="25px" width="25px"></b>
				            </button>                                           
				        </form>			          
			        </div>
			      </div>                             
                </section>
                <%
                    }
                	if(nobuy==0){
                %>
                <div>
                	TOTAL : Rs.<%=total%>
                	<form action="Buynowset" method="post" style="font-size: 15px;">   
                        <div style="align-items: center">
                            <input type="hidden" name="cust_id" value="<%=custid%>">
                            <button type="submit" style="width: 100px; padding: 10px; 
                            background: yellow; color: black; border: none; border-radius: 5px;">
                                <b>Buy Now</b>
                            </button>                                           
                        </div>
                    </form>
               	</div>
               	
                <%
                	}
                }
                %>
            </div>
          </div>
          <script>
		    setTimeout(function () {
		        location.reload();
		    }, 5000);
		</script>
        </body>
</html>