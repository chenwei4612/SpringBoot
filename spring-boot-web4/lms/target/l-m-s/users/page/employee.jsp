<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%--  <jsp:forward page="/emps"></jsp:forward> --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>员工列表</title>
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
<!-- 员工信息查询的模态框 -->
	<div class="modal fade" id="empCheckModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">员工信息查询</h4>
					<!-- <p class="form-control-static" name="UpempId" id="empid_update_static"></p> -->
				</div>
				<div class="modal-body">
					<form class="form-horizontal">
						<div class="form-group">
							<label class="col-sm-2 control-label">员工ID：</label>
							<div class="col-sm-10">
								<input type="text" name="empId"
									class="form-control" id="empId_input"
									placeholder="empId"> <span class="help-block"></span>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" id="emp_check_btn">查询</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 员工修改的模态框 -->
	<div class="modal fade" id="empUpdateModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">员工修改</h4>
					<!-- <p class="form-control-static" name="UpempId" id="empid_update_static"></p> -->
				</div>
				<div class="modal-body">
					<form class="form-horizontal">
						<div class="form-group">
							<label class="col-sm-2 control-label">员工ID：</label>
							<div class="col-sm-10">
								<input type="text" readonly="readonly" name="empId"
									class="form-control" id="empId_update_input"
									placeholder="empId"> <span class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">姓名：</label>
							<div class="col-sm-10">
								<input type="text" name="name" class="form-control"
									id="empName_update_input" placeholder="empName"> <span
									class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">性别：</label>
							<div class="col-sm-10">
								<label class="radio-inline"> <input type="radio"
									name="gender" id="gender1_update_input" value="1"
									checked="checked"> 男
								</label> <label class="radio-inline"> <input type="radio"
									name="gender" id="gender2_update_input" value="0"> 女
								</label>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">手机号码：</label>
							<div class="col-sm-10">
								<input type="text" name="phone" class="form-control"
									id="phone_update_input" placeholder="phone"> <span
									class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">邮箱</label>
							<div class="col-sm-10">
								<input type="text" name="email" class="form-control"
									id="email_update_input" placeholder="email@atguigu.com">
								<span class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">地址</label>
							<div class="col-sm-10">
								<input type="text" name="address" class="form-control"
									id="address_update_input" placeholder="email@atguigu.com">
								<span class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">密码：</label>
							<div class="col-sm-10">
								<input type="text" name="password" class="form-control"
									id="password_update_input" placeholder="00000000"> <span
									class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">部门</label>
							<div class="col-sm-4">
								<!-- 部门提交部门id即可 -->
								<select class="form-control" name="depId" id="deptName_select2">
								</select>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">职位</label>
							<div class="col-sm-4">
								<!-- 部门提交职位role即可 -->
								<select class="form-control" name="role" id="role_select2">
								</select>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" id="emp_update_btn">更新</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 员工添加的模态框 -->
	<div class="modal fade" id="empAddModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">员工添加</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal">
						<div class="form-group">
							<label class="col-sm-2 control-label">姓名：</label>
							<div class="col-sm-10">
								<input type="text" name="name" class="form-control"
									id="empName_add_input" placeholder="empName"> <span
									class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">性别：</label>
							<div class="col-sm-10">
								<label class="radio-inline"> <input type="radio"
									name="gender" id="gender1_add_input" value="1"
									checked="checked"> 男
								</label> <label class="radio-inline"> <input type="radio"
									name="gender" id="gender2_add_input" value="0"> 女
								</label>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">手机号码：</label>
							<div class="col-sm-10">
								<input type="text" name="phone" class="form-control"
									id="phone_add_input" placeholder="phone"> <span
									class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">邮箱：</label>
							<div class="col-sm-10">
								<input type="text" name="email" class="form-control"
									id="email_add_input" placeholder="email@atguigu.com"> <span
									class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">地址：</label>
							<div class="col-sm-10">
								<input type="text" name="address" class="form-control"
									id="address_add_input" placeholder="email@atguigu.com">
								<span class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">密码：</label>
							<div class="col-sm-10">
								<input type="text" name="password" class="form-control"
									id="password_add_input" placeholder="00000000"> <span
									class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">部门：</label>
							<div class="col-sm-4">
								<!-- 部门提交部门id即可 -->
								<select class="form-control" name="depId" id="deptName_select">
								</select>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">职位：</label>
							<div class="col-sm-4">
								<!-- 部门提交职位role即可 -->
								<select class="form-control" name="role" id="role_select">
								</select>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" id="emp_save_btn">保存</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 搭建显示页面 -->
	<div class="container">
		<!-- title -->
		<div class="row">
			<div class="col-md-10">
				<h1>员工管理</h1>
			</div>
		</div>
		<!-- 按钮 -->
		<div class="row">
			<div class="col-md-3 col-md-offset-9">
				<button class="btn btn-primary" id="emp_check_modal_btn">
				<span class="glyphicon glyphicon-search" aria-hidden="true"></span>查找</button>
				<button class="btn btn-primary" id="emp_add_modal_btn">
				<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增</button>
				<button class="btn btn-danger" id="emp_delete_all_btn">
				<span class="glyphicon glyphicon-trash"  aria-hidden="true"></span>删除</button>
			</div>
		</div>
		<!-- 显示表格数据 -->
		<div class="row">
			<div class="col-md-12">
				<table class="table table-hover" id="emps_table">
					<thead>
						<tr>
							<th><input type="checkbox" id="check_all" /></th>
							<th>员工ID</th>
							<th>姓名</th>
							<th>性别</th>
							<th>手机号码</th>
							<th>邮箱</th>
							<th>地址</th>
							<th>密码</th>
							<th>职位</th>
							<th>部门</th>
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
				url : "${APP_PATH}/emps",
				data : "pn=" + pn,
				type : "GET",
				success : function(result) {
					//console.log(result);
					//1.解析并显示员工数据
					build_emps_table(result);
					//2.解析并显示分页信息
					build_page_info(result);
					//3.解析并显示分页条
					build_page_nav(result);
				}
			});
		}

		function build_emps_table(result) {
			//清空table表格
			$("#emps_table tbody").empty();
			var emps = result.extend.pageInfo.list;
			$.each(emps,function(index, item) {
				//aler(item.empName);
				var checkBoxTd = $("<td><input type='checkbox' class='check_item'/></td>");
				var empIdTd = $("<td></td>").append(item.empId);
				var empNameTd = $("<td></td>").append(item.name);
				var empSexTd = $("<td></td>").append(
						item.sex == 0 ? "女" : "男");
				var empPhoneTd = $("<td></td>").append(item.phone);
				var empEmailTd = $("<td></td>").append(item.email);
				var empAddressTd = $("<td></td>").append(item.address);
				var empPasswordTd = $("<td></td>")
						.append(item.password);
				var empRoleTd = $("<td></td>").append(
						item.position.poName);
				var empDpnameTd = $("<td></td>").append(
						item.department.deName);
				/**
				<button class="">
									<span class="" aria-hidden="true"></span>
									编辑
								</button>
				 */
				var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn").append(
						$("<span></span>").addClass("glyphicon glyphicon-pencil")).append("编辑");
				//为编辑按钮添加一个自定义的属性，来表示当前员工id
				editBtn.attr("edit-phone", item.phone);
				var delBtn = $("<button></button>").addClass("btn btn-danger btn-sm delete_btn").append(
						$("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");
				//为删除按钮添加一个自定义的属性来表示当前删除的员工id
				delBtn.attr("del-phone", item.phone);
				var btnTd = $("<td></td>").append(editBtn).append(" ").append(delBtn);
				//append方法执行完成以后还是返回原来的元素
				$("<tr></tr>").append(checkBoxTd).append(empIdTd).append(empNameTd)
						.append(empSexTd).append(empPhoneTd).append(empEmailTd).append(empAddressTd)
						.append(empPasswordTd).append(empRoleTd)
						.append(empDpnameTd).append(btnTd).appendTo("#emps_table tbody");
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
		$("#emp_add_modal_btn").click(function() {
			//清除表单数据（表单完整重置（表单的数据，表单的样式））
			reset_form("#empAddModal form");
			//发送ajax请求，查出部门信息，显示在下拉列表中
			getDepts("#empAddModal select");
			//发送ajax请求，查出职位信息，显示在下拉列表中
			getRolets("#empAddModal select");
			//弹出模态框
			$("#empAddModal").modal({
				backdrop : "static"
			});
		});

		//查出所有的部门信息并显示在下拉列表中
		function getDepts(ele) {
			//清空之前下拉列表的值
			$(ele).empty();
			$.ajax({
				url : "${APP_PATH}/depts",
				type : "GET",
				success : function(result) {
					//{"code":100,"msg":"处理成功！",
					//"extend":{"depts":[{"deptId":1,"deptName":"开发部"},{"deptId":2,"deptName":"测试部"}]}}
					//console.log(result);
					//显示部门信息在下拉列表中
					//$("#empAddModal select").append("")
					$.each(result.extend.depts, function() {
						var optionEle = $("<option></option>").append(
								this.deName).attr("value", this.deId);
						optionEle.appendTo("#deptName_select");
					});
				}
			});

		}
		//查出所有的职位信息并显示在下拉列表中
		function getRolets(ele) {
			//清空之前下拉列表的值
			$(ele).empty();
			$.ajax({
				url : "${APP_PATH}/roles",
				type : "GET",
				success : function(result) {
					console.log(result.extend.roles);
					//显示部门信息在下拉列表中
					$.each(result.extend.roles, function() {
						var optionEle = $("<option></option>").append(
								this.poName).attr("value", this.poId);
						optionEle.appendTo("#role_select");
					});
				}
			});
		}

		//校验表单数据
		function validate_add_form() {
			//1、拿到要校验的数据，使用正则表达式
			var empName = $("#empName_add_input").val();
			var regName = /(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})/;
			if (!regName.test(empName)) {
				//alert("用户名可以是2-5位中文或者6-16位英文和数字的组合");
				show_validate_msg("#empName_add_input", "error",
						"用户名可以是2-5位中文或者6-16位英文和数字的组合");
				return false;
			} else {
				show_validate_msg("#empName_add_input", "success", "");
			};

			//2、校验手机号码
			var phone = $("#phone_add_input").val();
			var regphone = /^1([38][0-9]|4[579]|5[0-3,5-9]|6[6]|7[0135678]|9[89])\d{8}$/;
			if (!regphone.test(phone)) {
				show_validate_msg("#phone_add_input", "error", "手机号码格式错误");
				return false;
			} else {
				show_validate_msg("#phone_add_input", "success", "");
			};

			//3、校验邮箱信息
			var email = $("#email_add_input").val();
			var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
			if (!regEmail.test(email)) {
				//alert("邮箱格式不正确");
				//应该清空这个元素之前的样式
				show_validate_msg("#email_add_input", "error", "邮箱格式不正确");
				/* $("#email_add_input").parent().addClass("has-error");
				$("#email_add_input").next("span").text("邮箱格式不正确"); */
				return false;
			} else {
				show_validate_msg("#email_add_input", "success", "");
			}
			return true;
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

		//校验phone是否可用
		$("#phone_add_input").change(function() {
			//发送ajax请求校验phone是否可用
			var phone = this.value;
			$.ajax({
				url : "${APP_PATH}/checkuser",
				data : "phone=" + phone,
				type : "POST",
				success : function(result) {
					if (result.code == 100) {
						show_validate_msg("#phone_add_input",
								"success", "手机号码可用");
						$("#emp_save_btn").attr("ajax-va", "success");
					} else {
						show_validate_msg("#phone_add_input", "error",
								result.extend.va_msg);
						$("#emp_save_btn").attr("ajax-va", "error");
					}
				}
			});
		});

		//点击保存，保存员工。
		$("#emp_save_btn").click(function() {
			//1、模态框中填写的表单数据提交给服务器进行保存
			//1、先对要提交给服务器的数据进行校验
			if (!validate_add_form()) {
				return false;
			};
			//1、判断之前的ajax手机号码校验是否成功。如果成功。
			if ($(this).attr("ajax-va") == "error") {
				return false;
			}
			//2、发送ajax请求保存员工
			//alert($("#empAddModal form").serialize());
			$.ajax({
				url : "${APP_PATH}/emp",
				type : "POST",
				data : $("#empAddModal form").serialize(),
				success : function(result) {
					//alert(result.msg);
					if (result.code == 100) {
						//员工保存
						//1.关闭模态框
						$("#empAddModal").modal('hide');
						//2.来到最后一页，显示保存的信息
						//发送ajax请求显示最后一页数据即可
						to_page(totalRecord);
					} else {
						//显示失败信息
						//console.log(result);
						//有哪个字段的错误信息就显示哪个字段的；
						if (undefined != result.extend.errorFields.email) {
							//显示邮箱错误信息
							show_validate_msg("#email_add_input","error",
									result.extend.errorFields.email);
						}
						if (undefined != result.extend.errorFields.empName) {
							//显示员工名字的错误信息
							show_validate_msg("#empName_add_input","error",
									result.extend.errorFields.empName);
						}
						if (undefined != result.extend.errorFields.phone) {
							//显示员工手机号的错误信息
							show_validate_msg("#phone_add_input","error",
									result.extend.errorFields.phone);
						}
					}
				}
			});
		});

		/*-------------------------------------------------------------------------------------------------*/
		//查出所有的部门信息并显示在下拉列表中
		function getDepts2(ele) {
			//清空之前下拉列表的值
			$(ele).empty();
			$.ajax({
				url : "${APP_PATH}/depts",
				type : "GET",
				success : function(result) {
					//{"code":100,"msg":"处理成功！",
					//"extend":{"depts":[{"deptId":1,"deptName":"开发部"},{"deptId":2,"deptName":"测试部"}]}}
					//console.log(result);
					//显示部门信息在下拉列表中
					//$("#empAddModal select").append("")
					$.each(result.extend.depts, function() {
						var optionEle = $("<option></option>").append(
								this.deName).attr("value", this.deId);
						optionEle.appendTo("#deptName_select2");
					});
				}
			});

		}
		//查出所有的职位信息并显示在下拉列表中
		function getRolets2(ele) {
			//清空之前下拉列表的值
			$(ele).empty();
			$.ajax({
				url : "${APP_PATH}/roles",
				type : "GET",
				success : function(result) {
					console.log(result.extend.roles);
					//显示部门信息在下拉列表中
					$.each(result.extend.roles, function() {
						var optionEle = $("<option></option>").append(
								this.poName).attr("value", this.poId);
						optionEle.appendTo("#role_select2");
					});
				}
			});
		}
		/*-------------------------------------------------------------------------------------------------*/

		//1、我们是按钮创建之前就绑定了click，所以绑定不上。
		//1）、可以在创建按钮的时候绑定。    2）、绑定点击.live()
		//jquery新版没有live，使用on进行替代
		$(document).on("click",".edit_btn",function() {
			//alert("edit");
			//1、查出部门信息，并显示部门列表
			getDepts2("#empUpdateModal select");
			//2、查出职位信息，显示在下拉列表中
			getRolets2("#empUpdateModal select");
			//3、查出员工信息，显示员工信息
			getEmp($(this).attr("edit-phone"));
			//4、把员工的id传递给模态框的更新按钮
			$("#emp_update_btn").attr("edit-phone",
					$(this).attr("edit-phone"));
			$("#empUpdateModal").modal({
				backdrop : "static"
			});
		});

		function getEmp(phone) {
			$.ajax({
				url : "${APP_PATH}/emp/" + phone,
				type : "GET",
				success : function(result) {
					console.log(result);
					//console.log("con"+phone);
					var empData = result.extend.emp;
					$("#empId_update_input").val(empData.empId);
					$("#empName_update_input").val(empData.name);
					$("#empUpdateModal input[name=gender]").val([ empData.sex ]);
					$("#phone_update_input").val(empData.phone);
					$("#email_update_input").val(empData.email);
					$("#address_update_input").val(empData.address);
					$("#password_update_input").val(empData.password);
					$("#deptName_select2").val([ empData.depId ]);
					$("#role_select2").val([ empData.role ]);
				}
			});
		}

		//点击更新，更新员工信息
		$("#emp_update_btn").click(function() {
			//验证邮箱是否合法
			//1、校验邮箱信息
			var email = $("#email_update_input").val();
			var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
			if (!regEmail.test(email)) {
				show_validate_msg("#email_update_input",
						"error", "邮箱格式不正确");
				return false;
			} else {
				show_validate_msg("#email_update_input",
						"success", "");
			}

			//2、校验名字信息
			var empName = $("#empName_update_input").val();
			var regName = /(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})/;
			if (!regName.test(empName)) {
				//alert("用户名可以是2-5位中文或者6-16位英文和数字的组合");
				show_validate_msg("#empName_update_input",
						"error", "用户名可以是2-5位中文或者6-16位英文和数字的组合");
				return false;
			} else {
				show_validate_msg("#empName_update_input",
						"success", "");
			};

			//3、校验手机号信息
			var phone = $("#phone_update_input").val();
			var regphone = /^1([38][0-9]|4[579]|5[0-3,5-9]|6[6]|7[0135678]|9[89])\d{8}$/;
			if (!regphone.test(phone)) {
				show_validate_msg("#phone_update_input","error", "手机号码格式错误");
				return false;
			} else {
				show_validate_msg("#phone_update_input","success", "");
			};

			console.log($(this).attr("edit-phone"));
			//4、发送ajax请求保存更新的员工数据
			$.ajax({
				url : "${APP_PATH}/emp/"+ $(this).attr("edit-phone"),
				type : "PUT",
				data : $("#empUpdateModal form").serialize(),
				success : function(result) {
					//alert(result.msg);
					//1、关闭对话框
					$("#empUpdateModal").modal("hide");
					//2、回到本页面
					to_page(currentPage);
				}
			});
		});

		//单个删除
		$(document).on("click", ".delete_btn", function() {
			//1、弹出是否确认删除对话框
			var empName = $(this).parents("tr").find("td:eq(2)").text();
			var empId = $(this).parents("tr").find("td:eq(1)").text();
			var phone = $(this).attr("del-phone");
			//alert($(this).parents("tr").find("td:eq(0)").text());
			if (confirm("确认删除【" + empName + "】吗？")) {
				//确认，发送ajax请求删除即可
				$.ajax({
					url : "${APP_PATH}/emp/" + phone,
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
		$("#emp_delete_all_btn").click(function(){
			//
			var empNames = "";
			var del_phonestr = "";
			$.each($(".check_item:checked"),function(){
				//this
				empNames += $(this).parents("tr").find("td:eq(2)").text()+",";
				//组装员工phone字符串
				del_phonestr += $(this).parents("tr").find("td:eq(4)").text()+"-";
			});
			//去除empNames多余的,
			empNames = empNames.substring(0, empNames.length-1);
			//去除删除的id多余的-
			del_phonestr = del_phonestr.substring(0, del_phonestr.length-1);
			if(confirm("确认删除【"+empNames+"】吗？")){
				//发送ajax请求删除
				$.ajax({
					url:"${APP_PATH}/emp/"+del_phonestr,
					type:"DELETE",
					success:function(result){
						alert(result.msg);
						//回到当前页面
						to_page(currentPage);
					}
				});
			}
		});
		//emp_check_modal_btn
		//点击新增按钮弹出模态框。
		$("#emp_check_modal_btn").click(function() {
			//清除表单数据（表单完整重置（表单的数据，表单的样式））
			reset_form("#empCheckModal form");
			//发送ajax请求，查出route信息，显示在下拉列表中
			//getRoutets("#orstAddModal select");
			//弹出模态框
			$("#empCheckModal").modal({
				backdrop : "static"
			});
		});
		function to_page2(pn,empId) {
			//var stId=$("#orststidModal form").serialize();
			
			console.log(empId);
			$.ajax({
				url : "${APP_PATH}/empsEP/"+empId,
				data : "pn=" + pn,
				type : "GET",
				success : function(result) {
					//console.log(result);
					//1.解析并显示员工数据
					build_emps_table(result);
					//2.解析并显示分页信息
					build_page_info(result);
					//3.解析并显示分页条
					build_page_nav(result);
				}
			});
		}
		//点击保存，保存员工。
		$("#emp_check_btn").click(function(){
			var empId=$("#empId_input").val();
			to_page2(1,empId);
			//1、关闭对话框
			$("#empCheckModal").modal("hide");
		});
	</script>
</body>
</html>
