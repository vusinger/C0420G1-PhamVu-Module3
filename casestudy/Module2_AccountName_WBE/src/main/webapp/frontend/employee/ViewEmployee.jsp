<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>AddNewEmployee</title>
    <link rel="stylesheet" href="../frontend/bootstrap/bootstrap.min.css">
    <script src="../frontend/bootstrap/jquery-3.2.1.slim.min.js"></script>
    <script src="../frontend/bootstrap/popper.min.js"></script>
    <script src="../frontend/bootstrap/bootstrap.min.js"></script>
    <link rel="stylesheet" href="../frontend/css/background-css.css">
</head>
<body class="bg" style="background-image: url('../frontend/img/employee.jpg')">
<div class="container">
    <%--header--%>
    <jsp:include page="../header.jsp"></jsp:include>

    <%--content--%>
    <div class="row">
        <div class="col-3"></div>
        <div class="col-6">
            <div class="tab-pane d-flex justify-content-center"><h4>Thông Tin Nhân Viên</h4></div>
            <table class="table">
                <tbody>
                <tr>
                    <th scope="row">Họ Tên :</th>
                    <td> ${requestScope.EmployeeDetail.name}</td>
                </tr>
                <tr>
                    <th scope="row">Ngày Sinh :</th>
                    <td>${requestScope.EmployeeDetail.birthDay}</td>
                </tr>
                <tr>
                    <th scope="row">Giới Tính :</th>
                    <td>${requestScope.EmployeeDetail.gender}</td>
                </tr>
                <tr>
                    <th scope="row">Lương Nhân Viên:</th>
                    <td>${requestScope.EmployeeDetail.salary}</td>
                </tr>
                <tr>
                    <th scope="row">Số CMND :</th>
                    <td>${requestScope.EmployeeDetail.idCard}</td>
                </tr>
                <tr>
                    <th scope="row">Số Điện Thoại :</th>
                    <td>${requestScope.EmployeeDetail.phoneNumber}</td>
                </tr>
                <tr>
                    <th scope="row">Địa Chỉ mail :</th>
                    <td>${requestScope.EmployeeDetail.email}</td>
                </tr>
                <tr>
                    <th scope="row">Địa Chỉ Nhà :</th>
                    <td>${requestScope.EmployeeDetail.address}</td>
                </tr>
                <tr>
                    <th scope="row">Vị Trí:</th>
                    <td>
                        ${requestScope.EmployeeDetail.namePosition}
                    </td>
                </tr>
                <tr>
                    <th scope="row">Trình Độ:</th>
                    <td>
                        ${requestScope.EmployeeDetail.nameLevel}
                    </td>
                </tr>
                <tr>
                    <th scope="row">Bộ Phận:</th>
                    <td>
                        ${requestScope.EmployeeDetail.nameDepartment}
                    </td>
                </tr>
                </tbody>
            </table>
            <%--Back To List--%>
            <div class="d-flex justify-content-center">
                <a class="btn btn-primary " href="/Employee?action=ListEmployee">Back</a>
                <a class="btn btn-primary ml-3" href="/Employee?action=EditEmployee&&id=${requestScope.EmployeeDetail.id}">Sửa</a>
                <!-- Modal -->
                <div class="modal fade" id="Modal${requestScope.EmployeeDetail.id}" tabindex="-1"
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
                                <p><b>Họ Tên :</b>${requestScope.EmployeeDetail.name}</p>
                                <p><b>Ngày Sinh:</b>${requestScope.EmployeeDetail.birthDay}</p>
                                <p><b>Địa Chỉ:</b>${requestScope.EmployeeDetail.address}</p>
                                <p><b>Số điện thoại:</b>${requestScope.EmployeeDetail.phoneNumber}</p>
                                <p><b>Email:</b>${requestScope.EmployeeDetail.email}</p>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy</button>
                                <a class="btn btn-primary" href="/Employee?action=DeleteEmployee&&id=${requestScope.EmployeeDetail.id}">Đồng Ý</a>
                            </div>
                        </div>
                    </div>
                </div>
                <button type="button" class="btn btn-primary ml-3" data-toggle="modal"
                        data-target="#Modal${requestScope.EmployeeDetail.id}">
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

