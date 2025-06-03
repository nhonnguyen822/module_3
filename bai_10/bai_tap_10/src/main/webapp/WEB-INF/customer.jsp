<%--
  Created by IntelliJ IDEA.
  User: Acer
  Date: 6/3/2025
  Time: 9:01 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"></script>
</head>
<body class="container">
<h1 class="text-center text-danger"> Danh Sach Khach Hang
</h1>
<table class="table table-sm border border-success shadow text-center">
    <tr>
        <th>No</th>
        <th>
            Name
        </th>
        <th>
            BirthDay
        </th>
        <th>
           Address
        </th>
        <th>
           Avatar
        </th>
    </tr>
    <c:forEach var="customer" items="${customerList}" varStatus="idx">
        <tr>
            <td>${idx.count}</td>
            <td>${customer.name}</td>
            <td>${customer.birthDay}</td>
            <td>${customer.address}</td>
            <td>${customer.avatar}</td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
