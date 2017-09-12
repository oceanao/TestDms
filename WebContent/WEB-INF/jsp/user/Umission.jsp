<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath }/css/bug.css" type="text/css" rel="stylesheet" />
<link href="${pageContext.request.contextPath }/css/table.css" type="text/css" rel="stylesheet" />
</head>
<body>
<div class="exp1"> 当前位置：普通用户
/
    <a href="${pageContext.request.contextPath }/user/mission"  target= "iFrame1 ">修复缺陷</a>
</div>



<br>
<br>
<div class="table"> 

				<table  class="altrowstable"  id="alternatecolor"  width="82.5%" >	<!-- style="border:#c2c6cc 1px solid; border-collapse:collapse;"	 -->			
					<tr align="center">
						<th>序号</th>
						<th width="60%">标题</th>
					
						<th >缺陷状态</th>
						<th>提交人</th>
										
						
						<th align="center">操作</th>
					</tr>
					<c:forEach items="${requestScope.bugs}" var="bug" varStatus="stat">
						<tr id="data_${stat.index}" align="center">
							<td>${stat.count }</td>
							<td align="left">${bug.summary}</td>
						
							<td><c:choose>
									<c:when test="${bug.bug_status == 1 }">New</c:when>
									<c:when test="${bug.bug_status == 2 }">Open</c:when>
									<c:when test="${bug.bug_status == 3 }">Assigned</c:when>
									<c:when test="${bug.bug_status == 4 }">Handled</c:when>
									<c:when test="${bug.bug_status == 5 }">Closed</c:when>
									<c:when test="${bug.bug_status == 6 }">Reopen</c:when>
									<c:otherwise>无</c:otherwise>
								</c:choose></td>
							<td>${bug.reporter.username }</td>
							
							<td align="center"><a
								href="${pageContext.request.contextPath }/user/updateBug?flag=1&&bug_id=${bug.bug_id}" title="修复缺陷">
									<img src="${pageContext.request.contextPath }/image/update.ico" style="width: 20px;height: 20px;"></a></td>
						</tr>
						
					</c:forEach>
				</table>
		<!-- 分页标签 -->
		<table>
		<tr valign="top">
			<td align="center"><fkjava:pager
					pageIndex="${requestScope.pageModel.pageIndex}"
					pageSize="${requestScope.pageModel.pageSize}"
					recordCount="${requestScope.pageModel.recordCount}" 
					style="digg"
					submitUrl="${pageContext.request.contextPath }/user/mission?pageIndex={0}" /></td>
		</tr>
	  </table>
	</div>
	<div style="height: 10px;"></div>
</body>
</html> --%>