<style scoped>
    .cell:nth-child(1) {
        height: calc(45% - 10px);
    }
    .cell {
        box-sizing: border-box;
        background: white;
        padding: 10px 0;
    }
</style>
<template>
    <div class="cell" style="width:100%;height:100%;">
        <!--<h4 class="cell-title">在线率统计</h4>-->
        <div class="online-chart-box">
            <div class="online-chart-title">
                <div class="online-chart-name">摄像头在线率</div>
                <div class="online-chart-value"><span class="value-text">97.95</span><span style="font-size:14px;">%</span></div>
            </div>
            <div id="online_camera_chart">
            </div>
        </div>
        <div class="online-chart-box">
            <div class="online-chart-title">
                <div class="online-chart-name">图像采集率</div>
                <div class="online-chart-value"><span class="value-text">0</span><span style="font-size:14px;">%</span></div>
            </div>
            <div id="image_capture_chart">
            </div>
        </div>
        <div class="online-chart-box">
            <div class="online-chart-title">
                <div class="online-chart-name">总在线率</div>
                <div class="online-chart-value"><span class="value-text">92.83</span><span style="font-size:14px;">%</span></div>
            </div>
            <div id="online_all_chart">
            </div>
        </div>
    </div>
</template>

<script  type="text/ecmascript-6">
    import $ from 'jquery';
    import echarts from 'echarts';

    var onlineCameraChart = '';//摄像头在线率
    var onlineCameraOpt = '';//摄像头在线率配置

    var imageCaptureChart = '';//图像采集率
    var imageCaptureOpt = '';//图像采集率配置

    var onlineAllChart = '';//总在线率
    var onlineAllOpt = '';//总在线率配置



    var ctx = 'src/views/home/components';



    //摄像头在线率配置
    onlineCameraOpt = {
        tooltip: {
            confine: true,
            trigger: 'axis',
            axisPointer: {
                type: 'shadow'
            },
            formatter: "{b}&nbsp;&nbsp;&nbsp;{c}%"
        },
        title: {
            text: '',
            right: 0,
            top: 0,
            textStyle: {
                fontWeight: 'normal',
                fontSize: 14,
                color: '#0186F3'
            },
        },
        grid: {
            left: 0,
            right: 0,
            bottom: 0,
            top: 20,
            containLabel: false
        },
        xAxis: {
            type: 'category',
            data: [],
            splitLine: {
                show: false,
            },
            axisTick: {
                show: false
            },
            axisLine: {
                show: false,
            },
            axisLabel: {
                show: false,
            }
        },
        yAxis: {
            type: 'value',
            splitLine: {
                show: false,
            },
            axisTick: {
                show: false
            },
            axisLine: {
                show: false,
            },
            axisLabel: {
                show: false,
            },
            interval: 50,
            max: 100,
            min: 0,
        },
        label: {
            normal: {
                show: false,
            }
        },
        itemStyle: {
            normal: {
                color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                    offset: 0,
                    color: '#0F6DE7'
                }, {
                    offset: 1,
                    color: '#67A6FF'
                }]),
                shadowColor: 'rgba(0, 0, 0, 0.1)',
                shadowBlur: 10
            }
        },
        series: [
            {
                name: '摄像头在线率',
                type: 'bar',
                barWidth: 6,
                data: []
            },

        ]
    };
    //图像采集率配置
    imageCaptureOpt = {
        tooltip: {
            confine: true,
            trigger: 'axis',
            axisPointer: {
                type: 'shadow'
            },
            formatter: "{b}&nbsp;&nbsp;&nbsp;{c}%"
        },
        title: {
            text: '',
            right: 0,
            top: 0,
            textStyle: {
                fontWeight: 'normal',
                fontSize: 14,
                color: '#0186F3'
            },
        },
        grid: {
            left: 0,
            right: 0,
            bottom: 0,
            top: 20,
            containLabel: false
        },
        xAxis: {
            type: 'category',
            data: [],
            splitLine: {
                show: false,
            },
            axisTick: {
                show: false
            },
            axisLine: {
                show: false,
            },
            axisLabel: {
                show: false,
            }
        },
        yAxis: {
            type: 'value',
            splitLine: {
                show: false,
            },
            axisTick: {
                show: false
            },
            axisLine: {
                show: false,
            },
            axisLabel: {
                show: false,
            },
            interval: 50,
            max: 100,
            min: 0,
        },
        label: {
            normal: {
                show: false,
            }
        },
        itemStyle: {
            normal: {
                color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                    offset: 0,
                    color: '#0F6DE7'
                }, {
                    offset: 1,
                    color: '#67A6FF'
                }]),
                shadowColor: 'rgba(0, 0, 0, 0.1)',
                shadowBlur: 10
            }
        },
        series: [
            {
                name: '图像采集率',
                type: 'bar',
                barWidth: 6,
                data: []
            },
        ]
    };
    //总在线率配置
    onlineAllOpt = {
        tooltip: {
            confine: true,
            trigger: 'axis',
            axisPointer: {
                type: 'shadow'
            },
            formatter: "{b}&nbsp;&nbsp;&nbsp;{c}%"
        },
        title: {
            text: '',
            right: 0,
            top: 0,
            textStyle: {
                fontWeight: 'normal',
                fontSize: 14,
                color: '#0186F3'
            },
        },
        grid: {
            left: 0,
            right: 0,
            bottom: 0,
            top: 20,
            containLabel: false
        },
        xAxis: {
            type: 'category',
            data: [],
            splitLine: {
                show: false,
            },
            axisTick: {
                show: false
            },
            axisLine: {
                show: false,
            },
            axisLabel: {
                show: false,
            }
        },
        yAxis: {
            type: 'value',
            splitLine: {
                show: false,
            },
            axisTick: {
                show: false
            },
            axisLine: {
                show: false,
            },
            axisLabel: {
                show: false,
            },
            interval: 50,
            max: 100,
            min: 0,
        },
        label: {
            normal: {
                show: false,
            }
        },
        itemStyle: {
            normal: {
                color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                    offset: 0,
                    color: '#0F6DE7'
                }, {
                    offset: 1,
                    color: '#67A6FF'
                }]),
                shadowColor: 'rgba(0, 0, 0, 0.1)',
                shadowBlur: 10
            }
        },
        series: [
            {
                name: '总在线率',
                type: 'bar',
                barWidth: 6,
                data: []
            },
        ]
    };

    /**
     * 获取摄像头在线率等信息
     */
    function getUsabilityTypeReport() {
        var url = ctx + '/report/homePage/getUsabilityTypeReport'
        //摄像头在线率
//        $.ajax(url, { deviceType: 'CAMERA', department: 1 }, function (msg) {
//            msg = {"data":{"total":92.83},"resultCode":"1"};
//            if (msg.resultCode == 1) {
                $('#online_camera_chart').closest('.online-chart-box').find('.value-text').text(92.83);
//            }
//        });
        //总在线率
//        $.ajax(url, { deviceType: 'all', department: 1 }, function (msg) {
//            if (msg.resultCode == 1) {
                $('#online_all_chart').closest('.online-chart-box').find('.value-text').text(92.83);
//            }
//        });
        //图像采集率
//        $.ajax(ctx + '/report/online/getHomePageImageRealTimeCencus', '', function (msg) {
            $('#image_capture_chart').closest('.online-chart-box').find('.value-text').text(92.83);
//        });
    }

    /**
     * 获取在线率信息
     */
    function getOnlineData() {
        onlineCameraChart = echarts.init(document.getElementById('online_camera_chart'));
        imageCaptureChart = echarts.init(document.getElementById('image_capture_chart'));
        onlineAllChart = echarts.init(document.getElementById('online_all_chart'));
        //报像头在线率
        $.ajax({
            type: "GET",
            url: 'https://easy-mock.com/mock/5a8e6342576015250b2733f1/sd/example',
            data: { deviceType: 'CAMERA', department: 1 },
            dataType: "json",
            success: function (msg) {
                msg.forEach(function (obj) {
                    obj.statisticsTime = obj.statisticsTime.split(' ')[1];
                });
                if (msg.length > 12) {//大于12只取前12个
                    msg.splice(0, msg.length - 12);
                } else if (msg.length < 12) {//如果数据不到12个，填充到12个
                    var hour = 0;
                    if (msg.length > 0) {
                        hour = Number(msg[0].statisticsTime);
                    } else {
                        hour = (new Date()).getHours();
                    }
                    while (msg.length < 12) {
                        hour--
                        if (hour == -1) {
                            hour = 23;
                        }
                        msg.unshift(
                                {
                                    "statisticsTime": hour < 10 ? ('0' + hour) : hour,
                                    "online": "0%",
                                    "deviceTypeName": "摄像头",
                                    "deviceType": "摄像头",
                                    "sumTotal": "0",
                                    "sumOnline": "0"
                                }
                        )
                    }
                }
                while (msg.length < 12) {
                    msg.unshift(
                            {
                                "statisticsTime": "0",
                                "online": "0",
                                "deviceTypeName": "摄像头",
                                "deviceType": "摄像头",
                                "sumTotal": "0",
                                "sumOnline": "0"
                            }
                    )
                }
                onlineCameraOpt.series[0].data = msg.map(function (obj) {
                    return obj.online.replace('%', '');
                });
                onlineCameraOpt.xAxis.data = msg.map(function (obj) {
                    return obj.statisticsTime + ':00'
                });
                onlineCameraOpt.title.text = '';

                if (msg.length >= 2) {
                    var lastValue = Number(msg[msg.length - 1].online.replace('%', ''));
                    var lastPreValue = Number(msg[msg.length - 2].online.replace('%', ''));
                    if (lastValue >= lastPreValue) {
                        onlineCameraOpt.title.text = '+' + (Math.round(100 * (lastValue - lastPreValue)) / 100) + '%';
                        onlineCameraOpt.title.textStyle.color = '#0186F3';
                    } else {
                        onlineCameraOpt.title.text = (Math.round(100 * (lastValue - lastPreValue)) / 100) + '%';
                        onlineCameraOpt.title.textStyle.color = '#F0A33E';
                    }
                } else if (msg.length == 0) {
                    $('#online_camera_chart').addClass('online-empty');
                }
                onlineCameraChart.setOption(onlineCameraOpt);
            }
        }),
        //总在线率信息
        $.ajax({
            type: "GET",
            url: 'https://easy-mock.com/mock/5a8e6342576015250b2733f1/sd/example#!method=get',
            data: { deviceType: 'all', department: 1 },
            dataType: "json",
            success:function (msg) {
                msg.forEach(function (obj) {
                    obj.statisticsTime = obj.statisticsTime.split(' ')[1];
                });
                if (msg.length > 12) {//大于12只取前12个
                    msg.splice(0, msg.length - 12);
                } else if (msg.length < 12) {//如果数据不到12个，填充到12个
                    var hour = 0;
                    if (msg.length > 0) {
                        hour = Number(msg[0].statisticsTime);
                    } else {
                        hour = (new Date()).getHours();
                    }
                    while (msg.length < 12) {
                        hour--
                        if (hour == -1) {
                            hour = 23;
                        }
                        msg.unshift(
                                {
                                    "statisticsTime": hour < 10 ? ('0' + hour) : hour,
                                    "online": "0%",
                                    "deviceTypeName": "所有类型",
                                    "deviceType": "所有类型",
                                    "sumTotal": "0",
                                    "sumOnline": "0"
                                }
                        )
                    }
                }
                while (msg.length < 12) {
                    msg.unshift(
                            {
                                "statisticsTime": "0",
                                "online": "0",
                                "deviceTypeName": "所有类型",
                                "deviceType": "所有类型",
                                "sumTotal": "0",
                                "sumOnline": "0"
                            }
                    )
                }
                onlineAllOpt.series[0].data = msg.map(function (obj) {
                    return obj.online.replace('%', '');
                });
                onlineAllOpt.xAxis.data = msg.map(function (obj) {
                    return obj.statisticsTime + ':00'
                });
                onlineAllOpt.title.text = '';
                if (msg.length >= 2) {
                    var lastValue = Number(msg[msg.length - 1].online.replace('%', ''));
                    var lastPreValue = Number(msg[msg.length - 2].online.replace('%', ''));
                    if (lastValue >= lastPreValue) {
                        onlineAllOpt.title.text = '+' + (Math.round(100 * (lastValue - lastPreValue)) / 100) + '%';
                        onlineAllOpt.title.textStyle.color = '#0186F3';
                    } else {
                        onlineAllOpt.title.text = (Math.round(100 * (lastValue - lastPreValue)) / 100) + '%';
                        onlineAllOpt.title.textStyle.color = '#F0A33E';
                    }
                } else if (msg.length == 0) {
                    $('#online_all_chart').addClass('online-empty');
                }
                onlineAllChart.setOption(onlineAllOpt);
            }
        })
        //图像采集率信息
        $.ajax({
            type: "GET",
            url: 'https://easy-mock.com/mock/5a8e6342576015250b2733f1/sd/getHomePageImageStaticsReport',
            data:'',
            dataType: "json",
            success:function (msg) {
                msg.forEach(function (obj) {
                    obj.date = (new Date(obj.date)).getHours();
                });
                if (msg.length > 12) {//大于12只取前12个
                    msg.splice(0, msg.length - 12);
                } else if (msg.length < 12) {//如果数据不到12个，填充到12个
                    var hour = 0;
                    if (msg.length > 0) {
                        hour = Number(msg[0].date);
                    } else {
                        hour = (new Date()).getHours();
                    }
                    while (msg.length < 12) {
                        hour--
                        if (hour == -1) {
                            hour = 23;
                        }
                        msg.unshift(
                                {
                                    "date": hour < 10 ? ('0' + hour) : hour,
                                    "allTotal": 0,
                                    "successTotal": 0,
                                    "failTotal": 0,
                                    "online": "0%",
                                    "department": "顶级部门"
                                }
                        )
                    }
                }
                imageCaptureOpt.xAxis.data = msg.map(function (obj) {
                    return obj.date + ':00'
                });
                imageCaptureOpt.series[0].data = msg.map(function (obj) {
                    return obj.online.replace('%', '');
                })
                imageCaptureOpt.title.text = '';
                if (msg.length >= 2) {
                    var lastValue = Number(msg[msg.length - 1].online.replace('%', ''));
                    var lastPreValue = Number(msg[msg.length - 2].online.replace('%', ''));
                    if (lastValue >= lastPreValue) {
                        imageCaptureOpt.title.text = '+' + (Math.round(100 * (lastValue - lastPreValue)) / 100) + '%';
                        imageCaptureOpt.title.textStyle.color = '#0186F3';
                    } else {
                        imageCaptureOpt.title.text = (Math.round(100 * (lastValue - lastPreValue)) / 100) + '%';
                        imageCaptureOpt.title.textStyle.color = '#F0A33E';
                    }
                } else if (msg.length == 0) {
                    $('#image_capture_chart').addClass('online-empty');
                }
                imageCaptureChart.setOption(imageCaptureOpt);
            }
        })
    }


export default {
    name: 'visiteVolume',
    data () {
        return {
            //
        };
    },
    mounted () {
        this.$nextTick(() => {
            getUsabilityTypeReport();
            getOnlineData();
            window.addEventListener('resize', function () {
                onlineCameraChart.resize();
                imageCaptureChart.resize();
                onlineAllChart.resize();
            });
        });
    }
};
</script>
