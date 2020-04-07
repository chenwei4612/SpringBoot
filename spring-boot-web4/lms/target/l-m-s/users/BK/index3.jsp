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
	<link href="${APP_PATH }/static/bootstrap-3.3.7-dist/css/main.css" rel="stylesheet">
</head>
<body>
<!--顶部导航栏部分-->
<nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" title="logoTitle" href="#">logo</a>
       </div>
       <div class="collapse navbar-collapse">
           <ul class="nav navbar-nav navbar-right">
           		<li role="presentation">
               		<a>当前用户3：</a>
               </li>
               <li role="presentation">
               		<a id="epName"></a>
               </li>
               <li>
                   <a href="${APP_PATH}/login.jsp">
                         <span class="glyphicon glyphicon-lock"></span>退出登录</a>
                </li>
            </ul>
       </div>
    </div>      
</nav>
<!-- 中间主体内容部分 -->
<div class="pageContainer">
     <!-- 左侧导航栏 -->
     <div class="pageSidebar">
         <ul class="nav nav-stacked nav-pills">
             <li role="presentation">
                 <a href="${APP_PATH}/users/page/employee.jsp" target="mainFrame" >员工管理</a>
             </li>
             <li role="presentation">
                 <a href="${APP_PATH}/users/page/car.jsp" target="mainFrame">车辆管理</a>
             </li>
             <li role="presentation">
                 <a href="${APP_PATH}/users/page/route.jsp" target="mainFrame">线路管理</a>
             </li>
             <li class="dropdown">
                 <a class="dropdown-toggle" data-toggle="dropdown" href="nav4.html" target="mainFrame">
                     订单管理<span class="caret"></span>
                 </a>
                 <ul class="dropdown-menu">
                     <li>
                         <a href="${APP_PATH}/users/page/orst.jsp" target="mainFrame">订单情况</a>
                     </li>
                     <li>
                         <a href="${APP_PATH}/users/page/orderG.jsp" target="mainFrame">订单详细</a>
                     </li>
                 </ul>
             </li>
             <li role="presentation">
                 <a href="${APP_PATH}/users/page/storehouse.jsp" target="mainFrame">仓库管理</a>
             </li>
             <li class="dropdown">
                 <a class="dropdown-toggle" data-toggle="dropdown" href="nav4.html" target="mainFrame">
                    数据统计<span class="caret"></span>
                 </a>
                 <ul class="dropdown-menu">
                     <li>
                         <a href="${APP_PATH}/users/page/DeptCount.jsp" target="mainFrame">部门人数统计</a>
                     </li>
                     <li>
                         <a href="${APP_PATH}/users/page/St_type_count.jsp" target="mainFrame">仓库统计</a>
                     </li>
                     <li>
                         <a href="${APP_PATH}/users/page/OrderGCount.jsp" target="mainFrame">订单统计</a>
                     </li>
                     <li>
                         <a href="${APP_PATH}/users/page/CarCount.jsp" target="mainFrame">车辆统计</a>
                     </li>
                 </ul>
             </li>
             <!-- 开始 -->
             <li class="dropdown">
                 <a class="dropdown-toggle" data-toggle="dropdown" href="nav4.html" target="mainFrame">
                     个人设置<span class="caret"></span>
                 </a>
                 <ul class="dropdown-menu">
                     <li>
                         <a href="#" id="password_update">修改密码</a>
                     </li>
                     <li>
                         <a href="#" id="emp_check">查看个人信息</a>
                     </li>
                     <li>
                         <a href="${APP_PATH}/login.jsp" target="mainFrame">退出系统</a>
                     </li>
                 </ul>
             </li>
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
       <iframe src="${APP_PATH}/users/page/home.jsp" id="mainFrame" name="mainFrame" 
       frameborder="0" width="100%"  height="100%" frameBorder="0">
       </iframe> 
     </div>

 </div>
  <!-- 底部页脚部分 -->
 <div class="footer">
     <p class="text-center">
         2018 &copy; 柒晓白.
     </p>
 </div>
 
 <!-- 员工的模态框 -->
	<div class="modal fade" id="empModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">员工信息</h4>
					<!-- <p class="form-control-static" name="UpempId" id="empid_update_static"></p> -->
				</div>
				<div class="modal-body">
					<form class="form-horizontal">
						<div class="form-group">
							<label class="col-sm-2 control-label">empID</label>
							<div class="col-sm-10">
								<p class="form-control-static" id="empID_static"></p>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">empName</label>
							<div class="col-sm-10">
								<p class="form-control-static" id="empName_static"></p>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">gender</label>
							<div class="col-sm-10">
								<p class="form-control-static" id="gender_static"></p>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">phone</label>
							<div class="col-sm-10">
								<p class="form-control-static" id="phone_static"></p>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">email</label>
							<div class="col-sm-10">
								<p class="form-control-static" id="email_static"></p>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">address</label>
							<div class="col-sm-10">
								<p class="form-control-static" id="address_static"></p>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">password</label>
							<div class="col-sm-10">
								<p class="form-control-static" id="password_static"></p>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">deptName</label>
							<p class="form-control-static" id="deptName_static"></p>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">role</label>
							<div class="col-sm-4">
								<p class="form-control-static" id="role_static"></p>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
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
							<label class="col-sm-2 control-label">empID</label>
							<div class="col-sm-10">
							<p class="form-control-static" id="empID_update_static"></p>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">empName</label>
							<div class="col-sm-10">
								<p class="form-control-static" id="empName_update_static"></p>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">phone</label>
							<div class="col-sm-10">
								<p class="form-control-static" id="phone_update_static"></p>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">password</label>
							<div class="col-sm-10">
								<input type="text" name="password" class="form-control"
									id="password_update_input" > <span
									class="help-block"></span>
							</div>
						</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" id="emp_update_btn">更新</button>
				</div>
			</div>
		</div>
	</div>
 
	<script type="text/javascript">
	   	var pphone="";
		//1.页面加载完成以后，直接去发送一个ajax请求，要到分页数据
		//console.log('${currentUser}');
		var epName="";
		function parseUrl(url){
		    if(url.indexOf("?") == -1) {
		        return {};
		    }
		    var query = url.split("?")[1];
		    var queryArr = query.split("&");
		    var obj = {};
		    queryArr.forEach(function(item){
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
					epName=empData.name;
					$("#epName").text(empData.name);
				}
			});
		    //个人信息
		    function getEmp(phone) {
		    	console.log(phone);
			$.ajax({
				url : "${APP_PATH}/emp/" + phone,
				type : "GET",
				success : function(result) {
					var empData = result.extend.emp;
					pphone=empData.phone;
					$("#empID_update_static").text(empData.empId);
					$("#empName_update_static").text(empData.name);
					$("#phone_update_static").text(empData.phone);
					$("#password_update_input").val(empData.password);
				}
			});
		}
		    $("#password_update").click(function() {
		    	getEmp(urlMsg.phone);
				//4、把员工的id传递给模态框的更新按钮
				$("#emp_update_btn").attr("edit-phone",urlMsg.phone);
				$("#empUpdateModal").modal({
					backdrop : "static"
				});
		});
		  //点击更新，更新员工信息
			$("#emp_update_btn").click(function() {
				//alert("111");
				//发送ajax请求保存更新的员工数据
				//var phone=$("#phone_update_static").val();
				 $.ajax({
					url : "${APP_PATH}/empup/"+ $(this).attr("edit-phone"),
					type : "PUT",
					data : $("#empUpdateModal form").serialize(),
					success : function(result) {
						//1、关闭对话框
						$("#empUpdateModal").modal("hide");
					}
				}); 
			});
		  
			function getEmp2(phone) {
			$.ajax({
				url : "${APP_PATH}/emp/" + phone,
				type : "GET",
				success : function(result) {
					var empData = result.extend.emp;
					console.log(empData);
					$("#empID_static").text(empData.empId);
					$("#empName_static").text(empData.name);
					$("#gender_static").text(empData.sex == 0 ? "女" : "男");
					$("#phone_static").text(empData.phone);
					$("#email_static").text(empData.email);
					$("#address_static").text(empData.address);
					$("#password_static").text(empData.password);
					$("#deptName_static").text(empData.depId == 1 ? "运输部" :
						((empData.depId == 2 )?"仓库管理":((empData.depId == 3 )?"物流派送":((empData.depId == 4 )?"信息管理":
							((empData.depId == 5 )?"财务部":"人事部")))));
					$("#role_static").text(empData.role == 0 ? "非正式员工" : ((empData.role == 1 )?"正式员工":
						((empData.role == 2 )?"司机":((empData.role == 3 )?"派送员":((empData.role == 4 )?"管理员":"经理")))));
				}
			});
		} 
			$("#emp_check").click(function() {
		    	getEmp2(urlMsg.phone);
				$("#empModal").modal({
					backdrop : "static"
				});
		});
	</script>
</body>
</html>
 