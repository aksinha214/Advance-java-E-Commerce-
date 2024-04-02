<%-- 
    Document   : contact
    Created on : Mar 21, 2024, 10:49:41 AM
    Author     : AR ZO ON
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
    <link rel="stylesheet" type="text/css" href="contact.css">
    <title>E-Commerce Cart</title>
    </head>
    <body>
        <%@include file="/includes/navbar.jsp"%>
        
        <h1>Contact us !!</h1>
        
        <div class="container">
       <form action="SendEmailServlet" method="POST">
                    <div class="form-group">
                        <label for="name">Name:</label>
                        <input type="text" id="name" name="name" required>
                    </div>
                    <div class="form-group">
                        <label for="phone">Phone No.:</label>
                        <input type="tel" id="phone" name="contactNo" required>
                    </div>
                    <div class="form-group">
                        <label for="email">Email:</label>
                        <input type="email" id="email" name="email" required>
                    </div>
                    <div class="form-group">
                        <label for="message">Message:</label>
                        <textarea id="message" name="message" required></textarea>
                    </div>
                    <button class="button1" type="submit" value="Send" >Submit</button>
                </form> 
        </div>
       <%@include file="/includes/footer.jsp"%>
    </body>
</html>
