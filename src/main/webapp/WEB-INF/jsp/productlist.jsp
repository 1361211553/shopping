<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/head.jsp"%>
<c:import url="/sptype/search"/>
<%--<c:import url="/sp/searchBack/1/0"/>--%>
        <div class="right">
            <div class="location">
                <strong>你现在所在的位置是:</strong>
                <span>商品管理页面</span>
            </div>
            <div class="search">
           		<form method="post" action="/sp/searchBack/1/0">
					 <input name="method" value="query" class="input-text" type="hidden">
					 <span>商品名称：</span>
					 <input name="pname" class="input-text"	type="text" value="${sP.pname }">
					 
					 <span>商品类别：</span>
					 <select name="ptypeid" id="ptypeid">
						 <c:if test="${listSPtype != null }">
						     <option value="0">--请选择--</option>
						     <c:forEach var="sp" items="${listSPtype}">
						   		 <option <c:if test="${sP.ptypeid == sp.ptypeid }">selected="selected"</c:if>
						   		 value="${sp.ptypeid}">${sp.ptypename}</option>
						     </c:forEach>
						 </c:if>
	        		 </select>
					 
					 <input type="hidden" name="pageIndex" value="1"/>
					 <input	value="查 询" type="submit" id="searchbutton">
					 <a href="/sp/add" >添加商品</a>
				</form>
            </div>
            <!--用户-->
            <table class="providerTable" cellpadding="0" cellspacing="0">
                <tr class="firstTr">
                    <th width="20%">商品名称</th>
                    <th width="10%">商品价格</th>
					<th width="10%">商品数量</th>
                    <th width="10%">商品图片</th>
                    <th width="10%">进货时间</th>
                    <th width="10%">商品类别</th>

                    <th width="30%">操作</th>
                </tr>
                   <c:forEach var="sp" items="${listOP }" varStatus="status">
					<tr>
						<td>
						<span>${sp.pname }</span>
						</td>
						<td>
						<span>${sp.pprice }</span>
						</td>
						<td>
							<span>${sp.pnum}件</span>
						</td>
						<td>
						<span><img src="${sp.pimg}" style="width:40px;height: 40px"> </span>
						</td>

						<td>
						<span><fmt:formatDate value='${sp.pcdate}' pattern='yyyy-MM-dd'/></span>
						</td>
						<td>
							<span>
							    <c:forEach var="pt" items="${listSPtype }">
							       <c:if test="${sp.ptypeid == pt.ptypeid}">
							          ${pt.ptypename }
							       </c:if>
							    </c:forEach>
							</span>
						</td>

						<td>
						<span><a class="viewUser" href="${pageContext.request.contextPath }/sp/view/${sp.pid}"><img src="${pageContext.request.contextPath }/images/read.png" alt="查看" title="查看"/></a></span>
						<span><a class="modifyP" href="${pageContext.request.contextPath }/sp/toModify/${sp.pid}"><img src="${pageContext.request.contextPath }/images/xiugai.png" alt="修改" title="修改"/></a></span>
						<span><a class="deleteP" href="javascript:;" method="deleteAddress" pid="${sp.pid }" pname="${sp.pname }" ><img src="${pageContext.request.contextPath }/images/schu.png" alt="删除" title="删除"/></a></span>
						</td>
					</tr>
				</c:forEach>
				<tr class="firstTr">
                  <th width="10%" style="color:blue">当前第${pageCurrent}页</th>
	              <th width="20%" style="color:blue">共${pageAll}页</th>
	              <th width="10%"><a href="/sp/searchBack/1/${sP.ptypeid}">首页</a></th>
                  <c:if test="${pageCurrent-1 >= 1}">
	              <th width="10%"><a href="/sp/searchBack/${pageCurrent-1}/${sP.ptypeid}">上一页</a></th>
				  </c:if>
					<c:if test="${pageCurrent-1 < 1}">
						<th width="10%"><a href="/sp/searchBack/${pageCurrent}/${sP.ptypeid}">上一页</a></th>
					</c:if>
	              <c:if test="${pageCurrent+1 <= pageAll }">
	              <th width="10%"><a href="/sp/searchBack/${pageCurrent+1}/${sP.ptypeid}">下一页</a></th>
	              </c:if>
	              <c:if test="${pageCurrent+1 > pageAll }">
	              <th width="10%"><a href="/sp/searchBack/${pageCurrent}/${sP.ptypeid}">下一页</a></th>
	              </c:if>
	              <th width="10%"><a href="/sp/searchBack/${pageAll}/${sP.ptypeid}">尾页</a></th>
	              <th width="30%">跳到第<input type="text" id="num" style="width:40px">页<input type="button" id="toAddressNum" value="Go"> </th>
                </tr>
			</table>
			<%-- <input type="hidden" id="totalPageCount" value="${totalPageCount}"/>
		  	<c:import url="rollpage.jsp">
	          	<c:param name="totalCount" value="${totalCount}"/>
	          	<c:param name="currentPageNo" value="${currentPageNo}"/>
	          	<c:param name="totalPageCount" value="${totalPageCount}"/>
          	</c:import> --%>
        </div>
    </section>

<!--点击删除按钮后弹出的页面-->
<div class="zhezhao"></div>
<div class="remove" id="removeP">
    <div class="removerChid">
        <h2>提示</h2>
        <div class="removeMain">
            <p>你确定要删除该商品吗？</p>
            <a href="#" id="yes">确定</a>
            <a href="#" id="no">取消</a>
        </div>
    </div>
</div>

<%@include file="/WEB-INF/jsp/common/foot.jsp" %>
<script>
  var pid;
  var pObj;
  $(".deleteP").on("click",function(){
    pObj=$(this);
    pid=pObj.attr("pid");

    var pname=pObj.attr("pname");
    changeDLGContent("您是否要删除商品id为"+pid+",商品名为"+pname+"的记录吗？");
    $(".zhezhao").css("display","block");
    $("#removeP").fadeIn();
  });
  
  $("#no").on("click",function(){
    cancel();
  });
  
  $("#yes").on("click",function(){
    
    $.ajax({
      type:"POST",
      url:path+"/sp/delete",
	  data:{pid:pid},
	  dataType:"json",
	  success:function(data){
		if(data == 1){
		  pObj.parents("tr").remove();
		  alert("删除成功");
		}else{
		  alert("该记录已经不存在");
		}
		cancel();     
	  },
	  error:function(data){
	    cancel();
		alert("对不起，删除失败");
	  }
    });
  });
  
  function changeDLGContent(contentStr){
	var p = $(".removeMain").find("p");
	p.html(contentStr);
  }
  
  function cancel(){
    $(".zhezhao").css("display","none");
    $("#removeP").fadeOut();
  }
  
  $("#toAddressNum").on("click",function(){
    
    var num = $("#num").val().trim();
    var id = $("#ptypeid").val();
    var str = '^[0-9]*$';
    if(num.length>0){
      if(num.match(str)){
        window.location.href="/sp/searchBack/"+num+"/"+id;
      }else{
        alert("请输入数字");
      }
    }else{
      alert("您输入的数字不能为空");
    }
  });

</script>