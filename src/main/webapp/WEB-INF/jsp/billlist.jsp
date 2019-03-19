<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>	
<%@include file="/WEB-INF/jsp/common/head.jsp"%>

<div class="right">
       <div class="location">
           <strong>你现在所在的位置是:</strong>
           <span>订单管理页面</span>
       </div>
       <div class="search">
       <form method="post" action="${pageContext.request.contextPath }/bill/query.html">
			
			<span>商品名称：</span>
			<input name="queryProductName" type="text" value="${queryProductName }">
			 
			<span>供应商：</span>
			<select name="queryProviderId">
				<c:if test="${providerList != null }">
				   <option value="0">--请选择--</option>
				   <c:forEach var="provider" items="${providerList}">
				   		<option <c:if test="${provider.id == queryProviderId }">selected="selected"</c:if>
				   		value="${provider.id}">${provider.proName}</option>
				   </c:forEach>
				</c:if>
       		</select>
			 
			<span>订单状态：</span>
			<select name="queryIsPayment">
				<option value="0">--请选择--</option>
				<option value="1" ${queryIsPayment == 1 ? "selected=\"selected\"":"" }>未付款</option>
				<option value="2" ${queryIsPayment == 2 ? "selected=\"selected\"":"" }>付款未发货</option>
				<option value="3" ${queryIsPayment == 3 ? "selected=\"selected\"":"" }>发货未收货</option>
				<option value="4" ${queryIsPayment == 4 ? "selected=\"selected\"":"" }>交易成功</option>
       		</select>
			
			 <input	value="查 询" type="submit" id="searchbutton">

		</form>
       </div>
       <!--账单表格 样式和供应商公用-->
      <table class="providerTable" cellpadding="0" cellspacing="0">
          <tr class="firstTr">
              <th width="10%">订单编码</th>
              <th width="20%">商品名称</th>
              <th width="10%">供应商</th>
              <th width="10%">订单金额</th>
              <th width="10%">是否付款</th>
              <th width="10%">创建时间</th>
              <th width="30%">操作</th>
          </tr>
          <c:forEach var="bill" items="${listBill}" varStatus="status">
				<tr>
					<td>
					<span>${bill.billcode }</span>
					</td>
					<td>
					<span>${bill.productname}</span>
					</td>
					<td>
					<span>${bill.providerid}</span>
					</td>
					<td>
					<span>${bill.totalprice}</span>
					</td>
					<td>
					<span>
						<c:if test="${bill.ispayment == 1}">未付款</c:if>
						<c:if test="${bill.ispayment == 2}">已付款</c:if>
					</span>
					</td>
					<td>
					<span>
					<fmt:formatDate value="${bill.creationdate}" pattern="yyyy-MM-dd"/>
					</span>
					</td>
					<td>
					<span><a class="viewBill" href="${pageContext.request.contextPath}/bill/${bill.id}/view.html" billid=${bill.id} billcc=${bill.billcode}><img src="${pageContext.request.contextPath }/images/read.png" alt="查看" title="查看"/></a></span>
					<span><a class="modifyBill" href="javascript:;" billid=${bill.id } billcc=${bill.billcode }><img src="${pageContext.request.contextPath}/images/xiugai.png" alt="修改" title="修改"/></a></span>
					<span><a class="deleteBill" href="javascript:;" billid=${bill.id } billcc=${bill.billcode }><img src="${pageContext.request.contextPath }/images/schu.png" alt="删除" title="删除"/></a></span>
					</td>
				</tr>
			</c:forEach>
			<tr>
			<td>第${currentPageNo}页</td>
			<td>共${pageMaxNum}页</td>
			<td><a href="${pageContext.request.contextPath }/bill/page/1.html">首页</a></td>
			<td><a href="${pageContext.request.contextPath }/bill/page/${currentPageNo-1}.html">上一页</a></td>
			<td><a href="${pageContext.request.contextPath }/bill/page/${currentPageNo+1}.html">下一页</a></td>
			<td><a href="${pageContext.request.contextPath }/bill/page/${pageMaxNum}.html">最后一页</a></td>
			<td>跳转到第：<input type="text" id="type01" style="width: 20px">页<button id="button01" onclick="goOnclick()">go</button></td>
			</tr>
      </table>
  </div>
</section>

<!--点击删除按钮后弹出的页面-->
<div class="zhezhao"></div>
<div class="remove" id="removeBi">
    <div class="removerChid">
        <h2>提示</h2>
        <div class="removeMain">
            <p>你确定要删除该订单吗？</p>
            <a href="#" id="yes">确定</a>
            <a href="#" id="no">取消</a>
        </div>
    </div>
</div>

<%@include file="/WEB-INF/jsp/common/foot.jsp" %>
<script type="text/javascript" src="${pageContext.request.contextPath }/js2/billlist.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
 function goOnclick(){
 
 	var txt = document.getElementById("type01");
 	
 	$("#button01").click(function(){
 	
 		alert(txt.innerHTML);
 	});
 
 }
</script>