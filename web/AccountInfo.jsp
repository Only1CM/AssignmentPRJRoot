<%-- 
    Document   : AccountInfo
    Created on : Jun 27, 2024, 12:37:53 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.User"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">

        <title>Account Information</title>
        <meta content="" name="description">
        <meta content="" name="keywords">

        <!-- Favicons -->
        <link href="assets/img/favicon.png" rel="icon">
        <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">
        <link rel="stylesheet" href="AccountInfo.css">

        <!-- Google Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,600;1,700&family=Amatic+SC:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&family=Inter:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap" rel="stylesheet">

        <!-- Vendor CSS Files -->
        <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
        <link href="assets/vendor/aos/aos.css" rel="stylesheet">
        <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
        <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

        <!-- Template Main CSS File -->
        <link href="assets/css/main.css" rel="stylesheet">

        <!-- =======================================================
        * Template Name: Yummy
        * Template URL: https://bootstrapmade.com/yummy-bootstrap-restaurant-website-template/
        * Updated: Mar 17 2024 with Bootstrap v5.3.3
        * Author: BootstrapMade.com
        * License: https://bootstrapmade.com/license/
        ======================================================== -->
    </head>
    <body>

        <!-- ======= Header ======= -->
        <header id="header" class="header fixed-top d-flex align-items-center">
            <div class="container d-flex align-items-center justify-content-between">

                <a href="index.html" class="logo d-flex align-items-center me-auto me-lg-0">
                    <!-- Uncomment the line below if you also wish to use an image logo -->
                    <!-- <img src="assets/img/logo.png" alt=""> -->
                    <h1>Account Information<span>.</span></h1>
                </a>

                <%
                    User userInfo = (User) session.getAttribute("user");
                    String helloUser = userInfo.getLast_name() + userInfo.getFirst_name();
                %>
                <nav id="navbar" class="navbar" style="margin-left: 20%;">
                    <div>
                        <li style="list-style-type: none" ><a href="Login.jsp">Home</a></li>
                        <li style="list-style-type: none" class="dropdown"><a class="btn-book-a-table">Hello <%=helloUser%></a>
                            <ul>
                                <li><a href="/AssignmentPRJRoot/AccountInfo.jsp">Thông tin tài khoản</a></li>
                                <li><a href="/AssignmentPRJRoot/ChangePassword,jsp">Đổi mật khẩu</a></li>
                                <li><a href="/AssignmentPRJRoot/logout">Đăng xuất</a></li>
                            </ul>
                        </li>
                        </ul>
                    </div>
                </nav>
                <i class="mobile-nav-toggle mobile-nav-show bi bi-list"></i>
                <i class="mobile-nav-toggle mobile-nav-hide d-none bi bi-x"></i>

            </div>
        </header><!-- End Header -->
        <!-- ======= Hero Section ======= -->
        <section id="hero" class="hero d-flex align-items-center section-bg" style="padding-bottom: 600px;">
            <div class="container-fluid">
                <div class="khongcogi">Khong co gi ca</div>
                <div class="name">
                    <h1>First Name</h1>
                    <input name="first_name" value="${sessionScope.user.first_name}">
                    <h1>Last Name</h1>
                    <input name="first_name" value="${sessionScope.user.last_name}">
                </div>
            </div>
        </section><!-- End Hero Section -->
    </body>
</html>
