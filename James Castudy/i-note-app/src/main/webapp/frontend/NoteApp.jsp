<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>NoteApp</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/Mycss.css">
    <script src="js/popper.min.js"></script>
    <script src="js/jquery-3.2.1.slim.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
    <%--    row--%>
    <div class="row">
        <div class="col-md-4"></div>

        <div class="col-md-4">
            <form action="/login" method="post">
                <h1>Thêm mới ghi chú</h1>
                <div class="form-group">
                    <label>Tiêu Đề</label>
                    <input type="text" class="form-control" name="title" placeholder="Tiêu Đề">
                </div>
                <div class="form-group">
                    <label>Nội Dung</label>
                    <textarea class="form-control" name="content" placeholder="Nội Dung" rows="4" cols="50" style="resize: none"></textarea>
                </div>
                <button type="submit" class="btn btn-primary">Lưu</button>
                <button type="reset" class="btn btn-primary">Hủy</button>
            </form>
        </div>

        <div class="col-md-4"></div>

    </div>
    <%--    row--%>
</div>
</body>
</html>
