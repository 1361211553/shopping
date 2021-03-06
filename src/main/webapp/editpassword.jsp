<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/11/27
  Time: 16:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="appcomm/basePath.jsp" %>
<html>
<head>
    <title>修改密码</title>
    <link rel="stylesheet" href="css/admin_aa137ba.css">
    <style type="text/css">
        .main-col {
            *padding-bottom: 140px;
        }

        .main-col, .anchor-col, .anchor-content {
            min-height: 1400px;
        }
    </style>
    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <link href="css/userinfo_set_801d6eb.css" rel="stylesheet">
    <link rel="stylesheet" href="css/user_nick_e4452bb.css">
    <link href="css/new_home_index__daf8123.css" rel="stylesheet">
    <script charset="utf-8" type="text/javascript" async="" src="js/underscore_3d00f9f.js"></script>
    <script charset="utf-8" type="text/javascript" async="" src="js/header_search_tip_1b84d58.js"></script>
    <style>
    .header-search-tips {
        position: relative;
        width: 250px;
        background-color: #fff;
        border: 1px solid #e0e0e0;
        font-size: 12px;
        box-shadow: 0 3px 8px 2px rgba(1, 1, 1, .1);
        border-radius: 5px
    }

    .header-search-tips li {
        line-height: 30px;
        height: 30px;
        color: #666;
        overflow: hidden;
        cursor: pointer;
        padding: 0 15px
    }

    .header-search-tips li:hover {
        color: #f90;
        background-color: #ececec
    }

    .header-search-tips .his-items em {
        width: 14px;
        height: 14px;
        text-align: center;
        line-height: 14px;
        display: inline-block;
        background: url(https://a.msstatic.com/huya/main/img/header/sprite/search_icon_b4d8025.png);
        margin-right: 8px;
        vertical-align: middle;
        *display: inline;
        *zoom: 1
    }

    .header-search-tips .his-items .del-item-link {
        float: right;
        padding: 0 5px;
        height: 30px;
        margin-right: -5px
    }

    .header-search-tips .his-items .del-item-link span {
        display: inline-block;
        *display: block;
        *margin-top: 12px;
        vertical-align: middle;
        width: 8px;
        height: 7px;
        background: url(https://a.msstatic.com/huya/main/img/header/sprite/search_clear_69b8269.png?__sprite);
        text-indent: -9999em
    }

    .header-search-tips .clear-his-btn {
        display: block;
        margin: 6px 15px 8px;
        font-size: 12px;
        line-height: 28px;
        border-radius: 14px;
        color: #555;
        background: #F1F2F4;
        text-align: center;
        text-decoration: none
    }

    .header-search-tips .clear-his-btn i {
        padding-left: 5px;
        font-family: \5b8b\4f53
    }

    .header-search-tips .clear-his-btn:hover {
        text-decoration: none;
        background: #ff9600;
        color: #fff
    }

    .header-search-tips .his-items-line {
        height: 0;
        border-bottom: 1px solid #e6e6e6;
        margin-bottom: 6px
    }

    .header-search-tips .search-items {
        padding-bottom: 7px
    }

    .header-search-tips .search-items em {
        width: 16px;
        height: 16px;
        text-align: center;
        line-height: 16px;
        font-size: 12px;
        display: inline-block;
        *display: inline;
        *zoom: 1;
        background: #d8d8d8;
        color: #666;
        border-radius: 8px;
        margin-right: 8px
    }

    .header-search-tips .search-items em.top-item {
        background: #ff6d00;
        color: #fff
    }

    .header-search-tips .search-item-hover {
        color: #666;
        background-color: #ececec
    }

    .header-search-tips .search-item-hover .suggest-text {
        width: 7em
    }

    .header-search-tips .search-item-hover .suggest-text.hot {
        width: 7em
    }

    .header-search-tips .search-item-hover .suggest-link {
        display: block
    }

    .header-search-tips .suggest-text {
        display: inline-block;
        vertical-align: top;
        width: 100%;
        height: 30px;
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap
    }

    .header-search-tips .suggest-text.hot {
        width: 12em
    }

    .header-search-tips .suggest-link {
        display: none;
        float: right;
        color: #f90
    }

    .header-search-tips .suggest-link:hover {
        cursor: pointer;
        color: #f90
    }</style>
    <style>.nav-expand-game dl {
        margin: 0 -5px 10px 0
    }

    .nav-expand-game dt {
        margin-bottom: 5px;
        color: #555;
        font-weight: 700;
        font-size: 14px
    }

    .nav-expand-game dd {
        float: left;
        margin: 0 5px 5px 0
    }

    .nav-expand-game dd a {
        display: block;
        width: 78px;
        height: 22px;
        border: 1px solid #e3e7e8;
        text-align: center;
        line-height: 22px;
        border-radius: 11px;
        text-decoration: none;
        color: #666;
        font-size: 12px;
        white-space: nowrap;
        word-wrap: normal;
        overflow: hidden;
        -ms-text-overflow: ellipsis;
        text-overflow: ellipsis
    }

    .nav-expand-game dd a:hover {
        color: #fff;
        background: #ff9600;
        border: 1px solid #ff9600
    }

    .nav-expand-game img {
        width: 250px;
        height: 60px;
        border-radius: 3px
    }</style>
    <style>@keyframes matchLiving {
               0% {
                   background-position: 0 0
               }
               100% {
                   background-position: -108px 0
               }
           }

    .hy-header-match-panel {
        word-wrap: normal;
        font-size: 12px
    }

    .hy-header-match-sec {
        margin-bottom: 10px
    }

    .hy-header-match-sec:last-child {
        margin-bottom: 0
    }

    .hy-header-match-sec-hd {
        padding: 0 0 5px 15px;
        color: #555;
        font-size: 14px;
        font-weight: 700
    }

    .hy-header-match-list {
        width: 100%
    }

    .hy-header-match-list ul {
        zoom: 1
    }

    .hy-header-match-list ul:before, .hy-header-match-list ul:after {
        display: table;
        content: ""
    }

    .hy-header-match-list ul:after {
        clear: both
    }

    .hy-header-match-list li {
        height: 30px
    }

    .hy-header-match-list li .match-item {
        display: block;
        padding-left: 15px;
        line-height: 30px;
        text-decoration: none;
        color: #666;
        font-size: 12px;
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis
    }

    .hy-header-match-list li .match-item:hover {
        background: #f1f1f1;
        text-decoration: none
    }

    .hy-header-match-list li .match-item:hover .match-name {
        color: #ff9600
    }

    .hy-header-match-list li .match-item .icon-living, .hy-header-match-list li .match-item .icon-replay {
        position: relative;
        top: 4px;
        margin-right: 5px;
        display: inline-block;
        width: 18px;
        height: 18px;
        border-radius: 50%
    }

    .hy-header-match-list li .match-item .icon-living {
        background-color: #f80;
        background-image: url(https://a.msstatic.com/huya/main/img/header/icon_live_917bc61.png);
        webkit-animation: matchLiving .6s steps(6) infinite;
        animation: matchLiving .6s steps(6) infinite
    }

    .hy-header-match-list li .match-item .icon-replay {
        background-image: url(https://a.msstatic.com/huya/main/img/header/icon_replay_02a1bcc.png)
    }

    .hy-header-match-list li .match-item .team-score {
        display: inline-block;
        margin: 0 2px;
        width: 14px;
        height: 17px;
        text-align: center;
        line-height: 17px;
        font-weight: 700;
        color: #616161;
        background: url(https://a.msstatic.com/huya/main/img/header/score_1ccdacc.png)
    }

    .hy-header-match-preview {
        padding-left: 15px
    }

    .hy-header-match-preview ul {
        border-left: 1px solid #CDCDCD;
        margin-left: 2px
    }

    .hy-header-match-preview li {
        position: relative;
        padding: 0 15px 0 4px;
        margin: 0 0 7px 6px;
        line-height: 30px
    }

    .hy-header-match-preview li:after {
        position: absolute;
        left: -11px;
        top: 11px;
        display: inline-block;
        content: "";
        width: 9px;
        height: 9px;
        background: url(https://a.msstatic.com/huya/main/img/dot_11a8167.png)
    }

    .hy-header-match-preview li:last-child {
        margin-bottom: 0
    }

    .hy-header-match-preview li div {
        zoom: 1
    }

    .hy-header-match-preview li div:before, .hy-header-match-preview li div:after {
        display: table;
        content: ""
    }

    .hy-header-match-preview li div:after {
        clear: both
    }

    .hy-header-match-preview li:hover {
        background-color: #f1f1f1
    }

    .hy-header-match-preview-time {
        float: left;
        color: #62B5F7;
        margin-right: 5px
    }

    .hy-header-match-preview-name {
        float: left;
        max-width: 9.5em;
        white-space: nowrap;
        text-overflow: ellipsis;
        overflow: hidden;
        color: #666
    }

    .hy-header-match-preview-btn {
        float: right;
        margin-top: 5px;
        width: 4em;
        line-height: 20px;
        border-radius: 10px;
        text-decoration: none;
        background: #62B5F7;
        color: #fff;
        text-align: center
    }

    .hy-header-match-preview-btn:hover {
        background: #7CC6FF;
        text-decoration: none;
        color: #fff
    }

    .hy-header-match-preview-btn.hy-header-match-preview-btn-gray {
        background: #BABDC1
    }

    .hy-header-match-empty {
        padding-left: 15px
    }</style>
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
        });a
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
<!-- //header -->
<!-- navigation -->

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
        var currentMenu = 'userinfo',
                indexUrl = "//i.huya.com/",
                indexFile = "index.php";
    </script>
    <script type="text/javascript" src="js/main_menu_29d4193.js"></script>
    <script type="text/javascript" src="js/cookies.js"></script>
    <%@ include file="appcomm/column.jsp" %>
    <div class="main-col">
        <div class="scroll-content">
            <div class="mod">
                <div class="mod-hd">
                    <a href="person.jsp" class="back-to">返回</a>
                    <h3 style="border-left:none;">修改密码</h3>
                </div>
                <!-- 已绑定手机s -->
                <div class="mod-hd has-bind-phone">
                    <!-- 顶部栏 -->

                    <div class="has-bind-title">
                        <p><span id="oldNick"></span></p>

                    </div>

                    <!-- 填写内容 -->
                    <form id="updatepassword"  method="post" action="/user/updatePass">
                        <div class="login-form-grids animated wow slideInUp" data-wow-delay=".5s">

                            <input type="hidden" name="userid" value="${user.userid}" >

                            <input type="hidden" name="olduserpass" required=" " value="${user.userpass}" >

                            <input type="password" name="userpass" placeholder="请输入旧密码" required=" " >

                            <input type="password" name="newuserpass" placeholder="请输入新密码" required=" " >

                            <input type="password" name="renewuserpass" placeholder="请再输入一次新密码" required=" " >
                            <br>
                            <input type="button" id="setpassword" style="width:255px;height:40px" value="确认修改">

                            <font color="red" size="4">${errorCode}</font>

                        </div>
                    </form>
                    <div class="nick-tips">
                        <p class="nick-tips-title">修改规则</p>

                        <p>2.密码长度建议在6-8个字为佳，最大长度不超过20个字符。</p>


                    </div>
                    <div class="nick-tips nick-tips-law">
                        <p class="nick-tips-title">温馨提示</p>
                        <p>根据《互联网用户账号名称管理规定》第六条规定，任何机构或个人注册和使用的互联网用户账号名称，不得有下列情形：</p>
                        <p>（一）违反宪法或法律法规规定的；</p>
                        <p>（二）危害国家安全，泄露国家机密，颠覆国家政权，破坏国家统一的；</p>
                        <a href="javascript:;" id="lookMoreLaw" class="look-more-law">查看更多</a>
                        <div id="moreLaw" class="more-law">
                            <p>（三）损害国家荣誉和利益的，损害公共利益的；</p>
                            <p>（四）煽动民族仇恨、民族歧视，破坏民族团结的；</p>
                            <p>（五）破坏国家宗教政策，宣扬邪教和封建迷信的；</p>
                            <p>（六）散布谣言，扰乱社会秩序，破坏社会稳定的；</p>
                            <p>（七）散步淫秽、色情、赌博、暴力、凶杀、恐怖或者教唆犯罪的；</p>
                            <p>（八）侮辱或者诽谤他人，侵害他人合法权益的；</p>
                            <p>（九）含有法律、行政法规禁止的其他内容的。</p>
                        </div>
                    </div>
                </div>
                <!-- 已绑定手机e -->
            </div>
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
                    <li><i class="glyphicon glyphicon-map-marker" aria-hidden="true"></i>上海市浦东新区<span>世贸大厦</span></li>
                    <li><i class="glyphicon glyphicon-envelope" aria-hidden="true"></i><a href="mailto:1008611@qq.com">1008611@qq.com</a>
                    </li>
                    <li><i class="glyphicon glyphicon-earphone" aria-hidden="true"></i>100861123</li>
                </ul>
            </div>
            <div class="col-md-3 w3_footer_grid">
                <h3>用户</h3>
                <ul class="info">

                    <c:if test="${user eq null}">
                        <li><i class="fa fa-arrow-right" aria-hidden="true"></i><a href="login.jsp">登陆</a></li>
                        <li><i class="fa fa-arrow-right" aria-hidden="true"></i><a href="registered.jsp">创建用户</a></li>
                    </c:if>
                    <c:if test="${user ne null}">
                        <li><i class="fa fa-arrow-right" aria-hidden="true">欢迎您</i><a href="person.jsp"><font color="white" size="4px">${user.username}</font></a></li>

                    </c:if>
                </ul>


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

<script>

    $("#setpassword").on("click",function () {
        var oldpass=$("input[name='olduserpass']").val();
        var pass=$("input[name='userpass']").val();
        var newpass =$("input[name='newuserpass']").val();
        var renewpass =$("input[name='renewuserpass']").val();


        if(oldpass == pass){
            if (newpass.length>=6 && newpass.length<20) {
                if (newpass == renewpass) {
                    alert("修改成功！");
                    $("#updatepassword").submit();
                }else{
                    alert("两次密码输入不一致");
                }
            }else{
                alert("输入的密码不符合规范");
            }

        }else{
            alert("原始密码错误");
        }
    });
</script>
<!-- //main slider-banner -->

</body>
</html>
