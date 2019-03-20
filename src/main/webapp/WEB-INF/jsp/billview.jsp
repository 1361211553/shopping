<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/head.jsp"%>
<div class="right">
     <div class="location">
         <strong>你现在所在的位置是:</strong>
         <span>订单管理页面 >> 信息查看</span>
     </div>
     <div class="providerView">
         <p><strong>订单编号：</strong><span>${sOrderView.oid }</span></p>
         <p><strong>买家昵称：</strong><span>${username }</span></p>
         <p><strong>订单商品数量：</strong><span>${sOrderView.pcount }件</span></p>
         <p><strong>订单商品总价：</strong><span>￥${sOrderView.ptotalprice }</span></p>
         <p><strong>订单创建时间：</strong><span>
             <fmt:formatDate value="${sOrderView.orderdate }" pattern="yyyy-MM-dd hh:mm:ss"/></span></p>
         <p><strong>收货人姓名：</strong><span>${sOrderView.recipients }</span></p>
         <p><strong>收货人电话：</strong><span>${sOrderView.reciphone }</span></p>
         <p><strong>收货人地址：</strong><span>${sOrderView.address }</span></p>
		 <div class="providerAddBtn">
         	 <input type="button" id="back" name="back" value="返回" >
         </div>
     </div>
 </div>
</section>
<%@include file="/WEB-INF/jsp/common/foot.jsp" %>
<script type="text/javascript" src="${pageContext.request.contextPath }/js2/billview.js"></script>