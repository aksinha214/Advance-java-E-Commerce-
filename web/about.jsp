<%-- 
    Document   : about
    Created on : 31-Mar-2024, 3:12:14 pm
    Author     : Ar Zo On
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="cn.techtutorial.connection.DbCon"%>
<%@page import="cn.techtutorial.dao.ProductDao"%>
<%@page import="cn.techtutorial.model.*"%>
<%@page import="java.util.*"%>

         
<%
// Importing necessary classes
    User auth = (User) request.getSession().getAttribute("auth");
if (auth != null) {
    request.setAttribute("person", auth);
}
%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="/includes/head.jsp"%>
    <link rel="stylesheet" type="text/css" href="includes/footer.css">
    <link rel="stylesheet" type="text/css" href="about.css">
    <title>E-Commerce Cart</title>
    </head>
    <body>
        <%@include file="/includes/navbar.jsp"%>
        <div class="container">
        <h1>About Us</h1>
<p>Welcome to  E-Commerce Cart!<br/>

At E-commerce Cart , we are dedicated to providing you with the best online shopping experience. Whether you're searching for the latest fashion trends, high-quality electronics, or unique gifts for your loved ones, we've got you covered.<br/>
Our journey began with a simple idea: to create a platform where customers can easily discover and purchase products they love from the comfort of their own homes. Since our inception, we've been committed to offering a wide selection of products from trusted brands at competitive prices.<br/>

What sets us apart is our relentless focus on customer satisfaction. We strive to exceed your expectations by offering fast and reliable shipping, secure payment options, and responsive customer support. Your trust is our top priority, and we work tirelessly to ensure that every aspect of your shopping experience is seamless and enjoyable.<br/>

But we're more than just an online retailer. We're a community of passionate individuals who share a love for shopping and technology. We're constantly evolving and adapting to meet the changing needs of our customers, and we're always on the lookout for new ways to enhance your shopping experience.<br/>

Thank you for choosing [Your E-Commerce Website Name]. We appreciate your support and look forward to serving you for many years to come.<br/>

<h2>Happy shopping!</h2>

<h3>E-Commerce Cart Team</h3>
        </p>
        </div>
        <%@include file="/includes/footer.jsp"%>
    </body>
</html>
