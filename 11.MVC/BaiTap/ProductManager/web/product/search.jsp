<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Products List</title>
</head>
<body>
<h1>Products</h1>
<p>
    <a href="/products">Back to product list</a>
</p>
<table border="1">
    <tr>
        <th>Product Name</th>
    </tr>
    <c:forEach items='${requestScope.searchProduct}' var="product">
        <tr>
            <td>${product.toString()}</td>
        </tr>
    </c:forEach>
</table>
</body>
</html>