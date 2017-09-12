<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html xmlns:th="http://www.thymeleaf.org">
<head>
<title>校园零距离市场</title>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
<meta name="format-detection" content="telephone=no" />
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-touch-fullscreen" content="yes" />
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="applicable-device" content="mobile">
<link href="${pageContext.request.contextPath }/static/css/common.css"
	type="text/css" rel="stylesheet" />
<link href="${pageContext.request.contextPath }/static/css/index.css"
	type="text/css" rel="stylesheet" />
<link href="css/index.css" rel="stylesheet" type="text/css">
</link>
<link href="${pageContext.request.contextPath }/static/css/index3.css"
	type="text/css" rel="stylesheet" />
<link href="css/index3.css" rel="stylesheet" type="text/css">
</link>
</head>
<body style="width: 100%; background-color: white;">

</style>

		<style>
.imgnews-item {
	position: relative;
}

.imgnews-item span {
	background-color: #000;
	opacity: 0.4;
	filter: alpha(opacity = 40);
	position: absolute;
	left: 0;
	bottom: 0;
	width: 100%;
	height: 26px;
	line-height: 26px;
	overflow: hidden;
	font-size: 14px;
	text-align: center;
}

.pos-abs {
	position: absolute;
}

.slider-main-img p {
	z-index: 1;
	left: 0px;
	line-height: 30px;
	font-weight: bold;
	top: 240px;
	height: 30px;
	width: 100%;
	font-size: 14px;
	text-indent: 9px;
	text-align: center;
}

.slider-main-img {
	float: left;
	position: relative;
	z-index: 1;
	height: 100%;
}

.slider-main-img a, .slider-main-img a:visited {
	color: #ececec;
}

.slider-main-img a:hover {
	color: #fff;
}
</style>
		<div class="nav">
			<div align="center">
				<nav>
					<table width="80%">
						<tbody>
							<td>
								<div align="center">
									<a title="商城首页" href="${pageContext.request.contextPath }/user/main"> <img
										alt="所有商品"
										src="${pageContext.request.contextPath }/static/image/index.jpg"
										style="width: 40px; height: 40px;" />
										<p style="font-size: 10px; color: red;">首页</p>
									</a>
								</div>
							</td>
							<td>
								<div title="发现全部分类" align="center">
									<a href="${pageContext.request.contextPath }/user/Project">
										<img alt="全部分类"
										src="${pageContext.request.contextPath }/static/image/1440437165699930301.png"
										style="width: 40px; height: 40px;" />
										<p style="font-size: 10px; color: red;">发现</p>
									</a>
								</div>
							</td>


							<td>
								<div align="center">
									<a title="发布自己的商品"
										href="${pageContext.request.contextPath }/user/addBug?flag=1">
										<img alt="所有商品"
										src="${pageContext.request.contextPath }/static/image/1440439318451279676.png"
										style="width: 40px; height: 40px;" />
										<p style="font-size: 10px; color: red;">发布</p>
									</a>
								</div>
							</td>

							<td>
								<div align="center">
									<a title="查看系统和私人消息" href="${pageContext.request.contextPath }/user/welcome">
										<img alt="所有商品"
										src="${pageContext.request.contextPath }/static/image/xiaoxi.jpg"
										style="width: 40px; height: 40px;" />
										<p style="font-size: 10px; color: red;">消息</p>
									</a>
								</div>
							</td>
							<td>
								<div  title="查看我的详细信息" align="center">
									<a href="${pageContext.request.contextPath }/user/personal">
										<img alt="个人中心"
										src="${pageContext.request.contextPath }/static/image/1440439367001464442.png"
										style="width: 40px; height: 40px;" />
										<p style="font-size: 10px; color: red;">我的</p>
									</a>
								</div>
							</td>
							<td></td>
						</tbody>
					</table>
				</nav>
			</div>
		</div>
</body>
</html>