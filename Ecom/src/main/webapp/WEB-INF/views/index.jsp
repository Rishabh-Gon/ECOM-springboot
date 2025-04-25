<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Ecom</title>
        <meta charset="UTF-8">
    </head>
    <body style="background-image: url(/images/shop.jpg)">
        <div>
        <h1 style="text-align: center; margin-top: 0; margin-bottom: 0; color: yellow; background: black">
            Welcome to Our E-commerce Store
        </h1>
        <table style="margin-left: auto; margin-top: 0; margin-bottom: 0">
        	<tr>
       		<th style="align-content: center; background-color: black; border: 1px solid black; border-radius: 20px">
                <a href="/" style="color: yellow; text-decoration: none;">
                    <b>Home</b>                    
                </a>
            </th>
            <th style="align-content: center; background-color: black; border: 1px solid black; border-radius: 20px">
                <a href="aboutus" style="color: white; text-decoration: none;">
                <b>About Us</b>
                </a>
            </th>
            <th style="align-content: center; background-color: black; border: 1px solid black; border-radius: 20px">
                <a href="contactus" style="color: white; text-decoration: none;">
                <b>Contact Us</b>
                </a>
            </th>
            <th style="align-content: center; background-color: black; border: 1px solid black; border-radius: 20px">
                <a href="Adminpage" style="color: white; text-decoration: none;">
                <b>Admin</b>
                </a>
            </th>
            </tr>
        </table>
        </div>
        <table style="margin-left: auto; margin-right: auto">
            <tr>
                <td style="align-content: center">
                    <button style="background-color: yellow" onclick="location.href='seller_login'">
                        <img src="/images/seller.png" alt="Seller" height="400px" width="400px">
                        <br>
                        <h1>Login as seller</h1>
                        <br>
                    </button>                        
                </td>
                <td><button style="background-color: transparent; 
                            border-width: 50px; border-color: transparent">                    
                    </button>
                </td>
                <td style="align-content: center">
                    <button style="background-color: yellow" onclick="location.href='customer_login'">
                        <img src="/images/buyer.png" alt="Customer" height="400px" width="400px">
                        <br>
                        <h1>Login as customer</h1>
                        <br>
                    </button>
                </td>            
            </tr>
        </table>
</body>

</html>
