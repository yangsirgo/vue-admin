<style scoped>
    .button-span{
        float: right;
    }
    ul.ivu-page{
        display: inline-flex;
    }
    span.span-page{
        float: left;
        display: inline-flex;
        padding-top: 5px;
    }
    div.ivu-checkbox-group{
        margin-left: 18px;
        margin-top: -10px;
    }
    div.ivu-table-wrapper{
        margin-top: 5px;
    }
</style>
<template>
    <div>
        <!--<Card>-->
            <!--<p slot="title">-->
                <!--<Icon type="information-circled"></Icon>-->
                <!--报警管理-->
            <!--</p>-->
            <Select v-model="model2" style="width:100px">
                <Option v-for="item in cityList" :value="item.value" :key="item.value">{{ item.label }}</Option>
            </Select>
            <Input v-model="searchConName1" icon="search" @on-change="handleSearch1" placeholder="IP/内容..."
                   style="width: 200px"/>

            <Select v-model="allType" style="width:100px">
                <Option v-for="item in typeList" :value="item.value" :key="item.value">{{ item.label }}</Option>
            </Select>
            <Select v-model="allState" style="width:100px">
                <Option v-for="item in stateList" :value="item.value" :key="item.value">{{ item.label }}</Option>
            </Select>
        <Select v-model="allState" style="width:100px">
            <Option v-for="item in stateList" :value="item.value" :key="item.value">{{ item.label }}</Option>
        </Select>
            <span class="button-span">
                <Button type="ghost"  @click="confirm"><Icon type="android-checkbox-outline"></Icon>全部确认</Button>
                <a id="hrefToExportTable" style="postion: absolute;left: -10px;top: -10px;width: 0px;height: 0px;"></a>
                <Button type="ghost"  @click="exportExcel"><Icon type="ios-download-outline"></Icon>导出</Button>

                    <Dropdown  trigger="custom" :visible="visible" placement="bottom-end">
                        <Button  type="ghost" icon="gear-b" @click="handleOpen"></Button>
                        <DropdownMenu slot="list">
                            <Checkbox-group v-model="tableColumnsChecked" @on-change="changeTableColumns">
                                <Checkbox label="select1" style="display: none">多选框</Checkbox>
                                <br/>
                                <Checkbox label="name2">报警IP</Checkbox>
                                <br/>
                                <Checkbox label="status3">类型</Checkbox>
                                <br/>
                                <Checkbox label="portrayal4">级别</Checkbox>
                                <br/>
                                <Checkbox label="people5">MAC</Checkbox>
                                <br/>
                                <Checkbox label="time6">内容</Checkbox>
                                <br/>
                                <Checkbox label="update7">时间</Checkbox>
                                <br/>
                                <Checkbox label="ruwang_sta8">入网状态</Checkbox>
                                <br/>
                                <Checkbox label="update19">操作</Checkbox>
                            </Checkbox-group>
                            <div style="text-align: right;margin:10px;">
                                <Button type="primary"  size="small" @click="handleClose">关闭</Button>
                            </div>
                        </DropdownMenu>
                    </Dropdown>
            </span>
            <Table :data="tableData1" :columns="tableColumns1" stripe ref="tableExcel" ></Table>
            <div style="margin: 10px;overflow: hidden">
                <span class="span-page">
                    当前1 - {{pageNum}}条 , 共{{pageTotal}}条
                </span>
                <div style="float: right;">
                    <Select v-model="pageNum" style="width:60px" @on-change="changePage">
                        <Option v-for="item in pageNumList" :value="item.value" :key="item.value">{{ item.label }}条</Option>
                    </Select>
                    <Page :total="pageTotal" :current="1" @on-change="changePage" :pageSize="pageNum"></Page>
                </div>
            </div>
        <!--</Card>-->
    </div>
</template>
<script type="text/ecmascript-6">
    import {table2excelData, excelColumns} from '@/views/tables/data/table2excel.js';
    import table2excel from '@/libs/table2excel.js';

    export default {
        data () {
            return {
                tableColumnsChecked: ['select1','name2', 'status3', 'portrayal4', 'people5', 'time6', 'update7', 'ruwang_sta8', 'update19'],
                visible: false,
                searchConName1:'',
                cityList: [
                    {
                        value: '1',
                        label: '未确认'
                    },
                    {
                        value: '2',
                        label: '已确认'
                    }
                ],
                model2: '1',
                typeList: [
                    {
                        value: '0',
                        label: '所有类型'
                    },
                    {
                        value: '1',
                        label: '离线'
                    },
                    {
                        value: '2',
                        label: '冒用'
                    },
                    {
                        value: '3',
                        label: '入侵'
                    },
                    {
                        value: '4',
                        label: '图像质量'
                    },
                    {
                        value: '5',
                        label: '网络边界'
                    },
                    {
                        value: '6',
                        label: '共享网络'
                    }
                ],
                allType: '0',
                stateList: [
                    {
                        value: '0',
                        label: '所有级别'
                    },
                    {
                        value: '1',
                        label: '致命'
                    },
                    {
                        value: '2',
                        label: '严重'
                    },
                    {
                        value: '3',
                        label: '警告'
                    }
                ],
                allState: '0',
                pageNumList:[
                    {
                        value: 10,
                        label: 10
                    },
                    {
                        value: 15,
                        label: 15
                    },
                    {
                        value: 20,
                        label: 20
                    },
                ],
                pageNum:10,
                tableData1: this.mockTableData1(10),
                tableColumns1: []
            }
        },
        mounted () {
            this.changeTableColumns();
            var _t = this;
//            document.addEventListener("click",this.handleClose,false)
        },
        beforeDestroy(){
//            document.removeEventListener("click",this.handleClose)
        },
        methods: {
            getTable2Columns(){
                const table2ColumnList = {
                    select1:{
                        type: 'selection',
                        width: 60,
                        align: 'center'
                    },
                    name2:{
                        title: '报警IP',
                        sortable: true,
                        width:"200px",
                        align:"left",
                        key: 'name'

                    },
                    status3:{
                        title: '类型',
                        key: 'status',
                        render: (h, params) => {
                            const row = params.row;
                            const color = row.status === 1 ? '#ff9900' : row.status === 2 ? '#2d8cf0' : '#ed3f14';
                            const text = row.status === 1 ? '警告' : row.status === 2 ? '信息' : '致命';

                            return h('Tag', {
                                props: {
//                                    type: 'dot',
                                    color: color
                                }
                            }, text);
                        }
                    },
                    portrayal4:{
                        title: '级别',
                        key: 'portrayal',
                        render: (h, params) => {
                            return h('Poptip', {
                                props: {
                                    trigger: 'hover',
                                    title: params.row.portrayal.length + 'portrayals',
                                    placement: 'bottom'
                                }
                            }, [
                                h('Tag', params.row.portrayal.length),
                                h('div', {
                                    slot: 'content'
                                }, [
                                    h('ul', this.tableData1[params.index].portrayal.map(item => {
                                        return h('li', {
                                            style: {
                                                textAlign: 'center',
                                                padding: '4px'
                                            }
                                        }, item)
                                    }))
                                ])
                            ]);
                        }
                    },
                    people5:{
                        title: 'MAC',
                        key: 'people',
                        render: (h, params) => {
                            return h('Poptip', {
                                props: {
                                    trigger: 'hover',
                                    title: params.row.people.length + 'customers',
                                    placement: 'bottom'
                                }
                            }, [
                                h('Tag', params.row.people.length),
                                h('div', {
                                    slot: 'content'
                                }, [
                                    h('ul', this.tableData1[params.index].people.map(item => {
                                        return h('li', {
                                            style: {
                                                textAlign: 'center',
                                                padding: '4px'
                                            }
                                        }, item.n + '：' + item.c + 'People')
                                    }))
                                ])
                            ]);
                        }
                    },
                    time6:{
                        title: '内容',
                        key: 'time',
                        render: (h, params) => {
                            return h('div', 'Almost' + params.row.time + 'days');
                        }
                    },
                    update7:{
                        title: '时间',
                        key: 'update',
                        render: (h, params) => {
                            return h('div', this.formatDate(this.tableData1[params.index].update));
                        }
                    },
                    ruwang_sta8:{
                        title: '入网状态',
                        key: 'ruwang_sta',
                        render: (h, params) => {
                            const row = params.row;
                            const text = row.ruwang_sta === 1 ? '开启' : '隔离';
                            return h('i-switch', {
                                props: {
                                    size:"large",
                                    value: row.ruwang_sta == 1
                                },
                                on: {
                                    'on-change': (value) => {//触发事件是on-change,用双引号括起来，
                                    }
                                }
                            },[
                                h("span",{
                                    slot:"open"
                                },"开启"),
                                h("span",{
                                    slot:"close"
                                },"隔离"),
                            ]);
                        }
                    },
                    update19:{
                        title: '操作',
                        key: 'update',
                        align: 'center',
                        width: 250,
                        render: (h, params) => {
                            return h('div', [
                                h('Button', {
                                    props: {
                                        type: 'primary',
                                        size: 'small'
                                    },
                                    style: {
                                        marginRight: '5px'
                                    },
                                    on: {
                                        click: () => {
                                            this.show(params.index)
                                        }
                                    }
                                }, 'View'),
                                h('Button', {
                                    props: {
                                        type: 'error',
                                        size: 'small'
                                    },
                                    on: {
                                        click: () => {
                                            this.remove(params.index)
                                        }
                                    }
                                }, 'Delete')
                            ]);
                        }
                    }
                };
                let data = [];
                this.tableColumnsChecked.forEach(function(col){
                    data.push(table2ColumnList[col]);
                    });
                return data;
            },
            changeTableColumns () {
                function c(a,b){
                    a = a.slice(-1);
                    b = b.slice(-1);
                    if(a<b){
                        return -1;
                    }else if(a>b){
                        return 1;
                    }
                }
                this.tableColumnsChecked.sort(c);
                this.tableColumns1 = this.getTable2Columns();
            },
            handleOpen () {
                this.visible = true;
            },
            handleClose () {
                this.visible = false;
            },
            confirm () {
                this.$Modal.confirm({
                    title: '信息',
                    content: '<p>确定确认选中的报警？</p>',
                    onOk: () => {
                        this.$Message.info('Clicked ok');
                    },
                    onCancel: () => {
                        this.$Message.info('Clicked cancel');
                    }
                });
            },
            mockTableData1 (cur_pageNum) {
                let data = [];
                for (let i = 0; i < cur_pageNum; i++) {
                    data.push({
                        name: Math.floor(Math.random() * 100 + 1)+"."+Math.floor(Math.random() * 100 + 1)+"."+Math.floor(Math.random() * 100 + 1)+"."+Math.floor(Math.random() * 100 + 1),
                        status: Math.floor(Math.random() * 3 + 1),
                        portrayal: ['City', 'People', 'Cost', 'Life', 'Entertainment'],
                        people: [
                            {
                                n: 'People' + Math.floor(Math.random() * 100 + 1),
                                c: Math.floor(Math.random() * 1000000 + 100000)
                            },
                            {
                                n: 'People' + Math.floor(Math.random() * 100 + 1),
                                c: Math.floor(Math.random() * 1000000 + 100000)
                            },
                            {
                                n: 'People' + Math.floor(Math.random() * 100 + 1),
                                c: Math.floor(Math.random() * 1000000 + 100000)
                            }
                        ],
                        time: Math.floor(Math.random() * 7 + 1),
                        update: new Date(),
                        ruwang_sta:Math.floor(Math.random() * 2 + 1)
                    })
                }
                return data;
            },
            formatDate (date) {
                const y = date.getFullYear();
                let m = date.getMonth() + 1;
                m = m < 10 ? '0' + m : m;
                let d = date.getDate();
                d = d < 10 ? ('0' + d) : d;
                return y + '-' + m + '-' + d;
            },
            changePage () {
                // The simulated data is changed directly here, and the actual usage scenario should fetch the data from the server
                this.tableData1 = this.mockTableData1(this.pageNum);
            },
            handleSearch1(){

            },
            exportExcel(){
                table2excel.transform(this.$refs.tableExcel, 'hrefToExportTable',"报警消息");
            },
            show (index) {
                this.$Modal.info({
                    title: 'User Info',
                    content: `报警IP：${this.tableData1[index].name}`
                })
            },
            remove (index) {
                this.tableData1.splice(index, 1);
            }
        },
        computed:{
            pageTotal () {
                return this.$store.state.app.messageCount;
            }
        }
    }
</script>