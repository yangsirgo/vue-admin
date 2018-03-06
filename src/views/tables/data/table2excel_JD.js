export const table2excelData = [
    {
        'name': '管理员1',
        'fav': 0,
        'show': "预算员",
        'weak': "操作员",
        'signin': "首页,网络,设备,定位,准入,报警,关于,网络拓扑,IP地址管理,子网管理",
        'click': "--",
        'active': 1438,
        'day7': 274,
        'day30': 285,
        'tomorrow': 1727,
        'day': 558,
        'week': 4440
    },
    {
        'name': '管理员2',
        'fav': 0,
        'show': "管理员",
        'weak': "审计员",
        'signin': "首页,网络,设备,定位,准入,报警,关于,网络拓扑,IP地址管理",
        'click': "--",
        'active': 8470,
        'day7': 8172,
        'day30': 5197,
        'tomorrow': 1684,
        'day': 2593,
        'week': 2507
    },
    {
        'name': '管理员3',
        'fav': 0,
        'show': "超级管理员",
        'weak': 8007,
        'signin': "关于,网络拓扑,IP地址管理,子网管理",
        'click': "--",
        'active': 16,
        'day7': 2249,
        'day30': 3450,
        'tomorrow': 377,
        'day': 1561,
        'week': 3219
    },
    {
        'name': '管理员4',
        'fav': 0,
        'show': "超级管理员",
        'weak': "管理员",
        'signin': "首页,网络,设备,定位,准入,报警,关于",
        'click': "--",
        'active': 7668,
        'day7': 1547,
        'day30': 2357,
        'tomorrow': 7278,
        'day': 5309,
        'week': 1655
    },
    {
        'name': '管理员5',
        'fav': 0,
        'show': "超级管理员",
        'weak': "审计员",
        'signin': "首页,准入,报警,关于,网络拓扑,IP地址管理,子网管理",
        'click': "--",
        'active': 9256,
        'day7': 209,
        'day30': 3563,
        'tomorrow': 8285,
        'day': 1230,
        'week': 4840
    },
    {
        'name': '管理员6',
        'fav': 0,
        'show': "超级管理员",
        'weak': "管理员",
        'signin': "首页,网络,设备,定位,准入,报警,关于,IP地址管理,子网管理",
        'click': "顶级部门",
        'active': 2909,
        'day7': 4525,
        'day30': 6171,
        'tomorrow': 1920,
        'day': 1966,
        'week': 904
    },
    {
        'name': '管理员7',
        'fav': 0,
        'show': "超级管理员",
        'weak': 6407,
        'signin': "首页,网络,设备,定位,准入,报警,关于,网络拓扑,IP地址管理,子网管理",
        'click': "--",
        'active': 1002,
        'day7': 8701,
        'day30': 9040,
        'tomorrow': 7632,
        'day': 4061,
        'week': 4359
    },
    {
        'name': '管理员8',
        'fav': 0,
        'show': "超级管理员",
        'weak': "审计员",
        'signin': "首页,网络,设备,定位,准入,报警,关于,网络拓扑,IP地址管理,子网管理",
        'click': "--",
        'active': 1002,
        'day7': 8701,
        'day30': 9040,
        'tomorrow': 7632,
        'day': 4061,
        'week': 4359
    },
    {
        'name': '管理员9',
        'fav': 0,
        'show': "超级管理员",
        'weak':"审计员",
        'signin': "首页,网络,设备,定位,准入,报警,关于,网络拓扑,IP地址管理,子网管理",
        'click': "--",
        'active': 1002,
        'day7': 8701,
        'day30': 9040,
        'tomorrow': 7632,
        'day': 4061,
        'week': 4359
    },
    {
        'name': '管理员10',
        'fav': 0,
        'show': "超级管理员",
        'weak': "审计员",
        'signin': "首页,网络,设备,定位,准入,报警,关于,网络拓扑,IP地址管理,子网管理",
        'click': "顶级部门",
        'active': 1002,
        'day7': 8701,
        'day30': 9040,
        'tomorrow': 7632,
        'day': 4061,
        'week': 4359
    }
];

export const excelColumns = [
    {
        'title': '账户民称',
        'key': 'name'
    },
    {
        'title': '账户角色',
        'key': 'show',
        //'sortable': true,
        //filters: [
        //    {
        //        label: '大于4000',
        //        value: 1
        //    },
        //    {
        //        label: '小于4000',
        //        value: 2
        //    }
        //],
        //filterMultiple: false,
        //filterMethod (value, row) {
        //    if (value === 1) {
        //        return row.show > 4000;
        //    } else if (value === 2) {
        //        return row.show < 4000;
        //    }
        //}
    },
    {
        'title': '真实姓名',
        'key': 'weak',
        editable: true
        //'sortable': true
    },
    {
        'title': '页签权限',
        'key': 'signin',
        "width":"460px",
        "align":"center"
        //'sortable': true
    },
    {
        'title': '部门权限',
        'key': 'click',
        'sortable': true
    },
    {
        'title': '电话',
        'key': 'active',
        'sortable': true,
        editable: true
    },
    {
        'title': '邮箱',
        'key': 'day30',
        'sortable': true,
        editable: true
    },
    {
        'title': '操作',
        'key': 'handle',
        "align":"center",
        width: 200,
        handle: ['edit', 'delete']
    }
];
