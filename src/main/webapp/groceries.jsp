<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/11/20
  Time: 16:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="appcomm/basePath.jsp" %>

<html>
<head>
    <title>Groceries</title>
    <!-- for-mobile-apps -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="" />
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
    function hideURLbar(){ window.scrollTo(0,1); } </script>
    <!-- //for-mobile-apps -->
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
    <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
    <!-- font-awesome icons -->
    <link href="css/font-awesome.css" rel="stylesheet">
    <!-- //font-awesome icons -->
    <!-- js -->
    <script src="js/jquery-1.11.1.min.js"></script>
    <!-- //js -->
    <link href='http://fonts.googleapis.com/css?family=Raleway:400,100,100italic,200,200italic,300,400italic,500,500italic,600,600italic,700,700italic,800,800italic,900,900italic' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'>
    <!-- start-smoth-scrolling -->
    <script type="text/javascript" src="js/move-top.js"></script>
    <script type="text/javascript" src="js/easing.js"></script>
    <script type="text/javascript">
        jQuery(document).ready(function($) {
            $(".scroll").click(function(event){
                event.preventDefault();
                $('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
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
            <p>新会员打8.5折. <a href="products.jsp?op=searchPage">现在去购物</a></p>
        </div>
        <div class="agile-login">
            <ul>
                <c:if test="${user eq null}">
                    <li><a href="registered.jsp"> 新建账号 </a></li>
                    <li><a href="login.jsp">登陆</a></li>

                </c:if>
                <h3>
                    <c:if test="${user ne null}">
                        <li><a ><img src="${user.userface}" style="width: 50px; height: 40px;"></a></li>
                        <li><a>
                            <font  color="white" size="4px">${user.username} </font ></a></li>
                        <li><a href="geren.jsp">个人中心</a></li>
                        <a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>

                        <li><a  href="login?op=loginOut">
                            <font  color="white">退出</font ></a></li>

                    </c:if>
                </h3>
                <%--<li><a href="registered.jsp"> 新建用户</a></li>--%>
                <%--<li><a href="login.jsp">登陆</a></li>--%>
                <%--<li><a href="contact.jsp">管理员登陆</a></li>--%>

            </ul>
        </div>
        <div class="product_list_header">
            <form action="./cart/cartList.action" method="get" class="last">
                <%--<input type="hidden" name="cmd" value="_cart">--%>
                <%--<input type="hidden" name="display" value="1">--%>
                <button class="w3view-cart" type="submit" name="submit" value=""><i class="fa fa-cart-arrow-down" aria-hidden="true"></i></button>
            </form>
        </div>
        <div class="clearfix"> </div>
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

        <div class="clearfix"> </div>
    </div>
</div>
<!-- //header -->
<!-- navigation -->
<div class="navigation-agileits">
    <div class="container">
        <nav class="navbar navbar-default">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header nav_2">
                <button type="button" class="navbar-toggle collapsed navbar-toggle1" data-toggle="collapse" data-target="#bs-megadropdown-tabs">
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
                    <jsp:include page="pagehome?op=clicktype"/>

                    <c:forEach var="ptg" items="${sessionScope.listPTG}">
                    <li class="dropdown">
                    <li class="active"><a href="groceries.jsp?op=clicktype&producttypeid=${ptg.producttypeid}" class="act">${ptg.producttypename}</a></li>
                    </li>
                    </c:forEach>
                    <%--<li class="dropdown">--%>
                    <%--<li class="active"><a href="groceries.jsp" class="act">水果</a></li>--%>

                    <%--</li>--%>
                    <%--<li class="dropdown">--%>
                    <%--<li class="active"><a href="household.jsp" class="act">蔬菜</a></li>--%>

                    <%--</li>--%>
                    <%--<li class="dropdown">--%>
                    <%--<li class="active"><a href="personalcare.jsp" class="act">肉类</a></li>--%>

                    <%--</li>--%>
                    <%--<li class="dropdown">--%>
                    <%--<li class="active"><a href="packagedfoods.jsp" class="act">零食</a></li>--%>


                </ul>
            </div>
        </nav>
    </div>
</div>

<!-- //navigation -->
<!-- breadcrumbs -->
<div class="breadcrumbs">
    <div class="container">
        <ol class="breadcrumb breadcrumb1 animated wow slideInLeft" data-wow-delay=".5s">
            <li><a href="index.jsp"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>主页</a></li>
            <li class="active">${producttypename}页面</li>
        </ol>
    </div>
</div>
<!-- //breadcrumbs -->
<!--- groceries --->
<div class="products">
    <div class="container">

        <%--<jsp:include page="pagehome?op=clicktype"/>--%>

        <div class="agile_top_brands_grids">
            <c:forEach var="pro" items="${requestScope.product}">
            <div class="col-md-4 top_brand_left">
                <div class="hover14 column">
                    <div class="agile_top_brand_left_grid">
                        <div class="agile_top_brand_left_grid_pos">
                            <img src="images/offer.png" alt=" " class="img-responsive">
                        </div>
                        <div class="agile_top_brand_left_grid1">
                            <figure>
                                <div class="snipcart-item block">
                                    <div class="snipcart-thumb">
                                        <a href="single.jsp?op=clickproduct&productid=${pro.productid}"><img title="${pro.productcontent}" alt=" " src="${pro.productimg}" width="250px" height="150px"></a>
                                        <p>${pro.productname}</p>
                                        <h4><font color="red">￥${pro.productsale}/${pro.productunit}</font><span>￥${pro.productprice}/${pro.productunit}</span> </h4>
                                        <%--<span>$55.00</span>--%>
                                    </div>
                                    <div class="snipcart-details top_brand_home_details">
                                        <form action="./cart/cartAdd/${pro.productid}.action" method="post">
                                            <fieldset>
                                                <input type="hidden" name="productNum" style="width: 30px;" value="1">
                                        <%--<input type="hidden" name="cmd" value="_cart">--%>
                                        <%--<input type="hidden" name="add" value="1">--%>
                                        <%--<input type="hidden" name="business" value=" ">--%>
                                        <%--<input type="hidden" name="item_name" value="Fortune Sunflower Oil">--%>
                                        <%--<input type="hidden" name="amount" value="${pro.productprice}">--%>
                                        <%--<input type="hidden" name="discount_amount" value="1.00">--%>
                                        <%--<input type="hidden" name="currency_code" value="USD">--%>
                                        <%--<input type="hidden" name="return" value="加入购物车">--%>
                                        <%--<input type="hidden" name="cancel_return" value=" ">--%>
                                        <input type="submit" name="submit" value="添加到购物车" class="button">
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
                            <%--<img src="images/offer.png" alt=" " class="img-responsive">--%>
                        <%--</div>--%>
                        <%--<div class="agile_top_brand_left_grid1">--%>
                            <%--<figure>--%>
                                <%--<div class="snipcart-item block">--%>
                                    <%--<div class="snipcart-thumb">--%>
                                        <%--<a href="single.jsp"><img title=" " alt=" " src="images/15.png"></a>--%>
                                        <%--<p>Moong Dal</p>--%>
                                        <%--<h4>$30.99 <span>$45.00</span></h4>--%>
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
            <%--<div class="col-md-4 top_brand_left">--%>
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
                                        <%--<a href="single.jsp"><img src="images/16.png" alt=" " class="img-responsive"></a>--%>
                                        <%--<p>Channa</p>--%>
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
            <%--<div class="clearfix"> </div>--%>
        <%--</div>--%>
        <%--<div class="agile_top_brands_grids">--%>
            <%--<div class="col-md-4 top_brand_left">--%>
                <%--<div class="hover14 column">--%>
                    <%--<div class="agile_top_brand_left_grid">--%>
                        <%--<div class="agile_top_brand_left_grid_pos">--%>
                            <%--<img src="images/offer.png" alt=" " class="img-responsive">--%>
                        <%--</div>--%>
                        <%--<div class="agile_top_brand_left_grid1">--%>
                            <%--<figure>--%>
                                <%--<div class="snipcart-item block">--%>
                                    <%--<div class="snipcart-thumb">--%>
                                        <%--<a href="single.jsp"><img title=" " alt=" " src="images/17.png"></a>--%>
                                        <%--<p>Arhar Dal</p>--%>
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
            <%--<div class="col-md-4 top_brand_left">--%>
                <%--<div class="hover14 column">--%>
                    <%--<div class="agile_top_brand_left_grid">--%>
                        <%--<div class="agile_top_brand_left_grid_pos">--%>
                            <%--<img src="images/offer.png" alt=" " class="img-responsive">--%>
                        <%--</div>--%>
                        <%--<div class="agile_top_brand_left_grid1">--%>
                            <%--<figure>--%>
                                <%--<div class="snipcart-item block">--%>
                                    <%--<div class="snipcart-thumb">--%>
                                        <%--<a href="single.jsp"><img title=" " alt=" " src="images/14.png"></a>--%>
                                        <%--<p>Toor Dal</p>--%>
                                        <%--<h4>$30.99 <span>$45.00</span></h4>--%>
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
            <%--<div class="col-md-4 top_brand_left">--%>
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
                                        <%--<a href="single.jsp"><img src="images/15.png" alt=" " class="img-responsive"></a>--%>
                                        <%--<p>Moong Dal</p>--%>
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
            <%--<div class="clearfix"> </div>--%>
        <%--</div>--%>
        <%--<div class="agile_top_brands_grids">--%>
            <%--<div class="col-md-4 top_brand_left">--%>
                <%--<div class="hover14 column">--%>
                    <%--<div class="agile_top_brand_left_grid">--%>
                        <%--<div class="agile_top_brand_left_grid_pos">--%>
                            <%--<img src="images/offer.png" alt=" " class="img-responsive">--%>
                        <%--</div>--%>
                        <%--<div class="agile_top_brand_left_grid1">--%>
                            <%--<figure>--%>
                                <%--<div class="snipcart-item block">--%>
                                    <%--<div class="snipcart-thumb">--%>
                                        <%--<a href="single.jsp"><img title=" " alt=" " src="images/16.png"></a>--%>
                                        <%--<p>Channa</p>--%>
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
            <%--<div class="col-md-4 top_brand_left">--%>
                <%--<div class="hover14 column">--%>
                    <%--<div class="agile_top_brand_left_grid">--%>
                        <%--<div class="agile_top_brand_left_grid_pos">--%>
                            <%--<img src="images/offer.png" alt=" " class="img-responsive">--%>
                        <%--</div>--%>
                        <%--<div class="agile_top_brand_left_grid1">--%>
                            <%--<figure>--%>
                                <%--<div class="snipcart-item block">--%>
                                    <%--<div class="snipcart-thumb">--%>
                                        <%--<a href="single.jsp"><img title=" " alt=" " src="images/17.png"></a>--%>
                                        <%--<p>Arhar Dal</p>--%>
                                        <%--<h4>$30.99 <span>$45.00</span></h4>--%>
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
            <%--<div class="col-md-4 top_brand_left">--%>
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
                                        <%--<a href="single.jsp"><img src="images/14.png" alt=" " class="img-responsive"></a>--%>
                                        <%--<p>Toor Dal</p>--%>
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
            <div class="clearfix"> </div>
        </div>

    </div>
    <div class="clearfix"> </div>
</div>
</div>
<!--- groceries --->
<!-- //footer -->
<div class="footer">
    <div class="container">
        <div class="w3_footer_grids">
            <div class="col-md-3 w3_footer_grid">
                <h3>基本信息</h3>

                <ul class="address">
                    <li><i class="glyphicon glyphicon-map-marker" aria-hidden="true"></i>厦门市软件园二期<span>经纬盈创</span></li>
                    <li><i class="glyphicon glyphicon-envelope" aria-hidden="true"></i><a href="mailto:info@example.com">1008611@qq.com</a></li>
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
                    <li><i class="fa fa-arrow-right" aria-hidden="true">欢迎您</i><a href="geren.jsp">${user.username}</a></li>

                </c:if>


            </div>
            <div class="clearfix"> </div>
        </div>
    </div>

    <div class="footer-copy">


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
        <div class="clearfix"> </div>
    </div>
</div>
<!-- //footer -->
<!-- Bootstrap Core JavaScript -->
<script src="js/bootstrap.min.js"></script>
<!-- top-header and slider -->
<!-- here stars scrolling icon -->
<script type="text/javascript">
    $(document).ready(function() {
        /*
         var defaults = {
         containerID: 'toTop', // fading element id
         containerHoverID: 'toTopHover', // fading element hover id
         scrollSpeed: 1200,
         easingType: 'linear'
         };
         */

        $().UItoTop({ easingType: 'easeOutQuart' });

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
    jQuery(document).ready(function(){
        jQuery('#demo1').skdslider({'delay':5000, 'animationSpeed': 2000,'showNextPrev':true,'showPlayButton':true,'autoSlide':true,'animationType':'fading'});

        jQuery('#responsive').change(function(){
            $('#responsive_wrapper').width(jQuery(this).val());
        });

    });
</script>
<!-- //main slider-banner -->

</body>
</html>
