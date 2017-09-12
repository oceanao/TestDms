
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<title>DMS缺陷管理系统</title>
<meta name="keywords" content="DMS缺陷管理系统">
<meta name="description"
	content="DMS缺陷管理系统">

<link rel="shortcut icon" href="favicon.ico">
<link href="css/bootstrap.min.css-v=3.3.5.css"
	tppabs="http://www.zi-han.net/theme/hplus/css/bootstrap.min.css?v=3.3.5"
	rel="stylesheet">
<link href="css/font-awesome.min.css-v=4.4.0.css"
	tppabs="http://www.zi-han.net/theme/hplus/css/font-awesome.min.css?v=4.4.0"
	rel="stylesheet">

<link href="css/animate.min.css"
	tppabs="http://www.zi-han.net/theme/hplus/css/animate.min.css"
	rel="stylesheet">
<link href="css/style.min.css-v=4.0.0.css"
	tppabs="http://www.zi-han.net/theme/hplus/css/style.min.css?v=4.0.0"
	rel="stylesheet">
<base target="_blank">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>H+ 后台主题UI框架 - 联系人</title>
<meta name="keywords" content="H+后台主题,后台bootstrap框架,会员中心主题,后台HTML,响应式后台">
<meta name="description"
	content="H+是一个完全响应式，基于Bootstrap3最新版本开发的扁平化主题，她采用了主流的左右两栏式布局，使用了Html5+CSS3等现代技术">

<link rel="shortcut icon" href="favicon.ico">
<link
	href="${pageContext.request.contextPath }/css/bootstrap.min.css-v=3.3.5.css"
	tppabs="http://www.zi-han.net/theme/hplus/css/bootstrap.min.css?v=3.3.5"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath }/css/font-awesome.min.css-v=4.4.0.css"
	tppabs="http://www.zi-han.net/theme/hplus/css/font-awesome.min.css?v=4.4.0"
	rel="stylesheet">

<link href="${pageContext.request.contextPath }/css/animate.min.css"
	tppabs="http://www.zi-han.net/theme/hplus/css/animate.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath }/css/style.min.css-v=4.0.0.css"
	rel="stylesheet">
<base target="_blank">

</head>

<body class="gray-bg">
<a  href="javascript:history.go(-1)" align="right">返回上一页</a> 
	<div class="wrapper wrapper-content animated fadeInRight">
	
		<div class="row">

			<c:forEach items="${requestScope.users}" var="user" varStatus="stat">
				<tr class="gradeX" id="data_${stat.index}">


					<div class="col-sm-4">
						<div class="contact-box">
					
							<a target="_self"
								href="${pageContext.request.contextPath }/user?flag=1&user_id=${user.user_id}">
								<div class="col-sm-4">
									<div class="text-center">
										<img alt="image" class="img-circle m-t-xs img-responsive"
											src="/pic/${user.picture}" style="width: 180px;height:180px;"
											tppabs="http://www.zi-han.net/theme/hplus/img/a2.jpg">
										<div class="m-t-xs font-bold">${user.team.team_name}</div>
									</div>
								</div>
								<div class="col-sm-8">
									<h3>
										<strong>${user.username}</strong>
									</h3>
									<p>
										<i class="fa fa-map-marker"></i>${user.useraddress}</p>
									<address>
										<strong>
										<c:if test="${user.role==1}">开发人员</c:if>
										<c:if test="${user.role==2}">测试人员</c:if>
										<c:if test="${user.role==3}">项目组长</c:if>
										<c:if test="${user.role==4}">管理员</c:if>
										
										</strong><br> E-mail:${user.email}<br>
										Telephone:${user.telephone}<br>
									</address>
								</div>
								<div class="clearfix"></div>
							</a>
						</div>
					</div>

				</tr>
			</c:forEach>

		</div>
	</div>
	</div>
	<script
		src="${pageContext.request.contextPath }/js/jquery.min.js-v=2.1.4"
		tppabs="http://www.zi-han.net/theme/hplus/js/jquery.min.js?v=2.1.4"></script>
	<script
		src="${pageContext.request.contextPath }/js/bootstrap.min.js-v=3.3.5"
		tppabs="http://www.zi-han.net/theme/hplus/js/bootstrap.min.js?v=3.3.5"></script>
	<script
		src="${pageContext.request.contextPath }/js/content.min.js-v=1.0.0"
		tppabs="http://www.zi-han.net/theme/hplus/js/content.min.js?v=1.0.0"></script>
	<script>
        $(document).ready(function(){$(".contact-box").each(function(){animationHover(this,"pulse")})});
    </script>
	<script type="text/javascript"
		src="../../../tajs.qq.com/stats-sId=9051096"
		tppabs="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
</body>

</html>