 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>

    <title>缺陷管理系统—用户登录</title>
<meta charset="utf-8">
<meta name="keywords" content="DMS缺陷管理系统" />
<meta name="description" content="DMS缺陷管理系统" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- 移动设备 viewport -->
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no,minimal-ui">
<meta name="author" content="admui.com">
<!-- 360浏览器默认使用Webkit内核 -->
<meta name="renderer" content="webkit">
<!-- 禁止百度SiteAPP转码 -->
<meta http-equiv="Cache-Control" content="no-siteapp">
<!-- Chrome浏览器添加桌面快捷方式（安卓） -->
<link rel="icon" type="image/png" href="http://demo.admui.com/public/images/favicon.png">
<meta name="mobile-web-app-capable" content="yes">
<!-- Safari浏览器添加到主屏幕（IOS） -->
<link rel="icon" sizes="192x192" href="http://demo.admui.com/public/images/apple-touch-icon.png">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="apple-mobile-web-app-title" content="Admui">
<!-- Win8标题栏及ICON图标 -->
<link rel="apple-touch-icon-precomposed" href="http://demo.admui.com/public/images/apple-touch-icon.png">
<meta name="msapplication-TileImage" content="http://demo.admui.com/public/images/app-icon72x72@2x.png">
<meta name="msapplication-TileColor" content="#62a8ea">
<!-- 样式 -->
<link rel="stylesheet" href="http://demo.admui.com/public/themes/classic/base/css/site.css" id="siteStyle">
 <script type="text/javascript" src="${pageContext.request.contextPath }/js/sure_picture.js"></script>
  <!--  <script type="text/javascript" src="https://git.oschina.net/oceanao/js/raw/master/sure_picture.js"></script> -->
 
<!--[if lte IE 9]>
<meta http-equiv="refresh" content="0; url='http://www.admui.com/ie/'" />
<![endif]-->
<!--[if lt IE 10]>
<script src="/public/vendor/media-match/media.match.min.js"></script>
<script src="/public/vendor/respond/respond.min.js"></script>
<![endif]-->



    <!-- 自定义 -->
    <link rel="stylesheet" href="http://demo.admui.com/public/css/login.css">
    <!-- 插件 -->
    <link rel="stylesheet" href="http://demo.admui.com/public/vendor/animsition/animsition.css">
    <!-- 图标 -->
    <link rel="stylesheet" href="http://demo.admui.com/public/fonts/web-icons/web-icons.css">
    <link rel="stylesheet" href="http://demo.admui.com/public/fonts/font-awesome/font-awesome.css">
    <!-- 插件 -->
    <link rel="stylesheet" href="http://demo.admui.com/public/vendor/bootstrap-select/bootstrap-select.css">
    <link rel="stylesheet" href="http://demo.admui.com/public/vendor/formvalidation/formValidation.css">
    
    <!-- 百度统计 -->
    <script>
    var _hmt = _hmt || [];
	(function() {
	  var hm = document.createElement("script");
	  hm.src = "https://hm.baidu.com/hm.js?c9dd85291ea88dcf64671a7dfa65e0ef";
	  var s = document.getElementsByTagName("script")[0]; 
	  s.parentNode.insertBefore(hm, s);
	})();
	</script>
	
	<!-- 客服组件 -->
<!-- <script src="//assets-cdn.kf5.com/supportbox/main.js?2&_=1500719831612" id="kf5-provide-supportBox" kf5-domain="admui.kf5.com"></script> -->
</head>

 <style type="text/css">
.code {
	background: url(code_bg.jpg);
	font-family: Arial;
	font-style: italic;
	color: blue;
	font-size: 30px;
	border: 0;
}



a:hover {
	text-decoration: underline;
}
</style>


<body class="page-login layout-full page-dark" onload="createCode()">

<div class="page height-full">
    <div class="page-content height-full">
        <div class="page-brand-info vertical-align animation-slide-left hidden-xs">
            <div class="page-brand vertical-align-middle">
                
                <h2 class="hidden-sm">DMS缺陷管理系统</h2>
                <ul class="list-icons hidden-sm">
                    <li>
                        <i class="wb-check" aria-hidden="true"></i> DMS(Defect Management System) 是一个基于最新 Web
                        技术的企业级通用缺陷管理系统，可以帮助企业极大的提高测试效率，节省测试成本。
                    </li>
                    <li><i class="wb-check" aria-hidden="true"></i> 您可以 用DMS，对缺陷进行实时查看，分配</li>
                    <li><i class="wb-check" aria-hidden="true"></i> DMS 融合开发，测试，项目经理，提供更多的交互。
                    </li>
                </ul>
                <div class="hidden-sm">
                    <a href="${pageContext.request.contextPath }/" class="btn btn-primary margin-right-5" target="_self"><i class="icon wb-home"></i> 返回首页</a>
                  
                             <a href="${pageContext.request.contextPath }/admin/login" class="btn btn-success dropdown-toggle" target="_self"><i class="icon wb-download"></i>管理员</a>
                  
                   
                    <a href="javascript:;" class="btn btn-info open-kf"><i class="icon wb-user"></i> 联系开发者</a>
                </div>
            </div>
        </div>
        <div class="page-login-main animation-fade">
        	
            <div class="vertical-align">
                <div class="vertical-align-middle">
                    <div class="brand visible-xs text-center">
                        <img class="brand-img" src="${pageContext.request.contextPath }/img/logo.png" height="50" alt="D M S">
                    </div>
                    <h3 class="hidden-xs">登录 DMS</h3>
                    <p class="hidden-xs">DMS 缺陷管理系统</p>
                    <form action="${pageContext.request.contextPath }/user/login" target="_self" class="login-form" 
                    onsubmit="return validateCode()" method="post" id="loginForm">
                  
                        <div class="form-group">
                            <label class="sr-only" for="username">用户名</label>
                            <input type="text" class="form-control" id="username" name="student_num"  placeholder="请输入用户名" required="required">
                        </div>
                        <div class="form-group">
                            <label class="sr-only" for="password">密码</label>
                            <input type="password" class="form-control" id="password" name="password" placeholder="请输入密码" required="required">
                        </div>
                        <div class="form-group">
                            <label class="sr-only" for="password">验证码</label>
                            <div class="input-group">
                                <input type="text"   id="inputCode" onblur="validateCode()"   class="form-control"  placeholder="请输入验证码">
                                <a class="input-group-addon padding-0 reload-vify" href="javascript:;">
                                   <!--  <img src="/system/captcha" height="40"> -->
                                 <!--   <td><div class="code" id="checkCode" onclick="createCode()"></div> -->
                                 
                                 	<div class="form-group">
					<table border="0" cellspacing="5" cellpadding="5">
						<tr>
							<td><div class="code" id="checkCode" onclick="createCode()"></div></td>
						
						</tr>
						</table>
					</div>
		
				
                                </a>
                            </div>
                        </div>
                        
                    
		
		
		
		  <!-- 	<div class="form-group">
					<table border="0" cellspacing="5" cellpadding="5">
						<tr>
							<td><div class="code" id="checkCode" onclick="createCode()"></div></td>
							<td><a  onclick="createCode()">看不清换一张</a></td>
						</tr>
						</table>
					</div> -->
		
				<!-- <div class="form-group">
                    <input type="text" id="inputCode" onblur="validateCode()" class="form-control" placeholder="验证码">
                </div> -->
                
                <div class="form-group" id="sure">
                                                              请输入验证码
             </div>
                        
                        <div class="form-group clearfix">
                            <div class="checkbox-custom checkbox-inline checkbox-primary pull-left">
                                <input type="checkbox" id="remember" name="remember">
                                <label for="remember">自动登录</label>
                            </div>
                            <div class="pull-right">
                            	<a href="${pageContext.request.contextPath }/user/regist" target="_self">注册账号</a>
                            	·
	                            <a class="collapsed" data-toggle="collapse" href="${pageContext.request.contextPath }/user/user" aria-expanded="false" aria-controls="forgetPassword">
	                                找回密码
	                            </a>
                            </div>
                        </div>
                        <div class="collapse" id="forgetPassword" aria-expanded="true">
                            <div class="alert alert-warning alert-dismissible" role="alert">
                                请返回官网点击登录按钮找回密码
                            </div>
                        </div>
                        <button type="submit" class="btn btn-primary btn-block margin-top-30">立即登录</button>
                    </form>
                </div>
            </div>
            <footer class="page-copyright">
                <p>缺陷管理系统 &copy;
        			敖海洋
                </p>
            </footer>
        </div>
    </div>
</div>

<!-- JS -->
<!--<script src="http://demo.admui.com/public/vendor/jquery/jquery.js"></script>
<script src="http://demo.admui.com/public/vendor/bootstrap/bootstrap.js"></script>
<script src="http://demo.admui.com/public/vendor/bootstrap-select/bootstrap-select.min.js"></script>
<script src="http://demo.admui.com/public/vendor/formvalidation/formValidation.min.js" data-name="formValidation"></script>
<script src="http://demo.admui.com/public/vendor/formvalidation/framework/bootstrap.min.js" data-deps="formValidation"></script>
<script src="http://demo.admui.com/public/js/login.js"></script>-->
</body>

</html>
