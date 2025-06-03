<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Calculator</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
    <form method="post" action="hello-servlet">
        <div class="mb-3">
            <label class="form-label">First operand</label>
            <input type="number" class="form-control" name="start">
        </div>
        <div class="mb-3">
            <select class="form-select" name="operator">
                <option value="add">ADD</option>
                <option value="minus">MIN</option>
                <option value="mul">MUL</option>
                <option value="div">DIV</option>
            </select>
        </div>
        <div class="mb-3">
            <label class="form-label">Last operand</label>
            <input type="number" class="form-control" name="end">
        </div>
        <button type="submit" class="btn btn-primary">Submit</button>
    </form>

    <c:if test="${empty message}">
        <h2>Result</h2>
        <p>${result}</p>
    </c:if>

    <c:if test="${not empty message}">
        <h2>Result</h2>
        <p>${message}</p>
    </c:if>
</div>
</body>
</html>
