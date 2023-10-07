<%-- 
    Document   : header
    Created on : Aug 8, 2023, 6:06:46 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>

<c:set var="user" value="${sessionScope.LOGINED_USER}" />

<!-- Spinner Start -->
<div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
    <div class="spinner-border text-primary" role="status"></div>
</div>
<!-- Spinner End -->


<!-- Navbar Start -->
<div class="container-fluid fixed-top px-0 wow fadeIn" data-wow-delay="0.1s">
    <div class="top-bar row gx-0 align-items-center d-none d-lg-flex">
        <div class="col-lg-6 px-5 text-start">
            <small><i class="fa fa-map-marker-alt me-2"></i>Vung Tau, Viet Nam</small>
            <small class="ms-4"><i class="fa fa-envelope me-2"></i>teastore@gmail.com</small>
        </div>
        <div class="col-lg-6 px-5 text-end">
            <small>Follow us:</small>
            <a class="text-body ms-3" href=""><i class="fab fa-facebook-f"></i></a>
            <a class="text-body ms-3" href=""><i class="fab fa-twitter"></i></a>
            <a class="text-body ms-3" href=""><i class="fab fa-linkedin-in"></i></a>
            <a class="text-body ms-3" href=""><i class="fab fa-instagram"></i></a>
        </div>
    </div>

    <nav class="navbar navbar-expand-lg navbar-light py-lg-0 px-lg-5 wow fadeIn" data-wow-delay="0.1s">
        <a href="homePage" class="navbar-brand ms-4 ms-lg-0">
            <h1 class="fw-bold text-primary m-0">T<span class="text-secondary">E</span>A</h1>
        </a>
        <button type="button" class="navbar-toggler me-4" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">
            <div class="navbar-nav ms-auto p-4 p-lg-0">
                <a href="homePage" class="nav-item nav-link">Home</a>
                <a href="searchServlet" class="nav-item nav-link active">Products</a>
            </div>
            <div class="d-none d-lg-flex ms-2">
                <div class="nav-item dropdown">
                    <a class="btn-sm-square bg-white rounded-circle ms-3" href="">
                        <small class="fa fa-user text-body"></small>
                    </a>
                    <div class="dropdown-menu m-0" style="right: 0">
                        <c:if test="${user == null}">
                            <a href="loginPage" class="dropdown-item">Login</a>
                            <a href="registerPage" class="dropdown-item">Register</a>
                        </c:if>
                        <c:if test="${user != null}">
                            <a href="historyOrder" class="dropdown-item">History order</a>
                            <a href="blog.html" class="dropdown-item">Change password</a>
                            <a href="logoutServlet" class="dropdown-item">Logout</a>
                        </c:if>

                    </div>
                </div>
                <a class="btn-sm-square bg-white rounded-circle ms-3" href="viewOrder">
                    <small class="fa fa-shopping-bag text-body"></small>
                </a>
            </div>
        </div>
    </nav>
</div>
<!-- Navbar End -->
