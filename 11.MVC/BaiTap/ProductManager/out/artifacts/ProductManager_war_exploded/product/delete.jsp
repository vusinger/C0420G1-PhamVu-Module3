<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Deleting customer</title>
</head>
<body>
<h1>Delete customer</h1>
<p>
    <a href="/products">Back to customer list</a>
</p>
<form method="post">
    <h3>Are you sure?</h3>
    <fieldset>
        <legend>Customer information</legend>
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
            <tr>
                <td><input type="submit" value="Delete customer"></td>
                <td><a href="/customers">Back to customer list</a></td>
            </tr>
        </table>
    </fieldset>
</body>
</html>