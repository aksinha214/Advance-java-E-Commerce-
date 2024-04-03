<%-- 
    Document   : admin
    Created on : Feb 23, 2024, 10:25:18 PM
    Author     : AR ZO ON
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="admin.css">
        <title>E-Commerce Cart Admin</title>
    </head>
    <body>
        <div  class="Head">
            <img src="product-images/logo.jpg" width="80px" height="80px" alt=""/>E-Commerce Cart Admin Page !
            
            <li class="nav-item"><a class="nav-link" href="log-out">Logout</a></li>
        </div>
        <div class="left-item">
            <a href="users.jsp"><button type="users" name="users"> Users &nbsp;&nbsp;&nbsp;</button></a>
            
            <a href="product.jsp"><button type="product" name="product">Products</button></a>
            
            <a href="orderAdmin.jsp"><button type="Cart" name="orderAdmin">Carts Details</button></a>
            
            <a href="orderdetailsad.jsp"><button type="orderAdmin" name="orderAdmin">Orders Details</button></a>
         </div>
    </body>
</html>
