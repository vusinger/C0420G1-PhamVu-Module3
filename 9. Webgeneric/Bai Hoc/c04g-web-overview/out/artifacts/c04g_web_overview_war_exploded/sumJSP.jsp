<%--
  Created by IntelliJ IDEA.
  User: pato2
  Date: 07/23/2020
  Time: 2:51 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String a = request.getParameter("num1");
    String b = request.getParameter("num2");
    double result = Double.parseDouble(a) + Double.parseDouble(b);
%>
<p style="color: violet"><%=result%></p>
</body>
</html>
