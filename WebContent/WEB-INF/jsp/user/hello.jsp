<%-- 
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>

<title>缺陷管理系统—用户注册</title>
<script type="text/javascript">
    function getFileUrl(sourceId) { 
var url; 
if (navigator.userAgent.indexOf("MSIE")>=1) { // IE 
url = document.getElementById(sourceId).value; 
} else if(navigator.userAgent.indexOf("Firefox")>0) { // Firefox 
url = window.URL.createObjectURL(document.getElementById(sourceId).files.item(0)); 
} else if(navigator.userAgent.indexOf("Chrome")>0) { // Chrome 
url = window.URL.createObjectURL(document.getElementById(sourceId).files.item(0)); 
} 
return url; 
} 

/** 
* 将本地图片 显示到浏览器上 
*/ 
function preImg(sourceId, targetId) { 
var url = getFileUrl(sourceId); 
var imgPre = document.getElementById(targetId); 
imgPre.src = url; 
} 
</script>
<script type="text/javascript">
        function F_Open_dialog() 
       { 
            document.getElementById("imgOne").click(); 
       } 

    </script>

</head>

<style type="text/css">
.code {
	background: url(code_bg.jpg);
	font-family: Arial;
	font-style: italic;
	color: blue;
	font-size: 10px;
	border: 0;
}

a:hover {
	text-decoration: underline;
}
</style>


<body>
   

	<div class="page height-full">
		<div class="page-content height-full">
		
			<div class="page-login-main animation-fade">

				<div class="vertical-align">
					<div class="vertical-align-middle">
						

						<form enctype="multipart/form-data" method="post"
							action="${pageContext.request.contextPath }/updateuser/picture"
							onsubmit="return tosure()" class="login-form" id="loginForm">
							<h3 class="hidden-xs">注册 DMS账号</h3>
							<p class="hidden-xs">DMS 缺陷管理系统</p>
							<!-- <div class="form-group clearfix"> -->
							<div>
								<img align="center" id="imgPre" src="" width="20%"  height="20%"
									height="100px" alt="点击上传用户头像" onclick="F_Open_dialog()"
									style="display: block;" />
															
								<div class="form-group">
									<input type="file" name="file" id="imgOne" required="required"
										style="display: none" onchange="preImg(this.id,'imgPre');"
										class="form-control" />
								</div>

							
									<button type="submit"
										class="btn btn-primary btn-block margin-top-30">立即注册</button>
						</form>
					</div>
				</div>
			
				<footer class="page-copyright">
				<p>缺陷管理系统 &copy; 敖海洋</p>
				</footer>
			</div>
		</div>
	</div>
</body>
</html>
 --%>
 
 
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1.0">


<title>缺陷管理系统</title>
<meta name="keywords" content="缺陷管理系统<">
<meta name="description" content="缺陷管理系统">

<link rel="shortcut icon" href="favicon.ico">
<link
	href="${pageContext.request.contextPath }/css/bootstrap.min.css-v=3.3.5.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath }/css/font-awesome.min.css-v=4.4.0.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath }/css/animate.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath }/css/style.min.css-v=4.0.0.css"
	rel="stylesheet">
<base target="_self">
 <script>
	window.location.href="${pageContext.request.contextPath }/user/addBug?flag=1";						   
</script>
</head>

<body class="gray-bg"   >


<!-- 
	<a href="javascript:history.go(-1)">返回上一页</a>
	<a class="close-link" href="javascript:window.location.reload(); ">
		刷新 </a> -->

	<div class="ibox-content">
		<form class="form-horizontal m-t" id="signupForm"
			action="${pageContext.request.contextPath }/user/addBug"
			target="_self" method="post" >
			<input type="hidden" name="flag" value="2"> <input
				type="hidden" name="bug_id" value="${bug.bug_id }">

			<div class="form-group">
				<label class="col-sm-3 control-label">缺陷标题：</label>
				<div class="col-sm-8">
					<input name="summary" id="summary" required="required"
						value="${bug.summary }" class="form-control" />
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label">缺陷项目：</label>
				<div class="col-sm-8">
					<select id="pro_id" name="pro_id" class="form-control" >

						<c:forEach items="${requestScope.projects }" var="project">
							<c:choose>
								<c:when test="${bug.project.pro_id == project.pro_id }">
									<option value="${project.pro_id }" selected="selected">${project.pro_name}</option>
								</c:when>
								<c:otherwise>
									<option value="${project.pro_id }">${project.pro_name }</option>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</select>
				</div>
			</div>


			<div class="form-group">
				<label class="col-sm-3 control-label">严重级别： </label>
				<div class="col-sm-8">
					<select class="form-control" id="pon_id" name="pon_id"
						class="select">

						<c:forEach items="${requestScope.ponderances }" var="ponderance">
							<c:choose>
								<c:when test="${bug.ponderance.pon_id == ponderance.pon_id }">
									<option value="${ponderance.pon_id }" selected="selected">${ponderance.pon_name}</option>
								</c:when>
								<c:otherwise>
									<option value="${ponderance.pon_id }">${ponderance.pon_name }</option>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</select>
				</div>
			</div>

			<div class="form-group">
				<label class="col-sm-3 control-label" id="ba"  onclick="$('#popup').show();"><a
					title="点击查看">优先级：</a></label>
				<div class="col-sm-8">
					<select class="form-control" id="priority" name="priority"
						class="select">

						<option value="Immediate">Immediate</option>
						<option value="Urgent">Urgent</option>
						<option value="High">High</option>
						<option value="Normal">Normal</option>
					</select>
				</div>
			</div>




			<div class="form-group">
				<label class="col-sm-3 control-label">缺陷状态：</label>
				<div class="col-sm-8">
					<select id="bug_status" name="bug_status" class="form-control">
  
								<option value="1" selected="selected">New</option>
 	
					</select>

				</div>
			</div>

			<div class="form-group">
				<label class="col-sm-3 control-label">操作环境：</label>
				<div class="col-sm-8">
					<textarea name="bug_os" id="bug_os"
						placeholder="操作系统，浏览器，网络  
如：windows10 chrome55.4 wifi"
						required="required" class="form-control" class="description">${bug.bug_os}</textarea>

				</div>
			</div>

			<div class="form-group">
				<label class="col-sm-3 control-label">步骤描述：</label>
				<div class="col-sm-8">
					<textarea name="bug_description" id="bug_description"
						required="required" style="height: 200px;"
						placeholder="操作步骤，预期结果，实际结果&#xA如：步骤 &#xA 1. 在浏览器地址栏输入'www.baidu.com'&#xA 2.点击进入百度页面&#xA 3.点击右上角的分享按钮&#xA 预期结果:&#xA 分享成功&#xA 实际结果:&#xA 分享失败"
						class="form-control">${bug.bug_description }</textarea>

				</div>
			</div>


			<div class="form-group">
				<div class="col-sm-8 col-sm-offset-3">
					<input class="btn btn-primary" type="submit" value="提交"/>
				</div>
			</div>
		</form>
	</div>
	</div>
	</div>
	</div>
	</div>
	<script
		src="${pageContext.request.contextPath }/js/jquery.min.js-v=2.1.4"></script>
	<script
		src="${pageContext.request.contextPath }/js/bootstrap.min.js-v=3.3.5"></script>
	<script
		src="${pageContext.request.contextPath }/js/content.min.js-v=1.0.0"
		tppabs="http://www.zi-han.net/theme/hplus/js/content.min.js?v=1.0.0"></script>
	<script
		src="${pageContext.request.contextPath }/js/plugins/validate/jquery.validate.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/js/plugins/validate/messages_zh.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/js/demo/form-validate-demo.min.js"></script>


		<div id="maskLevel"
			style="position: absolute; top: 0px; left: 0px; text-align: center; z-index: 1000; background: #000; filter: alpha(opacity = 10); opacity: 0.5; -moz-opacity: 0.1; width: 100%; height: 100%;"></div>
		<div
			style="position: absolute; top: 10%;  left: 10%; z-index: 1001; background: #FFF; width: 80%; height: auto; border: 5px solid #666666; padding-bottom: 10px;">
			<dl class="popup_title">
				<dt>缺陷优先级</dt>
				<dd>
					<a href="javascript:;" onclick="$('#popup').hide();"><i class="fa fa-remove" id="close" ></i></a>
				</dd>
			</dl>
		</div>
	</div>
</body>
</html>