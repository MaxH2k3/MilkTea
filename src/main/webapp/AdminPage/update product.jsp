<%-- 
    Document   : dashboard
    Created on : Aug 13, 2023, 6:26:31 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<!doctype html>
<html lang="en">

    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <%@include file="Component/importCss.jsp" %>
        <title>Milk Tea Store</title>
    </head>

    <body>
        <!--wrapper-->
        <div class="wrapper">
            <!--sidebar wrapper -->
            <%@include file="Component/navigation.jsp" %>
            <!--end sidebar wrapper -->
            <!--start header -->
            <%@include file="Component/header.jsp" %>
            <!--end header -->
            <!--start page wrapper -->
            <div class="page-wrapper">
                <div class="page-content">

                    <!--breadcrumb-->
                    <div class="page-breadcrumb d-none d-sm-flex align-items-center mb-3">
                        <div class="breadcrumb-title pe-3">eCommerce</div>
                        <div class="ps-3">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb mb-0 p-0">
                                    <li class="breadcrumb-item"><a href="javascript:;"><i class="bx bx-home-alt"></i></a>
                                    </li>
                                    <li class="breadcrumb-item active" aria-current="page">Update Product</li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                    <!--end breadcrumb-->
                    <div class="card">
                        <div class="card-body p-4">
                            <div class="d-flex align-items-center">
                                <div>
                                    <h5 class="mb-1">Update Product</h5>
                                </div>
                                <div class="ms-auto">
                                    <form action="searchProductById" class="d-flex justify-content-between">
                                        <input name="searchValue" value="${param.searchValue}" class="form-control" placeholder="Search Product By Id" />
                                        <button class="form-icon"><i class="fa-solid fa-magnifying-glass"></i></button>
                                    </form>
                                </div>
                            </div>

                            <hr />
                            <c:set var="product" value="${requestScope.SEARCH_RESULT}" />
                            <form class="form-body mt-4" action="UpdateServlet" method="POST" enctype="multipart/form-data">
                                <input type="hidden" name="productId" value="${not empty param.productId ? param.productId : product.productId}" />
                                
                                <div class="row">
                                    <div class="col-lg-8">
                                        <div class="border border-3 p-4 rounded">
                                            <div class="mb-3">
                                                <label for="inputProductTitle" class="form-label">Product Name</label>
                                                <input type="text" class="form-control" id="inputProductTitle"
                                                       placeholder="Enter product title" name="name" value="${not empty param.productName ? param.productName : product.name}">
                                            </div>
                                            <div class="mb-3">
                                                <label for="inputProductDescription" class="form-label">Description</label>
                                                <textarea class="form-control" id="inputProductDescription"
                                                          rows="3" name="description">${not empty param.description ? param.description : product.description}</textarea>
                                            </div>
                                            <div class="mb-3">
                                                <div class="center">
                                                    <div class="form-input">
                                                        <div
                                                            class="preview d-flex justify-content-center flex-column align-items-center">
                                                            <label for="file-ip-1">Upload Image</label>
                                                            <input value="${param.file}" name="file" type="file" id="file-ip-1" accept="image/*"
                                                                   onchange="readURL(this);" >
                                                            <img id="file-ip-1-preview" src="data:image/jpeg;base64,${product.image}" alt="your image" style="display: block">
                                                        </div>          
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-4">
                                        <div class="border border-3 p-4 rounded">
                                            <div class="row g-3">
                                                <div class="col-md-6">
                                                    <label for="inputPrice" class="form-label">Price</label>
                                                    <input type="number" class="form-control" id="inputPrice" min="1"
                                                           max="999" maxlength="3" placeholder="000" name="price" value="${not empty param.price ? param.price : product.price}">
                                                </div>
                                                <div class="col-md-6">
                                                    <label for="inputCompareatprice" class="form-label">Satus</label>
                                                    <c:set var="status" value="${not empty param.status ? param.status : product.status}"/>
                                                    <select name="status" class="form-control">
                                                        <option value="true" ${status ? 'selected':''} >True</option>
                                                        <option value="false" ${not status ? 'selected':''} >False</option>
                                                    </select>
                                                </div>
                                                <div class="col-12">
                                                    <c:set var="categoryId" value="${not empty param.categoryId ? param.categoryId : product.categoryId}"/>
                                                    <label for="inputProductType" class="form-label">Product Type</label>
                                                    <select class="form-select" id="inputProductType" name="categoryId">                               
                                                        <c:forEach var="category" items="${requestScope.LIST_CATEGORIES}" >
                                                            <option value="${category.categoryId}" ${(category.categoryId eq categoryId) ? 'selected':''} >
                                                                ${category.name}
                                                            </option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                                <div class="col-12">
                                                    <div class="d-grid">
                                                        <button type="submit" class="btn btn-primary">Save Product</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!--end row-->
                            </form>
                        </div>
                    </div>

                </div>
            </div>
            <!--end page wrapper -->
            <!--start overlay-->
            <div class="overlay toggle-icon"></div>
            <!--end overlay-->
            <%@include file="Component/footer.jsp" %>
        </div>
        <!--end wrapper-->
        <!--start switcher-->
        <%@include file="Component/switcher.jsp" %>
        <!--end switcher-->
        <%@include file="Component/importJS.jsp" %>
        <!-- js code support -->
        <script>
            checkMaxDigit();
            function showPreview(event) {
                if (event.target.files.length > 0) {
                    var src = URL.createObjectURL(event.target.files[0]);
                    var preview = document.getElementById("file-ip-1-preview");
                    preview.src = src;
                    preview.style.display = "block";
                }
            }
            function checkMaxDigit() {
                let inputNums = document.getElementById("inputPrice");
                inputNums.addEventListener("input", () => {
                    if (inputNums.value.length >= 3) {
                        inputNums.value = inputNums.value.slice(0, 3);
                    }
                    if (inputNums.value <= -1) {
                        inputNums.value = 0;
                    }
                });
            }

            function readURL(input) {
                if (input.files && input.files[0]) {
                    var reader = new FileReader();

                    reader.onload = function (e) {
                        $('#file-ip-1-preview')
                                .attr('src', e.target.result)
                                .css('display', 'block');

                    };

                    reader.readAsDataURL(input.files[0]);
                    console.log("ok");
                }
            }
        </script>

        <script>
            <c:set var="notification" value="${requestScope.NOTIFICATION}" />
            <c:if test="${not empty notification}" >
            $(document).ready(function () {
                toastr.options = {
                    "closeButton": true,
                    "debug": true,
                    "newestOnTop": true,
                    "progressBar": true,
                    "positionClass": "toast-top-center",
                    "preventDuplicates": true,
                    "onclick": null,
                    "showDuration": "300",
                    "hideDuration": "1000",
                    "timeOut": "5000",
                    "extendedTimeOut": "1000",
                    "showEasing": "swing",
                    "hideEasing": "linear",
                    "showMethod": "fadeIn",
                    "hideMethod": "fadeOut"
                }
                <c:if test="${notification.result}">
                toastr["success"]("${notification.message}");
                </c:if>
                <c:if test="${not notification.result}">
                toastr["error"]("${notification.message}");
                </c:if>

            });
            </c:if>

        </script>

    </body>

</html>
