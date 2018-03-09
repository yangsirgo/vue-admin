<style lang="less" scoped>
    @import '../../../styles/loading.less';
    .main .single-page-con .single-page{
        margin: 0px;
    }
</style>

<template>
    <div>
        <iframe src="https://yangsirgo.github.io/vue-iview-admin/topology/topo.html"  frameborder="none" scrolling="auto" style="width: 100%; min-height:780px;"></iframe>
    </div>
</template>

<script>


    export default {
    name: 'text-editor',
    data () {
        return {
            spinShow: true
        };
    },
    methods: {
        init () {
            this.$nextTick(() => {

            });
        }
    },
    mounted () {
        this.init();
    },
    destroyed () {
//        tinymce.get('tinymceEditer').destroy();
    }
};
</script>

<style>

</style>
