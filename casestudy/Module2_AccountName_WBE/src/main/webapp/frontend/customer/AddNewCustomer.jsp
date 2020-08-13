<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>AddNewCustomer</title>
    <link rel="stylesheet" href="../frontend/bootstrap/bootstrap.min.css">
    <script src="../frontend/bootstrap/jquery-3.2.1.slim.min.js"></script>
    <script src="../frontend/bootstrap/popper.min.js"></script>
    <script src="../frontend/bootstrap/bootstrap.min.js"></script>
    <link rel="stylesheet" href="../frontend/css/background-css.css">
</head>
<body class="bg" style="background-image: url('../frontend/img/resort-detail.jpg')">
<div class="container">
    <%--header--%>
    <jsp:include page="../header.jsp"></jsp:include>

    <%--content--%>
    <div class="row">
        <div class="col-3">

        </div>
        <div class="col-6">
            <h1 class="d-flex justify-content-center">Thêm Mới Khách Hàng</h1>
            <form method="post">
                <div class="form-group">
                    <label>Họ Tên Khách Hàng</label>
                    <input type="text" class="form-control" name="NameCustomer">
                </div>
                <div class="form-group">
                    <label>Ngày Tháng Năm Sinh</label>
                    <input class="form-control" type="date" name="BirthDayCustomer">
                </div>
                <div class="form-group">
                    <label>Giới Tính</label>
                    <select class="custom-select" name="GenderCustomer">
                        <option value="Nam">Nam</option>
                        <option value="Nữ">Nữ</option>
                        <option value="Không rõ">Không rõ</option>
                    </select>
                </div>
                <div class="form-group">
                    <label>Số Chứng Minh Nhân Dân</label>
                    <input type="text" class="form-control" name="IdCardCustomer">
                </div>
                <div class="form-group">
                    <label>Địa Chỉ Nhà</label>
                    <input type="text" class="form-control" name="AddressCustomer">
                </div>
                <div class="form-group">
                    <label>Số Điện Thoại</label>
                    <input type="text" class="form-control" name="PhoneNumberCustomer">
                </div>
                <div class="form-group">
                    <label>Địa Chỉ Email</label>
                    <input type="email" class="form-control" aria-describedby="emailHelp" name="EmailCustomer">
                    <small id="emailHelp" class="form-text text-muted">Chúng tôi sẽ không share email của bạn với
                        ai.</small>
                </div>
                <div class="form-group">
                    <label>Loại Khách</label>
                    <select class="custom-select" name="TypeCustomer">
                        <c:forEach items="${requestScope.ListTypeCustomer}" var="listType">
                            <option value="${listType.key}">${listType.value}</option>
                        </c:forEach>
                    </select>
                </div>
                <br>
                <div class="d-flex justify-content-center">
                    <button type="submit" class="btn btn-primary">Thêm Khách Hàng</button>
                </div>
            </form>
        </div>
        <div class="col-3">

        </div>
    </div>
</div>
</body>
</html>
