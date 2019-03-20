<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/head.jsp"%>

<div class="right">
        <div class="location">
            <strong>你现在所在的位置是:</strong>
            <span>商品类别管理页面</span>
        </div>
        <div class="search">
        	<form method="post" action="${pageContext.request.contextPath }">
				<%--<input name="method" value="query" type="hidden">--%>
				<%--<span>商品类别编码：</span>--%>
				<%--<input name="queryProCode" type="text" value="${queryProCode }">--%>
				<%----%>
				<%--<span>商品类别名称：</span>--%>
				<%--<input name="queryproname" type="text" value="${queryproname }">--%>
				<%----%>
				<%--<input value="查 询" type="submit" id="searchbutton">--%>
				<a href="${pageContext.request.contextPath }/sptype/toadd">添加商品类别</a>
			</form>
        </div>
        <!--供应商操作表格-->
        <table class="providerTable" cellpadding="0" cellspacing="0">
            <tr class="firstTr" style="font-size: 20px">
                <th width="30%">商品类别编码</th>
                <th width="30%">商品类别名称</th>
                <th width="20%">状态</th>

				<th width="20%">操作</th>
            </tr>
            <c:forEach var="sptype" items="${listSPtype}" varStatus="status">
				<tr style="font-size: 15px">
					<td>
					<span>XBSSXSPLB${sptype.ptypeid }</span>
					</td>
					<td>
					<span>${sptype.ptypename }</span>
					</td>
					<td>
					<c:if test="${sptype.ptypestate == 1}"	>
					<span><a href="#" style="font-weight: bold;color: green" onclick="changestate(${sptype.ptypestate},${sptype.ptypeid})"> 启用</a></span>
					</c:if>
					<c:if test="${sptype.ptypestate == 0}"	>
					<span><a href="#" style="font-weight: bold;color: red" onclick="changestate(${sptype.ptypestate},${sptype.ptypeid})"> 禁用</a></span>
					</c:if>
					</td>

					<td>

					<span><a class="modifyProvider" href="/sptype/toModify/${sptype.ptypeid }"><img src="${pageContext.request.contextPath }/images/xiugai.png" alt="修改" title="修改"/></a></span>

					</td>
				</tr>
			</c:forEach>
        </table>

    </div>
</section>

<!--点击删除按钮后弹出的页面-->
<div class="zhezhao"></div>
<div class="remove" id="removeUse">
   <div class="removerChid">
       <h2>提示</h2>
       <div class="removeMain" >
           <p></p>
           <a href="#" id="yes">确定</a>
           <a href="#" id="no">取消</a>
       </div>
   </div>
</div>

<%@include file="/WEB-INF/jsp/common/foot.jsp" %>
<script>
    function changestate(data,ptypeid) {

        $(".zhezhao").css("display","block");
        $("#removeUse").fadeIn();

        $("#no").on("click",function(){
            cancel();
        });
        if(data == 0){
            changeDLGContent("你确定要启用类别id为"+ptypeid+"的这个商品类别吗？");

        }else{
            changeDLGContent("你确定要禁用类别id为"+ptypeid+"的这个商品类别吗？");
        }

        $("#yes").on("click",function () {
            window.location.href=path+"/sptype/changestate/"+data+"/"+ptypeid;
        });
    }

    function cancel(){
        $(".zhezhao").css("display","none");
        $("#removeUse").fadeOut();
    }

    function changeDLGContent(contentStr){
        var p = $(".removeMain").find("p");
        p.html(contentStr);
    }
</script>
