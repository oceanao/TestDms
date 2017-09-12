<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 


<script src="${pageContext.request.contextPath}/static/js/echarts.js"></script>
<script src="${pageContext.request.contextPath}/static/js/jquery-1.8.3.min.js"></script>
<title>图表统计</title>

</head>
<body>
<div>
	<a href="javascript:history.go(-1)">返回上一页</a>
	<a class="close-link" href="javascript:window.location.reload(); ">
		刷新 </a>
		</div>
 <div  id="project" style="width: 50%;height:50%;position: fixed;left:1%;"></div>
 <div  id="priority" style="width: 50%;height:50%;position: fixed;left:1%; "></div>
 <div  id="ponderance" style="width: 50%;height:50%;position: fixed;left:1%; "> </div>
   <div id="reporter" style="width: 50%;height:50%;position: fixed;left:1%; "></div>
 <script type="text/javascript">
        // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('project'));
       //获得后台数据
 		var keyname_data;//类型信息
		var nummap;
		$.ajax({
			url:'${pageContext.request.contextPath }/bug/countByProject',
			async:false,
			success: function(data){
 				keyname_data=data.keyname;
			keyvalue_data=data.keyvalue; 
				nummap=data.nummap;
				}
			})
 
        option = {
        	    title : {
        	        text: '按缺陷项目统计',   
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
        var myChart = echarts.init(document.getElementById('ponderance'));
       //获得后台数据
 		var keyname_data;//类型信息
/*		var keyvalue_data;//软件部销售数据 */
		var nummap;
		$.ajax({
			url:'${pageContext.request.contextPath }/bug/countByPonderance',
			async:false,
			success: function(data){
 				keyname_data=data.keyname;
			keyvalue_data=data.keyvalue; 
				nummap=data.nummap;
				}
			})
 
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
			url:'${pageContext.request.contextPath }/bug/countByReporter',
			async:false,
			success: function(data){
				keyusername_data=data.keyusername;
				keynum_data=data.keynum;}
			})
      var option = {
			
			color: ['#96c1cb'],
            title: {
                text: '按提交人统计',
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
    
    

 
 <script type="text/javascript">
        // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('priority'));
  
        var Newnum=0;
		var Assignednum=0;
		var Opennum=0;
		var Fixednum=0;
		var Rejectednum=0;
		var Postponednum=0;
		var Closednum=0;
		var Reopennum=0;
        
        
		var nummap;
		$.ajax({
			url:'${pageContext.request.contextPath }/bug/priority',
			async:false,
			success: function(data){
				Newnum=data.Newnum;
				Assignednum=data.Assignednum; 
				Opennum=data.Opennum;
				 Fixednum=data.Fixednum;
				 Rejectednum=data.Rejectednum;
				 Postponednum=data.Postponednum;
				 Closednum=data.Closednum;
				 Reopennum=data. Reopennum;
				}
			})
		        
		        
		         option = {
		        title : {
		        text: '缺陷状态',
		        subtext: '缺陷所属状态',
		        x:'center'
		    },
		        	    tooltip: {
		        	        trigger: 'item',
		        	        formatter: "{a} <br/>{b}: {c} ({d}%)"
		        	    },
		        	    legend: {
		        	        orient: 'vertical',
		        	        x: 'left',
		        	    	data:['New','Assigned','Open','Fixed','Rejected','Postponed','Closed','Reopen']
		        	    },
		        	    series: [
		        	        {
		        	            name:'缺陷状态',
		        	            type:'pie',
		        	            radius: ['50%', '70%'],
		        	            avoidLabelOverlap: false,
		        	            label: {
		        	                normal: {
		        	                    show: false,
		        	                    position: 'center'
		        	                },
		        	                emphasis: {
		        	                    show: true,
		        	                    textStyle: {
		        	                        fontSize: '30',
		        	                        fontWeight: 'bold'
		        	                    }
		        	                }
		        	            },
		        	            labelLine: {
		        	                normal: {
		        	                    show: false
		        	                }
		        	            },
		        	            data:[
		        	                {value:Newnum, name:'New'},
		        	                {value:Assignednum, name:'Assigned'},
		        	                {value:Opennum, name:'Open'},
		        	                {value:Fixednum, name:'Fixed'},
		        	                {value:Rejectednum, name:'Rejected'},
		        	                {value:Postponednum, name:'Postponed'},
		        	                {value:Closednum, name:'Closed'},
		        	                {value:Reopennum, name:' Reopen'}
		        	            ]
		        	        }
		        	    ]
		        	}; 
		        	
		     
        // 使用刚指定的配置项和数据显示图表。
        myChart.setOption(option);
    </script>
 
    
    
           

</body>
</html>