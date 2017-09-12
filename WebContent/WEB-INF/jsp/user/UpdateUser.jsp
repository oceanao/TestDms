<%@ page language="java" contentType="text/html; charset=UTF-8"
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
</html>