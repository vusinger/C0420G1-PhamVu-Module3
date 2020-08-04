<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Products List</title>
</head>
<body>
<h1>Products</h1>
<p>
    <a href="/products?action=create">Create new product</a>
</p>
<p>
    <form action="/products" method="post">
        <p>Search Product :</p><input type="text" name="search">
        <input type="submit">
    </form>
</p>

<table border="1">
    <tr>
        <th>Product Name</th>
        <th>Price</th>
        <th>Description</th>
        <th>Maker</th>
        <th>Edit</th>
        <th>Delete</th>
    </tr>
    <c:forEach items='${requestScope.products}' var="product">
        <tr>
            <td><a href="/products?action=view&id=${product.productId}">${product.productName}</a></td>
            <td>${product.price}</td>
            <td>${product.desc}</td>
            <td>${product.maker}</td>
            <td><a href="/products?action=update&id=${product.productId}">update</a></td>
            <td><a href="/products?action=delete&id=${product.productId}">delete</a></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>