<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- //footer -->
<div class="footer">
    <div class="container">
        <div class="w3_footer_grids">
            <div class="col-md-3 w3_footer_grid">
                <h3>基本信息</h3>

                <ul class="address">
                    <li><i class="glyphicon glyphicon-map-marker" aria-hidden="true"></i>厦门市<span></span></li>
                    <li><i class="glyphicon glyphicon-envelope" aria-hidden="true"></i><a
                            href="mailto:info@example.com">1008611@qq.com</a></li>
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
                    <li><i class="fa fa-arrow-right" aria-hidden="true">欢迎您</i><a href="geren.jsp"><font color="white" size="4px">${user.username}</font></a></li>

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
        <div class="clearfix"></div>
    </div>
</div>
<!-- //footer -->

<div id="rightArrow"><a href="javascript:;" title="在线客户"></a></div>
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