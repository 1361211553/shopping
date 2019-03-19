<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>系统登录 - 在线电器商城管理系统</title>
    <link type="text/css" rel="stylesheet" href="/css2/style.css" />
    <script type="text/javascript">
	/* if(top.location!=self.location){
	      top.location=self.location;
	 } */
    </script>
</head>
<body class="login_bg">
    <section class="loginBox">
        <header class="loginHeader">
            <h1>国贸供应商管理系统</h1>
        </header>
        <section class="loginCont">
	        <form class="loginForm" action="/admin/login"  name="actionForm" id="actionForm"  method="post" >
				<div class="info">${error }</div>
				<div class="inputbox">
                    <label for="adminname">用户名：</label>
					<input type="text" class="input-text" id="adminname" name="adminname" placeholder="请输入用户名" required value="admin"/>
				</div>	
				<div class="inputbox">
                    <label for="adminpass">密码：</label>
                    <input type="password" id="adminpass" name="adminpass" placeholder="请输入密码" required value="123123"/>
                </div>	
				<div class="subBtn">
					
                    <input type="submit" value="登录"/>
                    <input type="reset" value="重置"/>
                    
                    <a href="showgg.html">广告</a>
                </div>	
			</form>
        </section>
    </section>
</body>
</html>
