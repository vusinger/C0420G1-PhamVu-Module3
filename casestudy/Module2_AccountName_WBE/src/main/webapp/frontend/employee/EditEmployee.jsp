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
        <div class="col-3">

        </div>
        <div class="col-6">
            <h1 class="d-flex justify-content-center">Sửa Thông Tin Nhân Viên</h1>
            <form method="post">
                <div class="form-group">
                    <label>Họ Tên Khách Hàng</label>
                    <input type="text" class="form-control" name="NameEmployee" value="${requestScope.EmployeeDetail.name}">
                </div>
                <div class="form-group">
                    <label>Ngày Tháng Năm Sinh</label>
                    <input class="form-control" type="date" name="BirthDayEmployee" value="${requestScope.EmployeeDetail.birthDay}">
                </div>
                <div class="form-group">
                    <label>Số Chứng Minh Nhân Dân</label>
                    <input type="text" class="form-control" name="IdCardEmployee" value="${requestScope.EmployeeDetail.idCard}">
                </div>

                <div class="form-group">
                    <label>Giới Tính</label>
                    <select class="custom-select" name="GenderEmployee">
                        <c:if test="${requestScope.EmployeeDetail.gender.equals('Nam')}">
                            <option value="Nam" selected>Nam</option>
                            <option value="Nữ">Nữ</option>
                            <option value="Không rõ">Không rõ</option>
                        </c:if>
                        <c:if test="${requestScope.EmployeeDetail.gender.equals('Nữ')}">
                            <option value="Nam">Nam</option>
                            <option value="Nữ" selected>Nữ</option>
                            <option value="Không rõ">Không rõ</option>
                        </c:if>
                        <c:if test="${requestScope.EmployeeDetail.gender.equals('Không rõ')}">
                            <option value="Nam">Nam</option>
                            <option value="Nữ">Nữ</option>
                            <option value="Không rõ" selected>Không rõ</option>
                        </c:if>
                    </select>
                </div>

                <div class="form-group">
                    <label>Lương Nhân Viên</label>
                    <input type="text" class="form-control" name="SalaryEmployee" value="${requestScope.EmployeeDetail.salary}">
                </div>
                <div class="form-group">
                    <label>Số Điện Thoại</label>
                    <input type="text" class="form-control" name="PhoneNumberEmployee" value="${requestScope.EmployeeDetail.phoneNumber}">
                </div>
                <div class="form-group">
                    <label>Địa Chỉ Email</label>
                    <input type="email" class="form-control" aria-describedby="emailHelp" name="EmailEmployee" value="${requestScope.EmployeeDetail.email}">
                    <small id="emailHelp" class="form-text text-muted">Chúng tôi sẽ không share email của bạn với
                        ai.</small>
                </div>

                <div class="form-group">
                    <label>Địa Chỉ Nhà</label>
                    <input type="text" class="form-control" name="AddressEmployee" value="${requestScope.EmployeeDetail.address}">
                </div>


                <div class="form-group">
                    <label>Vị Trí</label>
                    <select class="custom-select" name="PositionEmployee">
                        <c:forEach items="${requestScope.PositionEmployee}" var="listType">
                            <c:if test="${requestScope.EmployeeDetail.idPosition == listType.key}">
                                <option value="${listType.key}" selected>${listType.value}</option>
                            </c:if>
                            <c:if test="${requestScope.EmployeeDetail.idPosition != listType.key}">
                                <option value="${listType.key}">${listType.value}</option>
                            </c:if>
                        </c:forEach>
                    </select>
                </div>
                <div class="form-group">
                    <label>Trình Độ</label>
                    <select class="custom-select" name="LevelEmployee">
                        <c:forEach items="${requestScope.LevelEmployee}" var="listType">
                            <c:if test="${requestScope.EmployeeDetail.idLevel == listType.key}">
                                <option value="${listType.key}" selected>${listType.value}</option>
                            </c:if>
                            <c:if test="${requestScope.EmployeeDetail.idLevel != listType.key}">
                                <option value="${listType.key}">${listType.value}</option>
                            </c:if>
                        </c:forEach>
                    </select>
                </div>
                <div class="form-group">
                    <label>Bộ Phận</label>
                    <select class="custom-select" name="DepartmentEmployee">
                        <c:forEach items="${requestScope.DepartmentEmployee}" var="listType">
                            <c:if test="${requestScope.EmployeeDetail.idDepartment == listType.key}">
                                <option value="${listType.key}" selected>${listType.value}</option>
                            </c:if>
                            <c:if test="${requestScope.EmployeeDetail.idDepartment != listType.key}">
                                <option value="${listType.key}">${listType.value}</option>
                            </c:if>
                        </c:forEach>
                    </select>
                </div>
                <br>
                <div class="d-flex justify-content-center">
                    <a class="btn btn-primary mr-3" href="/Employee?action=ViewEmployee&&id=${requestScope.EmployeeDetail.id}">Back</a>
                    <button type="submit" class="btn btn-primary">Accept</button>
                </div>
            </form>
        </div>
        <div class="col-3">

        </div>
    </div>
</div>
</body>
</html>
