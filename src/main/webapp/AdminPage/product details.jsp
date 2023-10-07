<%-- 
    Document   : product details
    Created on : Aug 19, 2023, 7:53:56 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
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
                    <div class="row">
                        <div class="col">
                            <div class="card radius-10 mb-0">
                                <div class="card-body">
                                    <div class="d-flex align-items-center">
                                        <div>
                                            <h5 class="mb-1">Product details</h5>
                                        </div>
                                        <div class="ms-auto">
                                            <form action="searchServlet" class="d-flex justify-content-between">
                                                <input name="searchValue" value="${param.searchValue}" class="form-control" placeholder="Search Product" />
                                                <button class="form-icon"><i class="fa-solid fa-magnifying-glass"></i></button>
                                            </form>
                                        </div>
                                    </div>

                                    <div class="table-responsive mt-3">
                                        <table class="table align-middle mb-0">
                                            <thead class="table-light">
                                                <tr>
                                                    <th>Product ID</th>
                                                    <th>Products Name</th>
                                                    <th>Date</th>
                                                    <th>Decription</th>
                                                    <th>Price</th>
                                                    <th>CategoryId</th>
                                                    <th>Status</th>
                                                    <th>Actions</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${requestScope.SEARCH_RESULT}" var="product" >
                                                    <tr>
                                                        <td class="text-center">${product.productId}</td>
                                                        <td>
                                                            <div class="d-flex align-items-center">
                                                                <div class="recent-product-img">
                                                                    <img src="data:image/jpeg;base64,${product.image}" alt="">
                                                                </div>
                                                                <div class="ms-2">
                                                                    <h6 class="mb-1 font-14">${product.name}</h6>
                                                                </div>
                                                            </div>
                                                        </td>
                                                        <td>${product.dateCreate}</td>
                                                        <td>${product.description}</td>
                                                        <td>${product.price} 000 VND</td>
                                                        <td class="category">${product.categoryId}</td>
                                                        <td class="">
                                                            <span class="badge bg-light-success ${product.status ? "text-success":"text-warning"} w-100">${product.status ? "Processing":"Pending"}</span>
                                                        </td>
                                                        <td>
                                                            <div class="d-flex order-actions"> 
                                                                <c:choose>
                                                                    <c:when test="${product.status}">
                                                                        <c:url var="deleteLink" value="deleteServlet">
                                                                            <c:param name="productId" value="${product.productId}" />
                                                                            <c:param name="searchValue" value="${param.searchValue}" />
                                                                        </c:url>
                                                                        <a href="${deleteLink}" class="text-danger bg-light-danger border-0 linkStatus" >
                                                                            <i class='bx bxs-trash'></i>
                                                                        </a>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <a class="text-danger bg-light-danger border-0" >
                                                                            <i class='bx bxs-trash'></i>
                                                                        </a>
                                                                    </c:otherwise>
                                                                </c:choose>

                                                                <form action="searchProductById" enctype="multipart/form-data">
                                                                    <input type="hidden" value="${product.productId}" name="searchValue"> 
                                                                    <button class="form-icon" type="submit">
                                                                        <a class="text-primary bg-light-primary border-0">
                                                                            <i class='bx bxs-edit'></i>
                                                                        </a>
                                                                    </button>
                                                                </form>

                                                            </div>
                                                        </td>
                                                    </tr>
                                                </c:forEach>


                                            </tbody>
                                        </table>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div><!--end row-->
                </div>
            </div>

            <!--start overlay-->
            <div class="overlay toggle-icon"></div>
            <!--end overlay-->
            <%@include file="Component/footer.jsp" %>
        </div>
        <!--start switcher-->
        <%@include file="Component/switcher.jsp" %>
        <!--end switcher-->


        <%@include file="Component/importJS.jsp" %>

        <!-- process check category -->
        <script>
            $(document).ready(function () {
                $.ajax({
                    url: "CheckCategory", // URL of your Servlet
                    type: "GET",
                    dataType: "json",
                    success: function (data) {
                        getNameCategory(data);
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        console.log("Error: " + textStatus + " - " + errorThrown);
                    }
                });
            });

            function getNameCategory(listCategory) {
                let listElement = document.getElementsByClassName("category");
                for (let element of listElement) {
                    listCategory.forEach(category => {
                        if (category.categoryId == element.innerHTML) {
                            element.innerHTML = category.name;
                        }
                    })
                }
            }

        </script>

        <script>
            deleteConfirm();
            function deleteConfirm() {
                document.querySelectorAll(".linkStatus").forEach(element => {
                    element.addEventListener('click', () => {
                        event.preventDefault();
                        showConfirmDelete(element);
                    });
                })
            }



            function showConfirmDelete(element) {
                event.preventDefault();
                toastr.options = {
                    "closeButton": true,
                    "debug": true,
                    "newestOnTop": true,
                    "progressBar": false,
                    "positionClass": "toast-top-center",
                    "preventDuplicates": true,
                    "showDuration": "300",
                    "hideDuration": "1000",
                    "timeOut": 3000,
                    "extendedTimeOut": 0,
                    "showEasing": "swing",
                    "hideEasing": "linear",
                    "showMethod": "fadeIn",
                    "hideMethod": "fadeOut",
                    "tapToDismiss": true
                }

                currentToast = toastr["warning"]("Are you sure about that?<br /><br /><button type='button' id='yesBtn'>Yes</button> <button type='button' id='noBtn'>No</button>")

                // Bắt sự kiện khi nhấp vào nút "Yes"
                document.getElementById('yesBtn').addEventListener('click', function () {
                    // Thực hiện hành động khi nhấp vào nút "Yes" ở đây
                    window.location.href = element.getAttribute('href');

                });
            }
        </script>

    </body>
</html>
