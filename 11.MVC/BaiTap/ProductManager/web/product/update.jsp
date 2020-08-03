<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit product</title>
</head>
<body>
<h1>Edit products</h1>
<p>
    <c:if test='${requestScope["message"] != null}'>
        <span class="message">${requestScope["message"]}</span>
    </c:if>
</p>
<p>
    <a href="/products">Back to product list</a>
</p>
<form method="post">
    <fieldset>
        <legend>Product Information</legend>
        <table>
            <tr>
                <td>Product Name: </td>
                <td><input type="text" name="productName" value="${requestScope.products.productName}"></td>
            </tr>
            <tr>
                <td>Product Price: </td>
                <td><input type="text" name="productPrice" value="${requestScope.products.price}"></td>
            </tr>
            <tr>
                <td>Product Description: </td>
                <td><input type="text" name="productDesc" value="${requestScope.products.desc}"></td>
            </tr>
            <tr>
                <td>Product Maker: </td>
                <td><input type="text" name="productMaker" value="${requestScope.products.maker}"></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="Update product"></td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>