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
	<!-- 新订单添加的模态框 -->
	<div class="modal fade" id="orderGAddModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog  modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">新订单添加</h4>
				</div>
				<div class="modal-body" style="background: red;">
					<form class="form-horizontal">
						<div class="form-group" style="background: yellow;">
							<label class="col-sm-2 control-label">Date:</label>
							<!--指定 date标记-->
							<div class="col-sm-10">
								<input type="text" id="date" name="date" placeholder="查询年月"
									class="form-control">
							</div>
						</div>
						<div class="form-group" style="background: yellow;">
							<label class="col-sm-2 control-label">Rname:</label>
							<div class="col-sm-4">
								<input type="text" name="rname" class="form-control"
									id="rname_add_input" placeholder="number"> <span
									class="help-block"></span>
							</div>
							<label class="col-sm-2 control-label">Rphone:</label>
							<div class="col-sm-4">
								<input type="text" name="rphone" class="form-control"
									id="rphone_add_input" placeholder="rphone"> <span
									class="help-block"></span>
							</div>
						</div>
						<!-- <div class="form-group">
						</div> -->
						<div class="form-group">
							<label class="col-sm-2 control-label">Raddress:</label>
							<div class="col-sm-3">
								<!-- 部门提交线路id即可 -->
								<select class="form-control" name="rpovince" id="privce_select1">
									 <option value ="广东">广东</option>
									 <option value ="广西">广西</option>
									 <option value ="福建">福建</option>
								</select>
							</div>
							<div class="col-sm-3">
								<!-- 部门提交线路id即可 -->
								<select class="form-control" name="rcity" id="city_select1">
									 <option value ="阳江">阳江</option>
									 <option value ="阳东">阳东</option>
									 <option value ="阳西">阳西</option>
								</select>
							</div>
							<div class="col-sm-4">
								<input type="text" name="raddress" class="form-control"
									id="raddress_add_input" placeholder="raddress" pattern="[\u4E00-\u9FFF]+" > <span
									class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">Sname:</label>
							<div class="col-sm-10">
								<input type="text" name="sname" class="form-control"
									id="sname_add_input" placeholder="sname"> <span
									class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">Sphone:</label>
							<div class="col-sm-10">
								<input type="text" name="sphone" class="form-control"
									id="sphone_add_input" placeholder="sphone"> <span
									class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">Raddress:</label>
							<div class="col-sm-3">
								<!-- 部门提交线路id即可 -->
								<select class="form-control" name="spovince" id="privce_select2">
									 <option value ="广东">广东</option>
									 <option value ="广西">广西</option>
									 <option value ="福建">福建</option>
								</select>
							</div>
							<div class="col-sm-3">
								<!-- 部门提交线路id即可 -->
								<select class="form-control" name="scity" id="city_select2">
									 <option value ="阳江">阳江</option>
									 <option value ="阳东">阳东</option>
									 <option value ="阳西">阳西</option>
								</select>
							</div>
							<div class="col-sm-4">
								<input type="text" name="saddress" class="form-control"
									id="raddress_add_input" placeholder="raddress" pattern="[\u4E00-\u9FFF]+" > <span
									class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">Remark:</label>
							<div class="col-sm-10">
								<input type="text" name="remark" class="form-control"
									id="remark_add_input" placeholder="remark"> <span
									class="help-block"></span>
							</div>
						</div>
					</form>
				</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
						<button type="button" class="btn btn-primary" id="orderG_save_btn">保存</button>
					</div>
			</div>
		</div>
	</div>
	<!-- 搭建显示页面 -->
	<div class="container">
		<!-- title -->
		<div class="row">
			<div class="col-md-8">
				<h1>Order</h1>
			</div>
		</div>
		<!-- 按钮 -->
		<div class="row">
			<div class="col-md-3 col-md-offset-9">
				<button class="btn btn-primary" id="orderG_add_modal_btn">新增</button>
				<button class="btn btn-danger" id="orderG_delete_all_btn">删除</button>
			</div>
		</div>
		<!-- 显示表格数据 -->
		<div class="row">
			<div class="col-md-12 ">
				<table class="table table-hover" id="orderGs_table">
					<thead>
						<tr>
							<th><input type="checkbox" id="check_all" /></th>
							<th>OrdId</th>
							<th>Date</th>
							<th>Rname</th>
							<th>Rphone</th>
							<th>Raddress</th>
							<th>Sname</th>
							<th>Sphone</th>
							<th>Saddress</th>
							<th>Remark</th>
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
				var editBtn = $("<button></button>")
						.addClass("btn btn-primary btn-sm edit_btn")
						.append($("<span></span>").addClass("glyphicon glyphicon-pencil"))
						.append("编辑");
				//为编辑按钮添加一个自定义的属性，来表示当前订单id
				editBtn.attr("edit-ordId", item.ordId);
				var delBtn = $("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
						.append($("<span></span>").addClass("glyphicon glyphicon-trash"))
						.append("删除");
				//为删除按钮添加一个自定义的属性来表示当前删除的订单id
				delBtn.attr("del-ordId", item.ordId);
				var btnTd = $("<td></td>").append(editBtn)
						.append(" ").append(delBtn);
				//append方法执行完成以后还是返回原来的元素
				$("<tr></tr>").append(checkBoxTd).append(ordId).append(date).append(rname)
						.append(rphone).append(raddress).append(sname).append(sphone)
						.append(saddress).append(remark).append(btnTd).appendTo(
								"#orderGs_table tbody");
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
		$("#orderG_add_modal_btn").click(function() {
			//清除表单数据（表单完整重置（表单的数据，表单的样式））
			reset_form("#orderGAddModal form");
			//发送ajax请求，查出订单信息，显示在下拉列表中
			//getTypet("#orderGAddModal select");
			//date
			//getDate();
			//弹出模态框
			$("#orderGAddModal").modal({
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
		//校验表单数据
		function validate_add_form() {
			//校验手机号码
			var rphone = $("#rphone_add_input").val();
			var sphone = $("#sphone_add_input").val();
			var regphone = /^1([38][0-9]|4[579]|5[0-3,5-9]|6[6]|7[0135678]|9[89])\d{8}$/;
			if (!regphone.test(rphone)) {
				show_validate_msg("#rphone_add_input", "error", "手机号码格式错误");
				return false;
			} else {
				show_validate_msg("#rphone_add_input", "success", "");
			};
			if (!regphone.test(sphone)) {
				show_validate_msg("#sphone_add_input", "error", "手机号码格式错误");
				return false;
			} else {
				show_validate_msg("#sphone_add_input", "success", "");
			};
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
		/* function getMess(){
			var mess;
			var pr=$("#privce_select").val();
			var ci=$("#city_select").val();
			var ad=$("#address_add_input").val();
			console.log(pr+" "+ci+" "+ad);
			
			
			mess=$("#orderGAddModal form").serialize();
			return mess;
		} */

		//点击保存，保存订单。
		$("#orderG_save_btn").click(function() {
			console.log($("#orderGAddModal form").serialize());
			if (!validate_add_form()) {
				return false;
			};
			$.ajax({
				url : "${APP_PATH}/orderG",
				type : "POST",
				data : $("#orderGAddModal form").serialize(),
				success : function(result) {
					//alert(result.msg);
					if (result.code == 100) {
						//员工保存
						//1.关闭模态框
						$("#orderGAddModal").modal('hide');
						//2.来到最后一页，显示保存的信息
						//发送ajax请求显示最后一页数据即可
						to_page(totalRecord);
					} else {
						//显示失败信息
						//console.log(result);
						//有哪个字段的错误信息就显示哪个字段的；
						if (undefined != result.extend.errorFields.rphone) {
							//显示员工手机号的错误信息
							show_validate_msg("#rphone_add_input","error",
									result.extend.errorFields.rphone);
						}
						if (undefined != result.extend.errorFields.sphone) {
							//显示员工手机号的错误信息
							show_validate_msg("#sphone_add_input","error",
									result.extend.errorFields.sphone);
						}
					}
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
	</script>
</body>
</html>
