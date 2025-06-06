<%--
  Created by IntelliJ IDEA.
  User: Acer
  Date: 6/4/2025
  Time: 12:50 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
</head>
<body>
<div class="container mt-4">
    <form method="post" action="products?action=create" class="needs-validation" id="contractForm">
        <div class="mb-3">
            <label class="form-label">ProductName</label>
            <div style="display: flex">
                <input type="text" class="form-control me-3" name="productName" id="productName"
                       onblur="checkValidate()">
                <span id="productNameTick"></span>
            </div>
        </div>
        <p id="productNameError"></p>
        <div class="mb-3">
            <label class="form-label">Price</label>
            <div style="display: flex">
                <input type="number" class="form-control" name="productPrice" required id="productPrice"
                       onblur="checkValidate()">
                <span id="productPriceTick" class="ms-3"></span>
            </div>
        </div>
        <p id="productPriceError"></p>

        <div class="mb-3">
            <label class="form-label">ProductDescription</label>
            <div style="display: flex">
                <input type="text" class="form-control me-3" name="productDescription" required id="productDescription"
                       onblur="checkValidate()">
                <span id="productDescriptionTick"></span>
            </div>
        </div>
        <p id="productDescriptionError"></p>
        <div class="mb-3 form-label">
            <label class="form-label">ManufacturerName</label>
            <select class="form-control" name="manufacturerId" required id="manufacturerId">
                <c:forEach items="${manufacturerList}" var="manufacturer">
                    <option value="${manufacturer.id}">${manufacturer.name}</option>
                </c:forEach>
            </select>
        </div>
        <button type="submit" class="btn btn-primary">Submit</button>
    </form>
</div>

</body>
<script>
    function checkValidate() {
        let productName = document.getElementById("productName").value;
        let productPrice = document.getElementById("productPrice").value;
        let productDescription = document.getElementById("productDescription").value;
        let productNameRegex = /^[A-Z][a-z]*(\s[A-Z][a-z]*)*$/

        if (productName === "") {
            showError("productName", "không đươc để chỗ trống");
        } else if (!productNameRegex.test(productName)) {
            showError("productName", "Phai Viet Hoa Ky Tu Dau Tien vd:Nguyen Van A");
        } else {
            showSuccess("productName");
        }

        if (productPrice === "") {
            showError("productPrice", "không đươc để chỗ trống");
        } else if (productPrice<=0) {
            showError("productPrice", "Gia San Pham Khong Duoc Nho Hon Khong");
        } else {
            showSuccess("productPrice");
        }

        if (productDescription === "") {
            showError("productDescription", "không đươc để chỗ trống");
        }if(productDescription.split("").length<5){
            showError("productDescription", "Mo ta san pham phai lon hon 5 tu");
        } else {
            showSuccess("productDescription");
        }
        if(productName==="" || productPrice==="" || productDescription===""){

        };
    }

    function showError(field, message) {
        document.getElementById(field + "Error").innerText = message;
        document.getElementById(field + "Tick").innerHTML = `<i class="fa-solid fa-xmark"></i>`
        document.getElementById(field + "Tick").style.color = 'red'
        document.getElementById(field + "Error").style.color = 'red'
    }

    function showSuccess(field) {
        document.getElementById(field + "Error").innerText = "";
        document.getElementById(field + "Tick").innerHTML = `<i class="fa-solid fa-check"></i>`
        document.getElementById(field + "Tick").style.color = 'green'
    }
</script>
</html>
