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
        String phone = request.getParameter("phone");
        String dob = request.getParameter("dob");
        String address = request.getParameter("address");
        String pincode = request.getParameter("pincode");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql", "root", "");
            PreparedStatement stmt = con.prepareStatement("UPDATE users SET name=?, phone=?, dob=?, address=?, pincode=?, email=?, password=? WHERE id=?");
            stmt.setString(1, name);
            stmt.setString(2, phone);
            stmt.setString(3, dob);
            stmt.setString(4, address);
            stmt.setString(5, pincode);
            stmt.setString(6, email);
            stmt.setString(7, password);
            stmt.setString(8, id);
            int rowsUpdated = stmt.executeUpdate();
            con.close();
            
            // Redirect back to users.jsp after successful update
            response.sendRedirect("users.jsp");
        } catch (Exception e) {
            out.println(e);
        }
    } else {
        // Display the edit form with user details for editing
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
</body>
</html>
