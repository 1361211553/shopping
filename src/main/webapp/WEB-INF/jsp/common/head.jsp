<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>	
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>在线电器商城管理系统</title>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css2/style.css" />
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css2/public.css" />
</head>
<body>
<!--头部-->
    <header class="publicHeader">
        <h1>在线电器商城管理系统</h1>
        <div class="publicHeaderR">
            <p><span>下午好！</span><span style="color: #fff21b"> ${userSession.userName }</span> , 欢迎你！</p>
            <a href="${pageContext.request.contextPath }/ui/exit.html">退出</a>
        </div>
    </header>
<!--时间-->
    <section class="publicTime">
        <span id="time">xxxx年1月1日 11:11  星期一</span>
        <a href="#">温馨提示：为了能正常浏览，请使用高版本浏览器！（IE10+）</a>
    </section>
 <!--主体内容-->
 <section class="publicMian ">
     <div class="left">
         <h2 class="leftH2"><span class="span1"></span>功能列表 <span></span></h2>
         <nav>
             <ul class="list">
              <li ><a href="${pageContext.request.contextPath}/sp/searchBack/1/0">订单管理</a></li>
              <li><a href="${pageContext.request.contextPath}/sp/searchBack/1/0">商品管理</a></li>
              <li><a href="${pageContext.request.contextPath }/backuser/search/1">用户管理</a></li>
              <li><a href="${pageContext.request.contextPath }/jsp/pwdmodify.jsp">密码修改</a></li>
              <li><a href="${pageContext.request.contextPath }/jsp/logout.do">退出系统</a></li>
              <li><a href="${pageContext.request.contextPath }/jsp/user.do?method=query">商品类别管理</a></li>
             </ul>
         </nav>
     </div>
     <input type="hidden" id="path" name="path" value="${pageContext.request.contextPath }"/>
     <input type="hidden" id="referer" name="referer" value="<%=request.getHeader("Referer")%>"/>