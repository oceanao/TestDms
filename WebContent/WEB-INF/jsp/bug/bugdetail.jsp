<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加用户</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">


<title>DMS-缺陷详情</title>
<meta name="keywords" content="DMS-缺陷详情">
<meta name="description"
	content="DMS-缺陷详情">

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
				<label class="col-sm-3 control-label">缺陷项目：</label>
				<div class="col-sm-8">
				<input value="${bug.project.pro_name}" disabled="disabled" class="form-control">
					
			 
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
				<input value="${bug.ponderance.pon_name}" disabled="disabled" class="form-control">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label">处理人：</label>
				<div class="col-sm-8">
				
					<input value="${bug.handler.username}" disabled="disabled" class="form-control">
				</div>
			</div>



			<div class="form-group">
				<label class="col-sm-3 control-label">复现结果：</label>
				<div class="col-sm-8">
					<input value="${bug.result.result_name }" disabled="disabled" class="form-control">
					
				</div>
			</div>

			<div class="form-group">
				<label class="col-sm-3 control-label">缺陷状态：</label>
				<div class="col-sm-8">
					<select id="bug_status" name="bug_status" class="form-control" disabled="disabled">
                     
						<c:choose>
							<c:when test="${bug.bug_status == 1 }">
								<option value="1" selected="selected">New</option>
								<option value="2">Open</option>
								<option value="3">Assigned</option>
								<option value="4">handled</option>
								<option value="5">Closed</option>
								<option value="6">Reopen</option>
							</c:when>
							<c:when test="${bug.bug_status == 2 }">

								<option value="1">New</option>
								<option value="2" selected="selected">Open</option>
								<option value="3">Assigned</option>
								<option value="4">handled</option>
								<option value="5">Closed</option>
								<option value="6">Reopen</option>
							</c:when>
							<c:when test="${bug.bug_status == 3 }">

								<option value="1">New</option>
								<option value="2">Open</option>
								<option value="3" selected="selected">Assigned</option>
								<option value="4">handled</option>
								<option value="5">Closed</option>
								<option value="6">Reopen</option>
							</c:when>
							<c:when test="${bug.bug_status == 4 }">

								<option value="1">New</option>
								<option value="2">Open</option>
								<option value="3">Assigned</option>
								<option value="4" selected="selected">handled</option>
								<option value="5">Closed</option>
								<option value="6">Reopen</option>
							</c:when>
							<c:when test="${bug.bug_status == 5 }">

								<option value="1">New</option>
								<option value="2">Open</option>
								<option value="3">Assigned</option>
								<option value="4">handled</option>
								<option value="5" selected="selected">Closed</option>
								<option value="6">Reopen</option>
							</c:when>
							<c:when test="${bug.bug_status == 6 }">

								<option value="1">New</option>
								<option value="2">Open</option>
								<option value="3">Assigned</option>
								<option value="4">handled</option>
								<option value="5">Closed</option>
								<option value="6" selected="selected">Reopen</option>
							</c:when>

						</c:choose>
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
				<label class="col-sm-3 control-label">评论：</label>
				<div class="col-sm-8">
					<textarea name="bug_comment" id="bug_comment" disabled='disabled'
						class="form-control" style="height: 200px;" class="comment">${bug.bug_comment }</textarea>

				</div>
			</div>

			<div class="form-group">
				<label class="col-sm-3 control-label"><p>附件：</p></label>
				<div class="col-sm-8">
				
					<c:forEach items="${requestScope.bugfiles}" var="bugfile"
						varStatus="stat">
						<tr id="data_${stat.index}">
							<td>
								<div>
									<br> <br> 
									<a
										href="/pic/${bugfile.filename}">${bugfile.filetitle}</a> <br> <br> 
										<img src="/pic/${bugfile.filename}"  ondblclick="geturl()" alt="${bugfile.filename},请点击标题下载或者查看"
										style="width: 200px; height: 200px;" /> 
								</div>
							</td>
					<script>
					function geturl()
					{
						window.location.href="/pic/${bugfile.filename}";
					}
					</script>
							<br>
							<br>
						</tr>
					</c:forEach>
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
