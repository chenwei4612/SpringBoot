<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%> --%>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<%-- <c:set var="ctx" value="${pageContext.request.contextPath}"></c:set> --%>
<!-- <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html> -->
  <head>
    <%-- <base href="<%=basePath%>"> --%>
    
    <title>My JSP 'map.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<%-- <script src="${ctx }/ui/jquery-1.7.2.min.js"></script> --%>
	<%-- <script src="${ctx }/ui/echarts/echarts-3.2.3/dist/echarts.js"></script>
	<script src="${ctx }/ui/echarts/echarts-3.2.3/options/cfgopts.js"></script> --%>
	<script type="text/javascript" src="/static/js/jquery-1.12.4.min.js"></script>
	<script src="static/bootstrap-3.3.7-dist/js/echarts.js" ></script>
	<script src="static/bootstrap-3.3.7-dist/js/cfgopts.js" ></script>
  </head>
 
<body>
	<style>
		html,body,#main {
			width: 100%;
			height: 100%;
			margin: 0;
			background-color: #00CC33;
		}
	</style>
	<div id="pie" style="width: 600px;height: 400px;"></div>
	<script>
		var pieChart;
		$(function() {
			pieChart = echarts.init(document.getElementById("pie"));
 
			showPie();
		});
 
		function showPie() {
			var pieOpt = getPieOpt();
			pieOpt.title.text = '饼形图';
			pieOpt.series[0].name = '饼形图';
			pieChart.setOption(pieOpt);
		}
	</script>
</body>
</html>