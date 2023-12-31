<%-- 
    Document   : contact
    Created on : Oct 4, 2023, 8:21:08 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    </head>

    <body>
        <!-- header Start -->
        <%@include file="Component/header.jsp" %>
        <!-- header End -->

        <!-- Contact Start -->
        <div class="container-xxl py-6">
            <div class="container">
                <div class="section-header text-center mx-auto mb-5 wow fadeInUp" data-wow-delay="0.1s" style="max-width: 500px;">
                    <h1 class="display-5 mb-3">Contact Us</h1>
                    <p>Tempor ut dolore lorem kasd vero ipsum sit eirmod sit. Ipsum diam justo sed rebum vero dolor duo.</p>
                </div>
                <div class="row g-5 justify-content-center">
                    <div class="col-lg-5 col-md-12 wow fadeInUp" data-wow-delay="0.1s">
                        <div class="bg-primary text-white d-flex flex-column justify-content-center h-100 p-5">
                            <h5 class="text-white">Call Us</h5>
                            <p class="mb-5"><i class="fa fa-phone-alt me-3"></i>+012 345 67890</p>
                            <h5 class="text-white">Email Us</h5>
                            <p class="mb-5"><i class="fa fa-envelope me-3"></i>teastore@gmail.com</p>
                            <h5 class="text-white">Office Address</h5>
                            <p class="mb-5"><i class="fa fa-map-marker-alt me-3"></i>Vung Tau, Viet Nam</p>
                            <h5 class="text-white">Follow Us</h5>
                            <div class="d-flex pt-2">
                                <a class="btn btn-square btn-outline-light rounded-circle me-1" href=""><i class="fab fa-twitter"></i></a>
                                <a class="btn btn-square btn-outline-light rounded-circle me-1" href=""><i class="fab fa-facebook-f"></i></a>
                                <a class="btn btn-square btn-outline-light rounded-circle me-1" href=""><i class="fab fa-youtube"></i></a>
                                <a class="btn btn-square btn-outline-light rounded-circle me-0" href=""><i class="fab fa-linkedin-in"></i></a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-7 col-md-12 wow fadeInUp" data-wow-delay="0.5s">
                        <p class="mb-4">The contact form is currently inactive. Get a functional and working contact form with Ajax & PHP in a few minutes. Just copy and paste the files, add a little code and you're done.</p>
                        <form>
                            <div class="row g-3">
                                <div class="col-md-6">
                                    <div class="form-floating">
                                        <input type="text" class="form-control" id="name" placeholder="Your Name">
                                        <label for="name">Your Name</label>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-floating">
                                        <input type="email" class="form-control" id="email" placeholder="Your Email">
                                        <label for="email">Your Email</label>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-floating">
                                        <input type="text" class="form-control" id="subject" placeholder="Subject">
                                        <label for="subject">Subject</label>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-floating">
                                        <textarea class="form-control" placeholder="Leave a message here" id="message" style="height: 200px"></textarea>
                                        <label for="message">Message</label>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <button class="btn btn-primary rounded-pill py-3 px-5" type="submit">Send Message</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- Contact End -->


        <!-- Google Map Start -->
        <div class="container-xxl px-0 wow fadeIn google-map" data-wow-delay="0.1s" style="margin-bottom: -6px;">
            
            <iframe class="w-100" style="height: 450px;" 
                src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3918.6099415305225!2d106.80730807595695!3d10.841132857994978!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752731176b07b1%3A0xb752b24b379bae5e!2zVHLGsOG7nW5nIMSQ4bqhaSBo4buNYyBGUFQgVFAuIEhDTQ!5e0!3m2!1svi!2s!4v1696427148499!5m2!1svi!2s" 
                    allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade" tabindex="0"></iframe>
        </div>
        <!-- Google Map End -->
        

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
    </body>

</html>
