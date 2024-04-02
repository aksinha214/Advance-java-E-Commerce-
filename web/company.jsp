<%-- 
    Document   : company
    Created on : 31-Mar-2024, 3:11:29 pm
    Author     : Ar Zo On
--%>
<%@page import="cn.techtutorial.connection.DbCon"%>
<%@page import="cn.techtutorial.dao.ProductDao"%>
<%@page import="cn.techtutorial.model.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
    <link rel="stylesheet" type="text/css" href="company.css">
    <title>E-Commerce Cart</title>
    </head>
    <body>
        <%@include file="/includes/navbar.jsp"%>
       
       <div class="container">
           <h1>Welcome to  E-Commerce Cart !</h1>
           <h4>About Us</h4>
<p>E-Commerce Cart is a leading online retailer dedicated to providing customers with a convenient and enjoyable shopping experience. Since our inception, we have been committed to offering a wide range of high-quality products, excellent customer service, and innovative solutions to meet the needs of our customers.
<br/>
<b>Our Mission</b>
At E-Commerce Cart, our mission is simple: to make online shopping easy, affordable, and enjoyable for everyone. We strive to exceed customer expectations by offering a seamless and secure shopping experience, fast and reliable shipping, and responsive customer support.
<br/>
<b>What Sets Us Apart</b>
<br/>
<i>Wide Selection</i>: We offer a diverse range of products across various categories, including electronics, fashion, home essentials, beauty, and more. With thousands of products to choose from, you're sure to find something you love.
<br/>
<i>Quality Assurance</i>: We are committed to providing our customers with only the highest quality products from trusted brands and manufacturers. Every product undergoes rigorous quality control checks to ensure that it meets our standards of excellence.
<br/>
<i>Customer Satisfaction</i>: Your satisfaction is our top priority. Our team of dedicated customer service representatives is here to assist you with any questions or concerns you may have, ensuring that your shopping experience is smooth and hassle-free.
<br/>
<b>Our Values</b>
<i>Integrity</i>: We believe in conducting business with honesty, transparency, and integrity. We are committed to building trust and maintaining the highest ethical standards in everything we do.
<br/>
<i>Innovation</i>: We embrace innovation and are constantly striving to improve and evolve our products, services, and processes to better serve our customers and stay ahead of the competition.
<br/>
<i>Community</i>: We value our community of customers, employees, and partners and are committed to giving back through charitable initiatives and community involvement.
<br/>
<b>Get in Touch</b>
We'd love to hear from you! Whether you have questions about our products, need assistance with your order, or just want to say hello, feel free to reach out to us. Our friendly and knowledgeable team is here to help.

Thank you for choosing E-Commerce Cart. We appreciate your support and look forward to serving you for many years to come.

<h5>Sincerely,</h5>

<b><i>The Team at E-Commerce Cart  </i></b>
</p>
        </div>
        
        <%@include file="/includes/footer.jsp"%>
    </body>
</html>
