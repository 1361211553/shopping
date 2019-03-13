<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/11/20
  Time: 15:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="appcomm/basePath.jsp" %>
<!--这是主页面 -->
<html>
<head>
    <title>Home</title>
    <!-- for-mobile-apps -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="keywords" content=""/>
    <script type="application/x-javascript"> addEventListener("load", function () {
        setTimeout(hideURLbar, 0);
    }, false);

    function hideURLbar() {
        window.scrollTo(0, 1);
    } </script>
    <!-- //for-mobile-apps -->
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all"/>
    <link href="css/style.css" rel="stylesheet" type="text/css" media="all"/>
    <!-- font-awesome icons -->
    <link href="css/font-awesome.css" rel="stylesheet">
    <!-- //font-awesome icons -->
    <!-- js -->
    <script src="js/jquery-1.11.1.min.js"></script>
    <!-- //js -->
    <link href='http://fonts.googleapis.com/css?family=Raleway:400,100,100italic,200,200italic,300,400italic,500,500italic,600,600italic,700,700italic,800,800italic,900,900italic'
          rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic'
          rel='stylesheet' type='text/css'>
    <!-- start-smoth-scrolling -->
    <script type="text/javascript" src="js/move-top.js"></script>
    <script type="text/javascript" src="js/easing.js"></script>
    <script type="text/javascript">
        jQuery(document).ready(function ($) {
            $(".scroll").click(function (event) {
                event.preventDefault();
                $('html,body').animate({scrollTop: $(this.hash).offset().top}, 1000);
            });
        });
    </script>
    <!-- start-smoth-scrolling -->
</head>
<body>

<!-- header -->
<div class="agileits_header">
    <div class="container">
        <div class="w3l_offers">
            <p>新会员打8.5折. <a href="products.jsp">现在去购物</a></p>
        </div>
        <div class="agile-login">

            <ul>

                <c:if test="${user eq null}">
                    <li><a href="registered.jsp"> 新建账号 </a></li>
                    <li><a href="login.jsp">登陆</a></li>

                </c:if>
                <h3>
                    <c:if test="${user ne null}">
                        <li><a><img src="${user.userface}" style="width: 50px; height: 40px;"></a></li>
                        <li><a>
                            <font color="white" size="4px">${user.username}</font></a></li>
                             <li><a href="geren.jsp">个人中心</a></li>
                        <a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>

                        <li><a href="login?op=loginOut">
                            <font color="white">退出</font></a></li>

                    </c:if>
                </h3>
            </ul>

        </div>
        <div class="product_list_header">
            <form action="./cart/cartList.action" method="get" class="last">
                <%--<input type="hidden" name="cmd" value="_cart">--%>
                <%--<input type="hidden" name="display" value="1">--%>
                <button class="w3view-cart" type="submit" name="submit" value=""><i class="fa fa-cart-arrow-down"
                                                                                    aria-hidden="true"></i></button>
            </form>
        </div>
        <div class="clearfix"></div>
    </div>
</div>

<div class="logo_products">
    <div class="container">
        <div class="w3ls_logo_products_left1">
            <ul class="phone_email">
                <li><i class="fa fa-phone" aria-hidden="true"></i>超市电话请拨打 : 10086</li>

            </ul>
        </div>
        <div class="w3ls_logo_products_left">
            <h1><a href="index.jsp">超市</a></h1>
        </div>
        <div class="w3l_search">
            <form action="pagehome?op=searchproduct" method="post">
                <input type="search" name="Search" placeholder="搜索产品..." required="">
                <button type="submit" class="btn btn-default search" aria-label="Left Align">
                    <i class="fa fa-search" aria-hidden="true"> </i>
                </button>
                <div class="clearfix"></div>
            </form>
        </div>

        <div class="clearfix"></div>
    </div>
</div>
<!-- //header -->
<!-- navigation -->
<div class="navigation-agileits">
    <div class="container">
        <nav class="navbar navbar-default">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header nav_2">
                <button type="button" class="navbar-toggle collapsed navbar-toggle1" data-toggle="collapse"
                        data-target="#bs-megadropdown-tabs">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
            </div>

            <div class="collapse navbar-collapse" id="bs-megadropdown-tabs">
                <ul class="nav navbar-nav">
                    <li class="active"><a href="index.jsp" class="act">主页</a></li>
                    <!-- Mega Menu -->
                    <jsp:include page="pagehome?op=ini"/>

                    <c:forEach var="pt" items="${requestScope.listPT}">
                        <li class="dropdown">
                        <li class="active"><a href="groceries.jsp?op=clicktype&producttypeid=${pt.producttypeid}"
                                              class="act">${pt.producttypename}</a></li>
                        </li>
                    </c:forEach>
                    <%--<li class="dropdown">--%>
                    <%--<li class="active"><a href="household.jsp" class="act">蔬菜</a></li>--%>

                    <%--</li>--%>
                    <%--<li class="dropdown">--%>
                    <%--<li class="active"><a href="personalcare.jsp" class="act">肉类</a></li>--%>

                    <%--</li>--%>
                    <%--<li class="dropdown">--%>
                    <%--<li class="active"><a href="packagedfoods.jsp" class="act">零食</a></li>--%>

                    <%--</li>--%>


                </ul>
            </div>
        </nav>
    </div>
</div>

<!-- //navigation -->
<!-- main-slider -->
<ul id="demo1">
    <li>
        <img src="images/11.jpg" alt=""/>
        <!--Slider Description example-->
        <div class="slide-desc">
            <h3>欢迎来到网上超市</h3>
        </div>
    </li>
    <li>
        <img src="images/22.jpg" alt=""/>
        <div class="slide-desc">
            <h3>新会员首单立减，购满199免费送到家</h3>
        </div>
    </li>

    <li>
        <img src="images/44.jpg" alt=""/>
        <div class="slide-desc">
            <h3>每日前100名顾客送精美小礼品一份，更多优惠请预览详情页面</h3>
        </div>
    </li>
</ul>
<!-- //main-slider -->
<!-- //top-header and slider -->
<!-- top-brands -->

<div class="top-brands">
    <div class="container">
        <h2>畅销优惠</h2>
        <div class="grid_3 grid_5">
            <div class="bs-example bs-example-tabs" role="tabpanel" data-example-id="togglable-tabs">
                <ul id="myTab" class="nav nav-tabs" role="tablist">
                    <li role="presentation" class="active"><a href="#expeditions" id="expeditions-tab" role="tab"
                                                              data-toggle="tab" aria-controls="expeditions"
                                                              aria-expanded="true">广告优惠</a></li>
                    <li role="presentation"><a href="#tours" role="tab" id="tours-tab" data-toggle="tab"
                                               aria-controls="tours">今日优惠</a></li>
                </ul>
                <div id="myTabContent" class="tab-content">
                    <div role="tabpanel" class="tab-pane fade in active" id="expeditions"
                         aria-labelledby="expeditions-tab">
                        <div class="agile-tp">
                            <h5>本周打折商品</h5>
                            <p class="w3l-ad">我们已将所有广告优惠汇集到一个地方，因此您不会错过很多优惠</p>
                        </div>
                        <div class="agile_top_brands_grids">
                            <c:forEach var="sale" items="${requestScope.productsale}">
                                <div class="col-md-4 top_brand_left">
                                    <div class="hover14 column">
                                        <div class="agile_top_brand_left_grid">
                                            <div class="agile_top_brand_left_grid_pos">
                                                <img src="images/offer.png" alt=" " class="img-responsive"/>
                                            </div>
                                            <div class="agile_top_brand_left_grid1">
                                                <figure>
                                                    <div class="snipcart-item block">
                                                        <div class="snipcart-thumb">
                                                            <a href="single.jsp?op=clickproduct&productid=${sale.productid}"><img
                                                                    title="${sale.productcontent}" alt=" "
                                                                    src="${sale.productimg}" width="250px"
                                                                    height="250px"/></a>
                                                            <p>${sale.productname}</p>
                                                            <div class="stars">
                                                                <i class="fa fa-star blue-star" aria-hidden="true"></i>
                                                                <i class="fa fa-star blue-star" aria-hidden="true"></i>
                                                                <i class="fa fa-star blue-star" aria-hidden="true"></i>
                                                                <i class="fa fa-star blue-star" aria-hidden="true"></i>
                                                                <i class="fa fa-star gray-star" aria-hidden="true"></i>
                                                            </div>
                                                            <h4><font
                                                                    color="red">￥${sale.productsale}/${sale.productunit}</font>
                                                                <span>￥${sale.productprice}/${sale.productunit}</span>
                                                            </h4>
                                                        </div>
                                                        <div class="snipcart-details top_brand_home_details">
                                                            <form action="./cart/cartAdd/${sale.productid}.action"
                                                                  method="post">
                                                                <fieldset>
                                                                    <input type="hidden" name="productNum"
                                                                           style="width: 30px;" value="1">
                                                                    <%--<input type="hidden" name="cmd" value="_cart"/>--%>
                                                                    <%--<input type="hidden" name="add" value="1"/>--%>
                                                                    <%--<input type="hidden" name="business" value=" "/>--%>
                                                                    <%--<input type="hidden" name="item_name"--%>
                                                                           <%--value="Fortune Sunflower Oil"/>--%>
                                                                    <%--<input type="hidden" name="amount" value="2.5"/>--%>
                                                                    <%--<input type="hidden" name="discount_amount"--%>
                                                                           <%--value="1.00"/>--%>
                                                                    <%--<input type="hidden" name="currency_code"--%>
                                                                           <%--value="USD"/>--%>
                                                                    <%--<input type="hidden" name="return" value=" "/>--%>
                                                                    <%--<input type="hidden" name="cancel_return"--%>
                                                                           <%--value=" "/>--%>
                                                                    <input type="submit" name="submit" value="添加到购物车"
                                                                           class="button"/>
                                                                </fieldset>
                                                            </form>
                                                        </div>
                                                    </div>
                                                </figure>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </c:forEach>


                            <%--<div class="col-md-4 top_brand_left">--%>
                            <%--<div class="hover14 column">--%>
                            <%--<div class="agile_top_brand_left_grid">--%>
                            <%--<div class="agile_top_brand_left_grid_pos">--%>
                            <%--<img src="images/offer.png" alt=" " class="img-responsive" />--%>
                            <%--</div>--%>
                            <%--<div class="agile_top_brand_left_grid1">--%>
                            <%--<figure>--%>
                            <%--<div class="snipcart-item block" >--%>
                            <%--<div class="snipcart-thumb">--%>
                            <%--<a href="products.jsp"><img title=" " alt=" " src="images/2.png" /></a>--%>
                            <%--<p>乐事薯片</p>--%>
                            <%--<div class="stars">--%>
                            <%--<i class="fa fa-star blue-star" aria-hidden="true"></i>--%>
                            <%--<i class="fa fa-star blue-star" aria-hidden="true"></i>--%>
                            <%--<i class="fa fa-star blue-star" aria-hidden="true"></i>--%>
                            <%--<i class="fa fa-star blue-star" aria-hidden="true"></i>--%>
                            <%--<i class="fa fa-star gray-star" aria-hidden="true"></i>--%>
                            <%--</div>--%>
                            <%--<h4>￥7.50 <span>￥9.00</span></h4>--%>
                            <%--</div>--%>
                            <%--<div class="snipcart-details top_brand_home_details">--%>
                            <%--<form action="#" method="post">--%>
                            <%--<fieldset>--%>
                            <%--<input type="hidden" name="cmd" value="_cart" />--%>
                            <%--<input type="hidden" name="add" value="1" />--%>
                            <%--<input type="hidden" name="business" value=" " />--%>
                            <%--<input type="hidden" name="item_name" value="basmati rise" />--%>
                            <%--<input type="hidden" name="amount" value="20.99" />--%>
                            <%--<input type="hidden" name="discount_amount" value="1.00" />--%>
                            <%--<input type="hidden" name="currency_code" value="USD" />--%>
                            <%--<input type="hidden" name="return" value=" " />--%>
                            <%--<input type="hidden" name="cancel_return" value=" " />--%>
                            <%--<input type="submit" name="submit" value="添加到购物车" class="button" />--%>
                            <%--</fieldset>--%>
                            <%--</form>--%>
                            <%--</div>--%>
                            <%--</div>--%>
                            <%--</figure>--%>
                            <%--</div>--%>
                            <%--</div>--%>
                            <%--</div>--%>
                            <%--</div>--%>
                            <%--<div class="col-md-4 top_brand_left">--%>
                            <%--<div class="hover14 column">--%>
                            <%--<div class="agile_top_brand_left_grid">--%>
                            <%--<div class="agile_top_brand_left_grid_pos">--%>
                            <%--<img src="images/offer.png" alt=" " class="img-responsive" />--%>
                            <%--</div>--%>
                            <%--<div class="agile_top_brand_left_grid1">--%>
                            <%--<figure>--%>
                            <%--<div class="snipcart-item block">--%>
                            <%--<div class="snipcart-thumb">--%>
                            <%--<a href="products.jsp"><img src="images/3.png" alt=" " class="img-responsive" /></a>--%>
                            <%--<p>玉米火腿肠</p>--%>
                            <%--<div class="stars">--%>
                            <%--<i class="fa fa-star blue-star" aria-hidden="true"></i>--%>
                            <%--<i class="fa fa-star blue-star" aria-hidden="true"></i>--%>
                            <%--<i class="fa fa-star blue-star" aria-hidden="true"></i>--%>
                            <%--<i class="fa fa-star blue-star" aria-hidden="true"></i>--%>
                            <%--<i class="fa fa-star gray-star" aria-hidden="true"></i>--%>
                            <%--</div>--%>
                            <%--<h4>￥9.90<span>￥11.00</span></h4>--%>
                            <%--</div>--%>
                            <%--<div class="snipcart-details top_brand_home_details">--%>
                            <%--<form action="#" method="post">--%>
                            <%--<fieldset>--%>
                            <%--<input type="hidden" name="cmd" value="_cart" />--%>
                            <%--<input type="hidden" name="add" value="1" />--%>
                            <%--<input type="hidden" name="business" value=" " />--%>
                            <%--<input type="hidden" name="item_name" value="Pepsi soft drink" />--%>
                            <%--<input type="hidden" name="amount" value="40.00" />--%>
                            <%--<input type="hidden" name="discount_amount" value="1.00" />--%>
                            <%--<input type="hidden" name="currency_code" value="USD" />--%>
                            <%--<input type="hidden" name="return" value=" " />--%>
                            <%--<input type="hidden" name="cancel_return" value=" " />--%>
                            <%--<input type="submit" name="submit" value="添加到购物车" class="button" />--%>
                            <%--</fieldset>--%>
                            <%--</form>--%>
                            <%--</div>--%>
                            <%--</div>--%>
                            <%--</figure>--%>
                            <%--</div>--%>
                            <%--</div>--%>
                            <%--</div>--%>
                            <%--</div>--%>
                            <%--<div class="clearfix"> </div>--%>
                            <%--</div>--%>
                            <%--<div class="agile_top_brands_grids">--%>
                            <%--<div class="col-md-4 top_brand_left">--%>
                            <%--<div class="hover14 column">--%>
                            <%--<div class="agile_top_brand_left_grid">--%>
                            <%--<div class="agile_top_brand_left_grid_pos">--%>
                            <%--<img src="images/offer.png" alt=" " class="img-responsive" />--%>
                            <%--</div>--%>
                            <%--<div class="agile_top_brand_left_grid1">--%>
                            <%--<figure>--%>
                            <%--<div class="snipcart-item block" >--%>
                            <%--<div class="snipcart-thumb">--%>
                            <%--<a href="products.jsp"><img title=" " alt=" " src="images/4.png" /></a>--%>
                            <%--<p>燕麦</p>--%>
                            <%--<div class="stars">--%>
                            <%--<i class="fa fa-star blue-star" aria-hidden="true"></i>--%>
                            <%--<i class="fa fa-star blue-star" aria-hidden="true"></i>--%>
                            <%--<i class="fa fa-star blue-star" aria-hidden="true"></i>--%>
                            <%--<i class="fa fa-star blue-star" aria-hidden="true"></i>--%>
                            <%--<i class="fa fa-star gray-star" aria-hidden="true"></i>--%>
                            <%--</div>--%>
                            <%--<h4>￥35.99 <span>￥55.00</span></h4>--%>
                            <%--</div>--%>
                            <%--<div class="snipcart-details top_brand_home_details">--%>
                            <%--<form action="#" method="post">--%>
                            <%--<fieldset>--%>
                            <%--<input type="hidden" name="cmd" value="_cart" />--%>
                            <%--<input type="hidden" name="add" value="1" />--%>
                            <%--<input type="hidden" name="business" value=" " />--%>
                            <%--<input type="hidden" name="item_name" value="Fortune Sunflower Oil" />--%>
                            <%--<input type="hidden" name="amount" value="35.99" />--%>
                            <%--<input type="hidden" name="discount_amount" value="1.00" />--%>
                            <%--<input type="hidden" name="currency_code" value="USD" />--%>
                            <%--<input type="hidden" name="return" value=" " />--%>
                            <%--<input type="hidden" name="cancel_return" value=" " />--%>
                            <%--<input type="submit" name="submit" value="添加到购物车" class="button" />--%>
                            <%--</fieldset>--%>
                            <%--</form>--%>
                            <%--</div>--%>
                            <%--</div>--%>
                            <%--</figure>--%>
                            <%--</div>--%>
                            <%--</div>--%>
                            <%--</div>--%>
                            <%--</div>--%>
                            <%--<div class="col-md-4 top_brand_left">--%>
                            <%--<div class="hover14 column">--%>
                            <%--<div class="agile_top_brand_left_grid">--%>
                            <%--<div class="agile_top_brand_left_grid_pos">--%>
                            <%--<img src="images/offer.png" alt=" " class="img-responsive" />--%>
                            <%--</div>--%>
                            <%--<div class="agile_top_brand_left_grid1">--%>
                            <%--<figure>--%>
                            <%--<div class="snipcart-item block" >--%>
                            <%--<div class="snipcart-thumb">--%>
                            <%--<a href="products.jsp"><img title=" " alt=" " src="images/5.png" /></a>--%>
                            <%--<p>Parryss-sugar</p>--%>
                            <%--<div class="stars">--%>
                            <%--<i class="fa fa-star blue-star" aria-hidden="true"></i>--%>
                            <%--<i class="fa fa-star blue-star" aria-hidden="true"></i>--%>
                            <%--<i class="fa fa-star blue-star" aria-hidden="true"></i>--%>
                            <%--<i class="fa fa-star blue-star" aria-hidden="true"></i>--%>
                            <%--<i class="fa fa-star gray-star" aria-hidden="true"></i>--%>
                            <%--</div>--%>
                            <%--<h4>$30.99 <span>$45.00</span></h4>--%>
                            <%--</div>--%>
                            <%--<div class="snipcart-details top_brand_home_details">--%>
                            <%--<form action="#" method="post">--%>
                            <%--<fieldset>--%>
                            <%--<input type="hidden" name="cmd" value="_cart" />--%>
                            <%--<input type="hidden" name="add" value="1" />--%>
                            <%--<input type="hidden" name="business" value=" " />--%>
                            <%--<input type="hidden" name="item_name" value="basmati rise" />--%>
                            <%--<input type="hidden" name="amount" value="30.99" />--%>
                            <%--<input type="hidden" name="discount_amount" value="1.00" />--%>
                            <%--<input type="hidden" name="currency_code" value="USD" />--%>
                            <%--<input type="hidden" name="return" value=" " />--%>
                            <%--<input type="hidden" name="cancel_return" value=" " />--%>
                            <%--<input type="submit" name="submit" value="添加到购物车" class="button" />--%>
                            <%--</fieldset>--%>
                            <%--</form>--%>
                            <%--</div>--%>
                            <%--</div>--%>
                            <%--</figure>--%>
                            <%--</div>--%>
                            <%--</div>--%>
                            <%--</div>--%>
                            <%--</div>--%>
                            <%--<div class="col-md-4 top_brand_left">--%>
                            <%--<div class="hover14 column">--%>
                            <%--<div class="agile_top_brand_left_grid">--%>
                            <%--<div class="agile_top_brand_left_grid_pos">--%>
                            <%--<img src="images/offer.png" alt=" " class="img-responsive" />--%>
                            <%--</div>--%>
                            <%--<div class="agile_top_brand_left_grid_pos">--%>
                            <%--<img src="images/offer.png" alt=" " class="img-responsive" />--%>
                            <%--</div>--%>
                            <%--<div class="agile_top_brand_left_grid1">--%>
                            <%--<figure>--%>
                            <%--<div class="snipcart-item block">--%>
                            <%--<div class="snipcart-thumb">--%>
                            <%--<a href="products.jsp"><img src="images/6.png" alt=" " class="img-responsive" /></a>--%>
                            <%--<p>Saffola-gold</p>--%>
                            <%--<div class="stars">--%>
                            <%--<i class="fa fa-star blue-star" aria-hidden="true"></i>--%>
                            <%--<i class="fa fa-star blue-star" aria-hidden="true"></i>--%>
                            <%--<i class="fa fa-star blue-star" aria-hidden="true"></i>--%>
                            <%--<i class="fa fa-star blue-star" aria-hidden="true"></i>--%>
                            <%--<i class="fa fa-star gray-star" aria-hidden="true"></i>--%>
                            <%--</div>--%>
                            <%--<h4>$80.99 <span>$105.00</span></h4>--%>
                            <%--</div>--%>
                            <%--<div class="snipcart-details top_brand_home_details">--%>
                            <%--<form action="#" method="post">--%>
                            <%--<fieldset>--%>
                            <%--<input type="hidden" name="cmd" value="_cart" />--%>
                            <%--<input type="hidden" name="add" value="1" />--%>
                            <%--<input type="hidden" name="business" value=" " />--%>
                            <%--<input type="hidden" name="item_name" value="Pepsi soft drink" />--%>
                            <%--<input type="hidden" name="amount" value="80.00" />--%>
                            <%--<input type="hidden" name="discount_amount" value="1.00" />--%>
                            <%--<input type="hidden" name="currency_code" value="USD" />--%>
                            <%--<input type="hidden" name="return" value=" " />--%>
                            <%--<input type="hidden" name="cancel_return" value=" " />--%>
                            <%--<input type="submit" name="submit" value="添加到购物车" class="button" />--%>
                            <%--</fieldset>--%>
                            <%--</form>--%>
                            <%--</div>--%>
                            <%--</div>--%>
                            <%--</figure>--%>
                            <%--</div>--%>
                            <%--</div>--%>
                            <%--</div>--%>
                            <%--</div>--%>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                    <div role="tabpanel" class="tab-pane fade" id="tours" aria-labelledby="tours-tab">
                        <div class="agile-tp">
                            <h5>本周低价商品</h5>
                            <p class="w3l-ad">我们已将所有广告优惠汇集到一个地方，因此您不会错过很多优惠.</p>
                        </div>
                        <div class="agile_top_brands_grids">
                            <c:forEach var="sale" items="${requestScope.productlowprice}">
                                <div class="col-md-4 top_brand_left">
                                    <div class="hover14 column">
                                        <div class="agile_top_brand_left_grid">
                                            <div class="agile_top_brand_left_grid_pos">
                                                <img src="images/offer.png" alt=" " class="img-responsive"/>
                                            </div>
                                            <div class="agile_top_brand_left_grid1">
                                                <figure>
                                                    <div class="snipcart-item block">
                                                        <div class="snipcart-thumb">
                                                            <a href="single.jsp?op=clickproduct&productid=${sale.productid}"><img
                                                                    title="${sale.productcontent}" alt=" "
                                                                    src="${sale.productimg}" width="250px"
                                                                    height="250px"/></a>
                                                            <p>${sale.productname}</p>
                                                            <div class="stars">
                                                                <i class="fa fa-star blue-star" aria-hidden="true"></i>
                                                                <i class="fa fa-star blue-star" aria-hidden="true"></i>
                                                                <i class="fa fa-star blue-star" aria-hidden="true"></i>
                                                                <i class="fa fa-star blue-star" aria-hidden="true"></i>
                                                                <i class="fa fa-star gray-star" aria-hidden="true"></i>
                                                            </div>
                                                            <h4><font
                                                                    color="red">￥${sale.productsale}/${sale.productunit}</font>
                                                                <span>￥${sale.productprice}/${sale.productunit}</span>
                                                            </h4>
                                                        </div>
                                                        <div class="snipcart-details top_brand_home_details">
                                                            <form action="./cart/cartAdd/${prodetail.productid}.action"
                                                                  method="post">
                                                                <fieldset>
                                                                    <input type="hidden" name="productNum"
                                                                           style="width: 30px;" value="1">
                                                                        <%--<input type="hidden" name="cmd" value="_cart"/>--%>
                                                                        <%--<input type="hidden" name="add" value="1"/>--%>
                                                                        <%--<input type="hidden" name="business" value=" "/>--%>
                                                                        <%--<input type="hidden" name="item_name"--%>
                                                                        <%--value="Fortune Sunflower Oil"/>--%>
                                                                        <%--<input type="hidden" name="amount" value="2.5"/>--%>
                                                                        <%--<input type="hidden" name="discount_amount"--%>
                                                                        <%--value="1.00"/>--%>
                                                                        <%--<input type="hidden" name="currency_code"--%>
                                                                        <%--value="USD"/>--%>
                                                                        <%--<input type="hidden" name="return" value=" "/>--%>
                                                                        <%--<input type="hidden" name="cancel_return"--%>
                                                                        <%--value=" "/>--%>
                                                                    <input type="submit" name="submit" value="添加到购物车"
                                                                                                  class="button"/>
                                                                </fieldset>
                                                            </form>
                                                        </div>
                                                    </div>
                                                </figure>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                            <%--<div class="agile_top_brands_grids">--%>
                            <%--<div class="col-md-4 top_brand_left">--%>
                            <%--<div class="hover14 column">--%>
                            <%--<div class="agile_top_brand_left_grid">--%>
                            <%--<div class="agile_top_brand_left_grid_pos">--%>
                            <%--<img src="images/offer.png" alt=" " class="img-responsive" />--%>
                            <%--</div>--%>
                            <%--<div class="agile_top_brand_left_grid1">--%>
                            <%--<figure>--%>
                            <%--<div class="snipcart-item block" >--%>
                            <%--<div class="snipcart-thumb">--%>
                            <%--<a href="products.jsp"><img title=" " alt=" " src="images/7.png" /></a>--%>
                            <%--<p>Sona-masoori-rice</p>--%>
                            <%--<div class="stars">--%>
                            <%--<i class="fa fa-star blue-star" aria-hidden="true"></i>--%>
                            <%--<i class="fa fa-star blue-star" aria-hidden="true"></i>--%>
                            <%--<i class="fa fa-star blue-star" aria-hidden="true"></i>--%>
                            <%--<i class="fa fa-star blue-star" aria-hidden="true"></i>--%>
                            <%--<i class="fa fa-star gray-star" aria-hidden="true"></i>--%>
                            <%--</div>--%>
                            <%--<h4>$35.99 <span>$55.00</span></h4>--%>
                            <%--</div>--%>
                            <%--<div class="snipcart-details top_brand_home_details">--%>
                            <%--<form action="#" method="post">--%>
                            <%--<fieldset>--%>
                            <%--<input type="hidden" name="cmd" value="_cart" />--%>
                            <%--<input type="hidden" name="add" value="1" />--%>
                            <%--<input type="hidden" name="business" value=" " />--%>
                            <%--<input type="hidden" name="item_name" value="Fortune Sunflower Oil" />--%>
                            <%--<input type="hidden" name="amount" value="35.99" />--%>
                            <%--<input type="hidden" name="discount_amount" value="1.00" />--%>
                            <%--<input type="hidden" name="currency_code" value="USD" />--%>
                            <%--<input type="hidden" name="return" value=" " />--%>
                            <%--<input type="hidden" name="cancel_return" value=" " />--%>
                            <%--<input type="submit" name="submit" value="添加到购物车" class="button" />--%>
                            <%--</fieldset>--%>
                            <%--</form>--%>
                            <%--</div>--%>
                            <%--</div>--%>
                            <%--</figure>--%>
                            <%--</div>--%>
                            <%--</div>--%>
                            <%--</div>--%>
                            <%--</div>--%>
                            <%--<div class="col-md-4 top_brand_left">--%>
                            <%--<div class="hover14 column">--%>
                            <%--<div class="agile_top_brand_left_grid">--%>
                            <%--<div class="agile_top_brand_left_grid_pos">--%>
                            <%--<img src="images/offer.png" alt=" " class="img-responsive" />--%>
                            <%--</div>--%>
                            <%--<div class="agile_top_brand_left_grid1">--%>
                            <%--<figure>--%>
                            <%--<div class="snipcart-item block" >--%>
                            <%--<div class="snipcart-thumb">--%>
                            <%--<a href="products.jsp"><img title=" " alt=" " src="images/8.png" /></a>--%>
                            <%--<p>Milky-mist-paneer</p>--%>
                            <%--<div class="stars">--%>
                            <%--<i class="fa fa-star blue-star" aria-hidden="true"></i>--%>
                            <%--<i class="fa fa-star blue-star" aria-hidden="true"></i>--%>
                            <%--<i class="fa fa-star blue-star" aria-hidden="true"></i>--%>
                            <%--<i class="fa fa-star blue-star" aria-hidden="true"></i>--%>
                            <%--<i class="fa fa-star gray-star" aria-hidden="true"></i>--%>
                            <%--</div>--%>
                            <%--<h4>$30.99 <span>$45.00</span></h4>--%>
                            <%--</div>--%>
                            <%--<div class="snipcart-details top_brand_home_details">--%>
                            <%--<form action="#" method="post">--%>
                            <%--<fieldset>--%>
                            <%--<input type="hidden" name="cmd" value="_cart" />--%>
                            <%--<input type="hidden" name="add" value="1" />--%>
                            <%--<input type="hidden" name="business" value=" " />--%>
                            <%--<input type="hidden" name="item_name" value="basmati rise" />--%>
                            <%--<input type="hidden" name="amount" value="30.99" />--%>
                            <%--<input type="hidden" name="discount_amount" value="1.00" />--%>
                            <%--<input type="hidden" name="currency_code" value="USD" />--%>
                            <%--<input type="hidden" name="return" value=" " />--%>
                            <%--<input type="hidden" name="cancel_return" value=" " />--%>
                            <%--<input type="submit" name="submit" value="添加到购物车" class="button" />--%>
                            <%--</fieldset>--%>
                            <%--</form>--%>
                            <%--</div>--%>
                            <%--</div>--%>
                            <%--</figure>--%>
                            <%--</div>--%>
                            <%--</div>--%>
                            <%--</div>--%>
                            <%--</div>--%>
                            <%--<div class="col-md-4 top_brand_left">--%>
                            <%--<div class="hover14 column">--%>
                            <%--<div class="agile_top_brand_left_grid">--%>
                            <%--<div class="agile_top_brand_left_grid_pos">--%>
                            <%--<img src="images/offer.png" alt=" " class="img-responsive" />--%>
                            <%--</div>--%>
                            <%--<div class="agile_top_brand_left_grid_pos">--%>
                            <%--<img src="images/offer.png" alt=" " class="img-responsive" />--%>
                            <%--</div>--%>
                            <%--<div class="agile_top_brand_left_grid1">--%>
                            <%--<figure>--%>
                            <%--<div class="snipcart-item block">--%>
                            <%--<div class="snipcart-thumb">--%>
                            <%--<a href="products.jsp"><img src="images/9.png" alt=" " class="img-responsive" /></a>--%>
                            <%--<p>Basmati-Rice</p>--%>
                            <%--<div class="stars">--%>
                            <%--<i class="fa fa-star blue-star" aria-hidden="true"></i>--%>
                            <%--<i class="fa fa-star blue-star" aria-hidden="true"></i>--%>
                            <%--<i class="fa fa-star blue-star" aria-hidden="true"></i>--%>
                            <%--<i class="fa fa-star blue-star" aria-hidden="true"></i>--%>
                            <%--<i class="fa fa-star gray-star" aria-hidden="true"></i>--%>
                            <%--</div>--%>
                            <%--<h4>$80.99 <span>$105.00</span></h4>--%>
                            <%--</div>--%>
                            <%--<div class="snipcart-details top_brand_home_details">--%>
                            <%--<form action="#" method="post">--%>
                            <%--<fieldset>--%>
                            <%--<input type="hidden" name="cmd" value="_cart" />--%>
                            <%--<input type="hidden" name="add" value="1" />--%>
                            <%--<input type="hidden" name="business" value=" " />--%>
                            <%--<input type="hidden" name="item_name" value="Pepsi soft drink" />--%>
                            <%--<input type="hidden" name="amount" value="80.00" />--%>
                            <%--<input type="hidden" name="discount_amount" value="1.00" />--%>
                            <%--<input type="hidden" name="currency_code" value="USD" />--%>
                            <%--<input type="hidden" name="return" value=" " />--%>
                            <%--<input type="hidden" name="cancel_return" value=" " />--%>
                            <%--<input type="submit" name="submit" value="添加到购物车" class="button" />--%>
                            <%--</fieldset>--%>
                            <%--</form>--%>
                            <%--</div>--%>
                            <%--</div>--%>
                            <%--</figure>--%>
                            <%--</div>--%>
                            <%--</div>--%>
                            <%--</div>--%>
                            <%--</div>--%>
                            <div class="clearfix"></div>
                        </div>
                        <div class="agile_top_brands_grids">
                            <%--<div class="col-md-4 top_brand_left">--%>
                            <%--<div class="hover14 column">--%>
                            <%--<div class="agile_top_brand_left_grid">--%>
                            <%--<div class="agile_top_brand_left_grid_pos">--%>
                            <%--<img src="images/offer.png" alt=" " class="img-responsive" />--%>
                            <%--</div>--%>
                            <%--<div class="agile_top_brand_left_grid1">--%>
                            <%--<figure>--%>
                            <%--<div class="snipcart-item block" >--%>
                            <%--<div class="snipcart-thumb">--%>
                            <%--<a href="products.jsp"><img title=" " alt=" " src="images/10.png" /></a>--%>
                            <%--<p>Fortune-sunflower</p>--%>
                            <%--<div class="stars">--%>
                            <%--<i class="fa fa-star blue-star" aria-hidden="true"></i>--%>
                            <%--<i class="fa fa-star blue-star" aria-hidden="true"></i>--%>
                            <%--<i class="fa fa-star blue-star" aria-hidden="true"></i>--%>
                            <%--<i class="fa fa-star blue-star" aria-hidden="true"></i>--%>
                            <%--<i class="fa fa-star gray-star" aria-hidden="true"></i>--%>
                            <%--</div>--%>
                            <%--<h4>$20.99 <span>$35.00</span></h4>--%>
                            <%--</div>--%>
                            <%--<div class="snipcart-details top_brand_home_details">--%>
                            <%--<form action="#" method="post">--%>
                            <%--<fieldset>--%>
                            <%--<input type="hidden" name="cmd" value="_cart" />--%>
                            <%--<input type="hidden" name="add" value="1" />--%>
                            <%--<input type="hidden" name="business" value=" " />--%>
                            <%--<input type="hidden" name="item_name" value="Fortune Sunflower Oil" />--%>
                            <%--<input type="hidden" name="amount" value="20.99" />--%>
                            <%--<input type="hidden" name="discount_amount" value="1.00" />--%>
                            <%--<input type="hidden" name="currency_code" value="USD" />--%>
                            <%--<input type="hidden" name="return" value=" " />--%>
                            <%--<input type="hidden" name="cancel_return" value=" " />--%>
                            <%--<input type="submit" name="submit" value="添加到购物车" class="button" />--%>
                            <%--</fieldset>--%>
                            <%--</form>--%>
                            <%--</div>--%>
                            <%--</div>--%>
                            <%--</figure>--%>
                            <%--</div>--%>
                            <%--</div>--%>
                            <%--</div>--%>
                            <%--</div>--%>
                            <%--<div class="col-md-4 top_brand_left">--%>
                            <%--<div class="hover14 column">--%>
                            <%--<div class="agile_top_brand_left_grid">--%>
                            <%--<div class="agile_top_brand_left_grid_pos">--%>
                            <%--<img src="images/offer.png" alt=" " class="img-responsive" />--%>
                            <%--</div>--%>
                            <%--<div class="agile_top_brand_left_grid1">--%>
                            <%--<figure>--%>
                            <%--<div class="snipcart-item block" >--%>
                            <%--<div class="snipcart-thumb">--%>
                            <%--<a href="products.jsp"><img title=" " alt=" " src="images/12.png" /></a>--%>
                            <%--<p>Nestle-a-slim</p>--%>
                            <%--<div class="stars">--%>
                            <%--<i class="fa fa-star blue-star" aria-hidden="true"></i>--%>
                            <%--<i class="fa fa-star blue-star" aria-hidden="true"></i>--%>
                            <%--<i class="fa fa-star blue-star" aria-hidden="true"></i>--%>
                            <%--<i class="fa fa-star blue-star" aria-hidden="true"></i>--%>
                            <%--<i class="fa fa-star gray-star" aria-hidden="true"></i>--%>
                            <%--</div>--%>
                            <%--<h4>$20.99 <span>$35.00</span></h4>--%>
                            <%--</div>--%>
                            <%--<div class="snipcart-details top_brand_home_details">--%>
                            <%--<form action="#" method="post">--%>
                            <%--<fieldset>--%>
                            <%--<input type="hidden" name="cmd" value="_cart" />--%>
                            <%--<input type="hidden" name="add" value="1" />--%>
                            <%--<input type="hidden" name="business" value=" " />--%>
                            <%--<input type="hidden" name="item_name" value="basmati rise" />--%>
                            <%--<input type="hidden" name="amount" value="20.99" />--%>
                            <%--<input type="hidden" name="discount_amount" value="1.00" />--%>
                            <%--<input type="hidden" name="currency_code" value="USD" />--%>
                            <%--<input type="hidden" name="return" value=" " />--%>
                            <%--<input type="hidden" name="cancel_return" value=" " />--%>
                            <%--<input type="submit" name="submit" value="添加到购物车" class="button" />--%>
                            <%--</fieldset>--%>
                            <%--</form>--%>
                            <%--</div>--%>
                            <%--</div>--%>
                            <%--</figure>--%>
                            <%--</div>--%>
                            <%--</div>--%>
                            <%--</div>--%>
                            <%--</div>--%>
                            <%--<div class="col-md-4 top_brand_left">--%>
                            <%--<div class="hover14 column">--%>
                            <%--<div class="agile_top_brand_left_grid">--%>
                            <%--<div class="agile_top_brand_left_grid_pos">--%>
                            <%--<img src="images/offer.png" alt=" " class="img-responsive" />--%>
                            <%--</div>--%>
                            <%--<div class="agile_top_brand_left_grid1">--%>
                            <%--<figure>--%>
                            <%--<div class="snipcart-item block">--%>
                            <%--<div class="snipcart-thumb">--%>
                            <%--<a href="products.jsp"><img src="images/13.png" alt=" " class="img-responsive" /></a>--%>
                            <%--<p>Bread-sandwich</p>--%>
                            <%--<div class="stars">--%>
                            <%--<i class="fa fa-star blue-star" aria-hidden="true"></i>--%>
                            <%--<i class="fa fa-star blue-star" aria-hidden="true"></i>--%>
                            <%--<i class="fa fa-star blue-star" aria-hidden="true"></i>--%>
                            <%--<i class="fa fa-star blue-star" aria-hidden="true"></i>--%>
                            <%--<i class="fa fa-star gray-star" aria-hidden="true"></i>--%>
                            <%--</div>--%>
                            <%--<h4>$40.99 <span>$65.00</span></h4>--%>
                            <%--</div>--%>
                            <%--<div class="snipcart-details top_brand_home_details">--%>
                            <%--<form action="#" method="post">--%>
                            <%--<fieldset>--%>
                            <%--<input type="hidden" name="cmd" value="_cart" />--%>
                            <%--<input type="hidden" name="add" value="1" />--%>
                            <%--<input type="hidden" name="business" value=" " />--%>
                            <%--<input type="hidden" name="item_name" value="Pepsi soft drink" />--%>
                            <%--<input type="hidden" name="amount" value="40.00" />--%>
                            <%--<input type="hidden" name="discount_amount" value="1.00" />--%>
                            <%--<input type="hidden" name="currency_code" value="USD" />--%>
                            <%--<input type="hidden" name="return" value=" " />--%>
                            <%--<input type="hidden" name="cancel_return" value=" " />--%>
                            <%--<input type="submit" name="submit" value="添加到购物车" class="button" />--%>
                            <%--</fieldset>--%>
                            <%--</form>--%>
                            <%--</div>--%>
                            <%--</div>--%>
                            <%--</figure>--%>
                            <%--</div>--%>
                            <%--</div>--%>
                            <%--</div>--%>
                            <%--</div>--%>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- //top-brands -->
<!-- Carousel
   ================================================== -->
<div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->


</div><!-- /.carousel -->
<!--banner-bottom-->
<div class="ban-bottom-w3l">
    <div class="container">
        <div class="col-md-6 ban-bottom3">
            <div class="ban-top">
                <img src="images/p2.jpg" class="img-responsive" alt=""/>

            </div>
            <div class="ban-img">
                <div class=" ban-bottom1">
                    <div class="ban-top">
                        <img src="images/p3.jpg" class="img-responsive" alt=""/>

                    </div>
                </div>
                <div class="ban-bottom2">
                    <div class="ban-top">
                        <img src="images/p4.jpg" class="img-responsive" alt=""/>

                    </div>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
        <div class="col-md-6 ban-bottom">
            <div class="ban-top">
                <img src="images/111.jpg" class="img-responsive" alt=""/>


            </div>
        </div>

        <div class="clearfix"></div>
    </div>
</div>
<!--banner-bottom-->
<!--brands-->
<div class="brands">


    <div class="clearfix"></div>
</div>
</div>
</div>
<!--//brands-->
<!-- new -->
<div class="newproducts-w3agile">
    <div class="container">
        
        <div class="agile_top_brands_grids">
            <%--<div class="col-md-3 top_brand_left-1">--%>
            <%--<div class="hover14 column">--%>
            <%--<div class="agile_top_brand_left_grid">--%>
            <%--<div class="agile_top_brand_left_grid_pos">--%>
            <%--<img src="images/offer.png" alt=" " class="img-responsive">--%>
            <%--</div>--%>
            <%--<div class="agile_top_brand_left_grid1">--%>
            <%--<figure>--%>
            <%--<div class="snipcart-item block">--%>
            <%--<div class="snipcart-thumb">--%>
            <%--<a href="products.jsp"><img title=" " alt=" " src="images/14.png"></a>--%>
            <%--<p>爆米花</p>--%>
            <%--<div class="stars">--%>
            <%--<i class="fa fa-star blue-star" aria-hidden="true"></i>--%>
            <%--<i class="fa fa-star blue-star" aria-hidden="true"></i>--%>
            <%--<i class="fa fa-star blue-star" aria-hidden="true"></i>--%>
            <%--<i class="fa fa-star blue-star" aria-hidden="true"></i>--%>
            <%--<i class="fa fa-star gray-star" aria-hidden="true"></i>--%>
            <%--</div>--%>
            <%--<h4>￥10<span>￥15</span></h4>--%>
            <%--</div>--%>
            <%--<div class="snipcart-details top_brand_home_details">--%>
            <%--<form action="#" method="post">--%>
            <%--<fieldset>--%>
            <%--<input type="hidden" name="cmd" value="_cart">--%>
            <%--<input type="hidden" name="add" value="1">--%>
            <%--<input type="hidden" name="business" value=" ">--%>
            <%--<input type="hidden" name="item_name" value="Fortune Sunflower Oil">--%>
            <%--<input type="hidden" name="amount" value="35.99">--%>
            <%--<input type="hidden" name="discount_amount" value="1.00">--%>
            <%--<input type="hidden" name="currency_code" value="USD">--%>
            <%--<input type="hidden" name="return" value=" ">--%>
            <%--<input type="hidden" name="cancel_return" value=" ">--%>
            <%--<input type="submit" name="submit" value="Add to cart" class="button">--%>
            <%--</fieldset>--%>
            <%--</form>--%>
            <%--</div>--%>
            <%--</div>--%>
            <%--</figure>--%>
            <%--</div>--%>
            <%--</div>--%>
            <%--</div>--%>
            <%--</div>--%>
            <%--<div class="col-md-3 top_brand_left-1">--%>
            <%--<div class="hover14 column">--%>
            <%--<div class="agile_top_brand_left_grid">--%>
            <%--<div class="agile_top_brand_left_grid_pos">--%>
            <%--<img src="images/offer.png" alt=" " class="img-responsive">--%>
            <%--</div>--%>
            <%--<div class="agile_top_brand_left_grid1">--%>
            <%--<figure>--%>
            <%--<div class="snipcart-item block">--%>
            <%--<div class="snipcart-thumb">--%>
            <%--<a href="products.jsp"><img title=" " alt=" " src="images/15.png"></a>--%>
            <%--<p>菜干</p>--%>
            <%--<div class="stars">--%>
            <%--<i class="fa fa-star blue-star" aria-hidden="true"></i>--%>
            <%--<i class="fa fa-star blue-star" aria-hidden="true"></i>--%>
            <%--<i class="fa fa-star blue-star" aria-hidden="true"></i>--%>
            <%--<i class="fa fa-star blue-star" aria-hidden="true"></i>--%>
            <%--<i class="fa fa-star gray-star" aria-hidden="true"></i>--%>
            <%--</div>--%>
            <%--<h4>￥35<span>￥40</span></h4>--%>
            <%--</div>--%>
            <%--<div class="snipcart-details top_brand_home_details">--%>
            <%--<form action="#" method="post">--%>
            <%--<fieldset>--%>
            <%--<input type="hidden" name="cmd" value="_cart">--%>
            <%--<input type="hidden" name="add" value="1">--%>
            <%--<input type="hidden" name="business" value=" ">--%>
            <%--<input type="hidden" name="item_name" value="basmati rise">--%>
            <%--<input type="hidden" name="amount" value="30.99">--%>
            <%--<input type="hidden" name="discount_amount" value="1.00">--%>
            <%--<input type="hidden" name="currency_code" value="USD">--%>
            <%--<input type="hidden" name="return" value=" ">--%>
            <%--<input type="hidden" name="cancel_return" value=" ">--%>
            <%--<input type="submit" name="submit" value="添加到购物车" class="button">--%>
            <%--</fieldset>--%>
            <%--</form>--%>
            <%--</div>--%>
            <%--</div>--%>
            <%--</figure>--%>
            <%--</div>--%>
            <%--</div>--%>
            <%--</div>--%>
            <%--</div>--%>
            <%--<div class="col-md-3 top_brand_left-1">--%>
            <%--<div class="hover14 column">--%>
            <%--<div class="agile_top_brand_left_grid">--%>
            <%--<div class="agile_top_brand_left_grid_pos">--%>
            <%--<img src="images/offer.png" alt=" " class="img-responsive">--%>
            <%--</div>--%>
            <%--<div class="agile_top_brand_left_grid_pos">--%>
            <%--<img src="images/offer.png" alt=" " class="img-responsive">--%>
            <%--</div>--%>
            <%--<div class="agile_top_brand_left_grid1">--%>
            <%--<figure>--%>
            <%--<div class="snipcart-item block">--%>
            <%--<div class="snipcart-thumb">--%>
            <%--<a href="products.jsp"><img src="images/16.png" alt=" " class="img-responsive"></a>--%>
            <%--<p>White-peasmatar</p>--%>
            <%--<div class="stars">--%>
            <%--<i class="fa fa-star blue-star" aria-hidden="true"></i>--%>
            <%--<i class="fa fa-star blue-star" aria-hidden="true"></i>--%>
            <%--<i class="fa fa-star blue-star" aria-hidden="true"></i>--%>
            <%--<i class="fa fa-star blue-star" aria-hidden="true"></i>--%>
            <%--<i class="fa fa-star gray-star" aria-hidden="true"></i>--%>
            <%--</div>--%>
            <%--<h4>$80.99 <span>$105.00</span></h4>--%>
            <%--</div>--%>
            <%--<div class="snipcart-details top_brand_home_details">--%>
            <%--<form action="#" method="post">--%>
            <%--<fieldset>--%>
            <%--<input type="hidden" name="cmd" value="_cart">--%>
            <%--<input type="hidden" name="add" value="1">--%>
            <%--<input type="hidden" name="business" value=" ">--%>
            <%--<input type="hidden" name="item_name" value="Pepsi soft drink">--%>
            <%--<input type="hidden" name="amount" value="80.00">--%>
            <%--<input type="hidden" name="discount_amount" value="1.00">--%>
            <%--<input type="hidden" name="currency_code" value="USD">--%>
            <%--<input type="hidden" name="return" value=" ">--%>
            <%--<input type="hidden" name="cancel_return" value=" ">--%>
            <%--<input type="submit" name="submit" value="添加到购物车" class="button">--%>
            <%--</fieldset>--%>
            <%--</form>--%>
            <%--</div>--%>
            <%--</div>--%>
            <%--</figure>--%>
            <%--</div>--%>
            <%--</div>--%>
            <%--</div>--%>
            <%--</div>--%>
            <%--<div class="col-md-3 top_brand_left-1">--%>
            <%--<div class="hover14 column">--%>
            <%--<div class="agile_top_brand_left_grid">--%>
            <%--<div class="agile_top_brand_left_grid_pos">--%>
            <%--<img src="images/offer.png" alt=" " class="img-responsive">--%>
            <%--</div>--%>
            <%--<div class="agile_top_brand_left_grid1">--%>
            <%--<figure>--%>
            <%--<div class="snipcart-item block">--%>
            <%--<div class="snipcart-thumb">--%>
            <%--<a href="products.jsp"><img title=" " alt=" " src="images/17.png"></a>--%>
            <%--<p>Channa-dal</p>--%>
            <%--<div class="stars">--%>
            <%--<i class="fa fa-star blue-star" aria-hidden="true"></i>--%>
            <%--<i class="fa fa-star blue-star" aria-hidden="true"></i>--%>
            <%--<i class="fa fa-star blue-star" aria-hidden="true"></i>--%>
            <%--<i class="fa fa-star blue-star" aria-hidden="true"></i>--%>
            <%--<i class="fa fa-star gray-star" aria-hidden="true"></i>--%>
            <%--</div>--%>
            <%--<h4>$35.99 <span>$55.00</span></h4>--%>
            <%--</div>--%>
            <%--<div class="snipcart-details top_brand_home_details">--%>
            <%--<form action="#" method="post">--%>
            <%--<fieldset>--%>
            <%--<input type="hidden" name="cmd" value="_cart">--%>
            <%--<input type="hidden" name="add" value="1">--%>
            <%--<input type="hidden" name="business" value=" ">--%>
            <%--<input type="hidden" name="item_name" value="Fortune Sunflower Oil">--%>
            <%--<input type="hidden" name="amount" value="35.99">--%>
            <%--<input type="hidden" name="discount_amount" value="1.00">--%>
            <%--<input type="hidden" name="currency_code" value="USD">--%>
            <%--<input type="hidden" name="return" value=" ">--%>
            <%--<input type="hidden" name="cancel_return" value=" ">--%>
            <%--<input type="submit" name="submit" value="添加到购物车" class="button">--%>
            <%--</fieldset>--%>
            <%--</form>--%>
            <%--</div>--%>
            <%--</div>--%>
            <%--</figure>--%>
            <%--</div>--%>
            <%--</div>--%>
            <%--</div>--%>
            <%--</div>--%>
            <div class="clearfix"></div>
        </div>
    </div>
</div>
<!-- //new -->
<!-- //footer -->
<div class="footer">
    <div class="container">
        <div class="w3_footer_grids">
            <div class="col-md-3 w3_footer_grid">
                <h3>基本信息</h3>

                <ul class="address">
                    <li><i class="glyphicon glyphicon-map-marker" aria-hidden="true"></i>厦门市软件园二期<span>经纬盈创</span></li>
                    <li><i class="glyphicon glyphicon-envelope" aria-hidden="true"></i><a
                            href="mailto:info@example.com">1008611@qq.com</a></li>
                    <li><i class="glyphicon glyphicon-earphone" aria-hidden="true"></i>100861123</li>


                </ul>
            </div>
            <div class="col-md-3 w3_footer_grid">
                <h3>用户</h3>
                <c:if test="${user eq null}">
                    <li><i class="fa fa-arrow-right" aria-hidden="true"></i><a href="login.jsp">登陆</a></li>
                    <li><i class="fa fa-arrow-right" aria-hidden="true"></i><a href="registered.jsp">创建用户</a></li>
                </c:if>
                <c:if test="${user ne null}">
                    <li><i class="fa fa-arrow-right" aria-hidden="true">欢迎您</i><a href="geren.jsp"><font color="white" size="4px">${user.username}</font></a></li>

                </c:if>


            </div>

            <div class="clearfix"></div>
        </div>
    </div>

    <div class="footer-copy">

        <div class="container">

        </div>
    </div>

</div>
<div class="footer-botm">
    <div class="container">
        <div class="w3layouts-foot">
            <ul>
                <li><a href="#" class="w3_agile_facebook"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
                <li><a href="#" class="agile_twitter"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
                <li><a href="#" class="w3_agile_dribble"><i class="fa fa-dribbble" aria-hidden="true"></i></a></li>
                <li><a href="#" class="w3_agile_vimeo"><i class="fa fa-vimeo" aria-hidden="true"></i></a></li>
            </ul>
        </div>
        <div class="payment-w3ls">
            <img src="images/card.png" alt=" " class="img-responsive">
        </div>
        <div class="clearfix"></div>
    </div>
</div>
<!-- //footer -->
<!-- Bootstrap Core JavaScript -->
<script src="js/bootstrap.min.js"></script>

<!-- top-header and slider -->
<!-- here stars scrolling icon -->
<script type="text/javascript">
    $(document).ready(function () {
        /*
         var defaults = {
         containerID: 'toTop', // fading element id
         containerHoverID: 'toTopHover', // fading element hover id
         scrollSpeed: 1200,
         easingType: 'linear'
         };
         */

        $().UItoTop({easingType: 'easeOutQuart'});

    });
</script>
<!-- //here ends scrolling icon -->
<script src="js/minicart.min.js"></script>
<script>
    // Mini Cart
    paypal.minicart.render({
        action: '#'
    });

    if (~window.location.search.indexOf('reset=true')) {
        paypal.minicart.reset();
    }
</script>
<!-- main slider-banner -->
<script src="js/skdslider.min.js"></script>
<link href="css/skdslider.css" rel="stylesheet">
<script type="text/javascript">
    jQuery(document).ready(function () {
        jQuery('#demo1').skdslider({
            'delay': 5000,
            'animationSpeed': 2000,
            'showNextPrev': true,
            'showPlayButton': true,
            'autoSlide': true,
            'animationType': 'fading'
        });

        jQuery('#responsive').change(function () {
            $('#responsive_wrapper').width(jQuery(this).val());
        });

    });
</script>
<!-- //main slider-banner -->
</body>
</html>
