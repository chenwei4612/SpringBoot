<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    /*引用jsp-api*/
    pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta http-equiv="Content-type" content="text/html; charset=UTF-8">
    <title>员工列表</title>
    <script type="text/javascript"
	src="${APP_PATH }/static/js/jquery-1.12.4.min.js"></script>
    <link
	href="${APP_PATH }/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"
	rel="stylesheet">
    <!-- 可选的 Bootstrap 主题文件（一般不用引入） -->
    <%--link rel="stylesheet" href="${APP_PATH}/resources/bootstrap/css/bootstrap-theme.min.css">--%>
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script
	src="${APP_PATH }/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>
<%--搭建显示页面--%>
<div class="container">
    <%--标题--%>
    <div class="row">
        <div class="col-md-12">
            <h1>SSM-CRUD</h1>
        </div>
    </div>
    <%--按钮--%>
    <div class="row">
        <div class="col-md-4 col-md-offset-8">
            <button id="table_add" type="button" class="btn btn-primary btn" data-target="#myModal">
                新增
            </button>
            <button id="table_del" class="btn btn-danger">删除</button>
        </div>
    </div>
    <%--显示表格数据--%>
    <div class="row">
        <div class="col-md-12">
            <%--设置表的网格状：table-bordered--%>
            <table class="table table-hover" id="emps_table">
                <thead>
                <tr>
                    <th checkbox="true">ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Gender</th>
                    <th>DeptName</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
        </div>
    </div>

    <%--显示分页信息--%>
    <div class="row">
        <%--分页文字信息--%>
        <div class="col-md-6" id="page_info_area"></div>
        <%--分页条信息--%>
        <div class="col-md-6" id="page_nav_area">
            <nav aria-label="Page navigation">
            </nav>
        </div>
    </div>
</div>

<%--员工修改的模态框--%>
<div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">员工修改</h4>
            </div>
            <div class="modal-body">
                <p>
                <form class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">EmpName</label>
                        <div class="col-sm-10">
                            <%--                            只读：Readonly--%>
                            <input type="text" name="empName" class="form-control" id="empName_update" Readonly
                                   placeholder="请输入员工用户名">
                            <input type="hidden" name="empId" id="empId_update"/>
                            <%--                            静态实列--%>
                            <%--<p id="empName_update" class="form-control-static"></p>--%>
                            <%--添加校验信息--%>
                            <span></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">Email</label>
                        <div class="col-sm-10">
                            <input type="text" name="email" class="form-control" id="email_update"
                                   placeholder="请输入合法邮箱">
                            <%--添加校验信息--%>
                            <span></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">Gender</label>
                        <div class="col-sm-10">
                            <%--多选框--%>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender1_update" value="1" checked> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender2_update" value="2"> 女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">DeptName</label>
                        <div class="col-sm-4">
                            <%--部门提交部门id--%>
                            <select class="form-control" name="deptId"></select>
                        </div>
                    </div>
                </form>
                </p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="btn_update">更新</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<%--员工添加的模态框--%>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">员工添加</h4>
            </div>
            <div class="modal-body">
                <p>
                <form class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">EmpName</label>
                        <div class="col-sm-10">
                            <input type="text" name="empName" class="form-control" id="empName_add"
                                   placeholder="请输入员工用户名">
                            <%--添加校验信息--%>
                            <span></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">Email</label>
                        <div class="col-sm-10">
                            <input type="text" name="email" class="form-control" id="empEmail_add"
                                   placeholder="请输入合法邮箱">
                            <%--添加校验信息--%>
                            <span></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">Gender</label>
                        <div class="col-sm-10">
                            <%--多选框--%>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender1_add" value="1" checked> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender2_add" value="2"> 女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">DeptName</label>
                        <div class="col-sm-4">
                            <%--部门提交部门id--%>
                            <select class="form-control" name="deptId"></select>
                        </div>
                    </div>
                </form>
                </p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="model_save">保存</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
</body>
<script type="application/javascript">
    //定义一个总记录数，为了后面新增后直接跳转到最后一页
    var totalRecord;
    // $(function () ncaught TypeError: e.indexOf is not a function
    $(window).on('load', function () {
        $("input[name='checkbox']").prop("checked", true);
    });
    // window.onload = function () ,同页面加载就会调函数
    window.onload = function () {
        $("tr:checkbox").prop("checked", this.checked);
        to_page(1);
    };

    function to_page(page) {
        $.ajax({
            url: '/emps',
            dataType: 'json',
            data: "page=" + page,
            type: 'get',
            success: function (result) {
                if (result.code === 0) {
                    //解析并显示员工数据
                    build_emps_table(result);
                    //将总记录数复制给全局变量
                    totalRecord = result.pageInfo.total;
                    //解析并显示分页信息
                    build_page_info(result);
                    //解析并显示分页条数据
                    build_page_nav(result);
                }
            }
        })
    }

    function build_emps_table(result) {
        var emps = result.pageInfo.list;
        //清空元素
        $("#emps_table tbody").empty();
        $.each(emps, function (index, item) {
            var empId = $("<td></td>").append(item.empId);
            var empName = $("<td></td>").append(item.empName);
            var gender = $("<td></td>").append(item.gender ? '男' : '女');
            var email = $("<td></td>").append(item.email);
            var deptName = $("<td></td>").append(item.department.deptName);
            var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
                .append("<span style='padding-right: 3px;'></span>").addClass("glyphicon glyphicon-paperclip")
                .append("编辑");
            //为每一行的编辑按钮添加一个属性,赋值给它
            editBtn.attr("edit-id", item.empId);
            var delBtn = $("<button></button>").addClass("btn btn-primary btn-sm delete_btn")
                .append("<span style='padding-right: 3px;'></span>").addClass("glyphicon glyphicon-trash")
                .append("删除");
            var btnOperation = $("<td></td>").append(editBtn).append(delBtn);
            //append方法执行后还是返回的原来的元素
            $("<tr></tr>").append(empId)
                .append(empName)
                .append(email)
                .append(gender)
                .append(deptName)
                .append(btnOperation)
                .appendTo("#emps_table tbody");
        })
    }

    /*解析显示分页信息*/
    function build_page_info(result) {
        //清空元素方法，避免重复添加数据，成倍增长
        $("#page_info_area").empty();
        $("#page_info_area").append("当前" + result.pageInfo.pageNum + "页,总" + result.pageInfo.pages + "页,总记录数" + result.pageInfo.total);
    }

    /*解析显示分页条*/
    function build_page_nav(result) {
        //清空元素方法，避免重复添加数据，成倍增长
        $("#page_nav_area").empty();
        var ul = $("<ul></ul>").addClass("pagination");
        //首页的li
        var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr('href', '#'));
        var prePageLi = $("<li></li>").append($("<a></a>").append("<span></span>").append("&laquo;"));
        //判断是否有上一页，为false就是首页，禁用
        if (result.pageInfo.hasPreviousPage == false) {
            firstPageLi.addClass("disabled");
            prePageLi.addClass("disabled");
        } else {
            //为首页提供翻页
            firstPageLi.click(function () {
                to_page(1)
            });
            //为前一页提供翻页
            prePageLi.click(function () {
                to_page(result.pageInfo.pageNum - 1);
            });
        }
        var nextPageLi = $("<li></li>").append($("<a></a>").append("<span></span>").append("&raquo;"));
        //末页的li
        var lastPageLi = $("<li></li>").append($("<a></a>").append("末页").attr('href', '#'));
        //如果为尾页，没有下一页，就禁用，也就不需要click函数触发
        if (result.pageInfo.hasNextPage == false) {
            nextPageLi.addClass("disabled");
            lastPageLi.addClass("disabled");
        } else {
            //为下一页提供翻页
            nextPageLi.click(function () {
                to_page(result.pageInfo.pageNum + 1);
            });
            //为末页提供翻页
            lastPageLi.click(function () {
                to_page(result.pageInfo.pages);
            });
        }
        //添加首页和上一页在分页条中
        ul.append(firstPageLi).append(prePageLi);
        //遍历当前需要的导航条页码数,ep:1,2,3,4,5
        $.each(result.pageInfo.navigatepageNums, function (index, item) {
            var numLi = $("<li></li>").append($("<a></a>").append(item));
            //如果当前页码等于正在显示数据的页面，就激活图标颜色
            if (result.pageInfo.pageNum == item) {
                numLi.addClass("active");
            }
            numLi.click(function () {
                to_page(item);
            });
            ul.append(numLi);
        });
        //添加下一页和尾页在分页条中
        ul.append(nextPageLi).append(lastPageLi);
        var navEle = $("<nav></nav>").append(ul);
        navEle.appendTo("#page_nav_area");
    }
</script>
<script type="text/javascript">
    //点击新增按钮，弹出模态框
    $("#table_add").click(function () {
        //重置表单数据,但是span里的信息、input框颜色仍然有
        $("#myModal form")[0].reset();
        //清空span信息，重置input颜色
        show_validate_msg("#empName_add", null, null);
        show_validate_msg("#empEmail_add", null, null);
        //查出下拉框里的部门名字
        getDepts("#myModal select");
        $('#myModal').modal({
            //点击背景空白处不被关闭；
            backdrop: 'static',
            //触发键盘esc事件时不关闭。
            keyboard: false
        });
    });

    //校验员工添加的表单数据
    function validate_add_form() {
        //1.拿到想要的数据，校验.  前端校验用户名
        var empName = $("#empName_add").val();
        //6-16位 或者 2-5位中文
        var regName = /(^[a-z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})/;
        if (!regName.test(empName)) {
            show_validate_msg("#empName_add", "error", "需要输入6-16位字母和数字或者2-5位中文的组合");
            return false;
        } else {
            show_validate_msg("#empName_add", "success", "");
        }
        var email = $("#empEmail_add").val();
        //双斜杠，转义
        var regEmail = /^([a-z0-9_-]+)@([\da-z.-]+)\.([a-z.]{2,6})$/;
        if (!regEmail.test(email)) {
            show_validate_msg("#empEmail_add", "error", "邮箱格式不合法");
            return false;
        } else {
            show_validate_msg("#empEmail_add", "success", "");
        }
        return true;
    }

    //显示校验信息
    function show_validate_msg(ele, status, msg) {
        //每次点击都需要清空先前添加的元素
        $(ele).parent().removeClass("has-success has-error");
        $(ele).next("span").text();
        if (status == "success") {
            $(ele).parent().addClass("has-success");
            $(ele).next("span").text(msg);
        } else if (status == "error") {
            $(ele).parent().addClass("has-error");
            $(ele).next("span").text(msg);
        } else {
            $(ele).next("span").text(msg);
        }
    }

    //校验用户名是否可用，无重复
    $("#empName_add").change(function () {
        //获取员工用户名输入框的值, this表示当前#empName_add,这个含此id的对象html标签
        var empName = this.value;
        $.ajax({
            url: '/checkName',
            data: 'empName=' + empName,
            type: 'post',
            dataType: 'json',
            success: function (rs) {
                if (rs.code === 0) {
                    show_validate_msg("#empName_add", "success", rs.msg);
                    $("#model_save").attr("is_save", "success");
                } else {
                    show_validate_msg("#empName_add", "error", rs.msg);
                    $("#model_save").attr("is_save", "error");
                }
            }
        })
    });

    //监听表头新增里模态框的保存按钮
    $("#model_save").click(function () {
        //序列化表单数据，
        var data = $("#myModal form").serialize();
        //校验数据
        if (!validate_add_form()) {
            return false;
        }
        //检验是否有无错误信息，若有则不允许提交
        if ($(this).attr("is_save") == "error") {
            return false;
        }
        $.ajax({
            url: '/save',
            type: 'post',
            dataType: 'json',
            data: data,
            success: function (rs) {
                if (rs.code === 0) {
                    //关闭模态框，注意顺序
                    $('#myModal').modal('hide');
                    //返回到最后一页，显示添加的数据
                    to_page(totalRecord);
                } else {
                    console.log(rs);
                    if (rs.error.empName != undefined) {
                        console.log(rs.error.empName);
                        show_validate_msg("#empName_add", "error", rs.error.empName);
                    }
                    if (rs.error.email != undefined) {
                        show_validate_msg("#email_add", "error", rs.error.email);
                    }
                }
            }
        })
    });

    //查出所有的部门信息并显示在x下拉列表中
    function getDepts(ele) {
        //重置下拉框的值
        $(ele).empty();
        $.ajax({
            url: '/depts',
            type: 'get',
            dataType: 'json',
            success: function (rs) {
                if (rs.code === 0) {
                    //显示部门信息在下拉框
                    $.each(rs.depts, function () {
                        var optionEle = $("<option></option>").append(this.deptName).attr("value", this.deptId);
                        optionEle.appendTo(ele)
                    })
                }
            }
        })
    }
</script>
<script type="text/javascript">
    //员工修改的模态框
    //1.我们是按钮创建前就绑定click事件，所以绑定不上 或者直接在 c:forEach 遍历时就添加onclick();
    //在生成的动态标签 $.each()里不建议使用onclick函数,不像thymeleaf遍历时还可以传值，这个用item.名称，显示item未定义
    $(document).on("click", ".edit_btn", function () {
        //得到员工信息
        getEmp($(this).attr('edit-id'));
        //得到下拉框的部门信息
        getDepts("#updateModal select");
        $("#updateModal").modal({
            backdrop: 'static'
        })
    });
    //遍历时添加函数onclik=edit()
    // function edit() {
    //     var empId = $(".edit_btn").attr('edit-id');
    //     getEmp(empId);
    //     getDepts("#updateModal select");
    //     $("#updateModal").modal({
    //         backdrop: 'static'
    //     })
    // }

    function getEmp(empId) {
        //直接赋值在url中，取不到数据
        //var empId = $(".edit_btn").attr('edit-id');
        $.ajax({
            url: '/emp/' + empId,
            dataType: 'json',
            type: 'get',
            success: function (rs) {
                //清楚邮箱校验消息
                show_validate_msg("#email_update", null, null);
                if (rs.code === 0) {
                    var empData = rs.emp;
                    $("#empName_update").val(empData.empName);
                    $("#email_update").val(empData.email);
                    $("#updateModal input[name=gender]").val([empData.gender]);
                    $("#updateModal select").val([empData.deptId]);
                    $("#empId_update").val(empData.empId);
                }
            }
        })
    }

    $("#btn_update").click(function () {
        //序列化表单数据，
        var data = $("#updateModal form").serialize();
        $.ajax({
            url: '/update',
            type: 'post',
            dataType: 'json',
            data: data + "&_method=PUT",
            success: function (rs) {
                if (rs.code !== 0) {
                    console.log(rs);
                    if (rs.error.email != undefined) {
                        show_validate_msg("#email_update", "error", rs.error.email);
                    }
                } else {
                    //关闭模态框，注意顺序
                    $('#updateModal').modal('hide');
                    //返回到最后一页，显示添加的数据
                    to_page(totalRecord);
                }
            }
        })
    })
</script>
</html>
