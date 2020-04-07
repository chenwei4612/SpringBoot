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
<!-- 订单状态添加的模态框 -->
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
	
	<!-- 订单状态添加的模态框 -->
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
<!-- 订单状态添加的模态框 -->
	<div class="modal fade" id="orstAddModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">订单状态添加</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal">
					<div class="form-group">
							<label class="col-sm-2 control-label">仓库Id:</label>
							<div class="col-sm-10">
								<input type="text" name="stId" class="form-control"
									id="stId_add_input" placeholder="stId"> <span
									class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">订单Id:</label>
							<div class="col-sm-10">
								<input type="text" name="orId" class="form-control"
									id="orId_add_input" placeholder="orId"> <span
									class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">线路Id</label>
							<div class="col-sm-4">
								<!-- 部门提交线路id即可 -->
								<select class="form-control" name="roId" id="roadId_select1">
								</select>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">车辆Id:</label>
							<div class="col-sm-10">
								<input type="text" name="carId" class="form-control"
									id="carId_add_input" placeholder="carId"> <span
									class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">运输状态：</label>
							<div class="col-sm-10">
								<label class="radio-inline"> <input type="radio"
									name="status" id="status1_add_input" value="0"
									checked="checked"> 等待运输
								</label> <label class="radio-inline"> <input type="radio"
									name="status" id="status2_add_input" value="1"> 运输中
								</label>
								 <label class="radio-inline"> <input type="radio"
									name="status" id="status3_add_input" value="2"> 未派送
								</label> <label class="radio-inline"> <input type="radio"
									name="status" id="status4_add_input" value="3"> 派送中
								</label>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" id="orst_save_btn">保存</button>
				</div>
			</div>
		</div>
	</div>
<!-- 订单状态修改的模态框 -->
	<div class="modal fade" id="orstUpdateModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">订单状态修改</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal">
					<div class="form-group">
							<label class="col-sm-2 control-label">仓库Id:</label>
							<div class="col-sm-10">
								<input type="text" name="stId" class="form-control"
									id="stId_update_input" placeholder="stId"> <span
									class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">订单Id:</label>
							<div class="col-sm-10">
								<input type="text" name="orId" class="form-control"
									id="orId_update_input" placeholder="orId"> <span
									class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">线路Id</label>
							<div class="col-sm-4">
								<!-- 部门提交线路id即可 -->
								<select class="form-control" name="roId" id="roadId_select2">
								</select>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">车辆Id:</label>
							<div class="col-sm-10">
								<input type="text" name="carId" class="form-control"
									id="carId_update_input" placeholder="carId"> <span
									class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">运输状态</label>
							<div class="col-sm-10">
								<label class="radio-inline"> <input type="radio"
									name="status" id="status1_update_input" value="0"
									checked="checked"> 等待运输
								</label> <label class="radio-inline"> <input type="radio"
									name="status" id="status2_update_input" value="1"> 运输中
								</label>
								 <label class="radio-inline"> <input type="radio"
									name="status" id="status3_update_input" value="2"> 未派送
								</label> <label class="radio-inline"> <input type="radio"
									name="status" id="status4_update_input" value="3"> 派送中
								</label>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" id="orst_update_btn">更新</button>
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
			<div class="col-md-6 col-md-offset-4">
			<button class="btn btn-primary" id="orst_carid_modal_btn">
				<span class="glyphicon glyphicon-search" aria-hidden="true"></span>运送车辆查询</button>
				<button class="btn btn-primary" id="orst_stid_modal_btn">
				<span class="glyphicon glyphicon-search" aria-hidden="true"></span>仓库查询</button>
				<button class="btn btn-primary" id="orst_orid_modal_btn">
				<span class="glyphicon glyphicon-search" aria-hidden="true"></span>订单查询</button>
				<button class="btn btn-primary" id="orst_add_modal_btn">
				<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增</button>
				<button class="btn btn-danger" id="orst_delete_all_btn">
				<span class="glyphicon glyphicon-trash"  aria-hidden="true"></span>删除</button>
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
						var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn").append(
								$("<span></span>").addClass("glyphicon glyphicon-pencil")).append("编辑");
						//为编辑按钮添加一个自定义的属性，来表示当前员工id
						editBtn.attr("edit-orId", item.orId);
						var delBtn = $("<button></button>").addClass("btn btn-danger btn-sm delete_btn").append(
								$("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");
						//为删除按钮添加一个自定义的属性来表示当前删除的员工id
						delBtn.attr("del-orId", item.orId);
						var btnTd = $("<td></td>").append(editBtn).append(" ").append(delBtn);
						//append方法执行完成以后还是返回原来的元素
						$("<tr></tr>").append(checkBoxTd).append(stId).append(orId)
								.append(status).append(roId).append(carId).append(btnTd).appendTo("#orsts_table tbody");
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
		$("#orst_add_modal_btn").click(function() {
			//清除表单数据（表单完整重置（表单的数据，表单的样式））
			reset_form("#orstAddModal form");
			//发送ajax请求，查出route信息，显示在下拉列表中
			getRoutets("#orstAddModal select");
			//弹出模态框
			$("#orstAddModal").modal({
				backdrop : "static"
			});
		});
		//查出所有的rote信息并显示在下拉列表中
		function getRoutets(ele) {
			//清空之前下拉列表的值
			$(ele).empty();
			$.ajax({
				url : "${APP_PATH}/Routes",
				type : "GET",
				success : function(result) {
					console.log(result.extend.routes);
					//显示route信息在下拉列表中
					$.each(result.extend.routes, function() {
						var optionEle = $("<option></option>").append(
								this.area).attr("value", this.rouId);
						optionEle.appendTo("#roadId_select1");
					}); 
				}
			});
		}
		//显示校验结果的提示信息
		function show_validate_msg(ele, status, msg) {
			//清除当前元素的校验状态
			$(ele).parent().removeClass("has-success has-error");
			$(ele).next("span").text("");
			if ("success" == status) {
				$(ele).parent().addClass("has-success");
				$(ele).next("span").text(msg);
			} else if ("error" == status) {
				$(ele).parent().addClass("has-error");
				$(ele).next("span").text(msg);
			}
		}
		//校验stId是否可用
		$("#stId_add_input").change(function() {
			//发送ajax请求校验stId是否可用
			var stId = this.value;
			$.ajax({
				url : "${APP_PATH}/checkuser5",
				data : "stId=" + stId,
				type : "POST",
				success : function(result) {
					if (result.code == 100) {
						show_validate_msg("#stId_add_input","success", "仓库id可用");
						$("#orst_save_btn").attr("ajax-va", "success");
					} else {
						show_validate_msg("#stId_add_input", "error",result.extend.va_msg);
						$("#orst_save_btn").attr("ajax-va", "error");
					}
				}
			});
		});
		//校验orId是否可用
		$("#orId_add_input").change(function() {
			//发送ajax请求校验empid是否可用
			var orId = this.value;
			$.ajax({
				url : "${APP_PATH}/checkuser4",
				data : "orId=" + orId,
				type : "POST",
				success : function(result) {
					if (result.code == 100) {
						show_validate_msg("#orId_add_input",
								"success", "订单id可用");
						$("#orst_save_btn").attr("ajax-va", "success");
					} else {
						show_validate_msg("#orId_add_input", "error",
								result.extend.va_msg);
						$("#orst_save_btn").attr("ajax-va", "error");
					}
				}
			});
		});
		
		//点击保存，保存员工。
		$("#orst_save_btn").click(function(){
			$.ajax({
				url : "${APP_PATH}/orst",
				type : "POST",
				data : $("#orstAddModal form").serialize(),
				success : function(result) {
					$("#orstAddModal").modal('hide');
					//2.来到最后一页，显示保存的信息
					//发送ajax请求显示最后一页数据即可
					to_page(totalRecord);
				}
			});
		});
		
		//查出所有的rote信息并显示在下拉列表中
		function getRoutets2(ele) {
			//清空之前下拉列表的值
			$(ele).empty();
			$.ajax({
				url : "${APP_PATH}/Routes",
				type : "GET",
				success : function(result) {
					//显示route信息在下拉列表中
					$.each(result.extend.routes, function() {
						var optionEle = $("<option></option>").append(
								this.area).attr("value", this.rouId);
						optionEle.appendTo("#roadId_select2");
					}); 
				}
			});
		}
		//弹出更新对话框
		$(document).on("click",".edit_btn",function() {
					//alert("edit");
					//1、查出route信息，并显示area列表
					getRoutets2("#orstUpdateModal select");
					//2、查出car信息，显示car信息
					getOrst($(this).attr("edit-orId"));
					//alert($(this).attr("edit-rouId"));
					//4、把员工的id传递给模态框的更新按钮
					$("#orst_update_btn").attr("edit-orId",
							$(this).attr("edit-orId"));
					$("#orstUpdateModal").modal({
						backdrop : "static"
					});
				});
		//查询
		function getOrst(orId) {
			console.log(orId);
			 $.ajax({
				url : "${APP_PATH}/orst/" + orId,
				type : "GET",
				success : function(result) {
					console.log(result);
					//console.log("con"+phone);
					var empData = result.extend.emp;
					//$("#area_update_input").val(empData.area);
					$("#roadId_select2").val([ empData.roId ]);
					$("#stId_update_input").val(empData.stId);
					$("#orstUpdateModal input[name=status]").val([ empData.status ]);
					$("#orId_update_input").val(empData.orId);
					$("#carId_update_input").val(empData.carId);
				}
			}); 
		}
		
		//点击更新，更新员工信息
		$("#orst_update_btn").click(function() {
			//1、发送ajax请求保存更新的员工数据
			$.ajax({
				url : "${APP_PATH}/orst/"+ $(this).attr("edit-orId"),
				type : "PUT",
				data : $("#orstUpdateModal form").serialize(),
				success : function(result) {
					alert(result.msg);
					//1、关闭对话框
					$("#orstUpdateModal").modal("hide");
					//2、回到本页面
					to_page(currentPage);
				}
			});
		});

		//单个删除
		$(document).on("click", ".delete_btn", function() {
			//1、弹出是否确认删除对话框
			//var empid = $(this).parents("tr").find("td:eq(3)").text();
			var orId = $(this).attr("del-orId");
			//alert($(this).parents("tr").find("td:eq(0)").text());
			if (confirm("确认删除【" + orId + "】吗？")) {
				//确认，发送ajax请求删除即可
				$.ajax({
					url : "${APP_PATH}/orst/" + orId,
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
		$("#orst_delete_all_btn").click(function(){
			//
			//var empids = "";
			var del_orIdstr = "";
			$.each($(".check_item:checked"),function(){
				//this
				//empids += $(this).parents("tr").find("td:eq(3)").text()+",";
				//组装线路id字符串
				console.log($(this).parents("tr").find("td:eq(2)"));
				del_orIdstr += $(this).parents("tr").find("td:eq(2)").text()+"-";
			});
			//去除empNames多余的,
			//empids = empids.substring(0, empids.length-1);
			//去除删除的id多余的-
			del_orIdstr = del_orIdstr.substring(0, del_orIdstr.length-1);
			if(confirm("确认删除【"+del_orIdstr+"】吗？")){
				//发送ajax请求删除
				$.ajax({
					url:"${APP_PATH}/orst/"+del_orIdstr,
					type:"DELETE",
					success:function(result){
						alert(result.msg);
						//回到当前页面
						to_page(currentPage);
					}
				});
			}
		});
		//
		//点击新增按钮弹出模态框。
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
		//点击保存，保存员工。
		$("#orst_stcheck_btn").click(function(){
			var stId=$("#stId_input").val();
			to_page2(1,stId);
			//1、关闭对话框
			$("#orststidModal").modal("hide");
		});
		//
		//点击新增按钮弹出模态框。
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
		//点击保存，保存员工。
		$("#orst_orcheck_btn").click(function(){
			var orId=$("#orId_input").val();
			to_page3(1,orId);
			//1、关闭对话框
			$("#orstOORIDModal").modal("hide");
		});
		//car
		//点击新增按钮弹出模态框。
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
		//点击保存，保存员工。
		$("#orst_carcheck_btn").click(function(){
			var carId=$("#carId_input").val();
			to_page4(1,carId);
			//1、关闭对话框
			$("#orstOCARIDModal").modal("hide");
		});
	</script>
</body>
</html>
