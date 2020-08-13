<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Furama Resort Da Nang</title>
    <link rel="stylesheet" href="../frontend/bootstrap/bootstrap.min.css">
    <script src="../frontend/bootstrap/jquery-3.2.1.slim.min.js"></script>
    <script src="../frontend/bootstrap/popper.min.js"></script>
    <script src="../frontend/bootstrap/bootstrap.min.js"></script>
    <link rel="stylesheet" href="../frontend/css/background-css.css">
</head>
<body>
<div class="container">
    <%--header--%>
    <jsp:include page="header.jsp"></jsp:include>
    <%--menubar--%>
    <div class="row">
        <div class="col-12">
            <nav class="navbar navbar-expand-xl navbar-light bg-light">
                <div class="collapse navbar-collapse ml-5" id="navbarSupportedContent">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item active ml-5">
                            <a class="nav-link" href="#">Giới Thiệu <span class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item dropdown ml-5">
                            <a class="nav-link dropdown-toggle" href="#" role="button"
                               data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Nhân Viên
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="/Employee?action=AddEmployee">Thêm mới nhân viên</a>
                                <a class="dropdown-item" href="/Employee?action=ListEmployee">Hiển thị danh sách nhân
                                    viên</a>
                            </div>
                        </li>
                        <li class="nav-item dropdown ml-5">
                            <a class="nav-link dropdown-toggle" href="#" role="button"
                               data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Khách Hàng
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="/HomePage?action=AddCustomer">Thêm mới khách hàng</a>
                                <a class="dropdown-item" href="/HomePage?action=ListCustomer">Hiển thị danh sách khách
                                    hàng</a>
                                <a class="dropdown-item" href="/HomePage?action=ListCustomerUseService">Hiển thị danh sách khách
                                    hàng đang sử dụng dịch vụ</a>
                            </div>
                        </li>
                        <li class="nav-item ml-5">
                            <a class="nav-link" href="#">Dịch Vụ</a>
                        </li>
                        <li class="nav-item ml-5">
                            <a class="nav-link" href="#">Liên Hệ</a>
                        </li>
                    </ul>
                    <form class="form-inline my-2 my-lg-0">
                        <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                        <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
                    </form>
                </div>
            </nav>
        </div>
    </div>
    <hr>

    <%--content--%>
    <jsp:include page="content.jsp"></jsp:include>

    <%--footer--%>
    <jsp:include page="footer.jsp"></jsp:include>

</div>
</body>
</html>
