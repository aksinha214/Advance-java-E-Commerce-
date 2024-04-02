<%-- 
    Document   : offices
    Created on : 31-Mar-2024, 3:12:03 pm
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
    <link rel="stylesheet" type="text/css" href="offices.css">
    <title>E-Commerce Cart</title>
    </head>
    <body>
        <%@include file="/includes/navbar.jsp"%>
        
        <div class="container">
            <h3> Our Offices</h3>
            <br/>
            <h4>Main Office</h4>
            <b>Location:</b><i> Malangwa-10 ,Sarlahi,Nepal</i><br/>
            <b>Phone:</b><i> +977 9812157305</i><br/>
            <b>Email:</b><i> apandit372@rku.ac.in</i><br/>
            <b>Hours:</b> <i>9:00 Am to 5:00 Pm</i><br/>



            <h4>Regional Office 1</h4> 
            <b>Location:</b><i> Rautahat</i><br/>
            <b>Phone:</b> <i>+91 93279 34073</i><br/>
            <b>Email:</b><i>ybikash958@rku.ac.in </i><br/>
            <b>Hours:</b><i>9:00 Am to 5:00 Pm</i><br/>


            <h4>Regional Office 2</h4>
            <b>Location: </b><i>Kalaiya</i><br/>
<b>Phone:</b> <i>+977 981-5213405]</i><br/>
<b>Email:</b><i>sajaykumar323@rku.ac.in</i><br/>
<b>Hours:</b><i>9:00 Am to 5:00 Pm</i><br/>



<h5>Get in Touch</h5>
<i><b>Whether you have questions about our products, need assistance with your order, or want to learn more about our company, our team is here to help. Feel free to reach out to us using the contact information provided for each office location.

        Thank you for choosing  E-Commerce Cart. We appreciate your support and look forward to serving you from our offices around the world.</b></i>

<h5>Sincerely,</h5>

<b>The Team at E-Commerce Cart</b> 
        </div>
        <%@include file="/includes/footer.jsp"%>
    </body>
</html>
