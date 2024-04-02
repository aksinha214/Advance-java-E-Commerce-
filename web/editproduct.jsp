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
<%
    // Handle the form submission to update user details
    if (request.getMethod().equals("POST")) {
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String category = request.getParameter("category");
        String price = request.getParameter("price");
        String image = request.getParameter("image");
       
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql", "root", "");
            PreparedStatement stmt = con.prepareStatement("UPDATE products SET name=?, category=?, price=?, image=? WHERE id=?");
            stmt.setString(1, name);
            stmt.setString(2, category);
            stmt.setString(3, price);
            stmt.setString(4, image);
            stmt.setString(5, id);
            int rowsUpdated = stmt.executeUpdate();
            con.close();
            
            // Redirect back to users.jsp after successful update
            response.sendRedirect("product.jsp");
        } catch (Exception e) {
            out.println(e);
        }
    } else {
        // Display the edit form with user details for editing
        String userId = request.getParameter("id");
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql", "root", "");
            PreparedStatement stmt = con.prepareStatement("SELECT * FROM products WHERE id = ?");
            stmt.setString(1, userId);
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
</body>
</html>
