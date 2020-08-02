<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Result</title>
</head>
<body>
<table border="solid 1px" style="border-collapse: collapse">
    <tr>
        <th>Name</th>
        <th>BirthDay</th>
        <th>Address</th>
        <th>Avatar</th>
    </tr>
    <c:forEach items="${requestScope.mylist}" var="customer">
        <tr>
            <td><c:out value="${customer.name}"></c:out></td>
            <td><c:out value="${customer.birthday}"></c:out></td>
            <td><c:out value="${customer.address}"></c:out></td>
            <td><img src="${customer.imageURL}" width="70" height="70"></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
