////饼形图/////////////
function getPieOpt() {
    var pieOpt = {
        tooltip: {
            trigger: 'item',
            textStyle: {
                fontSize: 16
            },
            formatter: "{a} <br/>{b}: {c} ({d}%)"
        },
        title: {
            show: true,
            text: '',
            textStyle: { // 其余属性默认使用全局文本样式，详见TEXTSTYLE
                fontWeight: 'bolder',
                fontSize: 18,
                color: '#fff',
                shadowColor: '#fff', // 默认透明
                shadowBlur: 10
            },
            left: '1%',
            top: '5%'
        },
        legend: {
            show: true,
            orient: 'vertical',
            itemWidth: 10,
            itemHeight: 7,
            inactiveColor: '#787878',
            textStyle: {
                color: '#fff',
                fontSize: 15
            },
            x: '1%',
            y: '80%',
            data: []
        },
        toolbox: {
            show: true,
            feature: {
                dataView: {
                    show: true,
                    readOnly: true
                },
                restore: {
                    show: true
                }
            },
            iconStyle: {
                normal: {
                    borderColor: '#fff',
                }
            },
            right: '1%',
            top: '5%'
        },
        calculable: false,
        series: [{
            name: '性别统计',
            type: 'pie',
            radius: [0, '60%'],
            center: ['50%', '60%'],
            itemStyle: {
                normal: {
                    label: {
                        show: true,
                        formatter: '{b}: {c}',
                        textStyle: {
                            color: '#fff',
                            fontSize: 15
                        }
                    },
                    labelLine: {
                        show: true,
                        length: 2
                    }
                },
                emphasis: {
                    shadowBlur: 10,
                    shadowOffsetX: 0,
                    shadowColor: 'rgba(0, 0, 0, 0.5)'
                }
            },
            data: []
        }]
    };
    // 处理数据
    /*pieOpt.legend.data = [ 'A', 'B', 'C', 'D', 'E', 'F', 'G' ];
     pieOpt.series[0].data = [ {
     name : 'A',
     value : Math.round(Math.random() * 100)
     }, {
     name : 'B',
     value : Math.round(Math.random() * 100)
     }, {
     name : 'C',
     value : Math.round(Math.random() * 100)
     }, {
     name : 'D',
     value : Math.round(Math.random() * 100)
     }, {
     name : 'E',
     value : Math.round(Math.random() * 100)
     }, {
     name : 'F',
     value : Math.round(Math.random() * 100)
     }, {
     name : 'G',
     value : Math.round(Math.random() * 100)
     } ];*/
    return pieOpt;
}
// /////折线图//////////////
function getLineOpt() {
    lineOpt = {
        title: {
            show: true,
            text: '',
            textStyle: { // 其余属性默认使用全局文本样式，详见TEXTSTYLE
                fontWeight: 'bolder',
                fontSize: 18,
                color: '#fff',
                shadowColor: '#fff', // 默认透明
                shadowBlur: 10
            },
            left: '1%',
            top: '5%'
        },
        tooltip: {
            trigger: 'axis',
            axisPointer: { // 坐标轴指示器，坐标轴触发有效
                type: 'shadow' // 默认为直线，可选为：'line' | 'shadow'
            },
            textStyle: {
                fontSize: 16
            }
        },
        grid: {
            right: '8%',
            top: 68,
            bottom: 5,
            containLabel: true
        },
        toolbox: {
            show: true,
            feature: {
                // mark : {show: true},
                dataView: {
                    show: true,
                    readOnly: true
                },
                magicType: {
                    show: true,
                    type: ['line', 'bar']
                },
                restore: {
                    show: true
                }
                // saveAsImage : {show: true}
            },
            iconStyle: {
                normal: {
                    borderColor: '#fff',
                }
            },
            top: '5%',
            right: '1%'
        },
        xAxis: [{
            type: 'category',
            boundaryGap: false,
            data: [],
            axisLabel: {
                interval: 0,
                textStyle: {
                    color: "#fff", // 刻度颜色
                    fontSize: 15
                    // 刻度大小
                }
            },
            axisTick: {
                alignWithLabel: true
            }
        }],
        yAxis: [{
            type: 'value',
            minInterval: 1,
            nameGap: 12,
            nameTextStyle: {
                color: "#fff", // 刻度颜色
            },
            axisLabel: {
                textStyle: {
                    color: "#fff", // 刻度颜色
                    fontSize: 15
                    // 刻度大小
                }
            }
        }],
        series: []
    };
    // 数据处理
    return lineOpt;
}
// /////柱形图//////////
function getBarOpt() {
    var barOpt = {
        title: {
            show: true,
            text: '',
            textStyle: { // 其余属性默认使用全局文本样式，详见TEXTSTYLE
                fontWeight: 'bolder',
                fontSize: 18,
                color: '#fff',
                shadowColor: '#fff', // 默认透明
                shadowBlur: 10
            },
            left: '1%',
            top: '5%'
        },
        tooltip: {
            trigger: 'axis',
            formatter: '{a}<br/>{b} : {c}',
            axisPointer: { // 坐标轴指示器，坐标轴触发有效
                type: 'shadow' // 默认为直线，可选为：'line' | 'shadow'
            },
            textStyle: {
                fontSize: 16
            }
        },
        grid: {
            right: '8%',
            top: 68,
            bottom: 5,
            containLabel: true
        },
        toolbox: {
            show: true,
            feature: {
                // mark : {show: true},
                dataView: {
                    show: true,
                    readOnly: true
                },
                magicType: {
                    show: true,
                    type: ['line', 'bar']
                },
                restore: {
                    show: true
                }
                // saveAsImage : {show: true}
            },
            iconStyle: {
                normal: {
                    borderColor: '#fff',
                }
            },
            top: '5%',
            right: '1%'
        },
        xAxis: [{
            type: 'category',
            data: [],
            axisLabel: {
                interval: 0,
                textStyle: {
                    color: "#fff", // 刻度颜色
                    fontSize: 15
                    // 刻度大小
                }
            },
            axisTick: {
                alignWithLabel: true
            }
        }],
        yAxis: [{
            type: 'value',
            minInterval: 1,
            nameGap: 12,
            nameTextStyle: {
                color: "#fff", // 刻度颜色
            },
            axisLabel: {
                textStyle: {
                    color: "#fff", // 刻度颜色
                    fontSize: 15
                    // 刻度大小
                }
            }
        }],
        series: [{
            name: '',
            type: 'bar',
            data: []
        }]
    };
    // 数据处理
    return barOpt;
}
// ///////贵州地图///////////////
function getGzMapOpt(data) {
    var gzMapOpt = {
        title: {
            show: true,
            text: '',
            textStyle: { // 其余属性默认使用全局文本样式，详见TEXTSTYLE
                fontWeight: 'bolder',
                fontSize: 20,
                color: '#fff',
                shadowColor: '#fff', // 默认透明
                shadowBlur: 10
            },
            left: '1%',
            top: '5%'
        },
        tooltip: {
            trigger: 'item',

            textStyle: {
                fontSize: 18
            }
        },
        toolbox: {
            show: true,
            feature: {
                dataView: {
                    show: true,
                    readOnly: true
                },
                restore: {
                    show: true
                }
            },
            iconStyle: {
                normal: {
                    borderColor: '#fff',
                }
            },
            right: '5%',
            top: '5%'
        },
        dataRange: {
            min: 0,
            max: 1000,
            color: ['red', 'yellow'],
            text: ['高', '低'], // 文本，默认为数值文本
            calculable: true,
            right: 2,
            top: '42%',
            textStyle: {
                color: '#ffffff',
                fontSize: 15
            }
        },
        series: [{
            name: '',
            type: 'map',
            mapType: 'guizhou',
            selectedMode: 'single',
            layoutCenter: ['45%', '50%'],
            layoutSize: '90%',
            itemStyle: {
                normal: {
                    label: {
                        show: true,
                        textStyle: {
                            fontSize: 15
                        },
                        formatter: function (v) {
                            var vn = v.name;
                            if (vn.match(/黔南/)) {
                                return '黔南';
                            } else if (vn.match(/黔东南/)) {
                                return '黔东南';
                            } else if (vn.match(/黔西南/)) {
                                return '黔西南';
                            }
                        }
                    }
                },
                emphasis: {
                    label: {
                        show: true
                    }
                }
            },
            data: []
        }]
    };
    // 处理数据
    gzMapOpt.series[0].data = data;
    var dats = gzMapOpt.series[0].data;
    var mdat = 100;
    for (var i = 0, len = dats.length; i < len; i++) {
        if (mdat < dats[i].value) {
            mdat = dats[i].value;
        }
    }
    gzMapOpt.dataRange.max = mdat;
    return gzMapOpt;
}
// /////雷达图//////////
function getRadarOpt(data) {
    var radarOpt = {
        title: {
            show: true,
            text: '',
            textStyle: { // 其余属性默认使用全局文本样式，详见TEXTSTYLE
                fontWeight: 'bolder',
                fontSize: 18,
                color: '#fff',
                shadowColor: '#fff', // 默认透明
                shadowBlur: 10
            },
            left: '1%',
            top: '5%'
        },
        tooltip: {
            trigger: 'item',
            textStyle: {
                fontSize: 16
            }
        },
        legend: {
            show: false,
            orient: 'vertical',
            itemWidth: 10,
            itemHeight: 7,
            inactiveColor: '#787878',
            textStyle: {
                color: '#fff',
                fontSize: 15
            },
            left: '1%',
            top: '60%',
            data: []
        },
        toolbox: {
            show: true,
            feature: {
                dataView: {
                    show: true,
                    readOnly: true
                },
                restore: {
                    show: true
                }
            },
            iconStyle: {
                normal: {
                    borderColor: '#fff',
                }
            },
            right: '1%',
            top: '5%'
        },
        radar: [{
            indicator: [],
            center: ['50%', '60%'],
            radius: '60%',
            axisLabel: {
                textStyle: {
                    color: "#fff", // 刻度颜色
                    fontSize: 15
                    // 刻度大小
                }
            },
        }],
        calculable: false,
        textStyle: {
            color: "#fff", // 刻度颜色
            fontSize: 15
        },
        series: [{
            name: '特别管控年龄统计',
            type: 'radar',
            itemStyle: {
                normal: {
                    areaStyle: {
                        type: 'default'
                    },
                },
                textStyle: {
                    color: "#fff", // 刻度颜色
                    fontSize: 15
                }
            },
            data: []
        }]
    };
    // 数据处理
    radarOpt.legend.data = data.category;
    radarOpt.radar[0].indicator = data.indicator;
    radarOpt.series[0].data = data.serData;
    return radarOpt;
}
// /////////////////////////////
// ///////加载地图的GeoJson数据///////////
// ////////初始化地图mapChart/////
function initMapGeoJson(jsonUrl, mType, mId) {
    var mapChart;
    $.ajax({
        type: "GET",
        url: jsonUrl,
        dataType: 'json',
        async: false,
        success: function (mJson) {
            echarts.registerMap(mType, mJson);
            mapChart = echarts.init(document.getElementById(mId));
        }
    });
    return mapChart;
}
////////////////////////////////////////
///////数据格式//////////////////
var fmt = {
    /**
     * 格式化data，data格式如:[{name:nameValue,value:valueVal},...]
     *
     * @param data
     * @returns {object}
     */
    formtBarData: function (data) {
        var xAxData = [];
        var serData = [];

        for (var i = 0; i < data.length; i++) {
            xAxData.push(data[i].name || "");
            serData.push({
                name: data[i].name,
                value: data[i].value || 0
            });
        }

        return {
            xAxData: xAxData,
            serData: serData
        };
    },
    /**
     * 格式化data，data格式如:[{name:nameValue,value:valueVal},...]
     *
     * @param data
     * @returns {object}
     */
    formtPieData: function (data) {
        var legData = [];
        var serData = [];

        for (var i = 0; i < data.length; i++) {
            legData.push(data[i].name || "");
            serData.push({
                name: data[i].name,
                value: data[i].value || 0
            });
        }

        return {
            legData: legData,
            serData: serData
        };
    },
    /**
     * 格式化data，data格式如:[{group:groupVal,name:nameValue,value:valueVal,...]
	 *
     * @param data
     * @returns {object}
     */
    formtLineData: function (data) {
        var xAxis = [];
        var group = [];
        var series = [];
        var type = 'line';

        for (var i = 0; i < data.length; i++) {
            for (var j = 0; j < xAxis.length && xAxis[j] != data[i].name; j++);
            if (j == xAxis.length) {
                xAxis.push(data[i].name);
            }
            for (var k = 0; k < group.length && group[k] != data[i].group; k++);
            if (k == group.length) {
                group.push(data[i].group);
            }
        }

        for (var i = 0; i < group.length; i++) {
            var tData = [];
            var valMap = {};

            for (var j = 0; j < data.length; j++) {
                if (group[i] == data[j].group) {
                    valMap[data[j].name] = data[j].value;
                }
            }

            for (var n = 0; n < xAxis.length; n++) {
                tData.push(valMap[xAxis[n]]);
            }

            var tSeries = {
                name: group[i],
                data: tData,
                type: type
            };

            series.push(tSeries);
        }

        return {
            category: group,
            xAxis: xAxis,
            series: series
        };
    },
    /**
     * 格式化雷达data，data格式如:[{group:groupVal,name:nameValue,value:valueVal},...]
     * @param data
     * @param type
     * @returns {Object}
     */
    formtRadarData: function (data) {
        var indicator = [];
        var group = [];
        var serDats = [];
        var mVal = 100;
        for (var i = 0, len = data.length; i < len; i++) {
            if (data[i].value > mVal) {
                mVal = data[i].value;
            }
        }
        for (var i = 0; i < data.length; i++) {
            for (var j = 0; j < indicator.length && indicator[j].text != data[i].name; j++);
            if (j == indicator.length) {
                indicator.push({
                    max: mVal + 10,
                    text: data[i].name
                });
            }
            for (var k = 0; k < group.length && group[k] != data[i].group; k++);
            if (k == group.length) {
                group.push(data[i].group);
            }
        }

        for (var i = 0; i < group.length; i++) {
            var tData = [];
            var valMap = {};

            for (var j = 0; j < data.length; j++) {
                if (group[i] == data[j].group) {
                    valMap[data[j].name] = data[j].value;
                }
            }

            for (var n = 0; n < indicator.length; n++) {
                tData.push(valMap[indicator[n].text]);
            }

            var tSeries = {
                name: group[i],
                value: tData
            };
            serDats.push(tSeries);
        }
        return {
            category: group,
            indicator: indicator,
            serData: serDats
        };
    }
};
