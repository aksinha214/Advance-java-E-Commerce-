<%-- 
    Document   : products
    Created on : 31-Mar-2024, 3:11:44 pm
    Author     : Ar Zo On
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
    <link rel="stylesheet" type="text/css" href="products.css">
    <title>E-Commerce Cart</title>
    </head>
    <body>
        <%@include file="/includes/navbar.jsp"%>
        
        <div class="container">
            Discover a World of Quality and Variety
At E-Commerce Cart, we pride ourselves on offering an extensive range of high-quality products to suit every need and taste. Whether you're looking for the latest tech gadgets, fashionable apparel, home essentials, or unique gifts, you'll find it all right here.
<i>What We Offer:</i><!-- comment -->
<br/>
1. <i>Electronics</i>:
Explore our collection of cutting-edge electronics, including smartphones, laptops, tablets, cameras, and accessories. Stay connected and ahead of the curve with the latest technology from top brands.
<br/>
2. <i>Fashion</i>:
Make a statement with our stylish and trendy fashion apparel and accessories. From casual wear to formal attire, we've got everything you need to elevate your wardrobe and express your personal style.
<br/>
3.<i> Home & Living</i>:
Transform your living space into a haven of comfort and style with our selection of home essentials and decor. Whether you're decorating a new home or updating your current space, we have the perfect pieces to suit your taste.
<br/>
4.<i> Beauty & Personal Care</i>:
Indulge in self-care and pampering with our range of beauty and personal care products. From skincare essentials to makeup must-haves, we've curated the best products to help you look and feel your best every day.
<br/>
5.<i> Toys & Games</i>:
Keep the fun going with our collection of toys and games for all ages. From educational toys for kids to board games for family game nights, we have something to entertain everyone.
<br>
6.<i> Sports & Outdoors</i>:
Stay active and explore the great outdoors with our selection of sports and outdoor gear. Whether you're a fitness enthusiast, an outdoor adventurer, or a weekend warrior, we have the gear you need to stay active and enjoy the great outdoors.
<br/>
<b>Shop with Confidence</b>:
<i>At  E-Commerce Cart, we are committed to providing you with a seamless and enjoyable shopping experience. With secure payment options, fast shipping, and responsive customer support, you can shop with confidence knowing that your satisfaction is our top priority.

    Browse our collection of products and find everything you need to live your best life. Happy shopping!</i>
        </div>
        
        <%@include file="/includes/footer.jsp"%>
    </body>
</html>
