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
                <th>Product ID</th>
                <th>Name</th>
                <th>Category</th>
                <th>Price</th>
                <th>Image</th>
                <th>Action</th>
                
            </tr>
            <% 
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql", "root", "");
                    Statement stmt = con.createStatement();
                    ResultSet rs = stmt.executeQuery("SELECT * FROM products");

                    while(rs.next()) {
                        %>
                        <tr>
                            <td><%= rs.getString("id") %></td>
                            <td><%= rs.getString("name") %></td>
                            <td><%= rs.getString("category") %></td>
                            <td><%= rs.getString("price") %></td>
                            <td><%= rs.getString("image") %></td>
                            <td>
                                <a href="product.jsp?action=edit&id=<%= rs.getString("id") %>">Edit</a>
                                <a href="product.jsp?action=delete&id=<%= rs.getString("id") %>" onclick="return confirm('Are you sure you want to delete this user?')">Delete</a>
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
        // Handle Edit operation
        if (request.getParameter("action") != null && request.getParameter("action").equals("edit")) {
            String productId = request.getParameter("id");
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql", "root", "");
                PreparedStatement stmt = con.prepareStatement("SELECT * FROM products WHERE id = ?");
                stmt.setString(1, productId);
                ResultSet rs = stmt.executeQuery();
                if (rs.next()) {
    %>
                    <h2>Edit Products</h2>
                    <form method="post" action="editproduct.jsp">
                        <input type="hidden" name="id" value="<%= rs.getString("id") %>">
                        Name: <input type="text" name="name" value="<%= rs.getString("name") %>"><br>
                        Category: <input type="text" name="category" value="<%= rs.getString("category") %>"><br>
                        Price: <input type="text" name="price" value="<%= rs.getString("price") %>"><br>
                        Image: <input type="text" name="image" value="<%= rs.getString("image") %>"><br>
                       
                        <input type="submit" value="Update">
                    </form>
    <%
                }
                con.close();
            } catch (Exception e) {
                out.println(e);
            }
        }
    %>
    
      <%
        // Handle Delete operation
        if (request.getParameter("action") != null && request.getParameter("action").equals("delete")) {
            String userId = request.getParameter("id");
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql", "root", "");
                PreparedStatement stmt = con.prepareStatement("DELETE FROM products WHERE id = ?");
                stmt.setString(1, userId);
                int rowsDeleted = stmt.executeUpdate();
                con.close();
                response.sendRedirect("product.jsp"); // Redirect back to users.jsp after deletion
            } catch (Exception e) {
                out.println(e);
            }
        }
    %>
    </body>
</html>
