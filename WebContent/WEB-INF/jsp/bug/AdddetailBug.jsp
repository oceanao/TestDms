<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加用户</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">


<title>DMS-缺陷管理系统 -提交缺陷</title>
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
<script src="${pageContext.request.contextPath }/js/jquery-1.8.3.min.js"></script>
<script src="${pageContext.request.contextPath }/js/photo.js"></script>

<script type="text/javascript">

</script>
</head>

<body class="gray-bg">

	<div class="ibox-content">
		<a class="close-link"
			href="${pageContext.request.contextPath }/user/addBug?flag=1"
			target="_self">提交缺陷</a> <a class="close-link" target="_self"
			href="${pageContext.request.contextPath }/bug/detailBug?bug_id=${bug.bug_id}"
			title="查看缺陷详情">查看缺陷</a>
		<form id="fileForm" name="fileForm" class="form-horizontal m-t"
			target="_self"
			action="${pageContext.request.contextPath }/bug/addBugFile?bug_id=${bug.bug_id}"
			enctype="multipart/form-data" method="post">
			<input type="hidden" name="bug_id" value="${bug.bug_id }">

			<div class="form-group">
				<label class="col-sm-3 control-label">缺陷标题：</label>
				<div class="col-sm-8">
					<input name="summary" id="summary" required="required"
						value="${bug.summary }" class="form-control" disabled="disabled"
						style="background-color: white;" />
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label">缺陷状态：</label>
				<div class="col-sm-8">
					<select id="bug_status" name="bug_status" disabled="disabled"
						style="background-color: white;" class="form-control">

						<c:choose>
							<c:when test="${bug.bug_status == 1 }">
								<option value="1" selected="selected">New</option>

							</c:when>
							<c:when test="${bug.bug_status == 2 }">
								<option value="2" selected="selected">Assigned</option>

							</c:when>
							<c:when test="${bug.bug_status == 3 }">
								<option value="3" selected="selected">Open</option>

							</c:when>
							<c:when test="${bug.bug_status == 4 }">

								<option value="4" selected="selected">Fixed</option>

							</c:when>
							<c:when test="${bug.bug_status == 5 }">

								<option value="5" selected="selected">Rejected</option>

							</c:when>
							<c:when test="${bug.bug_status == 6 }">

								<option value="6" selected="selected">Postponed</option>
							</c:when>
							<c:when test="${bug.bug_status == 7 }">


								<option value="6" selected="selected">Closed</option>
							</c:when>
							<c:when test="${bug.bug_status == 8 }">

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
					<textarea id="bug_os" disabled="disabled"
						style="background-color: white;" required="required"
						class="form-control">${bug.bug_os }</textarea>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label">步骤描述：</label>
				<div class="col-sm-8">
					<textarea id="bug_description" required="required"
						disabled="disabled"
						style="height: 200px; background-color: white;"
						class="form-control">${bug.bug_description }</textarea>
				</div>
			</div>
			<!-- <div><button type="button" onclick="add()">查看</button></div> -->


			<div class="form-group">
				<label class="col-sm-3 control-label">附件预览：</label>
				<c:forEach items="${requestScope.bugfiles }" var="bugfile"
					varStatus="stat">
					<tr id="data_${stat.index}">
						<td>${stat.count}</td>
						<td><img src="/pic/${bugfile.filename}" 
							onmouseover="zoom(this,1.3)" style="width: 100px; height: 100px;" />
						</td>
					</tr>
				</c:forEach>
			</div>

			<div class="form-group" align="right">

				<div class="fa-hover col-md-3 col-sm-4">
					<a   onclick="$('#popup').show();"><i class="fa fa-plus"></i>添加附件</a>
				</div>
			</div>
		<!-- 	<div class="form-group"  id="add"> -->
				<!-- <div class="col-sm-8 col-sm-offset-3">
					附件：支持多次上传多个文件，可以上传图片，MP4格式视频,zip压缩包<br> <a href="javascript:;"
						class="a-upload" id=""> <input type="file" name="file"
						class="form-control" id="file" onchange="selectFile()" />点击这里上传文件
					</a>
				</div> -->
				
				
			<!-- 	<div class="col-sm-8 col-sm-offset-3">
					附件：支持多次上传多个文件，可以上传图片，MP4格式视频,zip压缩包<br>
				 
						<input type="text" id="test" name="filetitle" class="p-input" placeholder="请输入文件名" > 
						
						<big class="p-upload"> <input type="file" name="file" class="p-upload" onblur="selectFile(this)"
							onChange="if(this.value)insertTitle(this.value);">
							 <span id="text">点击这里上传文件</span>
						</big> 
				</div>
				 -->
				
				
				
				
				
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
			style="position: absolute; top: 40%;  left: 20%; z-index: 1001; background: #FFF; width: 60%; height: auto; border: 5px solid #666666; padding-bottom: 10px;">
			<dl class="popup_title">
				<dt>上传附件</dt>
				<dd>
					<a href="javascript:;" onclick="$('#popup').hide();"><i class="fa fa-remove" id="close" ></i></a>
				</dd>
			</dl>
			<div class="col-sm-8 col-sm-offset-3">
					附件：支持多次上传多个文件，可以上传图片，MP4格式视频,zip压缩包(资源请勿超过30MB)<br>
					
					
				 
						<input type="text" id="test" name="filetitle" class="p-input" placeholder="请输入文件名" > 
						
						<big class="p-upload"> <input type="file" name="file" class="p-upload" onblur="selectFile(this)"
							onChange="if(this.value)insertTitle(this.value);">
							 <span id="text" >点击这里上传文件</span>
						</big> 
						&#160;	&#160;	&#160;
							<input class="btn btn-primary" type="submit" value="上传">
				</div>
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
			 
				
			 

		</form>
		</div>
	</div>
				
	

				
				<script language="javascript">
					function insertTitle(path) {
						var test1 = path.lastIndexOf("/"); //对路径进行截取
						var test2 = path.lastIndexOf("\\"); //对路径进行截取
						var test = Math.max(test1, test2)
						if (test < 0) {
							document.getElementById("test").value = path;
						} else {
							document.getElementById("test").value = path
									.substring(test + 1); //赋值文件名
							document.getElementById("text").innerHTML = path
									.substring(test + 1);
						}
					}
					
					function selectFile(input) {

						var fileName = input.value;
						if (fileName.length > 1 && fileName) {
							var ldot = fileName.lastIndexOf(".");
							var type = fileName.substring(ldot + 1);

							if (type != "jpg" && type != "png" && type != "PNG"
									&& type != "mp4" && type != "MP4" && type != "zip") {
							
								alert("只能上传jpg,png,zip,mp4格式，当前格式" + type);
								document.getElementById("text").innerHTML = "请选择文件";
								//清除当前所选文件
								input.outerHTML = input.outerHTML.replace(/(value=\").+\"/i,
										"$1\"");
								document.getElementById("test").value =""//赋值文件名
								return false;
					
							}
						}
					}
				</script>
			</div>

			<style>
		
		
		.p-input {
	padding: 4px 10px;
	height: 30px;
	line-height: 20px;
	position: relative;
	cursor: pointer;
	border: 1px solid #ddd;
	border-radius: 4px;
	/* color: #888;
	background: #fafafa; */
	/* 
	overflow: hidden;
	  display:inline-table; */	
}			
.p-upload {
	padding: 4px 10px;
	height: 30px;
	line-height: 20px;
	position: relative;
	cursor: pointer;
	color: #888;
	background: #fafafa;
	border: 1px solid #ddd;
	border-radius: 4px;
	overflow: hidden;
	  display:inline-table;
	*display: inline;
	*zoom: 1  
	
}

 .p-upload  input {
	position: absolute;
	font-size: 100px;
	right: 0;
	top: 0;
	opacity: 0;
}
.p-upload:hover {
	color: #444;
	background: #eee;
	border-color: #ccc;
	text-decoration: none
} 
</style>
			<!-- <script type="text/javascript">
				function add() {
					document.getElementById("add").style = "display: inline;"
				}
			</script>
			<br> -->
		
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