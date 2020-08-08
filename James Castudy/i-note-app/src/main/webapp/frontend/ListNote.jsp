<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>ListNote</title>
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
        <div class="col-md-2"></div>

        <div class="col-md-8">
            <h3 class="d-flex justify-content-center">Thêm mới ghi chú</h3>
            <form class="form-inline">
                <div class="input-group mb-2 mr-sm-2">
                    <select class="input-group custom-select">
                        <option selected>Thể Loại</option>
                        <option value="1">One</option>
                        <option value="2">Two</option>
                        <option value="3">Three</option>
                    </select>
                </div>
                <label class="sr-only" >Username</label>
                <div class="input-group mb-2 mr-sm-2" style="width: 350px">
                    <input type="text" class="form-control" placeholder="Search...">
                </div>
                <button type="submit" class="btn btn-primary mb-2">Search</button>
            </form>
            <table class="table">
                <thead>
                <tr>
                    <th scope="col"><a href="#">STT</a></th>
                    <th scope="col"><a href="#">Tiêu Đề</a></th>
                    <th scope="col"><a href="#">Phân Loại</a></th>
                    <th scope="col">#</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <th scope="row">1</th>
                    <td>Mark</td>
                    <td>Otto</td>
                    <td>@mdo</td>
                </tr>
                <tr>
                    <th scope="row">2</th>
                    <td>Jacob</td>
                    <td>Thornton</td>
                    <td>@fat</td>
                </tr>
                <tr>
                    <th scope="row">3</th>
                    <td>Larry</td>
                    <td>the Bird</td>
                    <td>@twitter</td>
                </tr>
                </tbody>
            </table>
        </div>

        <div class="col-md-2"></div>

    </div>
    <%--    row--%>
</div>
</body>
</html>
