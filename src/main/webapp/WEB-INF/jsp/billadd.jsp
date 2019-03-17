<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/head.jsp"%>

<div class="right">
     <div class="location">
         <strong>你现在所在的位置是:</strong>
         <span>订单管理页面 >> 订单添加页面</span>
     </div>
     <div class="providerAdd">
         <form id="billForm" name="billForm" method="post" action="${pageContext.request.contextPath }/bill/save.html">
             <!--div的class 为error是验证错误，ok是验证成功-->
             <input type="hidden" name="method" value="add">
             <div class="">
                 <label for="billCode">订单编码：</label>
                 <input type="text" name="billcode" class="text" id="billCode" value="BILL2016_XXX"> 
				 <!-- 放置提示信息 -->
				 <font color="red"></font>
             </div>
             <div>
                 <label for="productName">商品名称：</label>
                 <input type="text" name="productname" id="productName" value=""> 
				 <font color="red"></font>
             </div>
             <div>
                 <label for="productUnit">商品单位：</label>
                 <input type="text" name="productunit" id="productUnit" value="个"> 
				 <font color="red"></font>
             </div>
                   <div>
                 <label for="productUnit">商品描述：</label>
                 <input type="text" name="productdesc" id="productUnit" value="热卖的产品"> 
				 <font color="red"></font>
             </div>
             <div>
                 <label for="productCount">商品数量：</label>
                 <input type="text" name="productcount" id="productCount" value="999"> 
				 <font color="red"></font>
             </div>
             <div>
                 <label for="productCount"> 创建者：</label>
                 <input type="text" name="createdby" id="productCount" value="1"> 
				 <font color="red"></font>
             </div>
              <div>
                 <label for="productCount">创建时间：</label>
                 <input type="text" name="creationdate" id="productCount" value="2019-12-12"> 
				 <font color="red"></font>
             </div>
             
             
             <div>
                 <label for="totalPrice">总金额：</label>
                 <input type="text" name="totalprice" id="totalPrice" value="99999"> 
				 <font color="red"></font>
             </div>
             <div>
                 <label >供应商：</label>
                 <select name="providerid" id="providerid">
                 <c:forEach items="${listPro}" var="p">
                 	<option value="${p.id}">${p.proname}--${p.procode}</option>
                 </c:forEach>
		         </select>
				 <font color="red"></font>
             </div>
             <div>
                 <label >是否付款：</label>
                 <input type="radio" name="ispayment" value="1" checked="checked">未付款
				 <input type="radio" name="ispayment" value="2" >已付款
             </div>
             <div class="providerAddBtn">
                  <input type="submit" name="add" id="add" value="保存">
				  <input type="button" id="back" name="back" value="返回" >
             </div>
         </form>
     </div>
 </div>
</section>
<%@include file="/WEB-INF/jsp/common/foot.jsp" %>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/billadd.js"></script>