<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/11/20
  Time: 16:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="appcomm/basePath.jsp" %>

<html>
<head>
    <title>Groceries</title>
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
    <link href='http://fonts.googleapis.com/css?family=Raleway:400,100,100italic,200,200italic,300,400italic,500,500italic,600,600italic,700,700italic,800,800italic,900,900italic' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'>
    <!-- start-smoth-scrolling -->
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
        <ol class="breadcrumb breadcrumb1 animated wow slideInLeft" data-wow-delay=".5s">
            <li><a href="index.jsp"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>主页</a></li>
            <li class="active">${producttypename}页面</li>
        </ol>
    </div>
</div>
<!-- //breadcrumbs -->
<!--- groceries --->
<div class="products">
    <div class="container">

        <%--<jsp:include page="pagehome?op=clicktype"/>--%>

        <div class="agile_top_brands_grids">
            <c:forEach var="op" items="${listOP}">
            <div class="col-md-4 top_brand_left">
                <div class="hover14 column">
                    <div class="agile_top_brand_left_grid">
                        <div class="agile_top_brand_left_grid_pos">
                            <img src="images/offer.png" alt=" " class="img-responsive">
                        </div>
                        <div class="agile_top_brand_left_grid1">
                            <figure>
                                <div class="snipcart-item block">
                                    <div class="snipcart-thumb">
                                        <a href="/sp/single/${op.pid}"><img title="${op.pdescription}" alt=" " src="${op.pimg}" width="250px" height="150px"></a>
                                        <p>
                                            <c:if test="${fn:length(op.pname) > 15}">${fn:substring(op.pname, 0, 15)}...</c:if>


                                            <c:if test="${fn:length(op.pname) <= 15}">${op.pname}</c:if>

                                        </p>
                                        <h4><font color="red">￥${op.pprice}</font></span> </h4>
                                        <br>
                                        <h4>已浏览<font color="red">${op.pclicks}</font>次</h4>
                                        <%--<span>$55.00</span>--%>
                                    </div>
                                    <div class="snipcart-details top_brand_home_details">
                                        <form action="#" method="post">
                                            <fieldset>
                                                <input type="hidden" name="productNum" style="width: 30px;" value="1">
                                        <%--<input type="hidden" name="cmd" value="_cart">--%>
                                        <%--<input type="hidden" name="add" value="1">--%>
                                        <%--<input type="hidden" name="business" value=" ">--%>
                                        <%--<input type="hidden" name="item_name" value="Fortune Sunflower Oil">--%>
                                        <%--<input type="hidden" name="amount" value="${pro.productprice}">--%>
                                        <%--<input type="hidden" name="discount_amount" value="1.00">--%>
                                        <%--<input type="hidden" name="currency_code" value="USD">--%>
                                        <%--<input type="hidden" name="return" value="加入购物车">--%>
                                        <%--<input type="hidden" name="cancel_return" value=" ">--%>
                                        <input type="submit" name="submit" value="添加到购物车" class="button">
                                    </fieldset>
                                        </form>
                                    </div>
                                </div>
                            </figure>
                        </div>
                    </div>
                </div>
            </div>
            </c:forEach>

            <div class="clearfix"> </div>
        </div>

            <nav class="numbering"><%--上下页按钮--%>
                <ul class="pagination paging">
                    <c:if test="${currentPage-1 == 0}">
                        <li>
                            <a href="sp/search/${currentPage}/${sP.ptypeid}?pname=${sP.pname}" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                    </c:if>
                    <c:if test="${currentPage-1 != 0}">
                        <li>
                            <a href="sp/search/${currentPage-1}/${sP.ptypeid}?pname=${sP.pname}" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                    </c:if>

                    <c:forEach var="n" begin="1" end="${pageAll}">
                        <li <c:if test="${n eq currentPage}">class="active"</c:if>><a href="sp/search/${n}/${sP.ptypeid}?pname=${sP.pname}">${n}<span class="sr-only">(current)</span></a></li>
                    </c:forEach>

                    <%--<li><a href="#">2</a></li>--%>
                    <%--<li><a href="#">3</a></li>--%>
                    <%--<li><a href="#">4</a></li>--%>
                    <%--<li><a href="#">5</a></li>--%>
                    <c:if test="${currentPage != pageAll}">
                        <li>
                            <a href="sp/search/${currentPage+1}/${sP.ptypeid}?pname=${sP.pname}" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </c:if>
                    <c:if test="${currentPage == pageAll}">
                        <li>
                            <a href="sp/search/${currentPage}/${sP.ptypeid}?pname=${sP.pname}" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </c:if>
                </ul>
            </nav>

    </div>
    <div class="clearfix"> </div>



</div>
</div>
<!--- groceries --->



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
<!-- //main slider-banner -->

</body>
</html>
