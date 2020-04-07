<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <jsp:forward page="/routes"></jsp:forward> --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>线路列表</title>
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
<!-- 线路查询的模态框 -->
	<div class="modal fade" id="routecheckModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">线路查询</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal">
						<div class="form-group">
							<label class="col-sm-2 control-label">线路Id:</label>
							<div class="col-sm-10">
								<input type="text" name="RouteId" class="form-control"
									id="RouteId_input" placeholder="RouteId"> <span
									class="help-block"></span>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" id="route_check_btn">查询</button>
				</div>
			</div>
		</div>
	</div>
<!-- 线路修改的模态框 -->
	<div class="modal fade" id="routeAddModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">新线路添加</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal">
						<div class="form-group">
							<label class="col-sm-2 control-label">区域:</label>
							<div class="col-sm-10">
								<input type="text" name="area" class="form-control"
									id="area_add_input" placeholder="area"> <span
									class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">配送范围:</label>
							<div class="col-sm-10">
							<textarea class="form-control" rows="3" name="dscope" id="scope_add_input" placeholder="Distribution Scope"></textarea>
							</div>
						</div>
					</form>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" id="route_save_btn">保存</button>
				</div>
				</div>
			</div>
		</div>
	</div>
<!-- 新线路添加的模态框 -->
	<div class="modal fade" id="routeUpdateModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">线路修改</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal">
						<div class="form-group">
							<label class="col-sm-2 control-label">区域:</label>
							<div class="col-sm-10">
								<input type="text" name="area" class="form-control"
									id="area_update_input" placeholder="area"> <span
									class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">配送范围:</label>
							<div class="col-sm-10">
							<textarea class="form-control" rows="3" name="dscope" id="scope_update_input" placeholder="Distribution Scope"></textarea>
							</div>
						</div>
					</form>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" id="route_update_btn">保存</button>
				</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 搭建显示页面 -->
	<div class="container">
		<!-- title -->
		<div class="row">
			<div class="col-md-12">
				<h1>运输线路管理</h1>
			</div>
		</div>
		<!-- 按钮 -->
		<div class="row">
			<div class="col-md-4 col-md-offset-8">
				<button class="btn btn-primary" id="route_check_modal_btn">
				<span class="glyphicon glyphicon-search" aria-hidden="true"></span>查找</button>
				<button class="btn btn-primary" id="route_add_modal_btn">
				<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增</button>
				<button class="btn btn-danger" id="route_delete_all_btn">
				<span class="glyphicon glyphicon-trash"  aria-hidden="true"></span>删除</button>
			</div>
		</div>
		<!-- 显示表格数据 -->
		<div class="row">
			<div class="col-md-12">
				<table class="table table-hover" id="routes_table">
					<thead>
						<tr>
							<th><input type="checkbox" id="check_all" /></th>
							<th>线路Id</th>
							<th>区域</th>
							<th>配送范围</th>
							<th>操作</th>
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
			<div class="col-md-6" id="page_info_area"></div>
			<!-- 分页条信息 -->
			<div class="col-md-6" id="page_nav_area"></div>
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
				url : "${APP_PATH}/routes",
				data : "pn=" + pn,
				type : "GET",
				success : function(result) {
					//console.log(result);
					//1.解析并显示员工数据
					build_routes_table(result);
					//2.解析并显示分页信息
					build_page_info(result);
					//3.解析并显示分页条
					build_page_nav(result);
				}
			});
		}

		function build_routes_table(result) {
			//清空table表格
			$("#routes_table tbody").empty();
			var routes = result.extend.pageInfo.list;
			$.each(routes,
					function(index, item) {
						//aler(item.empName);
						var checkBoxTd = $("<td><input type='checkbox' class='check_item'/></td>");
						var rouId = $("<td></td>").append(item.rouId);
						var area = $("<td></td>").append(item.area);
						var drange = $("<td></td>").append(item.dscope);
						var editBtn = $("<button></button>").addClass(
								"btn btn-primary btn-sm edit_btn").append(
								$("<span></span>").addClass(
										"glyphicon glyphicon-pencil")).append(
								"编辑");
						//为编辑按钮添加一个自定义的属性，来表示当前员工id
						editBtn.attr("edit-rouId", item.rouId);
						var delBtn = $("<button></button>").addClass(
								"btn btn-danger btn-sm delete_btn").append(
								$("<span></span>").addClass(
										"glyphicon glyphicon-trash")).append(
								"删除");
						//为删除按钮添加一个自定义的属性来表示当前删除的员工id
						delBtn.attr("del-rouId", item.rouId);
						var btnTd = $("<td></td>").append(editBtn).append(" ")
								.append(delBtn);
						//append方法执行完成以后还是返回原来的元素
						$("<tr></tr>").append(checkBoxTd).append(rouId).append(area)
								.append(drange).append(btnTd).appendTo(
										"#routes_table tbody");
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
		
		//点击新增按钮弹出模态框。
		$("#route_add_modal_btn").click(function() {
			//清除表单数据（表单完整重置（表单的数据，表单的样式））
			reset_form("#routeAddModal form");
			//弹出模态框
			$("#routeAddModal").modal({
				backdrop : "static"
			});
		});
		
		//点击保存，保存员工。
		$("#route_save_btn").click(function(){
			var a=$("#area_add_input").val();
			var ds=$("#scope_add_input").val();
			//alert(a+" "+ds);
			//alert($("#routeAddModal form").serialize());
			//console.log($("#routeAddModal form").serialize());
			//console.log(encodeURI(encodeURI($("#routeAddModal form").serialize())));
			 //console.log(decodeURIComponent($("#routeAddModal form").serialize(),true));
			// var RA=decodeURIComponent($("#routeAddModal form").serialize(),true);
			$.ajax({
				url : "${APP_PATH}/route",
				type : "POST",
				data : $("#routeAddModal form").serialize(),
				success : function(result) {
					//alert(result.msg);
					//alert(RA);
					$("#routeAddModal").modal('hide');
					//2.来到最后一页，显示保存的信息
					//发送ajax请求显示最后一页数据即可
					to_page(totalRecord);
				}
			});
		});
		//弹出更新对话框
		$(document).on("click",".edit_btn",function() {
					//alert("edit");
					//1、查出员工信息，显示员工信息
					getRoute($(this).attr("edit-rouId"));
					//alert($(this).attr("edit-rouId"));
					//4、把员工的id传递给模态框的更新按钮
					$("#route_update_btn").attr("edit-rouId",
							$(this).attr("edit-rouId"));
					$("#routeUpdateModal").modal({
						backdrop : "static"
					});
				});
		//查询
		function getRoute(rouId) {
			console.log(rouId);
			 $.ajax({
				url : "${APP_PATH}/route/" + rouId,
				type : "GET",
				success : function(result) {
					console.log(result);
					//console.log("con"+phone);
					var empData = result.extend.emp;
					$("#area_update_input").val(empData.area);
					$("#scope_update_input").val(empData.dscope);
				}
			}); 
		}
		
		//点击更新，更新员工信息
		$("#route_update_btn").click(function() {
			//1、发送ajax请求保存更新的员工数据
			$.ajax({
				url : "${APP_PATH}/route/"+ $(this).attr("edit-rouId"),
				type : "PUT",
				data : $("#routeUpdateModal form").serialize(),
				success : function(result) {
					//alert(result.msg);
					//1、关闭对话框
					$("#routeUpdateModal").modal("hide");
					//2、回到本页面
					to_page(currentPage);
				}
			});
		});

		//单个删除
		$(document).on("click", ".delete_btn", function() {
			//1、弹出是否确认删除对话框
			var area = $(this).parents("tr").find("td:eq(2)").text();
			var rouId = $(this).attr("del-rouId");
			//alert($(this).parents("tr").find("td:eq(0)").text());
			if (confirm("确认删除【" + area + "】吗？")) {
				//确认，发送ajax请求删除即可
				$.ajax({
					url : "${APP_PATH}/route/" + rouId,
					type : "DELETE",
					success : function(result) {
						alert(result.msg);
						//回到本页
						to_page(currentPage);
					}
				});
			}
		});
		
		//完成全选/全不选功能
		$("#check_all").click(function(){
			//attr获取checked是undefined;
			//我们这些dom原生的属性；attr获取自定义属性的值；
			//prop修改和读取dom原生属性的值
			$(".check_item").prop("checked",$(this).prop("checked"));
		});
		
		//check_item
		$(document).on("click",".check_item",function(){
			//判断当前选择中的元素是否5个
			var flag = $(".check_item:checked").length==$(".check_item").length;
			$("#check_all").prop("checked",flag);
		});
		//点击全部删除，就批量删除
		$("#route_delete_all_btn").click(function(){
			//
			var areas = "";
			var del_rouIdstr = "";
			$.each($(".check_item:checked"),function(){
				//this
				areas += $(this).parents("tr").find("td:eq(2)").text()+",";
				//组装线路id字符串
				del_rouIdstr += $(this).parents("tr").find("td:eq(1)").text()+"-";
			});
			//去除empNames多余的,
			areas = areas.substring(0, areas.length-1);
			//去除删除的id多余的-
			del_rouIdstr = del_rouIdstr.substring(0, del_rouIdstr.length-1);
			if(confirm("确认删除【"+areas+"】吗？")){
				//发送ajax请求删除
				$.ajax({
					url:"${APP_PATH}/route/"+del_rouIdstr,
					type:"DELETE",
					success:function(result){
						alert(result.msg);
						//回到当前页面
						to_page(currentPage);
					}
				});
			}
		});
		//点击新增按钮弹出模态框。
		$("#route_check_modal_btn").click(function() {
			//清除表单数据（表单完整重置（表单的数据，表单的样式））
			reset_form("#routecheckModal form");
			//发送ajax请求，查出route信息，显示在下拉列表中
			//getRoutets("#orstAddModal select");
			//弹出模态框
			$("#routecheckModal").modal({
				backdrop : "static"
			});
		});
		function to_page2(pn,rouId) {
			//var stId=$("#orststidModal form").serialize();
			
			console.log(rouId);
			$.ajax({
				url : "${APP_PATH}/routesID/"+rouId,
				data : "pn=" + pn,
				type : "GET",
				success : function(result) {
					//console.log(result);
					//1.解析并显示员工数据
					build_routes_table(result);
					//2.解析并显示分页信息
					build_page_info(result);
					//3.解析并显示分页条
					build_page_nav(result);
				}
			});
		}
		//点击保存，保存员工。
		$("#route_check_btn").click(function(){
			var rouId=$("#RouteId_input").val();
			to_page2(1,rouId);
			//1、关闭对话框
			$("#routecheckModal").modal("hide");
		});
	</script>
</body>
</html>
