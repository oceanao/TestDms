<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加用户</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">


<title>DMS缺陷管理系统</title>
<meta name="keywords" content="DMS缺陷管理系统">
<meta name="description" content="DMS缺陷管理系统">

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
	<a class="close-link" href="javascript:window.location.reload(); ">
		刷新 </a>

	<div class="ibox-content">
		<form class="form-horizontal m-t" id="signupForm"
			action="${pageContext.request.contextPath }/bug/updateBug"
			target="_self" method="post">
			<input type="hidden" name="flag" value="2"> <input
				type="hidden" name="bug_id" value="${bug.bug_id }">

			<div class="form-group">
				<label class="col-sm-3 control-label">缺陷标题：</label>
				<div class="col-sm-8">
					<input name="summary" id="summary" required="required"
						disabled="disabled" value="${bug.summary }" class="form-control" />

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
				<c:choose>
					<c:when test="${role==3}">
						<label class="col-sm-3 control-label">处理人：</label>
						<div class="col-sm-8">
							<select id="handler_id" name="handler_id" class="form-control">


								<optgroup label="开发人员">
									<c:forEach items="${requestScope.users}" var="user">
										<c:if test="${user.role==1}">

											<option value="${user.user_id }">${user.username}</option>

										</c:if>
								</optgroup>
								</c:forEach>

							 
									<optgroup label="测试人员">
										<c:forEach items="${requestScope.users}" var="user">
											<c:if test="${user.role==2}">

												<option value="${user.user_id }">${user.username}</option>

											</c:if>
									</optgroup>
								</c:forEach>
								



							</select>
						</div>
					</c:when>
					<c:otherwise>
						<label class="col-sm-3 control-label">复现人：</label>
						<div class="col-sm-8">
							<select id="handler_id" name="handler_id" class="form-control">

								<c:forEach items="${requestScope.users}" var="user">
									<%-- 	<c:choose>
								<c:when test="${bug.handler.user_id == user.user_id }">
									<option value="${user.user_id }" selected="selected">${user.username}</option>
								</c:when>
								<c:otherwise>
									<option value="${user.user_id }">${user.username }</option>
								</c:otherwise>
							</c:choose> --%>
									<c:if test="${user.role==2}">
										<option value="${user.user_id }">${user.username}</option>
									</c:if>
								</c:forEach>
							</select>
						</div>
					</c:otherwise>
				</c:choose>

			</div>



			<div class="form-group">
				<label class="col-sm-3 control-label">复现结果：</label>
				<div class="col-sm-8">
					<select id="result_id" name="result_id" class="form-control">

						<c:forEach items="${requestScope.results}" var="result">
							<option value="${result.result_id }">${result.result_name }</option>
						</c:forEach>
					</select>

				</div>
			</div>

			<div class="form-group">
				<label class="col-sm-3 control-label" onclick="$('#popup').show();">缺陷状态：</label>
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
					<textarea name="bug_os" id="bug_os" disabled="disabled"
						required="required" class="form-control" class="description">${bug.bug_os}</textarea>

				</div>
			</div>

			<div class="form-group">
				<label class="col-sm-3 control-label">步骤描述：</label>
				<div class="col-sm-8">
					<textarea name="bug_description" id="bug_description"
						disabled="disabled" required="required" style="height: 200px;"
						class="form-control">${bug.bug_description }</textarea>

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


	<div id="popup" class="popup_box" style="display: none;">
		<style type="text/css">
.ulogin {
	width: 230px;
	height: 30px;
	line-height: 30px;
	border: 1px solid #D5D5D5;
}

.savetime {
	width: 100px;
	height: 20px;
	line-height: 20px;
	border: 1px solid #DFDFDF;
}

.savetime option {
	line-height: 20px;
}

.login_btn {
	width: 300px;
	text-align: left;
}

.login_btn a {
	margin: 0px 6px;
	_margin: 0px 0px;
}

.login_btn .login_a {
	width: 24px;
	height: 30px;
	line-height: 30px;
	padding: 6px 25px;
	background-color: #7CDAFF;
	color: #DFDFDF;
	overflow: hidden;
}

.popup_title {
	width: 100%;
	height: 30px;
	line-height: 30px;
	background-color: #DFDFDF;
}

.popup_title dt {
	width: 95%;
	float: left;
	text-indent: 1em;
	font-weight: bold;
}

.popup_title dd {
	width: 4%;
	float: right;
}

.popup_content {
	width: 100%;
	height: 30px;
	line-height: 30px;
	padding: 10px 0px 20px 0px;
	background-color: #FFF;
}

.popup_content li {
	width: 100%;
	float: left;
	text-indent: 0.5em;
	overflow: hidden;
}

ol.popup_content li {
	list-style-type: lower-roman;
}
</style>
		<div id="maskLevel"
			style="position: absolute; top: 0px; left: 0px; text-align: center; z-index: 1000; background: #000; filter: alpha(opacity = 10); opacity: 0.5; -moz-opacity: 0.1; width: 100%; height: 100%;"></div>
		<div
			style="position: absolute; top: 2%; left: 10%; z-index: 1001; background: #FFF; width: 80%; height: auto; border: 5px solid #666666; padding-bottom: 10px;">
			<dl class="popup_title">
				<dt>缺陷状态</dt>
				<dd>
					<a href="javascript:;" onclick="$('#popup').hide();"><i
						class="fa fa-remove" id="close"></i></a>
				</dd>
			</dl>
			<h2 align="center">缺陷状态</h2>
			<font size="4px;"> <big>New</big> <br>
				bug提交到缺陷库中会自动的被设置成New状态 <br> <br> <big>Assigned（已指派）：</big>
				<br>
				当一个bug被认为New之后，将其分配开发人员，开发人员将确认这是否是一个bug，如果是，开发组的负责人就将这个bug指定给某位开发人员处理，并将bug的状态设定为“Assigned”
				<br> <br> <big>Open（已打开）：</big> <br>
				开发人员开始处理bug时，他将这个bug的状态设置为“Open”，表示开发人员正在处理这个“bug” <br> <br>
				<big>Fixed（已修复）：</big> <br>
				当开发人员进行处理（并认为已经解决）之后，他（她）就可以将这个bug的状态设置为“Fixed”并将其提交给开发组的负责人，然后开发组的负责人将这个bug返还给测试组
				<br> <br>
			<big>Rejected(被拒绝)：</big><br>

				测试组的负责人接到上述bug的时候，如果发现这是产品说明书中定义的正常行为或者经过与开发人员的讨论之后认为这并不能算作bug的时候，开发组负责人就将这个bug的状态设置为“Rejected”
				<br>
			<br> <big>Postponed（延期）：</big><br>


				有些时候，对于一些特殊的bug的测试需要搁置一段时间，事实上有很多原因可能导致这种情况的发生，比如无效的测试数据，一些特殊的无效的功能等等，在这种情况下，bug的状态就被设置为“Postponed”
				<br>
			<br> <big>Closed（已关闭）：</big><br> <br>
				测试人员经过再次测试后确认bug已经被解决，将bug的状态设置为“Closed” <br> <br>
			<big>Reopen</big> <br>
				如经过再次测试发现bug仍然存在，测试人员将bug再次开发组，将bug的状态设置为“Reopen” <br> <br>
			</font>
			<script language="javascript">
				$(window).scroll(function() {
					windowScrollUpload(this);
				});
				function windowScrollUpload(obj) {
					$('#popup > div').eq(0).css({
						'top' : $(obj).scrollTop() + 'px'
					});
				}
			</script>
		</div>
	</div>
</body>

</html>