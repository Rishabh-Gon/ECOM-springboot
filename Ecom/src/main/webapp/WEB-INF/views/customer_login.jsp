<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Customer Login</title>
    </head>
    <body style="background-image: url(images/shop.jpg)">
        <h1 style="text-align: center; margin-top: 0; margin-bottom: 0; color: yellow; background: black">
            Welcome to SwiftMart
        </h1>
        <div style="display: flex; justify-content: center; align-items: left; font-size: 16px; 
             padding: 20px 40px; border-top-left-radius: 20px; border-top-right-radius: 20px; background-color: white;
             flex-direction: column; margin-left: auto; margin-right: auto; margin-top: 26px; margin-bottom: auto; width: 800px">
                 <a href="/">Return to Home Page</a>
         </div>
        <div style="display: flex; justify-content: center; align-items: center; font-size: 32px; 
             padding: 20px 40px; border-bottom-left-radius: 20px; border-bottom-right-radius: 20px; 
             background-color: white; flex-direction: column; margin-left: auto; margin-right: auto; margin-bottom: auto; width: 800px">
            <h2>Login</h2>
            <form action="LoginCustomer" method="post">
            <div style="font-size: 15px">Email</div>
            <input type="text" name="cust_mail" placeholder="E-mail" required 
                   style="width: 100%; padding: 10px; margin: 10px 0; border: 1px solid #ccc; border-radius: 5px;">
            <div style="font-size: 15px">Password</div>
            <input type="password" name="cust_password" placeholder="Password" required 
                   style="width: 100%; padding: 10px; margin: 10px 0; border: 1px solid #ccc; border-radius: 5px;">
            <button type="submit" style="width: 100%; padding: 10px; background: #28a745; color: white; border: none; border-radius: 5px; cursor: pointer;">Login</button>
            
            <%
            String getm=String.valueOf(request.getAttribute("msg"));
			String showMessage="";
            if(getm!=null){
                if(getm.equals("clfail")){
                	showMessage="Wrong E-mail or Password";
            %>            
            <p style="font-family: Arial, sans-serif; color: red; font-size: 16px; width: 300px"> 
                <%=showMessage %>
            </p>
            <%
                }
            }
            %>
            
        	</form>
        <p style="font-size: 15px;">
            If you are not already registered. <a href="register_customer">Register Here</a>            
        </p>
        </div>
    </body>
</html>
