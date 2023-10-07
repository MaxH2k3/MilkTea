

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<!doctype html>
<html lang="en">

    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <%@include file="Component/importCss.jsp" %>
        <link href="AdminPage/assets/plugins/highcharts/css/highcharts.css" rel="stylesheet" />
        <link href="AdminPage/assets/plugins/vectormap/jquery-jvectormap-2.0.2.css" rel="stylesheet" />
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

                    <div class="row row-cols-1 row-cols-lg-2 row-cols-xl-4">
                        <div class="col">
                            <div class="card radius-10 overflow-hidden">
                                <div class="card-body">
                                    <div class="d-flex align-items-center">
                                        <div>
                                            <p class="mb-0">Total Orders Waiting</p>
                                            <h5 class="mb-0" id="orderWaitingNum">0</h5>
                                        </div>
                                        <div class="ms-auto"> <i class='bx bx-cart font-30'></i>
                                        </div>
                                    </div>
                                </div>
                                <div class="" id="chart1"></div>
                            </div>
                        </div>
                        <div class="col">
                            <div class="card radius-10 overflow-hidden">
                                <div class="card-body">
                                    <div class="d-flex align-items-center">
                                        <div>
                                            <p class="mb-0">Total Orders Accept</p>
                                            <h5 class="mb-0" id="orderAcceptNum">0</h5>
                                        </div>
                                        <div class="ms-auto"> <i class='bx bx-cart font-30'></i>
                                        </div>
                                    </div>
                                </div>
                                <div class="" id="chart2"></div>
                            </div>
                        </div>
                        <div class="col">
                            <div class="card radius-10 overflow-hidden">
                                <div class="card-body">
                                    <div class="d-flex align-items-center">
                                        <div>
                                            <p class="mb-0">Total Product</p>
                                            <h5 class="mb-0" id="orderProductNum">0</h5>
                                        </div>
                                        <div class="ms-auto"> <i class='bx bx-atom font-30'></i>
                                        </div>
                                    </div>
                                </div>
                                <div class="" id="chart3"></div>
                            </div>
                        </div>
                        <div class="col">
                            <div class="card radius-10 overflow-hidden">
                                <div class="card-body">
                                    <div class="d-flex align-items-center">
                                        <div>
                                            <p class="mb-0">Total Users:</p>
                                            <h5 class="mb-0" id="userNum">0</h5>
                                            <br>
                                            <p class="mb-0">Total Admin</p>
                                            <h5 class="mb-0" id="adminNum">0</h5>

                                        </div>
                                        <div class="ms-auto"> <i class='bx bx-group font-30'></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div><!--end row-->


                    <div class="row">
                        <div class="col-12 col-xl-8 d-flex">
                            <div class="card radius-10 w-100">
                                <div class="card-body">
                                    <div class="" id="chart5"></div>
                                </div>
                            </div>
                        </div>
                        <div class="col-12 col-xl-4 d-flex">
                            <div class="card radius-10 w-100">
                                <div class="card-body">
                                    <div class="d-flex align-items-center">
                                        <div>
                                            <h5 class="mb-1">Sales Target</h5>
                                        </div>
                                        <div class="font-22 ms-auto"><i class="bx bx-dots-horizontal-rounded"></i>
                                        </div>
                                    </div>
                                    <div class="mt-4" id="chart6"></div>
                                    <div class="d-flex align-items-center">
                                        <div>
                                            <h4 class="mb-0" id="shopIncome">0</h4>
                                            <p class="mb-0">/2 000 000 VND target</p>
                                        </div>
                                        <div class="ms-auto d-flex align-items-center border radius-10 px-2">
                                            <i class='bx bxs-checkbox font-22 me-1 text-primary'></i><span>Income
                                                Sales</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div><!--end row-->




                </div>
            </div>
            <!--end page wrapper -->
            <!--start overlay-->
            <div class="overlay toggle-icon"></div>
            <!--end overlay-->
            <%@include file="Component/footer.jsp" %>
        </div>
        <!--end wrapper-->
        <!--start switcher-->
        <%@include file="Component/switcher.jsp" %>
        <!--end switcher-->

        <!--plugins-->
        <%@include file="Component/importJS.jsp" %>
        <script src="AdminPage/assets/plugins/vectormap/jquery-jvectormap-2.0.2.min.js"></script>
        <script src="AdminPage/assets/plugins/vectormap/jquery-jvectormap-world-mill-en.js"></script>
        <script src="AdminPage/assets/plugins/highcharts/js/highcharts.js"></script>
        <script src="AdminPage/assets/plugins/highcharts/js/exporting.js"></script>
        <script src="AdminPage/assets/plugins/highcharts/js/variable-pie.js"></script>
        <script src="AdminPage/assets/plugins/highcharts/js/export-data.js"></script>
        <script src="AdminPage/assets/plugins/highcharts/js/accessibility.js"></script>
        <script src="AdminPage/assets/plugins/apexcharts-bundle/js/apexcharts.min.js"></script>
        <script src="AdminPage/assets/js/index2.js"></script>

        <script>
            $.ajax({
                url: "GetOrderWaiting", // Đây là URL của servlet, sử dụng annotation @WebServlet
                type: "GET",
                dataType: "json",
               success: function (data) {
                    $("#orderWaitingNum").html(data[data.length - 1]);
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    console.log("Error: " + textStatus + " - " + errorThrown);
                }
            });

            $.ajax({
                url: "GetOrderAccept", // Đây là URL của servlet, sử dụng annotation @WebServlet
                type: "GET",
                dataType: "json",
                success: function (data) {
                    $("#orderAcceptNum").html(data[data.length - 1]);
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    console.log("Error: " + textStatus + " - " + errorThrown);
                }
            });

            $.ajax({
                url: "GetAmountProduct", // Đây là URL của servlet, sử dụng annotation @WebServlet
                type: "GET",
                dataType: "json",
                success: function (data) {
                    $("#orderProductNum").html(data[data.length - 1]);
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    console.log("Error: " + textStatus + " - " + errorThrown);
                }
            });

            $.ajax({
                url: "GetAccount", // Đây là URL của servlet, sử dụng annotation @WebServlet
                type: "GET",
                dataType: "json",
                success: function (data) {
                    $("#userNum").html(data[1]);
                    $("#adminNum").html(data[0]);
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    console.log("Error: " + textStatus + " - " + errorThrown);
                }
            });

            $.ajax({
                url: "GetTotalIncome", // Đây là URL của servlet, sử dụng annotation @WebServlet
                type: "GET",
                dataType: "json",
                success: function (data) {
                    $("#shopIncome").html(data + "000");
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    console.log("Error: " + textStatus + " - " + errorThrown);
                }
            });
        </script>

    </body>

</html>
