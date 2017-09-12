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
		当前位置：普通用户 / <a href="${pageContext.request.contextPath }/user/Project"
			target="iFrame1 ">查看项目</a> / 项目全部缺陷
	</div>
	<br>

	<div class="projectbugtable">
		<form name="bugform" method="post" id="bugform"
			action="${pageContext.request.contextPath }/user/selectProjectbug">

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
			</select> &nbsp;&nbsp; &nbsp;&nbsp; <input type="submit" value="搜索"
				class="bnt" />

		</form>
		<br>
		<!-- 数据展示区 -->


		<table width="87%" class="altrowstable">
			<tr>
				<th style="width: 30px;">序号</th>
				<th style="width: 60px;">严重级别</th>
				<th style="width: 60px;">提交人</th>
				<th>标题</th>
			</tr>
			<c:forEach items="${requestScope.bugs}" var="bug" varStatus="stat">
				<tr id="data_${stat.index}" align="left">

					<td align="center">${stat.count}</td>
					<td align="center">${ponderance.pon_name }</td>
					<td align="center">${bug.reporter.username}</td>
					<td ><a
						href="${pageContext.request.contextPath }/bug/detailBug?bug_id=${bug.bug_id}"
						title="查看缺陷详情"> ${bug.summary}</a></td>
				</tr>
			</c:forEach>

		</table>
<br>

		<fkjava:pager pageIndex="${requestScope.pageModel.pageIndex}"
			pageSize="${requestScope.pageModel.pageSize}"
			recordCount="${requestScope.pageModel.recordCount}" style="digg"
			submitUrl="${pageContext.request.contextPath }/user/selectBug?pageIndex={0}" />

	</div>
</body>
</html> --%>
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
<body>
	<div class="exp1">
		当前位置：普通用户 / <a
			href="${pageContext.request.contextPath }/user/selectBug"
			target="iFrame1 ">缺陷列表</a>
	</div>

	<br>
	<br>
	<div class="table">
		<form name="bugform" method="post" id="bugform"
			action="${pageContext.request.contextPath }/user/selectBug">
			<div>
				 缺陷标题：<input type="text" name="summary"
					class="searchlable"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 严重级别： <select
					name="bugseverity_id" class="searchselect">
					<option value="0">--请选择缺陷严重级别--</option>
					<c:forEach items="${requestScope.bugseveritys }" var="bugseverity">
						<option value="${ponderance.pon_id }">${ponderance.pon_name}</option>
					</c:forEach>
				</select> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 缺陷状态： <select name="bug_status"
					class="searchselect">
					<option value="0">--请选择状态--</option>
					<option value="1">New</option>
					<option value="2">Open</option>
					<option value="3">Assigned</option>
					<option value="4">handled</option>
					<option value="5">Closed</option>
					<option value="6">Reopen</option>
				</select> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <!-- 处理结果： <select name="bug_result"
					class="searchselect">
					<option value="0">--请选择处理结果--</option>
					<option value="1">Fixed</option>
					<option value="2">Rejected</option>
					<option value="3">Postponed</option>
					<option value="4">Duplicate</option>
				</select> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->
			</div>

			<div>
				提交人： &nbsp;&nbsp; <select
					name="reporter_id" class="searchselect">
					<option value="0">--请选择提交人--</option>
					<c:forEach items="${requestScope.users }" var="user">
						<option value="${user.user_id }">${user.username}</option>
					</c:forEach>
				</select> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; 处理人：&nbsp; <select
					name="handler_id" class="searchselect">
					<option value="0">--请选择处理人--</option>
					<c:forEach items="${requestScope.users }" var="user">
						<option value="${user.user_id}">${user.username }</option>
					</c:forEach>
				</select> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 所属项目： <select name="pro_id"
					class="searchselect">
					<option value="0">--请选择项目--</option>
					<c:forEach items="${requestScope.projects }" var="project">
						<option value="${project.pro_id }">${project.pro_name }</option>
					</c:forEach>
				</select> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="submit" value="搜索"
					class="bnt" />
			</div>
		</form>
		<br>

		<table width="87%" class="altrowstable">
			<tr>
				<th style="width: 30px;">序号</th>
				<th style="width: 60px;">严重级别</th>
				<th style="width: 60px;">提交人</th>
				<th>标题</th>
			</tr>
			<c:forEach items="${requestScope.bugs}" var="bug" varStatus="stat">
				<tr id="data_${stat.index}" align="left">
					<td align="center">${stat.count}</td>
					<td align="center">${bug.ponderance.pon_name}</td>
					<td align="center">${bug.reporter.username}</td>
					<td><a
						href="${pageContext.request.contextPath }/bug/detailBug?bug_id=${bug.bug_id}"
						title="查看缺陷详情"> ${bug.summary}</a></td>
				</tr>
			</c:forEach>
		</table>

		<!-- 分页标签 -->
<br>
		<fkjava:pager pageIndex="${requestScope.pageModel.pageIndex}"
			pageSize="${requestScope.pageModel.pageSize}"
			recordCount="${requestScope.pageModel.recordCount}"
			submitUrl="${pageContext.request.contextPath }/user/selectBug?pageIndex={0}" />

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


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>


<title>缺陷管理系统-用户缺陷</title>
<meta name="keywords" content="缺陷管理">
<meta name="description" content="缺陷管理">

<link rel="shortcut icon" href="favicon.ico">
<link
	href="${pageContext.request.contextPath }/css/bootstrap.min.css-v=3.3.5.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath }/css/font-awesome.min.css-v=4.4.0.css"
	rel="stylesheet">

<!-- Data Tables -->
<link
	href="${pageContext.request.contextPath }/css/plugins/dataTables/dataTables.bootstrap.css"
	rel="stylesheet">

<link href="${pageContext.request.contextPath }/css/animate.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath }/css/style.min.css-v=4.0.0.css"
	rel="stylesheet">
<base target="_blank">


</head>

<body class="gray-bg">


	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="row">
			<div class="col-sm-12">
				<div class="ibox float-e-margins">
					<div class="ibox-title">
						<h5>
							用户缺陷列表<small>查找</small>
						</h5>
						<div class="ibox-tools">
							<a class="collapse-link"> <i class="fa fa-chevron-up"></i>
							</a> <a class="dropdown-toggle" data-toggle="dropdown"
								href="table_data_tables.html#"
								tppabs="http://www.zi-han.net/theme/hplus/table_data_tables.html#">
								<i class="fa fa-wrench"></i>
							</a> <a class="close-link"
								href="javascript:window.location.reload(); "> 刷新 </a>
								  <a href="javascript:history.go(-1)">返回上一页</a>
						</div>
					</div>
					<div class="ibox-content">

						<table
							class="table table-striped table-bordered table-hover dataTables-example">
							<thead>
								<tr>
									<th>序号</th>
									<th>标题</th>
									<th>提交人</th>
									<td>严重666级别</td>
									<th>处理人</th>
									<td>复现结果</td>
									<th>操作</th>
									<th>缺陷状态</th>
								<c:if test="${bug.project.manager.user_id==user_id}">
								<th>修改</th>
								</c:if>
								</tr>
								
							</thead>
							<tbody>
								<c:forEach items="${requestScope.bugs}" var="bug"
									varStatus="stat">
									<tr id="data_${stat.index}">

										<td>${stat.count}</td>
										<td><a target="_self"
											href="${pageContext.request.contextPath }/bug/detailBug?bug_id=${bug.bug_id}"
											title="查看缺陷详情">${bug.summary}</a></td>
										<td>${bug.reporter.username}</td>
										<td>${bug.ponderance.pon_name}</td>
										<td>${bug.handler.username}</td>
										<td>${bug.result.result_name}</td>
										<c:if test="${bug.project.manager.user_id==user_id}">
                                        <td align="center"><a target="_self"
											href="${pageContext.request.contextPath }/bug/updateBug?flag=1&&bug_id=${bug.bug_id}"
											title="修改缺陷">处理</a></td>
                                        </c:if>
                                        <c:if test="${bug.project.manager.user_id!=user_id}">
                                        	<td><a target="_self"
											href="${pageContext.request.contextPath }/bug/detailBug?bug_id=${bug.bug_id}"
											title="查看缺陷详情">查看</a></td>
                                        </c:if>
									<c:if test="${bug.bug_status == 1 }">
										<td>
										New
										</td>
										</c:if>
										<c:if test="${bug.bug_status == 2 }">
										<td>
										Assigned
										</td>
										</c:if>
											<c:if test="${bug.bug_status == 3 }">
										<td>
										Open
										</td>
										</c:if>
										<c:if test="${bug.bug_status == 4 }">
										<td>
										Fixed
										</td>
										</c:if>
											<c:if test="${bug.bug_status == 5 }">
										<td>
										Rejected
										</td>
										</c:if>
										<c:if test="${bug.bug_status == 6 }">
										<td>
										Postponed
										</td>
										</c:if>
										<c:if test="${bug.bug_status == 7 }">
										<td>
										Closed
										</td>
										</c:if>
										<c:if test="${bug.bug_status == 8 }">
										<td>
										Reopen
										</td>
										</c:if>

									</tr>
								</c:forEach>

							</tbody>


						</table>

					</div>
				</div>
			</div>
		</div>
		<script type="text/javascript">
		function sure()
		{
		alert("确认删除？")
		}
		</script>


		<script
			src="${pageContext.request.contextPath }/js/jquery.min.js-v=2.1.4"
			tppabs="http://www.zi-han.net/theme/hplus/js/jquery.min.js?v=2.1.4"></script>
		<script
			src="${pageContext.request.contextPath }/js/bootstrap.min.js-v=3.3.5"
			tppabs="http://www.zi-han.net/theme/hplus/js/bootstrap.min.js?v=3.3.5"></script>
		<script
			src="${pageContext.request.contextPath }/js/plugins/jeditable/jquery.jeditable.js"
			tppabs="http://www.zi-han.net/theme/hplus/js/plugins/jeditable/jquery.jeditable.js"></script>
		<script
			src="${pageContext.request.contextPath }/js/plugins/dataTables/jquery.dataTables.js"
			tppabs="http://www.zi-han.net/theme/hplus/js/plugins/dataTables/jquery.dataTables.js"></script>
		<script
			src="${pageContext.request.contextPath }/js/plugins/dataTables/dataTables.bootstrap.js"
			tppabs="http://www.zi-han.net/theme/hplus/js/plugins/dataTables/dataTables.bootstrap.js"></script>
		<script
			src="${pageContext.request.contextPath }/js/content.min.js-v=1.0.0"
			tppabs="http://www.zi-han.net/theme/hplus/js/content.min.js?v=1.0.0"></script>
		<script>
        $(document).ready(function(){$(".dataTables-example").dataTable();var oTable=$("#editable").dataTable();oTable.$("td").editable("http://www.zi-han.net/theme/example_ajax.php",{"callback":function(sValue,y){var aPos=oTable.fnGetPosition(this);oTable.fnUpdate(sValue,aPos[0],aPos[1])},"submitdata":function(value,settings){return{"row_id":this.parentNode.getAttribute("id"),"column":oTable.fnGetPosition(this)[2]}},"width":"90%","height":"100%"})});function fnClickAddRow(){$("#editable").dataTable().fnAddData(["Custom row","New row","New row","New row","New row"])};
    </script>
		<script type="text/javascript"
			src="../../../tajs.qq.com/stats-sId=9051096"
			tppabs="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
</body>

</html>