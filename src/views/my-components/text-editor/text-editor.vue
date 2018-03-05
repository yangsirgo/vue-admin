<style lang="less">
    @import '../../../styles/loading.less';
</style>

<template>
    <div>
        <iframe src="./src/views/my-components/text-editor/topology/topo.html"  frameborder="none" scrolling="auto" style="width: 100%; min-height:780px;"></iframe>
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
