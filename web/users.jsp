<%@ page import="java.sql.*" %>
<%@ page import="java.io.*,java.util.*" %>

<%@ page contentType="text/html" pageEncoding="UTF-8"%>
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
        <a href="orderAdmin.jsp"><button type="orderAdmin" name="orderAdmin">Carts Details</button></a>
        <a href="orderAdmin.jsp"><button type="orderAdmin" name="orderAdmin">Orders Details</button></a>

    </div>
    <div>
        <table border="1">
            <tr>
                <th>User ID</th>
                <th>Name</th>
                <th>Phone</th>
                <th>DOB</th>
                <th>Address</th>
                <th>Pincode</th>
                <th>Email</th>
                <th>Password</th>
                <th>Action</th>
                <th>Cookies</th>
            </tr>
            <% 
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql", "root", "");
                    Statement stmt = con.createStatement();
                    ResultSet rs = stmt.executeQuery("SELECT * FROM users");

                    while(rs.next()) {
            %>
                        <tr>
                            <td><%= rs.getString("id") %></td>
                            <td><%= rs.getString("name") %></td>
                            <td><%= rs.getString("phone") %></td>
                            <td><%= rs.getString("dob") %></td>
                            <td><%= rs.getString("address") %></td>
                            <td><%= rs.getString("pincode") %></td>
                            <td><%= rs.getString("email") %></td>
                            <td><%= rs.getString("password") %></td>
                            
                            <td>
                                <a href="users.jsp?action=edit&id=<%= rs.getString("id") %>">Edit</a>
                                <a href="users.jsp?action=delete&id=<%= rs.getString("id") %>" onclick="return confirm('Are you sure you want to delete this user?')">Delete</a>
                            </td>
                            <td><a href="showcookie" >Click here</a></td>
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
            String userId = request.getParameter("id");
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql", "root", "");
                PreparedStatement stmt = con.prepareStatement("SELECT * FROM users WHERE id = ?");
                stmt.setString(1, userId);
                ResultSet rs = stmt.executeQuery();
                if (rs.next()) {
    %>
                    <h2>Edit User</h2>
                    <form method="post" action="editUser.jsp">
                        <input type="hidden" name="id" value="<%= rs.getString("id") %>">
                        Name: <input type="text" name="name" value="<%= rs.getString("name") %>"><br>
                        Phone: <input type="text" name="phone" value="<%= rs.getString("phone") %>"><br>
                        DOB: <input type="text" name="dob" value="<%= rs.getString("dob") %>"><br>
                        Address: <input type="text" name="address" value="<%= rs.getString("address") %>"><br>
                        Pincode: <input type="text" name="pincode" value="<%= rs.getString("pincode") %>"><br>
                        Email: <input type="text" name="email" value="<%= rs.getString("email") %>"><br>
                        Password: <input type="password" name="password" value="<%= rs.getString("password") %>"><br>
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
                PreparedStatement stmt = con.prepareStatement("DELETE FROM users WHERE id = ?");
                stmt.setString(1, userId);
                int rowsDeleted = stmt.executeUpdate();
                con.close();
                response.sendRedirect("users.jsp"); // Redirect back to users.jsp after deletion
            } catch (Exception e) {
                out.println(e);
            }
        }
    %>
</body>
</html>
