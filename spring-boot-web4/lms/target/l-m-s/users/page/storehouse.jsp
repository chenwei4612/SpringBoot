<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <jsp:forward page="/routes"></jsp:forward> --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>仓库列表</title>
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
<script src="${APP_PATH }/static/js/bootstrap-datepicker.js"></script>
<script src="${APP_PATH }/static/js/bootstrap-datetimepicker.js"></script>
<script src="${APP_PATH }/static/js/bootstrap-datetimepicker.min.js"></script>
</head>
<body>
<!-- 仓库信息查询的模态框 -->
	<div class="modal fade" id="storehousecheckModal" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">仓库信息查询</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal">
						<div class="form-group">
							<label class="col-sm-2 control-label">仓库Id:</label>
							<div class="col-sm-10">
								<input type="text" name="storeId" class="form-control"
									id="storeId_input" placeholder="storeId"> <span
									class="help-block"></span>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary"
						id="storehouse_check_btn">查询</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 新仓库添加的模态框 -->
	<div class="modal fade" id="storehouseAddModal" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">新仓库添加</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal">
						<div class="form-group">
							<label class="col-sm-2 control-label">仓库类型:</label>
							<div class="col-sm-4">
								<!-- 部门提交线路id即可 -->
								<select class="form-control" name="type" id="type_select1">
								</select>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">容量:</label>
							<div class="col-sm-6">
								<input type="text" name="number" class="form-control"
									id="number_add_input" placeholder="number"> <span
									class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">是否已满：</label>
							<div class="col-sm-4">
								<label class="radio-inline"> <input type="radio"
									name="stState" id="stState1_add_input" value="0"
									checked="checked"> 未满
								</label> <label class="radio-inline"> <input type="radio"
									name="stState" id="stState2_add_input" value="1"> 已满
								</label>
							</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">备注:</label>
								<div class="col-sm-8">
								<textarea class="form-control" rows="3" name="remark" id="remark_add_input" placeholder="remark"></textarea>
								</div>
							</div>
						</div>
					</form>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary"
						id="storehouse_save_btn">保存</button>
				</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 仓库修改的模态框 -->
	<div class="modal fade" id="storehouseUpdateModal" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">仓库修改</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal">
						<div class="form-group">
							<label class="col-sm-2 control-label">仓库类型:</label>
							<div class="col-sm-4">
								<!-- 部门提交线路id即可 -->
								<select class="form-control" name="type" id="type_select2">
								</select>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">容量:</label>
							<div class="col-sm-8">
								<input type="text" name="number" class="form-control"
									id="number_update_input" placeholder="number"> <span
									class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">是否已满：</label>
							<div class="col-sm-4">
								<label class="radio-inline"> <input type="radio"
									name="stState" id="stState1_update_input" value="0"
									checked="checked"> 未满
								</label> <label class="radio-inline"> <input type="radio"
									name="stState" id="stState2_update_input" value="1"> 已满
								</label>
							</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">备注:</label>
								<div class="col-sm-10">
								<textarea class="form-control" rows="3" name="remark" id="remark_update_input" placeholder="remark"></textarea>
								</div>
							</div>
						</div>
					</form>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" id="storehouse_update_btn">更新</button>
				</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 搭建显示页面 -->
	<div class="container">
		<!-- title -->
		<div class="row">
			<div class="col-md-8 col-md-offset-1">
				<h1>仓库信息管理</h1>
			</div>
		</div>
		<!-- 按钮 -->
		<div class="row">
			<div class="col-md-3 col-md-offset-8">
				<button class="btn btn-primary" id="storehouse_check_modal_btn">
				<span class="glyphicon glyphicon-search" aria-hidden="true"></span>查找</button>
				<button class="btn btn-primary" id="storehouse_add_modal_btn">
				<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增</button>
				<button class="btn btn-danger" id="storehouse_delete_all_btn">
				<span class="glyphicon glyphicon-trash"  aria-hidden="true"></span>删除</button>
			</div>
		</div>
		<!-- 显示表格数据 -->
		<div class="row">
			<div class="col-md-7 col-md-offset-1">
				<table class="table table-hover" id="storehouses_table">
					<thead>
						<tr>
							<th><input type="checkbox" id="check_all" /></th>
							<th>仓库Id</th>
							<th>仓库类型</th>
							<th>容量</th>
							<th>是否已满</th>
							<th>备注</th>
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
				url : "${APP_PATH}/storehouses",
				data : "pn=" + pn,
				type : "GET",
				success : function(result) {
					//console.log(result);
					//1.解析并显示员工数据
					build_storehouses_table(result);
					//2.解析并显示分页信息
					build_page_info(result);
					//3.解析并显示分页条
					build_page_nav(result);
				}
			});
		}

		function build_storehouses_table(result) {
			//清空table表格
			$("#storehouses_table tbody").empty();
			var storehouses = result.extend.pageInfo.list;
			$.each(storehouses,function(index, item) {
				//aler(item.empName);
				var checkBoxTd = $("<td><input type='checkbox' class='check_item'/></td>");
				var storeId = $("<td></td>").append(item.storeId);
				var type = $("<td></td>").append(item.type);
				var number = $("<td></td>").append(item.number);
				var State = $("<td></td>").append(item.stState == 0 ? "未满" : "已满");
				var remark = $("<td></td>").append(item.remark);
				var editBtn = $("<button></button>")
						.addClass("btn btn-primary btn-sm edit_btn")
						.append($("<span></span>").addClass("glyphicon glyphicon-pencil"))
						.append("编辑");
				//为编辑按钮添加一个自定义的属性，来表示当前员工id
				editBtn.attr("edit-storeId", item.storeId);
				var delBtn = $("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
						.append($("<span></span>").addClass("glyphicon glyphicon-trash"))
						.append("删除");
				//为删除按钮添加一个自定义的属性来表示当前删除的员工id
				delBtn.attr("del-storeId", item.storeId);
				var btnTd = $("<td></td>").append(editBtn)
						.append(" ").append(delBtn);
				//append方法执行完成以后还是返回原来的元素
				$("<tr></tr>").append(checkBoxTd).append(storeId).append(type).append(number)
						.append(State).append(remark).append(btnTd).appendTo("#storehouses_table tbody");
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
		$("#storehouse_add_modal_btn").click(function() {
			//清除表单数据（表单完整重置（表单的数据，表单的样式））
			reset_form("#storehouseAddModal form");
			//发送ajax请求，查出route信息，显示在下拉列表中
			getTypet("#storehouseAddModal select");
			//date
			//getDate();
			//弹出模态框
			$("#storehouseAddModal").modal({
				backdrop : "static"
			});
		});
		//查出所有的Typet信息并显示在下拉列表中
		function getTypet(ele) {
			//清空之前下拉列表的值
			$(ele).empty();
			$.ajax({
				url : "${APP_PATH}/shtype",
				type : "GET",
				success : function(result) {
					//显示type信息在下拉列表中
					//console.log(result.extend.storehouse);
					$.each(result.extend.storehouse, function() {
						var optionEle = $("<option></option>")
								.append(this.type);
						optionEle.appendTo("#type_select1");
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

		//点击保存，保存员工。
		$("#storehouse_save_btn").click(function() {
			console.log($("#storehouseAddModal form").serialize());
			$.ajax({
				url : "${APP_PATH}/storehouse",
				type : "POST",
				data : $("#storehouseAddModal form").serialize(),
				success : function(result) {
					$("#storehouseAddModal").modal('hide');
					//2.来到最后一页，显示保存的信息
					//发送ajax请求显示最后一页数据即可
					to_page(totalRecord);
				}
			});
		});

		//查出所有的Type信息并显示在下拉列表中
		function getType(ele) {
			//清空之前下拉列表的值
			$(ele).empty();
			$.ajax({
				url : "${APP_PATH}/shtype",
				type : "GET",
				success : function(result) {
					//显示type信息在下拉列表中
					//console.log(result.extend.storehouse);
					$.each(result.extend.storehouse, function() {
						var optionEle = $("<option></option>")
								.append(this.type);
						optionEle.appendTo("#type_select2");
					});
				}
			});
		}
		
		//弹出更新对话框
		$(document).on("click",".edit_btn",function() {
			//alert("edit");
			//1、查出Type信息，并显示Type列表
			getType("#storehouseUpdateModal select");
			//2、查出Storehouse信息，显示Storehouse信息
			getStorehouse($(this).attr("edit-storeId"));
			//alert($(this).attr("edit-rouId"));
			//4、把Storehouse的id传递给模态框的更新按钮
			$("#storehouse_update_btn").attr("edit-storeId",
					$(this).attr("edit-storeId"));
			$("#storehouseUpdateModal").modal({
				backdrop : "static"
			});
		});
		//查询
		function getStorehouse(storeId) {
			console.log(storeId);
			$.ajax({
				url : "${APP_PATH}/storehouse/" + storeId,
				type : "GET",
				success : function(result) {
					console.log(result);
					//console.log("con"+phone);
					var empData = result.extend.emp;
					console.log(empData);
					$("#type_select2").val([ empData.type]);
					$("#number_update_input").val([empData.number]);
					$("#storehouseUpdateModal input[name=stState]").val([empData.stState]);
					$("#remark_update_input").val([empData.remark]);
					$("#date_update_input").val([empData.date]); 
				}
			});
		}

		//点击更新，更新员工信息
		$("#storehouse_update_btn").click(function() {
			//1、发送ajax请求保存更新的员工数据
			$.ajax({
				url : "${APP_PATH}/storehouse/" + $(this).attr("edit-storeId"),
				type : "PUT",
				data : $("#storehouseUpdateModal form").serialize(),
				success : function(result) {
					//alert(result.msg);
					//1、关闭对话框
					$("#storehouseUpdateModal").modal("hide");
					//2、回到本页面
					to_page(currentPage);
				}
			});
		});

		//单个删除
		$(document).on("click", ".delete_btn", function() {
			//1、弹出是否确认删除对话框
			//var empid = $(this).parents("tr").find("td:eq(3)").text();
			var storeId = $(this).attr("del-storeId");
			//alert($(this).parents("tr").find("td:eq(0)").text());
			if (confirm("确认删除【" + storeId + "】吗？")) {
				//确认，发送ajax请求删除即可
				$.ajax({
					url : "${APP_PATH}/storehouse/" + storeId,
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
		$("#check_all").click(function() {
			//attr获取checked是undefined;
			//我们这些dom原生的属性；attr获取自定义属性的值；
			//prop修改和读取dom原生属性的值
			$(".check_item").prop("checked", $(this).prop("checked"));
		});

		//check_item
		$(document).on("click",".check_item",function() {
			//判断当前选择中的元素是否5个
			var flag = $(".check_item:checked").length == $(".check_item").length;
			$("#check_all").prop("checked", flag);
		});
		//点击全部删除，就批量删除
		$("#storehouse_delete_all_btn").click(function() {
			//var empids = "";
			var del_storeIdstr = "";
			$.each($(".check_item:checked"), function() {
				//this
				//empids += $(this).parents("tr").find("td:eq(3)").text()+ ",";
				//组装线路id字符串
				del_storeIdstr += $(this).parents("tr").find("td:eq(1)").text()+ "-";
			});
			//去除empNames多余的,
			//empids = empids.substring(0, empids.length - 1);
			//去除删除的id多余的-
			del_storeIdstr = del_storeIdstr.substring(0,
					del_storeIdstr.length - 1);
			if (confirm("确认删除【" + del_storeIdstr + "】吗？")) {
				//发送ajax请求删除
				$.ajax({
					url : "${APP_PATH}/storehouse/" + del_storeIdstr,
					type : "DELETE",
					success : function(result) {
						alert(result.msg);
						//回到当前页面
						to_page(currentPage);
					}
				});
			}
		});
		//点击新增按钮弹出模态框。
		$("#storehouse_check_modal_btn").click(function() {
			//清除表单数据（表单完整重置（表单的数据，表单的样式））
			reset_form("#storehousecheckModal form");
			//发送ajax请求，查出route信息，显示在下拉列表中
			//getRoutets("#orstAddModal select");
			//弹出模态框
			$("#storehousecheckModal").modal({
				backdrop : "static"
			});
		});
		function to_page2(pn,storeId) {
			//var stId=$("#orststidModal form").serialize();
			
			console.log(storeId);
			$.ajax({
				url : "${APP_PATH}/storehousesID/"+storeId,
				data : "pn=" + pn,
				type : "GET",
				success : function(result) {
					//console.log(result);
					//1.解析并显示员工数据
					build_storehouses_table(result);
					//2.解析并显示分页信息
					build_page_info(result);
					//3.解析并显示分页条
					build_page_nav(result);
				}
			});
		}
		//点击保存，保存员工。
		$("#storehouse_check_btn").click(function(){
			var storeId=$("#storeId_input").val();
			to_page2(1,storeId);
			//1、关闭对话框
			$("#storehousecheckModal").modal("hide");
		});
	</script>
</body>
</html>
