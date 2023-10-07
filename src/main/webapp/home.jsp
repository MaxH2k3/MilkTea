<%-- 
    Document   : home
    Created on : Aug 17, 2023, 1:39:54 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
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
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
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
        <!-- header Start -->
        <%@include file="Component/header.jsp" %>
        <!-- header End -->


        <!-- Carousel Start -->
        <div class="container-fluid p-0 mb-5 wow fadeIn" data-wow-delay="0.1s">
            <div id="header-carousel" class="carousel slide" data-bs-ride="carousel">
                <div class="carousel-inner">
                    <div class="carousel-item">
                        <img class="w-100" src="Asset/img/carousel-0.jpg" alt="Image">
                        <div class="carousel-caption">
                            <div class="container">
                                <div class="row justify-content-start">
                                    <div class="col-lg-7">
                                        <h1 class="display-2 mb-5 animated slideInDown">Cheap-tasty</h1>
                                        <a href="searchServlet" class="btn btn-primary rounded-pill py-sm-3 px-sm-5">Products</a>
                                        <a href="contactPage" class="btn btn-secondary rounded-pill py-sm-3 px-sm-5 ms-3">Services</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="carousel-item active">
                        <img class="w-100" src="Asset/img/carousel-1.jpg" alt="Image">
                        <div class="carousel-caption">
                            <div class="container">
                                <div class="row justify-content-start">
                                    <div class="col-lg-7">
                                        <h1 class="display-2 mb-5 animated slideInDown">Organic Food Is Good For Health</h1>
                                        <a href="searchServlet" class="btn btn-primary rounded-pill py-sm-3 px-sm-5">Products</a>
                                        <a href="contactPage" class="btn btn-secondary rounded-pill py-sm-3 px-sm-5 ms-3">Services</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <img class="w-100" src="Asset/img/carousel-2.jpg" alt="Image">
                        <div class="carousel-caption">
                            <div class="container">
                                <div class="row justify-content-start">
                                    <div class="col-lg-7">
                                        <h1 class="display-2 mb-5 animated slideInDown">Natural Food Is Always Healthy</h1>
                                        <a href="searchServlet" class="btn btn-primary rounded-pill py-sm-3 px-sm-5">Products</a>
                                        <a href="contactPage" class="btn btn-secondary rounded-pill py-sm-3 px-sm-5 ms-3">Services</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <img class="w-100" src="Asset/img/carousel-3.jpg" alt="Image">
                        <div class="carousel-caption">
                            <div class="container">
                                <div class="row justify-content-start">
                                    <div class="col-lg-7">
                                        <h1 class="display-2 mb-5 animated slideInDown">Multi-milk tea</h1>
                                        <a href="searchServlet" class="btn btn-primary rounded-pill py-sm-3 px-sm-5">Products</a>
                                        <a href="contactPage" class="btn btn-secondary rounded-pill py-sm-3 px-sm-5 ms-3">Services</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#header-carousel"
                        data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#header-carousel"
                        data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>
        </div>
        <!-- Carousel End -->


        <!-- About Start -->
        <div class="container-xxl py-5">
            <div class="container">
                <div class="row g-5 align-items-center">
                    <div class="col-lg-6 wow fadeIn" data-wow-delay="0.1s">
                        <div class="about-img position-relative overflow-hidden p-5 pe-0">
                            <img class="img-fluid w-100" src="Asset/img/about.jpg">
                        </div>
                    </div>
                    <div class="col-lg-6 wow fadeIn" data-wow-delay="0.5s">
                        <h1 class="display-5 mb-4">Best Organic Fruits And Vegetables</h1>
                        <p class="mb-4">Tempor erat elitr rebum at clita. Diam dolor diam ipsum sit. Aliqu diam amet diam et eos. Clita erat ipsum et lorem et sit, sed stet lorem sit clita duo justo magna dolore erat amet</p>
                        <p><i class="fa fa-check text-primary me-3"></i>Tempor erat elitr rebum at clita</p>
                        <p><i class="fa fa-check text-primary me-3"></i>Aliqu diam amet diam et eos</p>
                        <p><i class="fa fa-check text-primary me-3"></i>Clita duo justo magna dolore erat amet</p>
                        <a class="btn btn-primary rounded-pill py-3 px-5 mt-3" href="searchServlet">Taste it now</a>
                    </div>
                </div>
            </div>
        </div>
        <!-- About End -->


        <!-- Feature Start -->
        <div class="container-fluid bg-light bg-icon my-5 py-6">
            <div class="container">
                <div class="section-header text-center mx-auto mb-5 wow fadeInUp" data-wow-delay="0.1s" style="max-width: 500px;">
                    <h1 class="display-5 mb-3">Our Features</h1>
                    <p>Tempor ut dolore lorem kasd vero ipsum sit eirmod sit. Ipsum diam justo sed rebum vero dolor duo.</p>
                </div>
                <div class="row g-4">
                    <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                        <div class="bg-white text-center h-100 p-4 p-xl-5">
                            <img class="img-fluid mb-4" src="Asset/img/icon-1.png" alt="">
                            <h4 class="mb-3">Natural Process</h4>
                            <p class="mb-4">Tempor ut dolore lorem kasd vero ipsum sit eirmod sit. Ipsum diam justo sed vero dolor duo.</p>
                            <a class="btn btn-outline-primary border-2 py-2 px-4 rounded-pill" href="">Read More</a>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.3s">
                        <div class="bg-white text-center h-100 p-4 p-xl-5">
                            <img class="img-fluid mb-4" src="Asset/img/icon-2.png" alt="">
                            <h4 class="mb-3">Organic Products</h4>
                            <p class="mb-4">Tempor ut dolore lorem kasd vero ipsum sit eirmod sit. Ipsum diam justo sed vero dolor duo.</p>
                            <a class="btn btn-outline-primary border-2 py-2 px-4 rounded-pill" href="">Read More</a>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.5s">
                        <div class="bg-white text-center h-100 p-4 p-xl-5">
                            <img class="img-fluid mb-4" src="Asset/img/icon-3.png" alt="">
                            <h4 class="mb-3">Biologically Safe</h4>
                            <p class="mb-4">Tempor ut dolore lorem kasd vero ipsum sit eirmod sit. Ipsum diam justo sed vero dolor duo.</p>
                            <a class="btn btn-outline-primary border-2 py-2 px-4 rounded-pill" href="">Read More</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Feature End -->




        <!-- Testimonial Start -->
        <div class="container-fluid bg-light bg-icon py-6 mb-5">
            <div class="container">
                <div class="section-header text-center mx-auto mb-5 wow fadeInUp" data-wow-delay="0.1s" style="max-width: 500px;">
                    <h1 class="display-5 mb-3">Customer Review</h1>
                    <p>Tempor ut dolore lorem kasd vero ipsum sit eirmod sit. Ipsum diam justo sed rebum vero dolor duo.</p>
                </div>
                <div class="owl-carousel testimonial-carousel wow fadeInUp" data-wow-delay="0.1s">
                    <div class="testimonial-item position-relative bg-white p-5 mt-4">
                        <i class="fa fa-quote-left fa-3x text-primary position-absolute top-0 start-0 mt-n4 ms-5"></i>
                        <p class="mb-4">Tempor erat elitr rebum at clita. Diam dolor diam ipsum sit diam amet diam et eos. Clita erat ipsum et lorem et sit.</p>
                        <div class="d-flex align-items-center">
                            <img class="flex-shrink-0 rounded-circle" src="Asset/img/testimonial-1.jpg" alt="">
                            <div class="ms-3">
                                <h5 class="mb-1">Client Name</h5>
                                <span>Profession</span>
                            </div>
                        </div>
                    </div>
                    <div class="testimonial-item position-relative bg-white p-5 mt-4">
                        <i class="fa fa-quote-left fa-3x text-primary position-absolute top-0 start-0 mt-n4 ms-5"></i>
                        <p class="mb-4">Tempor erat elitr rebum at clita. Diam dolor diam ipsum sit diam amet diam et eos. Clita erat ipsum et lorem et sit.</p>
                        <div class="d-flex align-items-center">
                            <img class="flex-shrink-0 rounded-circle" src="Asset/img/testimonial-2.jpg" alt="">
                            <div class="ms-3">
                                <h5 class="mb-1">Client Name</h5>
                                <span>Profession</span>
                            </div>
                        </div>
                    </div>
                    <div class="testimonial-item position-relative bg-white p-5 mt-4">
                        <i class="fa fa-quote-left fa-3x text-primary position-absolute top-0 start-0 mt-n4 ms-5"></i>
                        <p class="mb-4">Tempor erat elitr rebum at clita. Diam dolor diam ipsum sit diam amet diam et eos. Clita erat ipsum et lorem et sit.</p>
                        <div class="d-flex align-items-center">
                            <img class="flex-shrink-0 rounded-circle" src="Asset/img/testimonial-3.jpg" alt="">
                            <div class="ms-3">
                                <h5 class="mb-1">Client Name</h5>
                                <span>Profession</span>
                            </div>
                        </div>
                    </div>
                    <div class="testimonial-item position-relative bg-white p-5 mt-4">
                        <i class="fa fa-quote-left fa-3x text-primary position-absolute top-0 start-0 mt-n4 ms-5"></i>
                        <p class="mb-4">Tempor erat elitr rebum at clita. Diam dolor diam ipsum sit diam amet diam et eos. Clita erat ipsum et lorem et sit.</p>
                        <div class="d-flex align-items-center">
                            <img class="flex-shrink-0 rounded-circle" src="Asset/img/testimonial-4.jpg" alt="">
                            <div class="ms-3">
                                <h5 class="mb-1">Client Name</h5>
                                <span>Profession</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Testimonial End -->


        <!-- Footer Start -->
        <%@include file="Component/footer.jsp" %>
        <!-- Footer End -->


        <!-- Back to Top -->
        <a href="#" class="btn btn-lg btn-primary btn-lg-square rounded-circle back-to-top"><i class="bi bi-arrow-up"></i></a>


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
            <c:set var="messSuccess" value="${requestScope.NOTIFICATION}" />
            <c:set var="messInfo" value="${requestScope.INFO_MESSAGE}" />
            <c:if test="${not empty messInfo or not empty messSuccess}" >
            $(document).ready(function () {
                toastr.options = {
                    "closeButton": true,
                    "debug": true,
                    "newestOnTop": false,
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
                <c:if test="${not empty messInfo}">
                toastr["info"]("${messInfo}");
                </c:if>
                <c:if test="${not empty messSuccess}">
                toastr["success"]("${messSuccess}");
                </c:if>
            });
            </c:if>
        </script>
    </body>

</html>
