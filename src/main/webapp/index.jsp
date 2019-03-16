<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
<%@ include file="appcomm/head.jsp" %>
<!-- //navigation -->
<!-- main-slider -->
<ul id="demo1">
    <li>
        <img src="images/outimg.png" alt=""/>
        <!--Slider Description example-->
        <div class="slide-desc">
            <h3>欢迎来到网上电器商城</h3>
        </div>
    </li>
    <li>
        <img src="images/dianqi.jpg" alt=""/>
        <div class="slide-desc">
            <h3>这里是最潮流的电器商品，您想要的应有尽有</h3>
        </div>
    </li>

    <li>
        <img src="images/showinner.jpg" alt=""/>
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
        <h2>畅销</h2>
        <div class="grid_3 grid_5">
            <div class="bs-example bs-example-tabs" role="tabpanel" data-example-id="togglable-tabs">
                <ul id="myTab" class="nav nav-tabs" role="tablist">
                    <li role="presentation" class="active"><a href="#expeditions" id="expeditions-tab" role="tab"
                                                              data-toggle="tab" aria-controls="expeditions"
                                                              aria-expanded="true">广告</a></li>
                    <li role="presentation"><a href="#tours" role="tab" id="tours-tab" data-toggle="tab"
                                               aria-controls="tours">每周品牌</a></li>
                </ul>
                <div id="myTabContent" class="tab-content">
                    <div role="tabpanel" class="tab-pane fade in active" id="expeditions"
                         aria-labelledby="expeditions-tab">
                        <div class="agile-tp">
                            <h5>关注商品</h5>
                            <p class="w3l-ad">这一些是最受用户欢迎的商品</p>
                        </div>
                        <div class="agile_top_brands_grids">
                            <c:forEach var="click" items="${listClick}">
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
                                                            <a href="/sp/single/${click.pid}"><img
                                                                    title="${click.pdescription }" alt=" "
                                                                    src="${click.pimg}" width="250px"
                                                                    height="250px"/></a>
                                                            <p>
                                                                <c:if test="${fn:length(click.pname) > 15}">${fn:substring(click.pname, 0, 15)}...</c:if>


                                                                <c:if test="${fn:length(click.pname) <= 15}">${click.pname}</c:if>

                                                            </p>
                                                            <div class="stars">
                                                                <i class="fa fa-star blue-star" aria-hidden="true"></i>
                                                                <i class="fa fa-star blue-star" aria-hidden="true"></i>
                                                                <i class="fa fa-star blue-star" aria-hidden="true"></i>
                                                                <i class="fa fa-star blue-star" aria-hidden="true"></i>
                                                                <i class="fa fa-star gray-star" aria-hidden="true"></i>
                                                            </div>
                                                            <h4><font
                                                                    color="red">￥${click.pprice}/件</font>

                                                            </h4>
                                                            <br>
                                                            <h4>已浏览<font color="red">${click.pclicks}</font>次</h4>
                                                        </div>
                                                        <div class="snipcart-details top_brand_home_details">
                                                            <c:if test="${sessionScope.user eq null}">
                                                                <form action="/login.jsp" method="post">
                                                                    <fieldset>
                                                                        <input type="hidden" name="productNum" style="width: 30px;"
                                                                               value="1">
                                                                            <%--<input type="hidden" name="cmd" value="_cart">--%>
                                                                            <%--<input type="hidden" name="add" value="1">--%>
                                                                            <%--<input type="hidden" name="business" value=" ">--%>
                                                                            <%--<input type="hidden" name="item_name" value="Fortune Sunflower Oil">--%>
                                                                            <%--<input type="hidden" name="amount" value="${pro.productprice}">--%>
                                                                            <%--<input type="hidden" name="discount_amount" value="1.00">--%>
                                                                            <%--<input type="hidden" name="currency_code" value="USD">--%>
                                                                            <%--<input type="hidden" name="return" value="加入购物车">--%>
                                                                            <%--<input type="hidden" name="cancel_return" value=" ">--%>
                                                                        <input type="submit" name="submit" value="添加到购物车" class="button"
                                                                               onclick="click01()">
                                                                    </fieldset>
                                                                </form>
                                                            </c:if>
                                                            <c:if test="${sessionScope.user ne null}">

                                                                <fieldset>
                                                                    <input type="hidden" name="productNum" style="width: 30px;"
                                                                           value="1">
                                                                        <%--<input type="hidden" name="cmd" value="_cart">--%>
                                                                        <%--<input type="hidden" name="add" value="1">--%>
                                                                        <%--<input type="hidden" name="business" value=" ">--%>
                                                                        <%--<input type="hidden" name="item_name" value="Fortune Sunflower Oil">--%>
                                                                        <%--<input type="hidden" name="amount" value="${pro.productprice}">--%>
                                                                        <%--<input type="hidden" name="discount_amount" value="1.00">--%>
                                                                        <%--<input type="hidden" name="currency_code" value="USD">--%>
                                                                        <%--<input type="hidden" name="return" value="加入购物车">--%>
                                                                        <%--<input type="hidden" name="cancel_return" value=" ">--%>
                                                                    <input type="button" pid="${click.pid}" name="submit"
                                                                           value="添加到购物车"
                                                                           class="button">
                                                                </fieldset>

                                                            </c:if>
                                                        </div>
                                                    </div>
                                                </figure>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </c:forEach>



                            <div class="clearfix"></div>
                        </div>
                    </div>
                    <div role="tabpanel" class="tab-pane fade" id="tours" aria-labelledby="tours-tab">
                        <div class="agile-tp">
                            <h5>本周推荐品牌</h5>
                            <p class="w3l-ad">我们已经筛选每周风云品牌，本周品牌为美的！</p>
                        </div>
                        <div class="agile_top_brands_grids">
                            <c:forEach var="sale" items="${listRec}">
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
                                                            <a href="/sp/single/${sale.pid}"><img
                                                                    title="${sale.pdescription}" alt=" "
                                                                    src="${sale.pimg}" width="250px"
                                                                    height="250px"/></a>
                                                            <p>
                                                                <c:if test="${fn:length(sale.pname) > 15}">${fn:substring(sale.pname, 0, 15)}...</c:if>


                                                                <c:if test="${fn:length(sale.pname) <= 15}">${sale.pname}</c:if>


                                                            </p>
                                                            <div class="stars">
                                                                <i class="fa fa-star blue-star" aria-hidden="true"></i>
                                                                <i class="fa fa-star blue-star" aria-hidden="true"></i>
                                                                <i class="fa fa-star blue-star" aria-hidden="true"></i>
                                                                <i class="fa fa-star blue-star" aria-hidden="true"></i>
                                                                <i class="fa fa-star gray-star" aria-hidden="true"></i>
                                                            </div>
                                                            <h4><font
                                                                    color="red">￥${sale.pprice}/件</font>
                                                            </h4>
                                                            <br>
                                                            <h4>已浏览<font color="red">${sale.pclicks}</font>次</h4>
                                                        </div>
                                                        <div class="snipcart-details top_brand_home_details">
                                                            <c:if test="${sessionScope.user eq null}">
                                                                <form action="/login.jsp" method="post">
                                                                    <fieldset>
                                                                        <input type="hidden" name="productNum" style="width: 30px;"
                                                                               value="1">
                                                                            <%--<input type="hidden" name="cmd" value="_cart">--%>
                                                                            <%--<input type="hidden" name="add" value="1">--%>
                                                                            <%--<input type="hidden" name="business" value=" ">--%>
                                                                            <%--<input type="hidden" name="item_name" value="Fortune Sunflower Oil">--%>
                                                                            <%--<input type="hidden" name="amount" value="${pro.productprice}">--%>
                                                                            <%--<input type="hidden" name="discount_amount" value="1.00">--%>
                                                                            <%--<input type="hidden" name="currency_code" value="USD">--%>
                                                                            <%--<input type="hidden" name="return" value="加入购物车">--%>
                                                                            <%--<input type="hidden" name="cancel_return" value=" ">--%>
                                                                        <input type="submit" name="submit" value="添加到购物车" class="button"
                                                                               onclick="click01()">
                                                                    </fieldset>
                                                                </form>
                                                            </c:if>
                                                            <c:if test="${sessionScope.user ne null}">

                                                                <fieldset>
                                                                    <input type="hidden" name="productNum" style="width: 30px;"
                                                                           value="1">
                                                                        <%--<input type="hidden" name="cmd" value="_cart">--%>
                                                                        <%--<input type="hidden" name="add" value="1">--%>
                                                                        <%--<input type="hidden" name="business" value=" ">--%>
                                                                        <%--<input type="hidden" name="item_name" value="Fortune Sunflower Oil">--%>
                                                                        <%--<input type="hidden" name="amount" value="${pro.productprice}">--%>
                                                                        <%--<input type="hidden" name="discount_amount" value="1.00">--%>
                                                                        <%--<input type="hidden" name="currency_code" value="USD">--%>
                                                                        <%--<input type="hidden" name="return" value="加入购物车">--%>
                                                                        <%--<input type="hidden" name="cancel_return" value=" ">--%>
                                                                    <input type="button" pid="${sale.pid}" name="submit"
                                                                           value="添加到购物车"
                                                                           class="button">
                                                                </fieldset>

                                                            </c:if>
                                                        </div>
                                                    </div>
                                                </figure>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>

                            <div class="clearfix"></div>
                        </div>
                        <div class="agile_top_brands_grids">


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
<%@ include file="appcomm/foot.jsp" %>
<!-- //footer -->
<!-- Bootstrap Core JavaScript -->
<script src="js/bootstrap.min.js"></script>
<script>
    function click01() {
        alert("请登录后操作");
    }

    $(document).ready(function () {

        $(".button").click(function () {

            var pid = $(this).attr("pid");
            var  num =$(".font01").html();
            $.ajax({
                url: '/car/caradd',
                type: 'POST',
                dataType: "json",
                data: {
                    'pid': pid,
                },
                success: function (result) {
                    if (result == 1) {
                        alert('添加成功');
                        $(".font01").html(parseInt(num)+parseInt(1));
                    }else if (result == 2){
                        alert('添加成功');
                    } else {
                        alert("添加失败");
                    }
                }
            })

        })
    })

</script>

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
