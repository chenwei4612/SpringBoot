<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <jsp:forward page="/routes"></jsp:forward> --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>订单列表</title>
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
<!-- 订单查询 -->
<div class="modal fade" id="orderGcheckModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog  modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">订单查询</h4>
				</div>
				<div class="modal-body row col-md-12">
					<form class="form-horizontal">
						<div class="form-group">
							<label class="col-sm-2 control-label">订单id:</label>
							<div class="col-sm-4">
								<input type="text" name="ordid" class="form-control"
									id="ordid_input" placeholder="ordid"> <span
									class="help-block"></span>
							</div>
						</div>
					</form>
				</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
						<button type="button" class="btn btn-primary" id="orderG_check_btn">查询</button>
					</div>
			</div>
		</div>
	</div>
	<!-- 搭建显示页面 -->
	<div class="container">
		<!-- title -->
		<div class="row">
			<div class="col-md-8">
				<h1>订单信息查看</h1>
			</div>
		</div>
		<!-- 按钮 -->
		<div class="row">
			<div class="col-md-4 col-md-offset-9">
				<button class="btn btn-primary" id="orderG_check_modal_btn">
				<span class="glyphicon glyphicon-search" aria-hidden="true"></span>查找</button>
			</div>
		</div>
		<!-- 显示表格数据 -->
		<div class="row">
			<div class="col-md-12 ">
				<table class="table table-hover" id="orderGs_table">
					<thead>
						<tr>
							<th><input type="checkbox" id="check_all" /></th>
							<th>订单Id</th>
							<th>日期</th>
							<th>寄件人</th>
							<th>电话</th>
							<th>地址</th>
							<th>收件人</th>
							<th>电话</th>
							<th>地址</th>
							<th>备注</th>
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
	$('#date').datetimepicker({
		forceParse : 0,//设置为0，时间不会跳转1899，会显示当前时间。
		language : 'zh-CN',//显示中文
		format : 'yyyy-mm-dd',//显示格式
		minView : "month",//设置只显示到月份
		initialDate : new Date(),//初始化当前日期
		autoclose : true,//选中自动关闭
		todayBtn : true
	//显示今日按钮
	})
	$('#date_update_input').datetimepicker({
		forceParse : 0,//设置为0，时间不会跳转1899，会显示当前时间。
		language : 'zh-CN',//显示中文
		format : 'yyyy-mm-dd',//显示格式
		minView : "month",//设置只显示到月份
		initialDate : new Date(),//初始化当前日期
		autoclose : true,//选中自动关闭
		todayBtn : true
	//显示今日按钮
	})
	$("#date").datetimepicker("setDate", new Date()); //设置显示默认当天的时间
		var totalRecord, currentPage;
		//1.页面加载完成以后，直接去发送一个ajax请求，要到分页数据
		$(function() {
			//去首页
			to_page(1);
		});
		
		function to_page2(orid) {
			$.ajax({
				url : "${APP_PATH}/orderGs/"+orid,
				//data : "orid="+orid,
				type : "GET",
				success : function(result) {
					//console.log(result);
					//1.解析并显示订单数据
					build_orderGs_table(result);
					//2.解析并显示分页信息
					//build_page_info(result);
					//3.解析并显示分页条
					//build_page_nav(result);
				}
			});
		}
		//点击
		$("#orderG_check_modal_btn").click(function() {
			//orderGcheckModal
			reset_form("#orderGcheckModal form");
			//发送ajax请求，查出route信息，显示在下拉列表中
			//getRoutets("#orstAddModal select");
			//弹出模态框
			$("#orderGcheckModal").modal({
				backdrop : "static"
			});
		});
		
		$("#orderG_check_btn").click(function() {
			var orid=$("#ordid_input").val();
			console.log(orid);
			to_page2(orid);
			//1、关闭对话框
			$("#orderGcheckModal").modal("hide");
		});
		
		function to_page(pn) {
			$.ajax({
				url : "${APP_PATH}/orderGs",
				data : "pn=" + pn,
				type : "GET",
				success : function(result) {
					//console.log(result);
					//1.解析并显示订单数据
					build_orderGs_table(result);
					//2.解析并显示分页信息
					build_page_info(result);
					//3.解析并显示分页条
					build_page_nav(result);
				}
			});
		}

		function build_orderGs_table(result) {
			//清空table表格
			$("#orderGs_table tbody").empty();
			var orderGs = result.extend.pageInfo.list;
			$.each(orderGs,function(index, item) {
				//aler(item.empName);
				var checkBoxTd = $("<td><input type='checkbox' class='check_item'/></td>");
				var ordId = $("<td></td>").append(item.ordId);
				var date = $("<td></td>").append(item.date);
				var rname = $("<td></td>").append(item.rname);
				var rphone = $("<td></td>").append(item.rphone);
				var raddress = $("<td></td>").append(item.raddress);
				var sname = $("<td></td>").append(item.sname);
				var sphone = $("<td></td>").append(item.sphone);
				var saddress = $("<td></td>").append(item.saddress);
				var remark = $("<td></td>").append(item.remark);
				//append方法执行完成以后还是返回原来的元素
				$("<tr></tr>").append(checkBoxTd).append(ordId).append(date).append(rname)
						.append(rphone).append(raddress).append(sname).append(sphone)
						.append(saddress).append(remark).appendTo("#orderGs_table tbody");
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
		
	</script>
</body>
</html>
