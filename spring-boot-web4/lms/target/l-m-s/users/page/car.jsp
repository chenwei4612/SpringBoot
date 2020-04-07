<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <jsp:forward page="/routes"></jsp:forward> --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>车辆列表</title>
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
<!-- 车辆查询的模态框 -->
	<div class="modal fade" id="carcheckModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">车辆查询</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal">
						<div class="form-group">
							<label class="col-sm-2 control-label">车辆Id:</label>
							<div class="col-sm-10">
								<input type="text" name="CarId" class="form-control"
									id="CarId_input" placeholder="CarId"> <span
									class="help-block"></span>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" id="car_check_btn">查询</button>
				</div>
			</div>
		</div>
	</div>
<!-- 新车辆添加的模态框 -->
	<div class="modal fade" id="carAddModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">新车辆添加</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal">
						<div class="form-group">
							<label class="col-sm-2 control-label">线路Id：</label>
							<div class="col-sm-4">
								<!-- 部门提交线路id即可 -->
								<select class="form-control" name="roadId" id="roadId_select1">
								</select>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">司机Id:</label>
							<div class="col-sm-10">
								<input type="text" name="emId" class="form-control"
									id="emId_add_input" placeholder="emId"> <span
									class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">车辆类型：</label>
							<div class="col-sm-10">
								<label class="radio-inline"> <input type="radio"
									name="carType" id="carType1_add_input" value="0"
									checked="checked"> 重型货车
								</label> <label class="radio-inline"> <input type="radio"
									name="carType" id="carType2_add_input" value="1"> 中型货车
								</label>
								 <label class="radio-inline"> <input type="radio"
									name="carType" id="carType3_add_input" value="2"> 轻型货车
								</label> <label class="radio-inline"> <input type="radio"
									name="carType" id="carType4_add_input" value="3"> 电动车
								</label>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" id="car_save_btn">保存</button>
				</div>
			</div>
		</div>
	</div>
<!-- 新车辆修改的模态框 -->
	<div class="modal fade" id="carUpdateModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">车辆修改</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal">
						<div class="form-group">
							<label class="col-sm-2 control-label">线路Id：</label>
							<div class="col-sm-4">
								<!-- 部门提交线路id即可 -->
								<select class="form-control" name="roadId" id="roadId_select2">
								</select>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">司机Id:</label>
							<div class="col-sm-10">
								<input type="text" name="emId" class="form-control"
									id="emId_update_input" placeholder="emId"> <span
									class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">车辆类型：</label>
							<div class="col-sm-10">
								<label class="radio-inline"> <input type="radio"
									name="carType" id="carType1_add_update" value="0"
									checked="checked"> 重型货车
								</label> <label class="radio-inline"> <input type="radio"
									name="carType" id="carType2_add_update" value="1"> 中型货车
								</label>
								 <label class="radio-inline"> <input type="radio"
									name="carType" id="carType3_add_update" value="2"> 轻型货车
								</label> <label class="radio-inline"> <input type="radio"
									name="carType" id="carType4_add_update" value="3"> 电动车
								</label>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" id="car_update_btn">更新</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 搭建显示页面 -->
	<div class="container">
		<!-- title -->
		<div class="row">
			<div class="col-md-8 col-md-offset-1">
				<h1>运输车辆信息管理</h1>
			</div>
		</div>
		<!-- 按钮 -->
		<div class="row">
			<div class="col-md-4 col-md-offset-9">
			<button class="btn btn-primary" id="car_check_modal_btn">
				<span class="glyphicon glyphicon-search" aria-hidden="true"></span>查找</button>
				<button class="btn btn-primary" id="car_add_modal_btn">
				<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增</button>
				<button class="btn btn-danger" id="car_delete_all_btn">
				<span class="glyphicon glyphicon-trash"  aria-hidden="true"></span>删除</button>
			</div>
		</div>
		<!-- 显示表格数据 -->
		<div class="row">
			<div class="col-md-9 col-md-offset-1">
				<table class="table table-hover" id="cars_table">
					<thead>
						<tr>
							<th><input type="checkbox" id="check_all" /></th>
							<th>车辆Id</th>
							<th>线路Id</th>
							<th>司机Id</th>
							<th>车辆类型</th>
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
				url : "${APP_PATH}/cars",
				data : "pn=" + pn,
				type : "GET",
				success : function(result) {
					//console.log(result);
					//1.解析并显示员工数据
					build_cars_table(result);
					//2.解析并显示分页信息
					build_page_info(result);
					//3.解析并显示分页条
					build_page_nav(result);
				}
			});
		}

		function build_cars_table(result) {
			//清空table表格
			$("#cars_table tbody").empty();
			var cars = result.extend.pageInfo.list;
			$.each(cars,
					function(index, item) {
						//aler(item.empName);
						var checkBoxTd = $("<td><input type='checkbox' class='check_item'/></td>");
						var carId = $("<td></td>").append(item.carId);
						var roadId = $("<td></td>").append(item.roadId);
						var emId = $("<td></td>").append(item.emId);
						var carType = $("<td></td>").append(
								item.carType == 0 ? "重型货车" : ((item.carType == 1 )?"中型货车":((item.carType == 2 )?"轻型货车":"电动车")));
						var editBtn = $("<button></button>").addClass(
								"btn btn-primary btn-sm edit_btn").append(
								$("<span></span>").addClass(
										"glyphicon glyphicon-pencil")).append(
								"编辑");
						//为编辑按钮添加一个自定义的属性，来表示当前员工id
						editBtn.attr("edit-carId", item.carId);
						var delBtn = $("<button></button>").addClass(
								"btn btn-danger btn-sm delete_btn").append(
								$("<span></span>").addClass(
										"glyphicon glyphicon-trash")).append(
								"删除");
						//为删除按钮添加一个自定义的属性来表示当前删除的员工id
						delBtn.attr("del-carId", item.carId);
						var btnTd = $("<td></td>").append(editBtn).append(" ")
								.append(delBtn);
						//append方法执行完成以后还是返回原来的元素
						$("<tr></tr>").append(checkBoxTd).append(carId).append(roadId)
								.append(emId).append(carType).append(btnTd).appendTo(
										"#cars_table tbody");
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
		$("#car_add_modal_btn").click(function() {
			//清除表单数据（表单完整重置（表单的数据，表单的样式））
			reset_form("#carAddModal form");
			//发送ajax请求，查出route信息，显示在下拉列表中
			getRoutets("#carAddModal select");
			//弹出模态框
			$("#carAddModal").modal({
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
		//校验empid是否可用
		$("#emId_add_input").change(function() {
			//发送ajax请求校验empid是否可用
			var emId = this.value;
			$.ajax({
				url : "${APP_PATH}/checkuser2",
				data : "emId=" + emId,
				type : "POST",
				success : function(result) {
					if (result.code == 100) {
						show_validate_msg("#emId_add_input",
								"success", "员工可用");
						$("#car_save_btn").attr("ajax-va", "success");
					} else {
						show_validate_msg("#emId_add_input", "error",
								result.extend.va_msg);
						$("#car_save_btn").attr("ajax-va", "error");
					}
				}
			});
		});
		
		//点击保存，保存员工。
		$("#car_save_btn").click(function(){
			$.ajax({
				url : "${APP_PATH}/car",
				type : "POST",
				data : $("#carAddModal form").serialize(),
				success : function(result) {
					$("#carAddModal").modal('hide');
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
					getRoutets2("#carUpdateModal select");
					//2、查出car信息，显示car信息
					getCar($(this).attr("edit-carId"));
					//alert($(this).attr("edit-rouId"));
					//4、把员工的id传递给模态框的更新按钮
					$("#car_update_btn").attr("edit-carId",
							$(this).attr("edit-carId"));
					$("#carUpdateModal").modal({
						backdrop : "static"
					});
				});
		//查询
		function getCar(carId) {
			console.log(carId);
			 $.ajax({
				url : "${APP_PATH}/car/" + carId,
				type : "GET",
				success : function(result) {
					console.log(result);
					//console.log("con"+phone);
					var empData = result.extend.emp;
					//$("#area_update_input").val(empData.area);
					$("#roadId_select2").val([ empData.roadId ]);
					$("#emId_update_input").val(empData.emId);
					$("#carUpdateModal input[name=carType]").val([ empData.carType ]);
				}
			}); 
		}
		
		//点击更新，更新员工信息
		$("#car_update_btn").click(function() {
			//1、发送ajax请求保存更新的员工数据
			$.ajax({
				url : "${APP_PATH}/car/"+ $(this).attr("edit-carId"),
				type : "PUT",
				data : $("#carUpdateModal form").serialize(),
				success : function(result) {
					//alert(result.msg);
					//1、关闭对话框
					$("#carUpdateModal").modal("hide");
					//2、回到本页面
					to_page(currentPage);
				}
			});
		});

		//单个删除
		$(document).on("click", ".delete_btn", function() {
			//1、弹出是否确认删除对话框
			var empid = $(this).parents("tr").find("td:eq(3)").text();
			var carId = $(this).attr("del-carId");
			//alert($(this).parents("tr").find("td:eq(0)").text());
			if (confirm("确认删除【" + empid + "】吗？")) {
				//确认，发送ajax请求删除即可
				$.ajax({
					url : "${APP_PATH}/car/" + carId,
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
		$("#car_delete_all_btn").click(function(){
			//
			var empids = "";
			var del_carIdstr = "";
			$.each($(".check_item:checked"),function(){
				//this
				empids += $(this).parents("tr").find("td:eq(3)").text()+",";
				//组装线路id字符串
				del_carIdstr += $(this).parents("tr").find("td:eq(1)").text()+"-";
			});
			//去除empNames多余的,
			empids = empids.substring(0, empids.length-1);
			//去除删除的id多余的-
			del_carIdstr = del_carIdstr.substring(0, del_carIdstr.length-1);
			if(confirm("确认删除【"+empids+"】吗？")){
				//发送ajax请求删除
				$.ajax({
					url:"${APP_PATH}/car/"+del_carIdstr,
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
		$("#car_check_modal_btn").click(function() {
			//清除表单数据（表单完整重置（表单的数据，表单的样式））
			reset_form("#carcheckModal form");
			//发送ajax请求，查出route信息，显示在下拉列表中
			//getRoutets("#orstAddModal select");
			//弹出模态框
			$("#carcheckModal").modal({
				backdrop : "static"
			});
		});
		function to_page2(pn,carId) {
			//var stId=$("#orststidModal form").serialize();
			
			console.log(carId);
			$.ajax({
				url : "${APP_PATH}/carID/"+carId,
				data : "pn=" + pn,
				type : "GET",
				success : function(result) {
					//console.log(result);
					//1.解析并显示员工数据
					build_cars_table(result);
					//2.解析并显示分页信息
					build_page_info(result);
					//3.解析并显示分页条
					build_page_nav(result);
				}
			});
		}
		//点击保存，保存员工。
		$("#car_check_btn").click(function(){
			var carId=$("#CarId_input").val();
			to_page2(1,carId);
			//1、关闭对话框
			$("#carcheckModal").modal("hide");
		});
	</script>
</body>
</html>
