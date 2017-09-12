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
<body onresize="change()">
<a href="javascript:history.go(-1)">返回上一页</a> 
 <div  id="reporter"  style="width:90%;height:90%;position: fixed;left: 2%;">
 </div>
 <script type="text/javascript">
 function change()
 {
	document.getElementById("reporter").style.width="width:document.body.scrollWidth px"; 
	document.getElementById("reporter").style.width="height:document.body.scrollHeight  px";
	window.location.reload();
 }
 </script>
 
  <script type="text/javascript">
        // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('reporter'));
       //获得后台数据
		var keyusername_data;//类型信息
		var nummap;
		var hostnumber;
		var handlernumber;
		var signnumber;
		var money;
		var score;
		$.ajax({
			url:'${pageContext.request.contextPath }/user/number',
			async:false,
			success: function(data){
				keyusername_data=data.keyname;
			    hostnumber=data.hostnumber;
			    handlernumber=data.handlernumber;
			    signnumber=data.signnumber;
			    money=data.money;
			    score=data.score;
			}
			})
	 		option = {
    title: {
        text: '用户图表'
    },
    tooltip: {
        trigger: 'axis'
    },
    legend: {
        data:['提交个数','处理个数','签到数','分数','金币']
    },
    grid: {
        left: '3%',
        right: '4%',
        bottom: '3%',
        containLabel: true
    },
    toolbox: {
        feature: {
            saveAsImage: {}
        }
    },
    xAxis: {
        type: 'category',
        boundaryGap: false,
        data: keyusername_data
    },
    yAxis: {
        type: 'value'
    },
    series: [
        {
            name:'提交个数',
            type:'line',
       
            data:hostnumber
        } ,
        {
            name:'处理个数',
            type:'line',
        
            data:handlernumber
        },
        {
            name:'签到数',
            type:'line',
            data:signnumber
        }
        ,
        {
            name:'分数',
            type:'line',
            data:score
        }
        ,
        {
            name:'金币',
            type:'line',
            data:money
        }
    ]
}; 
        // 使用刚指定的配置项和数据显示图表。
        myChart.setOption(option);
    </script> 

</body>
</html>