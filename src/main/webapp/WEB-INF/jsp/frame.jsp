<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/head.jsp"%>
    <div class="right">
        <img class="wColck" src="${pageContext.request.contextPath }/images/clock.jpg" alt=""/>
        <div class="wFont">
            <h2>${userSession.userName }</h2>
            <h1>欢迎来到国贸供应商管理系统!</h1>
        </div>
    </div>
</section>
<%@include file="/WEB-INF/jsp/common/foot.jsp" %>
