<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%--  <jsp:forward page="/emps"></jsp:forward> --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>home</title>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<!-- web路径：
不以/开始的相对路径，找资源，以当前资源的路径为基准，经常容易出问题。
以/开始的相对路径，找资源，以服务器的路径为标准(http://localhost:3306)；需要加上项目名
		http://localhost:3306/crud
 -->
<script type="text/javascript"
	src="${APP_PATH }/static/js/jquery-1.12.4.min.js"></script>
<link
	href="${APP_PATH }/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="${APP_PATH }/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>
	<h1 class="modal-title text-center">ARASHI</h1>
	<!--轮播图-->
	<div class="container">
		<div class="carousel slide" id="slidershow" data-ride="carousel"
			data-interval="2000">
			<!--计数器-->
			<ol class="carousel-indicators">
				<li class="active" data-target="#slidershow" data-slide-to="0"></li>
				<li data-target="#slidershow" data-slide-to="1"></li>
				<li data-target="#slidershow" data-slide-to="2"></li>
			</ol>
			<!--图片容器-->
			<div class="carousel-inner">
				<div class="item active">
					<img src="http://global.bing.com/az/hprichbg/rb/RavenWolf_EN-US4433795745_1920x1080.jpg" />
					<!--添加对应标题和内容-->
					<div class="carousel-caption">
						<h4>图一</h4>
						<span>内容</span>
					</div>
				</div>
				<div class="item">
					<img src="http://global.bing.com/az/hprichbg/rb/RavenWolf_EN-US4433795745_1920x1080.jpg" />
					<!--添加对应标题和内容-->
					<div class="carousel-caption">
						<h4>图二</h4>
					</div>
				</div>
				<div class="item">
					<img src="http://global.bing.com/az/hprichbg/rb/RavenWolf_EN-US4433795745_1920x1080.jpg" />
					<!--添加对应标题和内容-->
					<div class="carousel-caption">
						<h4>图三</h4>
					</div>
				</div>
				<!--轮播导航-->
				<a href="#slidershow" data-slide="prev"
					class="left carousel-control" role="button"> <img
					src="http://global.bing.com/az/hprichbg/rb/RavenWolf_EN-US4433795745_1920x1080.jpg" />
				</a> <a href="#slidershow" data-slide="next"
					class="right carousel-control" role="button"> <img
					src="http://global.bing.com/az/hprichbg/rb/RavenWolf_EN-US4433795745_1920x1080.jpg" />
				</a>
			</div>
		</div>
	</div>

</body>
</html>
