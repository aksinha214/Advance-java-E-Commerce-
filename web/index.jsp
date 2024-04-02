<%@page import="cn.techtutorial.connection.DbCon"%>
<%@page import="cn.techtutorial.dao.ProductDao"%>
<%@page import="cn.techtutorial.model.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
         
<%
// Importing necessary classes
User auth = (User) request.getSession().getAttribute("auth");
if (auth != null) {
    request.setAttribute("person", auth);
}

// Creating ProductDao instance and getting all products
ProductDao pd = new ProductDao(DbCon.getConnection());
List<Product> products = pd.getAllProducts();

// Retrieving cart items
ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
if (cart_list != null) {
    request.setAttribute("cart_list", cart_list);
}

// Handling search functionality
String searchQuery = request.getParameter("query");
if (searchQuery != null && !searchQuery.isEmpty()) {
    // Filtering products by name
    List<Product> searchResults = pd.getProductsByName(searchQuery);
    if (!searchResults.isEmpty()) {
        products = searchResults; // Updating products list with search results
    } else {
        out.println("No products found for the search query: " + searchQuery);
    }
}
%>

<!DOCTYPE html>
<html>
<head>
    <%@include file="/includes/head.jsp"%>
    <link rel="stylesheet" type="text/css" href="includes/footer.css">
    <title>E-Commerce Cart</title>
</head>
<body>
    <%@include file="/includes/navbar.jsp"%>

    <div class="container_search">
        <div class="card-header my-3">
            <b>All Products</b>
            <form action="" method="GET"> <!-- Modified form action to point to the same page with GET method -->
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
            <div class='hero'>
                <div class="hero-left">
                    <h2>NEW ARRIVALS ONLY</h2>
                    <div>
                        <div>
                            <div class="hero-hand-icon">
                                <p>new</p>
                                <img src="product-images/hand_icon" alt="" />
                            </div>
                            <p>collection</p>
                            <p>for everyone</p>
                        </div>
                        <div class="hero-latest-btn">
                            <div>Latest Collection</div>
                            <img src="product-images/arrow.jpg" alt="" />
                        </div>
                    </div>
                </div>
                <div class="hero-right">
                    <img src="product-images/poster.jpg" alt="" />

                </div>
                        </div>
        <div class="row">
            <% // Displaying products
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
                            <a class="btn btn-dark" href="add-to-cart?id=<%=p.getId()%>">Add to Cart</a>
                            <a class="btn btn-primary" href="order-now?quantity=1&id=<%=p.getId()%>">Buy Now</a>
                        </div>
                    </div>
                </div>
            </div>
            <% } } else { // Displaying message if no products found %>
            <div class="col-md-12">
                <p>No products found.</p>
            </div>
            <% } %>
        </div>
    </div>

    <%@include file="/includes/footer.jsp"%>
</body>
</html>
