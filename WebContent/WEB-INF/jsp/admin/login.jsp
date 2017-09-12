<%-- 
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户登录</title>
<link
	href="${pageContext.request.contextPath }/static/css/slide-unlock.css"
	type="text/css" rel="stylesheet" />
<title>我的</title>
<script
	src="http://git.oschina.net/oceanao/js/raw/master/jquery-1.12.1.min.js"></script>
<script
	src="https://git.oschina.net/oceanao/js/raw/master/jquery.slideunlock.js"></script>
</head>
<body 
style="background-image:url(${pageContext.request.contextPath }/static/images/main.jpg); background-size:cover">
	<h1 align="center">校园零距离市场</h1>
	<div align="center">
		<h1 align="center">管理员登录页面</h1>

		<div id="login">
			<form action="${pageContext.request.contextPath }/admin/login"
				onsubmit="return value()" method="post">
				<h2>登录</h2>
				<input type="text" id="ad_username" name="ad_username"
					placeholder="请输入账号"> <input type="password"
					id="ad_password" name="ad_password" placeholder="请输入密码">
				<div id="demo">
					<div id="slider">
						<div id="slider_bg"></div>
						<span id="label">>></span> <span id="labelTip">拖动滑块验证</span>
					</div>
					<script>
						var sure = 0;
						$(function() {
							var slider = new SliderUnlock("#slider", {
								successLabelTip : "验证成功"

							}, function() {
								sure = 1;
								alert("验证成功");

							});
							slider.init();
						})
						function value() {
							if (sure === 1)

								return ture;
							else
								return false;
						}
					</script>
				</div>
				<button class="input" type="submit">登录</button>
				<button class="input " type="reset">重置</button>
			</form>
		</div>
	</div>
		<script type="text/javascript">
		{
			if ("${sessionScope.msg}" != "")
				alert("${sessionScope.msg}");
		}
	</script>
</body>
</html>
 --%>
 
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>缺陷管理系统-后台登录</title>
    <meta name="keywords" content="缺陷管理系统">
    <meta name="description" content="缺陷管理系统">
    <link href="${pageContext.request.contextPath }/css/bootstrap.min.css"  rel="stylesheet">
    <link href="${pageContext.request.contextPath }/css/font-awesome.min.css-v=4.4.0.css"  rel="stylesheet">
    <link href="${pageContext.request.contextPath }/css/animate.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/css/style.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/css/login.min.css" rel="stylesheet">
    <link
	href="${pageContext.request.contextPath }/static/css/slide-unlock.css"
	type="text/css" rel="stylesheet" />
<title>我的</title>
<script
	src="http://git.oschina.net/oceanao/js/raw/master/jquery-1.12.1.min.js"></script>
<script
	src="https://git.oschina.net/oceanao/js/raw/master/jquery.slideunlock.js"></script>
    <!--[if lt IE 8]>
    <meta http-equiv="refresh" content="0;ie.html" />
    <![endif]-->
    <script>
        if(window.top!==window.self){window.top.location=window.location};
    </script>

</head>

<body class="signin">
    <div class="signinpanel">
        <div class="row">
            <div class="col-sm-7">
                <div class="signin-info">
                    <div class="logopanel m-b">
                        <h1>DMS</h1>
                    </div>
                    <div class="m-b"></div>
                    <h4>欢迎使用 <strong>DMS缺陷管理系统 </strong></h4>
                    <ul class="m-b">
                        <li><i class="fa fa-arrow-circle-o-right m-r-xs"></i> 优势一  实时查看缺陷</li>
                        <li><i class="fa fa-arrow-circle-o-right m-r-xs"></i> 优势二 实时查看缺陷</li>
                        <li><i class="fa fa-arrow-circle-o-right m-r-xs"></i> 优势三</li>
                        <li><i class="fa fa-arrow-circle-o-right m-r-xs"></i> 优势四</li>
                        <li><i class="fa fa-arrow-circle-o-right m-r-xs"></i> 优势五</li>
                    </ul>
                   <!--  <strong>还没有账号？ <a href="#">立即注册&raquo;</a></strong> -->
                </div>
            </div>
            <div class="col-sm-5">
                <form method="post"  action="${pageContext.request.contextPath }/admin/login"
				onsubmit="return value()" >
                    <h4 class="no-margins">管理员登录</h4>
                    <p class="m-t-md">登录到缺陷管理系统后台</p>
                    <input type="text" class="form-control uname"  name="ad_username" placeholder="用户名" />
                    <input type="password" class="form-control pword m-b"  name="ad_password" placeholder="密码" />
                   
                    <div id="demo" style="height: 40px;" >
					<div id="slider" style="width: 234px;"> 
						<div id="slider_bg"></div>
						<span id="label">>></span> 
						<span id="labelTip" >拖动滑块验证</span>
					</div>
					</div> 
                    <button class="btn btn-success btn-block">登录</button>
                </form>
            </div>
        </div>
        
					
					<script>
						var sure = 0;
						$(function() {
							var slider = new SliderUnlock("#slider", {
								successLabelTip : "验证成功"

							}, function() {
								sure = 1;
								alert("验证成功");

							});
							slider.init();
						})
						function value() {
							if (sure === 1)

								return ture;
							else
								return false;
						}
					</script>

	
	</script>
        <div class="signup-footer">
            <div class="pull-left">
                &copy; 2017 All Rights 敖海洋
            </div>
        </div>
    </div>
</body>
</html>