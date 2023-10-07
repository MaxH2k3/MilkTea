<%-- 
    Document   : acount
    Created on : Aug 14, 2023, 9:40:51 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!--favicon-->
        <link rel="icon" href="assets/images/favicon-32x32.png" type="image/png" />
        <!--fontawsome-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <!--plugins-->
        <link href="assets/plugins/simplebar/css/simplebar.css" rel="stylesheet" />
        <link href="assets/plugins/perfect-scrollbar/css/perfect-scrollbar.css" rel="stylesheet" />
        <link href="assets/plugins/metismenu/css/metisMenu.min.css" rel="stylesheet" />
        <!-- loader-->
        <link href="assets/css/pace.min.css" rel="stylesheet" />
        <script src="assets/js/pace.min.js"></script>
        <!-- Bootstrap CSS -->
        <link href="assets/css/bootstrap.min.css" rel="stylesheet">
        <link href="assets/css/bootstrap-extended.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500&display=swap" rel="stylesheet">
        <link href="assets/css/app.css" rel="stylesheet">
        <link href="assets/css/icons.css" rel="stylesheet">
        <!-- Theme Style CSS -->
        <link rel="stylesheet" href="assets/css/dark-theme.css" />
        <link rel="stylesheet" href="assets/css/semi-dark.css" />
        <link rel="stylesheet" href="assets/css/header-colors.css" />
        <!-- Custom css -->
        <link rel="stylesheet" href="assets/css/style.css" />
        
        <title>Milk Tea Store</title>
    </head>
    <body>
        <div class="wrapper">
            <!--sidebar wrapper -->
            <%@include file="Component/navigation.jsp" %>
            <!--end sidebar wrapper -->
            <!--start header -->
            <%@include file="Component/header.jsp" %>
            <!--end header -->
            <div class="page-wrapper">
                <div class="page-content">
                    <div class="card radius-10">
                        <div class="card-header border-bottom-0 bg-transparent">
                            <div class="d-flex align-items-center justify-content-between">
                                <div>
                                    <h5 class="font-weight-bold mb-0">Information Staff</h5>
                                </div>
                                <div class="filter-account" style="margin-right: 1rem">
                                    <form class="row ">
                                        <div class="d-flex align-items-center justify-content-between">
                                            <input  type="text" class="form-control" name="search" value="${param.search}" placeholder="Search" >
                                            <button type="submit" name="btAction" value="searchAccount" class="btn btn-white">
                                                <i class="fa-solid fa-magnifying-glass"></i>
                                            </button>
                                        </div>

                                    </form>

                                </div>
                            </div>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table mb-0 align-middle">
                                    <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>Name</th>
                                            <th>Address</th>
                                            <th>phone</th>
                                            <th>Email</th>
                                            <th>Role</th>
                                            <th>Status</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>
                                                <div class="product-img bg-transparent border">
                                                    <img src="assets/images/icons/shoes.png" class="p-1" alt="">
                                                </div>
                                            </td>
                                            <td>Nike Sports NK</td>
                                            <td>Mitchell Daniel</td>
                                            <td>#9668521</td>
                                            <td>$99.85</td>
                                            <td><a href="javaScript:;" class="btn btn-sm btn-success radius-30">Delivered</a>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
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

        <!-- Bootstrap JS -->
        <script src="assets/js/bootstrap.bundle.min.js"></script>
        <!--plugins-->
        <script src="assets/js/jquery.min.js"></script>
        <script src="assets/plugins/simplebar/js/simplebar.min.js"></script>
        <script src="assets/plugins/metismenu/js/metisMenu.min.js"></script>
        <script src="assets/plugins/perfect-scrollbar/js/perfect-scrollbar.js"></script>
        <script src="assets/plugins/apexcharts-bundle/js/apexcharts.min.js"></script>
        <script src="assets/js/index3.js"></script>
        <!--app JS-->
        <script src="assets/js/app.js"></script>
    </body>
</html>
