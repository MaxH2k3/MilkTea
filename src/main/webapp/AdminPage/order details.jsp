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
                                            <tbody>
                                                <c:forEach items="${requestScope.LIST_ORDER_DETAILS}" var="order" >
                                                    <tr>
                                                        <td class="text-center">${order.orderDetailsId}</td>
                                                        <td>
                                                            <div class="d-flex align-items-center">
                                                                <div class="recent-product-img">
                                                                    <img src="data:image/jpeg;base64,${order.product.image}" alt="">
                                                                </div>
                                                                <div class="ms-2">
                                                                    <h6 class="mb-1 font-14">${order.product.name}</h6>
                                                                </div>
                                                            </div>
                                                        </td>
                                                        <td>${order.quantity}</td>
                                                        <td>${order.product.price} 000 VND</td>
                                                        <td class="category">${order.product.categoryId}</td>
                
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
            
        </script>

    </body>
</html>
