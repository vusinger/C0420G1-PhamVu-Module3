<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Note</title>
    <link rel="stylesheet" href="../frontend/css/bootstrap.min.css">
    <link rel="stylesheet" href="../frontend/css/mycss.css">
    <script src="../frontend/js/popper.min.js"></script>
    <script src="../frontend/js/jquery-3.2.1.slim.min.js"></script>
    <script src="../frontend/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="../frontend/css/NoteCss.css">
</head>
<body class="container-fluid bg" style="background-image: url('../frontend/img/background.jpg')">
<br><br><br><br><br>
<div class="coupon">
    <div class="container">
        <h3 class="d-flex justify-content-center">Ghi Chú</h3>
    </div>
    <div class="container" style="background-color:white">
        <h2 class="d-flex justify-content-center"><b>${requestScope.ViewNote.title}</b></h2>
        <p>
            ${requestScope.ViewNote.content}
        </p>
        <div class="d-flex justify-content-center">
            <a href="/ListNote?action=edit&id=${requestScope.ViewNote.id}" class="btn btn-primary ml-3"> Sửa</a>
            <a href="/ListNote?action=delete&id=${requestScope.ViewNote.id}" class="btn btn-primary ml-3"> Xóa</a>
            <a href="/ListNote" class="btn btn-primary ml-3"> Hủy</a>
        </div>
    </div>
</div>
</body>
</html>
