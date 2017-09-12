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

			<div  >
				地址：<input type="text" name="useraddress" id="score" size="20"
					value="${user.useraddress }"
					style="width: 200px; height: 40px; font-size: 18px;" />
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

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>H+ 后台主题UI框架 - 联系人</title>
    <meta name="keywords" content="H+后台主题,后台bootstrap框架,会员中心主题,后台HTML,响应式后台">
    <meta name="description" content="H+是一个完全响应式，基于Bootstrap3最新版本开发的扁平化主题，她采用了主流的左右两栏式布局，使用了Html5+CSS3等现代技术">

    <link rel="shortcut icon" href="favicon.ico"> <link href="css/bootstrap.min.css-v=3.3.5.css" tppabs="http://www.zi-han.net/theme/hplus/css/bootstrap.min.css?v=3.3.5" rel="stylesheet">
    <link href="css/font-awesome.min.css-v=4.4.0.css" tppabs="http://www.zi-han.net/theme/hplus/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">

    <link href="css/animate.min.css" tppabs="http://www.zi-han.net/theme/hplus/css/animate.min.css" rel="stylesheet">
    <link href="css/style.min.css-v=4.0.0.css" tppabs="http://www.zi-han.net/theme/hplus/css/style.min.css?v=4.0.0" rel="stylesheet"><base target="_blank">

</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-sm-4">
                <div class="contact-box">
                    <a href="profile.html" tppabs="http://www.zi-han.net/theme/hplus/profile.html">
                        <div class="col-sm-4">
                            <div class="text-center">
                                <img alt="image" class="img-circle m-t-xs img-responsive" src="img/a2.jpg" tppabs="http://www.zi-han.net/theme/hplus/img/a2.jpg">
                                <div class="m-t-xs font-bold">CTO</div>
                            </div>
                        </div>
                        <div class="col-sm-8">
                            <h3><strong>奔波儿灞</strong></h3>
                            <p><i class="fa fa-map-marker"></i> 甘肃·兰州</p>
                            <address>
                            <strong>Baidu, Inc.</strong><br>
                            E-mail:xxx@baidu.com<br>
                            Weibo:<a href="">http://weibo.com/xxx</a><br>
                            <abbr title="Phone">Tel:</abbr> (123) 456-7890
                        </address>
                        </div>
                        <div class="clearfix"></div>
                    </a>
                </div>
            </div>
            <div class="col-sm-4">
                <div class="contact-box">
                    <a href="profile.html" tppabs="http://www.zi-han.net/theme/hplus/profile.html">
                        <div class="col-sm-4">
                            <div class="text-center">
                                <img alt="image" class="img-circle m-t-xs img-responsive" src="img/a1.jpg" tppabs="http://www.zi-han.net/theme/hplus/img/a1.jpg">
                                <div class="m-t-xs font-bold">营销总监</div>
                            </div>
                        </div>
                        <div class="col-sm-8">
                            <h3><strong>灞波儿奔</strong></h3>
                            <p><i class="fa fa-map-marker"></i> 四川·成都</p>
                            <address>
                            <strong>Taobao, Inc.</strong><br>
                            E-mail:xxx@taobao.com<br>
                            Weibo:<a href="">http://weibo.com/xxx</a><br>
                            <abbr title="Phone">Tel:</abbr> (123) 456-7890
                        </address>
                        </div>
                        <div class="clearfix"></div>
                    </a>
                </div>
            </div>
            <div class="col-sm-4">
                <div class="contact-box">
                    <a href="profile.html" tppabs="http://www.zi-han.net/theme/hplus/profile.html">
                        <div class="col-sm-4">
                            <div class="text-center">
                                <img alt="image" class="img-circle m-t-xs img-responsive" src="img/a3.jpg" tppabs="http://www.zi-han.net/theme/hplus/img/a3.jpg">
                                <div class="m-t-xs font-bold">Marketing manager</div>
                            </div>
                        </div>
                        <div class="col-sm-8">
                            <h3><strong>Monica Smith</strong></h3>
                            <p><i class="fa fa-map-marker"></i> 上海市闵行区绿地科技岛广场A座2606室</p>
                            <address>
                            <strong>Baidu, Inc.</strong><br>
                            E-mail:xxx@baidu.com<br> 
                            Weibo:<a href="">http://weibo.com/xxx</a><br>
                            <abbr title="Phone">Tel:</abbr> (123) 456-7890
                        </address>
                        </div>
                        <div class="clearfix"></div>
                    </a>
                </div>
            </div>
            <div class="col-sm-4">
                <div class="contact-box">
                    <a href="profile.html" tppabs="http://www.zi-han.net/theme/hplus/profile.html">
                        <div class="col-sm-4">
                            <div class="text-center">
                                <img alt="image" class="img-circle m-t-xs img-responsive" src="img/a4.jpg" tppabs="http://www.zi-han.net/theme/hplus/img/a4.jpg">
                                <div class="m-t-xs font-bold">攻城师</div>
                            </div>
                        </div>
                        <div class="col-sm-8">
                            <h3><strong>Michael Zimber</strong></h3>
                            <p><i class="fa fa-map-marker"></i> 上海市闵行区绿地科技岛广场A座2606室</p>
                            <address>
                            <strong>Baidu, Inc.</strong><br>
                            E-mail:xxx@baidu.com<br>
                            Weibo:<a href="">http://weibo.com/xxx</a><br>
                            <abbr title="Phone">Tel:</abbr> (123) 456-7890
                        </address>
                        </div>
                        <div class="clearfix"></div>
                    </a>
                </div>
            </div>
            <div class="col-sm-4">
                <div class="contact-box">
                    <a href="profile.html" tppabs="http://www.zi-han.net/theme/hplus/profile.html">
                        <div class="col-sm-4">
                            <div class="text-center">
                                <img alt="image" class="img-circle m-t-xs img-responsive" src="img/a5.jpg" tppabs="http://www.zi-han.net/theme/hplus/img/a5.jpg">
                                <div class="m-t-xs font-bold">射鸡师</div>
                            </div>
                        </div>
                        <div class="col-sm-8">
                            <h3><strong>作家崔成浩</strong></h3>
                            <p><i class="fa fa-map-marker"></i> 上海市闵行区绿地科技岛广场A座2606室</p>
                            <address>
                            <strong>Baidu, Inc.</strong><br>
                            E-mail:xxx@baidu.com<br>
                            Weibo:<a href="">http://weibo.com/xxx</a><br>
                            <abbr title="Phone">Tel:</abbr> (123) 456-7890
                        </address>
                        </div>
                        <div class="clearfix"></div>
                    </a>
                </div>
            </div>
            <div class="col-sm-4">
                <div class="contact-box">
                    <a href="profile.html" tppabs="http://www.zi-han.net/theme/hplus/profile.html">
                        <div class="col-sm-4">
                            <div class="text-center">
                                <img alt="image" class="img-circle m-t-xs img-responsive" src="img/a6.jpg" tppabs="http://www.zi-han.net/theme/hplus/img/a6.jpg">
                                <div class="m-t-xs font-bold">射鸡师</div>
                            </div>
                        </div>
                        <div class="col-sm-8">
                            <h3><strong>韩寒</strong></h3>
                            <p><i class="fa fa-map-marker"></i> 上海市闵行区绿地科技岛广场A座2606室</p>
                            <address>
                            <strong>Baidu, Inc.</strong><br>
                            E-mail:xxx@baidu.com<br>
                            Weibo:<a href="">http://weibo.com/xxx</a><br>
                            <abbr title="Phone">Tel:</abbr> (123) 456-7890
                        </address>
                        </div>
                        <div class="clearfix"></div>
                    </a>
                </div>
            </div>
            <div class="col-sm-4">
                <div class="contact-box">
                    <a href="profile.html" tppabs="http://www.zi-han.net/theme/hplus/profile.html">
                        <div class="col-sm-4">
                            <div class="text-center">
                                <img alt="image" class="img-circle m-t-xs img-responsive" src="img/a1.jpg" tppabs="http://www.zi-han.net/theme/hplus/img/a1.jpg">
                                <div class="m-t-xs font-bold">CEO</div>
                            </div>
                        </div>
                        <div class="col-sm-8">
                            <h3><strong>郭敬明</strong></h3>
                            <p><i class="fa fa-map-marker"></i> 上海市闵行区绿地科技岛广场A座2606室</p>
                            <address>
                            <strong>Baidu, Inc.</strong><br>
                            E-mail:xxx@baidu.com<br>
                            Weibo:<a href="">http://weibo.com/xxx</a><br>
                            <abbr title="Phone">Tel:</abbr> (123) 456-7890
                        </address>
                        </div>
                        <div class="clearfix"></div>
                    </a>
                </div>
            </div>
            <div class="col-sm-4">
                <div class="contact-box">
                    <a href="profile.html" tppabs="http://www.zi-han.net/theme/hplus/profile.html">
                        <div class="col-sm-4">
                            <div class="text-center">
                                <img alt="image" class="img-circle m-t-xs img-responsive" src="img/a2.jpg" tppabs="http://www.zi-han.net/theme/hplus/img/a2.jpg">
                                <div class="m-t-xs font-bold">射鸡师</div>
                            </div>
                        </div>
                        <div class="col-sm-8">
                            <h3><strong>马云</strong></h3>
                            <p><i class="fa fa-map-marker"></i> 上海市闵行区绿地科技岛广场A座2606室</p>
                            <address>
                            <strong>Baidu, Inc.</strong><br>
                            E-mail:xxx@baidu.com<br>
                            Weibo:<a href="">http://weibo.com/xxx</a><br>
                            <abbr title="Phone">Tel:</abbr> (123) 456-7890
                        </address>
                        </div>
                        <div class="clearfix"></div>
                    </a>
                </div>
            </div>
            <div class="col-sm-4">
                <div class="contact-box">
                    <a href="profile.html" tppabs="http://www.zi-han.net/theme/hplus/profile.html">
                        <div class="col-sm-4">
                            <div class="text-center">
                                <img alt="image" class="img-circle m-t-xs img-responsive" src="img/a3.jpg" tppabs="http://www.zi-han.net/theme/hplus/img/a3.jpg">
                                <div class="m-t-xs font-bold">市场总监</div>
                            </div>
                        </div>
                        <div class="col-sm-8">
                            <h3><strong>范爷</strong></h3>
                            <p><i class="fa fa-map-marker"></i> 上海市闵行区绿地科技岛广场A座2606室</p>
                            <address>
                            <strong>Baidu, Inc.</strong><br>
                            E-mail:xxx@baidu.com<br>
                            Weibo:<a href="">http://weibo.com/xxx</a><br>
                            <abbr title="Phone">Tel:</abbr> (123) 456-7890
                        </address>
                        </div>
                        <div class="clearfix"></div>
                    </a>
                </div>
            </div>
            <div class="col-sm-4">
                <div class="contact-box">
                    <a href="profile.html" tppabs="http://www.zi-han.net/theme/hplus/profile.html">
                        <div class="col-sm-4">
                            <div class="text-center">
                                <img alt="image" class="img-circle m-t-xs img-responsive" src="img/a4.jpg" tppabs="http://www.zi-han.net/theme/hplus/img/a4.jpg">
                                <div class="m-t-xs font-bold">攻城师</div>
                            </div>
                        </div>
                        <div class="col-sm-8">
                            <h3><strong>李彦宏</strong></h3>
                            <p><i class="fa fa-map-marker"></i> 上海市闵行区绿地科技岛广场A座2606室</p>
                            <address>
                            <strong>Baidu, Inc.</strong><br>
                            E-mail:xxx@baidu.com<br>
                            Weibo:<a href="">http://weibo.com/xxx</a><br>
                            <abbr title="Phone">Tel:</abbr> (123) 456-7890
                        </address>
                        </div>
                        <div class="clearfix"></div>
                    </a>
                </div>
            </div>
            <div class="col-sm-4">
                <div class="contact-box">
                    <a href="profile.html" tppabs="http://www.zi-han.net/theme/hplus/profile.html">
                        <div class="col-sm-4">
                            <div class="text-center">
                                <img alt="image" class="img-circle m-t-xs img-responsive" src="img/a5.jpg" tppabs="http://www.zi-han.net/theme/hplus/img/a5.jpg">
                                <div class="m-t-xs font-bold">射鸡师</div>
                            </div>
                        </div>
                        <div class="col-sm-8">
                            <h3><strong>小马哥</strong></h3>
                            <p><i class="fa fa-map-marker"></i> 上海市闵行区绿地科技岛广场A座2606室</p>
                            <address>
                            <strong>Baidu, Inc.</strong><br>
                            E-mail:xxx@baidu.com<br>
                            Weibo:<a href="">http://weibo.com/xxx</a><br>
                            <abbr title="Phone">Tel:</abbr> (123) 456-7890
                        </address>
                        </div>
                        <div class="clearfix"></div>
                    </a>
                </div>
            </div>
            <div class="col-sm-4">
                <div class="contact-box">
                    <a href="profile.html" tppabs="http://www.zi-han.net/theme/hplus/profile.html">
                        <div class="col-sm-4">
                            <div class="text-center">
                                <img alt="image" class="img-circle m-t-xs img-responsive" src="img/a6.jpg" tppabs="http://www.zi-han.net/theme/hplus/img/a6.jpg">
                                <div class="m-t-xs font-bold">射鸡师</div>
                            </div>
                        </div>
                        <div class="col-sm-8">
                            <h3><strong>乔峰</strong></h3>
                            <p><i class="fa fa-map-marker"></i> 上海市闵行区绿地科技岛广场A座2606室</p>
                            <address>
                            <strong>Baidu, Inc.</strong><br>
                            E-mail:xxx@baidu.com<br>
                            Weibo:<a href="">http://weibo.com/xxx</a><br>
                            <abbr title="Phone">Tel:</abbr> (123) 456-7890
                        </address>
                        </div>
                        <div class="clearfix"></div>
                    </a>

                </div>
            </div>
            <div class="col-sm-4">
                <div class="contact-box">
                    <a href="profile.html" tppabs="http://www.zi-han.net/theme/hplus/profile.html">
                        <div class="col-sm-4">
                            <div class="text-center">
                                <img alt="image" class="img-circle m-t-xs img-responsive" src="img/a1.jpg" tppabs="http://www.zi-han.net/theme/hplus/img/a1.jpg">
                                <div class="m-t-xs font-bold">CEO</div>
                            </div>
                        </div>
                        <div class="col-sm-8">
                            <h3><strong>慕容晓晓</strong></h3>
                            <p><i class="fa fa-map-marker"></i> 上海市闵行区绿地科技岛广场A座2606室</p>
                            <address>
                            <strong>Baidu, Inc.</strong><br>
                            E-mail:xxx@baidu.com<br>
                            Weibo:<a href="">http://weibo.com/xxx</a><br>
                            <abbr title="Phone">Tel:</abbr> (123) 456-7890
                        </address>
                        </div>
                        <div class="clearfix"></div>
                    </a>
                </div>
            </div>
            <div class="col-sm-4">
                <div class="contact-box">
                    <a href="profile.html" tppabs="http://www.zi-han.net/theme/hplus/profile.html">
                        <div class="col-sm-4">
                            <div class="text-center">
                                <img alt="image" class="img-circle m-t-xs img-responsive" src="img/a2.jpg" tppabs="http://www.zi-han.net/theme/hplus/img/a2.jpg">
                                <div class="m-t-xs font-bold">射鸡师</div>
                            </div>
                        </div>
                        <div class="col-sm-8">
                            <h3><strong>高圆圆</strong></h3>
                            <p><i class="fa fa-map-marker"></i> 上海市闵行区绿地科技岛广场A座2606室</p>
                            <address>
                            <strong>Baidu, Inc.</strong><br>
                            E-mail:xxx@baidu.com<br>
                            Weibo:<a href="">http://weibo.com/xxx</a><br>
                            <abbr title="Phone">Tel:</abbr> (123) 456-7890
                        </address>
                        </div>
                        <div class="clearfix"></div>
                    </a>
                </div>
            </div>
        </div>
    </div>
    <script src="js/jquery.min.js-v=2.1.4" tppabs="http://www.zi-han.net/theme/hplus/js/jquery.min.js?v=2.1.4"></script>
    <script src="js/bootstrap.min.js-v=3.3.5" tppabs="http://www.zi-han.net/theme/hplus/js/bootstrap.min.js?v=3.3.5"></script>
    <script src="js/content.min.js-v=1.0.0" tppabs="http://www.zi-han.net/theme/hplus/js/content.min.js?v=1.0.0"></script>
    <script>
        $(document).ready(function(){$(".contact-box").each(function(){animationHover(this,"pulse")})});
    </script>
    <script type="text/javascript" src="../../../tajs.qq.com/stats-sId=9051096" tppabs="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
</body>

</html>