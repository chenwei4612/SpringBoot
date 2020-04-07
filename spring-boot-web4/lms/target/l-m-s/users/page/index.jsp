<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%--  <jsp:forward page="/emps"></jsp:forward> --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>index</title>
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
<link href="${APP_PATH }/static/bootstrap-3.3.7-dist/css/main.css"
	rel="stylesheet">
</head>
<body>
	<!--顶部导航栏部分-->
	<nav class="navbar navbar-inverse">
	<div class="container-fluid">
		<div class="navbar-header">
			<!-- <a class="navbar-brand" title="logoTitle" href="#">logo</a> -->
			<img src="${APP_PATH }/static/img/logo.jpg" alt="" />
		</div>
		<div class="collapse navbar-collapse">
			<ul class="nav navbar-nav navbar-right">
				<li role="presentation"><a>当前用户：</a></li>
				<li role="presentation"><a id="epName"></a></li>
				<li><a href="${APP_PATH}/login.jsp"> <span
						class="glyphicon glyphicon-lock"></span>退出登录
				</a></li>
			</ul>
		</div>
	</div>
	</nav>
	<!-- 中间主体内容部分 -->
	<div class="pageContainer">
		<!-- 左侧导航栏 -->
		<div class="pageSidebar">
			<ul class="nav nav-stacked nav-pills">
				<li role="presentation"><a
					href="${APP_PATH}/users/page/employee.jsp" target="mainFrame">员工管理</a>
				</li>
				<li role="presentation"><a
					href="${APP_PATH}/users/page/car.jsp" target="mainFrame">车辆管理</a></li>
				<li role="presentation"><a
					href="${APP_PATH}/users/page/route.jsp" target="mainFrame">线路管理</a>
				</li>
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="nav4.html" target="mainFrame">
						订单管理<span class="caret"></span>
				</a>
					<ul class="dropdown-menu">
						<li><a href="${APP_PATH}/users/page/orst.jsp"
							target="mainFrame">订单情况</a></li>
						<li><a href="${APP_PATH}/users/page/orderG.jsp"
							target="mainFrame">订单详细</a></li>
					</ul></li>
				<li role="presentation"><a
					href="${APP_PATH}/users/page/storehouse.jsp" target="mainFrame">仓库管理</a>
				</li>
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="nav4.html" target="mainFrame">
						数据统计<span class="caret"></span>
				</a>
					<ul class="dropdown-menu">
						<li><a href="${APP_PATH}/users/page/DeptCount.jsp"
							target="mainFrame">部门人数统计</a></li>
						<li><a href="${APP_PATH}/users/page/St_type_count.jsp"
							target="mainFrame">仓库统计</a></li>
						<li><a href="${APP_PATH}/users/page/OrderGCount.jsp"
							target="mainFrame">订单统计</a></li>
						<li><a href="${APP_PATH}/users/page/CarCount.jsp"
							target="mainFrame">车辆统计</a></li>
					</ul></li>
				<!-- 开始 -->
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="nav4.html" target="mainFrame">
						个人设置<span class="caret"></span>
				</a>
					<ul class="dropdown-menu">
						<li><a href="#" id="password_update">修改个人信息</a></li>
						<li><a href="${APP_PATH}/login.jsp" target="mainFrame">退出系统</a>
						</li>
					</ul></li>
				<!-- 结束 -->
				<!-- <li role="presentation">
                 <a href="nav5.html" target="mainFrame">权限设置</a>
             </li> -->
			</ul>
		</div>
		<!-- 左侧导航和正文内容的分隔线 -->
		<div class="splitter"></div>
		<!-- 正文内容部分 -->
		<div class="pageContent">
			<iframe src="${APP_PATH}/users/page/home.jsp" id="mainFrame"
				name="mainFrame" frameborder="0" width="100%" height="100%"
				frameBorder="0"> </iframe>
		</div>

	</div>
	<!-- 底部页脚部分 -->
	<div class="footer">
		<p class="text-center">2020 &copy; LMS物流管理系统.</p>
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
									class="form-control" id="empID_update_static"
									placeholder="empId"> <span class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">姓名：</label>
							<div class="col-sm-10">
								<input type="text" name="name" class="form-control"
									id="empName_update_static" placeholder="empName"> <span
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
							<label class="col-sm-2 control-label">手机：</label>
							<div class="col-sm-10">
								<input type="text" name="phone" class="form-control"
									id="phone_update_static" placeholder="phone"> <span
									class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">邮箱：</label>
							<div class="col-sm-10">
								<input type="text" name="email" class="form-control"
									id="email_static" placeholder="email@atguigu.com"> <span
									class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">地址：</label>
							<div class="col-sm-10">
								<input type="text" name="address" class="form-control"
									id="address_static" placeholder="地址"> <span
									class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">密码：</label>
							<div class="col-sm-10">
								<input type="text" name="password" class="form-control"
									id="password_update_input"> <span class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">部门：</label>
							<div class="col-sm-4">
								<p class="form-control-static" id="deptName_static"></p>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">职位：</label>
							<div class="col-sm-4">
								<p class="form-control-static" id="role_static"></p>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">关闭</button>
							<button type="button" class="btn btn-primary" id="emp_update_btn">更新</button>
						</div>
				</div>
			</div>
		</div>

		<script type="text/javascript">
			var pphone = "";
			//1.页面加载完成以后，直接去发送一个ajax请求，要到分页数据
			//console.log('${currentUser}');
			var epName = "";
			function parseUrl(url) {
				if (url.indexOf("?") == -1) {
					return {};
				}
				var query = url.split("?")[1];
				var queryArr = query.split("&");
				var obj = {};
				queryArr.forEach(function(item) {
					var key = item.split("=")[0];
					var value = item.split("=")[1];
					obj[key] = decodeURIComponent(value);
				});
				return obj;
			}
			// url传递的信息
			var urlMsg = parseUrl(window.location.search);
			console.log(urlMsg);
			$.ajax({
				url : "${APP_PATH}/emp/" + urlMsg.phone,
				type : "GET",
				success : function(result) {
					console.log(result);
					var empData = result.extend.emp;
					epName = empData.name;
					$("#epName").text(empData.name);
				}
			});
			$("#password_update").click(function() {
		    	getEmp(urlMsg.phone);
				//4、把员工的id传递给模态框的更新按钮
				$("#emp_update_btn").attr("edit-phone",urlMsg.phone);
				$("#empUpdateModal").modal({
					backdrop : "static"
				});
		});
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
		//个人信息
		function getEmp(phone) {
			console.log(phone);
			$.ajax({
				url : "${APP_PATH}/emp/" + phone,
				type : "GET",
				success : function(result) {
					var empData = result.extend.emp;
					pphone = empData.phone;
					$("#empID_update_static").val(empData.empId);
					$("#empName_update_static").val(empData.name);
					$("#empUpdateModal input[name=gender]").val([ empData.sex ]);
					$("#email_static").val(empData.email);
					$("#address_static").val(empData.address);
					$("#phone_update_static").val(empData.phone);
					$("#password_update_input").val(empData.password);
					$("#deptName_static").text(empData.depId == 1 ? "运输部"
							: ((empData.depId == 2) ? "仓库管理":((empData.depId == 3) ? "物流派送":
									((empData.depId == 4) ? "信息管理":((empData.depId == 5) ? "财务部": "人事部")))));
					$("#role_static").text(empData.role == 0 ? "非正式员工"
							: ((empData.role == 1) ? "正式员工": ((empData.role == 2) ? "司机": ((empData.role == 3) ? "派送员"
										: ((empData.role == 4) ? "管理员": "经理")))));
				}
			});
		}
		//点击更新，更新员工信息
		$("#emp_update_btn").click(function() {
			//验证邮箱是否合法
			//1、校验邮箱信息
			var email = $("#email_static").val();
			var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
			if (!regEmail.test(email)) {
				show_validate_msg("#email_static","error", "邮箱格式不正确");
				return false;
			} else {
				show_validate_msg("#email_static","success", "");
			}

			//2、校验名字信息
			var empName = $("#empName_update_static").val();
			var regName = /(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})/;
			if (!regName.test(empName)) {
				//alert("用户名可以是2-5位中文或者6-16位英文和数字的组合");
				show_validate_msg("#empName_update_static","error", "用户名可以是2-5位中文或者6-16位英文和数字的组合");
				return false;
			} else {
				show_validate_msg("#empName_update_static","success", "");
			};

			//3、校验手机号信息
			var phone = $("#phone_update_static").val();
			var regphone = /^1([38][0-9]|4[579]|5[0-3,5-9]|6[6]|7[0135678]|9[89])\d{8}$/;
			if (!regphone.test(phone)) {
				show_validate_msg("#phone_update_static","error", "手机号码格式错误");
				return false;
			} else {
				show_validate_msg("#phone_update_static","success", "");
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
		</script>
</body>
</html>
