<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>ListNote</title>
    <link rel="stylesheet" href="../frontend/css/bootstrap.min.css">
    <link rel="stylesheet" href="../frontend/css/Mycss.css">
    <script src="../frontend/js/popper.min.js"></script>
    <script src="../frontend/js/jquery-3.2.1.slim.min.js"></script>
    <script src="../frontend/js/bootstrap.min.js"></script>
    <script src="../frontend/js/noteAppJs.js"></script>
</head>
<body>
<br><br>
<div class="container">
    <%--    row--%>
    <div class="row">
        <div class="col-md-2"></div>
        <div class="col-md-8">
            <h1 class="d-flex justify-content-center">Thêm mới ghi chú</h1>
            <br><br>
            <form id="myform"><input type="text" name="selectValue" id="selectValue" style="display: none"></form>
            <form class="form-inline">
                <div class="input-group mb-2 mr-sm-2">
                    <a class="btn btn-primary" href="/ListNote?action=create">Create New Note</a>
                </div>
                <div class="input-group mb-2 mr-sm-2">
                    <select class="input-group custom-select" id="selectCustom" onchange="sendRequest()">
                        <option selected>Thể Loại</option>
                        <c:forEach items="${requestScope.ListType}" var="type">
                            <c:if test="${requestScope.SelectType.equals(type.id)}">
                                <option value="${type.id}" selected>${type.name}</option>
                            </c:if>
                            <c:if test="${!requestScope.SelectType.equals(type.id)}">
                                <option value="${type.id}">${type.name}</option>
                            </c:if>
                        </c:forEach>
                    </select>
                </div>
                <div class="input-group mb-2 mr-sm-2 " style="width: 350px">
                    <form method="get">
                        <input type="text" name="search" class="form-control w-70 ml-2" placeholder="Search...">
                        <button class="btn btn-primary ml-3">Search</button>
                    </form>
                </div>
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
                <c:forEach items="${requestScope.ListNote}" var="note">
                    <tr>
                        <th scope="row">${note.id}</th>
                        <td  class="w-30 p-3"><a href="/ListNote?action=view&id=${note.id}">${note.title}</a></td>
                        <c:forEach items="${requestScope.ListType}" var="type">
                            <c:if test="${type.id==note.typeId}">
                                <td class="w-25 p-3">${type.name}</td>
                            </c:if>
                        </c:forEach>
                        <td class="w-25 p-3">
                            <a class="btn btn-primary" href="/ListNote?action=edit&id=${note.id}">Sửa</a>
                            <!-- Modal -->
                            <div class="modal fade" id="Modal${note.id}" tabindex="-1"
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
                                            <h3>${note.id}.${note.title}</h3>
                                            <h3>Content</h3>
                                            <p>${note.content}</p>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy</button>
                                            <a class="btn btn-primary" href="/ListNote?action=delete&id=${note.id}">Đồng Ý</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <button type="button" class="btn btn-primary" data-toggle="modal"
                                    data-target="#Modal${note.id}">
                                Xóa
                            </button>
                        </td>
                    </tr>
                </c:forEach>

                </tbody>
            </table>
        </div>

        <div class="col-md-2"></div>

    </div>
    <%--    row--%>
</div>
</body>
</html>
