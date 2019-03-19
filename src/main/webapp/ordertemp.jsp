<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="appcomm/basePath.jsp" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>
<head>
    <title>订单</title>


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
    <%--<link href='http://fonts.googleapis.com/css?family=Raleway:400,100,100italic,200,200italic,300,400italic,500,500italic,600,600italic,700,700italic,800,800italic,900,900italic' rel='stylesheet' type='text/css'>--%>
    <%--<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'>--%>
    <%--&lt;%&ndash;<!-- start-smoth-scrolling -->&ndash;%&gt;--%>
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
    <%--<link rel="stylesheet" type="text/css" href="address/css/main.css"/>--%>
    <script type="text/javascript" src="address/js/jquery.cityselect.js"></script>
    <script type="text/javascript">
        $(function () {
            $("#city_4").citySelect({
                prov: "湖南",
                city: "长沙",
                dist: "岳麓区",
                nodata: "none"
            });
        });
    </script>
</head>
<body>
<!-- header -->
<%@ include file="appcomm/head.jsp" %>

<!-- //navigation -->
<!-- breadcrumbs -->
<div class="breadcrumbs">
    <div class="container">
        <ol class="breadcrumb breadcrumb1">
            <li><a href="index.jsp"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>主页</a></li>
            <li class="active">结账页面</li>
        </ol>
    </div>
</div>
<!-- //breadcrumbs -->
<!-- checkout -->
<div class="checkout">
    <div class="container">
        <h2>收货地址：</h2>
        <div class="checkout-right">

            <table class="timetable_sub">
                <thead>
                <tr>
                    <th>收货人姓名</th>
                    <th>收货地址</th>
                    <th>联系人号码</th>
                    <th>地址邮编</th>
                </tr>
                </thead>

                <c:if test="${address != null}">
                    <tr class="rem1">
                        <td class="invert">${address.consignee}</td>
                        <td class="invert-image">${address.consignee}${address.city}${address.dist}${address.detailed}</td>
                        <td class="invert">${address.addressphone}</td>
                        <td class="inver2t">${address.zip}</td>
                    </tr>
                </c:if>

                <c:if test="${address == null}">
                <tr class="rem1">
                    <td class="invert"><input type="text" placeholder="请填写收货人姓名"></td>
                    <td class="invert-image">
                        <div id="city_4">
                            <select class="prov"></select>
                            <select class="city" disabled="disabled"></select>
                            <select class="dist" disabled="disabled"></select>
                            <input type="text" placeholder="请填写详细地址">
                        </div>

                    <td class="invert"><input type="text" placeholder="请填写联系人号码"></td>
                    <td class="inver2t">
                        <input type="text" placeholder="请填写地址邮编">
                    </td>

                </tr>
                </c:if>

                <!--quantity-->
                <!--quantity-->
            </table>
            <div class="checkout-left">
                <div class="checkout-right-basket">
                    <a href="index.jsp"><span class="glyphicon glyphicon-menu-left" aria-hidden="true"></span>更改收货地址</a>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
        <br><br>
        <h2>您的订单包含了: <span class="chanpin">${fn:length(productList)}</span> 个产品</h2>
        <div class="checkout-right">
            <table class="timetable_sub">
                <thead>
                <tr>
                    <th>产品图片</th>
                    <th>产品名称</th>
                    <th>产品单价</th>
                    <th>购买数量</th>
                    <th>产品总金额</th>

                </tr>
                </thead>

                <c:forEach items="${requestScope.productList}" var="cl" varStatus="vs">


                    <tr class="rem1">
                        <td class="invert">${vs.count}</td>
                        <td class="invert-image"><a href="single.jsp"><img src="${cl.pimg}" alt=" "
                                                                           class="img-responsive"
                                                                           style=" width: 100px"/></a></td>
                        <td class="invert">${cl.pname}</td>
                        <td class="inver2t">
                            <div class="quantity">
                                <div class="quantity-select">
                                    <div class="entry value-minus">&nbsp;</div>
                                    <div class="entry value"><span>${listcar[vs.index].pnum}</span></div>
                                    <div class="entry value-plus active">&nbsp;</div>
                                </div>
                            </div>
                        </td>
                        <td class="invert">￥<font color="red">${cl.pprice}</font></td>
                        <td class="invert">
                            <div class="rem">
                                <a class="d" pid="${cl.pid}" pname="${cl.pname}" pnum="${listcar[vs.index].pnum}"
                                   price="${cl.pprice}">
                                    <div class="close1"></div>
                                </a>
                            </div>
                                <%--<script>$(document).ready(function (c) {--%>
                                <%--$('.close1').on('click', function (c) {--%>
                                <%--$('.rem1').fadeOut('slow', function (c) {--%>
                                <%--$('.rem1').remove();--%>
                                <%--});--%>
                                <%--});--%>
                                <%--});--%>
                                <%--</script>--%>
                        </td>
                    </tr>

                </c:forEach>
                <!--quantity-->
                <script>
                    $('.value-plus').on('click', function () {
                        var divUpd = $(this).parent().find('.value'), newVal = parseInt(divUpd.text(), 10) + 1;
                        divUpd.text(newVal);
                    });

                    $('.value-minus').on('click', function () {
                        var divUpd = $(this).parent().find('.value'), newVal = parseInt(divUpd.text(), 10) - 1;
                        if (newVal >= 1) divUpd.text(newVal);
                    });
                </script>
                <!--quantity-->
            </table>
        </div>
        <div class="checkout-left">
            <div class="checkout-left-basket">
                <h4>账单</h4>
                <ul>
                    <li><font color="black" size="4px">订单价格 : </font><i>-</i> <span>￥<font color="red" size="4px"
                                                                                           class="font02">${countPrice}</font></span>
                    </li>
                </ul>
            </div>
            <div class="checkout-right-basket">
                <a href="index.jsp"><span class="glyphicon glyphicon-menu-left" aria-hidden="true"></span>返回购物车</a>
                <a href="index.jsp"><span class="glyphicon glyphicon-menu-left" aria-hidden="true"></span>提交订单</a>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
</div>
<!-- //checkout -->
<!-- //footer -->
<%@ include file="appcomm/foot.jsp" %>
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
<script>

    function carempty() {

        if (confirm("确定清空购物车吗?")) {
            return true;
        } else {
            return false;
        }

    }

    $(document).ready(function () {

        $(".d").click(function () {
            var obj = $(this);
            var pid = $(this).attr("pid");
            var pname = $(this).attr("pname");
            var num = $(this).attr("pnum");
            var price = $(this).attr("price");
            var countPrice = $(".font02").html();
            var chanpin = $(".chanpin").html();

            if (confirm('确定删除【' + pname + '】吗？')) {
                $.ajax({
                    url: '/car/cardel',
                    type: 'POST',
                    dataType: "json",
                    data: {
                        'pid': pid,
                    },
                    success: function (result) {
                        if (result == 1) {
                            alert('成功删除【' + pname + '】商品');
                            obj.parents('tr').remove();

                            $(".font02").html(parseFloat(countPrice - price * num).toFixed(2));
                            $(".font01").html(parseInt(num) - parseInt(1));
                            $(".chanpin").html(parseInt(chanpin) - 1);

                        } else {
                            alert("删除失败");
                        }
                    }

                })
            }

        })

    })

</script>
<!-- //main slider-banner -->

</body>
</html>