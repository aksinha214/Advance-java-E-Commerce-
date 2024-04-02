
<%@page import="cn.techtutorial.model.*"%>
<%@page import='java.sql.*'%>
<%@ page import="java.io.*,java.util.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>


<%
User auth = (User) request.getSession().getAttribute("auth");
if (auth != null) {
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
        String email = request.getParameter("email");
        String password= request.getParameter("password");
        String confirm_password= request.getParameter("confirm_password");
        Connection con;
        PreparedStatement pst;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql", "root", "");
            
            String query = "insert into users (name,phone,dob,address,pincode,email,password,confirm_password) VALUES (?,?,?,?,?,?,?,?)";
            pst = con.prepareStatement(query);
            pst.setString(1, name);
            pst.setString(2, phone);
            pst.setString(3, dob);
            pst.setString(4, address);
            pst.setString(5, pincode);
            pst.setString(6, email);
            pst.setString(7, password);
            pst.setString(8, confirm_password);

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
        <title>E-Commerce Cart</title>
        <link rel="stylesheet" type="text/css" href="signup.css">
        <link rel="stylesheet" type="text/css" href="includes/footer.css">
    </head>
    <body>
        <%@include file="/includes/navbar.jsp"%>
        <div class="container_signup">
            <div class="card">
                <div class="card-header">
                    <img src="product-images/logo_big.png" alt="" />E-Commerce Cart
                    <br>Sign Up</div>
                <div class="card-body">
                    <form action="" method="post">
                        <div class="form-group">
                            <label>Full Name:</label>
                            <input type="text"  name="name" placeholder="Enter Your Full Name" required>
                        </div>
                        <div class="form-group">
                            <label >Phone Number:</label>
                            <input type="tel" name="phone" placeholder="Enter your Phone Number" required>
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
                            <input type="text" name="pincode" placeholder="Enter Your Area PIN Code" required>
                        </div>
                        <div class="form-group">
                            <label >Email:</label>
                            <input type="email"  name="email" placeholder="Enter Your Email" required>
                        </div>
                        <div class="form-group">
                            <label>Password:</label>
                            <input type="password"  name="password" placeholder="Enter password" required>
                        </div>
                        <div class="form-group">
                            <label>Confirm Password:</label>
                            <input type="password"  name="confirm_password" placeholder="Re-Enter Your Password" required>
                        </div>
                        <div class="text-center">
                            <input type="checkbox" class="form-check-input"  required>
                            <label>I agree to the terms and privacy policy</label>
                            <p>Already have an account? <a href="login.jsp">Log In</a></p>
                        </div>
                        <div class="text-center">
                            <a href="login.jsp"><button type="submit" class="btn" name="submit">Sign Up</button></a>
                        </div>
                       
                    </form>
                </div>
            </div>
        </div>
        <%@include file="/includes/footer.jsp"%>
    </body>
</html>