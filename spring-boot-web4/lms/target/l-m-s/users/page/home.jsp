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
<h1 class="modal-title text-center">2020-LMS物流管理系统</h1>
<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
        <!-- 指示器 -->
        <ol class="carousel-indicators">
          <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
          <li data-target="#carousel-example-generic" data-slide-to="1"></li>
          <li data-target="#carousel-example-generic" data-slide-to="2"></li>
          <li data-target="#carousel-example-generic" data-slide-to="3"></li>
        </ol>
      
        <!-- 轮播图片及说明文字 -->
        <div class="carousel-inner" role="listbox">
          <div class="item active">
            <img src="${APP_PATH }/static/img/banner1.png" alt="图片1">
            <div class="carousel-caption">
              2020-LMS物流管理系统
            </div>
          </div>
          <div class="item">
            <img src="${APP_PATH }/static/img/banner2.png" alt="图片2">
            <div class="carousel-caption">
              2020-LMS物流管理系统
            </div>
          </div>
          <div class="item">
            <img src="${APP_PATH }/static/img/banner3.png" alt="图片3">
            <div class="carousel-caption">
              2020-LMS物流管理系统
            </div>
          </div>
          <div class="item">
            <img src="${APP_PATH }/static/img/banner4.png" alt="图片4">
            <div class="carousel-caption">
              2020-LMS物流管理系统
            </div>
          </div>
          
      
        <!-- 控制按钮：左右切换 -->
        <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
          <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
          <span class="sr-only">Previous</span>
        </a>
        <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
          <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
          <span class="sr-only">Next</span>
        </a>
      </div>
</body>
</html>
 