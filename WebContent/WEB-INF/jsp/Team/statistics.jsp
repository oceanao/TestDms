<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- <script src="https://git.oschina.net/oceanao/js/raw/master/echarts.js"></script>
<script src="https://git.oschina.net/oceanao/js/raw/master/jquery-1.8.3.min.js"></script> -->
<script src="${pageContext.request.contextPath}/static/js/echarts.js"></script>
<script src="${pageContext.request.contextPath}/static/js/jquery-1.8.3.min.js"></script>
<title>图表统计</title>
<%-- <link href="${pageContext.request.contextPath }/css/bug.css" type="text/css" rel="stylesheet" />
<link href="${pageContext.request.contextPath }/css/project.css" type="text/css" rel="stylesheet" /> --%>
</head>
<body>
<a href="javascript:history.go(-1)">返回上一页</a> 
<div class="exp1">  当前位置：${project.pro_name }/图表统计

</div>
<input type="hidden" name="pro_id" value="${pro_id }">
 <div id="ponderance" style="width: 700px;height:100%;position: fixed;left: 200px;right:20px;">
 </div>
 <br>
 <br>
 <br>
  <div id="reporter" style="width: 700px;height:100%;position: fixed;left: 200px;right:20px;"></div> 
    <script type="text/javascript">
        // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('ponderance'));
       //获得后台数据
 		var keyname_data;//类型信息
/*		var keyvalue_data;//软件部销售数据 */
		var nummap;
		$.ajax({
			url:'${pageContext.request.contextPath }/project/countByPonderance',
			async:false,
			success: function(data){
 				keyname_data=data.keyname;
			keyvalue_data=data.keyvalue; 
				nummap=data.nummap;
				}
/* 			error: funtion(erroeMsg){
				alert("图表请求失败！");
			} */
			})
        // 指定图表的配置项和数据
/*         var option = {
            title: {
                text: '按缺陷严重级别统计'
            },
            tooltip: {},
            legend: {
                data:['缺陷个数']
            },
            xAxis: {
            	type: 'category',
                data:keyname_data//[${requestScope.keyname_data}]
            },
            yAxis: {
            	type : 'value'
            },
            series: [{
                name: '缺陷个数',
                type: 'bar',
                data:keyvalue_data//[${requestScope.keyvalue_data}]
            }]
        }; */
        option = {
        	    title : {
        	        text: '按缺陷严重级别统计',   
        	        x:'center'
        	    },
        	    tooltip : {
        	        trigger: 'item',
        	        formatter: "{a} <br/>{b} : {c} ({d}%)"
        	    },
        	    legend: {
        	        orient: 'vertical',
        	        left: 'left',
        	        data: keyname_data
        	    },
        	    series : [
        	        {
        	            name: '缺陷个数',
        	            type: 'pie',
        	            radius : '55%',
        	            center: ['50%', '60%'],
        	            data:nummap,
        	            itemStyle: {
        	                emphasis: {
        	                    shadowBlur: 10,
        	                    shadowOffsetX: 0,
        	                    shadowColor: 'rgba(0, 0, 0, 0.5)'
        	                }
        	            }
        	        }
        	    ]
        	};
        // 使用刚指定的配置项和数据显示图表。
        myChart.setOption(option);
    </script>
    
    
  <script type="text/javascript">
        // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('reporter'));
       //获得后台数据
		var keyusername_data;//类型信息
		var keynum_data;//软件部销售数据
		$.ajax({
			url:'${pageContext.request.contextPath }/project/countByReporter',
			async:false,
			success: function(data){
				keyusername_data=data.keyusername;
				keynum_data=data.keynum;}

			
			})
        var option = {
			
			color: ['#96cbcb'],
            title: {
                text: '按提交人统计'
            },
            tooltip: {},
            legend: {
                data:['缺陷个数']
            },
            xAxis: {
            	type: 'category',
                data:keyusername_data//[${requestScope.keyname_data}]
            },
            yAxis: {
            	type : 'value'
            },
            series: [{
                name: '缺陷个数',
                type: 'bar',
                data:keynum_data//[${requestScope.keyvalue_data}]
            }]
        };
        // 使用刚指定的配置项和数据显示图表。
        myChart.setOption(option);
    </script> 

</body>
</html>