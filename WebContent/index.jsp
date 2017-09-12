 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
    <title>首页 - 缺陷管理系统</title>
    <meta charset="utf-8" />
<meta name="keywords" content="缺陷管理系统"/>
<meta name="description" content="缺陷管理系统" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />
<!--[if lte IE 9]>
<meta http-equiv="refresh" content="0; url='http://www.admui.com/ie'" />
<![endif]-->
<meta name="renderer" content="webkit" />
<meta name="visitor-form" content="hplus" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<meta name="mobile-web-app-capable" content="yes" />
<meta name="apple-mobile-web-app-capable" content="yes" />
<meta name="apple-mobile-web-app-status-bar-style" content="black" />
<meta name="apple-mobile-web-app-title" content="Admui" />
<meta name="msapplication-TileImage" content="http://cdn.admui.com/site/img/app/icon-72@x2.png" />
<meta name="msapplication-TileColor" content="#395b81" />
<link rel="apple-touch-icon-precomposed" href="http://cdn.admui.com/site/img/app/icon-72@x2.png" />
<link rel="shortcut icon" href="http://cdn.admui.com/site/img/app/favicon.png" />
<link rel="stylesheet" href="http://cdn.bootcss.com/semantic-ui/2.2.6/semantic.min.css" />
<link rel="stylesheet" href="http://cdn.admui.com/site/css/toastr.min.css" />
<link rel="stylesheet" href="http://cdn.admui.com/site/css/style.css" />
    <link rel="stylesheet" href="http://cdn.admui.com/site/css/index.css" />
    <link rel="stylesheet" href="http://cdn.admui.com/site/css/fullpage.css" />
</head>

<body class="homepage">
<!-- 导航 -->
<header id="navbar">
    <div class="ui container">
       
        <a href="#" class="menu"><i class="sidebar icon"></i></a> 
        
        <nav>
            <a href="${pageContext.request.contextPath }/" class="active">首页</a>
            <a href="${pageContext.request.contextPath }/user/login" target="_self">用户登录</a>
           <a href="${pageContext.request.contextPath }/admin/login" target="_self">管理员登录</a>
           <a href="${pageContext.request.contextPath }/user/regist" target="_self">用户注册</a>
        </nav>
    </div>
</header>

<main id="main">
    <header class="section" id="banner">
        <div class="ui container">
            <div class="text">
                <h1>缺陷管理系统</h1>
                <ul class="ui bulleted list">
                    <li class="item">BugManager 是一个基于最新 Web
                        技术的企业级通用缺陷管理系统，可以帮助企业极大的提高测试效率，节省测试成本。</li>
                    <li class="item">您可以 用BugManager，对缺陷进行实时查看，分配</li>
                    <li class="item">BugManager 紧贴业务特性，涵盖了大量的常用组件和基础功能。</li>
                </ul>
                <p>
                 <!--    <a class="ui green medium button" href="/demo"><i class="eye icon"></i>在线体验</a>
                    <a class="ui orange medium button" href="/buy"><i class="shop icon"></i>促销计划</a> -->
                </p>
            </div>
            <div class="imac">
                <img src="http://cdn.admui.com/site/img/screenshot.png" width="344" />
            </div>
        </div>
    </header>
    <section class="section" id="features">
        <div class="ui container">
            <h1>优秀，发自至心</h1>
            <p>BugManager  不同于您以往见过的任何产品，如果有一个词能形容她，那就是简洁，高效和极致</p>
            <div class="ui five column middle aligned grid">
                <!-- <div class="column">
                    <img src="http://cdn.admui.com/site/img/features/opensource.svg" data-title="开源" data-content="开放所有源码，无任何加密混淆，安全全程可控"/>
                    <h4>开源</h4>
                </div> -->
                <div class="column">
                    <img src="http://cdn.admui.com/site/img/features/features.svg" data-title="功能" data-content="包含登录、注册、用户、权限、系统、账户等后台系统常见功能" />
                    <h4>功能</h4>
                </div>
               <!--  <div class="column">
                    <img src="http://cdn.admui.com/site/img/features/document.svg" data-title="文档" data-content="提供在线的开发文档，同时提供工单支持" />
                    <h4>文档</h4>
                </div>
                <div class="column">
                    <img src="http://cdn.admui.com/site/img/features/extended.svg" data-title="组件" data-content="示例丰富，涵盖1000+ 基础组件，50+综合演示" />
                    <h4>组件</h4>
                </div>
                <div class="column">
                    <img src="http://cdn.admui.com/site/img/features/demo.svg" data-title="示例" data-content="包含120+常用插件和使用示例，并可自行扩展" />
                    <h4>示例</h4>
                </div> -->
                <div class="column">
                    <img src="http://cdn.admui.com/site/img/features/customize.svg" data-title="定制" data-content="提供Less源码，通过简单配置参数即可定制主题" />
                    <h4>定制</h4>
                </div>
                <!-- <div class="column">
                    <img src="http://cdn.admui.com/site/img/features/themes.svg" data-title="主题" data-content="2套主题，6种布局，5+菜单，12+皮肤，无限惊喜，无限可能" />
                    <h4>主题</h4>
                </div> -->
                <div class="column">
                    <img src="http://cdn.admui.com/site/img/features/interaction.svg" data-title="交互" data-content="多种创新的交互方式，即时操作，即时反馈" />
                    <h4>交互</h4>
                </div>
                <div class="column">
                    <img src="http://cdn.admui.com/site/img/features/friendly.svg" data-title="友好" data-content="支持IE9+，支持智能设备浏览，支持微信，支持读屏" />
                    <h4>友好</h4>
                </div>
                <div class="column">
                    <img src="http://cdn.admui.com/site/img/features/standard.svg" data-title="标准" data-content="遵循H5规范，遵循行业标准，统一视觉设计风格" />
                    <h4>标准</h4>
                </div>
            </div>
        </div>

    </section>
    <section class="section" id="parts">
        <div class="ui container">
            <h1>品质，源于执着</h1>
            <p>覆盖全端场景，紧贴业务需求，助力企业发展</p>
            <div class="ui six link doubling cards">
                <div class="card">
                    <div class="part">
                        <a class="ui right green corner label">
                            <i class="thumbs outline up icon"></i>
                        </a>
                        <div class="blurring">
                            <div class="ui inverted dimmer">
                                <div class="content">
                                    <div class="center">
                                        <a href="/demo" target="_blank" class="ui mini positive basic button">查看</a>
                                    </div>
                                </div>
                            </div>
                            <img src="http://cdn.admui.com/site/img/parts/ui.svg" />
                        </div>
                    </div>
                    <div class="extra">
                        UI 组件
                    </div>
                </div>
                <div class="card">
                    <div class="part">
                        <div class="blurring dimmable">
                            <div class="ui inverted dimmer">
                                <div class="content">
                                    <div class="center">
                                        <a href="/demo" target="_blank" class="ui mini positive basic button">查看</a>
                                    </div>
                                </div>
                            </div>
                            <img src="http://cdn.admui.com/site/img/parts/table.svg" />
                        </div>
                    </div>
                    <div class="extra">
                        表格
                    </div>
                </div>
                <div class="card">
                    <div class="part">
                        <div class="blurring">
                            <div class="ui inverted dimmer image">
                                <div class="content">
                                    <div class="center">
                                        <a href="/demo" target="_blank" class="ui mini positive basic button">查看</a>
                                    </div>
                                </div>
                            </div>
                            <img src="http://cdn.admui.com/site/img/parts/form.svg" />
                        </div>
                    </div>
                    <div class="extra">
                        表单
                    </div>
                </div>
                <div class="card">
                    <div class="part">
                        <div class="blurring">
                            <div class="ui inverted dimmer">
                                <div class="content">
                                    <div class="center">
                                        <a href="/demo" target="_blank" class="ui mini positive basic button">查看</a>
                                    </div>
                                </div>
                            </div>
                            <img src="http://cdn.admui.com/site/img/parts/chart.svg" />
                        </div>
                    </div>
                    <div class="extra">
                        图表
                    </div>
                </div>
                <div class="card">
                    <div class="part">
                        <div class="blurring">
                            <div class="ui inverted dimmer">
                                <div class="content">
                                    <div class="center">
                                        <a href="/demo" target="_blank" class="ui mini positive basic button">查看</a>
                                    </div>
                                </div>
                            </div>
                            <img src="http://cdn.admui.com/site/img/parts/system.svg" />
                        </div>
                    </div>
                    <div class="extra">
                        系统
                    </div>
                </div>
                <div class="card">
                    <div class="part">
                        <div class="blurring">
                            <img src="http://cdn.admui.com/site/img/parts/more.svg" />
                        </div>
                    </div>
                    <div class="extra">
                        敬请期待
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section class="section">
    	<div class="ui container" id="screenshots">
	        <div class="slide">
	         	<a ><!-- "WebContent/img/login.png" -->
	            	<img  src="${pageContext.request.contextPath }/img/login.png"   width="100%" />
	            </a>
	         </div>
	           <div class="slide">
	         	<a ><!-- "WebContent/img/login.png" -->
	            	<img  src="${pageContext.request.contextPath }/img/userlist.png"   width="100%" />
	            </a>
	         </div>
	          <div class="slide">
	         	<a ><!-- "WebContent/img/login.png" -->
	            	<img  src="${pageContext.request.contextPath }/img/admin.png"   width="100%" />
	            </a>
	         </div>
	          <div class="slide">
	         	<a ><!-- "WebContent/img/login.png" -->
	            	<img  src="${pageContext.request.contextPath }/img/userpicture.png"   width="100%" />
	            </a>
	         </div>
	           <div class="slide">
	         	<a >
	            	<img  src="${pageContext.request.contextPath }/img/buglist.png"   width="100%" />
	            </a>
	         </div>
	          <div class="slide">
	         	<a >
	            	<img  src="${pageContext.request.contextPath }/img/updateuser.png"   width="100%" />
	            </a>
	        
        </div>
    </section>
    <!-- 底部 -->
	<!-- 版权 --><footer class="section fp-auto-height" id="footer">
    <div class="link">
        <a >关于我们</a> ·
        <a >用户协议</a> ·
        <a >免责声明</a> ·
        
        <!--· <a href="http://weibo.com/admui" target="_blank"><i class="weibo icon"></i>微博</a> -->
    </div>
    <div class="copyright">
        <i class="copyright icon"></i> 2017 敖海洋
    </div>
</footer>


<!-- 公共js -->
<script src="https://cdn.staticfile.org/jquery/2.1.4/jquery.min.js"></script>
<script src="http://cdn.bootcss.com/semantic-ui/2.2.6/semantic.min.js"></script>
<script src="https://cdn.staticfile.org/toastr.js/latest/js/toastr.min.js"></script>
<!-- <script src="http://cdn.admui.com/site/js/main.js"></script> -->

<!-- 自定义js -->
<script>
	//严正声明！！！
	$(function(){
		$('.message .close').on('click', function() {
	    	$(this).closest('.message').transition('fade');
	    });
	});
</script>
</main>
<script src="https://cdn.staticfile.org/fullPage.js/2.7.6/jquery.fullPage.min.js"></script>
<script src="https://cdn.staticfile.org/move.js/0.5.0/move.min.js"></script>
<script src="https://cdn.staticfile.org/jQuery-slimScroll/1.3.8/jquery.slimscroll.min.js"></script>
<script src="http://cdn.admui.com/site/js/home.js"></script> 
</body>
</html>
