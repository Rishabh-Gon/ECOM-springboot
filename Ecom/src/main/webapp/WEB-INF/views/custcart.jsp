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
            <div style="margin-bottom: auto; justify-content: center;text-align: justify;padding: 5px;
                 background-color: black; color: yellow; width: 900px ">
                <%
                    List<Orderprod> op=(List<Orderprod>)request.getAttribute("cartprods");
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
                    <th style="background-color: yellow; color: black">AVL. QTY</th>
                    <th style="background-color: yellow; color: black">Buying QTY</th>
                    <th style="background-color: yellow; color: black">COST</th>
                    <th style="background-color: yellow; color: black"><img alt="del" src="/images/bin.png" height="25px" width="25px"></th>
                    </tr>
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
                %>     
                <tr>
                    <td><%=p_name%></td>
                    <td><%=p_price%></td>
                    <td><%=p_pd%></td>
                    <td><%=s_name%></td>
                    <td><%=avlqty%></td>
                    <td>
                    <div style="display: flex; justify-content: space-between; align-items: center;">
				    <%=bqty%>
				    <div style="display: flex; gap: 5px;">
				        <form action="Addprodcartval" method="post">   
				            <input type="hidden" name="order_id" value="<%=oid%>">
				            <button type="submit" style="width: 30px; padding: 10px; background: yellow; color: black; border: none; border-radius: 5px; cursor: pointer;">
				                <b>+</b>
				            </button>                                           
				        </form>
				        <form action="Subprodcartval" method="post">   
				            <input type="hidden" name="order_id" value="<%=oid%>">
				            <button type="submit" style="width: 30px; padding: 10px; background: yellow; color: black; border: none; border-radius: 5px; cursor: pointer;">
				                <b>-</b>
				            </button>                                           
				        </form>
				    </div>
					</div>
                    </td>
                    <td><%=cost %>
                    </td>
                    <td>
                    	<form action="Delcart" method="post">   
				            <input type="hidden" name="order_id" value="<%=oid%>">
				            <button type="submit" style="width: 27px;align-content: center; background: yellow; color: black; border: none; border-radius: 5px; cursor: pointer;">
				                <b><img alt="del" src="/images/bin.png" height="25px" width="25px"></b>
				            </button>                                           
				        </form>
                    </td>                    
                    <%
                    	if(avlqty==0){
                    		String prodmsg="Cannot buy this item";
                    		nobuy+=1;                    		
                    %>
                    <td><%=prodmsg %>	
                    </td>
                    <%
                   		} else if(bqty>avlqty){
                   			String prodmsg="Can't buy this quantity";
                   			nobuy+=1;                   			
                    %>
                    <td><%=prodmsg %>
                    </td>
                    <%
                   		}
                    }
                    %>
                </table>
                <%
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
        </body>
</html>