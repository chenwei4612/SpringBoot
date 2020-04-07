<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>仓库统计 柱形图</title>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<!-- 最新版本的 Bootstrap 核心 CSS 文件 引入样式-->
<script type="text/javascript"
	src="${APP_PATH }/static/js/jquery-1.12.4.min.js"></script>
<link
	href="${APP_PATH }/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="${APP_PATH }/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script src="${APP_PATH }/static/js/echarts.js"></script>
<script src="${APP_PATH }/static/js/echarts.min.js"></script>
<script src="${APP_PATH }/staticjs/cfgopts.js"></script>
</head>
<body>
<div>
	<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
    <div id="main" style="float:left;width: 600px;height:400px;"></div>
    <div id="main2" style="float:left;width: 400px;height:400px;"></div>
    <div id="main3" style="float:left;width: 400px;height:400px;"></div>
</div>
    <script type="text/javascript">
    var tt1=[];
	var tt2=[];
	var tt3=[];
	var tt4=[];
	var tt5=[];
        $(function() {
        	//alert("1111");
    		//去首页
    		StCount();
    		OrstCount();
    	});

    	function StCount() {
    		$.ajax({
    			url : "${APP_PATH}/StCount",
    			type : "GET",
    			success : function(result) {
    				console.log(result);
    				build_emps(result)
    			}
    		});
    	}
    	function build_emps(result) {
    		var emps = result.extend.sths;
    		console.log(emps);
    		console.log(emps.length);
	    	/*  $.each(emps,function(index, item) {
	    		 tt1[item]=item.deName;
	    		 tt2[item]=item.num;
	    		var deName = $(tt1).append(item.deName);
				var num = $(tt2).append(item.num);
	    	});  */
	    	 if(emps.length>0){
					for (var i = 0; i < emps.length; i++) {
						tt1[i]=emps[i].type;
						tt2[i]=emps[i].num;
						var obj = new Object();
						obj.name = emps[i].type;
						obj.value = emps[i].num;
						tt3[i] = obj;
					}
	    	 }
	    	//console.log(tt1);
	    	//console.log(tt2);
	    	// 使用刚指定的配置项和数据显示图表。
	    		MChart();
	    		MChart2();
    	}
    	function MChart(){
    		console.log(tt1);
	    	console.log(tt2);
        	// 基于准备好的dom，初始化echarts实例
            var myChart = echarts.init(document.getElementById('main'));

            // 指定图表的配置项和数据
            var option = {
                title: {
                    text: '各类型数量统计 柱形图'
                },
                tooltip: {},
                legend: {
                    data:['数量']
                },
                xAxis: {
                   // data: ["衬衫","羊毛衫","雪纺衫","裤子","高跟鞋","袜子"]
                	data: tt1
                },
                yAxis: {},
                series: [{
                    name: '数量',
                    type: 'bar',
                    //data: [5, 20, 36, 10, 10, 20]
                    data: tt2
                }]
            };
         // 使用刚指定的配置项和数据显示图表。
            myChart.setOption(option);
        }
    	function MChart2(){
    		// 基于准备好的dom，初始化echarts实例
    		var myChart = echarts.init(document.getElementById('main2'));
    		 
    		//饼状统计图
    		optiontow = {
    		    title : {
    		        text: '各类型比例',
    		        //subtext: '纯属虚构',
    		        x:'center'
    		    },
    		    tooltip : {
    		        trigger: 'item',
    		        formatter: "{a} <br/>{b} : {c} ({d}%)"
    		    },
    		    legend: {
    		        orient: 'vertical',
    		        left: 'left',
    		        data: ['大','中','小']
    		    },
    		    series : [
    		        {
    		            name: '数据来源',
    		            type: 'pie',
    		            radius : '55%',
    		            center: ['50%', '60%'],
    		            data:tt3,
    		            itemStyle: {
    		                emphasis: {
    		                    shadowBlur: 10,
    		                    shadowOffsetX: 0,
    		                    shadowColor: 'rgba(0, 0, 0, 0.5)'
    		                }
    		            }
    		        }
    		    ]
    		};
    		// 使用刚指定 optiontow 的配置项和数据显示图表。 optiontow是上面定义的样式 ，这个样式网站在下面
    		myChart.setOption(optiontow);
        }
    	function OrstCount() {
    		$.ajax({
    			url : "${APP_PATH}/OrstCount2",
    			type : "GET",
    			success : function(result) {
    				console.log(result);
    				build_emps2(result)
    			}
    		});
    	}
    	function build_emps2(result) {
    		var emps = result.extend.orsts;
    		console.log(emps);
    		console.log(emps.length);
	    	if(emps.length>0){
					for (var i = 0; i < emps.length; i++) {
						tt4[i]=emps[i].stId;
						tt5[i]=emps[i].num;
					}
	    	 } 
	    	// 使用刚指定的配置项和数据显示图表。
	    		MChart3();
    	}
    	function MChart3(){
    		console.log(tt4);
	    	console.log(tt5);
        	// 基于准备好的dom，初始化echarts实例
            var myChart = echarts.init(document.getElementById('main3'));

            // 指定图表的配置项和数据
            var option = {
                title: {
                    text: '库存统计 柱形图'
                },
                tooltip: {},
                legend: {
                    data:['数量'],
                	right:10,
                },
                xAxis: {
                   // data: ["衬衫","羊毛衫","雪纺衫","裤子","高跟鞋","袜子"]
                	data: tt4
                },
                yAxis: {},
                series: [{
                    name: '数量',
                    type: 'bar',
                    //data: [5, 20, 36, 10, 10, 20]
                    data: tt5
                }]
            };
         // 使用刚指定的配置项和数据显示图表。
            myChart.setOption(option);
        }
    </script>
</html>