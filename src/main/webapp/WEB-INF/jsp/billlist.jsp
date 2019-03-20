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
       <form method="post" action="${pageContext.request.contextPath }/backorder/search/1">
			
		   <span>订单编码：</span>
		   <input name="oid" type="text" value="${sOrder.oid }">

		   <span>收货人姓名：</span>
		   <input name="recipients" type="text" style="width: 80px; " value="${sOrder.recipients }">

		   <span>收货人电话号码：</span>
		   <input name="reciphone" type="text" style="width: 160px; " value="${sOrder.reciphone }">
			 
		   <span>订单状态：</span>
		   <select name="pstatus">
			   <option value="">--请选择--</option>
			   <option value="1" <c:if test="${sOrder.pstatus == 1}">selected="selected"</c:if>>未付款</option>
			   <option value="2" <c:if test="${sOrder.pstatus == 2}">selected="selected"</c:if>>付款未发货</option>
			   <option value="3" <c:if test="${sOrder.pstatus == 3}">selected="selected"</c:if>>发货未收货</option>
			   <option value="4" <c:if test="${sOrder.pstatus == 4}">selected="selected"</c:if>>交易成功</option>
		   </select>

		   <input	value="查 询" type="submit" id="searchbutton">

	   </form>
       </div>
       <!--账单表格 样式和供应商公用-->
       <table class="providerTable" cellpadding="0" cellspacing="0">
           <tr class="firstTr">
               <th width="20%">订单编码</th>
			   <th width="10%">收货人</th>
			   <th width="10%">收货人电话号码</th>
			   <th width="10%">订单商品数量</th>
               <th width="10%">订单金额</th>
               <th width="10%">订单状态</th>
               <th width="20%">创建时间</th>
               <th width="10%">操作</th>
           </tr>
           <c:forEach var="bill" items="${sOrders}" varStatus="status">
				<tr>
					<td>
					<span>${bill.oid }</span>
					</td>
					<td>
					<span>${bill.recipients }</span>
					</td>
					<td>
					<span>${bill.reciphone}</span>
					</td>
					<td>
					<span>${bill.pcount}件</span>
					</td>
					<td>
					<span>￥${bill.ptotalprice}</span>
					</td>
					<td>
					<span>
						<c:if test="${bill.pstatus == 1}">未付款</c:if>
						<c:if test="${bill.pstatus == 2}"><a href="#" style="font-size: 15px;text-align: center;color:red;" onclick="changestate(${bill.oid},${bill.oid})">付款未发货</a></c:if>
						<c:if test="${bill.pstatus == 3}">发货未收货</c:if>
						<c:if test="${bill.pstatus == 4}">交易成功</c:if>
					</span>
					</td>
					<td>
					<span>
					<fmt:formatDate value="${bill.orderdate}" pattern="yyyy-MM-dd hh:mm:ss"/>
					</span>
					</td>
					<td>
					<span><a class="viewBill" href="${pageContext.request.contextPath}/backorder/toView/${bill.oid}"><img src="${pageContext.request.contextPath }/images/read.png" alt="查看" title="查看"/></a></span>
					</td>
				</tr>

			</c:forEach>

		   <tr class="firstTr">
			   <th width="20%" style="color:blue">当前第${pageCurrent}页</th>
			   <th width="10%" style="color:blue">共${pageAll}页</th>
			   <th width="10%"><a href="/backorder/search/1?oid=${sOrder.oid}&recipients=${sOrder.recipients}&reciphone=${sOrder.reciphone}&pstatus=${sOrder.pstatus}">首页</a></th>
			   <c:if test="${pageCurrent-1 >= 1}">
				   <th width="10%"><a href="/backorder/search/${pageCurrent-1}?oid=${sOrder.oid}&recipients=${sOrder.recipients}&reciphone=${sOrder.reciphone}&pstatus=${sOrder.pstatus}">上一页</a></th>
			   </c:if>
			   <c:if test="${pageCurrent-1 < 1}">
				   <th width="10%"><a href="/backorder/search/${pageCurrent}?oid=${sOrder.oid}&recipients=${sOrder.recipients}&reciphone=${sOrder.reciphone}&pstatus=${sOrder.pstatus}">上一页</a></th>
			   </c:if>
			   <c:if test="${pageCurrent+1 <= pageAll }">
				   <th width="10%"><a href="/backorder/search/${pageCurrent+1}?oid=${sOrder.oid}&recipients=${sOrder.recipients}&reciphone=${sOrder.reciphone}&pstatus=${sOrder.pstatus}">下一页</a></th>
			   </c:if>
			   <c:if test="${pageCurrent+1 > pageAll }">
				   <th width="10%"><a href="/backorder/search/${pageCurrent}?oid=${sOrder.oid}&recipients=${sOrder.recipients}&reciphone=${sOrder.reciphone}&pstatus=${sOrder.pstatus}">下一页</a></th>
			   </c:if>
			   <th width="10%"><a href="/backorder/search/${pageAll}?oid=${sOrder.oid}&recipients=${sOrder.recipients}&reciphone=${sOrder.reciphone}&pstatus=${sOrder.pstatus}">尾页</a></th>
			   <th width="20%">跳到第<input type="text" id="num" style="width:40px">页 </th>
			   <th width="10%"><input type="button" id="toAddressNum" value="Go"></th>
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
            <p>你确定要发货吗？</p>
            <a href="#" id="yes">确定</a>
            <a href="#" id="no">取消</a>
        </div>
    </div>
</div>

<%@include file="/WEB-INF/jsp/common/foot.jsp" %>
<script type="text/javascript" src="${pageContext.request.contextPath }/backorder/toView"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
 function goOnclick(){
 
 	var txt = document.getElementById("type01");
 	
 	$("#button01").click(function(){
 	
 		alert(txt.innerHTML);
 	});
 
 }

 function changestate(data,oid){
     $(".zhezhao").css("display","block");
     $("#removeBi").fadeIn();

     changeDLGContent("你确定要将订单id为"+oid+"的订单发货吗？");

     $("#no").on("click",function(){
         cancel();
     });
     $("#yes").on("click",function () {
         window.location.href=path+"/backorder/changestate/"+data+"/"+oid;
     });

 }

 function cancel(){
     $(".zhezhao").css("display","none");
     $("#removeBi").fadeOut();
 }

 function changeDLGContent(contentStr){
     var p = $(".removeMain").find("p");
     p.html(contentStr);
 }
</script>