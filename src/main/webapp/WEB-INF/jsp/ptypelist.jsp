<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/head.jsp"%>

<div class="right">
        <div class="location">
            <strong>你现在所在的位置是:</strong>
            <span>商品类别管理页面</span>
        </div>
        <div class="search">
        	<form method="post" action="${pageContext.request.contextPath }/jsp/provider.do">
				<%--<input name="method" value="query" type="hidden">--%>
				<%--<span>商品类别编码：</span>--%>
				<%--<input name="queryProCode" type="text" value="${queryProCode }">--%>
				<%----%>
				<%--<span>商品类别名称：</span>--%>
				<%--<input name="queryproname" type="text" value="${queryproname }">--%>
				<%----%>
				<%--<input value="查 询" type="submit" id="searchbutton">--%>
				<a href="${pageContext.request.contextPath }/jsp/provideradd.jsp">添加商品类别</a>
			</form>
        </div>
        <!--供应商操作表格-->
        <table class="providerTable" cellpadding="0" cellspacing="0">
            <tr class="firstTr">
                <th width="30%">商品类别编码</th>
                <th width="30%">商品类别名称</th>
                <th width="20%">状态</th>

				<th width="20%">操作</th>
            </tr>
            <c:forEach var="sptype" items="${listSPtype}" varStatus="status">
				<tr>
					<td>
					<span>${sptype.ptypeid }</span>
					</td>
					<td>
					<span>${sptype.ptypename }</span>
					</td>
					<td>
					<span>启用</span>
					</td>

					<td>

					<span><a class="modifyProvider" href="javascript:;" ptypeid=${sptype.ptypeid }><img src="${pageContext.request.contextPath }/images/xiugai.png" alt="修改" title="修改"/></a></span>

					</td>
				</tr>
			</c:forEach>
        </table>

    </div>
</section>

<!--点击删除按钮后弹出的页面-->
<div class="zhezhao"></div>
<div class="remove" id="removeProv">
   <div class="removerChid">
       <h2>提示</h2>
       <div class="removeMain" >
           <p>你确定要删除该供应商吗？</p>
           <a href="#" id="yes">确定</a>
           <a href="#" id="no">取消</a>
       </div>
   </div>
</div>

<%@include file="/WEB-INF/jsp/common/foot.jsp" %>
<script type="text/javascript" src="${pageContext.request.contextPath }/js2/providerlist.js"></script>
