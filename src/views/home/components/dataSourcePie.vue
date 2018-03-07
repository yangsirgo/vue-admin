<template>
    <div class="col" style="width:100%;height:100%;">
        <div id="map_chart"></div>
    </div>
</template>

<script type="text/ecmascript-6">
import echarts from 'echarts';
import $ from 'jquery';
import regionCode from '../map-data/GBT';

var mapChart = '';//地图
var mapOpt = '';//地图配置
var mapData = '';//地图数据
var ctx = 'src/views/home/components';
var regionArr = [];
var skinColor = "blue"
var timer = null;
/**
 * 格式化地图数据
 */
function formatMapData(areaCode) {
    var areaCodeArr = [areaCode.substr(0, 2), areaCode.substr(2, 2), areaCode.substr(4, 2)]
    var mapType = getMapType(areaCode);
    var mapDataBak = JSON.parse(JSON.stringify(mapData));
    var database = [];
    //全国地图
    if (mapType == 1) {
        mapDataBak.forEach(function (obj) {
            if (obj.areaCode) {
                obj.areaCode = obj.areaCode.substr(0, 2) + '0000';
                obj.name = getAreaInfo(obj.areaCode).name;
            }
        });
    }
    //省地图
    else if (mapType == 2) {
        var directCity = ['110000', '120000', '310000', '500000']//北京，天津，上海，重庆
        mapDataBak.forEach(function (obj) {
            if (obj.areaCode) {
                var areaCodeBak = obj.areaCode;
                if (directCity.indexOf(obj.areaCode.substr(0, 2) + '0000') < 0) {
                    obj.areaCode = obj.areaCode.substr(0, 4) + '00';
                }
                var area = getAreaInfo(obj.areaCode);
                if (area) {
                    obj.name = getAreaInfo(obj.areaCode).name;
                } else {
                    //有些地方没有市直接到县
                    obj.areaCode = areaCodeBak;
                    obj.name = getAreaInfo(obj.areaCode).name;
                }
            }
        });
        for (var i = mapDataBak.length - 1; i >= 0; i--) {
            if (mapDataBak[i].areaCode.substr(0, 2) != areaCode.substr(0, 2)) {
                mapDataBak.splice(i, 1);
            }
        }
    }
    //市地图
    else if (mapType == 3) {
        mapDataBak.forEach(function (obj) {
            if (obj.areaCode) {
                obj.name = getAreaInfo(obj.areaCode).name;
            }
        });
        for (var i = mapDataBak.length - 1; i >= 0; i--) {
            if (mapDataBak[i].areaCode.substr(0, 4) != areaCode.substr(0, 4)) {
                mapDataBak.splice(i, 1);
            }
        }
    }
    mapDataBak.forEach(function (obj) {
        var temp = database.filter(function (val) {
            return obj.areaCode == val.areaCode;
        });
        if (temp.length == 0) {
            database.push(obj);
        } else {
            $.each(database, function (index, val) {
                if (val.areaCode == obj.areaCode) {
                    val.value += obj.value;
                    val.availability += obj.availability;
                    val.spoofing += obj.spoofing;
                    val.invasion += obj.invasion;
                    val.videoQuality += obj.videoQuality;
                    val.natBorder += obj.natBorder;
                    val.violationExtLink += obj.violationExtLink;
                    val.shareNetwork += obj.shareNetwork;
                    val.timeAbnormal += obj.timeAbnormal;
                    return false;
                }
            })
        }
    });
    database.sort(function (a, b) {
        return a.value - b.value;
    });
    return database;
}

/**
 * 根据地区代码获取地区信息
 */
function getAreaInfo(areaCode) {
    return regionCode.filter(function (obj) {
        return obj.code == areaCode;
    })[0];
}

/**
 * 根据地区代码获取地图类型
 */
function getMapType(areaCode) {
    var areaCodeArr = [areaCode.substr(0, 2), areaCode.substr(2, 2), areaCode.substr(4, 2)];
    //全国地图
    if (areaCode == '000000') {
        return 1;
    }
    //省地图
    else if (areaCodeArr[0] !== '00' && areaCodeArr[1] == '00' && areaCodeArr[2] == '00') {
        return 2;
    }
    //市地图
    else if (areaCodeArr[0] !== '00' && areaCodeArr[1] != '00' && areaCodeArr[2] == '00') {
        return 3
    }
    else if (areaCodeArr[0] !== '00' && areaCodeArr[1] != '00' && areaCodeArr[2] != '00') {
        return 4
    }
}



/**
 * 设置地图的参数
 */
function setMapOpt(areaCode) {
    try {
        //异常数据加载全国地图
        var data = formatMapData(areaCode);
    } catch (e) {
        localStorage.removeItem('lastMap');
//        renderMap('000000');
        var data = formatMapData(areaCode);
    }

    data = data.filter(function (obj) {
        return obj.value > 0;
    });
    var maxValue = 0;
    var minValue = 0;
    data.forEach(function (obj) {
        maxValue = Math.max(maxValue, obj.value);
        minValue = Math.min(minValue, obj.value);
    });
    var convertData = function (data) {
        var res = [];
        $.each(data, function (i, iObj) {
            $.each(regionCode, function (j, jObj) {
                if (iObj.areaCode == jObj.code) {
                    res.push({
                        name: iObj.name,
                        value: jObj.location.concat(iObj.value)
                    });
                    return false;
                }
            });
        });
        return res;
    };
    mapOpt = {
        title: {
            text: (function () {
                if (areaCode == '000000') {
                    return '全国报警统计'
                } else {
                    try {
                        return getAreaInfo(areaCode).name + '报警统计';
                    } catch (e) {
                        return '报警统计'
                    }
                }
            })(),
            left: 0,
            top: 0,
            textStyle: {
                fontWeight: 'normal',
                fontSize: 16,
                color: skinColor == 'blue' ? '#666' : '#768499'
            },
        },
        tooltip: {
            trigger: 'item',
            formatter: function (params) {
                if (typeof (params.value)[2] == "undefined") {
                    return params.name + ' : ' + (params.value || 0);
                } else {
                    return params.name + ' : ' + (params.value[2] || 0);
                }
            }
        },
        geo: {
            show: true,
            map: 'map',
            label: {
                normal: {
                    show: false
                },
                emphasis: {
                    show: false,
                }
            },
            top: '10%',
            bottom: '50%',
            zoom: window.innerWidth / 1450,
            roam: true,
            itemStyle: {
                normal: {
                    areaColor: '#bfddf4',
                    borderColor: skinColor == 'blue' ? 'white' : '#273142',
                },
                emphasis: {
                    areaColor: '#40acff'
                }
            }
        },
        grid: {
            left: 0,
            right: '60%',
            top: '70%',
            bottom: 5
        },
        xAxis: {
            type: 'value',
            boundaryGap: [0, 0.01],
            axisLabel: {
                show: false,
            },
            splitLine: {
                show: false
            },
            axisTick: {
                show: false
            },
            axisLine: {
                show: false,
            }
        },
        yAxis: {
            type: 'category',
            data: data.map(function (obj, index) {
                return obj.name;
            }),
            axisLabel: {
                show: false,
            },
            axisTick: {
                show: false
            },
            axisLine: {
                show: false,
            },
        },
        visualMap: {
            show: false,
            min: minValue,
            max: maxValue,
            text: ['高', '低'], // 文本，默认为数值文本
            calculable: true,
            dimension: 0,
            right: 5,
            top: 'center',
            itemWidth: 12,
            seriesIndex: [0, 3],
            textStyle: {
                color: skinColor == 'blue' ? '#666' : '#768499'
            },
            inRange: {
                color: ['#8bc7f7','#415ac1']
            }
        },
        series: [
            {
                type: 'map',
                map: 'map',
                geoIndex: 0,
                aspectScale: 0.75, //长宽比
                showLegendSymbol: false, // 存在legend时显示
                label: {
                    normal: {
                        show: false
                    },
                    emphasis: {
                        show: false,
                        textStyle: {
                            color: '#fff'
                        }
                    }
                },
                roam: true,
                itemStyle: {
                    normal: {
                        areaColor: '#031525',
                        borderColor: '#3B5077',
                    },
                    emphasis: {
                        areaColor: '#17f9d7'
                    }
                },
                animation: false,
                data: data
            },
            {
                name: 'point',
                type: 'scatter',
                coordinateSystem: 'geo',
                symbol: 'pin',
                symbolSize: function (val) {
                    var maxSize = 60;
                    var minSize = 30;
                    return minSize + (maxSize - minSize) / (maxValue - minValue) * val[2];
                },
                label: {
                    normal: {
                        show: true,
                        textStyle: {
                            color: '#fff',
                            fontSize: 9,
                        },
                    }
                },
                itemStyle: {
                    normal: {
                        color: '#F09B22', //标志颜色
                    }
                },
                zlevel: 6,
                data: convertData(data),
            },
            {
                name: 'Top 5',
                type: 'effectScatter',
                coordinateSystem: 'geo',
                data: convertData(data).reverse(),
                symbolSize: 5,
                showEffectOn: 'render',
                rippleEffect: {
                    brushType: 'stroke'
                },
                hoverAnimation: true,
                label: {
                    normal: {
                        formatter: '{b}',
                        position: 'right',
                        show: false
                    }
                },
                itemStyle: {
                    normal: {
                        color: '#f0a93d',
                        shadowBlur: 10,
                        shadowColor: '#05C3F9'
                    }
                },
                zlevel: 1
            },
            {
                type: 'bar',
                label: {
                    normal: {
                        show: true,
                        position: 'right',
                        formatter: '{b} : {c}',
                        textStyle: {
                            color: skinColor == 'blue' ? '#666' : '#768499'
                        }
                    }
                },
                tooltip: {
                    confine: true,
                    formatter: function (param) {
                        var ds = data[param.dataIndex];
                        var html = '';
                        if (ds.value > 0) {
                            html += '报警总数：' + ds.value + '<br>'
                        }
                        if (ds.availability > 0) {
                            html += '离线：' + ds.availability + '<br>'
                        }
                        if (ds.invasion > 0) {
                            html += '入侵：' + ds.invasion + '<br>';
                        }
                        if (ds.spoofing > 0) {
                            html += '冒用：' + ds.spoofing + '<br>';
                        }
                        if (ds.videoQuality > 0) {
                            html += '图像质量：' + ds.videoQuality + '<br>';
                        }
                        if (ds.natBorder > 0) {
                            html += '网络边界：' + ds.natBorder + '<br>';
                        }
                        if (ds.violationExtLink > 0) {
                            html += '违规外联：' + ds.violationExtLink + '<br>';
                        }
                        if (ds.shareNetwork > 0) {
                            html += '共享网络：' + ds.shareNetwork + '<br>';
                        }
                        if (ds.timeAbnormal > 0) {
                            html += '时间异常：' + ds.timeAbnormal;
                        }
                        return html;
                    },
                },
                barMaxWidth: 10,
                data: data.map(function (obj) {
                    return obj.value;
                })
            }, {
                type: 'pie',
                radius: ['0', '20%'],
                center: ['80%', '85%'],
                tooltip: {
                    formatter: '{b}：{c}（{d}%）'
                },
                label: {
                    normal: {
                        textStyle: {
                            color: skinColor == 'blue' ? '#666' : '#768499'
                        }
                    }
                },
                labelLine: {
                    normal: {
                        lineStyle: {
                            color: '#bbb'
                        }
                    }
                },
                itemStyle: {
                    normal: {
                        borderColor: skinColor == 'blue' ? 'white' : '#162035',
                        borderWidth: 1
                    }
                },
                color: ['#3448A1', '#3E58C8', '#0086F1', '#73BCF7', '#CDE8FD', '#50E3C2', '#B8E986', '#87F3FC', '#7D26CD'],
                data: (function () {
                    let availability = 0;//离线
                    let invasion = 0;//入侵
                    let spoofing = 0;//冒用
                    let videoQuality = 0;//图像质量
                    let natBorder = 0;//网络边界
                    let violationExtLink = 0;//违规外联
                    let shareNetwork = 0;//共享网络
                    let timeAbnormal = 0;//时间异常
                    data.forEach(function (obj) {
                        availability += obj.availability;//离线
                        invasion += obj.invasion;//入侵
                        spoofing += obj.spoofing;//冒用
                        videoQuality += obj.videoQuality;//图像质量
                        natBorder += obj.natBorder;//网络边界
                        violationExtLink += obj.violationExtLink;//违规外联
                        shareNetwork += obj.shareNetwork;//共享网络
                        timeAbnormal += obj.timeAbnormal;//时间异常
                    });
                    var temp = [];
                    if (availability > 0) {
                        temp.push({
                            name: '离线',
                            value: availability,
                        });
                    }
                    if (invasion > 0) {
                        temp.push({
                            name: '入侵',
                            value: invasion,
                        });
                    }
                    if (spoofing > 0) {
                        temp.push({
                            name: '冒用',
                            value: spoofing,
                        });
                    }
                    if (videoQuality > 0) {
                        temp.push({
                            name: '图像质量',
                            value: videoQuality,
                        });
                    }
                    if (natBorder > 0) {
                        temp.push({
                            name: '网络边界',
                            value: natBorder,
                        });
                    }
                    if (violationExtLink > 0) {
                        temp.push({
                            name: '违规外联',
                            value: violationExtLink,
                        });
                    }
                    if (shareNetwork > 0) {
                        temp.push({
                            name: '共享网络',
                            value: shareNetwork,
                        });
                    }
                    if (timeAbnormal > 0) {
                        temp.push({
                            name: '时间异常',
                            value: timeAbnormal,
                        });
                    }
                    return temp;
                })(),
            }
        ]
    };
    if (mapOpt.series[3].data.length == 0) {
        $('#map_chart').addClass('map-chart-empty-bar');
    } else {
        $('#map_chart').removeClass('map-chart-empty-bar');
    }
    if (mapOpt.series[4].data.length == 0) {
        $('#map_chart').addClass('map-chart-empty-pie');
    }
    else if (mapOpt.series[4].data.length == 1) {
        mapOpt.series[4].itemStyle.normal.borderWidth = 0;
        $('#map_chart').removeClass('map-chart-empty-pie');
    } else {
        mapOpt.series[4].itemStyle.normal.borderWidth = 1;
        $('#map_chart').removeClass('map-chart-empty-pie');
    }
    mapChart.setOption(mapOpt);
}

/**
 * 根据地区名获取地区代码
 */
function getRegionCode(region) {
    regionArr = region.split('-');
    var city = regionCode.filter(function (obj) {
        return obj.name == regionArr[1]
    });
    var area = regionCode.filter(function (obj) {
        return obj.name == regionArr[2]
    });
    var flag = false;
    for (var i = 0; i < city.length; i++) {
        for (var j = 0; j < area.length; j++) {
            if (city[i].name == regionArr[1] && area[j].name == regionArr[2]) {
                return area[j].code;
            }
        }
    }
}

/**
 * 获取地图数据
 */
function getMapData() {
    var url = 'https://easy-mock.com/mock/5a8e6342576015250b2733f1/sd/getMapAlarmCntReport';
    $.ajax({
        type: "GET",
        url: url,
        data: "",
        dataType: "json",
        success:function (msg) {
            if (msg.resultCode == 1) {
                msg.data.forEach(function (obj) {
                    obj.areaCode = getRegionCode(obj.area);
                    obj.value = obj.invasion + obj.availability + obj.spoofing + obj.videoQuality + obj.natBorder + obj.violationExtLink + obj.shareNetwork + obj.timeAbnormal;
                    delete obj.area;
                });
                //没有找到地区代码的，不展示
                for (var i = msg.data.length - 1; i >= 0; i--) {
                    if (!msg.data[i].areaCode) {
                        msg.data.splice(i, 1);
                    }
                }
                //如果地图没有被实例化，实例化地图，并定时请求数据

                if (!mapChart) {
                    mapData = msg.data;
                    var i = 0;
                    renderMap(localStorage.lastMap || '000000')
                    clearInterval(timer);
                    timer = setInterval(function () {
                        getMapData();
                        i++;
                        console.log(i);
                        console.log(timer);
                    }, 8000);
                }
                //如果地图已经实例化，只更新数据
                else {
                    //数据发生变化才更新数据，防止闪烁
                    if (JSON.stringify(mapData) != JSON.stringify(msg.data)) {
                        mapData = msg.data;
                        setMapOpt(localStorage.lastMap || '000000');
                    }
                }
            }
        }
    });
}

/**
 * 渲染地图
 */
function renderMap(areaCode) {

//    var url = ctx + "/json/{0}.json".format(areaCode);
//    var url = ctx + "/json/"+areaCode+".json";
    var url = "https://easy-mock.com/mock/5a8e6342576015250b2733f1/sd/mapglobal";
    $.ajax({
        type: "GET",
        url: url,
        data: "",
        dataType: "json",
        success:function (geoJson) {
            $('#map_chart').replaceWith('<div id="map_chart"></div>');
            mapChart = echarts.init(document.getElementById('map_chart'));
            echarts.registerMap('map', geoJson);
            mapChart.hideLoading();
            localStorage.lastMap = areaCode;
            setMapOpt(areaCode);
            mapChart.on('click', function (e) {
                if (e.seriesType == 'map' || e.seriesType == 'scatter' || e.seriesType == 'effectScatter') {
                    var area = regionCode.filter(function (obj) {
                        return obj.name == e.name;
                    });
                    if (area.length > 0) {
                        if (getMapType(area[0].code) == 4) {
                            renderMap('000000');
                        } else if (areaCode == area[0].code) {
                            renderMap('000000');
                        }
                        else {
                            renderMap(area[0].code);
                        }
                    } else {
                        layer.msg('暂无地图数据！', { icon: 0 });
                        renderMap('000000');
                    }
                }
            });
        },
        error:function(e){
            mapChart.hideLoading();
            alert('暂无地图数据！');
        }
    })
}




export default {
    name: 'dataSourcePie',
    data () {
        return {
            //
        };
    },
    mounted () {
        this.$nextTick(() => {
            getMapData();
            window.addEventListener('resize', function () {
                mapChart&&mapChart.resize();
            });
        });
    },
    beforeDestroy(){
        clearInterval(timer);
        mapChart = null;
    }
};
</script>
