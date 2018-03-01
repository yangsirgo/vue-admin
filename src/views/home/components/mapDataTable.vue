<template>
    <div class="cell"  :style="styleObj">
        <div class="security-info">
            <div class="security-info-item">
                <div id="alarm_num" class="security-info-item-value" style="color:#F09B22">60508</div>
                <div class="security-info-item-title">报警数量</div>
            </div>
            <div class="security-info-item">
                <div id="access_num" class="security-info-item-value" style="color:#F09B22">1</div>
                <div class="security-info-item-title">隔离设备</div>
            </div>
            <div class="security-info-item">
                <div id="net_num" class="security-info-item-value">7</div>
                <div class="security-info-item-title">网络设备</div>
            </div>
            <div class="security-info-item">
                <div id="nat_num" class="security-info-item-value">1</div>
                <div class="security-info-item-title">NAT</div>
            </div>
        </div>
        <!--<Table :height="height" :columns="columns" :data="cityData"></Table>-->
        <table id="security_sum_table" cellspacing="0">
            <tbody><tr style="max-height:50px">
                <td width="28%" style="padding-left:20px;">名称</td>
                <td width="28%">端口占比</td>
                <td width="22%">隔离</td>
                <td width="22%">报警</td>
            </tr>

            <tr>
                <td class="text-ellipsis" style="padding-left:20px">
                    <a href="/tsa/network/topology/index?navId=10&amp;ip=10.10.16.15" title="10.10.16.15">华三</a>
                </td>
                <td>

                    <div class="progress-box"><div class="progress-value" style="width:57.14285714285714%"></div></div>
                    <div class="progress-text"><font color="#0E82E2">16</font>/28</div>

                </td>
                <td>1</td>
                <td>360</td>
            </tr>

            <tr>
                <td class="text-ellipsis" style="padding-left:20px">
                    <a href="/tsa/network/topology/index?navId=10&amp;ip=10.10.16.1" title="10.10.16.1">H3C</a>
                </td>
                <td>

                    <div class="progress-box"><div class="progress-value" style="width:60%"></div></div>
                    <div class="progress-text"><font color="#0E82E2">3</font>/5</div>

                </td>
                <td>0</td>
                <td>62</td>
            </tr>

            <tr>
                <td class="text-ellipsis" style="padding-left:20px">
                    <a href="/tsa/network/topology/index?navId=10&amp;ip=10.10.16.210" title="10.10.16.210">ruijie</a>
                </td>
                <td>

                    <div class="progress-box"><div class="progress-value" style="width:58.333333333333336%"></div></div>
                    <div class="progress-text"><font color="#0E82E2">14</font>/24</div>

                </td>
                <td>0</td>
                <td>33</td>
            </tr>

            <tr>
                <td class="text-ellipsis" style="padding-left:20px">
                    <a href="/tsa/network/topology/index?navId=10&amp;ip=10.10.16.14" title="10.10.16.14">H3C_S3600</a>
                </td>
                <td>

                    <div class="progress-box"><div class="progress-value" style="width:10.416666666666668%"></div></div>
                    <div class="progress-text"><font color="#0E82E2">5</font>/48</div>

                </td>
                <td>0</td>
                <td>24</td>
            </tr>

            <tr>
                <td class="text-ellipsis" style="padding-left:20px">
                    <a href="/tsa/network/topology/index?navId=10&amp;ip=10.10.16.250" title="10.10.16.250">H3C</a>
                </td>
                <td>

                    <div class="progress-box"><div class="progress-value" style="width:10.714285714285714%"></div></div>
                    <div class="progress-text"><font color="#0E82E2">3</font>/28</div>

                </td>
                <td>0</td>
                <td>7</td>
            </tr>
            </tbody></table>
    </div>
</template>

<script>
export default {
    name: 'mapDataTable',
    data () {
        return {
            columns: [
                {
                    title: '城市',
                    key: 'name'
                },
                {
                    title: '流量(k)',
                    key: 'value',
                    sortable: true
                }
            ]
        };
    },
    props: {
        cityData: Array,
        styleObj: Object,
        height: String
    }
};
</script>
