<%-- 
    Document   : women
    Created on : Feb 23, 2024, 10:06:05 AM
    Author     : AR ZO ON
--%>
<%@page import="cn.techtutorial.connection.DbCon"%>
<%@page import="cn.techtutorial.dao.ProductDao"%>
<%@page import="cn.techtutorial.model.*"%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
User auth = (User) request.getSession().getAttribute("auth");
if (auth != null) {
    request.setAttribute("person", auth);
}
ProductDao pd = new ProductDao(DbCon.getConnection());
List<Product> products = pd.getWomenProducts();
ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
if (cart_list != null) {
        request.setAttribute("cart_list", cart_list);
}
%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="/includes/head.jsp"%>
        <link rel="stylesheet" type="text/css" href="includes/footer.css">
        <title>E-Commerce Cart</title>
        <style>
         h1{   padding: 10px;
    text-align: center;
    font-family: "Times New Roman", Times, serif;
    font-size: 50px;
    color: orange;
    display: flex;
    align-items: center;
     justify-content: center;}
        </style>
    </head>
    <body>
         <%@include file="/includes/navbar.jsp"%>
        
        
         <div class="container_search">
            <div class="card-header my-3">
                <b>All Products</b>
                <form action="" method="">
                    <div class="input-group my-3">
                        <input type="text" class="form-control" name="query" placeholder="Search Products">
                        <div class="input-group-append">
                            <button class="btn" type="submit">Search</button>
                        </div>
                    </div>
                </form>
                <b>Category</b>
                <div class="category">
                    
                    <a href="men.jsp" class="menu-item">Mens</a>
                    <a href="women.jsp" class="menu-item">Womens</a>
                    <a href="kid.jsp" class="menu-item">Kids</a>
                </div>
            </div>
             
             <h1>Women Collections</h1>
        
        <div class="row">
                <%
                if (!products.isEmpty()) {
                        for (Product p : products) {
                %>
                <div class="col-md-3 my-3">
                    <div class="card w-100">
                        <img class="card-img-top" src="product-images/<%=p.getImage() %>"
                             alt="Card image cap">
                        <div class="card-body">
                            <h5 class="card-title"><%=p.getName() %></h5>
                            <h6 class="price">Price: $<%=p.getPrice() %></h6>
                            <h6 class="category">Category: <%=p.getCategory() %></h6>
                            <div class="mt-3 d-flex justify-content-between">
                                <a class="btn btn-dark" href="add-to-cart?id=<%=p.getId()%>">Add to Cart</a> <a
                                    class="btn btn-primary" href="order-now?quantity=1&id=<%=p.getId()%>">Buy Now</a>
                            </div>
                        </div>
                    </div>
                </div>
                <%
                }
                } else {
                out.println("There is no proucts");
                }
                %>

            </div>
         <%@include file="/includes/footer.jsp"%>
    </body>
</html>
