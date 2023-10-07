<%-- 
    Document   : view_orders
    Created on : Jul 7, 2022, 10:31:13 PM
    Author     : netbeans
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="" name="keywords">
        <meta content="" name="description">
        <title>Milk Tea Store</title>
        
        <!-- Favicon -->
        <link href="img/favicon.ico" rel="icon">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;500&family=Lora:wght@600;700&display=swap" rel="stylesheet"> 

        <!-- Icon Font Stylesheet -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="Asset/lib/animate/animate.min.css" rel="stylesheet">
        <link href="Asset/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

        <!-- Customized Bootstrap Stylesheet -->
        <link href="Asset/css/bootstrap.min.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="Asset/css/style.css" rel="stylesheet">

        <link href="Asset/lib/toastr/toastr.min.css" rel="stylesheet">

    </head>
    <body>
        <!-- Header Start -->
        <%@include file="Component/header.jsp" %>
        <!-- Header End -->

        <!-- Page Header Start -->
        <div class="container-fluid page-header wow fadeIn" data-wow-delay="0.1s">
            <div class="container">
                <h1 class="display-3 mb-3 animated slideInDown">Products</h1>
                <nav aria-label="breadcrumb animated slideInDown">
                    <ol class="breadcrumb mb-0">
                        <li class="breadcrumb-item"><a class="text-body" href="#">Home</a></li>
                        <li class="breadcrumb-item"><a class="text-body" href="#">Pages</a></li>
                        <li class="breadcrumb-item text-dark active" aria-current="page">Products</li>
                    </ol>
                </nav>
            </div>
        </div>
        <!-- Page Header End -->
        <c:choose>
            <c:when test="${empty requestScope.ORDER_STATUS}">
                <c:choose>
                    <c:when test="${sessionScope.LOGINED_USER.gender}">
                        <div class="d-flex justify-content-center w100">
                            <img class="w50" src="Asset/img/emptyOrder/male.jpg" />
                            <h2 class="margin-bottom-4rem margin-auto" >Empty Order</h2>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="d-flex flex-column justify-content-center align-items-center w100">
                            <img class="w30" src="Asset/img/emptyOrder/female.jpg" />
                            <h2 class="margin-bottom-4rem" >Empty Order</h2>
                        </div>
                    </c:otherwise>
                </c:choose>
            </c:when>
            <c:otherwise>
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
                                        </div>

                                        <div class="table-responsive mt-3">
                                            <table class="table align-middle mb-0">
                                                <thead class="table-light text-center">
                                                    <tr>
                                                        <th>Order ID</th>
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
                                                            <td class="more-information">
                                                                <div class="d-flex order-actions justify-content-center"> 

                                                                    <input type="hidden" value="${order.orderId}" name="orderId" class="orderId"> 
                                                                    <!-- Button trigger modal -->
                                                                    <c:if test="${order.status eq '0'}">
                                                                        <a href="cancelOrder?orderId=${order.orderId}" class="text-primary bg-light-success border-0">
                                                                            <i class="fa-regular fa-rectangle-xmark"></i>
                                                                        </a>
                                                                    </c:if>
                                                                    <button type="button" class="form-icon sendButton" data-bs-toggle="modal" data-bs-target="#exampleModal">
                                                                        <a class="text-primary bg-light-success border-0">
                                                                            <i class="fa-solid fa-info"></i>
                                                                        </a>
                                                                    </button>

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
            </c:otherwise>
        </c:choose>

        <!-- Footer Start -->
        <%@include file="Component/footer.jsp" %>
        <!-- Footer End -->



        <!-- Modal -->
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="page-wrapper">
                            <div class="page-content">
                                <div class="row">
                                    <div class="col">
                                        <div class="card radius-10 mb-0">
                                            <div class="card-body">
                                                <div class="d-flex align-items-center">
                                                    <div>
                                                        <h5 class="mb-1">Order details</h5>
                                                    </div>
                                                </div>

                                                <div class="table-responsive mt-3">
                                                    <table class="table align-middle mb-0">
                                                        <thead class="table-light">
                                                            <tr>
                                                                <th>Order ID</th>
                                                                <th>Product Name</th>
                                                                <th>Quantity</th>
                                                                <th>Price</th>
                                                                <th>CategoryId</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody id="result">
                                                        </tbody>
                                                    </table>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </div><!--end row-->
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        Enjoy your moment!
                    </div>
                </div>
            </div>
        </div>


        <!-- Back to Top -->
        <a href="#" class="btn btn-lg btn-primary btn-lg-square rounded-circle back-to-top"><i class="bi bi-arrow-up"></i></a>

        <!--JQuerry-->
        <script src="AdminPage/assets/js/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="Asset/lib/wow/wow.min.js"></script>
        <script src="Asset/lib/easing/easing.min.js"></script>
        <script src="Asset/lib/waypoints/waypoints.min.js"></script>
        <script src="Asset/lib/owlcarousel/owl.carousel.min.js"></script>

        <!-- Template Javascript -->
        <script src="Asset/js/main.js"></script>
        <script src="Asset/js/orders.js"></script>

        <!--toastr-->
        <script src="Asset/lib/toastr/toastr.min.js"></script>

        <script>
            $(document).ready(function () {
                $(".more-information").each(function () {
                    const sendButton = $(this).find('button');
                    const input = $(this).find('input');
                    $(sendButton).click(function () {
                        var inputData = $(input).val();

                        $.ajax({
                            url: "ViewOrderDetailsUser", // URL of your Servlet
                            type: "GET",
                            data: {orderId: inputData},
                            success: function (response) {
                                $("#result").html("");
                                for (let orderDetail of response) {
                                    let element = `
                                    <tr>
                                        <td class="text-center">` + orderDetail.orderDetailsId + `</td>
                                        <td>
                                            <div class="d-flex align-items-center">
                                                <div class="recent-product-img">
                                                    <img src="` + orderDetail.product.image + `" alt="">
                                                </div>
                                                <div class="ms-2">
                                                    <h6 class="mb-1 font-14">` + orderDetail.product.name + `</h6>
                                                </div>
                                            </div>
                                        </td>
                                        <td>` + orderDetail.quantity + `</td>
                                        <td>` + orderDetail.product.price + `000 VND</td>
                                        <td class="category">` + orderDetail.product.categoryId + `</td>
                                    </tr>
                                `;
                                    $("#result").append(element);
                                }
                                loadCategoryData();
                            },
                            error: function (jqXHR, textStatus, errorThrown) {
                                console.log("Error: " + textStatus + " - " + errorThrown);
                            }
                        });
                    });

                })

            });
        </script>

        <!-- process check category -->
        <script>
            function loadCategoryData() {
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
            }


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
