<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/3/17
  Time: 11:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%@include file="appcomm/head.jsp"%><script src="js/jquery-1.11.1.min.js"></script><script src="js/bootstrap.min.js"></script>
<script src="js/jquery-1.7.2.min.js"></script><script src="js/minicart.min.js"></script><script src="js/skdslider.min.js"></script>
<script src="js/jquery-1.11.1.min.js"></script><div id="rightArrow"><a href="javascript:;" title="在线客户"></a></div>
<div id="floatDivBoxs">
    <div class="floatDtt">在线客服</div>
    <div class="floatShadow">
        <ul class="floatDqq">
            <li style="padding-left:0px;">
                <a target="_blank" href="tencent://message/?uin=1234567890&Site=sc.chinaz.com&Menu=yes">
                    <img src="kefu/images/qq.png" align="absmiddle"> 联系我
                </a>
            </li>
        </ul>
        <div class="floatDtxt">热线电话</div>
        <div class="floatDtel"><img src="kefu/images/online_phone.jpg" width="155" height="45" alt=""></div>
        <div style="text-align:center;padding:10PX 0 5px 0;background:#EBEBEB;">
            <img src="kefus/images/wap_ico.jpg">
            <br>微信公众账号</div>
    </div>
    <div class="floatDbg"></div>
</div>
<style>
    #floatDivBoxs{width:170px;background:#fff;position:fixed;top:180px;right:0;z-index:999;}
    #floatDivBoxs .floatDtt{width:100%;height:45px;line-height:45px; background:#f08326;color:#fff;font-size:18px;text-indent:22px;position:relative;}
    #floatDivBoxs .floatDqq{padding:0 14px;}
    #floatDivBoxs .floatDqq li{height:45px;line-height:45px;font-size:15px;border-bottom:1px solid #e3e3e3; padding:0 0 0 50px;}
    #floatDivBoxs .floatDtxt{font-size:18px;color:#333;padding:12px 14px;}
    #floatDivBoxs .floatDtel{padding:0 0 15px 10px;}
    #floatDivBoxs .floatDtel img{display:block;}
    #floatDivBoxs .floatDbg{width:100%;height:20px;background:url(kefu/images/online_botbg.jpg) no-repeat;box-shadow:-2px 0 3px rgba(0,0,0,0.25);}
    .floatShadow{ background:#fff;box-shadow:-2px 0 3px rgba(0,0,0,0.25);}
    #rightArrow{width:50px;height:45px;background:url(kefu/images/online_arrow.jpg) no-repeat;position:fixed;top:180px;right:170px;z-index:999;}
    #rightArrow a{display:block;height:45px;}
</style>
<script>$(document).ready(function () {
    var flag=1;
    $('#rightArrow').click(function(){
        if(flag==1){
            $("#floatDivBoxs").animate({right: '-175px'},300);
            $(this).animate({right: '-5px'},300);
            $(this).css('background-position','-50px 0');
            flag=0;
        }else{
            $("#floatDivBoxs").animate({right: '0'},300);
            $(this).animate({right: '170px'},300);
            $(this).css('background-position','0px 0');
            flag=1;
        }
    });
})

</script>
</body>
</html>
