
<%--
  Created by IntelliJ IDEA.
  User: kang
  Date: 2019/3/21
  Time: 11:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/home/css/normalize.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/js/bootstrap3/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/home/css/magnific-popup.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/home/css/slider-pro.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/home/css/owl.carousel.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/home/css/owl.theme.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/home/css/owl.transitions.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/home/css/animate.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/home/css/style.css">
    <link rel="shortcut icon" href="#">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="" />
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
    function hideURLbar(){ window.scrollTo(0,1); } </script>
    <!-- //for-mobile-apps -->
    <link href="<%=request.getContextPath()%>/js/bootstrap3/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
    <link href="<%=request.getContextPath()%>/homes/css/style.css" rel="stylesheet" type="text/css" media="all" />
    <style  type="text/css">
        .main-menu{

            background-color: #0a0a0a;
        }
    </style>
    <!-- 登陆框架 -->
    <link href="<%=request.getContextPath() %>/css/style.css" rel="stylesheet" type="text/css" media="all" />
    <%--
    <link rel="stylesheet" href="<%=request.getContextPath() %>/alter/example.scss">--%>
    <!-- This is what you need -->
    <script src="<%=request.getContextPath() %>/alter/sweet-alert.js"></script>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/alter/sweet-alert.css">


</head>
<body>
<header>
    <nav id="topNav" class="navbar navbar-default main-menu">

        <div class="top-nav-text">
            <a class="page-scroll" href="<%=request.getContextPath()%>/remove" data-toggle="modal" data-hover="LOGIN"  id="remid" style="display: none;"><span class="call">欢迎${sessionScope.sitesUser.userName}登录;</span> 点我注销!  </a>
            <a class="page-scroll" href="#myModal2" data-toggle="modal" data-hover="LOGIN" id="subid">登录</a>
            <a class="page-scroll" href="#myModal4" onclick="phoneLogin()" data-toggle="modal" data-hover="LOGIN" id="phoneid">手机号快捷登陆</a>
            <a class="page-scroll" href="#myModal3" data-toggle="modal" data-hover="LOGIN"  id="regid">注册</a>

        </div>

        <div class="container">
            <button class="navbar-toggler hidden-md-up pull-right" type="button" data-toggle="collapse" data-target="#collapsingNavbar">
                ☰
            </button>
            <a class="navbar-brand page-scroll" href="#slider"><img class="logo" id="logo" src="<%=request.getContextPath()%>/home/images/logo.png" alt="logo"></a>
            <div class="collapse navbar-toggleable-sm" id="collapsingNavbar">
                <ul class="nav navbar-nav">
                    <li class="active">
                        <a href="#slider">家</a>
                    </li>
                    <li>
                        <a href="#about">关于</a>
                    </li>
                    <li>
                        <a href="#services">服务</a>
                    </li>
                    <li>
                        <a href="#menuCard">价钱</a>
                    </li>
                    <li>
                        <a href="#portfolio">画廊</a>
                    </li>
                    <li>
                        <a href="#team">团队</a>
                    </li>
                    <li>
                        <a href="#clients">反馈</a>
                    </li>
                    <li>
                        <a href="#contact">联系我们</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>


</header>

<section class="slider-pro slider" id="slider">
    <div class="sp-slides">

        <!-- Slides -->
        <div class="sp-slide main-slides">
            <div class="img-overlay"></div>
            <img class="sp-image" src="<%=request.getContextPath()%>/home/images/slider/slider-img-1.jpg" alt="Slider 2"/>
            <h1 class="sp-layer slider-text-big"
                data-position="center" data-show-transition="left" data-hide-transition="right" data-vertical="55%" data-show-delay="1500" data-hide-delay="200">
                <span class="highlight-texts">CAR WASH & DETAILING</span>
            </h1>
        </div>
        <!-- Slides End -->

        <!-- Slides -->
        <div class="sp-slide main-slides">
            <div class="img-overlay"></div>
            <img class="sp-image" src="<%=request.getContextPath()%>/home/images/slider/slider-img-2.jpg" alt="Slider 1"/>
            <h1 class="sp-layer slider-text-big"
                data-position="center" data-show-transition="left" data-hide-transition="right" data-vertical="55%" data-show-delay="1500" data-hide-delay="200">
                <span class="highlight-texts">DENTING & PAINTING</span>
            </h1>
        </div>
        <!-- Slides End -->


        <!-- Slides -->
        <div class="sp-slide main-slides">
            <div class="img-overlay"></div>
            <img class="sp-image" src="<%=request.getContextPath()%>/home/images/slider/slider-img-3.jpg" alt="Slider 3"/>
            <h1 class="sp-layer slider-text-big"
                data-position="center" data-show-transition="left" data-hide-transition="right" data-vertical="55%" data-show-delay="1500" data-hide-delay="200">
                <span class="highlight-texts">MAINTENANCE & REPAIR</span>
            </h1>
        </div>
        <!-- Slides End -->

    </div>
</section>



<section id="services" class="section-wrapper">
    <div class="container">
        <div class="row">

            <!-- Section Header -->
            <div class="col-md-12 col-sm-12 col-xs-12 section-header wow fadeInDown">
                <h2><span class="highlight-text">Services</span></h2>

                <p class="col-md-8 col-sm-10 col-xs-12 col-md-offset-2 col-sm-offset-1">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quod, nam corporis quas, saepe minima error aperiam dolorum aliquam, quis deserunt eos eius quisquam odio itaque.</p>
            </div>
            <!-- Section Header End -->

            <div class="our-services">


                <div class="row">
                    <div class="col-md-4 col-sm-4 col-xs-12 text-xs-center wow fadeInDown" data-wow-delay=".2s">
                        <div class="service-box">
                            <img src="<%=request.getContextPath()%>/home/images/01.jpg" alt="Custom Image">
                            <div class="icon"> <h3>Car Checkup</h3>
                            </div>
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Libero praesentium quam nulla.</p>
                        </div>
                    </div>
                    <div class="col-md-4 col-sm-4 col-xs-12 text-xs-center wow fadeInDown" data-wow-delay=".2s">
                        <div class="service-box">
                            <img src="<%=request.getContextPath()%>/home/images/02.jpg" alt="Custom Image">
                            <div class="icon"> <h3>Car Servicing</h3>
                            </div>

                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Libero praesentium quam nulla.</p>
                        </div>
                    </div>
                    <div class="col-md-4 col-sm-4 col-xs-12 text-xs-center wow fadeInDown" data-wow-delay=".2s">
                        <div class="service-box">
                            <img src="<%=request.getContextPath()%>/home/images/03.jpg" alt="Custom Image">
                            <div class="icon"> <h3>Car Painting</h3>
                            </div>

                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Libero praesentium quam nulla.</p>
                        </div>
                    </div>

                </div>
                <div class="row">

                    <div class="col-md-4 col-sm-4 col-xs-12 text-xs-center wow fadeInDown" data-wow-delay=".2s">
                        <div class="service-box">
                            <img src="<%=request.getContextPath()%>/home/images/04.jpg" alt="Custom Image">
                            <div class="icon"> <h3>Car Wash</h3>
                            </div>

                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Libero praesentium quam nulla.</p>
                        </div>
                    </div>
                    <div class="col-md-4 col-sm-4 col-xs-12 text-xs-center wow fadeInDown" data-wow-delay=".2s">
                        <div class="service-box">
                            <img src="<%=request.getContextPath()%>/home/images/05.jpg" alt="Custom Image">
                            <div class="icon"> <h3>Car Accessories</h3>
                            </div>

                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Libero praesentium quam nulla.</p>
                        </div>
                    </div>                  <div class="col-md-4 col-sm-4 col-xs-12 text-xs-center wow fadeInDown" data-wow-delay=".2s">
                    <div class="service-box">
                        <img src="<%=request.getContextPath()%>/home/images/06.jpg" alt="Custom Image">
                        <div class="icon"> <h3>24/7 Service</h3>
                        </div>

                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Libero praesentium quam nulla.</p>
                    </div>
                </div>
                </div>
            </div>

        </div>
    </div>
</section>


<section id="about" class="about-sec section-wrapper description">
    <div class="container">
        <div class="row">
            <!-- Section Header -->
            <div class="col-md-12 col-sm-12 col-xs-12 section-header wow fadeInDown">
                <h2><span class="highlight-text">About</span></h2>

                <p class="col-md-8 col-sm-10 col-xs-12 col-md-offset-2 col-sm-offset-1">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quod, nam corporis quas, saepe minima error aperiam dolorum aliquam, quis deserunt eos eius quisquam odio itaque.</p>
            </div>
            <!-- Section Header End -->

            <div class="col-md-6 col-sm-6 col-xs-12 custom-sec-img wow fadeInDown">
                <img src="<%=request.getContextPath()%>/home/images/features.jpg" alt="Custom Image">
            </div>

            <div class="col-md-6 col-sm-6 col-xs-12 customized-text wow fadeInDown black-ed">
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ipsa sit, numquam amet voluptatibus obcaecati ea maiores totam nostrum, ad iure rerum quas harum ipsum.  lobcaecati ea maiores totam nostrum, ad iure rerum quas harum ipsum. Rem ea ducimus quos quae quo.</p>
                <div class="row">
                    <div class="col-md-11">
                        <strong>Bootstrap</strong>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aperiam iusto, natus est ducimus saepe laborum</p>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-11">
                        <strong>Responisve Theme</strong>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aperiam iusto, natus est ducimus saepe laborum Lorem ipsum dolor sit amet.</p>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-11">
                        <strong>HTML5/CSS3</strong>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aperiam iusto, natus est ducimus saepe laborum Lorem ipsum dolor sit amet.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="menus style3" id="menuCard">
    <div class="container">
        <div class="row">

            <!-- Section Header -->
            <div class="col-md-12 col-sm-12 col-xs-12 section-header wow fadeInDown">
                <h2><span class="highlight-text">Price Card</span></h2>
                <p class="col-md-8 col-sm-10 col-xs-12 col-md-offset-2 col-sm-offset-1">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quod, nam corporis quas, saepe minima error aperiam dolorum aliquam, quis deserunt eos eius quisquam odio itaque.</p>
            </div>
            <!-- Section Header End -->

            <div class="menus-container">
                <!-- menu -->
                <div class="menu row">
                    <div class="col-md-6 wow fadeInRight animated" style="visibility: visible; animation-name: fadeInRight;">
                        <div class="menu-column">
                            <div class="food">
                                <div class="food-desc">
                                    <h6 class="food-name">Car Wash</h6>
                                    <div class="dots"></div>
                                    <div class="food-price">
                                        <span>5.00</span>
                                    </div><!-- /food-price -->
                                </div><!-- /food-desc -->
                            </div><!-- /food -->
                            <div class="food">
                                <div class="food-desc">
                                    <h6 class="food-name">Car Repair</h6>
                                    <div class="dots"></div>
                                    <div class="food-price">
                                        <span>16.00</span>
                                    </div><!-- /food-price -->
                                </div><!-- /food-desc -->
                            </div><!-- /food -->
                            <div class="food">
                                <div class="food-desc">
                                    <h6 class="food-name">Car Painting</h6>
                                    <div class="dots"></div>
                                    <div class="food-price">
                                        <span>22.00</span>
                                    </div><!-- /food-price -->
                                </div><!-- /food-desc -->
                            </div><!-- /food -->
                        </div><!-- /menu-column -->
                    </div><!-- /col-md-6 -->
                    <div class="col-md-6 wow fadeInLeft animated" style="visibility: visible; animation-name: fadeInLeft;">
                        <div class="menu-column">
                            <div class="food">
                                <div class="food-desc">
                                    <h6 class="food-name">Car Wash</h6>
                                    <div class="dots"></div>
                                    <div class="food-price">
                                        <span>5.00</span>
                                    </div><!-- /food-price -->
                                </div><!-- /food-desc -->
                            </div><!-- /food -->
                            <div class="food">
                                <div class="food-desc">
                                    <h6 class="food-name">Car Repair</h6>
                                    <div class="dots"></div>
                                    <div class="food-price">
                                        <span>16.00</span>
                                    </div><!-- /food-price -->
                                </div><!-- /food-desc -->
                            </div><!-- /food -->
                            <div class="food">
                                <div class="food-desc">
                                    <h6 class="food-name">Car Painting</h6>
                                    <div class="dots"></div>
                                    <div class="food-price">
                                        <span>22.00</span>
                                    </div><!-- /food-price -->
                                </div><!-- /food-desc -->
                            </div><!-- /food -->
                        </div><!-- /menu-column -->
                    </div><!-- /col-md-6 -->
                </div><!-- /row -->
            </div><!-- /menu-carousel -->
        </div><!-- /menus-container -->
    </div><!-- /container -->
</section>


<section id="portfolio" class="bgSection portfolio-section">
    <div class="container">
        <div class="row">

            <!-- Section Header -->
            <div class="col-md-12 col-sm-12 col-xs-12 section-header wow fadeInDown">
                <h2><span class="highlight-text">Gallery</span></h2>

                <p class="col-md-8 col-sm-10 col-xs-12 col-md-offset-2 col-sm-offset-1">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quod, nam corporis quas, saepe minima error aperiam dolorum aliquam, quis deserunt eos eius quisquam odio itaque.</p>
            </div>
            <!-- Section Header End -->

        </div>
    </div>
<%--    <div class="tlinks">Collect from <a href="http://www.cssmoban.com/" >建站模板</a></div>--%>
    <!-- Works -->
    <div class="portfolio-works wow fadeIn" data-wow-duration="2s">

        <!-- Filter Button Start -->
        <div id="portfolio-filter" class="portfolio-filter-btn-group">
            <ul>
                <li>
                    <a href="#" class="selected" data-filter="*">ALL</a>
                    <a href="#" data-filter=".web">Wash</a>
                    <a href="#" data-filter=".seo">Paint</a>
                    <a href="#" data-filter=".works">Repair</a>
                    <a href="#" data-filter=".brands">Support</a>
                </li>
            </ul>
        </div>
        <!-- Filter Button End -->

        <div class="portfolio-items">

            <!-- Portfolio Items -->
            <div class="item portfolio-item web seo">

                <img src="<%=request.getContextPath()%>/home/images/img-portfolio/1.jpg" alt="">
                <div class="portfolio-details-wrapper">
                    <div class="portfolio-details">
                        <div class="portfolio-meta-btn">
                            <ul class="work-meta">
                                <li class="lighbox"><a href="<%=request.getContextPath()%>/home/images/img-portfolio/1.jpg" class="featured-work-img"><i class="fa fa-search-plus"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>

            </div>
            <!-- Portfolio Items End -->


            <!-- Portfolio Items -->
            <div class="item portfolio-item works seo">

                <img src="<%=request.getContextPath()%>/home/images/img-portfolio/2.jpg" alt="">
                <div class="portfolio-details-wrapper">
                    <div class="portfolio-details">
                        <div class="portfolio-meta-btn">
                            <ul class="work-meta">
                                <li class="lighbox"><a href="<%=request.getContextPath()%>/home/images/img-portfolio/2.jpg" class="featured-work-img"><i class="fa fa-search-plus"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>

            </div>
            <!-- Portfolio Items End -->

            <!-- Portfolio Items -->
            <div class="item portfolio-item web">

                <img src="<%=request.getContextPath()%>/home/images/img-portfolio/3.jpg" alt="">
                <div class="portfolio-details-wrapper">
                    <div class="portfolio-details">
                        <div class="portfolio-meta-btn">
                            <ul class="work-meta">
                                <li class="lighbox"><a href="<%=request.getContextPath()%>/home/images/img-portfolio/3.jpg" class="featured-work-img"><i class="fa fa-search-plus"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>

            </div>
            <!-- Portfolio Items End -->

            <!-- Portfolio Items -->
            <div class="item portfolio-item web works brands">

                <img src="<%=request.getContextPath()%>/home/images/img-portfolio/4.jpg" alt="">
                <div class="portfolio-details-wrapper">
                    <div class="portfolio-details">
                        <div class="portfolio-meta-btn">
                            <ul class="work-meta">
                                <li class="lighbox"><a href="<%=request.getContextPath()%>/home/images/img-portfolio/4.jpg" class="featured-work-img"><i class="fa fa-search-plus"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Portfolio Items -->

            <!-- Portfolio Items -->
            <div class="item portfolio-item web brands">

                <img src="<%=request.getContextPath()%>/home/images/img-portfolio/5.jpg" alt="">
                <div class="portfolio-details-wrapper">
                    <div class="portfolio-details">
                        <div class="portfolio-meta-btn">
                            <ul class="work-meta">
                                <li class="lighbox"><a href="<%=request.getContextPath()%>/home/images/img-portfolio/5.jpg" class="featured-work-img"><i class="fa fa-search-plus"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>

            </div>
            <!-- Portfolio Items End -->

            <!-- Portfolio Items -->
            <div class="item portfolio-item works seo">

                <img src="<%=request.getContextPath()%>/home/images/img-portfolio/6.jpg" alt="">
                <div class="portfolio-details-wrapper">
                    <div class="portfolio-details">
                        <div class="portfolio-meta-btn">
                            <ul class="work-meta">
                                <li class="lighbox"><a href="<%=request.getContextPath()%>/home/images/img-portfolio/6.jpg" class="featured-work-img"><i class="fa fa-search-plus"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>

            </div>
            <!-- Portfolio Items End -->

            <div class="item portfolio-item brands seo">

                <img src="<%=request.getContextPath()%>/home/images/img-portfolio/7.jpg" alt="">
                <div class="portfolio-details-wrapper">
                    <div class="portfolio-details">
                        <div class="portfolio-meta-btn">
                            <ul class="work-meta">
                                <li class="lighbox"><a href="<%=request.getContextPath()%>/home/images/img-portfolio/7.jpg" class="featured-work-img"><i class="fa fa-search-plus"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>

            </div>
            <!-- Portfolio Items End -->

            <!-- Portfolio Items -->
            <div class="item portfolio-item web seo works">

                <img src="<%=request.getContextPath()%>/home/images/img-portfolio/8.jpg" alt="">
                <div class="portfolio-details-wrapper">
                    <div class="portfolio-details">
                        <div class="portfolio-meta-btn">
                            <ul class="work-meta">
                                <li class="lighbox"><a href="<%=request.getContextPath()%>/home/images/img-portfolio/8.jpg" class="featured-work-img"><i class="fa fa-search-plus"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>

            </div>
            <!-- Portfolio Items End -->



        </div>
    </div>
    <!-- Works End -->


</section>
<!-- Portfolio Section End -->


<section id="info" class="info-section">
    <div class="container text-xs-center">
        <!-- Section Header -->
        <div class="col-md-12 col-sm-12 col-xs-12 section-header wow fadeInDown">
            <h2><span class="highlight-text">Stats</span></h2>

            <p class="col-md-8 col-sm-10 col-xs-12 col-md-offset-2 col-sm-offset-1">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quod, nam corporis quas, saepe minima error aperiam dolorum aliquam, quis deserunt eos eius quisquam odio itaque.</p>
        </div>
        <!-- Section Header End -->
        <div class="row wow fadeInUp" style="visibility: visible; animation-name: fadeInUp;">
            <div class="col-md-3 col-sm-6 col-xs-12 text-xs-center">

                <i class="icon_mic_alt wow pulse" style="visibility: visible; animation-name: pulse;"></i>
                <h4>Margins</h4>
                <h1 class="text-primary">100,000</h1>
            </div>
            <div class="col-md-3 col-sm-6 col-xs-12 text-xs-center">

                <i class="icon_gift_alt wow pulse" style="visibility: visible; animation-name: pulse;"></i>
                <h4>Completed</h4>
                <h1 class="text-primary">34201</h1>
            </div>
            <div class="col-md-3 col-sm-6 col-xs-12 text-xs-center">

                <i class="icon_mobile wow pulse" style="visibility: visible; animation-name: pulse;"></i>
                <h4>Projects</h4>
                <h1 class="text-primary">152</h1>
            </div>
            <div class="col-md-3 col-sm-6 col-xs-12 text-xs-center">

                <i class="icon_lightbulb_alt wow pulse" style="visibility: visible; animation-name: pulse;"></i>
                <h4>Customers</h4>
                <h1 class="text-primary">56500</h1>
            </div>
        </div>
    </div>
</section>

<section id="team" class="bgSection teams-section">
    <div class="parallax-overlay"></div>
    <div class="teams-wrapper wow fadeInDown">
        <div class="container">
            <div class="row">

                <!-- Section Header -->
                <div class="col-md-12 col-sm-12 col-xs-12 section-header wow fadeInDown">
                    <h2><span class="highlight-text-inverted">TEAM</span></h2>

                    <p class="col-md-8 col-sm-10 col-xs-12 col-md-offset-2 col-sm-offset-1">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quod, nam corporis quas, saepe minima error aperiam dolorum aliquam, quis deserunt eos eius quisquam odio itaque.</p>
                </div>

                <!-- teams Slider -->
                <div id="teams" class="owl-carousel teams">

                    <!-- Slides -->
                    <div class="teams-slides col-md-8 col-sm-10 col-xs-12 col-md-offset-2 col-sm-offset-1">
                        <img src="<%=request.getContextPath()%>/home/images/img-teams/team1.jpg" alt="">
                        <p class="client-info">Chris Willam</p>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisic</p>

                    </div>
                    <!-- Slides End -->

                    <!-- Slides -->
                    <div class="teams-slides col-md-8 col-sm-10 col-xs-12 col-md-offset-2 col-sm-offset-1">
                        <img src="<%=request.getContextPath()%>/home/images/img-teams/team2.jpg" alt="">
                        <p class="client-info">Randy Dode</p>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisic</p>

                    </div>
                    <!-- Slides End -->

                    <!-- Slides -->
                    <div class="teams-slides col-md-8 col-sm-10 col-xs-12 col-md-offset-2 col-sm-offset-1">
                        <img src="<%=request.getContextPath()%>/home/images/img-teams/team3.jpg" alt="">
                        <p class="client-info">Michel Kimte</p>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisic</p>

                    </div>
                    <!-- Slides End -->

                </div>
            </div>
        </div>
    </div>
</section>


<!-- Clients Section -->
<section id="clients" class="clients-section">
    <!-- Container Ends -->
    <div class="container">
        <div class="row">
            <!-- Section Header -->
            <div class="col-md-12 col-sm-12 col-xs-12 section-header wow fadeInDown">
                <h2><span class="highlight-text">Customer Feedback</span></h2>
            </div>
            <!-- Section Header End -->
            <div class="row">
                <div class="col-md-8 col-md-offset-2">
                    <div class="testimonials">
                        <div class="active item">
                            <blockquote><p>Denim you probably haven't heard of. Lorem ipsum dolor met consectetur adipisicing sit amet, consectetur adipisicing elit, of them jean shorts sed magna aliqua. Lorem ipsum dolor met.</p></blockquote>
                            <div class="carousel-info">
                                <img alt="" src="<%=request.getContextPath()%>/home/images/img1-small.jpg" class="pull-left">
                                <div class="pull-left">
                                    <span class="testimonials-name">Lina Mars</span>
                                    <span class="testimonials-post">Commercial Director</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div><!-- Container Ends -->
</section>
<!-- Client Section End -->

<section id="contact" class="section-wrapper contact-section" data-stellar-background-ratio="0.5">
    <div class="parallax-overlay"></div>
    <div class="container">
        <div class="row">

            <!-- Section Header -->
            <div class="col-md-12 col-sm-12 col-xs-12 section-header wow fadeInDown">
                <h2><span class="highlight-text">Contact Us</span></h2>

                <p class="col-md-8 col-sm-10 col-xs-12 col-md-offset-2 col-sm-offset-1">We love feedback. Fill out the form below and we'll get back to you as soon as possible. in minus distinctio dolores ipsam.</p>
            </div>
            <!-- Section Header End -->

            <div class="contact-details">


                <!-- Contact Form -->
                <div class="contact-form wow fadeInDown">

                    <!--NOTE: Update your email Id in "contact_me.php" file in order to receive emails from your contact form-->
                    <form name="sentMessage" id="contactForm"  novalidate>
                        <div class="col-md-6">
                            <input type="text" class="form-control"
                                   placeholder="Full Name" id="name" required
                                   data-validation-required-message="Please enter your name" />
                            <p class="help-block"></p>
                        </div>
                        <div class="col-md-6">
                            <input type="email" class="form-control" placeholder="Email"
                                   id="email" required
                                   data-validation-required-message="Please enter your email" />
                        </div>

                        <div class="col-md-12">
				<textarea rows="10" cols="100" class="form-control"
                          placeholder="Message" id="message" required
                          data-validation-required-message="Please enter your message" minlength="5"
                          data-validation-minlength-message="Min 5 characters"
                          maxlength="999" style="resize:none"></textarea>
                        </div>

                        <div class="col-md-8 col-md-offset-2"><br><div id="success"> </div><button type="submit" class="btn btn-primary">Submit Message</button></div>
                    </form>
                </div>

            </div>
        </div>
    </div>
</section>




<!-- Contact Section End -->
<section class="footer-container">
    <div class="container">
        <div class="row footer-containertent">
            <div class="col-md-4">
                <img src="<%=request.getContextPath()%>/home/images/logo.png" alt="">
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Et porro quos iste ratione doloribus asperiores, error omnis delectus rerum sapiente. Et, aliquam modi beatae quae in perferendis ab est fugiat!</p>
            </div>
            <div class="col-md-4">
                <h4>News & Updates</h4>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quod, nam corporis quas, saepe minima error aperiam dolorum aliquam, quis deserunt eos eius quisquam odio itaque.</p>
            </div>
            <div class="col-md-4 contac-us">
                <h4>Contact Us</h4>
                <p>Lorem ipsum dolor sit amet adipisicing elit.</p>
                <ul>
                    <li><i class="fa fa-home"></i>123 New Venu Street</li>
                    <li><i class="fa fa-phone"></i>001 123 12345 99</li>
                    <li><i class="fa fa-envelope-o"></i>support@website.com</li>
                </ul>
            </div>
        </div>
    </div>
</section>


<footer>

    <div class="container">
        <div class="row">
            <div class="footer-containertent">

                <ul class="footer-social-info">
                    <li>
                        <a href="#"><i class="fa fa-facebook"></i></a>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-twitter"></i></a>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-pinterest"></i></a>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-google-plus"></i></a>
                    </li>
                </ul>
                <br/><br/>
                <p>Copyright &copy; 2017.Company name All rights reserved.More Templates <a href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a> - Collect from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a></p>
            </div>
        </div>
    </div>
</footer>
<!-- Footer End -->

<script src="<%=request.getContextPath()%>/jquery-easyui-1.5/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap3/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/home/js/modernizr.min.js"></script>
<script src="<%=request.getContextPath()%>/home/js/jquery.easing.1.3.js"></script>
<script src="<%=request.getContextPath()%>/home/js/jquery.scrollUp.min.js"></script>
<script src="<%=request.getContextPath()%>/home/js/jquery.easypiechart.js"></script>
<script src="<%=request.getContextPath()%>/home/js/isotope.pkgd.min.js"></script>
<script src="<%=request.getContextPath()%>/home/js/jquery.fitvids.js"></script>
<script src="<%=request.getContextPath()%>/home/js/jquery.stellar.min.js"></script>
<script src="<%=request.getContextPath()%>/home/js/jquery.waypoints.min.js"></script>
<script src="<%=request.getContextPath()%>/home/js/wow.min.js"></script>
<script src="<%=request.getContextPath()%>/home/js/jquery.nav.js"></script>
<script src="<%=request.getContextPath()%>/home/js/imagesloaded.pkgd.min.js"></script>
<script src="<%=request.getContextPath()%>/home/js/smooth-scroll.min.js"></script>
<script src="<%=request.getContextPath()%>/home/js/jquery.magnific-popup.min.js"></script>
<script src="<%=request.getContextPath()%>/home/js/jquery.sliderPro.min.js"></script>
<script src="<%=request.getContextPath()%>/home/js/owl.carousel.min.js"></script>
<script src="<%=request.getContextPath()%>/home/js/custom.js"></script>

    <div class="modal about-modal w3-agileits fade" id="myModal2" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                </div>
                <div class="modal-body login-page "><!-- login-page -->
                    <div class="login-top sign-top">
                        <div class="agileits-login">
                            <h5>Login</h5>
                            <form action="querySites" method="post">
                                <input type="email" class="userEmail" name="userEmail" placeholder="userEmail" required=""/>
                                <input type="password" class="password" name="password" placeholder="password" required=""/>
                                <div class="wthree-text">
                                    <ul>
                                        <li>
                                            <label class="anim">
                                                <input type="checkbox" class="checkbox">
                                                <span> Remember me ?</span>
                                            </label>
                                        </li>
                                        <li> <a href="#">Forgot password?</a> </li>
                                    </ul>
                                    <div class="clearfix"> </div>
                                </div>
                                <div class="w3ls-submit">
                                    <input type="submit" value="LOGIN"  >

                                </div>
                            </form>

                        </div>
                    </div>
                </div>
            </div> <!-- //login-page -->
        </div>
    </div>


    <div class="modal about-modal w3-agileits fade" id="myModal3" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                </div>
                <div class="modal-body login-page "><!-- login-page -->
                    <div class="login-top sign-top">
                        <div class="agileits-login">
                            <h5>Register</h5>
                            <form action="enroll" method="post"   id="indexFrom">
                                <input type="text" name="userName" placeholder="userName" required=""/>
                                <input type="email"  name="userEmail" placeholder="Email" required=""/>
                                <input type="password" name="password" placeholder="Password" required=""/>
                                <div class="wthree-text">
                                    <ul>
                                        <li>
                                            <label class="anim">
                                                <input type="checkbox" class="checkbox">
                                                <span> I accept the terms of use</span>
                                            </label>
                                        </li>
                                    </ul>
                                    <div class="clearfix"> </div>
                                </div>
                                <div class="w3ls-submit">
                                    <input type="submit" value="Register" >
                                </div>
                            </form>

                        </div>
                    </div>
                </div>
            </div> <!-- //login-page -->
        </div>
    </div>


</body>
<script type="text/javascript">

   $(function () {
        var sites=${sessionScope.sitesUser.id};
        if(sites!=null){
            $("#subid").hide();
            $("#regid").hide();
            $("#remid").attr("style","display:block;");
        }
    });


    //按钮事件
    $('#btnSumit').click(function() {
    });
    //回车提交事件
    $("body").keydown(function() {
        if (event.keyCode == "13") {//keyCode=13是回车键
            $('#btnSumit').click();
        }
    });

    function querySites(){
        var userEmail = $("#userEmail").val();
        var password = $("#password").val();
        $.ajax({
            url:"<%=request.getContextPath()%>/loginUser",
            data:{"userEmail":userEmail,"password":password},
            success:function(data){
                swal(data, "", "error")
                if(data == "登陆成功！"){
                    swal(data, "", "success")
                    setTimeout(function(){location.href="<%=request.getContextPath()%>/toError"}, 1000);
                }
            },
            error:function(){
                $.messager.alert("提示驾到","登录失败","error");
            }
        })
    }

</script>
</html>
