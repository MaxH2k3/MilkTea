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
                                            <thead class="table-light text-center">
                                                <tr>
                                                    <th>Order ID</th>
                                                    <th>User name</th>
                                                    <th>Order Date</th>
                                                    <th>Status</th>
                                                    <th>Total</th>
                                                    <th>Actions</th>
                                                </tr>
                                            </thead>
                                            <tbody class="text-center">
                                                <c:forEach items="${requestScope.ORDER_STATUS}" var="order" >
                                                    <tr>
                                                        <td class="text-center">${order.orderId}</td>
                                                        <td>${order.userName}</td>
                                                        <td>${order.orderDate}</td>
                                                        <c:choose>
                                                            <c:when test="${order.status eq '0'}">
                                                                <td>
                                                                    <span class="badge bg-light-warning text-warning w-100">Waiting</span>
                                                                </td>
                                                            </c:when>
                                                            <c:when test="${order.status eq '2'}">
                                                                <td>
                                                                    <span class="badge bg-light-success text-success w-100">Accepted</span>
                                                                </td>
                                                            </c:when>
                                                            <c:when test="${order.status eq '1'}">
                                                                <td>
                                                                    <span class="badge bg-light-danger text-danger w-100">Rejected</span>
                                                                </td>
                                                            </c:when>
                                                        </c:choose>
                                                        <td>${order.total}</td>
                                                        <td>
                                                            <div class="d-flex order-actions justify-content-center"> 
                                                                
                                                                    <c:if test="${order.status eq 0}">
                                                                        <c:url var="rejectLink" value="updateOrderStatus">
                                                                            <c:param name="orderId" value="${order.orderId}" />
                                                                            <c:param name="status" value="1" />
                                                                        </c:url>
                                                                        <a href="${rejectLink}" class="text-danger bg-light-danger border-0 margin-right-1 linkStatus" >
                                                                            <i class="fa-regular fa-circle-xmark"></i>
                                                                        </a>
                                                                        <c:url var="acceptLink" value="updateOrderStatus">
                                                                            <c:param name="orderId" value="${order.orderId}" />
                                                                            <c:param name="status" value="2" />
                                                                        </c:url>
                                                                        <a href="${acceptLink}" class="text-primary bg-light-primary border-0 linkStatus">

                                                                            <i class="fa-regular fa-circle-check"></i>
                                                                        </a>
                                                                    </c:if>

                                                                <form action="viewOrderDetailsServlet">
                                                                    <input type="hidden" value="${order.orderId}" name="orderId"> 
                                                                    <button class="form-icon" type="submit">
                                                                        <a class="text-primary bg-light-success border-0">
                                                                            <i class="fa-solid fa-info"></i>
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
