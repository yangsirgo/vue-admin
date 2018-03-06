<style lang="less" scoped>
    @import '../../styles/common.less';
    @import './components/table.less';
</style>

<template>
    <div>
        <Row class="margin-top-10">
            <Card>
                <h4 slot="title">
                    <Icon type="android-archive"></Icon>
                    导出表格数据到 .Xls 文件 (Excel)
                </h4>
                <Row>
                    <div class="margin-left-10 margin-top-20">
                        <a id="hrefToExportTable" style="postion: absolute;left: -10px;top: -10px;width: 0px;height: 0px;"></a>
                        <Button type="primary" size="large" @click="exportExcel">下载表格数据</Button>
                    </div>
                    <Table :columns="excelColumns" :data="table2excelData" ref="tableExcel"></Table>
                </Row>
            </Card>
        </Row>
    </div>
</template>

<script>
import {table2csvData, csvColumns} from './data/table2csv.js';
import {table2excelData, excelColumns} from './data/table2excel_JD.js';
import table2excel from '@/libs/table2excel.js';
export default {
    name: 'exportable-table',
    data () {
        return {
            columnsCsv: csvColumns,
            csvData: table2csvData,
            table2excelData: table2excelData,
            excelColumns: excelColumns,
            rowNum: table2csvData.length,
            colNum: csvColumns.length,
            selectMinRow: 1,
            selectMaxRow: table2csvData.length,
            selectMinCol: 1,
            selectMaxCol: csvColumns.length,
            maxRow: 0,
            minRow: 1,
            maxCol: 0,
            minCol: 1,
            csvFileName: '',
            excelFileName: '',
            tableExcel: {},
            fontSize: 16
        };
    },
    created () {
        this.init();
    },
    methods: {
        init(){

        },
        exportData (type) {
            if (type === 1) {
                this.$refs.tableCsv.exportCsv({
                    filename: '原始数据'
                });
            } else if (type === 2) {
                this.$refs.tableCsv.exportCsv({
                    filename: '排序和过滤后的数据',
                    original: false
                });
            } else if (type === 3) {
                this.$refs.tableCsv.exportCsv({
                    filename: this.csvFileName,
                    columns: this.columnsCsv.filter((col, index) => index >= this.selectMinCol - 1 && index <= this.selectMaxCol - 1),
                    data: this.csvData.filter((data, index) => index >= this.selectMinRow - 1 && index <= this.selectMaxRow - 1)
                });
            }
        },
        exportExcel () {
            table2excel.transform(this.$refs.tableExcel, 'hrefToExportTable', this.excelFileName);
        }
    }
};
</script>
