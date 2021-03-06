<%--&lt;%&ndash;--%>
<%--  Created by IntelliJ IDEA.--%>
<%--  User: dell--%>
<%--  Date: 5/31/2022--%>
<%--  Time: 1:57 PM--%>
<%--  To change this template use File | Settings | File Templates.--%>
<%--&ndash;%&gt;--%>
<%--<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<html>--%>
<%--<head>--%>
<%--    <title>Title</title>--%>
<%--</head>--%>
<%--<body>--%>
<%--<form method="post">--%>
<%--    <input type="text" name="name">--%>
<%--    <button>Tạo mới Class</button>--%>
<%--</form>--%>
<%--</body>--%>
<%--</html>--%>





<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
          integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
            integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF"
            crossorigin="anonymous"></script>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-12">
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <%--                <a class="navbar-brand" href="#">Navbar</a>--%>
                <%--                <button class="navbar-toggler" type="button" data-toggle="collapse"--%>
                <%--                        data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"--%>
                <%--                        aria-expanded="false" aria-label="Toggle navigation">--%>
                <%--                    <span class="navbar-toggler-icon"></span>--%>
                <%--                </button>--%>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item active">
                            <a class="nav-link" href="/home">Home <span class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/students?act=create">Add Student</a>
                        </li>
                    </ul>
                    <form class="form-inline my-2 my-lg-0" action="/home">
                        <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search" name="key">
                        <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
                    </form>
                </div>
            </nav>

        </div>
    </div>
    <div class="row">
        <div class="col-3 text-center">
            <h3 class="mb-3">Danh sách các lớp</h3>
            <c:forEach items='${classes}' var="cl">
                <h4><a href="/home?cID=${cl.id}">${cl.name}</a></h4>
            </c:forEach>
        </div>
        <div class="col-9">
            <h3 style="text-align: center">Thêm lớp mới</h3>
            <form method="post">
                <h5> Tên lớp </h5>
                <input class="form-control" type="text" name="name">
                <button class="btn btn-primary mt-2">Tạo mới Class</button>
            </form>
        </div>
    </div>
</div>
</body>
</html>
