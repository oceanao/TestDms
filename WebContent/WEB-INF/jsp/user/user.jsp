<%-- <%-- 
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
<script type="text/javascript"
	src="${pageContext.request.contextPath }/static/js/frame.js"></script>
<link href="${pageContext.request.contextPath }/static/css/regist.css"
	type="text/css" rel="stylesheet" />

<style type="text/css">
.int {
	height: 30px;
	text-align: left;
	width: 600px;
}

label {
	width: 200px;
	margin-left: 20px;
}

.high {
	color: red;
}

.msg {
	font-size: 13px;
}

.onError {
	color: red;
}

.onSuccess {
	color: green;
}
</style>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/static/js/jquery-1.10.2.js"></script>
</head>

<body>



</body>
</html>
 --%>
 
 
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>密码找回</title>
    <meta name="keywords" content="H+后台主题,后台bootstrap框架,会员中心主题,后台HTML,响应式后台">
    <meta name="description" content="H+是一个完全响应式，基于Bootstrap3最新版本开发的扁平化主题，她采用了主流的左右两栏式布局，使用了Html5+CSS3等现代技术">

    <link rel="shortcut icon" href="favicon.ico"> <link href="${pageContext.request.contextPath }/css/bootstrap.min.css-v=3.3.5.css" tppabs="http://www.zi-han.net/theme/hplus/css/bootstrap.min.css?v=3.3.5" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/css/font-awesome.min.css-v=4.4.0.css" tppabs="http://www.zi-han.net/theme/hplus/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">

    <link href="${pageContext.request.contextPath }/css/animate.min.css" tppabs="http://www.zi-han.net/theme/hplus/css/animate.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/css/style.min.css-v=4.0.0.css" tppabs="http://www.zi-han.net/theme/hplus/css/style.min.css?v=4.0.0" rel="stylesheet"><base target="_blank">
    <!--[if lt IE 8]>
    <meta http-equiv="refresh" content="0;ie.html" />
    <![endif]-->
    <script>if(window.top !== window.self){ window.top.location = window.location;}</script>
</head>

<body class="gray-bg">

    <div class="middle-box text-center loginscreen  animated fadeInDown">
        <div>
           
            <h3>密码找回</h3>

           
                <div class="form-group">
                    <input type="email" class="form-control" id="student_num" placeholder="用户名" required="">
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="注册邮箱" id="email" required="">
                </div>
                <button type="submit" class="btn btn-primary block full-width m-b" onclick="sure();">确认找回</button>
            
	<script type="text/javascript">

	
	
	var picture;
	   $.ajax({
      　　　　 url:'${pageContext.request.contextPath }/user/photo',
			async:false,
              success:function(data){
            	  picture=data.picture;
              }
          }); 	
	   alert(picture);
	   

	
function sure()
{      
	var password;
	var error;
	   var number=document.getElementById("student_num").value;
	   var email=document.getElementById("email").value;
	   var useremail;
	   $.ajax({
      　　　　 url:'${pageContext.request.contextPath }/user/password',  /*  //ajax传数据到后台 */
              data:{
                  email: email,
                  number:number
              },
              type:"post",
              async:false,
              dataType:"json",
              success:function(data){
            	  password=data.password;
            	  useremail=data.useremail;
            	  error=data.error
              }
          }); 	
	if(error=="用户不存在")
		alert(error);
	else{
	
	if(email==useremail)
		{
		alert("密码已经发送到"+useremail+"请注意查收")
		window.location.href='${pageContext.request.contextPath}/user/login';
		}
	else
	{
	alert("邮箱错误");
	}
	}
}

</script>
            
            
            
        </div>
    </div>
    <script src="${pageContext.request.contextPath }/js/jquery.min.js-v=2.1.4" tppabs="http://www.zi-han.net/theme/hplus/js/jquery.min.js?v=2.1.4"></script>
    <script src="${pageContext.request.contextPath }/js/bootstrap.min.js-v=3.3.5" tppabs="http://www.zi-han.net/theme/hplus/js/bootstrap.min.js?v=3.3.5"></script>
    <script type="text/javascript" src="../../../tajs.qq.com/stats-sId=9051096" tppabs="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
</body>
</html>