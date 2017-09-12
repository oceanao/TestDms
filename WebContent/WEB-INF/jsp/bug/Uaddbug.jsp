
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




<!-- 
	<style type="text/css">
* {
	margin: 0;
	padding: 0;
}

.VeryhuoCOM {
	position: fixed;
	_position: absolute;
	_top: expression(documentElement.scrollTop + 340 + "px");
	background: #fff;
	border: 1px solid #939395;
	width: 58%;
	top: 40%;
	right: 20%;
	margin: -200px 0 0 -250px;
	overflow: hidden;
	z-index: 99999;
	font-size: 14px;
	color: #000;
	display: none;
}

.VeryhuoCOM dl {
	overflow: hidden;
	padding: 20px;
	margin: 0;
}

.VeryhuoCOM dl dt {
	line-height: 30px;
}

.VeryhuoCOM dl dd {
	line-height: 25px;
	height: 25px;
	padding-left: 10px;
	margin: 0;
}

.VeryhuoCOM dl dd label {
	padding-left: 5px;
}

.VeryhuoCOM dl dd.cBtn {
	width: 102px;
	height: 28px;
	background: url(../images/member/chooseBtn.gif) no-repeat;
	margin-top: 10px;
	padding: 0;
}

.VeryhuoCOM dl dd.cBtn a {
	display: block;
	text-align: center;
}

.VeryhuoCOM dl dd.cBtn a:link, .VeryhuoCOM dl dd.cBtn a:visited {
	color: #000;
}

.VeryhuoCOM dl dd.lBtn {
	float: left;
	display: inline;
	margin-left: 100px;
}

.VeryhuoCOM dl dd.rBtn {
	float: left;
	display: inline;
	margin-left: 10px;
}
</style>

	<a id="bt">点击弹出div</a>

	<div id="VeryhuoCOM" class="VeryhuoCOM" style="display: none;">
	 
		 <div align="right"><i class="fa fa-remove" id="close" ></i> </div> 
		 <h2 align="center">缺陷优先级</h2>
		<font size="4px;"> <big>Immediate（立刻）</big> <br>
			即“马上解决”，表示问题必须马上解决，否则系统根本无法达到预定的需求。 <br>
		<br>  <big>Urgent（紧要、优先）</big> <br>
			即“急需解决”，表示问题的修复很紧要，很急迫，关系到系统的主要功能模块能否正常。<br>
		<br>  <big>High（高度重视）</big><br>
			即“高度重视”，表示有时间就要马上解决，否则系统偏离需求较大或预定功能不能正常实现。 <br>
		<br>  <big>Normal（正常）</big> <br>即“正常处理”，进入个人计划解决，表示问题不影响需求的实现，但是影响其他使用方面，比如页面调用出错，调用了错误的等。
		<br>
		<br>
		</font>
<script type="text/javascript">
function size()
{
var o = document.getElementById("VeryhuoCOM");
var h = o.offsetHeight; //高度
var w = o.offsetWidth; //宽度
alert(w);
}
</script>
		<dt>请您告知我们取消订单的原因，以便我们改进。非常感谢!</dt>
			<dd>
				<input type="radio" name="reason" id="reason1"><label
					for="reason1">改变主意,现在不想买了</label>
			</dd>
			<dd>
				<input type="radio" name="reason" id="reason2"><label
					for="reason2">刚才信息填错了,要重新下单</label>
			</dd>
			<dd>
				<input type="radio" name="reason" id="reason3"><label
					for="reason3">先取消,再更换或添加新商品</label>
			</dd>
			<dd>
				<input type="radio" name="reason" id="reason4"><label
					for="reason4">网银,信用卡等支付有问题</label>
			</dd>
			<dd>
				<input type="radio" name="reason" id="reason5"><label
					for="reason5">等待时间过长,不耐烦了</label>
			</dd>
			<dd>
				<input type="radio" name="reason" id="reason6"><label
					for="reason6">商品价格较贵</label>
			</dd>
			<dd>
				<input type="radio" name="reason" id="reason7"><label
					for="reason7">出现商品缺货情况</label>
			</dd>
			<dd>
				<input type="radio" name="reason" id="reason8"><label
					for="reason8">其它的原因</label>
			</dd>
			<dd>
				<input type="radio" disabled="disabled"><label>72小时到期自动取消(不可选)</label>
			</dd>
			<dd class="cBtn lBtn">
				<a href="#" target="_self">选好了</a>
			</dd>
			<dd class="cBtn rBtn">
		</dl>
	</div>
	<script type="text/javascript">
		/*
		 openID=显示按钮,conID=需要显示的div,closeID=关闭按钮
		 Downloads By http://www.veryhuo.com
		 解决了:
		 1.可以遮挡ie6下的select元素 但是在ie6下div没有透明度
		 2.弹出的div可以一直在浏览器屏幕中间显示
		 问题:
		 1.目前不支持.class 只支持#id
		 2.需要显示的div需要自己设置css
		 3.在ie6下需要设置css
		 例如div {_position: absolute;_top: expression(documentElement.scrollTop + 340 + "px"); }
		 4.ie6下背景div没有透明度 这里我上网搜到的结果都不能解决 如果您有方法请给我留言
		 */
		var _CalF = { //便捷方法
			$ : function(id) {
				return document.getElementById(id)
			},
			create : function(id) {
				return document.createElement(id)
			},
			append : function(id) {
				return document.body.appendChild(id)
			},
			remove : function(id) {
				return document.body.removeChild(id)
			}
		}
		function popup(openID, conID, closeID) {
			this.onclick(openID, conID, closeID);
		}
		popup.prototype = {
			cssStyle : "width:100%;position:absolute;left:0;top:0;filter:alpha(opacity = 50);opacity:0.5;border:0;overflow:auto;",
			createShadowDiv : function() { //背景遮罩
				var shadowDiv = _CalF.create("div");
				shadowDiv.id = "shadowDiv";
				shadowDiv.style.cssText = this.cssStyle;
				shadowDiv.style.height = document.body.scrollHeight + "px";
				shadowDiv.style.backgroundColor = "#000"
				shadowDiv.style.zindex = 100;
				_CalF.append(shadowDiv);
			},
			createIframe : function() { //iframe
				var iframe = _CalF.create("iframe");
				iframe.id = "shadowIframe";
				iframe.style.cssText = this.cssStyle;
				iframe.style.height = document.body.scrollHeight + "px";
				iframe.style.zindex = 99;
				_CalF.append(iframe);
			},
			removeDiv : function() {
				_CalF.remove(_CalF.$("shadowDiv"));
				_CalF.remove(_CalF.$("shadowIframe"));
			},
			onclick : function(openID, conID, closeID) {
				var that = this;
				_CalF.$(openID).onclick = function() {
					if (window.ActiveXObject) { //ie6
						if (!window.XMLHttpRequest) {
							document.body.style.cssText = "_background-image: url;_background-attachment: fixed;";
						}
					}
					that.createIframe();
					that.createShadowDiv();
					_CalF.$(conID).style.display = "block";
				}
				document.getElementById(closeID).onclick = function() {
					_CalF.$(conID).style.display = "none";
					that.removeDiv();
				}
			}
		}
		var bt = new popup("ba", "VeryhuoCOM", "close");
	</script>


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
			style="position: absolute; top: 10%;  left: 10%; z-index: 1001; background: #FFF; width: 80%; height: auto; border: 5px solid #666666; padding-bottom: 10px;">
			<dl class="popup_title">
				<dt>缺陷优先级</dt>
				<dd>
					<a href="javascript:;" onclick="$('#popup').hide();"><i class="fa fa-remove" id="close" ></i></a>
				</dd>
			</dl>
			
				 <h2 align="center">缺陷优先级</h2>
		<font size="4px;"> <big>Immediate（立刻）</big> <br>
			即“马上解决”，表示问题必须马上解决，否则系统根本无法达到预定的需求。 <br>
		<br>  <big>Urgent（紧要、优先）</big> <br>
			即“急需解决”，表示问题的修复很紧要，很急迫，关系到系统的主要功能模块能否正常。<br>
		<br>  <big>High（高度重视）</big><br>
			即“高度重视”，表示有时间就要马上解决，否则系统偏离需求较大或预定功能不能正常实现。 <br>
		<br>  <big>Normal（正常）</big> <br>即“正常处理”，进入个人计划解决，表示问题不影响需求的实现，但是影响其他使用方面，比如页面调用出错，调用了错误的等。
		<br>
		<br>
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