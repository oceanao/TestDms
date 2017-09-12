<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加用户</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">


<title>DMS 缺陷管理系统</title>
<meta name="keywords" content="DMS 缺陷管理系统">
<meta name="description"	content="DMS 缺陷管理系统">

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
<base target="_blank">

</head>

<body class="gray-bg">
	<a href="javascript:history.go(-1)">返回上一页</a>
	<a class="close-link" href="javascript:window.location.reload(); ">
		刷新 </a>

	<div class="ibox-content">
		<form class="form-horizontal m-t" id="signupForm"
			action="${pageContext.request.contextPath }/bug/amendbugs"
			target="_self" method="post">
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
				<label class="col-sm-3 control-label">缺陷项目:</label>
				<div class="col-sm-8">
					<select id="pro_id" name="pro_id" class="form-control"
						disabled="disabled">

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
				<label class="col-sm-3 control-label">提交人：</label>
				<div class="col-sm-8">
					<input id="reporter_id" name="reporter_id" " class="form-control"
						value="${bug.reporter.username}" disabled="disabled" type="text">

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
				<label class="col-sm-3 control-label">优先级：</label>
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

						<c:choose>
							<c:when test="${bug.bug_status == 1 }">
								<option value="1" selected="selected">New</option>
								<!-- <option value="2">Open</option>
								<option value="3">Assigned</option>
								<option value="4">handled</option>
								<option value="5">Closed</option>
								<option value="6">Reopen</option> -->
							</c:when>
							<c:when test="${bug.bug_status == 2 }">

								<!-- <option value="1">New</option> -->
								<option value="2" selected="selected">Assigned</option>
								<!-- <option value="3">Assigned</option>
								<option value="4">handled</option>
								<option value="5">Closed</option>
								<option value="6">Reopen</option> -->
							</c:when>
							<c:when test="${bug.bug_status == 3 }">

								<!-- 		<option value="1">New</option>
								<option value="2">Open</option> -->
								<option value="3" selected="selected">Open</option>
								<!-- <option value="4">handled</option>
								<option value="5">Closed</option>
								<option value="6">Reopen</option> -->
							</c:when>
							<c:when test="${bug.bug_status == 4 }">

								<!-- <option value="1">New</option>
								<option value="2">Open</option>
								<option value="3">Assigned</option> -->
								<option value="4" selected="selected">Fixed</option>
								<!-- 		<option value="5">Closed</option>
								<option value="6">Reopen</option> -->
							</c:when>
							<c:when test="${bug.bug_status == 5 }">

								<!-- <option value="1">New</option>
								<option value="2">Open</option>
								<option value="3">Assigned</option>
								<option value="4">handled</option> -->
								<option value="5" selected="selected">Rejected</option>
								<!-- 	<option value="6">Reopen</option> -->
							</c:when>
							<c:when test="${bug.bug_status == 6 }">

								<!-- 	<option value="1">New</option>
								<option value="2">Open</option>
								<option value="3">Assigned</option>
								<option value="4">handled</option>
								<option value="5">Closed</option> -->
								<option value="6" selected="selected">Postponed</option>
							</c:when>
							<c:when test="${bug.bug_status == 7 }">

								<!-- 	<option value="1">New</option>
								<option value="2">Open</option>
								<option value="3">Assigned</option>
								<option value="4">handled</option>
								<option value="5">Closed</option> -->
								<option value="6" selected="selected">Closed</option>
							</c:when>
							<c:when test="${bug.bug_status == 8 }">

								<!-- 	<option value="1">New</option>
								<option value="2">Open</option>
								<option value="3">Assigned</option>
								<option value="4">handled</option>
								<option value="5">Closed</option> -->
								<option value="6" selected="selected">Reopen</option>
							</c:when>

						</c:choose>
						<option value="1">New</option>
						<option value="2">Assigned</option>
						<option value="3">Open</option>
						<option value="4">Fixed</option>
						<option value="5">Rejected</option>
						<option value="6">Postponed</option>
						<option value="7">Closed</option>
						<option value="8">Reopen</option>
						
					</select>

				</div>
			</div>

			<div class="form-group">
				<label class="col-sm-3 control-label">操作环境：</label>
				<div class="col-sm-8">
					<textarea name="bug_os" id="bug_os"  style="height: 68px;"
						required="required" class="form-control" class="description">${bug.bug_os}</textarea>

				</div>
			</div>

			<div class="form-group">
				<label class="col-sm-3 control-label">步骤描述：</label>
				<div class="col-sm-8">
					<textarea name="bug_description" id="bug_description" 
						required="required" style="height: 200px;" class="form-control">${bug.bug_description }</textarea>

				</div>
			</div>


			<div class="form-group">
				<div class="col-sm-8 col-sm-offset-3">
					<button class="btn btn-primary" type="submit">提交</button>
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