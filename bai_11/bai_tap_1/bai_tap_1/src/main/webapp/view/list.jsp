<%--
  Created by IntelliJ IDEA.
  User: Acer
  Date: 6/3/2025
  Time: 8:02 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/2.3.1/css/dataTables.dataTables.min.css">

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.datatables.net/2.3.1/js/dataTables.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js"></script>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

</head>
<body>
<div class="container container-section" id="contract-section">
    <h2 class="text-center mt-3 mb-4 text-danger">PRODUCTS MANAGEMENT</h2>
    <button class="btn btn-success mb-3" onclick="window.location.href='products?action=create'">
        <i class="fa fa-plus"></i> Create New Product
    </button>

    <form class="d-flex" role="search" method="post" action="products?action=search">
        <input class="form-control" type="search" placeholder="Search by name" name="search" aria-label="Search">
        <select name="manufacturer_id" class="form-control" aria-label="Search">
            <option value="${0}">-- Chọn giá thấp nhất --</option>
            <c:forEach items="${manufacturerList}" var="manufacturer">
                <option value="${manufacturer.id}"> ${manufacturer.name}</option>
            </c:forEach>
        </select>
        <button class="btn btn-outline-success" type="submit">Search</button>
    </form>

    <table class="table table-sm table-bordered text-center table-striped" id="tableProduct">
        <thead class="table-light">
        <tr>
            <th>NO</th>
            <th>Product Name</th>
            <th>Price</th>
            <th>ProductDescription</th>
            <th>ManufacturerName</th>
            <th>Action</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="product" items="${productsList}" varStatus="idx">
            <tr>
                <td>${idx.count}</td>
                <td>${product.name}</td>
                <td>${product.price}</td>
                <td>${product.productDescription}</td>
                <td>${product.hangSX}</td>
                <td>
                    <button class="btn btn-sm btn-warning btn-update me-1" data-bs-toggle="modal"
                            data-bs-target="#updateContractModal" onclick="updateInfo(${product.id})">
                        <i class="fa fa-edit"></i>
                    </button>
                    <button class="btn btn-sm btn-danger btn-delete" data-bs-toggle="modal"
                            data-id="${product.id}"
                            data-bs-target="#confirmDeleteModal"
                            onclick="deleteInfo('${product.id}','${product.name}')">
                        <i class="fa fa-trash"></i>
                    </button>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <div class="modal fade" id="confirmDeleteModal" tabindex="-1">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <form method="post" action="products?action=delete">
                    <div class="modal-header">
                        <h5 class="modal-title text-danger">Confirm Delete</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                    </div>
                    <div class="modal-body">
                        <input type="hidden" id="deleteProductId" name="deleteProductId">
                        Are you sure you want to delete product <span id="deleteProductName"></span> record?
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                        <button type="submit" id="confirmDeleteBtn" class="btn btn-danger">Yes, Delete</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <div class="modal fade" id="updateContractModal" tabindex="-1">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <form action="products?action=findIdCanUpdate" method="post">
                    <div class="modal-header">
                        <h5 class="modal-title">Confirm Update</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <input type="hidden" id="updateProductId" name="updateProductId">
                        Are you sure you want to update product record?
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary">Save changes</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
<script>
    function deleteInfo(id, name) {
        document.getElementById("deleteProductId").value = id;
        document.getElementById("deleteProductName").innerText = name;
    }

    function updateInfo(id) {
        document.getElementById("updateProductId").value = id;
    }

    $(document).ready(function () {
        $('#tableProduct').dataTable({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 2
        })
    })
</script>
</html>
