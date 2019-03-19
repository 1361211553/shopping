<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/head.jsp"%>
 <div class="right">
        <div class="location">
            <strong>你现在所在的位置是:</strong>
            <span>用户管理页面 >> 用户信息查看页面</span>
        </div>
        <div class="providerView">
            <p><strong>用户编号：</strong><span>${showuser.userid }</span></p>
            <p><strong>用户昵称：</strong><span>${showuser.username }</span></p>
            <p><strong>用户真实姓名：</strong><span>${showuser.userrealname }</span></p>
            <p><strong>用户性别：</strong><span>${showuser.usersex}</span></p>
            <p><strong>出生日期：</strong><span>
                <fmt:formatDate value="${showuser.userbirthday }" pattern="yyyy-MM-dd"/></span></p>
            <p><strong>用户电话：</strong><span>${showuser.userphone}</span></p>

            <p><strong>用户注册时间：</strong><span>
                <fmt:formatDate value="${showuser.userregdate }" pattern="yyyy-MM-dd"/></span></p></span></p>
            <p><strong>用户邮箱：</strong><span>${showuser.useremail}</span></p>
            <p><strong>用户登陆次数：</strong><span>${showuser.landingtimes}</span></p>


			<div class="providerAddBtn">
            	<input type="button" id="back" name="back" value="返回" >
            </div>
        </div>
    </div>
</section>
<%@include file="/WEB-INF/jsp/common/foot.jsp" %>
<script type="text/javascript" src="${pageContext.request.contextPath }/js2/userview.js"></script>