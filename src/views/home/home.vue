<style lang="less">
    @import "./home.less";
    @import "homepage.less";
    @import "../../styles/common.less";
    div.data-source-auto{
        height:auto;
        min-height:300px;
    }
    div.data-source-pie{
        height:700px;
    }
</style>
<template>
    <div class="home-main">
        <Row :gutter="10" class="margin-top-10">
            <Col :md="24" :lg="8" :style="{marginBottom: '10px'}">
                <Card  :style="{marginBottom: '10px'}">
                    <p slot="title" class="card-title">
                        <Icon type="android-map"></Icon>
                        在线率统计
                    </p>
                    <div class="data-source-row">
                        <visite-volume></visite-volume>
                    </div>
                </Card>
            <Card>
                <p slot="title" class="card-title">
                    <Icon type="android-wifi"></Icon>
                    资产统计
                </p>
                <div class="data-source-row">
                    <user-flow></user-flow>
                </div>
            </Card>
            </Col>
            <Col :md="24" :lg="8" :style="{marginBottom: '10px'}">
                <Card>
                    <p slot="title" class="card-title">
                        <Icon type="ios-pulse-strong"></Icon>
                        全国报警统计
                    </p>
                    <div class="data-source-row data-source-pie">
                        <data-source-pie></data-source-pie>
                        <!--<div class="clear"></div>-->
                    </div>
                </Card>
            </Col>
            <Col :md="24" :lg="8">
                <Card>
                    <p slot="title" class="card-title">
                        <Icon type="android-wifi"></Icon>
                        网络安全统计
                    </p>
                    <div class="data-source-row data-source-auto">
                        <mapDataTable></mapDataTable>
                    </div>
                </Card>
            </Col>
            <!--<Col :md="24" :lg="8">-->
            <!--<Card>-->
                <!--<p slot="title" class="card-title">-->
                    <!--<Icon type="android-wifi"></Icon>-->
                    <!--各类用户服务调用变化统计-->
                <!--</p>-->
                <!--<div class="data-source-row">-->
                    <!--<user-flow-jd></user-flow-jd>-->
                <!--</div>-->
            <!--</Card>-->
            <!--</Col>-->
        </Row>
    </div>
</template>

<script>
import cityData from './map-data/get-city-value.js';
import homeMap from './components/map.vue';
import dataSourcePie from './components/dataSourcePie.vue';
import visiteVolume from './components/visiteVolume.vue';
import serviceRequests from './components/serviceRequests.vue';
import userFlow from './components/userFlow.vue';
//import userFlowJd from './components/userFlowJd.vue';
import countUp from './components/countUp.vue';
import inforCard from './components/inforCard.vue';
import mapDataTable from './components/mapDataTable.vue';
import toDoListItem from './components/toDoListItem.vue';

export default {
    name: 'home',
    components: {
        homeMap,
        dataSourcePie,
        visiteVolume,
//        userFlowJd,
//        serviceRequests,
        userFlow,
        countUp,
//        inforCard,
        mapDataTable,
//        toDoListItem
    },
    data () {
        return {
            toDoList: [
                {
                    title: '去iView官网学习完整的iView组件'
                },
                {
                    title: '去iView官网学习完整的iView组件'
                },
                {
                    title: '去iView官网学习完整的iView组件'
                },
                {
                    title: '去iView官网学习完整的iView组件'
                },
                {
                    title: '去iView官网学习完整的iView组件'
                }
            ],
            count: {
                createUser: 496,
                visit: 3264,
                collection: 24389305,
                transfer: 39503498
            },
            cityData: cityData,
            showAddNewTodo: false,
            newToDoItemValue: ''
        };
    },
    computed: {
        avatorPath () {
            return localStorage.avatorImgPath;
        }
    },
    methods: {
        addNewToDoItem () {
            this.showAddNewTodo = true;
        },
        addNew () {
            if (this.newToDoItemValue.length !== 0) {
                this.toDoList.unshift({
                    title: this.newToDoItemValue
                });
                setTimeout(() => {
                    this.newToDoItemValue = '';
                }, 200);
                this.showAddNewTodo = false;
            } else {
                this.$Message.error('请输入待办事项内容');
            }
        },
        cancelAdd () {
            this.showAddNewTodo = false;
            this.newToDoItemValue = '';
        }
    }
};
</script>
