<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>View product</title>
</head>
<body>
<h1>Product details</h1>
<p>
    <a href="/products">Back to product list</a>
</p>
<table>
    <tr>
        <td>Product Name: </td>
        <td>${requestScope.products.productName}</td>
    </tr>
    <tr>
        <td>Product Price: </td>
        <td>${requestScope.products.price}</td>
    </tr>
    <tr>
        <td>Product Description: </td>
        <td>${requestScope.products.desc}</td>
    </tr>
    <tr>
        <td>Product Maker: </td>
        <td>${requestScope.products.maker}</td>
    </tr>
</table>
</body>
</html>