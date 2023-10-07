<%-- 
    Document   : shop
    Created on : Aug 8, 2023, 5:49:53 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>Milk Tea Store</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="" name="keywords">
        <meta content="" name="description">

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
        <div class="container-fluid page-header mb-5 wow fadeIn" data-wow-delay="0.1s">
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


        <!-- Product Start -->
        <div class="container-xxl py-5">
            <div class="container">
                <div class="row g-0 gx-5 align-items-end">
                    <div class="col-lg-6">
                        <div class="section-header text-start mb-5 wow fadeInUp" data-wow-delay="0.1s" style="max-width: 500px;">
                            <h1 class="display-5 mb-3">Our Products</h1>
                            <p>Tempor ut dolore lorem kasd vero ipsum sit eirmod sit. Ipsum diam justo sed rebum vero dolor duo.</p>
                        </div>
                    </div>
                    <div class="col-lg-6 text-start text-lg-end wow slideInRight" data-wow-delay="0.1s">
                        <ul class="nav nav-pills d-inline-flex justify-content-end mb-5">
                            <li class="nav-item me-2">
                                <a class="btn btn-outline-primary border-2 active" data-bs-toggle="pill">Sản phẩm</a>
                            </li>
                            <li class="nav-item me-2">
                                <a class="btn btn-outline-primary border-2" data-bs-toggle="pill"
                                   aria-controls="pill">Bán chạy </a>
                            </li>
                            <li class="nav-item me-0">
                                <a class="btn btn-outline-primary border-2" data-bs-toggle="collapse"
                                   href="#collapseFilter" role="button" aria-expanded="false"
                                   aria-controls="collapseFilter">Bộ lọc</a>
                            </li>
                        </ul>
                    </div>
                    <form class="widget_list widget_filter row collapse" id="collapseFilter" action="searchServlet" method="GET">
                        <h2>Bộ lọc tìm kiếm</h2>
                        <div class="filter__list widget_search col-md-4">
                            <h5>Tìm kiếm</h5>
                            <div class="search-btn" >
                                <input type="text" class="form-control" name="searchValue" value="${param.searchValue}" placeholder="Search" >
                            </div>
                        </div>
                        <div class="filter__list slider_range col-md-3">
                            <h5>Giá</h5>
                            <div class="d-flex align-items-center flex-row justify-content-between">
                                <span>Từ</span>
                                <input type="number" name="minPrice" class="amountPrice form-control" value="${param.minPrice}" min="0" />
                                <span>Đến</span>
                                <input type="number" name="maxPrice" class="amountPrice form-control" value="${param.maxPrice}" max="999" />
                                <span class="typePrice">000 VND</span>
                            </div>
                        </div>
                        <script>
                            checkMaxDigit();
                            function checkMaxDigit() {
                                let inputNums = document.getElementsByClassName("amountPrice");
                                for (const element of inputNums) {
                                    element.addEventListener("input", () => {
                                        console.log("here");
                                        if (element.value.length >= 3) {
                                            element.value = element.value.slice(0, 3);
                                            console.log("ok");
                                        }
                                    });

                                }
                            }
                        </script>

                        <div class="filter__list slider_range col-md-3">
                            <h5>Sắp xếp </h5>
                            <select id="inputState" class="form-select" name="sortBy">
                                <option value="1" ${param.sortBy eq 1 ? "selected" : ""}>Theo tên từ A->Z</option>
                                <option value="2" ${param.sortBy eq 2 ? "selected" : ""}>Theo tên từ Z->A</option>
                                <option value="3" ${param.sortBy eq 3 ? "selected" : ""}>Theo giá từ cao đến thấp</option>
                                <option value="4" ${param.sortBy eq 4 ? "selected" : ""}>Theo giá từ thấp đến cao</option>
                            </select>
                        </div>

                        <c:set var="listC" value="${requestScope.LIST_CATEGORIES}" />
                        <div class="filter__list widget_type">
                            <h3> Phân loại</h3>
                            <ul class="d-flex">
                                <c:forEach var="category" items="${listC}">
                                    <li>
                                        <input type="checkbox" class="btn-check" id="btn-check-outlined-${category.name}" autocomplete="off"
                                               name="category" value="${category.categoryId}" ${param.category eq category.categoryId ? "checked" : ""}>
                                        <label class="btn btn-outline-success" for="btn-check-outlined-${category.name}">${category.name}</label><br>
                                    </li>
                                </c:forEach>

                            </ul>
                        </div>

                        <div class="filter__list widget_button">
                            <input type="submit" name="btnAction" value="Submit">
                        </div>
                    </form>
                </div>
                <c:set var="result" value ="${requestScope.SEARCH_RESULT}" />  
                <div class="tab-content">
                    <div id="tab-1" class="tab-pane fade show p-0 active">
                        <div class="row g-4">
                            <c:choose>
                                <c:when test="${empty result}">
                                    <h2 class="alert alert-secondary" style="text-align: center; color: blue">Not any milk tea</h2>
                                </c:when>
                                <c:otherwise>
                                    <c:forEach items="${result}" var="product" varStatus="status">
                                        <c:set var="amountProduct" value="${status.count}" />
                                        <c:if test="${product.status}">
                                            <div class="col-xl-3 col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                                                <div class="product-item">
                                                    <div class="position-relative bg-light overflow-hidden height-20rem">
                                                        <div class="cover-img">
                                                            <img class="img-fluid w-100 img-responsive thumbnail" src="data:image/jpeg;base64,${product.image}" alt="">
                                                        </div>
                                                        <c:if test="${product.numDateCreate <= 3}">
                                                            <div class="bg-secondary rounded text-white position-absolute start-0 top-0 m-4 py-1 px-3">New</div>    
                                                        </c:if>          

                                                    </div>
                                                    <a class="d-block h6 mb-2 text-center name" >${product.name}</a>
                                                    <div class="text-center price">
                                                        <span class="text-primary me-1">${product.price} 000 VND</span>
                                                    </div>
                                                    <div class="text-center border-top p-2">
                                                        <c:url var="addProductLink" value="addOrder" >
                                                            <c:param name="productId" value="${product.productId}" />
                                                            <c:param name="searchValue" value="${param.searchValue}" />
                                                            <c:param name="minPrice" value="${param.minPrice}" />
                                                            <c:param name="maxPrice" value="${param.maxPrice}" />
                                                            <c:param name="sortBy" value="${param.sortBy}" />
                                                            <c:param name="category" value="${param.category}" />
                                                        </c:url>
                                                        <small class="w-50 text-center py-2">
                                                            <a class="text-body" href="${addProductLink}"><i class="fa fa-shopping-bag text-primary me-2"></i>Add to cart</a>
                                                        </small>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:if>
                                    </c:forEach>
                                </c:otherwise>
                            </c:choose>

                        </div>
                    </div>

                </div>
            </div>
        </div>
        <!-- Product End -->


        <!-- Footer Start -->
        <%@include file="Component/footer.jsp" %>
        <!-- Footer End -->



        <!-- Back to Top -->
        <a href="#" class="btn btn-lg btn-primary btn-lg-square rounded-circle back-to-top"><i class="bi bi-arrow-up"></i></a>

        <!-- JavaScript Code handle image error -->
        <script>
            handleErrorImg();
            function handleErrorImg() {
                const listImg = document.querySelectorAll('.cover-img .thumbnail');
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
        <!--toastr-->
        <script src="Asset/lib/toastr/toastr.min.js"></script>

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
