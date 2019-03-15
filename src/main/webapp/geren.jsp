<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/11/20
  Time: 16:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="appcomm/basePath.jsp" %>
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
<%@ include file="appcomm/head.jsp" %>
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
                                <%--${user.userage}--%></span>


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
<!-- //main slider-banner -->

</body>
</html>
