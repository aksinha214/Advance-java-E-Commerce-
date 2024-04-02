<%-- 
    Document   : ordersdetails
    Created on : Feb 7, 2024, 10:37:56 AM
    Author     : AR ZO ON
--%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="cn.techtutorial.dao.OrderDao"%>
<%@page import="cn.techtutorial.connection.DbCon"%>
<%@page import="cn.techtutorial.dao.ProductDao"%>
<%@page import='java.sql.*'%>
<%@ page import="java.io.*,java.util.*" %>
<%@page import="cn.techtutorial.model.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%
        DecimalFormat dcf = new DecimalFormat("#.##");
        request.setAttribute("dcf", dcf);
        User auth = (User) request.getSession().getAttribute("auth");
        List<Order> orders = null;
        if (auth != null) {
            request.setAttribute("person", auth);
            OrderDao orderDao  = new OrderDao(DbCon.getConnection());
                orders = orderDao.userOrders(auth.getId());
        }else{
                response.sendRedirect("login.jsp");
        }
        ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
        if (cart_list != null) {
                request.setAttribute("cart_list", cart_list);
        }
	
%>
<%
   if (request.getParameter("submit") != null) {
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String dob = request.getParameter("dob");
        String address = request.getParameter("address");
        String pincode = request.getParameter("pincode");
         String paymentMethods = "";
    if (request.getParameter("online") != null) {
        paymentMethods += "online,";
    }
    if (request.getParameter("cod") != null) {
        paymentMethods += "cod,";
    }
    // Remove the trailing comma
    paymentMethods = paymentMethods.replaceAll(",$", "");
        
        Connection con;
        PreparedStatement pst;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql", "root", "");
            
            String query = "insert into orderdetails (name,phone,dob,address,pincode,payment_method) VALUES (?,?,?,?,?,?)";
            pst = con.prepareStatement(query);
            pst.setString(1, name);
            pst.setString(2, phone);
            pst.setString(3, dob);
            pst.setString(4, address);
            pst.setString(5, pincode);
            pst.setString(6, paymentMethods);
           

            int rowsAffected = pst.executeUpdate();
            request.setAttribute("rowsAffected", rowsAffected);
            
            if (rowsAffected > 0) {
                out.println("Record inserted successfully!");
            } else {
                out.println("Error inserting record.");
            }
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        } 
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <%@include file="/includes/head.jsp"%>
        <link rel="stylesheet" type="text/css" href="ordersdetails.css">
        <link rel="stylesheet" type="text/css" href="includes/footer.css">

        <title>E-Commerce Cart</title>
    </head>
    <body>
        <%@include file="/includes/navbar.jsp"%>
        <div class="container_ordersdetails">
            <div class="card">
                <div class="card-header text-center">Orders Details</div>
                <div class="card-body">
                    <form action="" method="post">
                        <div class="form-group">
                            <label>Full Name:</label>
                            <input type="text"  name="name" placeholder="Enter Receiver Full Name" required>
                        </div>
                        <div class="form-group">
                            <label >Phone Number:</label>
                            <input type="tel" name="phone" placeholder="Enter Phone Number" required>
                        </div>
                        <div class="form-group">
                            <label>Date of Birth:</label>
                            <input type="date"   name="dob" required>
                        </div>
                        <div class="form-group">
                            <label >Address:</label>
                            <input type="text"  name="address" placeholder="Enter Your Address" required>
                        </div>
                        <div class="form-group">
                            <label >PIN Code:</label>
                            <input type="text" name="pincode" placeholder="Enter Area PIN Code" required>
                        </div>

                        <div class="form-group">
                            <label>Payment</label>
                            <div class="checkbox-list">
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" name="online" value="online" id="onlinePayment">
                                    <label class="form-check-label" for="onlinePayment">Online</label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" name="cod" value="cashOnDelivery" id="cashOnDelivery">
                                    <label class="form-check-label" for="cashOnDelivery">Cash on Delivery</label>
                                </div>
                            </div>
                        </div>
                        
                    
                        <div class="text-center">
                            <button type="submit" class="btn " name="submit"><b>Order</b></button>
                        </div>

                    </form>
                </div>
            </div>
        </div>
        

        <%@include file="/includes/footer.jsp"%>
    </body>
</html>
