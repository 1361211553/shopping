<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/11/20
  Time: 16:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Registered</title>
    <link rel="stylesheet" href="css/admin_aa137ba.css">
    <link href="css/new_home_index__daf8123.css" rel="stylesheet">
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
    <script charset="utf-8" type="text/javascript" async=""
            src="js/cheshi.js"></script>
    <script charset="utf-8" type="text/javascript" async=""
            src="js/cheshi2.js"></script>
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
            </ul>
        </div>
        <div class="product_list_header">
            <form action="#" method="post" class="last">
                <input type="hidden" name="cmd" value="_cart">
                <input type="hidden" name="display" value="1">
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
            <form action="#" method="post">
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
                    <li class="dropdown">
                        <jsp:include page="pagehome?op=clicktype"/>

                        <c:forEach var="ptg" items="${sessionScope.listPTG}">
                    <li class="dropdown">
                    <li class="active"><a href="groceries.jsp?op=clicktype&producttypeid=${ptg.producttypeid}"
                                          class="act">${ptg.producttypename}</a></li>
                    </li>
                    </c:forEach>
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

                    <%--</li>--%>


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
            <li class="active">个人页面</li>
        </ol>
    </div>
</div>
<!-- //breadcrumbs -->
<!-- register -->
<div class="admin-wrap">

    <link rel="stylesheet" type="text/css" href="css/menu_d79cf19.css">
    <script>
        var currentMenu = 'home',
                indexUrl = "//i.huya.com/",
                indexFile = "index.php";
    </script>
    <script type="text/javascript" src="js/main_menu_29d4193.js"></script>
    <script type="text/javascript" src="js/cookies.js"></script>
    <div class="admin-menu">
        <div class="content">
            <div class="nav-scroll-wrap">
                <div class="scroll-content">
                    <div class="nav-section" style="padding-bottom:0">
                        <h3 class="header">&nbsp;个人中心</h3>
                        <ul class="icon-filter">
                            <li>
                                <a menu="home" href="geren.jsp" class="selected">
                                    <span class="icon icon-home"></span>
                                <span class="title">
                                    我的信息
                                </span>
                                </a>
                            </li>
                            <li>
                                <a menu="userlevel" href="dindan.jsp?op=selectorder&userid=${user.userid}">
                                    <span class="icon icon-userlevel"></span>
                                <span class="title">
                                    订单管理
                                </span>
                                </a>
                            </li>
                            <li>
                                <a menu="subscribe" href="add?op=searchAddress">

                                    <span class="icon icon-subscribe"></span>
                                <span class="title">
                                    我的地址
                                </span>
                                </a>
                            </li>
                            <li id="msg-li">
                                <a menu="msg" >
                                    <span class="icon icon-msg"></span>
                                <span class="title">
                                    暂未开放
                                </span>
                                </a>
                            </li>
                            <li>
                                <a menu="noble" >
                                    <span class="icon icon-noble"></span>
                                <span class="title">
                                    暂未开放
                                </span>
                                </a>
                            </li>
                            <li>
                                <a menu="myRoom" >
                                    <span class="icon icon-room"></span>
                                <span class="title">
                                    暂未开放
                                </span>
                                </a>
                            </li>
                            <li>
                                <a menu="money" >
                                    <span class="icon icon-money"></span>
                                <span class="title">
                                    暂未开放
                                </span>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>


            </div>

        </div>
    </div>
    <div class="main-col">
        <div class="scroll-content">
            <div class="mod mod-user-center">
                <img style="width:120px;height:120px;" class="user_icon"
                     src="${user.userface}" alt="头像">

                <img class="img_hover" src="//a.msstatic.com/huya/icenter/main/img/header_hover_6f5fb29.png" alt="上传图像">
                <form id="img_submit" enctype="multipart/form-data" method="post"
                      action="https://i.huya.com/index.php?m=Home&amp;do=ajaxUlogo">
                    <div id="fileImg" class="uploadify" style="height: 120px; width: 120px;">
                        <object id="SWFUpload_0" type="application/x-shockwave-flash"
                                data="base/uploadify/uploadify.swf?preventswfcaching=1543221865973" width="120"
                                height="120" class="swfupload" style="position: absolute; z-index: 1;">
                            <param name="wmode" value="transparent">
                            <param name="movie" value="base/uploadify/uploadify.swf?preventswfcaching=1543221865973">
                            <param name="quality" value="high">
                            <param name="menu" value="false">
                            <param name="allowScriptAccess" value="always">
                            <param name="flashvars"
                                   value="movieName=SWFUpload_0&amp;uploadURL=%2Findex.php%3Fm%3DCaptcha%26do%3DsaveImg&amp;useQueryString=false&amp;requeueOnError=false&amp;httpSuccess=&amp;assumeSuccessTimeout=30&amp;params=&amp;filePostName=avatar&amp;fileTypes=*.gif%3B%20*.jpg%3B%20*.png%3B*.jpeg&amp;fileTypesDescription=Image%20Files&amp;fileSizeLimit=1MB&amp;fileUploadLimit=0&amp;fileQueueLimit=999&amp;debugEnabled=false&amp;buttonImageURL=%2F&amp;buttonWidth=120&amp;buttonHeight=120&amp;buttonText=&amp;buttonTextTopPadding=0&amp;buttonTextLeftPadding=0&amp;buttonTextStyle=color%3A%20%23000000%3B%20font-size%3A%2016pt%3B&amp;buttonAction=-110&amp;buttonDisabled=false&amp;buttonCursor=-2">
                        </object>
                        <div id="fileImg-button" class="uploadify-button "
                             style="height: 120px; line-height: 120px; width: 120px;"><span
                                class="uploadify-button-text">上传图片</span></div>
                    </div>
                    <div id="fileImg-queue" class="uploadify-queue"></div>
                    <input type="hidden" name="uid" value="1170642926">
                    <input type="hidden" name="w" id="img_width" value="">
                    <input type="hidden" name="h" id="img_height" value="">
                    <input type="hidden" name="x1" id="x1" value="">
                    <input type="hidden" name="y1" id="y1" value="">
                    <input type="hidden" name="x2" id="x2" value="">
                    <input type="hidden" name="y2" id="y2" value="">
                </form>
                <div class="user_info">
                    <h2 style="font-size: 25px;" class="uesr_n">${user.username}</h2>
                    <span class="user_sex user_sex-female"></span>

                    <!-- <p class="yy_num"><span>YY:</span><span id="YY">1262956343</span></p> -->
                    <!-- 非第三方登陆，显示修改昵称、密码 -->
                    <div class="change">

                        <input id="other_name" type="text" maxlength="20">
                        <a href="javascript:void(0);" class="btn sure_change">确定</a>
                        <a href="javascript:void(0);" class="btn quit_change">取消</a>
                    </div>

                    <a href="javascript:void(0);" class="change_w"></a>
                    <p class="user_msg">
                            <span class="user_age">
                                ${user.userage}</span>


                            <span>
                                <a href="bianji3.jsp" class="edit-information clickstat" eid="click/grzx/myinfo/edit"
                                   eid_desc="点击/个人中心/我的信息/编辑">编辑资料</a>
                            </span>
                    </p>


                </div>
            </div>
        </div>
        <!-- 账号管理 -->
        <div class="mod mod-basic account-num" id="account_num">

            <!-- 手机未认证
            <a class="account_num_list block-a bindMobile hidden" id="no_phone" data-is-thirduser="0"
               href="javascript:void(0);" target="_blank">
                <div class="no_phone"></div>
                <div class="msg">
                    <p class="msg_1">绑定手机</p>
                    <p class="msg_2">绑定手机保障您的账号安全</p>
                </div>
                <em class="result"></em>
            </a> -->
            <!-- 手机已认证 -->
            <a class="account_num_list block-a has-bind-phone" id="phone" href="mingzi2.jsp" target="_blank">
                <div class="phone"></div>
                <div class="msg">
                    <p class="msg_1">修改绑定手机</p>
                    <p class="msg_2">已绑定：<span class="mobile num">134******</span></p>
                </div>
                <em class="result"></em>
            </a>


            <!-- 非第三方登陆，显示修改密码 -->
            <a class="account_num_list block-a" href="mingzi3.jsp" target="_blank" id="changeNum">
                <div class="password"></div>
                <div class="msg">
                    <p class="msg_1">修改密码</p>

                </div>
                <em class="result"></em>
            </a>

            <a class="account_num_list block-a" href="mingzi4.jsp" target="_blank">
                <div class="no_anchor"></div>
                <div class="msg">
                    <p class="msg_1">绑定邮箱</p>
                    <p class="msg_2">${user.useremail}</p>
                </div>
                <em class="result"></em>
            </a>

        </div>
    </div>

</div>
<!-- //register -->
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
                    <li><i class="fa fa-arrow-right" aria-hidden="true">欢迎您</i><a href="geren.jsp"><font color="white" size="4px">${user.username} </font ></a></li>

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
