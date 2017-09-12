<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath }/css/bug.css"
	type="text/css" rel="stylesheet" />
<link href="${pageContext.request.contextPath }/css/table.css"
	type="text/css" rel="stylesheet" />
</head>
<body>
	<div class="exp1">
		当前位置：项目组长 / <a
			href="${pageContext.request.contextPath }/project/ManageProject"
			target="iFrame1 ">管理项目</a> / 项目全部缺陷
	</div>

	<br>
	<div class="projectbugtable">

		<form name="bugform" method="post" id="bugform"
			action="${pageContext.request.contextPath }/user/ManageProjectbug">
			<input type="hidden" name="pro_id" value="${requestScope.pro_id} ">

			<br> 缺陷标题：<input type="text" name="summary" class="searchlable">
			&nbsp;&nbsp; &nbsp;&nbsp; 严重级别： <select name="pon_id"
				class="searchselect">
				<option value="0">--请选择缺陷严重级别--</option>
				<c:forEach items="${requestScope.ponderances }" var="ponderance">
					<option value="${ponderance.pon_id }">${ponderance.pon_name }</option>
				</c:forEach>
			</select> &nbsp;&nbsp; &nbsp;&nbsp; 缺陷状态： <select name="bug_status"
				class="searchselect">
				<option value="0">--请选择状态--</option>
				<option value="1">New</option>
				<option value="2">Open</option>
				<option value="3">Assigned</option>
				<option value="4">handled</option>
				<option value="5">Closed</option>
				<option value="6">Reopen</option>
			</select> &nbsp;&nbsp;&nbsp;&nbsp; 处理结果： <select name="bug_result"
				class="searchselect">
				<option value="0">--请选择处理结果--</option>
				<option value="1">Fixed</option>
				<option value="2">Rejected</option>
				<option value="3">Postponed</option>
				<option value="4">Duplicate</option>
			</select> <br> 提交人:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <select
				name="reporter_id" class="searchselect">
				<option value="0">--请选择提交人--</option>
				<c:forEach items="${requestScope.users }" var="user">
					<option value="${user.user_id }">${user.username}</option>
				</c:forEach>
			</select> &nbsp;&nbsp; &nbsp;&nbsp; 处理人：&nbsp;&nbsp; &nbsp; <select
				name="handler_id" class="searchselect">
				<option value="0">--请选择复现人--</option>
				<c:forEach items="${requestScope.users }" var="user">
					<option value="${user.user_id }">${user.username }</option>
				</c:forEach>
			</select> &nbsp;&nbsp; &nbsp;&nbsp; <input type="submit" value="搜索" class="bnt" />

		</form>
<br>

		<!-- 数据展示区 -->

		<table width="96%" class="altrowstable">

			<tr>
				<th style="width: 30px;">序号</th>
				<th style="width: 60px;">严重级别</th>
				<th style="width: 60px;">提交人</th>
				<th>标题</th>
				<th style="width: 40px;">操作1</th>
				<th style="width: 40px;">操作2</th>
			</tr>
			<c:forEach items="${requestScope.bugs}" var="bug" varStatus="stat">
				<tr id="data_${stat.index}" align="left">

					<td align="center">${stat.count}</td>
					<td align="center">${bug.ponderance.pon_name}</td>
					<td align="center">${bug.reporter.username}</td>
					<td><a
						href="${pageContext.request.contextPath }/bug/detailBug?bug_id=${bug.bug_id}"
						title="查看缺陷详情"> ${bug.summary}</a>
					<td align="center"><a
						href="${pageContext.request.contextPath }/bug/updateBug?flag=1&&bug_id=${bug.bug_id}"
						title="修改缺陷"> <img
							src="${pageContext.request.contextPath }/image/update.ico"
							style="width: 20px; height: 20px;"></a>
					<td align="center"><a
						href="${pageContext.request.contextPath }/bug/removeBug?bug_id=${bug.bug_id}"
						title="下载缺陷"> <img
							src="${pageContext.request.contextPath }/image/delete.ico"
							style="width: 20px; height: 20px;"></a></td>
				</tr>
			</c:forEach>
		</table>
<br>
		<fkjava:pager
					pageIndex="${requestScope.pageModel.pageIndex}"
					pageSize="${requestScope.pageModel.pageSize}"
					recordCount="${requestScope.pageModel.recordCount}" style="digg"
					submitUrl="${pageContext.request.contextPath }/user/ManageProjectbug?pro_id=${pro_id}" />
		

	</div>
</body>
</html> --%>