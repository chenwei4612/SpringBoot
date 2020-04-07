<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>cw物流管理系统</title>
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
<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
<div id="main" style="border:1px solid red;width:900px;height:600px;
margin-left:18%;"></div>
<script type="text/javascript">
 
//先加载后台数据 对获取的数据进行分组 且写入对应位置的数组中
/* var mycars=new Array('日', '一', '二', '三', '四', '五', '六');//string型数组
var mycarstow=new Array(10, 940, 908, 940, 1300, 1350, 1450);//int型数组
 */ 
 
// 基于准备好的dom，初始化echarts实例
var myChart = echarts.init(document.getElementById('main'));
 option = {
		    legend: {},
		    tooltip: {},
		    dataset: {
		        dimensions: ['product', '2015', '2016', '2017'],
		        source: [
		            {product: 'Matcha Latte', '2015': 43.3, '2016': 85.8, '2017': 93.7},
		            {product: 'Milk Tea', '2015': 83.1, '2016': 73.4, '2017': 55.1},
		            {product: 'Cheese Cocoa', '2015': 86.4, '2016': 65.2, '2017': 82.5},
		            {product: 'Walnut Brownie', '2015': 72.4, '2016': 53.9, '2017': 39.1}
		        ]
		    },
		    xAxis: {type: 'category'},
		    yAxis: {},
		    // Declare several bar series, each will be mapped
		    // to a column of dataset.source by default.
		    series: [
		        {type: 'bar'},
		        {type: 'bar'},
		        {type: 'bar'}
		    ]
		};

// 使用刚指定 optiontow 的配置项和数据显示图表。 optiontow是上面定义的样式 ，这个样式网站在下面
myChart.setOption(option);
</script>
</body>
</html>