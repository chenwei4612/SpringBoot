<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>订单统计</title>
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
    <div id="chartmain" style="float:left;width: 400px;height:400px;"></div>
    <div id="chartmain2" style="float:left;width: 400px;height:400px;"></div>
    <div id="chartmain3" style="float:left;width: 400px;height:400px;"></div>
</div>
	<script type="text/javascript">
		var tt1 = [];
		var tt2 = [];
		var tt3 = [];
		var tt4 = [];
		var tt5 = [];
		var tt6 = [];
		$(function() {
			//alert("1111");
			//去首页
			OrdCount();
			OrdCount2();
			OrstCount();
		});

		function OrdCount() {
			$.ajax({
				url : "${APP_PATH}/OrdCount",
				type : "GET",
				success : function(result) {
					console.log(result);
					build_emps(result)
				}
			});
		}
		function build_emps(result) {
			var emps = result.extend.ords;
			console.log(emps);
			if (emps.length > 0) {
				for (var i = 0; i < emps.length; i++) {
					tt1[i] = emps[i].date;
					tt2[i] = emps[i].num;
				}
			}
			// 使用刚指定的配置项和数据显示图表。
			MChart();
		}
		function MChart() {
			//指定图标的配置和数据
			var option = {
				title : {
					text : '以年为单位 统计订单量'
				},
				tooltip : {},
				legend : {
					data : [ '用户来源' ]
				},
				xAxis : {
					//data : [ "Android", "IOS", "PC", "Ohter" ]
					data : tt1
				},
				yAxis : {

				},
				series : [ {
					name : '订单量',
					type : 'line',
					//data : [ 500, 200, 360, 100 ]
					data : tt2
				} ]
			};
			//初始化echarts实例
			var myChart = echarts.init(document.getElementById('chartmain'));

			//使用制定的配置项和数据显示图表
			myChart.setOption(option);
		}
		function OrdCount2() {
			$.ajax({
				url : "${APP_PATH}/OrdCount2",
				type : "GET",
				success : function(result) {
					console.log(result);
					build_emps2(result)
				}
			});
		}
		function build_emps2(result) {
			var emps = result.extend.ords;
			console.log(emps);
			if (emps.length > 0) {
				for (var i = 0; i < emps.length; i++) {
					tt3[i] = emps[i].date;
					tt4[i] = emps[i].num;
				}
			}
			// 使用刚指定的配置项和数据显示图表。
			MChart2();
		}
		function MChart2() {
			//指定图标的配置和数据
			var option = {
				title : {
					text : '以月为单位 统计订单量'
				},
				tooltip : {},
				legend : {
					data : [ '用户来源' ]
				},
				xAxis : {
					//data : [ "Android", "IOS", "PC", "Ohter" ]
					data : tt3
				},
				yAxis : {

				},
				series : [ {
					name : '订单量',
					type : 'line',
					//data : [ 500, 200, 360, 100 ]
					data : tt4
				} ]
			};
			//初始化echarts实例
			var myChart = echarts.init(document.getElementById('chartmain2'));

			//使用制定的配置项和数据显示图表
			myChart.setOption(option);
		}
		function OrstCount() {
			$.ajax({
				url : "${APP_PATH}/OrstCount",
				type : "GET",
				success : function(result) {
					console.log(result);
					build_emps3(result)
				}
			});
		}
		function build_emps3(result) {
			var emps = result.extend.orsts;
			console.log(emps);
			if (emps.length > 0) {
				for (var i = 0; i < emps.length; i++) {
					tt5[i] = emps[i].roId;
					tt6[i] = emps[i].num;
				}
			}
			// 使用刚指定的配置项和数据显示图表。
			MChart3();
		}
		function MChart3() {
			// 基于准备好的dom，初始化echarts实例
            var myChart = echarts.init(document.getElementById('chartmain3'));

            // 指定图表的配置项和数据
            var option = {
                title: {
                    text: '线路运输订单数量'
                },
                tooltip: {},
                legend: {
                    data:['数量']
                },
                xAxis: {
                	data: tt5
                },
                yAxis: {},
                series: [{
                    name: '数量',
                    type: 'bar',
                    data: tt6
                }]
            };
         // 使用刚指定的配置项和数据显示图表。
            myChart.setOption(option);
		}
	</script>
</body>
</html>