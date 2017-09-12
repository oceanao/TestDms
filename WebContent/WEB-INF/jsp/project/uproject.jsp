<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>商品分类</title>
<link href="${pageContext.request.contextPath }/static/css/user.css"
	type="text/css" rel="stylesheet" />
</head>
<body>
	<h1 align="center" style="color: red;">商品分类</h1>
	<div align="center">

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
	<style>
	li{
	 width: 200px; 
	}
	</style>
		<br> <br>
		
		<table> 
				<tr>
				<td align="center" width="200px;">项目名称</td>
			
				<td align="center" width="100px;">项目地址</td>
				 <td align="center" width="100px;">项目详情</td>
				</tr>
			    <c:forEach items="${requestScope.projects}" var="project"
				varStatus="stat">
				<tr>
				<td align="center" width="200px;">
				<a href="${pageContext.request.contextPath }/user/selectProjectbug?pro_id=${project.pro_id}">
					<span style="font-size: 24px; color: red;">${project.pro_name }</span></a></td>
				<td><a href="${project.pro_file}" target="frame">${project.pro_file}</a></td>
				<td align="center" width="100px;"><a
									href="${pageContext.request.contextPath }/project/detailProject?pro_id=${project.pro_id}">
										详情</a></td>
				</tr>
				</c:forEach>
				
				</table>
				
				<a href="${pageContext.request.contextPath }/user/selectProjectbug?pro_id=${project.pro_id}">
					<span style="font-size: 24px; color: red;">${project.pro_name }</span>
				</a>
					项目信息${project.pro_version}
					<a href="https://${project.pro_file}">${project.pro_file}</a>
				</li>
				</td>
				<c:if test="${stat.count % 4 eq 0 || status.count eq 4}">
				<br>
				<br>
				<br>
				</c:if>
 
	
	<style>
img {
	width: 400px;
	height: 400px;
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
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>H+ 后台主题UI框架 - 数据表格</title>
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

<!-- Data Tables -->
<link
	href="${pageContext.request.contextPath }/css/plugins/dataTables/dataTables.bootstrap.css"
	tppabs="http://www.zi-han.net/theme/hplus/css/plugins/dataTables/dataTables.bootstrap.css"
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
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="row">
			<div class="col-sm-12">
				<div class="ibox float-e-margins">
					<div class="ibox-title">
						<h5>
							项目列表<small>查找</small>
						</h5>
						<div class="ibox-tools">
							<a class="collapse-link"> <i class="fa fa-chevron-up"></i>
							</a>  
							
							<%-- <a class="close-link" href="${pageContext.request.contextPath }/project/addProject?flag=1" target="_self"
									>新增</a> --%>
						 
						
						</div>
					</div>
					<div class="ibox-content">
  
						<table
							class="table table-striped table-bordered table-hover dataTables-example">
							<thead>
								<tr>
									<th >序号</th>
									<th>名称</th>
									<th>负责人</th>
									<!-- <th>修改</th>
									<th>删除</th> -->
									<th>详情</th>
								<!-- 	<th>图表</th> -->
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${requestScope.projects}" var="project"
							varStatus="stat">
							<tr id="data_${stat.index}" >
								<td>${stat.count}</td>
							
								
							<td><a target="_self" href="${pageContext.request.contextPath }/user/selectProjectbug?pro_id=${project.pro_id}">${project.pro_name }</a></td>
							
								<td>${project.manager.username}</td>
							<!-- 	<td > -->
								<%-- <a target="_self"  href="${pageContext.request.contextPath }/project/updateProject?flag=1&pro_id=${project.pro_id}">
										修改</a></td>
								<td ><a target="_self"
									href="${pageContext.request.contextPath }/project/removeProject?pro_id=${project.pro_id}">
										 删除</a></td> --%>
								<td ><a target="_self"
									href="${pageContext.request.contextPath }/project/detailProject?pro_id=${project.pro_id}"> 
										详情</a>
										</td>
										
									<%-- <a target="_self" href="${pageContext.request.contextPath }/project/statistics?pro_id=${project.pro_id}" title="图表统计">
										图表</a>
										</td> --%>
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