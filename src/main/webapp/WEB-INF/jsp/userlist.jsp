<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="/WEB-INF/jsp/common/head.jsp"%>
        <div class="right">
            <div class="location">
                <strong>你现在所在的位置是:</strong>
                <span>用户管理页面</span>
            </div>
            <div class="search">
           		<form method="post" action="${pageContext.request.contextPath }/backuser/search/1">
					<input name="method" value="query" class="input-text" type="hidden">
					 <span>用户真实姓名：</span>
					 <input style="width:100px" name="userrealname" class="input-text"	type="text" value="${sUser.userrealname }">

					 <span>用户电话：</span>
					 <input name="userphone" class="input-text"	type="text" value="${sUser.userphone }">
					 
					 <span>用户性别：</span>
					 <select name="usersex" id="usersex">
						 <option value="">--请选择--</option>
						 <option value="男" <c:if test="${sUser.usersex == '男'}">selected="selected"</c:if>>--男--</option>
						 <option value="女" <c:if test="${sUser.usersex == '女'}">selected="selected"</c:if>>--女--</option>
	        		</select>

					<span>用户账号状态：</span>
					<select name="slock" id="slock">
						<option value="">--请选择--</option>
						<option value="1" <c:if test="${sUser.slock == 1}">selected="selected"</c:if>>--冻结--</option>
						<option value="2" <c:if test="${sUser.slock == 2}">selected="selected"</c:if>>--正常--</option>
					</select>
					 

					 <input	value="查 询" type="submit" id="searchbutton">

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
						<span><img src="${user.userface}" style="width: 50px;height: 50px"/></span>
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
							<c:if test="${user.slock == 2}">
							<span><a href="#" style="color:green;font-weight:bold" onclick="changestate(${user.slock},${user.userid} )">正常</a></span>
							</c:if>
						</td>
						<td>
							<span><fmt:formatDate value='${user.userregdate}' pattern='yyyy-MM-dd'/></span>
						</td>
						<td>
						<span><a class="viewUser" href="${pageContext.request.contextPath}/backuser/showview/${user.userid}"><img src="${pageContext.request.contextPath }/images/read.png" alt="查看" title="查看"/></a></span>

						</td>
					</tr>
				</c:forEach>
				<tr class="firstTr">
					<th width="10%" style="color:blue">当前第${pageCurrent}页</th>
					<th width="20%" colspan="2" style="color:blue">共${pageAll}页</th>
					<th width="10%"><a href="/backuser/search/1/${sP.ptypeid}?userrealname=${sUser.userrealname}&userphone=${sUser.userphone}&usersex=${sUser.usersex}&slock=${sUser.slock}">首页</a></th>
					<c:if test="${pageCurrent-1 >= 1}">
						<th width="10%"><a href="/backuser/search/${pageCurrent-1}/${sP.ptypeid}?userrealname=${sUser.userrealname}&userphone=${sUser.userphone}&usersex=${sUser.usersex}&slock=${sUser.slock}">上一页</a></th>
					</c:if>
					<c:if test="${pageCurrent-1 < 1}">
						<th width="10%"><a href="/backuser/search/${pageCurrent}/${sP.ptypeid}?userrealname=${sUser.userrealname}&userphone=${sUser.userphone}&usersex=${sUser.usersex}&slock=${sUser.slock}">上一页</a></th>
					</c:if>
					<c:if test="${pageCurrent+1 <= pageAll }">
						<th width="10%"><a href="/backuser/search/${pageCurrent+1}/${sP.ptypeid}?userrealname=${sUser.userrealname}&userphone=${sUser.userphone}&usersex=${sUser.usersex}&slock=${sUser.slock}">下一页</a></th>
					</c:if>
					<c:if test="${pageCurrent+1 > pageAll }">
						<th width="10%"><a href="/backuser/search/${pageCurrent}/${sP.ptypeid}?userrealname=${sUser.userrealname}&userphone=${sUser.userphone}&usersex=${sUser.usersex}&slock=${sUser.slock}">下一页</a></th>
					</c:if>
					<th width="10%"><a href="/backuser/search/${pageAll}/${sP.ptypeid}?userrealname=${sUser.userrealname}&userphone=${sUser.userphone}&usersex=${sUser.usersex}&slock=${sUser.slock}">尾页</a></th>
					<th width="30%" colspan="2">跳到第<input type="text" id="num" style="width:40px">页<input type="button" id="toAddressNum" value="Go"> </th>
				</tr>
			</table>

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
        if(data == 2){
            changeDLGContent("你确定要冻结用户id为"+userid+"的用户吗？");

		}else{
            changeDLGContent("你确定要解冻用户id为"+userid+"的用户吗？");
		}

        $("#yes").on("click",function () {
            window.location.href=path+"/backuser/changestate/"+data+"/"+userid;
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
    $("#toAddressNum").on("click",function(){

        var num = $("#num").val().trim();
        var userrealname = $("input[name='userrealname']").val();
        var userphone = $("input[name='userphone']").val();
        var usersex = $("#usersex").val();
        var slock = $("#slock").val();
        var str = '^[0-9]*$';
        if(num.length>0){
            if(num.match(str)){
                window.location.href="/backuser/search/1?userrealname="+userrealname+"&userphone+"+userphone
				+"&usersex="+usersex+"&slock="+slock;
            }else{
                alert("请输入数字");
            }
        }else{
            alert("您输入的数字不能为空");
        }
    });

</script>

