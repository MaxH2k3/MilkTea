<%-- 
    Document   : login
    Created on : Jul 4, 2023, 9:44:44 AM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<!doctype html>
<html lang="en">

    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Bootstrap CSS -->
        <link href="AdminPage/assets/css/bootstrap.min.css" rel="stylesheet">
        <link href="AdminPage/assets/css/bootstrap-extended.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500&display=swap" rel="stylesheet">
        <link href="AdminPage/assets/css/app.css" rel="stylesheet">
        <link href="AdminPage/assets/css/icons.css" rel="stylesheet">
        <link href="Asset/lib/toastr/toastr.min.css" rel="stylesheet">
        <title>Milk Tea Store</title>
    </head>

    <body>
        <!--wrapper-->
        <div class="wrapper">
            <div class="authentication-header"></div>
            <div class="section-authentication-signin d-flex align-items-center justify-content-center my-5 my-lg-0">
                <div class="container-fluid">
                    <div class="row row-cols-1 row-cols-lg-2 row-cols-xl-3">
                        <div class="col mx-auto">
                            <div class="mb-4 text-center">
                                <img src="assets/images/logo-img.png" width="180" alt="" />
                            </div>
                            <div class="card">
                                <div class="card-body">
                                    <div class="p-4 rounded">
                                        <div class="text-center">
                                            <h3 class="">Sign in</h3>
                                            <p>Don't have an account yet? <a href="authentication-signup.html">Sign up
                                                    here</a>
                                            </p>
                                        </div>

                                        <div class="login-separater text-center mb-4"> <span>OR SIGN IN WITH EMAIL</span>
                                            <hr />
                                        </div>
                                        <div class="form-body">
                                            <form action="loginServlet" method="POST" class="row g-3">
                                                <div class="col-12">
                                                    <label for="inputUserName" class="form-label">Username</label>
                                                    <input type="text" class="form-control" id="inputUserName" name="txtUserName"
                                                           placeholder="Username" required="">
                                                </div>
                                                <div class="col-12">
                                                    <label for="inputChoosePassword" class="form-label">
                                                        Password</label>
                                                    <div class="input-group" id="show_hide_password">
                                                        <input type="password" class="form-control border-end-0" name="txtPassword"
                                                               id="inputChoosePassword" value=""
                                                               placeholder="Enter Password" required=""> <a href="javascript:;"
                                                               class="input-group-text bg-transparent"><i
                                                                class='bx bx-hide'></i></a>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-check form-switch">
                                                        <input class="form-check-input" type="checkbox"
                                                               id="flexSwitchCheckChecked">
                                                        <label class="form-check-label"
                                                               for="flexSwitchCheckChecked">Remember Me</label>
                                                    </div>
                                                </div>
                                                <div class="col-md-6 text-end"> <a
                                                        href="authentication-forgot-password.html">Forgot Password ?</a>
                                                </div>
                                                <div class="col-12">
                                                    <div class="d-grid">
                                                        <button type="submit" class="btn btn-primary"><i
                                                                class="bx bxs-lock-open"></i>Sign in</button>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--end row-->
                </div>
            </div>
        </div>
        <!--end wrapper-->
        <!-- Bootstrap JS -->
        <script src="AdminPage/assets/js/bootstrap.bundle.min.js"></script>
        <!--plugins-->
        <script src="AdminPage/assets/js/jquery.min.js"></script>
        <!--toastr-->
        <script src="Asset/lib/toastr/toastr.min.js"></script>
        <!--JQuerry-->
        <script src="AdminPage/assets/js/jquery.min.js"></script>
        <!--Password show & hide js -->
        <script>
            $(document).ready(function () {
                $("#show_hide_password a").on('click', function (event) {
                    event.preventDefault();
                    if ($('#show_hide_password input').attr("type") == "text") {
                        $('#show_hide_password input').attr('type', 'password');
                        $('#show_hide_password i').addClass("bx-hide");
                        $('#show_hide_password i').removeClass("bx-show");
                    } else if ($('#show_hide_password input').attr("type") == "password") {
                        $('#show_hide_password input').attr('type', 'text');
                        $('#show_hide_password i').removeClass("bx-hide");
                        $('#show_hide_password i').addClass("bx-show");
                    }
                });
            });
        </script>
        <script>
            <c:set var="messSuccess" value="${requestScope.NOTIFICATION}" />
            <c:set var="messError" value="${requestScope.ERROR_MESSAGE}" />
            <c:if test="${not empty messError or not empty messSuccess}" >
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
                <c:if test="${not empty messError}">
                    toastr["error"]("${messError}");
                </c:if>
                <c:if test="${not empty messSuccess}">
                    toastr["success"]("${messSuccess}");
                </c:if>

            });
            </c:if>

        </script>
    </body>

</html>