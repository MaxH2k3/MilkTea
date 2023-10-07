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
                                            <h5 class="mb-1">Account details</h5>

                                        </div>
                                        <div class="ms-auto">
                                            <form action="searchUser" class="d-flex justify-content-between">
                                                <input name="searchValue" value="${param.searchValue}" class="form-control" placeholder="Search Account" />
                                                <button class="form-icon"><i class="fa-solid fa-magnifying-glass"></i></button>
                                            </form>
                                        </div>
                                    </div>

                                    <div class="table-responsive mt-3">
                                        <table class="table align-middle mb-0">
                                            <thead class="table-light">
                                                <tr>
                                                    <th>User ID</th>
                                                    <th>Name</th>
                                                    <th>Phone</th>
                                                    <th>Address</th>
                                                    <th>Email</th>
                                                    <th>role</th>
                                                    <th>Gender</th>
                                                    <th>Status</th>
                                                    <th>Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${requestScope.LIST_USER}" var="user" >
                                                    <tr>
                                                        <td class="text-center">${user.userId}</td>
                                                        <td>${user.name}</td>
                                                        <td>${user.phone}</td>
                                                        <td>${user.address}</td>
                                                        <td>${user.email}</td>
                                                        <td>${user.roleId eq 1 ? "Admin":"User"}</td>
                                                        <td>${user.gender ? "Male":"Female"}</td>
                                                        <td>
                                                            <span class="badge bg-light-success ${user.status ? "text-success":"text-warning"} w-100">${user.status ? "Processing":"Pending"}</span>
                                                        </td>
                                                        <td>
                                                            <div class="d-flex order-actions">
                                                                <c:choose>
                                                                    <c:when test="${user.status}">
                                                                        <a href="deleteUser?acc=${user.userId}" class="text-danger bg-light-danger border-0 margin-right-1" >
                                                                            <i class='bx bxs-trash'></i>
                                                                        </a>
                                                                        <a class="text-success bg-light-success border-0 " >
                                                                            <i class="fa-solid fa-rotate"></i>
                                                                        </a>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <a class="text-danger bg-light-danger border-0 margin-right-1" >
                                                                            <i class='bx bxs-trash'></i>
                                                                        </a>
                                                                        <a href="revertUser?acc=${user.userId}" class="text-success bg-light-success border-0 " >
                                                                            <i class="fa-solid fa-rotate"></i>
                                                                        </a>
                                                                    </c:otherwise>
                                                                </c:choose>
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
