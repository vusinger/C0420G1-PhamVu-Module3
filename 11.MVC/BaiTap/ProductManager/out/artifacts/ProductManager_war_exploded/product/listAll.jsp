<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Customer List</title>
</head>
<body>
<h1>Customers</h1>
<p>
    <a href="/product?action=create">Create new product</a>
</p>
<table border="1">
    <tr>
        <th>Name</th>
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
            <td><a href="/customers?action=edit&id=${product.productId}">edit</a></td>
            <td><a href="/customers?action=delete&id=${customer.productId}">delete</a></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>