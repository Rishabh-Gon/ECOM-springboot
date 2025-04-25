<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Register Seller</title>
    </head>
    <body style="background-image: url(images/shop.jpg)">
        <div style="display: flex; justify-content: center; align-items: left; font-size: 16px; 
             padding: 20px 40px;padding-bottom: 0px; border-top-left-radius: 20px; border-top-right-radius: 20px; background-color: white;
             flex-direction: column; margin-left: auto; margin-right: auto; margin-top: 26px; margin-bottom: auto; width: 800px">
                 <a href="seller_login">Return to Seller Login Page</a>
         </div>
        <div style="display: flex; justify-content: center; align-items: center; font-size: 32px; 
             padding: 20px 40px; padding-top: 0px; border-bottom-left-radius: 20px; border-bottom-right-radius: 20px; 
             background-color: white; flex-direction: column; margin-left: auto; margin-right: auto; margin-bottom: auto; width: 800px">
            <h2>Register Seller</h2>
            <form action="RegisterSeller" method="post">
            <div style="font-size: 15px">Name</div>
            <input type="text" name="seller_name" placeholder="Name" required 
            style="width: 100%; padding: 10px; margin: 10px 0; border: 1px solid #ccc; border-radius: 5px;">
            <div style="font-size: 15px">Email</div>
            <input type="email" name="seller_mail" placeholder="xyz@gmail.com" required 
            style="width: 100%; padding: 10px; margin: 10px 0; border: 1px solid #ccc; border-radius: 5px;">
            <div style="font-size: 15px">Password</div>
            <input type="password" name="seller_password" placeholder="Password" required 
            style="width: 100%; padding: 10px; margin: 10px 0; border: 1px solid #ccc; border-radius: 5px;">
            <div style="font-size: 15px">Confirm Password</div>
            <input type="password" name="seller_re_password" placeholder="Re-type Password" required 
            style="width: 100%; padding: 10px; margin: 10px 0; border: 1px solid #ccc; border-radius: 5px;">
            <button type="submit" style="width: 100%; padding: 10px; background: #28a745; color: white; border: none; 
                    border-radius: 5px; cursor: pointer;">Submit</button>
            <%
            String getm=String.valueOf(request.getAttribute("msg"));
			String showMessage="";
            if(getm!=null){
                if(getm.equals("success")){
            %>
            <p style="font-family: Arial, sans-serif; color: green; font-size: 16px;"> 
                Registration Successful. Click here to <a href="seller_login">Login</a>
            </p>
            <%
                }else{
                	if(getm.equals("pfail")){showMessage="Passwords don't match";}
                	if(getm.equals("mxstfail")){showMessage="Email is already registered with a seller account. Please Login.";}
            %>
            <p style="font-family: Arial, sans-serif; color: red; font-size: 16px; width: 450px"> 
                <%=showMessage %>
            </p>
            <%
                }
            }
            %>

            


        </form>         
        </div>
    </body>
</html>
