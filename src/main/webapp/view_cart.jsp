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
        <link href="Asset/css/styleOrders.css" rel="stylesheet">

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

        <section class="h-100 h-custom">
            <div class="container py-5 h-100">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col-12">
                        <div class="card card-registration card-registration-2" style="border-radius: 15px;">
                            <div class="card-body p-0">
                                <div class="row g-0">
                                    <div class="col-lg-8">
                                        <div class="p-5">
                                            <div class="d-flex justify-content-between align-items-center mb-5">
                                                <h1 class="fw-bold mb-0 text-black">Shopping Cart</h1>
                                                <h6 class="mb-0 text-muted">0 items</h6>
                                            </div>

                                            <hr class="my-4">

                                            <c:forEach items="${requestScope.CART_ITEMS}" var="product" varStatus="counter">
                                                <form action="updateOrder" method="POST">
                                                    <div class="row mb-4 d-flex justify-content-between align-items-center product">
                                                        <input type="hidden" name="productId" value="${product.productId}">
                                                        <!-- image product -->
                                                        <div class="col-md-2">
                                                            <img src="data:image/jpeg;base64,${product.image}"
                                                                 class="img-fluid rounded-3 thumbnail" alt="Cotton T-shirt">
                                                        </div>
                                                        <!-- information product -->
                                                        <div class="col-md-3">
                                                            <h6 class="text-muted category">${product.categoryId}</h6>
                                                            <h6 class="text-black mb-0">${product.name}</h6>
                                                        </div>
                                                        <!-- amount of product -->
                                                        <div class="col-md-3 d-flex">
                                                            <button class="btn-volume"
                                                                    onclick="this.parentNode.querySelector('input[type=number]').stepDown(); updateOrderInformation(); event.preventDefault()">
                                                                <i class="fas fa-minus"></i>
                                                            </button>

                                                            <input id="input" min="0" max="100" name="quantity" value="${product.quantity}"
                                                                   type="number"
                                                                   class="form-control form-control-sm inputAmount quantity" />

                                                            <button class="btn-volume"
                                                                    onclick="this.parentNode.querySelector('input[type=number]').stepUp(); updateOrderInformation(); event.preventDefault()">
                                                                <i class="fas fa-plus"></i>
                                                            </button>
                                                        </div>
                                                        <!-- price of product -->
                                                        <div class="col-md-2 position-relative">
                                                            <h6 class="mb-0 price">${product.price}000</h6>
                                                            <span class="unit" style="bottom: -10%;">VND</span>
                                                            <input type="hidden" name="price" value="${product.price}000">
                                                        </div>
                                                        <!-- icon delete/update product -->
                                                        <div class="col-md-2 text-end d-flex justify-content-around">
                                                            <button type="submit" class="button-control"><i class="fa fa-cart-arrow-down"></i></button>
                                                                <c:url var="deleteLink" value="removeOrder" >
                                                                    <c:param name="productId" value="${product.productId}" />
                                                                </c:url>
                                                            <a href="${deleteLink}" class="color-dark"><i class="fas fa-times"></i></a>
                                                        </div>
                                                    </div>
                                                    <hr class="my-4">
                                                </form>
                                            </c:forEach>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 bg-grey check-out">
                                        <div class="p-5">
                                            <h3 class="fw-bold mb-5 mt-2 pt-1">Check out</h3>
                                            <hr class="my-4">

                                            <div class="d-flex justify-content-between mb-4">
                                                <h5 class="text-uppercase">Amount</h5>
                                                <h5 id="totalAllProduct">0 product</h5>
                                            </div>

                                            <div class="d-flex justify-content-between mb-4 position-relative">
                                                <h5 class="text-uppercase">Price</h5>
                                                <h5 class="total-price padding-right-2">0.00</h5>
                                                <span class="unit">VND</span>
                                            </div>

                                            <div class="d-flex justify-content-between mb-4 position-relative">
                                                <h5 class="text-uppercase">Discount</h5>
                                                <h5 id="discount" class="padding-right-1">0</h5>
                                                <span class="unit">%</span>
                                            </div>

                                            <hr class="my-4">

                                            <div class="d-flex justify-content-between mb-5 position-relative">
                                                <h5 class="text-uppercase">Total price</h5>
                                                <h5 class="checkout padding-right-2">0.00</h5>
                                                <span class="unit">VND</span>
                                            </div>

                                            <div class="payment mb-4">
                                                <h5 class="mb-3"> Payment</h5>
                                                <div class="method-payment d-flex justify-content-between">
                                                    <div class="money">
                                                        <input type="checkbox" class="btn-check" id="btn-check-outlined-S"
                                                               autocomplete="off" name="type" value="" checked>
                                                        <label class="btn btn-outline-dark border-2"
                                                               for="btn-check-outlined-S">Money</label><br>
                                                    </div>
                                                    <a class="btn btn-outline-dark border-2" data-bs-toggle="collapse"
                                                       href="#collapseMomo" role="button" aria-expanded="false"
                                                       aria-controls="collapseMomo">Momo</a>
                                                    <a class="btn btn-outline-dark border-2" data-bs-toggle="collapse"
                                                       href="#collapseBank" role="button" aria-expanded="false"
                                                       aria-controls="collapseBank">Bank</a>
                                                </div>
                                            </div>

                                            <div class="collapse mb-3" id="collapseMomo">
                                                <div class="card card-body">
                                                    <img src="Asset/img/payment/momo.png" alt="">
                                                </div>
                                            </div>

                                            <div class="collapse mb-3" id="collapseBank">
                                                <div class="card card-body">
                                                    <img src="Asset/img/payment/vnpay.png" alt="">
                                                </div>
                                            </div>

                                            <div class="text-center">
                                                <form action="checkout" method="POST">
                                                    <button type="submit" class="btn btn-dark btn-block btn-lg mb-4"
                                                            data-mdb-ripple-color="dark" name="btAction"
                                                            value="checkout">Checkout</button>
                                                </form>

                                            </div>



                                            <div class="voucher d-flex align-items-center justify-content-between">
                                                <h5 class="text-uppercase mb-4">COUPON</h5>

                                                <div class="form-voucher position-relative">
                                                    <input type="text" id="codeVoucher" class="form-control-lg" />
                                                    <button id="apply-coupon" >Apply coupon</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>


        <!-- Footer Start -->
        <%@include file="Component/footer.jsp" %>
        <!-- Footer End -->


        <!-- Back to Top -->
        <a href="#" class="btn btn-lg btn-primary btn-lg-square rounded-circle back-to-top"><i class="bi bi-arrow-up"></i></a>

        <!-- JavaScript Code handle image error -->

        <script>
            handleErrorImg();
            function handleErrorImg() {
                const listImg = document.querySelectorAll('.thumbnail');
                console.log(listImg);
                listImg.forEach(img => {
                    img.addEventListener('error', function handleError() {
                        const defaultImage = 'images/default_image.png';
                        img.src = defaultImage;
                        img.alt = 'default';
                    });
                });

            }

        </script>


        <!--JQuerry-->
        <script src="AdminPage/assets/js/jquery.min.js"></script>
        <!-- JavaScript Libraries -->
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
            updateOrderInformation();
        </script>

        <!-- process apply voucher-->
        <script>
            $(document).ready(function () {
                $("#apply-coupon").click(function () {
                    var inputData = $("#codeVoucher").val();

                    $.ajax({
                        url: "ApplyVoucher", // URL of your Servlet
                        type: "GET",
                        data: {code: inputData},
                        success: function (response) {
                            var status = response.status;
                            var processedData = response.discount;

                            if (status === true) {
                                $("#discount").html(processedData);
                                showNotification("success", "Apply successfully.");
                            } else {
                                showNotification("error", "Not exist code");
                            }
                            checkOut();
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            console.log("Error: " + textStatus + " - " + errorThrown);
                        }
                    });
                });
            });
        </script>

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
            <c:set var="mess" value="${requestScope.NOTIFICATION}" />
            <c:if test="${not empty mess}">
                <c:if test="${not mess.result}">
            showNotification("error", "${mess.message}");
                </c:if>
                <c:if test="${mess.result}">
            showNotification("successfully", "${mess.message}");
                </c:if>
            </c:if>
            function showNotification(typePopup, message) {
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
                toastr[typePopup](message);
            }
        </script>

    </body>
</html>