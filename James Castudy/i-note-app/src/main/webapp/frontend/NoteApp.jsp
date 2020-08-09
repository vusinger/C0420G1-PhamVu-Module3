<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>NoteApp</title>
    <link rel="stylesheet" href="../frontend/css/bootstrap.min.css">
    <link rel="stylesheet" href="../frontend/css/Mycss.css">
    <script src="../frontend/js/popper.min.js"></script>
    <script src="../frontend/js/jquery-3.2.1.slim.min.js"></script>
    <script src="../frontend/js/bootstrap.min.js"></script>
    <script src="../frontend/js/noteAppJs.js"></script>
</head>
<body>
<div class="container">
    <%--    row--%>
    <div class="row">
        <div class="col-md-4"></div>
        <c:if test="${requestScope.NewNote==null}">
            <div class="col-md-4">
                <form method="post" id="my-form" onsubmit="return isValidForm()">
                    <h3>Thêm mới ghi chú</h3>
                    <div class="form-group">
                        <label>Tiêu Đề</label>
                        <input type="text" class="form-control" name="title" id="titleCheck" placeholder="Tiêu Đề">
                        <p id="errorCheck"></p>
                    </div>
                    <div class="form-group">
                        <label>Nội Dung</label>
                        <textarea class="form-control" name="content" placeholder="Nội Dung" rows="4" cols="50"
                                  style="resize: none"></textarea>
                    </div>
                    <select class="input-group custom-select" name="selectType">
                        <option selected>Thể Loại</option>
                        <c:forEach items="${requestScope.ListType}" var="type">
                            <option value="${type.id}">${type.name}</option>
                        </c:forEach>
                    </select><br><br><br><br>
                    <div class="d-flex justify-content-center">
                        <button type="submit" class="btn btn-primary mr-3" >Lưu</button>
                        <a href="/ListNote" type="reset" class="btn btn-primary ml-3" onclick="resetError()">Hủy</a>
                    </div>
                </form>
            </div>
        </c:if>
        <c:if test="${requestScope.NewNote!=null}">
            <div class="col-md-4">
                <form method="post">
                    <h3>Sửa ghi chú</h3>
                    <div class="form-group">
                        <label style="font-weight: bold">Tiêu Đề</label>
                        <input type="text" class="form-control" name="title" value="${requestScope.NewNote.title}">
                    </div>
                    <div class="form-group">
                        <label style="font-weight: bold">Nội Dung</label>
                        <textarea class="form-control" name="content" rows="10" cols="50"
                                  style="resize: none">${requestScope.NewNote.content.trim()}</textarea>
                    </div>
                    <select class="input-group custom-select" name="selectType">
                        <c:forEach items="${requestScope.ListType}" var="type">
                            <c:if test="${requestScope.NewNote.typeId!=type.id}">
                                <option value="${type.id}">${type.name}</option>
                            </c:if>
                            <c:if test="${requestScope.NewNote.typeId==type.id}">
                                <option value="${type.id}" selected>${type.name}</option>
                            </c:if>
                        </c:forEach>
                    </select><br><br><br><br>
                    <div class="d-flex justify-content-center">
                        <button type="submit" class="btn btn-primary mr-3" >Lưu</button>
                        <a href="/ListNote" type="reset" class="btn btn-primary ml-3" onclick="resetError()">Hủy</a>
                    </div>
                </form>
            </div>
        </c:if>
        <div class="col-md-4"></div>

    </div>
    <%--    row--%>
</div>
</body>
</html>
