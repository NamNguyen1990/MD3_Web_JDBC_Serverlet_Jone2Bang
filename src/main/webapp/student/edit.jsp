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
            <h3 class="mb-3">Danh sa??ch ca??c l????p</h3>
            <c:forEach items='${classes}' var="cl">
                <h4><a href="/home?cID=${cl.id}">${cl.name}</a></h4>
            </c:forEach>
        </div>
        <div class="col-9">
            <h3 style="text-align: center">S????a th??ng tin sinh vi??n</h3>
            <table class="table table-dark mt-3">
                <tr>
<%--                    <th>${student.name}</th>--%>
<%--                    <td>${student.age}</td>--%>
<%--                    <td>${student.clazz.name}</td>--%>
                    <td>
                        <form method="post">
                            <h5> T??n </h5>
                            <input type="text" name="name" value="${student.name}">
                            <h5> Tu????i </h5>
                            <input type="number" name="age" value="${student.age}">
                            <%--                    <input --%>
                            <%--                            type="text" name="clazz" value="${student.clazz.name}">--%>
                            <h5> L????p </h5>
                            <select class="form-control" name="cID">
                                <c:forEach items='${classes}' var="cl">
                                    <option value="${cl.id}">${cl.name}</option>
                                </c:forEach>
                            </select>
                            <button class="btn btn-danger mt-2"> Update</button>
                        </form>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
</html>