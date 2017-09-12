<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>

<title>缺陷管理系统—用户注册</title>
<meta charset="utf-8">
<meta name="keywords" content="DMS缺陷管理系统" />
<meta name="description" content="DMS缺陷管理系统" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- 移动设备 viewport -->
<meta name="viewport"
	content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no,minimal-ui">
<meta name="author" content="admui.com">
<!-- 360浏览器默认使用Webkit内核 -->
<meta name="renderer" content="webkit">
<!-- 禁止百度SiteAPP转码 -->
<meta http-equiv="Cache-Control" content="no-siteapp">
<!-- Chrome浏览器添加桌面快捷方式（安卓） -->
<link rel="icon" type="image/png"
	href="http://demo.admui.com/public/images/favicon.png">
<meta name="mobile-web-app-capable" content="yes">
<!-- Safari浏览器添加到主屏幕（IOS） -->
<link rel="icon" sizes="192x192"
	href="http://demo.admui.com/public/images/apple-touch-icon.png">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="apple-mobile-web-app-title" content="Admui">
<!-- Win8标题栏及ICON图标 -->
<link rel="apple-touch-icon-precomposed"
	href="http://demo.admui.com/public/images/apple-touch-icon.png">
<meta name="msapplication-TileImage"
	content="http://demo.admui.com/public/images/app-icon72x72@2x.png">
<meta name="msapplication-TileColor" content="#62a8ea">
<!-- 样式 -->
<link rel="stylesheet"
	href="http://demo.admui.com/public/themes/classic/base/css/site.css"
	id="siteStyle">
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/sure_picture.js"></script>
<!--  <script type="text/javascript" src="https://git.oschina.net/oceanao/js/raw/master/sure_picture.js"></script> -->

<!--[if lte IE 9]>
<meta http-equiv="refresh" content="0; url='http://www.admui.com/ie/'" />
<![endif]-->
<!--[if lt IE 10]>
<script src="/public/vendor/media-match/media.match.min.js"></script>
<script src="/public/vendor/respond/respond.min.js"></script>
<![endif]-->

<!-- 自定义 -->
<link rel="stylesheet" href="http://demo.admui.com/public/css/login.css">
<!-- 插件 -->
<link rel="stylesheet"
	href="http://demo.admui.com/public/vendor/animsition/animsition.css">
<!-- 图标 -->
<link rel="stylesheet"
	href="http://demo.admui.com/public/fonts/web-icons/web-icons.css">
<link rel="stylesheet"
	href="http://demo.admui.com/public/fonts/font-awesome/font-awesome.css">
<!-- 插件 -->
<link rel="stylesheet"
	href="http://demo.admui.com/public/vendor/bootstrap-select/bootstrap-select.css">
<link rel="stylesheet"
	href="http://demo.admui.com/public/vendor/formvalidation/formValidation.css">
<script>if(window.top !== window.self){ window.top.location = window.location;}</script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/static/js/jquery-1.10.2.js"></script>

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
.msg onError{
color: red;
}
a:hover {
	text-decoration: underline;
}
</style>


<body class="page-login layout-full page-dark" onload="createCode()">

	<div class="page height-full">
		<div class="page-content height-full">
			<div
				class="page-brand-info vertical-align animation-slide-left hidden-xs">
				<div class="page-brand vertical-align-middle">

					<h2 class="hidden-sm">DMS缺陷管理系统</h2>
					<ul class="list-icons hidden-sm">
						<li><i class="wb-check" aria-hidden="true"></i> DMS(Defect
							Management System) 是一个基于最新 Web
							技术的企业级通用缺陷管理系统，可以帮助企业极大的提高测试效率，节省测试成本。</li>
						<li><i class="wb-check" aria-hidden="true"></i> 您可以
							用DMS，对缺陷进行实时查看，分配</li>
						<li><i class="wb-check" aria-hidden="true"></i> DMS
							融合开发，测试，项目经理，提供更多的交互。</li>
					</ul>
					<div class="hidden-sm">
						<a href="${pageContext.request.contextPath }/"
							class="btn btn-primary margin-right-5" target="_self"><i
							class="icon wb-home"></i> 返回首页</a> <a
							href="${pageContext.request.contextPath }/admin/login"
							class="btn btn-success dropdown-toggle" target="_self"><i
							class="icon wb-download"></i>管理员</a> <a href="javascript:;"
							class="btn btn-info open-kf"><i class="icon wb-user"></i>
							联系开发者</a>
					</div>
				</div>
			</div>
			<div class="page-login-main animation-fade">

				<div class="vertical-align">
					<div class="vertical-align-middle">
						<div class="brand visible-xs text-center">
							<img class="brand-img"
								src="${pageContext.request.contextPath }/img/logo.png"
								height="50" alt="D M S">
						</div>

						<form enctype="multipart/form-data" method="post"
							action="${pageContext.request.contextPath }/user/regist"
							onsubmit="return tosure()" class="login-form" id="loginForm">
							<h3 class="hidden-xs">注册 DMS账号</h3>
							<p class="hidden-xs">DMS 缺陷管理系统</p>
							<!-- <div class="form-group clearfix"> -->
							<div>
								<img align="center" id="imgPre" src="" width="100%" height="100%"
									height="100px" alt="点击上传用户头像" onclick="F_Open_dialog()"
									style="display: block;" />
								<div class="form-group">
									<label class="sr-only" for="username">用户名</label>
									<!--   <input type="text" class="form-control" id="username" name="student_num"  placeholder="请输入用户名"> -->
									<input type="text" class="form-control" id="number"
										name="student_num" placeholder="请输入账号" required="required" />
								</div>

								<div class="form-group">
									<input type="text" name="username" id="name"
										required="required" class="form-control" placeholder="用户昵称" />
								</div>


								<!-- <div align="left" class="form-group">
								<span class="form-control">选择用户头像：</span>
							</div> -->
								<div class="form-group">
									<input type="file" name="file" id="imgOne" 
										style="display: none" onchange="preImg(this.id,'imgPre');"
										class="form-control" />
								</div>


								<div class="form-group">
									<input type="password" id="password" class="form-control"
										required="required" placeholder="请输入密码" name="password" />
								</div>

								<div class="form-group">
									<input type="password" class="form-control" id="passwordform"
										name="passwordconfirm" required="required"
										placeholder="请重复输入密码" />
								</div>
							
							
									<div class="form-group">
										<input type="text" name="email" id="email" required="required"
											placeholder="请输入邮箱" class="form-control" />
									</div>

									<div class="form-group">
										<label class="sr-only" for="password">验证码</label>
										<div class="input-group">
											
											<input type="text" id="emailnumber" class="form-control"
												placeholder="请输入邮箱验证码" onchange="tosure()" /> <a
												class="input-group-addon padding-0 reload-vify"
												href="javascript:;">

												<div class="form-group">
													<table border="0" cellspacing="5" cellpadding="5">
														<tr>
															<td><div>

																	<input type="button" value="点击发送验证码" class="code"
																		onclick="sendCode(this)" />
																</div></td>
														</tr>
													</table>
												</div>
											</a>
										</div>
									</div>
									<div id="istrue">
								请输入验证码
									</div>


									<div class="form-group clearfix">
									<!-- 	<div
											class="checkbox-custom checkbox-inline checkbox-primary pull-left">
											<input type="checkbox" id="remember" name="remember">
											<label for="remember">自动登录</label>
										</div> -->
										<div class="pull-right">
											<a href="${pageContext.request.contextPath }/user/login"
												target="_self">直接登录</a> ·
										
										</div>
									</div>
									<!-- <div class="collapse" id="forgetPassword" aria-expanded="true">
										<div class="alert alert-warning alert-dismissible"
											role="alert">请返回官网点击登录按钮找回密码</div>
									</div> -->
									<input type="submit"
										class="btn btn-primary btn-block margin-top-30" value="立即注册">
						</form>
					</div>
				</div>
				<footer class="page-copyright">
				<p>缺陷管理系统 &copy; 敖海洋</p>
				</footer>
			</div>
		</div>
	</div>

	<script type="text/javascript">
 var number;
function tosure()
{
	
	 var emailnumber=document.getElementById("emailnumber").value;
	  if(number==emailnumber)
	  { 
		  //alert("验证码正确")
		  document.getElementById("istrue").innerHTML="验证码正确";
		  return true;
	  }
	  else
		  {
		 // alert("验证码错误，请重新输入")
		   document.getElementById("istrue").innerHTML="验证码错误";
		  return false;
		  }
}
var isemali=true;
function sure()
{
	   var a=document.getElementById("email").value;
	   
	   if($.trim(a) == "" || ($.trim(a) != "" && !/.+@.+\.[a-zA-Z]{2,4}$/.test($.trim(a)))){
          alert("请输入正确的E-Mail地址！");
    
       }
       else{
    	  
           $.ajax({
          　　　　 url:'${pageContext.request.contextPath }/user/emailnumber',  /*  //ajax传数据到后台 */
                  data:{
                      email: a
                  },
                  type:"post",
                  async:false,
                  dataType:"json",
                  success:function(data){
                	  number=data.number;
                  }
              }); 	
    	//alert(number);/* 获取验证码 */
    	alert("验证码已发送到"+a+"请查收，并输入验证码");
       }
}

var clock = '';
var nums = 60;
var btn;
function sendCode(thisBtn)
{ 
	 /* alert("hello"); */
sure();
btn = thisBtn;
btn.disabled = true; //将按钮置为不可点击
btn.value = nums+'秒后可重新获取';
clock = setInterval(doLoop, 1000); //一秒执行一次
}
function doLoop()
{
nums--;
if(nums > 0){
 btn.value = nums+'秒后可重新获取';
}else{
 clearInterval(clock); //清除js定时器
 btn.disabled = false;
 btn.value = '点击发送验证码';
 nums = 60; //重置时间
}
}
</script>

	<script type="text/javascript">
    $(document).ready(function(){
        //为表单的必填文本框添加提示信息（选择form中的所有后代input元素）
        $("form :input.required").each(function(){ 
            //创建元素
            var $required = $("<strong class='high'>*</strong>");
            //将它追加到文档中
            $(this).parent().append($required);
        });
        
        //为表单的必填文本框添加相关事件（blur、focus、keyup）
        $("form :input").blur(function(){
            //注意：这里的this是DOM对象，$(this)才是jQuery对象
            var $parent = $(this).parent();
            //删除之前的错误提醒信息
            $parent.find(".msg").remove();
            
            
            //验证“编号”
            if($(this).is("#number")){
                //运用jQuery中的$.trim()方法，去掉首位空格
                if($.trim(this.value) == ""){
                    var errorMsg = " 请输入6~10位！";
                    //class='msg onError' 中间的空格是层叠样式的格式
                    $parent.append("<span class='msg onError'>" + errorMsg + "</span>"); 
                }
                else if($.trim(this.value).length < 6)
                	{
                    var errorMsg = " 账号过短！";
                    //class='msg onError' 中间的空格是层叠样式的格式
                    $parent.append("<span class='msg onError'>" + errorMsg + "</span>"); 
                	}
                else if( $.trim(this.value).length > 10){
                    var errorMsg = " 账号过长！";
                    //class='msg onError' 中间的空格是层叠样式的格式
                    $parent.append("<span class='msg onError'>" + errorMsg + "</span>"); 
                }
                else{
                    var okMsg=" 输入正确";
                    $parent.find(".high").remove();
                    $parent.append("<span class='msg onSuccess'>" + okMsg + "</span>");
                }                
            }
            
            //验证“名称”
            if($(this).is("#name")){
                //运用jQuery中的$.trim()方法，去掉首位空格
                if($.trim(this.value) == "" || $.trim(this.value).length < 2){
                    var errorMsg = " 请输入至少2位的名称！";
                    //class='msg onError' 中间的空格是层叠样式的格式
                    $parent.append("<span class='msg onError'>" + errorMsg + "</span>"); 
                }
               /*  else{
                    var okMsg=" 输入正确";
                    $parent.find(".high").remove();
                    $parent.append("<span class='msg onSuccess'>" + okMsg + "</span>");
                }    */             
            }
            
            if($(this).is("#password")){
                //运用jQuery中的$.trim()方法，去掉首位空格
                if($.trim(this.value) == "" ){
                    var errorMsg = " 请输入6~20个字符！";
                    //class='msg onError' 中间的空格是层叠样式的格式
                    $parent.append("<span class='msg onError'>" + errorMsg + "</span>"); 
                }
                else if($.trim(this.value).length < 6)
                	{
                	  var errorMsg = " 密码过短！";
                      //class='msg onError' 中间的空格是层叠样式的格式
                      $parent.append("<span class='msg onError'>" + errorMsg + "</span>"); 
                	}
                else if($.trim(this.value).length  >20)
                {
                    var errorMsg = " 密码过长！";
                    //class='msg onError' 中间的空格是层叠样式的格式
                    $parent.append("<span class='msg onError'>" + errorMsg + "</span>"); 
                }
               else{
                 /*    var okMsg=" 输入正确";
                    $parent.find(".high").remove();
                    $parent.append("<span class='msg onSuccess'>" + okMsg + "</span>"); */
                    password=$.trim(this.value);
                }               
            }

            if($(this).is("#passwordform")){
            	
     
                if($.trim(this.value) == password )
                {
                	
                    var okMsg=" 输入正确";
                    $parent.find(".high").remove();
                    $parent.append("<span class='msg onSuccess'>" + okMsg + "</span>");
                }           
                else
                {
                    var errorMsg = " 两次密码不符！";
                    //class='msg onError' 中间的空格是层叠样式的格式
                    $parent.append("<span class='msg onError'>" + errorMsg + "</span>"); 
                }
            }
            
            
            if($(this).is("#telephone")){
                //运用jQuery中的$.trim()方法，去掉首位空格
                if($.trim(this.value) == "" || $.trim(this.value)!=""&&!(/^1[34578]\d{9}$/.test($.trim(this.value)))){
                    var errorMsg = " 请输入正确的手机号！";
                    //class='msg onError' 中间的空格是层叠样式的格式
                    $parent.append("<span class='msg onError'>" + errorMsg + "</span>"); 
                }
               /*  else{
                    var okMsg=" 输入正确";
                    $parent.find(".high").remove();
                    $parent.append("<span class='msg onSuccess'>" + okMsg + "</span>");
                }  */               
            }
            
            //验证邮箱
            if($(this).is("#email")){
                if($.trim(this.value) == "" || ($.trim(this.value) != "" && !/.+@.+\.[a-zA-Z]{2,4}$/.test($.trim(this.value)))){
                    var errorMsg = "请输入正确的E-Mail地址！";
                    $parent.append("<span class='msg onError'>" + errorMsg + "</span>");
                }
             /*    else{
                    var okMsg=" 输入正确";
                    $parent.find(".high").remove();
                    $parent.append("<span class='msg onSuccess'>" + okMsg + "</span>");
                } */
            }
        }).keyup(function(){
            //triggerHandler 防止事件执行完后，浏览器自动为标签获得焦点
            $(this).triggerHandler("blur");
        }).focus(function(){
            $(this).triggerHandler("blur");
        });
        //点击重置按钮时，触发文本框的失去焦点事件
        $("#send").click(function(){
            //trigger 事件执行完后，浏览器会为submit按钮获得焦点
            $("form .required:input").trigger("blur"); 
            var numError = $("form .onError").length;
            if(numError){
                return false;
            }
           alert("注册成功，密码已发到你的邮箱");
        });
    });
    </script>


</body>

</html>
