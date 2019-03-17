<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:import url="${pageContext.request.contextPath}/sptype/search"/>
<!-- header -->
<div class="agileits_header">
    <div class="container">
        <div class="w3l_offers">
            <p>点击查看所有商品. <a href="sp/search/1/0">现在就去</a></p>
        </div>
        <div class="agile-login">

            <ul>

                <c:if test="${user eq null}">
                    <li><a href="registered.jsp"> 新建账号 </a></li>
                    <li><a href="login.jsp">登陆</a></li>

                </c:if>
                <h3>
                    <c:if test="${user ne null}">
                        <li><a><img src="${user.userface}" style="width: 50px; height: 40px;"></a></li>
                        <li><a>
                            <font color="white" size="4px">${user.username}</font></a></li>
                        <li><a href="person.jsp"> <font color="#00bfff" >个人中心</font></a></li>
                        <a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>

                        <li><a href="/user/loginout">
                            <font color="#00bfff">退出</font></a></li>

                    </c:if>
                </h3>
            </ul>

        </div>
        <div class="product_list_header">
            <form action="/car/carsearch" method="get" class="last">
                <%--<input type="hidden" name="cmd" value="_cart">--%>
                <%--<input type="hidden" name="display" value="1">--%>
                <button class="w3view-cart" type="submit" name="submit" value=""><i class="fa fa-cart-arrow-down"
                                                                                    aria-hidden="true"></i>
                </button><i><font color="red" size="2px" class="font01">${carNum}</font></i>
            </form>
        </div>
        <div class="clearfix"></div>
    </div>
</div>

<div class="logo_products">
    <div class="container">
        <div class="w3ls_logo_products_left1">
            <ul class="phone_email">
                <li><i class="fa fa-phone" aria-hidden="true"></i>商城电话请拨打 : 10086</li>

            </ul>
        </div>
        <div class="w3ls_logo_products_left">
            <h1><a href="index.jsp">网上电器商城</a></h1>
        </div>
        <div class="w3l_search">
            <form action="/sp/search/1/0" method="post">
                <input type="search" name="pname" placeholder="搜索产品..." required="" value="${sP.pname}">
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


                    <c:forEach var="sp" items="${sessionScope.listSPtype}">
                        <li class="dropdown">
                        <li class="active"><a href="/sp/search/1/${sp.ptypeid}"
                                              class="act">${sp.ptypename}</a></li>
                        </li>
                    </c:forEach>


                </ul>
            </div>
        </nav>
    </div>
</div>

<!-- //navigation -->