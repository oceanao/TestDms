<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="renderer" content="webkit">
<meta http-equiv="Cache-Control" content="no-siteapp" />
<title>缺陷管理系统</title>

<meta name="keywords" content="缺陷管理系统">
<meta name="description" content="缺陷管理系统">
<script
	src="${pageContext.request.contextPath}/static/js/jquery-1.8.3.min.js"></script>
<!--[if lt IE 8]>
    <meta http-equiv="refresh" content="0;ie.html" />
    <![endif]-->

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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="${pageContext.request.contextPath}/static/js/echarts.js"></script>
<script
	src="${pageContext.request.contextPath}/static/js/jquery-1.8.3.min.js"></script>


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
</head>
<body>

	<div class="com_top">
		<h2></h2>
		<p class="tuij_cas">
			<font size="3" color="white"> ${user.username} </font>
		</p>
		<dl>
			<dt>

				<img src="/pic/${user.picture}" />
			<dd>账号：${user.student_num}</dd>
			</dt>
		</dl>
	</div>
	<div class="uer_topnav">
		<ul>
			<li class="bain"><a
				href="/wxshop/index.php/home/user/order_list"> <span
					style="color: red;"> ${user.handlernumber}</span>处理缺陷数
			</a></li>
			<li class="bain"><a href="JavaScript:void(0)"><span
					style="color: red;">${user.hostnumber}</span>提交缺陷数</a></li>
			<li><a href="/wxshop/index.php/home/user/comment"><span
					style="color: red;">${user.signnumber}</span>签到天数</a></li>

		</ul>
	</div>
	<div class="Wallet">
		<a href="javascript:note();"><em class="Icon Icon10"></em>
			<dl>
				<dt>签到天数</dt>
				<dd>
					&nbsp; <font size="3" color="red"> ${user.signnumber}</font>
				</dd>
			</dl></a> <a href="javascript:note();"><em class="Icon Icon10"></em>
			<dl>
				<dt>获得分数</dt>
				<dd>
					&nbsp; <font size="3" color="red"> ${user.userscore}</font>
				</dd>
			</dl></a>
	</div>

	<div class="Wallet">
		<a href="javascript:note();"><em class="Icon Icon10"></em>
			<dl>
				<dt>个人邮箱</dt>
				<dd>
					&nbsp; <font size="3" color="black"> ${user.email}</font>
				</dd>
			</dl></a> <a href="javascript:note();"><em class="Icon Icon10"></em>
			<dl>
				<dt>联系电话</dt>
				<dd>
					&nbsp;<font size="3" color="black"> ${user.telephone}</font>
				</dd>
			</dl></a>
	</div>
	<div class="Wallet">
		<a href="javascript:note();"><em class="Icon Icon5"></em>
			<dl class="b">
				<dt>我的地址</dt>
				<dd>
					&nbsp; <font size="3" color="black"> ${user.useraddress}</font>
				</dd>
			</dl></a> <a
			href="${pageContext.request.contextPath }/Team/detailTeam?team_id=${user.team.team_id}"
			title="查看分组信息"><em class="Icon Icon7"></em>
			<dl class="b">
				<dt>我的分组</dt>
				<dd>
					&nbsp; <font size="3" color="blue"> ${user.team.team_name}</font>
				</dd>
			</dl></a>
	</div>

	<div class="Wallet">
		<a href="javascript:note();"><em class="Icon Icon5"></em>
			<dl class="b">
				<dt>个人简介</dt>
				<dd>
					&nbsp; <font size="3" color="black"> </font>
				</dd>
			</dl></a>
	</div>
	<div class="form-group">
		<textarea required="required"
			style="height: 300px; font-size: 20px; width: 100%"
			class="form-control">${user.message}</textarea>

	</div>



	</div>

	<style>

/*iphone鎵嬫満鐨刬nput鐨勬牱寮忛棶棰�*/
input[type="submit"], input[type="reset"], input[type="button"], button
	{
	-webkit-appearance: none;
}
/*css鍒濆鍊�*/
html, body, div, p, ul, li, dl, dt, dd, h1, h2, h3, h4, h5, h6, form,
	input, select, button, textarea, iframe, table, th, td {
	margin: 0;
	padding: 0;
	list-style-type: none;
}

body {
	margin: 0 auto;
	font-size: 14px;
	line-height: 180%;
	color: #000000;
	padding: 0px;
	min-width: 300px;
	max-width: 100%;
}

img {
	border: 0px
}

a:link {
	font-size: 14javascript:note(); px;
	color: #000000;
	text-decoration: none;
}

a:visited {
	font-size: 14px;
	color: #000000;
	text-decoration: none;
}

a:hover {
	font-size: 14px;
	color: #E24615;
	text-decoration: none;
}

input[type=number] {
	-moz-appearance: textfield;
}

input[type=number]::-webkit-inner-spin-button, input[type=number]::-webkit-outer-spin-button
	{
	-webkit-appearance: none;
}

.main {
	width: 100%;
	overflow: hidden;
	margin: 0;
	padding: 0;
}

table {
	border-collapse: collapse;
	border-spacing: 0;
	empty-cells: show;
	font-size: 14px
}

fieldset, img {
	border: 0
}

cite, em, s, i, b {
	font-style: normal
}

input, button, textarea, select {
	font-size: 14px;
}

body, input, button, textarea, select, option {
	font-size: normal
}

a, input, textarea {
	text-decoration: none;
	outline: 0
}

li, img, label, input {
	vertical-align: middle
}

var {
	font-style: normal
}

ins {
	text-decoration: none
}

body {
	font-size: 20px
}

.black {
	width: 100%;
	height: 5px;
	background: #F2F2F2;
}

${
pageContext




.request




.contextPath




}


.menu1, .menu2, .menu3, .menu4, #show_more {
	background: url(../images/pub_goods.png) no-repeat;
	background-size: auto 200px;
}

.dingdan_1, .dingdan_2, .dingdan_3, .dingdan_4 {
	background: url(../images/pub_main.png) no-repeat;
	background-size: auto 450px;
}

.vf_1, .vf_2, .vf_3, .vf_4, .vf_5 {
	background: url(../images/pub_main.png) no-repeat;
	background-size: auto 400px;
}

.header {
	width: 100%;
	height: 45px;
	background: #F6F6F6;
	top: 0;
	z-index: 9999;
	border: 0;
	border-bottom: 1px solid #CCC
}

.h-left {
	float: left;
	width: 15%;
	height: 45px;
}

.h-left a {
	display: block;
	width: 45px;
	height: 45px;
	margin: auto;
	background: url(../images/category/arrow_left.png) no-repeat 15px center;
	background-size: auto 16px;
}

.h-right {
	float: left;
	width: 15%;
	height: 45px;
}

.h-mid {
	width: 70%;
	height: 45px;
	float: left;
	text-align: center;
	color: #333;
	font-size: 16px;
	line-height: 45px;
	position: relative;
	font-family: "寰蒋闆呴粦", "瀹嬩綋", Arial, Helvetica, sans-serif;
}



.top_bar {
	float: right;
	display: block;
	margin-right: 8px;
	width: 40px;
	height: 40px;
	float: right;
}

#show_more {
	width: 30px;
	height: 20px;
	float: right;
	background-position: 0 -110px;
	margin-left: 10px;
	margin-top: 10px;
}

.goods_nav {
	width: 30%;
	float: right;
	right: 5px;
	overflow: hidden;
	position: fixed;
	margin-top: -20px;
	z-index: 9999999
}

.footer {
	background-color: #F8F8F8;
	text-align: center;
	width: 100%;
	overflow: hidden;
	padding-bottom: 10px;
	padding-top: 10px;
}

.footer a {
	display: inline-block; /*padding: 0 1em*/
}

.footer span {
	color: #82858A;
}

.footer .tip {
	padding: 0 0 1.5em
}

.footer .tip span {
	font-size: 1.2em
}

.footer .links {
	width: 75%;
	margin: 0 auto;
	background: none
}

.footer .links a {
	border-right: 1px solid #dcdcdc;
	height: 20px;
	line-height: 20px;
	font-size: 14px;
	padding-left: 10px;
	padding-right: 10px;
}

.footer .links a:last-child {
	border-right: 0 none
}

.footer .linkss {
	width: 65%;
	margin: 0 auto;
	height: 70px;
	margin-top: 10px;
}

.footer .linkss li {
	width: 33.3%;
	float: left;
	text-align: center;
	height: 70px;
	font-size: 10px;
}

.footer .linkss li a i {
	display: block;
	width: 40px;
	height: 40px;
	margin: auto;
}

.footerimg_1, .footerimg_2, .footerimg_3 {
	background: url(../images/pub_footer.png) no-repeat;
	background-size: auto 170px;
}

.footerimg_1 {
	background-position: 0 0
}

.footerimg_2 {
	background-position: 0 -60px;
}

.footerimg_3 {
	background-position: 0 -124px;
}

.footer .gl {
	color: #c30e0e
}

.footer p {
	text-align: center;
	line-height: 20px;
}

.mf_o4 {
	color: #a2a2a2;
	font-size: 10px;
}

.user_com {
	width: 100%;
	overflow: hidden;
	background: #F5F5F5
}

.com_top {
	width: 100%;
	height: 20%;
	background: #EC8816
		url('${pageContext.request.contextPath}/img/timg.jpg') center bottom;
	position: relative;
	z-index: 9999
}

.com_top h2 {
	width: 100%;
	height: 40px;
}

.com_top h2 a {
	width: 50px;
	display: block;
	background-color: rgba(28, 27, 26, 0.6);
	font-size: 14px;
	line-height: 30px;
	color: #FFF;
	margin-top: 8px;
	float: right;
	margin-right: 10px;
	-webkit-border-radius: 10px;
	-moz-border-radius: 10px;
	border-radius: 20px;
	text-align: center;
	font-weight: normal
}

.com_top dl {
	width: 100%;
	margin: auto;
	position: absolute;
	bottom: -45px;
	z-index: 99999;
}

.com_top dl dt {
	width: 100%;
}

.com_top dl dt img {
	display: block;
	width: 120px;
	height: 120px;
	margin-left: 15px;
	-webkit-border-radius: 50%;
	-moz-border-radius: 50%;
	border-radius: 50%;
	float: left
}

.com_top dl dt span {
	display: block;
	float: left;
	text-indent: 10px;
	font-size: 18px;
	color: #FFF;
}

.com_top dl dd {
	float: right;
	font-size: 14px;
	color: #fff;
	text-align: right;
	padding-right: 10px;
	margin-left: -10px;
}

.uer_topnav {
	width: 100%;
	height: 60px;
	background: #FFF;
	border-bottom: 1px solid #dddcdc
}

.uer_topnav ul {
	width: 70%;
	height: 40px;
	padding-top: 10px;
	float: right
}

.uer_topnav ul li {
	width: 33%;
	float: left;
	line-height: 20px;
	color: #666;
	text-align: center
}

.uer_topnav ul li a {
	display: block;
	width: 100%;
	overflow: hidden;
	font-size: 12px;
}

.uer_topnav ul li span {
	display: block;
	width: 100%;
	height: 20px;
	font-size: 16px;
	line-height: 20px;
	color: #666
}

.bain {
	border-right: 1px solid #eeeeee;
}

.Wallet {
	width: 100%;
	background: #FFF;
	overflow: hidden;
	border-bottom: 1px solid #dddcdc;
	margin-top: 10px;
	position: relative
}

.Wallet a {
	margin-left: 10px;
	height: 45px;
	display: block;
	width: 100%;
	overflow: hidden;
	padding-bottom: 1px
}

.Wallet a dl {
	width: 100%;
	margin-left: 35px;
	overflow: hidden;
}

.Wallet a dl dt {
	float: left;
	font-size: 16px;
	line-height: 45px;
	color: #666;
}

.Wallet a dl dd {
	float: right;
	background: url(../images/arrow_right.png) no-repeat right center;
	color: #aaaaaa;
	background-size: auto 12px;
	margin-right: 60px;
	padding-right: 20px
}

.Wallet a dl dd {
	font-size: 12px;
	line-height: 45px;
	color: #aaaaaa;
}

.b {
	border-bottom: 1px solid #eeeeee
}

.show_million {
	display: none;
}

.endorse_hend {
	background: white;
	padding: 4px 0;
	font-size: 14px;
}

.endorse_hend p {
	text-align: center;
}

.endorse_dyr {
	padding: 16px 16px;
}

.endorse_dyr form {
	text-align: center;
	width: 100%;
}

.endorse_dyr input[type=button] {
	-webkit-appearance: none;
}

.endorse_dyr input {
	vertical-align: middle;
}

.endorse_dyr .endor_text {
	line-height: 24px;
	padding: 2px 10px;
	width: 70%;
	border: 1px solid #dedede;
	border-radius: 4px;
}

.endorse_dyr .endor_but {
	background-color: white;
	border: 1px solid #dedede;
	padding: 2px 10px;
	line-height: 24px;
	border-radius: 4px;
	width: 20%;
}

.hend_endor, .sec_endor, .stay_endor {
	display: inline-block;
	vertical-align: middle;
	font-size: 12px;
	line-height: 1.2;
	color: #747477;
}

.hend_endor {
	margin-right: 4px;
}

.sec_endor {
	width: 70%;
}

.tuij_cas {
	color: white;
	text-align: center;
	font-size: 16px;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
	width: 80%;
	margin: 0 auto;
	line-height: 26px
}

.mt20 {
	margin-top: 20px;
}

.endorse_num {
	padding: 20px 12px;
	background: white;
	border-bottom: 1px solid #FAF0F0;
	position: relative;
}

.endorse_num:last-child {
	border: 0;
}

.bg_gray {
	background: #F8F8F8;
}

.percent_hund {
	width: 72%;
}

.sec_endor p { /*width: 106px*/;
	display: block;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}

.stay_endor a {
	margin-left: 0;
	display: block;
	padding: 0px 4px;
	background: white;
	border: 2px solid orangered;
	line-height: 24px;
	height: 24px;
	border-radius: 6px;
	text-align: center;
}

.stay_endor {
	vertical-align: bottom;
	position: absolute;
	right: 24px;
	bottom: 20px;
}

.tx_cash span {
	display: block;
	float: left;
	width: 24%;
	text-align: right;
	font-size: 12px;
}

.tx_cash input[type=text] {
	height: 24px;
	padding: 2px 10px;
	width: 60%;
	border: 1px solid #dedede;
	border-radius: 4px;
	float: left;
	margin-top: 5px;
}

.tx_cash img {
	border: 0;
}

.tx_cash:after {
	content: '';
	clear: both;
	display: block;
}

.cash_num {
	padding: 16px 16px;
	font-size: 16px;
	text-align: center;
}

.cash_num p {
	padding-bottom: 20px;
}

#cash_submit {
	background: white;
	border: 1px solid #dedede;
	border-radius: 4px;
	text-align: center;
	display: initial;
	margin-left: 0;
	height: 24px;
	padding: 4px 60px
}

.cash_num table {
	margin-bottom: 20px;
}

.bb1 {
	border-bottom: 1px solid #dedede;
}

.cash_num table tr {
	border-bottom: 1px solid #dedede;
}

.cash_num table tr th, .cash_num table tr td {
	text-align: center;
}
</style>

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
</body>
</html>