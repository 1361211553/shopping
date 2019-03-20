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
    <%--<script type="text/javascript">--%>
        <%--$(function () {--%>
            <%--$("#city_4").citySelect({--%>
                <%--prov: "湖南",--%>
                <%--city: "长沙",--%>
                <%--dist: "岳麓区",--%>
                <%--nodata: "none"--%>
            <%--});--%>
        <%--});--%>
    <%--</script>--%>

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
    <form action="/order/add" method="post" id="form01">

    <div class="container">
        <h2>收货地址：</h2>
        <div class="checkout-right" >

            <div id="div01">

            <select style=" border-color: orange; font-size:20px;width:1120px;height: 50px" name="id" >
                <c:forEach items="${addresslist}" var="address">
                    <option value="${address.addressid}">收货人姓名：${address.consignee} 联系人号码：${address.addressphone} 收货地址：${address.consignee}${address.city}${address.dist}${address.detailed} 地址邮编：${address.zip}</option>
                </c:forEach>
            </select>

            </div>


            <div id="div02" >

            </div>
            <div class="checkout-left" >
                <div class="checkout-right-basket" >

                    <a class="a01" style="margin: 200px 150px 100px 100px" obj="0"  href="javascript:;"><span class="glyphicon glyphicon-menu-left" aria-hidden="true"></span><font id="span01">填写新的收货地址</font></a>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
        <br><br>
        <h2>您的订单包含了: <span class="chanpin">${fn:length(pmap)}</span> 个产品</h2>
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

                <c:forEach items="${sessionScope.pmap}" var="cl" varStatus="vs">

                    <tr class="rem1">
                        <td class="invert-image">
                            <img src="${cl.value.pimg}" alt=" " style=" width: 130px"/>
                        </td>
                        <td class="invert" >${cl.value.pname}</td>
                        <td class="invert">￥<font color="red">${cl.value.pprice}</font></td>
                        <td class="invert">
                                ${listcar[vs.index].pnum}件
                        </td>
                        <td>￥<font color="red">${cl.key}</font></td>
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
                <a href="/car/carsearch"><span class="glyphicon glyphicon-menu-left" aria-hidden="true"></span>返回购物车</a>
              <a href="javascript:;" id="a001"><span class="glyphicon glyphicon-menu-left" aria-hidden="true"></span>提交订单</a>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
    </form>
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

    $(document).ready(function () {

        $("#a001").click(function () {

            $("#form01").submit();

        })
         $(".a01").click(function () {
             var obj = $(this).attr('obj');
             if (obj == 0){
                 $("#div01").html('');
                 $("#div02").html('  <table class="timetable_sub">\n' +
                     '                <thead>\n' +
                     '                <tr>\n' +
                     '                    <th>收货人姓名</th>\n' +
                     '                    <th>收货地址</th>\n' +
                     '                    <th>联系人号码</th>\n' +
                     '                    <th>地址邮编</th>\n' +
                     '                </tr>\n' +
                     '                </thead>\n' +
                     '\n' +
                     '                <tr class="rem1">\n' +
                     '                    <td class="invert"><input type="text" name="consignee" placeholder="请填写收货人姓名"></td>\n' +
                     '                    <td class="invert-image">\n' +
                     '                        <div id="city_4">\n' +
                     '                            <select class="prov" name="province"></select>\n' +
                     '                            <select class="city" disabled="disabled" name="city"></select>\n' +
                     '                            <select class="dist" disabled="disabled" name="dist"></select>\n' +
                     '                            <input name="detailed" type="text" placeholder="请填写详细地址">\n' +
                     '                        </div>\n' +
                     '\n' +
                     '                    <td class="invert"><input name="addressphone" type="text" placeholder="请填写联系人号码"></td>\n' +
                     '                    <td class="inver2t">\n' +
                     '                        <input type="text" name="zip" placeholder="请填写地址邮编">\n' +
                     '                    </td>\n' +
                     '\n' +
                     '                </tr>\n' +
                     '\n' +
                     '                <!--quantity-->\n' +
                     '                <!--quantity-->\n' +
                     '            </table>');
                 $(this).attr('obj','1');
                 $("#span01").html('使用已有地址');

                         $("#city_4").citySelect({
                             prov: "湖南",
                             city: "长沙",
                             dist: "岳麓区",
                             nodata: "none"
                         });

             } else {
                 $(this).attr('obj','0');
                 $("#div02").html('');
                 $("#div01").html('<select style=" border-color: orange; font-size:20px;width:1120px;height: 50px"  name="addressid">\n' +
                     '                <c:forEach items="${addresslist}" var="address">\n' +
                     '                    <option value="${address.addressid}">收货人姓名：${address.consignee} 联系人号码：${address.addressphone} 收货地址：${address.consignee}${address.city}${address.dist}${address.detailed} 地址邮编：${address.zip}</option>\n' +
                     '                </c:forEach>\n' +
                     '            </select>');
                 $("#span01").html('填写新的收货地址');
             }

            })

    })

</script>
<!-- //main slider-banner -->

</body>
</html>