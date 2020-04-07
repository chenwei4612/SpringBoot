<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>员工登陆</title>
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
<body
	style="background: url(${APP_PATH }/static/img/login.jpg) no-repeat center center fixed; background-size: 100%;">
	<!-- <h3 class="modal-title text-center">13000014229</h3>
	<h3 class="modal-title text-center">00000000</h3> -->
	<div class="modal-dialog" style="margin-top: 10%;" id="loginModal">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title text-center" id="myModalLabel">登录</h4>
			</div>
			<form class="form-horizontal">
			<div class="modal-body" id="model-body">
				<div class="form-group">
					<input type="text" name="phone" class="form-control"
						id="userphone_input" placeholder="phone" autocomplete="off">
					<span class="help-block"></span>
				</div>
				<div class="form-group">
					<input type="password" class="form-control" placeholder="密码"
						autocomplete="off" name="password" id="password_input"> <span
						class="help-block"></span>
				</div>
			</div>
			</form>
			<div class="modal-footer">
				<div class="form-group">
					<button type="button" class="btn btn-primary form-control"
						id="emp_login_btn">登录</button>
				</div>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal -->
</body>
<script type="text/javascript">
var pp="";
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
$("#userphone_input").change(
		function() {
			//发送ajax请求校验phone是否可用
			var phone = this.value;
			pp=phone;
			$.ajax({
				url : "${APP_PATH}/checkuserPhone",
				data : "phone=" + phone,
				type : "POST",
				success : function(result) {
					if (result.code == 100) {
						show_validate_msg("#userphone_input","success", "输入正确");
						$("#emp_login_btn").attr("ajax-va", "success");
					} else {
						show_validate_msg("#userphone_input", "error",result.extend.va_msg);
						$("#emp_login_btn").attr("ajax-va", "error");
					}
				}
			});
		});
//员工登录
$("#emp_login_btn").click(function() {
	 $.ajax({
		url : "${APP_PATH}/login",
		type : "POST",
		data : $("#loginModal form").serialize(),
		success : function(result) {
			//登陆跳转
			if(result>3){
				window.location.href =  "${APP_PATH}/users/page/index.jsp?phone="+pp;
			}else if(result>2){
				window.location.href =  "${APP_PATH}/users/page/index2.jsp?phone="+pp;
			}else if(result>0){
				window.location.href =  "${APP_PATH}/users/page/index3.jsp?phone="+pp;
			}else{
				show_validate_msg("#password_input", "error","密码错误！！");
			} 
		} 
		});  
});
</script>
</html>