<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/3/17
  Time: 11:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="address/css/main.css"/>
    <script src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="address/js/jquery.cityselect.js"></script>
    <script type="text/javascript">
        $(function () {
            $("#city_4").citySelect({
                prov: "湖南",
                city: "长沙",
                dist: "岳麓区",
                nodata: "none"
            });
        });
    </script>
</head>

<body>
<p>三级联动</p>
<div id="city_4">
    <select class="prov"></select>
    <select class="city" disabled="disabled"></select>
    <select class="dist" disabled="disabled"></select>
</div>
</body>
</html>
