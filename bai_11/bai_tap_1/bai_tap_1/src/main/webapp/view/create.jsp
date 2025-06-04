<%--
  Created by IntelliJ IDEA.
  User: Acer
  Date: 6/4/2025
  Time: 12:50 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
</head>
<body>

<form method="post" action="products?action=create">
    <div class="mb-3">
        <label class="form-label">ProductName</label>
        <input type="text" class="form-control" name="productName">
        <div class="form-text">....</div>
    </div>
    <div class="mb-3">
        <label class="form-label">Price</label>
        <input type="number" class="form-control" name="productPrice">
        <div class="form-text">....</div>
    </div>
    <div class="mb-3">
        <label class="form-label">ProductDescription</label>
        <input type="text" class="form-control" name="productDescription">
    </div>
    <div class="mb-3 form-label">
        <label class="form-label">manufacturer</label>
        <input type="text" class="form-control" name="manufacturer">
    </div>
    <button type="submit" class="btn btn-primary">Submit</button>
</form>
</body>
</html>
