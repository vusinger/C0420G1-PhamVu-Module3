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
        <div class="col-3"></div>
        <div class="col-6">
            <div class="tab-pane d-flex justify-content-center"><h4>Thông Tin Khách Hàng</h4></div>
            <table class="table">
                <tbody>
                <tr>
                    <th scope="row">Họ Tên :</th>
                    <td> ${requestScope.CustomerDetail.name}</td>
                </tr>
                <tr>
                    <th scope="row">Ngày Sinh :</th>
                    <td>${requestScope.CustomerDetail.birthDay}</td>
                </tr>
                <tr>
                    <th scope="row">Giới Tính :</th>
                    <td>${requestScope.CustomerDetail.gender}</td>
                </tr>
                <tr>
                    <th scope="row">Số CMND :</th>
                    <td>${requestScope.CustomerDetail.idCard}</td>
                </tr>
                <tr>
                    <th scope="row">Số Điện Thoại :</th>
                    <td>${requestScope.CustomerDetail.phoneNumber}</td>
                </tr>
                <tr>
                    <th scope="row">Địa Chỉ mail :</th>
                    <td>${requestScope.CustomerDetail.email}</td>
                </tr>
                <tr>
                    <th scope="row">Địa Chỉ Nhà :</th>
                    <td>${requestScope.CustomerDetail.address}</td>
                </tr>
                <tr>
                    <th scope="row">Loại Khách :</th>
                    <td>
                        <c:forEach items="${requestScope.ListTypeCustomer}" var="type">
                            <c:if test="${type.key==requestScope.CustomerDetail.idCustomerType}">
                                ${type.value}
                            </c:if>
                        </c:forEach>
                    </td>
                </tr>
                </tbody>
            </table>
            <%--Back To List--%>
            <div class="d-flex justify-content-center">
                <a class="btn btn-primary " href="/HomePage?action=ListCustomer">Back</a>
                <a class="btn btn-primary ml-3" href="/HomePage?action=EditCustomer&&id=${requestScope.CustomerDetail.id}">Sửa</a>
                <!-- Modal -->
                <div class="modal fade" id="Modal${requestScope.CustomerDetail.id}" tabindex="-1"
                     aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Bạn có chắc muốn xóa
                                    không??</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <p><b>Họ Tên :</b>${requestScope.CustomerDetail.name}</p>
                                <p><b>Ngày Sinh:</b>${requestScope.CustomerDetail.birthDay}</p>
                                <p><b>Địa Chỉ:</b>${requestScope.CustomerDetail.address}</p>
                                <p><b>Số điện thoại:</b>${requestScope.CustomerDetail.phoneNumber}</p>
                                <p><b>Email:</b>${requestScope.CustomerDetail.email}</p>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy</button>
                                <a class="btn btn-primary" href="/HomePage?action=DeleteCustomer&&id=${requestScope.CustomerDetail.id}">Đồng Ý</a>
                            </div>
                        </div>
                    </div>
                </div>
                <button type="button" class="btn btn-primary ml-3" data-toggle="modal"
                        data-target="#Modal${requestScope.CustomerDetail.id}">
                    Xóa
                </button>
            </div>
        </div>
        <div class="col-3"></div>
    </div>
    <%--content--%>
</div>
</body>
</html>

