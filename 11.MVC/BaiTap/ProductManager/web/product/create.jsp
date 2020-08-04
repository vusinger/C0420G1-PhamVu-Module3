<head>
    <title>Create new product</title>
    <style>
        .message{
            color:green;
        }
    </style>
</head>
<body>
<h1>Create new product</h1>
<p>
    <c:if test='${requestScope["message"] != null}'>
        <span class="message">${requestScope["message"]}</span>
    </c:if>
</p>
<p>
    <a href="/products">Back to product list</a>
</p>
<p>
    <%
        if ( request.getAttribute("invalidProductName")==null) {
        } else if ( request.getAttribute("invalidProductName").equals("invalid")){
            out.print("ProductName First Letter must UpperCase");
        } else if ( request.getAttribute("invalidProductName").equals("valid")){
            out.print("Congratulation you create successfully product ");
        }
    %>
</p>
<form method="post">
    <fieldset>
        <legend>Products information</legend>
        <table>
            <tr>
                <td>Product Name: </td>
                <td><input type="text" name="productName"></td>
            </tr>
            <tr>
                <td>Product Price: </td>
                <td><input type="text" name="productPrice"></td>
            </tr>
            <tr>
                <td>Product Description: </td>
                <td><input type="text" name="productDesc"></td>
            </tr>
            <tr>
                <td>Product Maker: </td>
                <td><input type="text" name="productMaker"></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="Create Product"></td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>