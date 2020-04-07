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
					<button type="button" class="btn btn-primary" id="storehouse_check_btn">查询</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 搭建显示页面 -->
	<div class="container">
		<!-- title -->
		<div class="row">
			<div class="col-md-8 col-md-offset-1">
				<h1>仓库信息显示</h1>
			</div>
		</div>
		<!-- 按钮 -->
		<div class="row">
			<div class="col-md-3 col-md-offset-8">
				<button class="btn btn-primary" id="storehouse_check_modal_btn">
				<span class="glyphicon glyphicon-search" aria-hidden="true"></span>查找</button>
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
				//append方法执行完成以后还是返回原来的元素
				$("<tr></tr>").append(checkBoxTd).append(storeId).append(type).append(number)
						.append(State).append(remark).appendTo("#storehouses_table tbody");
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
		//点击查询按钮弹出模态框。
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
		//点击查询。
		$("#storehouse_check_btn").click(function(){
			var storeId=$("#storeId_input").val();
			to_page2(1,storeId);
			//1、关闭对话框
			$("#storehousecheckModal").modal("hide");
		});
	</script>
</body>
</html>
