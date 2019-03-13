<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/11/20
  Time: 16:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="appcomm/basePath.jsp" %>
<html>
<head>
    <title>Single Page</title>
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
<%@ include file="appcomm/head.jsp" %>

<!-- //navigation -->
<!-- breadcrumbs -->
<div class="breadcrumbs">
    <div class="container">
        <ol class="breadcrumb breadcrumb1 animated wow slideInLeft" data-wow-delay=".5s">
            <li><a href="index.jsp"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>主页</a></li>
            <li class="active">商品描述</li>
        </ol>
    </div>
</div>
<!-- //breadcrumbs -->
<div class="products">
    <div class="container">
        <div class="agileinfo_single">
            <%--<jsp:include page="pagehome?op=clickproduct"/>--%>
            <div class="col-md-4 agileinfo_single_left">
                <img id="example" src="${prodetail.productimg}" alt="${prodetail.productcontent}" class="img-responsive" width="300px" height="150px">
            </div>
            <div class="col-md-8 agileinfo_single_right">
                <h2>${prodetail.productcontent}</h2>
                <div class="rating1">
						<span class="starRating">
							<input id="rating5" type="radio" name="rating" value="5">
							<label for="rating5">5</label>
							<input id="rating4" type="radio" name="rating" value="4">
							<label for="rating4">4</label>
							<input id="rating3" type="radio" name="rating" value="3" checked="">
							<label for="rating3">3</label>
							<input id="rating2" type="radio" name="rating" value="2">
							<label for="rating2">2</label>
							<input id="rating1" type="radio" name="rating" value="1">
							<label for="rating1">1</label>
						</span>
                </div>
                <div class="w3agile_description">
                    <h4>库存还剩下&nbsp;&nbsp;<font color="blue">${prodetail.productstorage}</font>&nbsp;&nbsp;${prodetail.productunit}</h4>
                    <%--<h4>产品描述 :</h4>--%>
                    <%--<p>${prodetail.productcontent}</p>--%>
                </div>
                <div class="snipcart-item block">
                    <div class="snipcart-thumb agileinfo_single_right_snipcart">
                        <h4 class="m-sing"><font color="red">￥${prodetail.productsale}/${prodetail.productunit}</font><span>￥${prodetail.productprice}/${prodetail.productunit}</span></h4>
                    </div>
                    <div class="snipcart-details agileinfo_single_right_details">


                        <c:if test="${sessionScope.user eq null}">
                            <form action="./cart/cartAddTest.action" method="post">

                                <table>
                                    <tr>
                                        <td>数量：</td>
                                        <td><input type="text" name="productNum" style="width: 30px;" value="1"></td>
                                    </tr>
                                </table>

                                <fieldset>

                                        <%--<input type="hidden" name="cmd" value="_cart">--%>
                                        <%--<input type="hidden" name="add" value="1">--%>
                                        <%--<input type="hidden" name="business" value=" ">--%>
                                        <%--<input type="hidden" name="item_name" value="pulao basmati rice">--%>
                                        <%--<input type="hidden" name="amount" value="${pro.productprice}">--%>
                                        <%--<input type="hidden" name="discount_amount" value="1.00">--%>
                                        <%--<input type="hidden" name="currency_code" value="USD">--%>
                                        <%--<input type="hidden" name="return" value=" ">--%>
                                        <%--<input type="hidden" name="cancel_return" value=" ">--%>
                                    <input type="submit" name="submit" value="添加到购物车" class="button"
                                           onclick="cartTest()">
                                    <input type="hidden" name="productproductsale" value="${prodetail.productsale}">
                                    <input type="hidden" name="productproductsale" value="${prodetail.productimg}">

                                </fieldset>
                            </form>
                        </c:if>
                        <c:if test="${sessionScope.user ne null}">
                            <form action="./cart/cartAdd/${prodetail.productid}.action" method="post">

                                <table>
                                    <tr>
                                        <td>数量：</td>
                                        <td><input type="text" name="productNum" style="width: 30px;" value="1"></td>
                                    </tr>
                                </table>

                                <fieldset>

                                        <%--<input type="hidden" name="cmd" value="_cart">--%>
                                        <%--<input type="hidden" name="add" value="1">--%>
                                        <%--<input type="hidden" name="business" value=" ">--%>
                                        <%--<input type="hidden" name="item_name" value="pulao basmati rice">--%>
                                        <%--<input type="hidden" name="amount" value="${pro.productprice}">--%>
                                        <%--<input type="hidden" name="discount_amount" value="1.00">--%>
                                        <%--<input type="hidden" name="currency_code" value="USD">--%>
                                        <%--<input type="hidden" name="return" value=" ">--%>
                                        <%--<input type="hidden" name="cancel_return" value=" ">--%>
                                    <input type="submit" name="submit" value="添加到购物车" class="button" onclick="cart()">


                                </fieldset>
                        </form>
                        </c:if>
                    </div>
                </div>
            </div>
            <div class="clearfix"> </div>
        </div>
    </div>
</div>
<!-- new -->
<div class="newproducts-w3agile">
    <div class="container">
        <h3>促销商品</h3>
        <div class="agile_top_brands_grids">
            <c:forEach var="st" items="${requestScope.prostorage}">
            <div class="col-md-3 top_brand_left-1">
                <div class="hover14 column">
                    <div class="agile_top_brand_left_grid">
                        <div class="agile_top_brand_left_grid_pos">
                            <img src="images/offer.png" alt=" " class="img-responsive">
                        </div>
                        <div class="agile_top_brand_left_grid1">
                            <figure>
                                <div class="snipcart-item block">
                                    <div class="snipcart-thumb">
                                        <a href="products.jsp"><img title="${st.productcontent}" alt=" " src="${st.productimg}" width="250px" height="150px"></a>
                                        <p>${st.productname}</p>
                                        <div class="stars">
                                            <i class="fa fa-star blue-star" aria-hidden="true"></i>
                                            <i class="fa fa-star blue-star" aria-hidden="true"></i>
                                            <i class="fa fa-star blue-star" aria-hidden="true"></i>
                                            <i class="fa fa-star blue-star" aria-hidden="true"></i>
                                            <i class="fa fa-star gray-star" aria-hidden="true"></i>
                                        </div>
                                        <h4><font color="red">￥${st.productsale}/${st.productunit}</font><span>￥${st.productprice}/${st.productunit}</span></h4>
                                    </div>
                                    <div class="snipcart-details top_brand_home_details">
                                        <form action="#" method="post">
                                            <fieldset>
                                                <%--<input type="hidden" name="cmd" value="_cart">--%>
                                                <%--<input type="hidden" name="add" value="1">--%>
                                                <%--<input type="hidden" name="business" value=" ">--%>
                                                <%--<input type="hidden" name="item_name" value="Fortune Sunflower Oil">--%>
                                                <%--<input type="hidden" name="amount" value="35.99">--%>
                                                <%--<input type="hidden" name="discount_amount" value="1.00">--%>
                                                <%--<input type="hidden" name="currency_code" value="USD">--%>
                                                <%--<input type="hidden" name="return" value=" ">--%>
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
                                        <%--<p>Navaratan-dal</p>--%>
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
            <div class="clearfix"> </div>
        </div>
    </div>
</div>
<!-- //new -->
<!-- //footer -->
<%@ include file="appcomm/foot.jsp" %>
    <!-- //footer -->
    <!-- Bootstrap Core JavaScript -->
<script>

    function cart() {
        alert("提交到购物车成功");
    }

    function cartTest() {
        alert("请先登录后操作");
    }

</script>
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
