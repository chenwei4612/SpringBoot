<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>车辆统计</title>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<!-- 最新版本的 Bootstrap 核心 CSS 文件 引入样式-->
<script type="text/javascript"
	src="${APP_PATH }/static/js/jquery-1.12.4.min.js"></script>
<link
	href="${APP_PATH }/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="${APP_PATH }/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script src="${APP_PATH }/static/js/echarts.js"></script>
<script src="${APP_PATH }/static/js/echarts.min.js"></script>
<script src="${APP_PATH }/staticjs/cfgopts.js"></script>
</head>
<body>
	<div>
	<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
    <div id="chartmain" style="float:left;width: 500px;height:400px;"></div>
    <div id="chartmain2" style="float:left;width: 500px;height:400px;"></div>
</div>
	<script type="text/javascript">
		var tt1 = [];
		var tt2 = [];
		var tt3 = [];
		var tt4 = [];
		$(function() {
			//alert("1111");
			//去首页
			CarCount();
			CarCount2();
		});

		function CarCount() {
			$.ajax({
				url : "${APP_PATH}/CarCount",
				type : "GET",
				success : function(result) {
					console.log(result);
					build_emps(result)
				}
			});
		}
		function build_emps(result) {
			var emps = result.extend.cars;
			console.log(emps);
			console.log(emps.length);
			if (emps.length > 0) {
				for (var i = 0; i < emps.length; i++) {
					tt1[i] = emps[i].roadId;
					tt2[i] = emps[i].num;
				}
			}
			// 使用刚指定的配置项和数据显示图表。
			MChart();
		}
		function MChart() {
			// 基于准备好的dom，初始化echarts实例
            var myChart = echarts.init(document.getElementById('chartmain'));

            // 指定图表的配置项和数据
            var option = {
                title: {
                    text: '统计各线路车辆次数 柱形图'
                },
                tooltip: {},
                legend: {
                    data:['次数']
                },
                xAxis: {
                	data: tt1
                },
                yAxis: {},
                series: [{
                    name: '数量',
                    type: 'bar',
                    data: tt2
                }]
            };
         // 使用刚指定的配置项和数据显示图表。
            myChart.setOption(option);
		}
		function CarCount2() {
			$.ajax({
				url : "${APP_PATH}/CarCount2",
				type : "GET",
				success : function(result) {
					console.log(result);
					build_emps2(result)
				}
			});
		}
		function build_emps2(result) {
			var emps = result.extend.cars;
			console.log(emps);
			console.log(emps.length);
			if (emps.length > 0) {
				for (var i = 0; i < emps.length; i++) {
					if(emps[i].carType==0){
						tt3[i] = "重型货车";
					}else if(emps[i].carType==1){
						tt3[i] = "中型货车";
					}else if(emps[i].carType==2){
						tt3[i] = "轻型货车";
					}else if(emps[i].carType==3){
						tt3[i] = "电动车";
					}
					tt4[i] = emps[i].num;
				}
			}
			// 使用刚指定的配置项和数据显示图表。
			MChart2();
		}
		function MChart2() {
			// 基于准备好的dom，初始化echarts实例
            var myChart = echarts.init(document.getElementById('chartmain2'));

            // 指定图表的配置项和数据
            var option = {
                title: {
                    text: '各种车辆类型统计 柱形图'
                },
                tooltip: {},
                legend: {
                    data:['车辆类型']
                },
                xAxis: {
                	data: tt3
                },
                yAxis: {},
                series: [{
                    name: '车辆数量',
                    type: 'bar',
                    data: tt4
                }]
            };
         // 使用刚指定的配置项和数据显示图表。
            myChart.setOption(option);
		}
	</script>
</body>
</html>