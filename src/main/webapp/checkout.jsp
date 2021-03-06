<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="appcomm/basePath.jsp" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>
<head>
    <title>购物车</title>

  
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
    <%--<link href='http://fonts.googleapis.com/css?family=Raleway:400,100,100italic,200,200italic,300,400italic,500,500italic,600,600italic,700,700italic,800,800italic,900,900italic' rel='stylesheet' type='text/css'>--%>
    <%--<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'>--%>
    <%--&lt;%&ndash;<!-- start-smoth-scrolling -->&ndash;%&gt;--%>
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
        <ol class="breadcrumb breadcrumb1">
            <li><a href="index.jsp"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>主页</a></li>
            <li class="active">订单页面</li>
        </ol>
    </div>
</div>
<!-- //breadcrumbs -->
<!-- checkout -->
<div class="checkout">
    <div class="container">
        <h2>您的订单包含 <span class="chanpin">${fn:length(productList)}</span> 个产品</h2>
        <div class="checkout-right">
            <table class="timetable_sub">
                <thead>
                <tr>
                    <th>编号</th>
                    <th>产品图片</th>
                    <th>产品名称</th>
                    <th>产品数量</th>
                    <th>产品单价</th>
                    <th>删除</th>
                </tr>
                </thead>

                <c:forEach items="${requestScope.productList}" var="cl" varStatus="vs">


                    <tr class="rem1">
                        <td class="invert">${vs.count}</td>
                        <td class="invert-image"><a href="/sp/single/${cl.pid}"><img src="${cl.pimg}" alt=" "
                                                                           class="img-responsive"
                                                                          style=" width: 100px" /></a></td>
                        <td class="invert">${cl.pname}</td>

                        <td class="inver2t">
                            <div class="quantity">
                                <div class="quantity-select">
                                    <div class="entry value-minus">&nbsp;</div>
                                    <div class="entry value"><span class="span01">${listcar[vs.index].pnum}</span></div>
                                    <div class="entry value-plus active">&nbsp;</div>


                                </div>
                            </div>
                        </td>
                        <td class="invert">￥<font color="red">${cl.pprice}</font></td>
                        <td class="invert">
                            <div class="rem">
                                <a class="d" pid="${cl.pid}" pname="${cl.pname}" pnum="${listcar[vs.index].pnum}" price="${cl.pprice}">
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
                    $('.value-plus').on('click', function(){
                       /* var divUpd = $(this).parent().find('.value'), newVal = parseInt(divUpd.text(), 10)+1;
                        divUpd.text(newVal);*/
                        var dq = $(this).parent().find('.span01');
                        var obj = dq.html();
                        var countPrice = $(".font02").html();
                        var d = $(this).parents('tr').find('.d');
                        var price = d.attr("price");
                        var pid = d.attr('pid');
                        var pnum = parseInt(obj)+1;


                        $.ajax({

                            url:'/car/jia',
                            type:'POST',
                            data:{
                                'pid':pid,
                                'pnum':pnum
                            },
                            success:function (data) {
                                if (data == 1) {

                                    dq.html(parseInt(obj) + 1);
                                    $(".font02").html((parseFloat(countPrice) + parseFloat(price)).toFixed(2));
                                }
                            }

                        })

                    });

                    $('.value-minus').on('click', function(){
                       /* var divUpd = $(this).parent().find('.value'), newVal = parseInt(divUpd.text(), 10)-1;
                        if(newVal>=1) divUpd.text(newVal);*/
                        var dq = $(this).parent().find('.span01');
                        var obj =  dq.html();

                        if (obj != 1) {

                            var countPrice = $(".font02").html();
                            var d = $(this).parents('tr').find('.d');
                            var price = d.attr("price");
                            var pid = d.attr('pid');
                            var pnum = parseInt(obj)-1;

                            $.ajax({

                                url:'/car/jian',
                                type:'POST',
                                data:{
                                    'pid':pid,
                                    'pnum':pnum
                                },
                                success:function (data) {

                                    if (data == 1) {
                                        dq.html(parseInt(obj)-1);
                                        $(".font02").html((parseFloat(countPrice) - parseFloat(price)).toFixed(2));                                    }
                                }

                            })


                        }

                    });
                </script>
                <!--quantity-->
            </table>
        </div>
        <div class="checkout-left" >
            <div class="checkout-left-basket">
                <h4>账单</h4>
                <ul><li><font color="black" size="4px">商品总价 : </font><i>-</i> <span>￥<font color="red" size="4px" class="font02">${countPrice}</font></span></li></ul>
            </div>
            <div class="checkout-right-basket">
                <a href="index.jsp" ><span class="glyphicon glyphicon-menu-left" aria-hidden="true"></span>继续购物</a>
                <a href="/car/carempty"  onclick="return carempty()"><span class="glyphicon glyphicon-menu-left" aria-hidden="true"></span>清空购物车</a>
                <a href="/order/temp"><span class="glyphicon glyphicon-menu-left" aria-hidden="true"></span>去结算</a>
            </div>
            <div class="clearfix"> </div>
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
<script>



    $(document).ready(function () {


        $(".d").click(function () {
            var count =  $(".font01").html();
            var obj = $(this);
            var pid = $(this).attr("pid");
            var pname = $(this).attr("pname");
            var num = $(this).attr("pnum");
            var price = $(this).attr("price");
            var countPrice = $(".font02").html();
            var chanpin = $(".chanpin").html();

            if (confirm('确定删除【'+pname+'】吗？')){
                $.ajax({
                    url:'/car/cardel',
                    type:'POST',
                    dataType:"json",
                    data:{
                        'pid':pid,
                    },
                    success:function(result) {
                        if (result == 1){
                            alert('成功删除【'+pname+'】商品');
                            obj.parents('tr').remove();

                            $(".font02").html(parseFloat(countPrice-price*num).toFixed(2));
                            $(".font01").html(parseInt(count)-1);
                            $(".chanpin").html(parseInt(chanpin)-1);

                        } else {
                            alert("删除失败");
                        }
                    }

                })
            }

        })

    })

    function carempty(){

        if (confirm("确定清空购物车吗?")){
            return true;
        } else {
            return false;
        }

    }

</script>
    <!-- //main slider-banner -->

</body>
</html>