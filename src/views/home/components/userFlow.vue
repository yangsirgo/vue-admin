<style>

</style>
<template>
    <div>
        <div class="assets-chart-box">
            <div id="assets_chart"></div>
            <div id="brand_chart"></div>
        </div>
        <div class="assets-table-box">
            <table id="assets_sum_table" cellspacing="0">
                <tbody>
                <tr>
                    <td width="65%">
                        <span class="item-circle" style="background:#3E58C8"></span>
                        <span class="item-name" title="摄像头">摄像头</span>
                    </td>
                    <td width="35%" title="18565">18565</td>
                </tr>

                <tr>
                    <td width="65%">
                        <span class="item-circle" style="background:#0086F1"></span>
                        <span class="item-name" title="烽火设备">烽火设备</span>
                    </td>
                    <td width="35%" title="2075">2075</td>
                </tr>

                <tr>
                    <td width="65%">
                        <span class="item-circle" style="background:#73BCF7"></span>
                        <span class="item-name" title="PC">PC</span>
                    </td>
                    <td width="35%" title="1363">1363</td>
                </tr>

                <tr>
                    <td width="65%">
                        <span class="item-circle" style="background:#CDE8FD"></span>
                        <span class="item-name" title="其他">其他</span>
                    </td>
                    <td width="35%" title="10075">10075</td>
                </tr>
                </tbody>
            </table>
            <table id="brand_sum_table" cellspacing="0">
                <tbody>
                <tr>
                    <td width="65%">
                        <span class="item-circle" style="background:#3E58C8"></span>
                        <span class="item-name" title="海康威视">海康威视</span>
                    </td>
                    <td width="35%" title="13232">13232</td>
                </tr>

                <tr>
                    <td width="65%">
                        <span class="item-circle" style="background:#0086F1"></span>
                        <span class="item-name" title="大华">大华</span>
                    </td>
                    <td width="35%" title="3960">3960</td>
                </tr>

                <tr>
                    <td width="65%">
                        <span class="item-circle" style="background:#73BCF7"></span>
                        <span class="item-name" title="宇视">宇视</span>
                    </td>
                    <td width="35%" title="172">172</td>
                </tr>

                <tr>
                    <td width="65%">
                        <span class="item-circle" style="background:#CDE8FD"></span>
                        <span class="item-name" title="其他">其他</span>
                    </td>
                    <td width="35%" title="1201">1201</td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</template>

<script type="text/ecmascript-6">
import echarts from 'echarts';
import $ from 'jquery';

var assetsChart = '';//资产统计
var assetsOpt = '';//资产统计配置

var brandChart = '';//品牌统计
var brandOpt = '';//品牌统计配置
var ctx = 'src/views/home/components';


//品牌统计
brandOpt = {
    title: {
        text: '{a|17}{b|%}',
        left: 'center',
        top: 'middle',
        textStyle: {
            fontWeight: 'bold',
            fontSize: 20,
            verticalAlign: 'bottom',
            color: '#3349A2',
            rich: {
                a: {
                    fontWeight: 'bold',
                    fontSize: 20,
                    verticalAlign: 'bottom',
                },
                b: {
                    fontWeight: 'bold',
                    fontSize: 14,
                    verticalAlign: 'bottom',
                },
            }
        },
        // subtext: '总数',
        // subtextStyle: {
        //     fontWeight: 'normal',
        //     fontSize: 12,
        //     color:'#3349A2'
        // }
    },
    tooltip: {
        confine: true,
        formatter: function (param) {
            if (param.data.name) {
                return param.data.name + '：' + param.percent + '%'
            }
        }
    },
    xAxis: {
        type: 'value',
        show: false,
        axisTick: {
            show: false
        }
    },
    yAxis: {
        type: 'category',
        show: false,
        axisTick: {
            show: false
        }
    },
    series: [{
        type: 'pie',
        clockWise: false,
        selectedMode: 'single',
        radius: ['50%', '70%'],
        center: ['50%', '50%'],
        color: ['#3E58C8', '#0086F1', '#73BCF7', '#CDE8FD'],
        itemStyle: {
            normal: {
                label: {
                    show: false,
                },
                labelLine: {
                    show: false,

                },
                borderWidth: 2,
//                borderColor: skinColor == 'blue' ? 'white' : '#273142',
            }
        },
        data: []
    }]
}

//资产统计
assetsOpt = {
    title: {
        text: '0',
        left: 'center',
        top: 'middle',
        textStyle: {
            fontWeight: 'bold',
            fontSize: 20,
            verticalAlign: 'bottom',
            color: '#3349A2',
            rich: {
                a: {
                    fontWeight: 'bold',
                    fontSize: 20,
                    verticalAlign: 'bottom',
                },
                b: {
                    fontWeight: 'bold',
                    fontSize: 14,
                    verticalAlign: 'bottom',
                },
            }
        },
        // subtext: '总数',
        // subtextStyle: {
        //     fontWeight: 'normal',
        //     fontSize: 12,
        //     color: '#3349A2'
        // }
    },
    tooltip: {
        confine: true,
        formatter: function (param) {
            if (param.data.name) {
                return param.data.name + '：' + param.percent + '%'
            }
        }
    },
    xAxis: {
        type: 'value',
        show: false,
        axisTick: {
            show: false
        }
    },
    yAxis: {
        type: 'category',
        show: false,
        axisTick: {
            show: false
        }
    },
    series: [{
        type: 'pie',
        clockWise: false,
        selectedMode: 'single',
        radius: ['50%', '70%'],
        center: ['50%', '50%'],
        color: ['#3E58C8', '#0086F1', '#73BCF7', '#CDE8FD'],
        itemStyle: {
            normal: {
                label: {
                    show: false,
                },
                labelLine: {
                    show: false,

                },
                borderWidth: 2,
//                borderColor: skinColor == 'blue' ? 'white' : '#273142',
            },
        },
        data: []
    }]
};


/**
 * 获取品牌统计数据
 */
function getBrandData() {
    brandChart = echarts.init(document.getElementById('brand_chart'));
    var url = ctx + '/json/getDeviceCntVendorReport.json';
    $.ajax({
        type: "GET",
        url: url,
        data: {department: 1},
        dataType: "json",
        success: function (msg) {
            if (msg.resultCode == 1) {
                msg.data = msg.data.filter(function (obj) {
                    return obj.cnt > 0;
                });
                //排序
                msg.data.sort(function (a, b) {
                    if (a.dict_name == '其他') {
                        return 1;
                    } else {
                        return b.cnt - a.cnt;
                    }
                });
                var data = [];
                var temp = {
                    name: '其他',
                    value: 0,
                    color: brandOpt.series[0].color[3]
                };
                var total = 0;
                if (msg.data.length <= 4) {
                    msg.data.forEach(function (obj, index) {
                        total += obj.cnt;
                        data.push({
                            name: obj.dict_name,
                            value: obj.cnt,
                            color: brandOpt.series[0].color[index]
                        });
                    });
                } else {
                    msg.data.forEach(function (obj, index) {
                        total += obj.cnt;
                        if (index < 3) {
                            data.push({
                                name: obj.dict_name,
                                value: obj.cnt,
                                color: brandOpt.series[0].color[index]
                            });
                        } else {
                            temp.value += obj.cnt;
                        }
                    });
                    data.push(temp);
                }
                data.forEach(function (obj) {
                    obj.percent = (Math.round(10000 * obj.value / (total || 1)) / 100) + '%';
                });
                brandOpt.title.text = total;
                brandOpt.series[0].data = data;
//                $('#brand_sum_table tbody').html(template('temp_assets_sum', data));
                if (data.length == 0) {
                    brandOpt.title.text = '';
                    $('#brand_chart').addClass('assets-chart-empty');
                }
                else if (data.length == 1) {
                    brandOpt.series[0].itemStyle.normal.borderWidth = 0;
                    $('#brand_chart').removeClass('assets-chart-empty');
                } else {
                    brandOpt.series[0].itemStyle.normal.borderWidth = 2;
                    $('#brand_chart').removeClass('assets-chart-empty');
                }
                brandChart.setOption(brandOpt);
                brandChart.on('pieselectchanged', function (e, x) {
                    var selectData = '';
                    brandOpt.series[0].data.forEach(function (obj) {
                        obj.selected = false;
                    });
                    for (var key in e.selected) {
                        if (e.selected[key]) {
                            for (var i = 0; i < brandOpt.series[0].data.length; i++) {
                                if (brandOpt.series[0].data[i].name == key) {
                                    selectData = brandOpt.series[0].data[i];
                                    break;
                                }
                            }
                            break;
                        }
                    }
                    if (selectData) {
                        brandOpt.title.text = '{a|' + Math.round(10000 * selectData.value / (total || 1)) / 100 + '}{b|%}';
                        //brandOpt.title.subtext = selectData.name;
                        selectData.selected = true;
                    } else {
                        brandOpt.title.text = total;
                        //brandOpt.title.subtext = '总数';
                    }
                    brandChart.setOption(brandOpt);
                    $('#brand_sum_table .item-name').css({
                        fontSize: '14px',
//                    color: skinColor == 'blue' ? 'black' : '#768499'
                    });
                    $('#brand_sum_table tbody tr').each(function (index, obj) {
                        if ($(obj).find('.item-name').text().trim() == selectData.name) {
                            $(obj).find('.item-name').css({
                                fontSize: '16px',
                                color: '#3AB3F1'
                            });
                        }
                    });
                });
            }
        }
    });
}

/**
 * 获取资产统计数据
 */
function getAssetsData() {
    assetsChart = echarts.init(document.getElementById('assets_chart'));
    var url = ctx + '/json/getDeviceCntTypeReport.json'
    $.ajax({
        type: "GET",
        url: url,
        data: { department: 1 },
        dataType: "json",
        success:function (msg) {
            let temp = {};
            if (msg.resultCode == 1) {
                msg.data = msg.data.filter(function (obj) {
                    return obj.cnt > 0;
                });
                //排序
                msg.data.sort(function (a, b) {
                    if (a.dict_name == '其他') {
                        return 1;
                    } else {
                        return b.cnt - a.cnt;
                    }
                });
                var data = [];
                temp = {
                    name: '其他',
                    value: 0,
                    color: assetsOpt.series[0].color[3]
                };
                var total = 0;
                if (msg.data.length <= 4) {
                    msg.data.forEach(function (obj, index) {
                        total += obj.cnt;
                        data.push({
                            name: obj.dict_name,
                            value: obj.cnt,
                            color: assetsOpt.series[0].color[index]
                        });
                    });
                } else {
                    msg.data.forEach(function (obj, index) {
                        total += obj.cnt;
                        if (index < 3) {
                            data.push({
                                name: obj.dict_name,
                                value: obj.cnt,
                                color: assetsOpt.series[0].color[index]
                            });
                        } else {
                            temp.value += obj.cnt;
                        }
                    });
                    data.push(temp);
                }
                data.forEach(function (obj) {
                    obj.percent = (Math.round(10000 * obj.value / (total || 1)) / 100) + '%';
                });
                assetsOpt.title.text = total;
                assetsOpt.series[0].data = data;
//                $('#assets_sum_table tbody').html(template('temp_assets_sum', data));
                if (data.length == 0) {
                    assetsOpt.title.text = '';
                    $('#assets_chart').addClass('assets-chart-empty');
                }
                else if (data.length == 1) {
                    assetsOpt.series[0].itemStyle.normal.borderWidth = 0;
                    $('#assets_chart').removeClass('assets-chart-empty');
                } else {
                    assetsOpt.series[0].itemStyle.normal.borderWidth = 2;
                    $('#assets_chart').removeClass('assets-chart-empty');
                }
                assetsChart.setOption(assetsOpt);
                assetsChart.on('pieselectchanged', function (e, x) {
                    var selectData = '';
                    assetsOpt.series[0].data.forEach(function (obj) {
                        obj.selected = false;
                    });
                    for (var key in e.selected) {
                        if (e.selected[key]) {
                            for (var i = 0; i < assetsOpt.series[0].data.length; i++) {
                                if (assetsOpt.series[0].data[i].name == key) {
                                    selectData = assetsOpt.series[0].data[i];
                                    break;
                                }
                            }
                            break;
                        }
                    }
                    if (selectData) {
                        assetsOpt.title.text = '{a|' + Math.round(10000 * selectData.value / (total || 1)) / 100 + '}{b|%}';
                        //assetsOpt.title.subtext = selectData.name;
                        selectData.selected = true;
                    } else {
                        assetsOpt.title.text = total;
                        //assetsOpt.title.subtext = '总数';
                    }
                    assetsChart.setOption(assetsOpt);
                    $('#assets_sum_table .item-name').css({
                        fontSize: '14px',
//                        color: skinColor == 'blue' ? 'black' : '#768499'
                    });
                    $('#assets_sum_table tbody tr').each(function (index, obj) {
                        if ($(obj).find('.item-name').text().trim() == selectData.name) {
                            $(obj).find('.item-name').css({
                                fontSize: '16px',
                                color: '#3AB3F1'
                            });
                        }
                    });
                });
            }
        }
    })
}




export default {
    name: 'userFlow',
    mounted () {
        this.$nextTick(() => {
            getAssetsData();
            getBrandData();
            window.addEventListener('resize', function () {
                brandChart.resize();
                assetsChart.resize();
            });
        })

    }
};
</script>
