<%-- 
    Document   : product
    Created on : Mar 4, 2024, 3:18:01 PM
    Author     : AR ZO ON
--%>
<%@page import='java.sql.*'%>
<%@ page import="java.io.*,java.util.*" %>

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
            <a href="users.jsp"><button type="users" name="users" > Users &nbsp;&nbsp;&nbsp;</button></a>
            
            <a href="product.jsp"><button type="product" name="product">Products</button></a>
            <a href="orderAdmin.jsp"><button type="orderAdmin" name="orderAdmin">Carts Details</button></a>
            <a href="orderdetailsad.jsp"><button type="orderAdmin" name="orderAdmin">Orders Details</button></a>


         </div>
        <table border="1">
            <tr>
                <th>Order Id</th>
                <th>Product Id</th>
                <th>User Id</th>
                <th>Order Quantity</th>
                <th>Order Date</th>
                <th>Action</th>
                
            </tr>
            <% 
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql", "root", "");
                    Statement stmt = con.createStatement();
                    ResultSet rs = stmt.executeQuery("SELECT * FROM orders");

                    while(rs.next()) {
                        %>
                        <tr>
                            <td><%= rs.getString("o_id") %></td>
                            <td><%= rs.getString("p_id") %></td>
                            <td><%= rs.getString("u_id") %></td>
                            <td><%= rs.getString("o_quantity") %></td>
                            <td><%= rs.getString("o_date") %></td>
                            <td>
                                
                                <a href="orderAdmin.jsp?action=delete&o_id=<%= rs.getString("o_id") %>" onclick="return confirm('Are you sure you want to delete this user?')">Delete</a>
                            </td>
                           
                        </tr>
                        <%
                    }
                    con.close();
                } catch(Exception e) {
                    out.println(e);
                }
            %>
        </table>
    </div>
    
       
    
      <%
        // Handle Delete operation
        if (request.getParameter("action") != null && request.getParameter("action").equals("delete")) {
            String userId = request.getParameter("o_id");
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql", "root", "");
                PreparedStatement stmt = con.prepareStatement("DELETE FROM orders WHERE o_id = ?");
                stmt.setString(1, userId);
                int rowsDeleted = stmt.executeUpdate();
                con.close();
                response.sendRedirect("orderAdmin.jsp"); // Redirect back to users.jsp after deletion
            } catch (Exception e) {
                out.println(e);
            }
        }
    %>
    </body>
</html>
