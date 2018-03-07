import Main from '@/views/Main.vue';

// 不作为Main组件的子页面展示的页面单独写，如下
export const loginRouter = {
    path: '/login',
    name: 'login',
    meta: {
        title: 'Login - 登录'
    },
    component: () => import('@/views/login.vue')
};

export const page404 = {
    path: '/*',
    name: 'error-404',
    meta: {
        title: '404-页面不存在'
    },
    component: () => import('@/views/error-page/404.vue')
};

export const page403 = {
    path: '/403',
    meta: {
        title: '403-权限不足'
    },
    name: 'error-403',
    component: () => import('@//views/error-page/403.vue')
};

export const page500 = {
    path: '/500',
    meta: {
        title: '500-服务端错误'
    },
    name: 'error-500',
    component: () => import('@/views/error-page/500.vue')
};

export const preview = {
    path: '/preview',
    name: 'preview',
    component: () => import('@/views/form/article-publish/preview.vue')
};

export const locking = {
    path: '/locking',
    name: 'locking',
    component: () => import('@/views/main-components/lockscreen/components/locking-page.vue')
};

// 作为Main组件的子页面展示但是不在左侧菜单显示的路由写在otherRouter里
export const otherRouter = {
    path: '/',
    name: 'otherRouter',
    redirect: '/home',
    component: Main,
    children: [
        { path: 'home', title: {i18n: 'home'}, name: 'home_index', component: () => import('@/views/home/home.vue') },
        { path: 'ownspace', title: '个人中心', name: 'ownspace_index', component: () => import('@/views/own-space/own-space.vue') },
        { path: 'order/:order_id', title: '订单详情', name: 'order-info', component: () => import('@/views/advanced-router/component/order-info.vue') }, // 用于展示动态路由
        { path: 'shopping', title: '购物详情', name: 'shopping', component: () => import('@/views/advanced-router/component/shopping-info.vue') }, // 用于展示带参路由
        { path: 'message', title: '报警管理', name: 'message_index', component: () => import('@/views/message/message.vue') }
    ]
};

// 作为Main组件的子页面展示并且在左侧菜单显示的路由写在appRouter里
export const appRouter = [
    {
        path: '/access-test',
        icon: 'lock-combination',
        title: '权限1',
        name: 'accesstest',
        access: 0,
        component: Main,
        children: [
            { path: 'index', title: '权限测试页', name: 'accesstest_index', access: 0, component: () => import('@/views/access/access-test.vue') }
        ]
    },
    {
        path: '/home',
        icon: 'home',
        title: "首页",
        name: 'home',
        component: Main,
        children: [
            { path: 'index', title: "首页", name: 'home_index', component: () => import('@/views/home/home.vue') }
        ]
    },
    {
        path: '/component',
        icon: 'network',
        name: 'component',
        title: '网络',
        component: Main,
        children: [
            {
                path: 'text-editor',
                icon: 'network',
                name: 'text-editor',
                title: '网络拓扑',
                component: () => import('@/views/my-components/text-editor/text-editor.vue')
            }
            //{
            //    path: 'md-editor',
            //    icon: 'pound',
            //    name: 'md-editor',
            //    title: 'Markdown编辑器',
            //    component: () => import('@/views/my-components/markdown-editor/markdown-editor.vue')
            //},
            //{
            //    path: 'image-editor',
            //    icon: 'crop',
            //    name: 'image-editor',
            //    title: '图片预览编辑',
            //    component: () => import('@/views/my-components/image-editor/image-editor.vue')
            //},
            //{
            //    path: 'draggable-list',
            //    icon: 'arrow-move',
            //    name: 'draggable-list',
            //    title: '可拖拽列表',
            //    component: () => import('@/views/my-components/draggable-list/draggable-list.vue')
            //},
            //{
            //    path: 'area-linkage',
            //    icon: 'ios-more',
            //    name: 'area-linkage',
            //    title: '城市级联',
            //    component: () => import('@/views/my-components/area-linkage/area-linkage.vue')
            //},
            //{
            //    path: 'file-upload',
            //    icon: 'android-upload',
            //    name: 'file-upload',
            //    title: '文件上传',
            //    component: () => import('@/views/my-components/file-upload/file-upload.vue')
            //},
            //{
            //    path: 'count-to',
            //    icon: 'arrow-graph-up-right',
            //    name: 'count-to',
            //    title: '数字渐变',
            //    // component: () => import('@/views/my-components/count-to/count-to.vue')
            //    component: () => import('@/views/my-components/count-to/count-to.vue')
            //},
            //{
            //    path: 'split-pane-page',
            //    icon: 'ios-pause',
            //    name: 'split-pane-page',
            //    title: 'split-pane',
            //    component: () => import('@/views/my-components/split-pane/split-pane-page.vue')
            //}
        ]
    },
    {
        path: '/message',
            icon: 'alert-circled',
        title: '报警',
        name: 'accesstest',
        component: Main,
        children: [
        { path: 'index', title: '报警', name: 'message_index',  component: () => import('@/views/message/message.vue') }
    ]
    },
    //{
    //    path: '/form',
    //    icon: 'settings',
    //    name: 'form',
    //    title: '系统',
    //    component: Main,
    //    children: [
    //        {   path: 'artical-publish',
    //            title: '用户配置',
    //            name: 'artical-publish',
    //            icon: 'compose',
    //            component: () => import('@/views/form/article-publish/artical-publish-center.vue'),
    //            children:[
    //                {   path: 'artical-publish-sub',
    //                    title: '管理员',
    //                    name: 'artical-publish-sub',
    //                    icon: 'person',
    //                    component: () => import('@/views/tables/exportable-table-JD.vue')
    //                },
    //                {   path: 'partInfo',
    //                    title: '部门信息',
    //                    name: 'partInfo',
    //                    icon: 'person-stalker',
    //                    component: () => import('@/views/form/work-flow/work-flow.vue')
    //                }
    //            ]},
    //    {   path: '',
    //        title: '工单配置',
    //        name: 'Worksheet',
    //        icon: 'wrench',
    //        component: () => import('@/views/form/work-flow/work-flow.vue')
    //    }
    //    ]
    //},
     //{
     //    path: '/charts',
     //    icon: 'ios-analytics',
     //    name: 'charts',
     //    title: '图表',
     //    component: Main,
     //    children: [
     //        { path: 'pie', title: '饼状图', name: 'pie', icon: 'ios-pie', component: resolve => { require('@/views/access/access.vue') },
     //        { path: 'histogram', title: '柱状图', name: 'histogram', icon: 'stats-bars', component: resolve => { require('@/views/access/access.vue') }
     //
     //    ]
     //},
    {
        path: '/tables',
        icon: 'ios-grid-view',
        name: 'tables',
        title: '系统',
        component: Main,
        children: [
            //{ path: 'dragableTable', title: '可拖拽排序', name: 'dragable-table', icon: 'arrow-move', component: () => import('@/views/tables/dragable-table.vue') },
            { path: 'editableTable', title: '权限测试', access: 0,name: 'editable-table', icon: 'edit', component: () => import('@/views/access/access-test.vue') },
            { path: 'searchableTable', title: '管理员配置', name: 'searchable-table', icon: 'search', component: () => import('@/views/tables/editable-table.vue') },
            { path: 'exportableTable', title: '表格导出数据', name: 'exportable-table', icon: 'code-download', component: () => import('@/views/tables/exportable-table.vue') },
            { path: 'table2image', title: '日志查看', name: 'table-to-image', icon: 'images', component: () => import('@/views/tables/table-to-image.vue') }
        ]
    },
    //{
    //    path: '/advanced-router',
    //    icon: 'ios-infinite',
    //    name: 'advanced-router',
    //    title: '高级路由',
    //    component: Main,
    //    children: [
    //        { path: 'mutative-router', title: '动态路由', name: 'mutative-router', icon: 'link', component: () => import('@/views/advanced-router/mutative-router.vue') },
    //        { path: 'argument-page', title: '带参页面', name: 'argument-page', icon: 'android-send', component: () => import('@/views/advanced-router/argument-page.vue') }
    //    ]
    //},
    //{
    //    path: '/error-page',
    //    icon: 'android-sad',
    //    title: '错误页面',
    //    name: 'errorpage',
    //    component: Main,
    //    children: [
    //        { path: 'index', title: '错误页面', name: 'errorpage_index', component: () => import('@/views/error-page/error-page.vue') }
    //    ]
    //},
    {
        path: '/access',
            icon: 'key',
        name: 'access',
        title: '权限',
        component: Main,
        children: [
        { path: 'index', title: '权限管理', name: 'access_index', component: () => import('@/views/access/access.vue') }
      ]
    },
];

// 所有上面定义的路由都要写在下面的routers里
export const routers = [
    loginRouter,
    otherRouter,
    preview,
    locking,
    ...appRouter,
    page500,
    page403,
    page404
];
