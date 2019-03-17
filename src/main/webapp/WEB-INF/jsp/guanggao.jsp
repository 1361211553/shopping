<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'guanggao.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body><br>&nbsp; 
   <h3>show gg</h3>
   
<marquee style="WIDTH: 1024px; HEIGHT: 400" scrollamount="5" direction="up" >

<center >
   <table border="0">

   <c:forEach var="gg" items="${requestScope.listgg }">
   
      <tr>
   <td><a href="${gg.ggurl}"><img width="400" height="200" src="${gg.ggimg}" alt="${gg.ggtitle }"/></a></td>
 </tr>
  
   
   </c:forEach>
    </table>
  </center> 
</marquee > 
   <br>

      <table border="1">
 	session<br/>
   <c:forEach var="gg" items="${sessionScope.listgg }"> </c:forEach>
   
      <tr>
   <td></td><td>${gg.ggtitle}</td><td><a href="${gg.ggurl}">${gg.ggtitle}</a></td><td><img src="${gg.ggimg}"/></td>
   
   
   </tr>
  
   
  
    </table>
   
  </body>
</html>
