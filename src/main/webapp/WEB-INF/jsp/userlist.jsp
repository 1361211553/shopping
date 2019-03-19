<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="/WEB-INF/jsp/common/head.jsp"%>
        <div class="right">
            <div class="location">
                <strong>你现在所在的位置是:</strong>
                <span>用户管理页面</span>
            </div>
            <div class="search">
           		<form method="post" action="${pageContext.request.contextPath }/jsp/user.do">
					<input name="method" value="query" class="input-text" type="hidden">
					 <span>用户名：</span>
					 <input name="queryname" class="input-text"	type="text" value="${queryUserName }">
					 
					 <span>用户角色：</span>
					 <select name="queryUserRole">
						<c:if test="${roleList != null }">
						   <option value="0">--请选择--</option>
						   <c:forEach var="role" items="${roleList}">
						   		<option <c:if test="${role.id == queryUserRole }">selected="selected"</c:if>
						   		value="${role.id}">${role.roleName}</option>
						   </c:forEach>
						</c:if>
	        		</select>
					 
					 <input type="hidden" name="pageIndex" value="1"/>
					 <input	value="查 询" type="submit" id="searchbutton">
					 <a href="${pageContext.request.contextPath}/jsp/useradd.jsp" >添加用户</a>
				</form>
            </div>
            <!--用户-->
            <table class="providerTable" cellpadding="0" cellspacing="0">
                <tr class="firstTr">
                    <th width="10%">用户头像</th>
					<th width="10%">用户账号</th>
                    <th width="10%">用户真实姓名</th>
                    <th width="10%">用户性别</th>
                    <th width="10%">用户电话</th>
                    <th width="10%">登录次数</th>
                    <th width="10%">账户状态</th>
					<th width="20%">注册时间</th>
                    <th width="10%">查看信息</th>
                </tr>
                   <c:forEach var="user" items="${listUsers }" varStatus="status">
					<tr style="font-size: 15px">
						<td>
						<span><img src="${user.userface}" style="width: 40px;height: 40px"/></span>
						</td>
						<td>
						<span>${user.username }</span>
						</td>
						<td>
							<span>
									${user.userrealname}
							</span>
						</td>
						<td>
							<span>
								${user.usersex}
							</span>
						</td>
						<td>
						<span>${user.userphone}</span>
						</td>
						<td>
						<span>${user.landingtimes}</span>
						</td>
						<td>
							<c:if test="${user.slock == 1}">
							<span><a href="#" style="color: red;font-weight:bold " onclick="changestate(${user.slock},${user.userid})">冻结</a> </span>
							</c:if>
							<c:if test="${user.slock == 0}">
							<span><a href="#" style="color:green;font-weight:bold" onclick="changestate(${user.slock},${user.userid} )">正常</a></span>
							</c:if>
						</td>
						<td>
							<span><fmt:formatDate value='${user.userregdate}' pattern='yyyy-MM-dd'/></span>
						</td>
						<td>
						<span><a class="viewUser" href="javascript:;"><img src="${pageContext.request.contextPath }/images/read.png" alt="查看" title="查看"/></a></span>

						</td>
					</tr>
				</c:forEach>
			</table>
			<input type="hidden" id="totalPageCount" value="${totalPageCount}"/>
		  	<c:import url="rollpage.jsp">
	          	<c:param name="totalCount" value="${totalCount}"/>
	          	<c:param name="currentPageNo" value="${currentPageNo}"/>
	          	<c:param name="totalPageCount" value="${totalPageCount}"/>
          	</c:import>
        </div>
    </section>

<!--点击删除按钮后弹出的页面-->
<div class="zhezhao"></div>
<div class="remove" id="removeUse">
    <div class="removerChid">
        <h2>提示</h2>
        <div class="removeMain">
			<p></p>

            <a href="#" id="yes">确定</a>
            <a href="#" id="no">取消</a>
        </div>
    </div>
</div>

<%@include file="/WEB-INF/jsp/common/foot.jsp" %>

<script>
	function changestate(data,userid) {

        $(".zhezhao").css("display","block");
        $("#removeUse").fadeIn();

        $("#no").on("click",function(){
            cancel();
        });
        if(data == 0){
            changeDLGContent("你确定要冻结用户id为"+userid+"的用户吗？");

		}else{
            changeDLGContent("你确定要解冻用户id为"+userid+"的用户吗？");
		}

        $("#yes").on("click",function () {
            window.location.href="/backuser/changestate/"+data+"/"+userid;
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

