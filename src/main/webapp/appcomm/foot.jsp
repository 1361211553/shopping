<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- //footer -->
<div class="footer" style="z-index: 3">
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
                    <li><i class="fa fa-arrow-right" aria-hidden="true">欢迎您</i><a href="person.jsp"><font color="white" size="4px">${user.username}</font></a></li>

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

