<%-- 
    Document   : navigation
    Created on : Aug 13, 2023, 9:32:56 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="sidebar-wrapper" data-simplebar="true">
    <div class="sidebar-header">
        <div>
            <img src="AdminPage/assets/images/logo-icon.png" class="logo-icon" alt="logo icon">
        </div>
        <div>
            <h4 class="logo-text">Synadmin</h4>
        </div>
        <div class="toggle-icon ms-auto"><i class='bx bx-first-page'></i>
        </div>
    </div>
    <!--navigation-->
    <ul class="metismenu" id="menu">
        <li>
            <a href="adminHome">
                <div class="parent-icon"><i class='bx bx-home'></i>
                </div>
                <div class="menu-title">Dashboard</div>
            </a>
        </li>
        <li class="menu-label">Management</li>
        <li>
            <a href="javascript:;" class="has-arrow">
                <div class="parent-icon"><i class='bx bx-cart-alt'></i>
                </div>
                <div class="menu-title">eCommerce</div>
            </a>
            <ul>
                <li> <a href="searchServlet"><i class="bx bx-right-arrow-alt"></i>Product
                        Details</a>
                </li>
                <li> <a href="createServlet"><i class="bx bx-right-arrow-alt"></i>Add New
                        Products</a>
                </li>
                <li> <a href="updateServlet"><i class="bx bx-right-arrow-alt"></i>Edit Product</a>
                </li>
                <li> <a href="historyOrder"><i class="bx bx-right-arrow-alt"></i>Status Orders</a>
                </li>
                <li> <a href="viewOrderDetails"><i class="bx bx-right-arrow-alt"></i>Orders details</a>
                </li>
            </ul>
        </li>

        <li>
            <a class="has-arrow" href="javascript:;">
                <div class="parent-icon"><i class='bx bx-hourglass'></i>
                </div>
                <div class="menu-title">Account</div>
            </a>
            <ul>
                <li> <a href="searchUser"><i class="bx bx-right-arrow-alt"></i>Account Details</a>
                </li>
                <li> <a href="registerPage"><i class="bx bx-right-arrow-alt"></i>Add new Account</a>
                </li>
            </ul>
        </li>
        <li class="menu-label">Pages</li>
        <li>
            <a href="https://www.facebook.com/TTL.Huy119" target="_blank">
                <div class="parent-icon"><i class='bx bx-headphone'></i>
                </div>
                <div class="menu-title">Support</div>
            </a>
        </li>
    </ul>
    <!--end navigation-->
</div>
