<%-- 
    Document   : register
    Created on : Jul 11, 2023, 7:24:22 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
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
    <title>Milk Tea Store</title>
    <!-- remove button increase and decrease default of input number -->
    <style>
        .number-input input[type="number"]::-webkit-inner-spin-button,
        .number-input input[type="number"]::-webkit-outer-spin-button {
            -webkit-appearance: none;
            margin: 0;
        }

        .number-input input[type="number"] {
            appearance: textfield;
            -moz-appearance: textfield;
            /* Firefox */
        }
    </style>

</head>

<body>
    <!--wrapper-->
    <div class="wrapper">
        <div class="authentication-header"></div>
        <div class="d-flex align-items-center justify-content-center my-5 my-lg-0">
            <div class="container">
                <div class="row row-cols-1 row-cols-lg-2 row-cols-xl-2">
                    <div class="col mx-auto">
                        <div class="my-4 text-center">
                            <img src="AdminPage/assets/images/logo-img.png" width="180" alt="" />
                        </div>
                        <div class="card">
                            <div class="card-body">
                                <div class="p-4 rounded">
                                    <div class="text-center">
                                        <h3 class="">Sign Up</h3>
                                        <p>Already have an account? <a href="authentication-signin.html">Sign in
                                                here</a>
                                        </p>
                                    </div>
                                    <div class="login-separater text-center mb-4"> <span>OR SIGN UP WITH EMAIL</span>
                                        <hr />
                                    </div>
                                    <div class="form-body">
                                        <form action="registerServlet" method="POST" class="row g-3">
                                            <div class="col-sm-12">
                                                <label for="inputFirstName" class="form-label">Full Name</label>
                                                <input type="text" class="form-control" id="inputFirstName"
                                                       placeholder="Full Name" name="txtName" value="${param.txtName}" required=""
                                                       maxlength="45">
                                                <small class="text-danger">
                                                    ${requestScope.name_ERROR}
                                                </small>
                                            </div>
                                            <div class="col-sm-7">
                                                <label for="inputAddress" class="form-label">Address</label>
                                                <input type="text" class="form-control" id="inputAddress"
                                                       placeholder="address" name="txtAddress" value="${param.txtAddress}" required=""
                                                       maxlength="50">
                                                <small class="text-danger">
                                                    ${requestScope.address_ERROR}
                                                </small> 
                                            </div>
                                            <div class="col-sm-5 number-input">
                                                <label for="inputPhone" class="form-label">Phone</label>
                                                <input type="number" class="form-control" id="inputPhone" name="txtPhone"
                                                       placeholder="phone" maxlength="10" value="${param.txtPhone}" required="">
                                                <small class="text-danger">
                                                    ${requestScope.phone_ERROR}
                                                </small>
                                            </div>
                                            <div class="col-12">
                                                <label for="inputEmail" class="form-label">Email</label>
                                                <input type="email" class="form-control" id="inputEmail"
                                                       placeholder="example@user.com" name="txtEmail"
                                                       value="${param.txtEmail}" maxlength="60" required="">
                                            </div>
                                            <div class="col-12">
                                                <label for="inputUsername" class="form-label">Username</label>
                                                <input type="text" class="form-control" id="inputUsername"
                                                       placeholder="UserName" name="txtUserName"
                                                       value="${param.txtUserName}" maxlength="30" required="">
                                                <small class="text-danger">
                                                    ${requestScope.username_ERROR}
                                                </small>
                                            </div>
                                            <div class="col-12">
                                                <label for="inputPassword" class="form-label">Password</label>
                                                <div class="input-group" id="show_hide_password">
                                                    <input type="password" class="form-control border-end-0"
                                                           id="inputPassword" name="txtPassword" value="${param.txtPassword}" required=""
                                                           placeholder="Enter Password"> <a href="javascript:;"
                                                           class="input-group-text bg-transparent"><i
                                                            class='bx bx-hide'></i></a>
                                                </div>
                                                <small class="text-danger">
                                                    ${requestScope.password_ERROR}
                                                </small>
                                            </div>
                                            <div class="col-12">
                                                <label for="inputConfirmPassword" class="form-label">Confirm
                                                    Password</label>
                                                <div class="input-group" id="show_hide_password">
                                                    <input type="password" class="form-control border-end-0"
                                                           id="inputConfirmPassword" name="txtConfirmPassword" value="${param.txtConfirmPassword}" required=""
                                                           placeholder="Enter Password"> <a href="javascript:;"
                                                           class="input-group-text bg-transparent"><i
                                                            class='bx bx-hide'></i></a>
                                                </div>
                                                <small class="text-danger">
                                                    ${requestScope.confirmPassword_ERROR}
                                                </small>
                                            </div>
                                            <div class="col-6">
                                                <label for="inputSelectGender" class="form-label">Gender</label>
                                                <select class="form-select" id="inputSelectGender" name="txtGender">
                                                    <option ${param.txtGender eq 1 ? "selected":""} value="1">Male</option>
                                                    <option ${param.txtGender eq 0 ? "selected":""} value="0">Female</option>
                                                </select>
                                            </div>
                                            <c:choose>
                                                <c:when test="${sessionScope.LOGINED_USER.roleId == 1}">
                                                    <div class="col-6">
                                                        <label for="inputSelectRole" class="form-label">Role</label>
                                                        <select class="form-select" id="inputSelectRole" name="txtRole">
                                                            <option ${param.txtRole eq 1 ? "selected":""} value="1">Admin</option>
                                                            <option ${param.txtRole eq 2 ? "selected":""} value="2">Guest</option>
                                                        </select>
                                                    </div>
                                                </c:when>
                                                <c:otherwise>
                                                    <input type="hidden" name="txtRole" value="2" />
                                                </c:otherwise>
                                            </c:choose>
                                            <div class="col-12">
                                                <div class="form-check form-switch">
                                                    <input class="form-check-input" type="checkbox"
                                                           id="flexSwitchCheckChecked" required>
                                                    <label class="form-check-label" for="flexSwitchCheckChecked">I read
                                                        and agree to Terms & Conditions</label>
                                                </div>
                                            </div>
                                            <div class="col-12">
                                                <div class="d-grid">
                                                    <button type="submit" class="btn btn-primary"><i
                                                            class='bx bx-user'></i>Sign up</button>
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
    <!--Password show & hide js -->
    <script>
        $(document).ready(function () {
            $("#show_hide_password a").each(function () {
                const passwordInput = $(this).siblings('input');
                const passwordIcon = $(this).find('i');

                $(this).on('click', function (event) {
                    event.preventDefault();

                    if (passwordInput.attr("type") === "text") {
                        passwordInput.attr('type', 'password');
                        passwordIcon.addClass("bx-hide").removeClass("bx-show");
                    } else if (passwordInput.attr("type") === "password") {
                        passwordInput.attr('type', 'text');
                        passwordIcon.removeClass("bx-hide").addClass("bx-show");
                    }
                });
            });
        });

    </script>
    <!-- check max digit -->
    <script>
        checkMaxDigit();
        function checkMaxDigit() {
            let inputNums = document.getElementById("inputPhone");
            inputNums.addEventListener("input", () => {
                if (inputNums.value.length >= 12) {
                    inputNums.value = inputNums.value.slice(0, 12);
                }
            });
        }
    </script>
</body>
