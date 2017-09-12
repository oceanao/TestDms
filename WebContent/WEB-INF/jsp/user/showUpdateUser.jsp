<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改用户</title>
<link href="${pageContext.request.contextPath }/static/css/admin.css"
	type="text/css" rel="stylesheet" />
</head>
<body>

	<div style="position:absolute; left: 400px;">
	<br><br><br><br>
	   
		<form enctype="multipart/form-data" method="post" action="${pageContext.request.contextPath }/updateuser" >
			<!-- 隐藏表单，flag表示添加标记 -->
			<input type="hidden" name="flag" value="2">
			<div  >
				<input type="hidden" name="user_id" value="${user_id }">
				编号：<input type="text" name="student_num" id="student_num" size="20"
					value="${student_num}"
					style="width: 200px; height: 40px; font-size: 18px;" />
			</div>
			<br>
			<div >
				姓名：<input type="text" name="username" id="username" size="20"
					value="${username }"
					style="width: 200px; height: 40px; font-size: 18px;" />
			</div>
			<br>
			<br>
			<div  >
				密码：<input type="text" name="password" id="password" size="20"
					value="${user.password }"
					style="width: 200px; height: 40px; font-size: 18px;" />
			</div>
			<br>
			<div>
				金币：<input type="text" name="money" id="money" size="20"
					value="${money }"
					style="width: 200px; height: 40px; font-size: 18px;" />
			</div>
			<br>
			<div  >
				积分：<input type="text" name="userscore" id="score" size="20"
					value="${userscore }"
					style="width: 200px; height: 40px; font-size: 18px;" />
			</div>
			<br>
			<div >
				地址：<input type="text" name="useraddress" id="score" size="20"
					value="${useraddress }"
					style="width: 200px; height: 40px; font-size: 18px;" />
			</div>
	
			<br>
			<div >
				方式：<input type="text" name="telephone" id="score" size="20"
					value="${telephone }"
					style="width: 200px; height: 40px; font-size: 18px;" />
			</div>
			<br>
			<div  >
				<input type="submit" value="修改 " style="width: 100px; height: 30px;">
				&nbsp;&nbsp;&nbsp; <input type="reset" value="取消 "
					style="width: 100px; height: 30px;">
			</div>
	</div>
		<style>
img {
	width: 300px;
	height: 300px;
}

.nav {
	position: fixed;
	height: 80px;
	bottom: 0;
	width: 100%;
	background-color: white;
	text-align: center;
}
</style>
	<div class="nav">
		<div align="center">
			<%@ include file="common.jsp"%>
		</div>
	</div>

</body>
</html> --%>
<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改用户</title>
<link href="${pageContext.request.contextPath }/static/css/admin.css"
	type="text/css" rel="stylesheet" />
</head>
<body>
	<div style="position:absolute; left: 400px;">
	<br><br><br><br>
	   
		<form action="${pageContext.request.contextPath }/admin/updateuser"
			id="userForm" method="post">
			<!-- 隐藏表单，flag表示添加标记 -->
			<input type="hidden" name="flag" value="2">
			<div  >
				<input type="hidden" name="user_id" value="${user.user_id }">
				编号：<input type="text" name="student_num" id="student_num" size="20"
					value="${user.student_num}"
					style="width: 200px; height: 40px; font-size: 18px;" />
			</div>
			<br>
			<div  >
				姓名：<input type="text" name="username" id="username" size="20"
					value="${user.username }"
					style="width: 200px; height: 40px; font-size: 18px;" />
			</div>
			<br>
			<div  >
				角色： <select id="role" name="role"
					style="width: 200px; height: 40px; font-size: 18px;">

					<c:choose>
						<c:when test="${user.role==1 }">
							<option value="1" selected="selected">普通用户</option>
							<option value="2">VIP用户</option>
						</c:when>
						<c:otherwise>
							<option value="1">普通用户</option>
							<option value="2" selected="selected">VIP用户</option>
						</c:otherwise>
					</c:choose>
				</select> &nbsp;&nbsp;
			</div>
			<br>
			<div  >
				密码：<input type="text" name="password" id="password" size="20"
					value="${user.password }"
					style="width: 200px; height: 40px; font-size: 18px;" />
			</div>
			<br>
			<div  >
				金币：<input type="text" name="money" id="money" size="20"
					value="${user.money }"
					style="width: 200px; height: 40px; font-size: 18px;" />
			</div>
			<br>
			<div  >
				积分：<input type="text" name="userscore" id="score" size="20"
					value="${user.userscore }"
					style="width: 200px; height: 40px; font-size: 18px;" />
			</div>
			<br>

			<div>
			<img src="/pic/${user.useraddress}" style="width: 200px;height: 200px;"/>
			</div>
			<br>
			<div  >
				方式：<input type="text" name="telephone" id="score" size="20"
					value="${user.telephone }"
					style="width: 200px; height: 40px; font-size: 18px;" />
			</div>
			<br>
			<div  >
				<input type="submit" value="修改 " style="width: 100px; height: 30px;">
				&nbsp;&nbsp;&nbsp; <input type="reset" value="取消 "
					style="width: 100px; height: 30px;">
			</div>
	</div>

</body>
</html> --%>


<%-- <%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加用户</title>
<link href="${pageContext.request.contextPath }/static/css/admin.css"
	type="text/css" rel="stylesheet" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/jquery-easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/jquery-easyui/themes/icon.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/jquery-easyui/themes/color.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/jquery-easyui/demo/demo.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath }/jquery-easyui/jquery.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/jquery-easyui/jquery.easyui.min.js"></script>
</head>
<body>
	<h2 align="center">添加用户</h2>
	<h3>
		当前位置：<a href="#"
			target="iFrame1 ">管理员</a> / <a
			href="${pageContext.request.contextPath }/user/addUser?flag=1"
			target="iFrame1 ">添加用户</a>
	</h3>
	<br>
	<br>
	<br>
	<div align="center">${sessionScope.usermsg}</div>
	<form action="${pageContext.request.contextPath }/user/addUser"
		id="userForm" method="post">
		<!-- 隐藏表单，flag表示添加标记 -->
		<input type="hidden" name="flag" value="2">
		<div align="center">
			账号： <input type="text" name="student_num" id="student_num" size="20"
				style="width: 200px; height: 40px; font-size: 18px;"
				required="required"   />
		</div>
		<br> 
		<div align="center">
			姓名：<input type="text" name="username" id="username" size="20"
				required="required" onkeyup="javascript:chkmaxsms(this,'12')"
			  style="width: 200px; height: 40px; font-size: 18px;" />
		</div>
		<br> 
		<div align="center">
			密码：<input type="password" name="password" id="password" size="20"
				required="required"   
				style="width: 200px; height: 40px; font-size: 18px;"  onclick="password1()"/>
		</div>
		<br> 
		<div align="center">
			等级： <select id="role" name="role"
				style="width: 200px; height: 30px; font-size: 18px;"
				required="required"  >

				<option value="1">普通用户</option>
				<option value="2">VIP用户</option>
			</select>
		</div>
		<br>
			<div align="center">
									金币：<input type="text"
											name="money" id="money" size="20"
										    style="width: 200px; height: 40px; font-size: 18px;" />
								</div>
								<br>
												<div align="center">
									积分：<input type="text"
											name="userscore" id="score" size="20"
						                    style="width: 200px; height: 40px; font-size: 18px;" />
								</div>
								<br>
								
								<div align="center">
									地址：<input type="text"
											name="useraddress" id="score" size="20"
											style="width: 200px; height: 40px; font-size: 18px;" />
								</div>
								<br>
												<div align="center">
									方式：<input type="text"
											name="telephone" id="score" size="20"
										 style="width: 200px; height: 40px; font-size: 18px;" />
								</div>
								<br>
		<br> <br>
		<div align="center">
			&nbsp;&nbsp;&nbsp;&nbsp; <input type="submit" value="添加"
				onclick="inhit()" style="width: 100px; height: 30px;">
			&nbsp;&nbsp;&nbsp;&nbsp; <input type="reset" value="取消 "
				style="width: 100px; height: 30px;">
		</div>
	</form>


	<!--  输入框字数限制-->
	<script language="javascript" type="text/javascript">
		function chkmaxsms(vobj1, vmax) {
			var str = vobj1.value;
			var strlen = str.length;

			if (strlen > vmax) {
				alert('摘要字数超过限制');
				eval_r(vobj1.value = str.substr(0, vmax));
			}
		}
	</script>
	<script type="text/javascript">
	function inhit()
	{
	var a=document.getElementById("role").value;  
	if(a==0) 
	{
		alert("未选择角色，请选择角色"); 
		self.location='jb51.htm'; 
	}
	}
	function  num()
	{
		var a=document.getElementById("student_num").value;  
		if(isNaN(a))
			alert(" 请输入数字")
			else
		if(a.length<8||a.length>10||a.length==9)
			alert(" 账号 请输入8位或者10位数字")
	}
	 function  password1()
	{ 
		var x=document.getElementById("password").value;  
		if(x.length<6||x.length>20)
			alert("密码长度为6--20位")
	}
	</script>

</body>
</html>

 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>注册</title>
<link href="${pageContext.request.contextPath }/static/css/user.css"
	type="text/css" rel="stylesheet" /> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="${pageContext.request.contextPath }/static/js/frame.js"></script>
 <link href="${pageContext.request.contextPath }/static/css/regist.css"
	type="text/css" rel="stylesheet" />
	
    <style type="text/css">
     .int{ height: 30px; text-align: left; width: 600px; }
     label{ width: 200px; margin-left: 20px; }
     .high{ color: red; }
     .msg{ font-size: 13px; }
     .onError{ color: red; }
     .onSuccess{ color: green; }
    </style>
    <script type="text/javascript" src="${pageContext.request.contextPath }/static/js/jquery-1.10.2.js"></script> 
</head>

<body>

<div align="left">

<!-- <div id="header"><img src="images/register_logo.gif" alt="logo"/></div> -->
<div id="main" style="position: absolute;left: 288px;">
 <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td class="bg bg_top_left"></td>
    <td class="bg_top"></td>
    <td class="bg bg_top_right"></td>
  </tr>
  <tr>
    <td class="bg_left"></td>
    <td class="content">
 <form action="${pageContext.request.contextPath }/admin/adduser"
		id="userForm" method="post">
		<a href="javascript:history.go(-1)">返回上一页</a> 
		<!-- 隐藏表单，flag表示添加标记 -->
		<input type="hidden" name="flag" value="2">
		<dl><h2 align="center">添加用户</h2></dl>
        <dl>
          <dt>用户账号 :</dt>
          <dd><input type="text" id="number" class="inputs userWidth"   name="student_num"  
          style="width: 300px;height: 40px;" required="required" /></dd>
      
        </dl>
        <br>            <br>
         <dl>
          <dt>用户姓名：</dt>
          <dd>
        <input type="text" name="username" id="name" required="required" 
				 style="width: 300px;height: 40px;"	size="20"   />
					</dd>
					</dl>
				<br>    <br>    
         <dl>
          <dt>登录密码：</dt>
          <dd>
          <input type="password"  id="password" class="inputs" required="required" 
           style="width: 300px;height: 40px;" name="password"   /></dd>

        </dl>
        <br> <br>
      <dl>
          <dt>用户等级：</dt>
          <dd> <select id="role" name="role"
				style="width: 300px; height: 40px; font-size: 18px;"
				required="required"  >

				<option value="1">普通用户</option>
				<option value="2">VIP用户</option>
			</select>
		</dd>
		</dl>
       <br>    <br>    
       <dl>
          <dt>用户地址：</dt>
          <dd>
        <input type="text" name="useraddress" id="useraddress" required="required" 
				 style="width: 300px;height: 40px;"	size="20"  />
					</dd>
					</dl>
		<br>    <br> 
       <dl>
          <dt>联系方式：</dt>
          <dd>
        <input type="text" name="telephone" id="telephone" required="required" 
				 style="width: 300px;height: 40px;"	size="20" />
					</dd>
					</dl>
		<br>    <br>   
		  <dl>
          <dt>邮箱：</dt>
          <dd>
        <input type="text" name="email" id="email" required="required" 
				 style="width: 300px;height: 40px;"	size="20" />
					</dd>
					</dl>
		<br>    <br>  
		  <dl>
          <dt>用户信息：</dt>
          <dd>
        <input type="text" name="message" id="telephone" required="required" 
				 style="width: 300px;height: 40px;"	size="20" />
					</dd>
					</dl>
		<br>    <br>  
		  <dl>
          <dt>用户图片：</dt>
          <dd>
        <input type="text" name="picture" id="telephone" required="required" 
				 style="width: 300px;height: 40px;"	size="20" />
					</dd>
					</dl>
		<br>    <br>  
		<!--        <dl>
          <dt>用户积分：</dt>
          <dd>
        <input type="text" name="userscore" id="userscore" required="required" 
				 style="width: 300px;height: 40px;"	size="20" />
					</dd>
					</dl>
		<br>    <br> 
		       <dl>
          <dt>用户金币：</dt>
          <dd>
        <input type="text" name="money" id="money" required="required" 
				 style="width: 300px;height: 40px;"	size="20" />
					</dd>
					</dl> -->
					
		<br>    <br>        
        <br>    <br>    
        <dl>
          <dt></dt>
          	<input id="send" type="submit" value="添加"  style="width: 200px;height: 40px;">
                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
             <input   type="reset" value="取消"  style="width: 200px;height: 40px;">
         
        </dl>
 
      </form>
    </td>
    <td class="bg_right"></td>
  </tr>
  <tr>
     <td class="bg bg_end_left"></td>
    <td class="bg_end"></td>
    <td class="bg bg_end_right"></td>
  </tr>
</table>
</div>
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
                else{
                    var okMsg=" 输入正确";
                    $parent.find(".high").remove();
                    $parent.append("<span class='msg onSuccess'>" + okMsg + "</span>");
                }                
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
                    var okMsg=" 输入正确";
                    $parent.find(".high").remove();
                    $parent.append("<span class='msg onSuccess'>" + okMsg + "</span>");
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
                else{
                    var okMsg=" 输入正确";
                    $parent.find(".high").remove();
                    $parent.append("<span class='msg onSuccess'>" + okMsg + "</span>");
                }                
            }
            
            //验证邮箱
            if($(this).is("#email")){
                if($.trim(this.value) == "" || ($.trim(this.value) != "" && !/.+@.+\.[a-zA-Z]{2,4}$/.test($.trim(this.value)))){
                    var errorMsg = "请输入正确的E-Mail地址！";
                    $parent.append("<span class='msg onError'>" + errorMsg + "</span>");
                }
                else{
                    var okMsg=" 输入正确";
                    $parent.find(".high").remove();
                    $parent.append("<span class='msg onSuccess'>" + okMsg + "</span>");
                }
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
        });
    });
    </script>
    </body>
</html>  --%>


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
	<!--   <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>jQuery Validate 简介</h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                            <a class="dropdown-toggle" data-toggle="dropdown" href="tabs_panels.html#" tppabs="http://www.zi-han.net/theme/hplus/tabs_panels.html#">
                                <i class="fa fa-wrench"></i>
                            </a>
                            <ul class="dropdown-menu dropdown-user">
                                <li><a href="tabs_panels.html#" tppabs="http://www.zi-han.net/theme/hplus/tabs_panels.html#">选项1</a>
                                </li>
                                <li><a href="tabs_panels.html#" tppabs="http://www.zi-han.net/theme/hplus/tabs_panels.html#">选项2</a>
                                </li>
                            </ul>
                            <a class="close-link">
                                <i class="fa fa-times"></i>
                            </a>
                        </div>
                    </div>
                    <div class="ibox-content">
                        <p>jquery.validate.js 是一款优秀的jQuery表单验证插件。它具有如下特点：</p>
                        <ul>
                            <li>安装简单</li>
                            <li>内置超过20种数据验证方法</li>
                            <li>直列错误提示信息</li>
                            <li>可扩展的数据验证方法</li>
                            <li>使用内置的元数据或插件选项来指定您的验证规则</li>
                            <li>优雅的交互设计</li>
                        </ul>
                        <p>官网：<a href="javascript:if(confirm('http://jqueryvalidation.org/  \n\n���ļ��޷��� Teleport Ultra ����, ��Ϊ ����һ�����·���ⲿ������Ϊ������ʼ��ַ�ĵ�ַ��  \n\n�����ڷ������ϴ���?'))window.location='http://jqueryvalidation.org/'" tppabs="http://jqueryvalidation.org/" target="_blank">http://jqueryvalidation.org/</a>
                        </p>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-6">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>简单示例</h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                            <a class="dropdown-toggle" data-toggle="dropdown" href="form_basic.html#" tppabs="http://www.zi-han.net/theme/hplus/form_basic.html#">
                                <i class="fa fa-wrench"></i>
                            </a>
                            <ul class="dropdown-menu dropdown-user">
                                <li><a href="form_basic.html#" tppabs="http://www.zi-han.net/theme/hplus/form_basic.html#">选项1</a>
                                </li>
                                <li><a href="form_basic.html#" tppabs="http://www.zi-han.net/theme/hplus/form_basic.html#">选项2</a>
                                </li>
                            </ul>
                            <a class="close-link">
                                <i class="fa fa-times"></i>
                            </a>
                        </div>
                    </div> -->
	<%--           <div class="ibox-content">
                        <form class="form-horizontal m-t" id="commentForm" action="${pageContext.request.contextPath }/admin/adduser">
                            <div class="form-group">
                                <label class="col-sm-3 control-label">姓名：</label>
                                <div class="col-sm-8">
                                    <input id="cname" name="name" minlength="2" type="text" class="form-control" required="" aria-required="true">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">E-mail：</label>
                                <div class="col-sm-8">
                                    <input id="cemail" type="email" class="form-control" name="email" required="" aria-required="true">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">网站：</label>
                                <div class="col-sm-8">
                                    <input id="curl" type="url" class="form-control" name="url">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">说明：</label>
                                <div class="col-sm-8">
                                    <textarea id="ccomment" name="comment" class="form-control" required="" aria-required="true"></textarea>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-4 col-sm-offset-3">
                                    <button class="btn btn-primary" type="submit">提交</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="ibox float-e-margins">
                    <div class="ibox-content">
                        <p class="m-t">更多示例请访问官方示例页面：<a href="javascript:if(confirm('http://jqueryvalidation.org/files/demo/  \n\n���ļ��޷��� Teleport Ultra ����, ��Ϊ ����һ�����·���ⲿ������Ϊ������ʼ��ַ�ĵ�ַ��  \n\n�����ڷ������ϴ���?'))window.location='http://jqueryvalidation.org/files/demo/'" tppabs="http://jqueryvalidation.org/files/demo/" target="_blank">查看</a>
                        </p>
                        <p>中文API可参考：<a href="javascript:if(confirm('http://www.w3cschool.cc/jquery/jquery-plugin-validate.html  \n\n���ļ��޷��� Teleport Ultra ����, ��Ϊ ����һ�����·���ⲿ������Ϊ������ʼ��ַ�ĵ�ַ��  \n\n�����ڷ������ϴ���?'))window.location='http://www.w3cschool.cc/jquery/jquery-plugin-validate.html'" tppabs="http://www.w3cschool.cc/jquery/jquery-plugin-validate.html" target="_blank">http://www.w3cschool.cc/jquery/jquery-plugin-validate.html</a>
                        </p>
                    </div>
                </div>
            </div>
            <div class="col-sm-6">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>完整验证表单</h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                            <a class="dropdown-toggle" data-toggle="dropdown" href="form_basic.html#" tppabs="http://www.zi-han.net/theme/hplus/form_basic.html#">
                                <i class="fa fa-wrench"></i>
                            </a>
                            <ul class="dropdown-menu dropdown-user">
                                <li><a href="form_basic.html#" tppabs="http://www.zi-han.net/theme/hplus/form_basic.html#">选项1</a>
                                </li>
                                <li><a href="form_basic.html#" tppabs="http://www.zi-han.net/theme/hplus/form_basic.html#">选项2</a>
                                </li>
                            </ul>
                            <a class="close-link">
                                <i class="fa fa-times"></i>
                            </a>
                        </div>
                    </div> --%>

	<div class="ibox-content">
		<form class="form-horizontal m-t" id="signupForm"
			action="${pageContext.request.contextPath }/updateuser"
			target="_self" method="post">
			<input type="hidden" name="flag" value="2"> <input
				type="hidden" name="user_id" value="${user.user_id }">
			<div class="form-group">
				<label class="col-sm-3 control-label">账号：</label>
				<div class="col-sm-8">
					<input id="firstname" name="student_num" class="form-control" disabled="disabled"
						type="text" value="${user.student_num}" aria-required="true"
						aria-invalid="true" class="error"> <span
						class="help-block m-b-none"><i class="fa fa-info-circle"></i></span>
				</div>
			</div>
			<!--  <div class="form-group">
                                <label class="col-sm-3 control-label">姓名：</label>
                                <div class="col-sm-8">
                                    <input id="lastname" name="username" class="form-control" type="text" aria-required="true" aria-invalid="false" class="valid">
                                </div>
                            </div> -->
			<div class="form-group">
				<label class="col-sm-3 control-label">用户名：</label>
				<div class="col-sm-8">
					<input id="username" name="username" class="form-control" 
						type="text" aria-required="true" aria-invalid="true"
						value="${user.username }" class="error">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label">密码：</label>
				<div class="col-sm-8">
					<input id="password" name="password" class="form-control"
						type="password" value="${user.password}">
				</div>
			</div>
		
			<div class="form-group">
				<label class="col-sm-3 control-label">E-mail：</label>
				<div class="col-sm-8">
					<input id="email" name="email" class="form-control" type="email"
						value="${user.email}">
				</div>
			</div>


			<div class="form-group">
				<label class="col-sm-3 control-label">telephone：</label>
				<div class="col-sm-8">
					<input type="text" class="form-control" name="telephone"
						id="telephone" required="required" value="${user.telephone }" />

				</div>
			</div>


			
			<div class="form-group">
				<label class="col-sm-3 control-label">地址</label>
				<div class="col-sm-8">
					<input id="useraddress" name="useraddress" class="form-control" 
						value="${user.useraddress}">
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-3 control-label">个人简介</label>
				<div class="col-sm-8">
					<textarea  id="message" name="message" style="height: 200px;" class="form-control"  >${user.message}</textarea>
					
				</div>
			</div>
			
			
			
			
			<%-- <div class="form-group">
				<label class="col-sm-3 control-label">money：</label>
				<div class="col-sm-8">
					<input type="text" class="form-control" name="money"
						id="telephone" required="required" value="${user.money }" />

				</div>
			</div> --%>

			<!--   <div class="form-group">
                                <div class="col-sm-8 col-sm-offset-3">
                                    <div class="checkbox">
                                        <label>
                                            <input type="checkbox" class="checkbox" id="agree" name="agree"> 我已经认真阅读并同意《H+使用协议》
                                        </label>
                                    </div>
                                </div>
                            </div> -->
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
