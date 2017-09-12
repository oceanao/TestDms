
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
							</a> <a href="${pageContext.request.contextPath }/bug/statistics"
								target="_self">查看缺陷提交情况</a> <a class="close-link"
								href="javascript:window.location.reload(); "> 刷新 </a> <a
								href="${pageContext.request.contextPath }/user/addBug?flag=1"
								target="_self">新增</a>
							<!-- 	<a href="javascript:window.location.reload(); ">返回上一页</a>  -->
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
									<td>严重级别</td>
									<th>处理人</th>
									<td>复现结果</td>
									<td>优先级</td>
									<th>缺陷状态</th>
									<th>项目</th>

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
										<td>${bug.priority}</td>
										<c:if test="${bug.bug_status == 1 }">
											<td>New</td>
										</c:if>
										<c:if test="${bug.bug_status == 2 }">
											<td>Assigned</td>
										</c:if>
										<c:if test="${bug.bug_status == 3 }">
											<td>Open</td>
										</c:if>
										<c:if test="${bug.bug_status == 4 }">
											<td>Fixed</td>
										</c:if>
										<c:if test="${bug.bug_status == 5 }">
											<td>Rejected</td>
										</c:if>
										<c:if test="${bug.bug_status == 6 }">
											<td>Postponed</td>
										</c:if>
										<c:if test="${bug.bug_status == 7 }">
											<td>Closed</td>
										</c:if>
										<c:if test="${bug.bug_status == 8 }">
											<td>Reopen</td>
										</c:if>
										<td>${bug.project.pro_name}</td>

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
</body>

</html>