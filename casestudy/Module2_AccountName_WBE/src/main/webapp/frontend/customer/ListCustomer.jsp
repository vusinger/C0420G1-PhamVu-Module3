<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>ListCustomer</title>
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
        <div class="col-2">

        </div>
        <div class="col-8">
            <h1 class="d-flex justify-content-center text-info mr-5">Danh Sách Khách Hàng</h1>
            <br>
            <form class="form-inline">
                <label class="sr-only">Name</label>
                <input name="search" type="text" class="form-control mb-2 mr-sm-2 w-75 ml-3" placeholder="Search..." value="${requestScope.Search}">
                <button type="submit" class="btn btn-primary mb-2 ml-3">Search</button>
            </form>
            <table class="table">
                <thead>
                <tr>
                    <th scope="col">No.</th>
                    <th scope="col">Họ Tên</th>
                    <th scope="col">Năm Sinh</th>
                    <th scope="col">Địa Chỉ</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${requestScope.ListCustomer}" var="customer">
                    <tr>
                        <th scope="row">${customer.id}</th>
                        <td>
                            <a style="text-decoration: none" href="/HomePage?action=ViewCustomer&&id=${customer.id}">
                                    ${customer.name}
                            </a>
                        </td>
                        <td>${customer.birthDay}</td>
                        <td>${customer.address}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <nav aria-label="Page navigation example">
                <ul class="pagination d-flex justify-content-center">
                    <li class="page-item"><a class="page-link"
                                             href="/HomePage?action=ListCustomer&next=false&search=${requestScope.Search}">Previous</a></li>
                    <li class="page-item"><a class="page-link ml-3"
                                             href="/HomePage?action=ListCustomer&next=true&search=${requestScope.Search}">&nbsp;&nbsp;&nbsp;Next&nbsp;&nbsp;&nbsp;</a>
                    </li>
                </ul>
            </nav>
        </div>
        <div class="col-2">

        </div>
    </div>
</div>
</body>
</html>