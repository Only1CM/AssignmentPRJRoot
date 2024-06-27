<%-- 
    Document   : UserPage
    Created on : May 25, 2024, 12:56:10 AM
    Author     : Admin
--%>

<%@page import="model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">

        <title>Yummy Bootstrap Template - Index</title>
        <meta content="" name="description">
        <meta content="" name="keywords">

        <!-- Favicons -->
        <link href="assets/img/favicon.png" rel="icon">
        <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

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
                    <h1>Yummy<span>.</span></h1>
                </a>


                <nav id="navbar" class="navbar" style="margin-left: 20%">
                    <ul>
                        <li><a href="#hero">Home</a></li>
                        <li><a href="#menu">Menu</a></li>
                        <li><a href="#events">Events</a></li>
                        <li><a href="#chefs">Chefs</a></li>
                        <li><a href="#contact">Contact</a></li>
                        <li><a href="/AssignmentPRJRoot/OrderedList">Đơn hàng của bạn</a></li>
                </nav><!-- .navbar -->

                <%-- Phân quyền chỉ tài khoản có role là User mới được vào trang này--%>
                <%
                    if (session.getAttribute("user") == null) {
                        request.setAttribute("error", "Please login first");
                        request.getRequestDispatcher("Login.jsp").forward(request, response);
                    } else {
                        User checkUser = (User) session.getAttribute("user");
                        if (!checkUser.getRole().equalsIgnoreCase("User")) {
                            request.setAttribute("error", "Your account do not have permission to access");
                            session.removeAttribute("user");
                            request.getRequestDispatcher("Login.jsp").forward(request, response);
                        }
                    }
                %>
                <nav id="navbar" class="navbar" style="margin-left: 30%">
                    <div>
                        <li style="list-style-type: none" class="dropdown"><a class="btn-book-a-table">Hello ${sessionScope.user.username}</a>
                            <ul>
                                <li><a href="/AssignmentPRJRoot/AccountInfo">Thông tin tài khoản</a></li>
                                <li><a href="/AssignmentPRJRoot/ChangePassword">Đổi mật khẩu</a></li>
                                <li><a href="/AssignmentPRJRoot/logout">Đăng xuất</a></li>
                            </ul>
                        </li>
                        </ul>
                    </div>
                </nav>
                <div>
                    <i class="mobile-nav-toggle mobile-nav-show bi bi-list"></i>
                    <i class="mobile-nav-toggle mobile-nav-hide d-none bi bi-x"></i>

                </div>
        </header><!-- End Header -->

        <!-- ======= Hero Section ======= -->
        <section id="hero" class="hero d-flex align-items-center section-bg">
            <div class="container">
                <div class="row justify-content-between gy-5">
                    <div class="col-lg-5 order-2 order-lg-1 d-flex flex-column justify-content-center align-items-center align-items-lg-start text-center text-lg-start">
                        <h2 data-aos="fade-up">Enjoy Your Healthy<br>Delicious Food</h2>
                        <p data-aos="fade-up" data-aos-delay="100">Sed autem laudantium dolores. Voluptatem itaque ea consequatur eveniet. Eum quas beatae cumque eum quaerat.</p>
                        <div class="d-flex" data-aos="fade-up" data-aos-delay="200">
                            <a href="#book-a-table" class="btn-book-a-table">Book a Table</a>
                            <a href="https://www.youtube.com/watch?v=LXb3EKWsInQ" class="glightbox btn-watch-video d-flex align-items-center"><i class="bi bi-play-circle"></i><span>Watch Video</span></a>
                        </div>
                    </div>
                    <div class="col-lg-5 order-1 order-lg-2 text-center text-lg-start">
                        <img src="assets/img/hero-img.png" class="img-fluid" alt="" data-aos="zoom-out" data-aos-delay="300">
                    </div>
                </div>
            </div>
        </section><!-- End Hero Section -->

        <main id="main">

            <!-- ======= Menu Section ======= -->
            <section id="menu" class="menu">
                <div class="container" data-aos="fade-up">

                    <div class="section-header">
                        <h2>Our Menu</h2>
                        <p>Check Our <span>Yummy Menu</span></p>
                    </div>

                    <ul class="nav nav-tabs d-flex justify-content-center" data-aos="fade-up" data-aos-delay="200">

                        <li class="nav-item">
                            <a class="nav-link active show" data-bs-toggle="tab" data-bs-target="#menu-starters">
                                <h4>Starters</h4>
                            </a>
                        </li><!-- End tab nav item -->

                        <li class="nav-item">
                            <a class="nav-link" data-bs-toggle="tab" data-bs-target="#menu-breakfast">
                                <h4>Breakfast</h4>
                            </a><!-- End tab nav item -->

                        <li class="nav-item">
                            <a class="nav-link" data-bs-toggle="tab" data-bs-target="#menu-lunch">
                                <h4>Lunch</h4>
                            </a>
                        </li><!-- End tab nav item -->

                        <li class="nav-item">
                            <a class="nav-link" data-bs-toggle="tab" data-bs-target="#menu-dinner">
                                <h4>Dinner</h4>
                            </a>
                        </li><!-- End tab nav item -->

                    </ul>

                    <div class="tab-content" data-aos="fade-up" data-aos-delay="300">

                        <div class="tab-pane fade active show" id="menu-starters">

                            <div class="tab-header text-center">
                                <p>Menu</p>
                                <h3>Starters</h3>
                            </div>

                            <div class="row gy-5">

                                <div class="col-lg-4 menu-item" id="food-img">
                                    <a href="assets/img/menu/phở bò.png" class="glightbox"><img src="assets/img/menu/phở bò.png" class="menu-img img-fluid" alt=""></a>
                                    <h4>Phở Bò</h4>
                                    <p class="ingredients">Phở bò truyền thống</p>
                                    <p class="price">50,000đ</p>
                                    <p>
                                        <button name="button" type="button" class="btn-each-food">Đặt món</button>

                                    </p>
                                </div><!-- Menu Item -->
                                <div class="col-lg-4 menu-item" id="food-img">
                                    <a href="assets/img/menu/bún chả.png" class="glightbox"><img src="assets/img/menu/bún chả.png" class="menu-img img-fluid" alt=""></a>
                                    <h4>Bún Chả</h4>
                                    <p>

                                    <p class="ingredients">Bún chả Hà Nội</p>
                                    <p class="price">40,000đ</p>
                                    <p>
                                        <button name="button" type="button" class="btn-each-food">Đặt món</button>

                                    </p>
                                </div><!-- Menu Item -->
                                <div class="col-lg-4 menu-item" id="food-img">
                                    <a href="assets/img/menu/bún bò huế.png" class="glightbox"><img src="assets/img/menu/bún bò huế.png" class="menu-img img-fluid" alt=""></a>
                                    <h4>Bún Bò Huế</h4>
                                    <p class="ingredients">Bún bò Huế cay nồng</p>
                                    <p class="price">50,000đ</p>
                                    <p>
                                        <button name="button" type="button" class="btn-each-food">Đặt món</button>

                                    </p>
                                </div><!-- Menu Item -->
                                <div class="col-lg-4 menu-item" id="food-img">
                                    <a href="assets/img/menu/bánh xèo.png" class="glightbox"><img src="assets/img/menu/bánh xèo.png" class="menu-img img-fluid" alt=""></a>
                                    <h4>Bánh xèo</h4>
                                    <p class="ingredients">Bánh xèo ngũ vị</p>
                                    <p class="price">20,000đ</p>
                                    <p>
                                        <button name="button" type="button" class="btn-each-food">Đặt món</button>

                                    </p>
                                </div><!-- Menu Item -->
                                <div class="col-lg-4 menu-item" id="food-img">
                                    <a href="assets/img/menu/gà luộc.png" class="glightbox"><img src="assets/img/menu/gà luộc.png" class="menu-img img-fluid" alt=""></a>
                                    <h4>Gà Luộc</h4>
                                    <p class="ingredients">Gà luộc nguyên con</p>
                                    <p class="price">45,000đ</p>
                                    <p>
                                        <button name="button" type="button" class="btn-each-food">Đặt món</button>

                                    </p>
                                </div><!-- Menu Item -->
                                <div class="col-lg-4 menu-item" id="food-img">
                                    <a href="assets/img/menu/hủ tiếu.png" class="glightbox"><img src="assets/img/menu/hủ tiếu.png" class="menu-img img-fluid" alt=""></a>
                                    <h4>Hủ Tiếu</h4>
                                    <p class="ingredients">Hủ tiếu Nam Vang</p>
                                    <p class="price">40,000đ</p>
                                    <p>
                                        <button name="button" type="button" class="btn-each-food">Đặt món</button>

                                    </p>
                                </div><!-- Menu Item -->
                            </div>
                        </div><!-- End Starter Menu Content -->

                        <div class="tab-pane fade" id="menu-breakfast">

                            <div class="tab-header text-center">
                                <p>Thực đơn</p>
                                <h3>Bữa sáng</h3>
                            </div>

                            <div class="row gy-5">

                                <div class="col-lg-4 menu-item" id="food-img">
                                    <a href="assets/img/menu/phở bò.png" class="glightbox"><img src="assets/img/menu/phở bò.png" class="menu-img img-fluid" alt="" ></a>

                                    <h4>Phở Bò</h4>
                                    <p class="ingredients">
                                        Phở bò truyền thống
                                    </p>
                                    <p class="price">
                                        50,000đ
                                    </p>

                                    <p>
                                        <button name="button" type="button" class="btn-each-food">Đặt món</button>

                                    </p>

                                </div><!-- Menu Item -->

                                <div class="col-lg-4 menu-item" id="food-img">
                                    <a href="assets/img/menu/bún chả.png" class="glightbox"><img src="assets/img/menu/bún chả.png" class="menu-img img-fluid" alt=""></a>
                                    <h4>
                                        Bún Chả</h4>
                                    <p class="ingredients">
                                        Bún chả Hà Nội
                                    </p>
                                    <p class="price">
                                        40,000đ
                                    </p>
                                    <p>
                                        <button name="button" type="button" class="btn-each-food">Đặt món</button>

                                    </p>
                                </div><!-- Menu Item -->

                                <div class="col-lg-4 menu-item" id="food-img">
                                    <a href="assets/img/menu/bánh mì_1.png" class="glightbox"><img src="assets/img/menu/bánh mì_1.png" class="menu-img img-fluid" alt=""></a>
                                    <h4>Bánh Mì</h4>
                                    <p class="ingredients">
                                        Bánh mì thịt nướng
                                    </p>
                                    <p class="price">
                                        20,000đ
                                    </p>
                                    <p>
                                        <button name="button" type="button" class="btn-each-food">Đặt món</button>

                                    </p>
                                </div><!-- Menu Item -->

                                <div class="col-lg-4 menu-item" id="food-img">
                                    <a href="assets/img/menu/mì xào.png" class="glightbox"><img src="assets/img/menu/mì xào.png" class="menu-img img-fluid" alt=""></a>
                                    <h4>Mì xào</h4>
                                    <p class="ingredients">
                                        Mì xào thập cẩm
                                    </p>
                                    <p class="price">
                                        25.000đ
                                    </p>
                                    <p>
                                        <button name="button" type="button" class="btn-each-food">Đặt món</button>

                                    </p>
                                </div><!-- Menu Item -->

                                <div class="col-lg-4 menu-item" id="food-img">
                                    <a href="assets/img/menu/bánh xèo.png" class="glightbox"><img src="assets/img/menu/bánh xèo.png" class="menu-img img-fluid" alt=""></a>
                                    <h4>Bánh xèo</h4>
                                    <p class="ingredients">Bánh xèo ngũ vị</p>
                                    <p class="price">20,000đ</p>
                                    <p>
                                        <button name="button" type="button" class="btn-each-food">Đặt món</button>

                                    </p>
                                </div><!-- Menu Item -->

                                <div class="col-lg-4 menu-item" id="food-img">
                                    <a href="assets/img/menu/bún bò huế.png" class="glightbox"><img src="assets/img/menu/bún bò huế.png" class="menu-img img-fluid" alt=""></a>
                                    <h4>Bún Bò Huế</h4>
                                    <p class="ingredients">
                                        Bún bò Huế cay nồng
                                    </p>
                                    <p class="price">
                                        50,000đ
                                    </p>
                                    <p>
                                        <button name="button" type="button" class="btn-each-food">Đặt món</button>

                                    </p>
                                </div><!-- Menu Item -->

                            </div>
                        </div><!-- End Breakfast Menu Content -->

                        <div class="tab-pane fade" id="menu-lunch">

                            <div class="tab-header text-center">
                                <p>Thực đơn</p>
                                <h3>Bữa trưa</h3>
                            </div>

                            <div class="row gy-5">

                                <div class="col-lg-4 menu-item" id="food-img">
                                    <a href="assets/img/menu/gà luộc.png" class="glightbox"><img src="assets/img/menu/gà luộc.png" class="menu-img img-fluid" alt=""></a>
                                    <h4>Gà luộc</h4>
                                    <p class="ingredients">
                                        Gà luộc nguyên con
                                    </p>
                                    <p class="price">
                                        45,000đ
                                    </p>
                                    <p>
                                        <button name="button" type="button" class="btn-each-food">Đặt món</button>

                                    </p>
                                </div><!-- Menu Item -->

                                <div class="col-lg-4 menu-item" id="food-img">
                                    <a href="assets/img/menu/chả giò vn.png" class="glightbox"><img src="assets/img/menu/chả giò vn.png" class="menu-img img-fluid" alt=""></a>
                                    <h4>Chả giò</h4>
                                    <p class="ingredients">
                                        Chả giò chiên giòn
                                    </p>
                                    <p class="price">
                                        25.000đ
                                    </p>
                                    <p>
                                        <button name="button" type="button" class="btn-each-food">Đặt món</button>

                                    </p>
                                </div><!-- Menu Item -->

                                <div class="col-lg-4 menu-item" id="food-img">
                                    <a href="assets/img/menu/nem rán.png" class="glightbox"><img src="assets/img/menu/nem rán.png" class="menu-img img-fluid" alt=""></a>
                                    <h4>Nem Rán</h4>
                                    <p class="ingredients">
                                        Nem rán Hà Nội
                                    </p>
                                    <p class="price">
                                        30,000đ
                                    </p>
                                    <p>
                                        <button name="button" type="button" class="btn-each-food">Đặt món</button>

                                    </p>
                                </div><!-- Menu Item -->

                                <div class="col-lg-4 menu-item" id="food-img">
                                    <a href="assets/img/menu/mỳ quảng.png" class="glightbox"><img src="assets/img/menu/mỳ quảng.png" class="menu-img img-fluid" alt=""></a>
                                    <h4>Mì Quảng</h4>
                                    <p class="ingredients">
                                        Mì Quảng Đà Nẵng
                                    </p>
                                    <p class="price">
                                        40,000đ
                                    </p>
                                    <p>
                                        <button name="button" type="button" class="btn-each-food">Đặt món</button>

                                    </p>
                                </div><!-- Menu Item -->

                                <div class="col-lg-4 menu-item" id="food-img">
                                    <a href="assets/img/menu/cháo lòng1.png" class="glightbox"><img src="assets/img/menu/cháo lòng1.png" class="menu-img img-fluid" alt=""></a>
                                    <h4>Cháo Lòng</h4>
                                    <p class="ingredients">
                                        Cháo lòng Hà Nội
                                    </p>
                                    <p class="price">
                                        30,000đ
                                    </p>
                                    <p>
                                        <button name="button" type="button" class="btn-each-food">Đặt món</button>

                                    </p>
                                </div><!-- Menu Item -->

                                <div class="col-lg-4 menu-item" id="food-img">
                                    <a href="assets/img/menu/mì xào.png" class="glightbox"><img src="assets/img/menu/mì xào.png" class="menu-img img-fluid" alt=""></a>
                                    <h4>Mỳ xào</h4>
                                    <p class="ingredients">
                                        Mỳ xào thập cẩm
                                    </p>
                                    <p class="price">
                                        45,000đ
                                    </p>
                                    <p>
                                        <button name="button" type="button" class="btn-each-food">Đặt món</button>

                                    </p>
                                </div><!-- Menu Item -->

                            </div>
                        </div><!-- End Lunch Menu Content -->

                        <div class="tab-pane fade" id="menu-dinner">

                            <div class="tab-header text-center">
                                <p>Thực đơn</p>
                                <h3>Bữa tối</h3>
                            </div>

                            <div class="row gy-5">

                                <div class="col-lg-4 menu-item" id="food-img">
                                    <a href="assets/img/menu/gỏi cuốn.png" class="glightbox"><img src="assets/img/menu/gỏi cuốn.png" class="menu-img img-fluid" alt=""></a>
                                    <h4>Gỏi Cuốn</h4>
                                    <p class="ingredients">
                                        Gỏi cuốn tôm thịt
                                    </p>
                                    <p class="price">
                                        30,000đ
                                    </p>
                                    <p>
                                        <button name="button" type="button" class="btn-each-food">Đặt món</button>

                                    </p>
                                </div><!-- Menu Item -->

                                <div class="col-lg-4 menu-item" id="food-img">
                                    <a href="assets/img/menu/nem rán.png" class="glightbox"><img src="assets/img/menu/nem rán.png" class="menu-img img-fluid" alt=""></a>
                                    <h4>Nem Rán</h4>
                                    <p class="ingredients">
                                        Nem rán Hà Nội
                                    </p>
                                    <p class="price">
                                        30,000đ
                                    </p>
                                    <p>
                                        <button name="button" type="button" class="btn-each-food">Đặt món</button>

                                    </p>
                                </div><!-- Menu Item -->

                                <div class="col-lg-4 menu-item" id="food-img">
                                    <a href="assets/img/menu/hủ tiếu.png" class="glightbox"><img src="assets/img/menu/hủ tiếu.png" class="menu-img img-fluid" alt=""></a>
                                    <h4>Hủ Tiếu</h4>
                                    <p class="ingredients">
                                        Hủ tiếu Nam Vang
                                    </p>
                                    <p class="price">
                                        40,000đ
                                    </p>
                                    <p>
                                        <button name="button" type="button" class="btn-each-food">Đặt món</button>

                                    </p>
                                </div><!-- Menu Item -->

                                <div class="col-lg-4 menu-item" id="food-img">
                                    <a href="assets/img/menu/nem rán.png" class="glightbox"><img src="assets/img/menu/nem rán.png" class="menu-img img-fluid" alt=""></a>
                                    <h4>Nem Rán</h4>
                                    <p class="ingredients">
                                        Nem rán Hà Nội
                                    </p>
                                    <p class="price">
                                        30,000đ
                                    </p>
                                    <p>
                                        <button name="button" type="button" class="btn-each-food">Đặt món</button>

                                    </p>
                                </div><!-- Menu Item -->

                                <div class="col-lg-4 menu-item" id="food-img">
                                    <a href="assets/img/menu/gà luộc.png" class="glightbox"><img src="assets/img/menu/gà luộc.png" class="menu-img img-fluid" alt=""></a>
                                    <h4>Gà luộc</h4>
                                    <p class="ingredients">
                                        Gà luộc nguyên con
                                    </p>
                                    <p class="price">
                                        45,000đ
                                    </p>
                                    <p>
                                        <button name="button" type="button" class="btn-each-food">Đặt món</button>

                                    </p>
                                </div><!-- Menu Item -->

                                <div class="col-lg-4 menu-item" id="food-img">
                                    <a href="assets/img/menu/cháo lòng1.png" class="glightbox"><img src="assets/img/menu/cháo lòng1.png" class="menu-img img-fluid" alt=""></a>
                                    <h4>Cháo Lòng</h4>
                                    <p class="ingredients">
                                        Cháo lòng Hà Nội
                                    </p>
                                    <p class="price">
                                        30,000đ
                                    </p>
                                    <p>
                                        <button name="button" type="button" class="btn-each-food">Đặt món</button>

                                    </p>
                                </div><!-- Menu Item -->

                            </div>
                        </div><!-- End Dinner Menu Content -->

                    </div>

                </div>
            </section><!-- End Menu Section -->
            <!-- ======= Events Section ======= -->
            <section id="events" class="events">
                <div class="container-fluid" data-aos="fade-up">

                    <div class="section-header">
                        <h2>Events</h2>
                        <p>Share <span>Your Moments</span> In Our Restaurant</p>
                    </div>

                    <div class="slides-3 swiper" data-aos="fade-up" data-aos-delay="100">
                        <div class="swiper-wrapper">

                            <div class="swiper-slide event-item d-flex flex-column justify-content-end" style="background-image: url(assets/img/events-1.jpg)">
                                <h3>Custom Parties</h3>
                                <div class="price align-self-start">$99</div>
                                <p class="description">
                                    Quo corporis voluptas ea ad. Consectetur inventore sapiente ipsum voluptas eos omnis facere. Enim facilis veritatis id est rem repudiandae nulla expedita quas.
                                </p>
                            </div><!-- End Event item -->

                            <div class="swiper-slide event-item d-flex flex-column justify-content-end" style="background-image: url(assets/img/events-2.jpg)">
                                <h3>Private Parties</h3>
                                <div class="price align-self-start">$289</div>
                                <p class="description">
                                    In delectus sint qui et enim. Et ab repudiandae inventore quaerat doloribus. Facere nemo vero est ut dolores ea assumenda et. Delectus saepe accusamus aspernatur.
                                </p>
                            </div><!-- End Event item -->

                            <div class="swiper-slide event-item d-flex flex-column justify-content-end" style="background-image: url(assets/img/events-3.jpg)">
                                <h3>Birthday Parties</h3>
                                <div class="price align-self-start">$499</div>
                                <p class="description">
                                    Laborum aperiam atque omnis minus omnis est qui assumenda quos. Quis id sit quibusdam. Esse quisquam ducimus officia ipsum ut quibusdam maxime. Non enim perspiciatis.
                                </p>
                            </div><!-- End Event item -->

                        </div>
                        <div class="swiper-pagination"></div>
                    </div>

                </div>
            </section><!-- End Events Section -->

            <!-- ======= Chefs Section ======= -->
            <section id="chefs" class="chefs section-bg">
                <div class="container" data-aos="fade-up">

                    <div class="section-header">
                        <h2>Chefs</h2>
                        <p>Our <span>Proffesional</span> Chefs</p>
                    </div>

                    <div class="row gy-4">

                        <div class="col-lg-4 col-md-6 d-flex align-items-stretch" data-aos="fade-up" data-aos-delay="100">
                            <div class="chef-member">
                                <div class="member-img">
                                    <img src="assets/img/chefs/chefs-1.jpg" class="img-fluid" alt="">
                                    <div class="social">
                                        <a href=""><i class="bi bi-twitter"></i></a>
                                        <a href=""><i class="bi bi-facebook"></i></a>
                                        <a href=""><i class="bi bi-instagram"></i></a>
                                        <a href=""><i class="bi bi-linkedin"></i></a>
                                    </div>
                                </div>
                                <div class="member-info">
                                    <h4>Walter White</h4>
                                    <span>Master Chef</span>
                                    <p>Velit aut quia fugit et et. Dolorum ea voluptate vel tempore tenetur ipsa quae aut. Ipsum exercitationem iure minima enim corporis et voluptate.</p>
                                </div>
                            </div>
                        </div><!-- End Chefs Member -->

                        <div class="col-lg-4 col-md-6 d-flex align-items-stretch" data-aos="fade-up" data-aos-delay="200">
                            <div class="chef-member">
                                <div class="member-img">
                                    <img src="assets/img/chefs/chefs-2.jpg" class="img-fluid" alt="">
                                    <div class="social">
                                        <a href=""><i class="bi bi-twitter"></i></a>
                                        <a href=""><i class="bi bi-facebook"></i></a>
                                        <a href=""><i class="bi bi-instagram"></i></a>
                                        <a href=""><i class="bi bi-linkedin"></i></a>
                                    </div>
                                </div>
                                <div class="member-info">
                                    <h4>Sarah Jhonson</h4>
                                    <span>Patissier</span>
                                    <p>Quo esse repellendus quia id. Est eum et accusantium pariatur fugit nihil minima suscipit corporis. Voluptate sed quas reiciendis animi neque sapiente.</p>
                                </div>
                            </div>
                        </div><!-- End Chefs Member -->

                        <div class="col-lg-4 col-md-6 d-flex align-items-stretch" data-aos="fade-up" data-aos-delay="300">
                            <div class="chef-member">
                                <div class="member-img">
                                    <img src="assets/img/chefs/chefs-3.jpg" class="img-fluid" alt="">
                                    <div class="social">
                                        <a href=""><i class="bi bi-twitter"></i></a>
                                        <a href=""><i class="bi bi-facebook"></i></a>
                                        <a href=""><i class="bi bi-instagram"></i></a>
                                        <a href=""><i class="bi bi-linkedin"></i></a>
                                    </div>
                                </div>
                                <div class="member-info">
                                    <h4>William Anderson</h4>
                                    <span>Cook</span>
                                    <p>Vero omnis enim consequatur. Voluptas consectetur unde qui molestiae deserunt. Voluptates enim aut architecto porro aspernatur molestiae modi.</p>
                                </div>
                            </div>
                        </div><!-- End Chefs Member -->

                    </div>

                </div>
            </section><!-- End Chefs Section -->

            <!-- ======= Contact Section ======= -->
            <section id="contact" class="contact">
                <div class="container" data-aos="fade-up">

                    <div class="section-header">
                        <h2>Contact</h2>
                        <p>Need Help? <span>Contact Us</span></p>
                    </div>

                    <div class="mb-3">
                        <iframe style="border:0; width: 100%; height: 350px;" src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d12097.433213460943!2d-74.0062269!3d40.7101282!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0xb89d1fe6bc499443!2sDowntown+Conference+Center!5e0!3m2!1smk!2sbg!4v1539943755621" frameborder="0" allowfullscreen></iframe>
                    </div><!-- End Google Maps -->

                    <div class="row gy-4">

                        <div class="col-md-6">
                            <div class="info-item  d-flex align-items-center">
                                <i class="icon bi bi-map flex-shrink-0"></i>
                                <div>
                                    <h3>Our Address</h3>
                                    <p>A108 Adam Street, New York, NY 535022</p>
                                </div>
                            </div>
                        </div><!-- End Info Item -->

                        <div class="col-md-6">
                            <div class="info-item d-flex align-items-center">
                                <i class="icon bi bi-envelope flex-shrink-0"></i>
                                <div>
                                    <h3>Email Us</h3>
                                    <p>contact@example.com</p>
                                </div>
                            </div>
                        </div><!-- End Info Item -->

                        <div class="col-md-6">
                            <div class="info-item  d-flex align-items-center">
                                <i class="icon bi bi-telephone flex-shrink-0"></i>
                                <div>
                                    <h3>Call Us</h3>
                                    <p>+1 5589 55488 55</p>
                                </div>
                            </div>
                        </div><!-- End Info Item -->

                        <div class="col-md-6">
                            <div class="info-item  d-flex align-items-center">
                                <i class="icon bi bi-share flex-shrink-0"></i>
                                <div>
                                    <h3>Opening Hours</h3>
                                    <div><strong>Mon-Sat:</strong> 11AM - 23PM;
                                        <strong>Sunday:</strong> Closed
                                    </div>
                                </div>
                            </div>
                        </div><!-- End Info Item -->

                    </div>

                    <form action="forms/contact.php" method="post" role="form" class="php-email-form p-3 p-md-4">
                        <div class="row">
                            <div class="col-xl-6 form-group">
                                <input type="text" name="name" class="form-control" id="name" placeholder="Your Name" required>
                            </div>
                            <div class="col-xl-6 form-group">
                                <input type="email" class="form-control" name="email" id="email" placeholder="Your Email" required>
                            </div>
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control" name="subject" id="subject" placeholder="Subject" required>
                        </div>
                        <div class="form-group">
                            <textarea class="form-control" name="message" rows="5" placeholder="Message" required></textarea>
                        </div>
                        <div class="my-3">
                            <div class="loading">Loading</div>
                            <div class="error-message"></div>
                            <div class="sent-message">Your message has been sent. Thank you!</div>
                        </div>
                        <div class="text-center"><button type="submit">Send Message</button></div>
                    </form><!--End Contact Form -->

                </div>
            </section><!-- End Contact Section -->

        </main><!-- End #main -->

        <!-- ======= Footer ======= -->
        <footer id="footer" class="footer">

            <div class="container">
                <div class="row gy-3">
                    <div class="col-lg-3 col-md-6 d-flex">
                        <i class="bi bi-geo-alt icon"></i>
                        <div>
                            <h4>Address</h4>
                            <p>
                                A108 Adam Street <br>
                                New York, NY 535022 - US<br>
                            </p>
                        </div>

                    </div>

                    <div class="col-lg-3 col-md-6 footer-links d-flex">
                        <i class="bi bi-telephone icon"></i>
                        <div>
                            <h4>Reservations</h4>
                            <p>
                                <strong>Phone:</strong> +1 5589 55488 55<br>
                                <strong>Email:</strong> info@example.com<br>
                            </p>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6 footer-links d-flex">
                        <i class="bi bi-clock icon"></i>
                        <div>
                            <h4>Opening Hours</h4>
                            <p>
                                <strong>Mon-Sat: 11AM</strong> - 23PM<br>
                                Sunday: Closed
                            </p>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6 footer-links">
                        <h4>Follow Us</h4>
                        <div class="social-links d-flex">
                            <a href="#" class="twitter"><i class="bi bi-twitter"></i></a>
                            <a href="#" class="facebook"><i class="bi bi-facebook"></i></a>
                            <a href="#" class="instagram"><i class="bi bi-instagram"></i></a>
                            <a href="#" class="linkedin"><i class="bi bi-linkedin"></i></a>
                        </div>
                    </div>

                </div>
            </div>

            <div class="container">
                <div class="copyright">
                    &copy; Copyright <strong><span>Yummy</span></strong>. All Rights Reserved
                </div>
                <div class="credits">
                    <!-- All the links in the footer should remain intact. -->
                    <!-- You can delete the links only if you purchased the pro version. -->
                    <!-- Licensing information: https://bootstrapmade.com/license/ -->
                    <!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/yummy-bootstrap-restaurant-website-template/ -->
                    Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
                </div>
            </div>

        </footer><!-- End Footer -->
        <!-- End Footer -->

        <a href="#" class="scroll-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

        <div id="preloader"></div>

        <!-- Vendor JS Files -->
        <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="assets/vendor/aos/aos.js"></script>
        <script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
        <script src="assets/vendor/purecounter/purecounter_vanilla.js"></script>
        <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
        <script src="assets/vendor/php-email-form/validate.js"></script>

        <!-- Template Main JS File -->
        <script src="assets/js/main.js"></script>

    </body>

</html>