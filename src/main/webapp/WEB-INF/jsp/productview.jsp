<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/head.jsp"%>
    <div class="right">
        <div class="location">
            <strong>你现在所在的位置是:</strong>
            <span>商品管理页面 >> 商品信息查看页面</span>
        </div>
        <div class="providerView">
            <p><strong>商品类别：</strong><span>${sptypename }</span></p>
            <p><strong>商品名称：</strong><span>${showsp.pname }</span></p>
            <p><strong>商品价格：</strong><span>${showsp.pprice }元</span></p>
            <p><strong>商品数量：</strong><span>${showsp.pnum }件</span></p>
            <p><strong>商品点击数：</strong><span>${showsp.pclicks }次</span></p>
            <p><strong>进货时间：</strong><span>
            <fmt:formatDate value='${showsp.pcdate}' pattern='yyyy-MM-dd'/>
            </span></p>
            <p><strong>商品描述：</strong><span style="display: block;width: 400px;position: relative;left: 200px;bottom: 30px">${showsp.pdescription }</span></p>
            

			<div class="providerAddBtn">
            	<input type="button" id="back" name="back" value="返回" >
            </div>
        </div>
    </div>
</section>
<%@include file="/WEB-INF/jsp/common/foot.jsp" %>
<script type="text/javascript">
    $("#back").on("click",function(){
        history.back(-1);
    });
</script>
<%-- <script type="text/javascript" src="${pageContext.request.contextPath }/js/userview.js"></script> --%>