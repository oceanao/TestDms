<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath }/static/css/admin.css" type="text/css" rel="stylesheet" />
<title>Insert title here</title>
</head>
<body>
<a href="javascript:history.go(-1)">返回上一页</a> 
<h2 align="center">分类详情</h2>
<div align="center">
<br><br><br>

	<table width="80%" height="90%" border="0" cellpadding="5" cellspacing="0" >
		<!-- 数据展示区 -->
		<tr valign="top">
			<td height="20">
				<table width="100%" border="1" cellpadding="5" cellspacing="0"
					style="border: #c2c6cc 1px solid; border-collapse: collapse;">
					
					<tr align="center">
						<td>项目名称:</td>
						<td>${project.pro_name }</td>
					</tr>
					<tr align="center">
						<td>详细信息:</td>
						<td>${project.pro_description }</td>
					</tr>
					<tr align="center">
						<td>项目文件:</td>
						<td>${project.pro_file}</td>
					</tr>

                     <tr align="center">
						<td>项目负责人人:</td>
						<td>${project.manager.username}</td>
					</tr>

				</table>
			</td>
		</tr>
	</table>
	</div>
</body>
</html> --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加用户</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">


<title>H+ 后台主题UI框架 - 表单验证 jQuery Validation</title>
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
	tppabs="http://www.zi-han.net/theme/hplus/css/style.min.css?v=4.0.0"
	rel="stylesheet">
<base target="_blank">

</head>

<body class="gray-bg">
	<a href="javascript:history.go(-1)">返回上一页</a>
	<a class="close-link" href="javascript:window.location.reload(); " > 刷新 </a>
	

	<div class="ibox-content">
		<form class="form-horizontal m-t" id="signupForm"
			action="${pageContext.request.contextPath }/project/updateProject"
			target="_self" method="post">
			<input type="hidden" name="flag" value="2">
			<input type="hidden" name="pro_id" value="${project.pro_id}">
			<div class="form-group">
				<label class="col-sm-3 control-label">项目名称</label>
				<div class="col-sm-8">
					<input id="firstname" name="pro_name"  class="form-control"  value="${project.pro_name }"
						type="text" aria-required="true" disabled="disabled"
						aria-invalid="true" class="error"> <span
						class="help-block m-b-none"><i></i></span>
				</div>
			</div>
		 <div class="form-group">
				<label class="col-sm-3 control-label">项目组长</label>
				<div class="col-sm-8">
				
						 <select disabled="disabled"
						name="manager_id" class="form-control" required="required">
							<option>${project.manager.username}</option>
					</select>

				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label">项目地址</label>
				<div class="col-sm-8">
					<input  name="pro_file" class="form-control"  value="${project.pro_file }"
						type="text" aria-required="true" aria-invalid="true" disabled="disabled"
						class="error">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label">项目描述</label>
				<div class="col-sm-8">
					<textarea  name="pro_description" class="form-control" disabled="disabled"
					 style="height: 200px;">${project.pro_description }</textarea>
				</div>
			</div>
		

			
		

			
		</form>
	</div>
	</div>
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
	<script
		src="${pageContext.request.contextPath }/js/plugins/validate/jquery.validate.min.js"
		tppabs="http://www.zi-han.net/theme/hplus/js/plugins/validate/jquery.validate.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/js/plugins/validate/messages_zh.min.js"
		tppabs="http://www.zi-han.net/theme/hplus/js/plugins/validate/messages_zh.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/js/demo/form-validate-demo.min.js"
		tppabs="http://www.zi-han.net/theme/hplus/js/demo/form-validate-demo.min.js"></script>
	<script type="${pageContext.request.contextPath }/text/javascript"
		src="../../../tajs.qq.com/stats-sId=9051096"
		tppabs="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
</body>

</html>
