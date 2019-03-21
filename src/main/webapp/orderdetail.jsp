<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="appcomm/basePath.jsp" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>
<head>
    <title>订单详情</title>


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
    <script>

        $(document).ready(function () {

            $("#queren").click(function () {
                var oid = $(this).attr('oid');
                var obj = $(this);
                if (confirm("是否确认收货")){

                    $.ajax({

                        url:'/order/affirm',
                        type:'POST',
                        data:{'oid':oid},
                        success:function (data) {
                            if (data == 1){

                                alert("确认收货成功");
                                window.location.href="order/search";

                            }
                        }

                    })

                }

            })

            $("#pay").on("click",function () {
                var oid = $("#topay").attr("oid");
                if(confirm("是否已经完成付款？")){
                    window.location.href="order/pay/"+oid;
                    $("#showcode").css("display","none");
                }
            });

            $("#topay").on("click",function(){
                $("#showcode").css("display","block");
            });
        })

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
<div style="width: 100%;height: 100%;background:rgba(0,0,0,0.3);z-index: 2;position: absolute;display: none;" id="showcode">
    <div style="width: 200px;height: 200px;margin: 0 auto;">
        <img src="images/tdcode.gif">
        <h1><a href="javascript:;" id="pay" style="color:blue;font-size: 28px">点击付款并返回</a></h1>
    </div>
</div>

<!-- header -->
<%@ include file="appcomm/head.jsp" %>

<!-- //navigation -->
<!-- breadcrumbs -->
<div class="breadcrumbs">
    <div class="container">
        <ol class="breadcrumb breadcrumb1">
            <li><a href="index.jsp"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>主页</a></li>
            <li class="active">订单详情页面</li>
        </ol>
    </div>
</div>
<!-- //breadcrumbs -->
<!-- checkout -->
<div class="checkout">
    <form action="/order/add" method="post" id="form01">

    <div class="container">
        <h2 style="font-size: 25px;color: orange">收货信息：</h2>
        <div class="checkout-right" >
            <table width="100%" style="">
                <tr style="background-color: orange;color: white">
                    <th width="20%">订单id</th>
                    <th width="40%">收货地址</th>
                    <th width="10%">收货人姓名</th>
                    <th width="20%">收货人电话</th>
                    <th width="10%">订单状态</th>
                </tr>

                <tr style="height: 50px;color: darkgrey;font-weight: bold;">
                    <td>${order.oid}</td>
                    <td>${order.address}</td>
                    <td>${order.recipients}</td>
                    <td>${order.reciphone}</td>
                    <td>
                        <c:if test="${order.pstatus ==1}">待付款</c:if>
                        <c:if test="${order.pstatus ==2}">待发货</c:if>
                        <c:if test="${order.pstatus ==3}">待收货</c:if>
                        <c:if test="${order.pstatus ==4}">交易成功</c:if>
                    </td>
                </tr>
            </table>

        </div>
        <br><br>
        <h2 style="color: orange">您的订单包含了: <span class="chanpin">${num}</span> 种产品，共计<span class="chanpin">${sum}</span>件</h2>
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

                <c:forEach items="${sOrderdetails}" var="cl" varStatus="vs">

                    <tr class="rem1">
                        <c:forEach var="p" items="${listsp}">
                        <c:if test="${p.pid == cl.pid}">
                        <td class="invert-image">
                            <img src="${p.pimg}" alt=" " style=" width: 130px"/>
                        </td>
                        <td class="invert" >${p.pname}</td>
                        <td class="invert">￥<font color="red">${p.pprice}</font></td>
                        </c:if>
                        </c:forEach>
                        <td class="invert">
                                ${cl.ppurchasenum}件
                        </td>
                        <td>￥<font color="red">${cl.ptotalprice}</font></td>
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
                <h1 style="color: orange">总计<span style="color: blue">${order.ptotalprice}</span>元</h1>
            </div>

            <div class="checkout-right-basket">
                <a href="/order/search"><span class="glyphicon glyphicon-menu-left" aria-hidden="true"></span>返回订单页面</a>
                <c:if test="${order.pstatus == 1}">
                <a href="javascript:;" id="topay" oid="${order.oid}"><span class="glyphicon glyphicon-menu-left" aria-hidden="true" ></span>点击付款</a>
                </c:if>
                <c:if test="${order.pstatus == 3}">
                    <a href="javascript:;" id="queren" oid="${order.oid}"><span class="glyphicon glyphicon-menu-left" aria-hidden="true"></span>点击收货</a>
                </c:if>
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