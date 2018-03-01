<style>
    span.Badge-coin .ivu-badge-count{
        height: 12px;
        line-height: 12px;
        top: -6px;
        padding: 0 2px;
    }
</style>
<template>
    <div @click="showMessage" class="message-con">
        <Tooltip :content="value > 0 ? '有' + value + '条未确认警告消息' : '无警告消息'" placement="bottom">
            <Badge  :count="value" class="Badge-coin">
                <Icon type="alert-circled" :size="22"></Icon>
            </Badge>
        </Tooltip>
    </div>
</template>

<script>
import util from '@/libs/util.js';
export default {
    name: 'messageTip',
    props: {
        value: {
            type: Number,
            default: 0
        }
    },
    methods: {
        showMessage () {
            util.openNewPage(this, 'message_index');
            this.$router.push({
                name: 'message_index'
            });
        }
    }
};
</script>
