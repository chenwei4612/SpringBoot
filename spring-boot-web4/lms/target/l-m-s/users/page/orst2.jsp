<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <jsp:forward page="/routes"></jsp:forward> --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>订单状态查询</title>
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
<!-- 订单状态查询的模态框 -->
	<div class="modal fade" id="orstOCARIDModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">查询运送车辆</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal">
					<div class="form-group">
							<label class="col-sm-2 control-label">车辆Id:</label>
							<div class="col-sm-10">
								<input type="text" name="carId" class="form-control"
									id="carId_input" placeholder="carId"> <span
									class="help-block"></span>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" id="orst_carcheck_btn">查询</button>
				</div>
			</div>
		</div>
	</div>
<!-- 订单状态添加的模态框 -->
	<div class="modal fade" id="orstOORIDModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">订单状态查询</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal">
						<div class="form-group">
							<label class="col-sm-2 control-label">订单Id:</label>
							<div class="col-sm-10">
								<input type="text" name="orId" class="form-control"
									id="orId_input" placeholder="orId"> <span
									class="help-block"></span>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" id="orst_orcheck_btn">查询</button>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 订单状态查询的模态框 -->
	<div class="modal fade" id="orststidModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">查询仓库</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal">
					<div class="form-group">
							<label class="col-sm-2 control-label">仓库Id:</label>
							<div class="col-sm-10">
								<input type="text" name="stId" class="form-control"
									id="stId_input" placeholder="stId"> <span
									class="help-block"></span>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" id="orst_stcheck_btn">查询</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 搭建显示页面 -->
	<div class="container">
		<!-- title -->
		<div class="row">
			<div class="col-md-8 col-md-offset-1">
				<h1>订单运输状态</h1>
			</div>
		</div>
		<!-- 按钮 -->
		<div class="row">
			<div class="col-md-5 col-md-offset-6">
			<button class="btn btn-primary" id="orst_carid_modal_btn">
				<span class="glyphicon glyphicon-search" aria-hidden="true"></span>运送车辆查询</button>
				<button class="btn btn-primary" id="orst_stid_modal_btn">
				<span class="glyphicon glyphicon-search" aria-hidden="true"></span>仓库查询</button>
				<button class="btn btn-primary" id="orst_orid_modal_btn">
				<span class="glyphicon glyphicon-search" aria-hidden="true"></span>订单查询</button>
			</div>
		</div>
		<!-- 显示表格数据 -->
		<div class="row">
			<div class="col-md-9 col-md-offset-1">
				<table class="table table-hover" id="orsts_table">
					<thead>
						<tr>
							<th><input type="checkbox" id="check_all" /></th>
							<th>仓库Id</th>
							<th>订单Id</th>
							<th>运输状态</th>
							<th>线路Id</th>
							<th>车辆Id</th>
						</tr>
					</thead>
					<tbody>

					</tbody>
				</table>
			</div>
		</div>

		<!-- 显示分页信息 -->
		<div class="row">
			<!--分页文字信息  -->
			<div class="col-md-5 col-md-offset-1" id="page_info_area"></div>
			<!-- 分页条信息 -->
			<div class="col-md-5" id="page_nav_area"></div>
		</div>
	</div>
	<script type="text/javascript">
		var totalRecord, currentPage;
		//1.页面加载完成以后，直接去发送一个ajax请求，要到分页数据
		$(function() {
			//去首页
			to_page(1);
		});

		function to_page(pn) {
			$.ajax({
				url : "${APP_PATH}/orsts",
				data : "pn=" + pn,
				type : "GET",
				success : function(result) {
					//console.log(result);
					//1.解析并显示员工数据
					build_orsts_table(result);
					//2.解析并显示分页信息
					build_page_info(result);
					//3.解析并显示分页条
					build_page_nav(result);
				}
			});
		}

		function build_orsts_table(result) {
			//清空table表格
			$("#orsts_table tbody").empty();
			var orsts = result.extend.pageInfo.list;
			$.each(orsts,function(index, item) {
						//aler(item.empName);
						var checkBoxTd = $("<td><input type='checkbox' class='check_item'/></td>");
						var stId = $("<td></td>").append(item.stId);
						var orId = $("<td></td>").append(item.orId);
						var roId = $("<td></td>").append(item.roId);
						var carId = $("<td></td>").append(item.carId);
						var status = $("<td></td>").append(
								item.status == 0 ? "等待运输" : ((item.status == 1 )?"运输中":((item.status == 2 )?"未派送":"派送中")));
						//append方法执行完成以后还是返回原来的元素
						$("<tr></tr>").append(checkBoxTd).append(stId).append(orId)
								.append(status).append(roId).append(carId).appendTo("#orsts_table tbody");
					});
		}
		//解析显示分页信息
		function build_page_info(result) {
			$("#page_info_area").empty();
			$("#page_info_area").append(
					"当前" + result.extend.pageInfo.pageNum + "页，共"
							+ result.extend.pageInfo.pages + "页,总"
							+ result.extend.pageInfo.total + "条记录数");
			totalRecord = result.extend.pageInfo.total;
			currentPage = result.extend.pageInfo.pageNum;
		}
		//解析显示分页条，点击分页要能去下一页....
		function build_page_nav(result) {
			//page_nav_area
			$("#page_nav_area").empty();
			var ul = $("<ul></ul>").addClass("pagination");

			//构建元素
			var firstPageLi = $("<li></li>").append(
					$("<a></a>").append("首页").attr("href", "#"));
			var prePageLi = $("<li></li>").append(
					$("<a></a>").append("&laquo;"));
			if (result.extend.pageInfo.hasPreviousPage == false) {
				firstPageLi.addClass("disabled");
				prePageLi.addClass("disabled");
			} else {
				//为元素添加点击翻页的事件
				firstPageLi.click(function() {
					to_page(1);
				});
				prePageLi.click(function() {
					to_page(result.extend.pageInfo.pageNum - 1);
				});
			}

			var nextPageLi = $("<li></li>").append(
					$("<a></a>").append("&raquo;"));
			var lastPageLi = $("<li></li>").append(
					$("<a></a>").append("末页").attr("href", "#"));
			if (result.extend.pageInfo.hasNextPage == false) {
				nextPageLi.addClass("disabled");
				lastPageLi.addClass("disabled");
			} else {
				nextPageLi.click(function() {
					to_page(result.extend.pageInfo.pageNum + 1);
				});
				lastPageLi.click(function() {
					to_page(result.extend.pageInfo.pages);
				});
			}

			//添加首页和前一页的提示
			ul.append(firstPageLi).append(prePageLi);
			//1,2,3遍历给ul中添加页码提示
			$.each(result.extend.pageInfo.navigatepageNums, function(index,
					item) {

				var numLi = $("<li></li>").append($("<a></a>").append(item));
				if (result.extend.pageInfo.pageNum == item) {
					numLi.addClass("active");
				}
				numLi.click(function() {
					to_page(item);
				});
				ul.append(numLi);
			});
			//添加下一页和末页 的提示
			ul.append(nextPageLi).append(lastPageLi);

			//把ul加入到nav
			var navEle = $("<nav></nav>").append(ul);
			navEle.appendTo("#page_nav_area");
		}

		//清空表单样式及内容
		function reset_form(ele) {
			$(ele)[0].reset();
			//清空表单样式
			$(ele).find("*").removeClass("has-error has-success");
			$(ele).find(".help-block").text("");
		}
		
		//点击ST查询按钮弹出模态框。
		$("#orst_stid_modal_btn").click(function() {
			//清除表单数据（表单完整重置（表单的数据，表单的样式））
			reset_form("#orststidModal form");
			//发送ajax请求，查出route信息，显示在下拉列表中
			//getRoutets("#orstAddModal select");
			//弹出模态框
			$("#orststidModal").modal({
				backdrop : "static"
			});
		});
		function to_page2(pn,stId) {
			//var stId=$("#orststidModal form").serialize();
			console.log(stId);
			$.ajax({
				url : "${APP_PATH}/orstsST/"+stId,
				data : "pn=" + pn,
				type : "GET",
				success : function(result) {
					//console.log(result);
					//1.解析并显示员工数据
					build_orsts_table(result);
					//2.解析并显示分页信息
					build_page_info(result);
					//3.解析并显示分页条
					build_page_nav(result);
				}
			});
		}
		//点击ST查询。
		$("#orst_stcheck_btn").click(function(){
			var stId=$("#stId_input").val();
			to_page2(1,stId);
			//1、关闭对话框
			$("#orststidModal").modal("hide");
		});
		//
		//点击OR查询按钮弹出模态框。
		$("#orst_orid_modal_btn").click(function() {
			//清除表单数据（表单完整重置（表单的数据，表单的样式））
			reset_form("#orstOORIDModal form");
			//发送ajax请求，查出route信息，显示在下拉列表中
			//getRoutets("#orstAddModal select");
			//弹出模态框
			$("#orstOORIDModal").modal({
				backdrop : "static"
			});
		});
		function to_page3(pn,orId) {
			//var stId=$("#orststidModal form").serialize();
			console.log(orId);
			$.ajax({
				url : "${APP_PATH}/orstsOR/"+orId,
				data : "pn=" + pn,
				type : "GET",
				success : function(result) {
					//console.log(result);
					//1.解析并显示员工数据
					build_orsts_table(result);
					//2.解析并显示分页信息
					build_page_info(result);
					//3.解析并显示分页条
					build_page_nav(result);
				}
			});
		}
		//点击OR查询。
		$("#orst_orcheck_btn").click(function(){
			var orId=$("#orId_input").val();
			to_page3(1,orId);
			//1、关闭对话框
			$("#orstOORIDModal").modal("hide");
		});
		//car
		//点击CAR查询弹出模态框。
		$("#orst_carid_modal_btn").click(function() {
			//清除表单数据（表单完整重置（表单的数据，表单的样式））
			reset_form("#orstOCARIDModal form");
			//发送ajax请求，查出route信息，显示在下拉列表中
			//getRoutets("#orstAddModal select");
			//弹出模态框
			$("#orstOCARIDModal").modal({
				backdrop : "static"
			});
		});
		function to_page4(pn,carId) {
			//var stId=$("#orststidModal form").serialize();
			console.log(carId);
			$.ajax({
				url : "${APP_PATH}/orstscar/"+carId,
				data : "pn=" + pn,
				type : "GET",
				success : function(result) {
					console.log(result);
					//1.解析并显示员工数据
					build_orsts_table(result);
					//2.解析并显示分页信息
					build_page_info(result);
					//3.解析并显示分页条
					build_page_nav(result);
				}
			});
		}
		//点击CAR查询。
		$("#orst_carcheck_btn").click(function(){
			var carId=$("#carId_input").val();
			to_page4(1,carId);
			//1、关闭对话框
			$("#orstOCARIDModal").modal("hide");
		});
	</script>
</body>
</html>
