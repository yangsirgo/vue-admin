<style lang="less">
    @import '../styles/menu.less';
</style>

<template>
    <Menu ref="sideMenu"  :active-name="$route.name" :open-names="openNames" :theme="menuTheme" width="auto" @on-select="changeMenu" >
        <template v-for="item in menuList">
            <MenuItem v-if="item.children.length<=1" :name="item.children[0].name" :key="'menuitem' + item.name">
                <Icon :type="item.children[0].icon || item.icon" :size="iconSize" :key="'menuicon' + item.name"></Icon>
                <span class="layout-text" :key="'title' + item.name">{{ itemTitle(item.children[0]) }}</span>
            </MenuItem>
            <Submenu v-if="item.children.length > 1" :name="item.name" :key="item.name">
                <template slot="title">
                    <Icon :type="item.icon" :size="iconSize"></Icon>
                    <span class="layout-text">{{ itemTitle(item) }}</span>
                </template>
                <template v-for="child in item.children">
                    <MenuItem v-if="!child.children"  :name="child.name" :key="'menuitem' + child.name">
                        <Icon :type="child.icon" :size="iconSize" :key="'icon' + child.name"></Icon>
                        <span class="layout-text" :key="'title' + child.name">{{ itemTitle(child) }}</span>
                    </MenuItem>
                        <Submenu v-if="child.children&&child.children.length >= 1" :name="child.name"  :key="child.name">
                            <template slot="title">
                                <Icon :type="child.icon" :size="iconSize"></Icon>
                                <span class="layout-text">{{ itemTitle(child) }}</span>
                            </template>
                            <template v-for="subchild in child.children">
                                <MenuItem :name="subchild.name" :key="subchild.name">
                                    <Icon :type="subchild.icon" :size="iconSize" :key="'icon' + subchild.name"></Icon>
                                    <span class="layout-text" :key="'title' + subchild.name">{{ itemTitle(subchild) }}</span>
                                </MenuItem>
                            </template>
                        </Submenu>
                </template>
            </Submenu>
        </template>
    </Menu>
</template>

<script>
export default {
    name: 'sidebarMenu',
    props: {
        menuList: Array,
        iconSize: Number,
        menuTheme: {
            type: String,
            default: 'dark'
        },
        openNames: {
            type: Array
        }
    },
    methods: {
        changeMenu (active) {
//            console.log(active);//获取点击菜单的那么值con
            this.$emit('on-change', active);
        },
        itemTitle (item) {
            if (typeof item.title === 'object') {
                return this.$t(item.title.i18n);
            } else {
                return item.title;
            }
        }
    },
    updated () {
        this.$nextTick(() => {
            if (this.$refs.sideMenu) {
                this.$refs.sideMenu.updateOpened();
            }
        });
    }

};
</script>
