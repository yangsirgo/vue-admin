<!-- topology/topology.jsp -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<%@ include file="/WEB-INF/jsp/common/meta.jsp"%>
<script src="${ctxJs}/jquery-1.11.0.min.js"></script>
<link href="${ctxCss}/pageform.css" rel="stylesheet" type="text/css" />
<link href="${ctxCss}/homepage/style.css" rel="stylesheet" type="text/css" />
<link href="${ctxCss}/window/window.css" rel="stylesheet" type="text/css" />
<link href="${ctxCss}/toolmenu/toolmenu.css" rel="stylesheet" type="text/css" />
<link href="${ctxCss}/ztree/ztree.css" rel="stylesheet" type="text/css" />
<script src="${ctxJs}/maintop.js"></script>
<script src="${ctxJs}/toolmenu.js" type="text/javascript"></script>
<script src="${ctxJs}/window.js" type="text/javascript"></script>
<script src="${ctxJs}/plugins/validate/jquery.validate.js"></script>
<script src="${ctxJs}/plugins/zTree/js/jquery.ztree.core-3.5.js" type="text/javascript"></script>
<script src="${ctxJs}/plugins/zTree/js/jquery.ztree.excheck-3.5.js" type="text/javascript"></script>
<script src="${ctxJs}/plugins/zTree/js/jquery.ztree.exedit-3.5.js" type="text/javascript"></script>

<link rel="stylesheet" type="text/css" href="${ctxCss}/layer/layer.css"/>
<link rel="stylesheet" type="text/css" href="${ctxCss}/dataTables/dataTablesgray.css"/>
<link rel="stylesheet" type="text/css" href="${ctxCss}/topology/layout/complex.css" />
<link rel="stylesheet" type="text/css" href="${ctxCss}/topology/jqueryui/gray.css" />
<link rel="stylesheet" type="text/css" href="${ctxCss}/topology/navmenu/jquery.navmenu.min.css" />
<link rel="stylesheet" type="text/css" href="${ctxCss}/topology/msgwindow/msgwindow.min.css" />
<link rel="stylesheet" type="text/css" href="${ctxCss}/topology/tooltip/jquery.tooltip.min.css" />
<link rel="stylesheet" type="text/css" href="${ctxCss}/topology/contextmenu/jquery.contextmenu.min.css" />
<link rel="stylesheet" type="text/css" href="${ctxCss}/topology/percentbar/jquery.percentbar.min.css" />
<link rel="stylesheet" type="text/css" href="${ctxCss}/topology/iphonechkbox/jquery.iphonechkbox.min.css" />
<link rel="stylesheet" type="text/css" href="${ctxCss}/topology/colorpicker/jquery.colorpicker.min.css" />
<link rel="stylesheet" type="text/css" href="${ctxCss}/topology/percentbar/jquery.percentbar.min.css" />
<link rel="stylesheet" type="text/css" href="${ctxCss}/topology/warnlevel.css"/>
<link rel="stylesheet" type="text/css" href="${ctxCss}/iconfont/iconfont.css"/>
<link rel="stylesheet" type="text/css" href="${ctxCss}/iconfont/iconfont-change.css"/>
<link rel="stylesheet" type="text/css" href="${ctxCss}/custom/custom.css"/>
<style type="text/css" media="screen">
    .backblack{width: 100%;height: 100%;position: relative;z-index: 100;background-color: rgba(0,0,0,0.3)}
    .openbox{height: 500px;width: 450px;background: #fff;position: absolute;top: 50%;left: 50%;transform:translate(-50%,-50%);border: 1px solid #dedeed;z-index: 102;}
    .titleprocess{padding-left: 15px;color: #000;font-size: 14px;}
    .openbox .opentitle{height: 40px;background: #f7f7f7;line-height: 40px;}
    .openbox .opencontent{height: 390px;overflow-y: auto;padding:10px 40px;}
    .openbox .openfooter{height: 60px;}
    .closebtn,.stopbtn{height: 32px;width: 70px;float: right;color: #fff;background: #5CAFDF;cursor: pointer;margin-top: 8px;margin-right: 10px;border-style: none}
    .closeerror{background: #F2F4F7;float: right;font-weight: bold;font-size: 25px;color: #ABABAB;cursor: pointer;margin-right: 10px;}
    #huitudiv{-moz-user-select: none;-webkit-user-select: none; -ms-user-select: none; user-select: none;}
    table{table-layout: fixed}
    .layertips,.layertips2{display: none; background:rgba(6,6,6,0.6);color: #fff;position: absolute;top: 0;left: 0;z-index: 100000000;height:30px;line-height:30px;border-radius: 2px;min-width: 30px;text-align: center;padding: 0 10px;}
    .layertips::before,.layertips2::before{display: inline-block;left: 13px;top: -12px;content: "";position: absolute;width: 0;height: 0;border-left: 12px solid transparent;border-right: 12px solid transparent;border-bottom: 12px solid rgba(6,6,6,0.6);}
</style>

<script>
var parentCtx = '${deviceUrl}'
var ctxImg = '${ctxImg}'
var winWidth = $(window).width();
var winHeight = $(window).height();
makemovediv("#huitudiv","#topuwintitle");
makemovediv("#warninglist","#warninglisttitle");
$("#warninglist").width(winWidth-466);
$("#huitudiv").height(winHeight);
function makemovediv(divid,titleid){
    var huitu_move=false;//移动标记
    var huitu_x,huitu_y;//鼠标离控件左上角的相对位置
    $(titleid).mousedown(function(e){
        if(e.buttons==1){
            huitu_move=true;
            huitu_x=e.pageX-parseInt($(divid).css("left"));
            huitu_y=e.pageY-parseInt($(divid).css("top"));
            $(this).css("cursor","move");
        }

    }).mousemove(function(e){
        if(huitu_move&&e.buttons==1){
            var x=e.pageX-huitu_x;//移动时根据鼠标位置计算控件左上角的绝对位置
            var y=e.pageY-huitu_y;
            if( x < 0){//窗口靠左不出边
                x = 0;
            }
            if( x > (winWidth-$(divid).width())){//窗口靠右不出边
               x =(winWidth-$(divid).width());
            }
            if(y <0){//窗口靠上不出边
              y =0;
            }
            if( y > (winHeight-$(divid).height())){//窗口靠下不出边
               y =(winHeight-$(divid).height());
            }
            $(divid).css({top:y,left:x});//控件新位置
        }
    }).mouseup(function(){
        $(this).css("cursor","default");
    }).mouseleave(function(){
        $(this).css("cursor","default");
    });
}
</script>
<div class="topologyCanvas">
    <div class="topologyCanvasToolBar" id="topologyCanvasToolBar">
        <div class="geToolbarContainer" id="geToolbarContainer">
        <!--工具栏区开始-->
        <div class="geToolbar" id="geToolbar">
            <!--第一组-->
            <div id="discoveryStart" class="geButton" title="发现"><div class="geSprite geSprite-redo"></div></div>
            <div class="geButton" title="保存"><div class="geSprite geSprite-save"></div></div>
            <div class="geButton" title="刷新"><div class="geSprite geSprite-refresh"></div></div>
    <!--
            <div class="geButton" title="撤销"><div class="geSprite geSprite-undo"></div></div>
            <div class="geButton" title="重做"><div class="geSprite geSprite-redo"></div></div>
    -->
            <div class="geButton" title="删除"><div class="geSprite geSprite-close"></div></div>
            <div class="geSeparator"></div>

            <!--第二组-->
            <div class="geButton" title="力学布局"><div class="geSprite geSprite-organization"></div></div>
            <div class="geButton" title="1:1"><div class="geSprite geSprite-actualsize"></div></div>
            <div class="geButton" title="全屏"><div class="geSprite geSprite-screen"></div></div>
            <div class="geButton" title="放大"><div class="geSprite geSprite-zoomin"></div></div>
            <div class="geButton" title="缩小"><div class="geSprite geSprite-zoomout"></div></div>

            <!-- <div class="geSeparator"></div> -->

            <!--第三组-->
            <!-- <div class="geButton" title="加粗"><div class="geSprite geSprite-bold"></div></div>
            <div class="geButton" title="斜体"><div class="geSprite geSprite-italic"></div></div>
            <div class="geButton" title="下划线"><div class="geSprite geSprite-underline"></div></div> -->
            <!-- <div class="geButton" title="字体对齐"><div class="geSprite geSprite-left"></div></div> -->
            <!-- <div class="geButton" title="字体颜色"><div class="geSprite geSprite-fontcolor"></div></div> -->
            <%-- <div class="geLabel" title="字体" style="white-space: nowrap; position: relative; overflow: hidden; width:40px;">
                <div class="geSprite-fontstyle">
                字体<img border="0" style="position: absolute; right: 1px; top: 5px;" src="${ctxImg}/topology/toolbar/listdown.gif" valign="middle">
                </div>
            </div> --%>
            <%-- <div class="geLabel" title="字体大小" style="white-space: nowrap; position: relative; overflow: hidden; width:40px;">
                <div class="geSprite-fontsize">
                字号<img border="0" style="position: absolute; right: 1px; top: 5px;" src="${ctxImg}/topology/toolbar/listdown.gif" valign="middle">
                </div>
            </div>--%>
            <!-- <div class="geSeparator"></div>  -->
            <!--第四组-->
    <!--
            <div class="geButton" title="折线"><div class="geSprite geSprite-orthogonal"></div></div>
            <div class="geButton" title="左箭头"><div class="geSprite geSprite-startclassic"></div> </div>
            <div class="geButton" title="右箭头"><div class="geSprite geSprite-endclassic"></div></div>
     -->
            <!-- <div class="geButton" title="线条样式"><div class="geSprite geSprite-dotline"></div></div> -->
            <!-- <div class="geButton" title="线条粗细"><div class="geSprite geSprite-threeline"></div></div> -->
            <div class="geSeparator"></div>
            <!--第5组-->
    <!--
            <div class="geButton" title="线色"><div class="geSprite geSprite-strokecolor"></div></div>
            <div class="geButton" title="填色"><div class="geSprite geSprite-fillcolor"></div></div>
            <div class="geButton" title="渐变"><div class="geSprite geSprite-gradientcolor"></div></div>

            <div class="geSeparator"></div>
     -->
            <!--第6组-->
    <!--
            <div class="geButton mxDisabled" title="手型选择"><div class="geSprite geSprite-hand"></div></div>
    -->
            <div class="geButton" title="网格"><div class="geSprite geSprite-grid"></div></div>
            <!-- <div class="geButton" title="告警"><div class="geSprite geSprite-warn"></div></div> -->
            <!--
            <div class="geButton mxDisabled" title="缩略图"><div class="geSprite geSprite-smallmap"></div> </div>
            -->
            <div class="geButton" title="绘图"><div id="huituopen" class="geSprite geSprite-formatpanel"></div></div>
            <div class="geSeparator"></div>
            <select id="subtopo" name="" class="subtopo"></select>
            <div class="search-ip-box">
                <input id="search_ip" class="search-ip" type="text" placeholder="输入IP进行查询" />
                <i class="icon-search" id="search_ip_btn"></i>
            </div>
        </div>
        <!--工具栏区结束-->
        </div>
    </div>

    <div id="mxPopupMenu" class="mxPopupMenu geToolbarMenu" oncontextmenu="return false;" style="display: none; z-index: 10006; overflow-y: auto; overflow-x: hidden; max-height: 651px;"></div>
        <div id="svgCanvas" class="content">
        <div id="huitudiv" class="resource">
            <div id="resourceOverlay"></div>
            <div class="topuwintitle" id="topuwintitle">
                <div class="topuwinname">绘图</div>
                <div class="resourcectrl">
                    <div id="huituclose" class="titleclose" style="margin-top:9px; margin-right:6px;"></div>
                </div>
                <div class="clear"></div>
            </div>
            <div id="treeArea" class="content">
                <div id="accordion"></div>
            </div>
        </div>
        <!--状态-->
        <div class="topoTitleLeft">
            <div class="topoTitleRight">
                <div id="topoTitle"></div>
            </div>
        </div>
        <!--主画布-->
        <div id="svgContainer" sss></div>
        <!--告警列表-->
        <div id="warninglist" style="display:none">
            <div class="topuwintitle" id="warninglisttitle">
                <div class="topuwinname">告警</div>
                <div class="resourcectrl">
                    <div id="warninglistclose" class="titleclose" style="margin-top:9px; margin-right:6px;"></div>
                </div>
            <div class="clear"></div>
        </div>
        <div class="warninglistcontent"></div>
        </div>
        <!--缩略图-->
        <div id="eagleEye" style="display:none">
            <div id="eagleEye-header">
                <div id="eagleEye-zoom"></div>
                <div id="eagleEye-close"></div>
            </div>
            <div id="eagleEye-content">
                <div id="eagleEye-thumbnail-wrap"></div>
                <div id="eagleEye-box"></div>
            </div>
        </div>
    </div>
</div>
<div id="tabs" style="display:none;position:absolute;z-index: 9999; left:0px; top:0px; background:#fff"></div>
<div id="device" style="visibility: hidden;position: fixed;">
    <div class="device-wind">
        <div class="device-top">
            <div class="search-box">
                <input type="text" class="j-search-input-ip" name="search_ip" placeholder="输入IP进行查询" />
                <i class="icon-search j-search-icon-ip"></i>
            </div>
             <select class="device-status" name="work_status" class="j-search-status">
                <option value="">所有状态</option>
                <option value="1">离线</option>
                <option value="2">隔离</option>
                <option value="3">异常</option>
            </select>
        </div>
        <div class="device-table-box">
             <table class="device-table" cellspacing="0" cellpadding="0" border="0" width="100%">
                <thead>
                    <tr>
                        <th></th>
                        <th>IP</th>
                        <th>昵称</th>
                        <th>所属部门</th>
                        <th style="text-align: center">状态</th>
                    </tr>
                </thead>
             </table>
        </div>
        <div class="openwindowbtns">
          <div class="cancelbtn j-device-cancel">取消</div>
          <div class="enturebtn j-device-submit">确认</div>
        </div>
    </div>
</div>
<div id="alarm" style="visibility: hidden;position: fixed;">
    <div class="alarm-wind">
        <div class="filter-box">
            <div class="search-alarm-box">
                <input type="text" class="search-alarm-input j-search-alarm-ip" placeholder="IP" />
                <i class="icon-search search-alarm-icon j-search-alarm-icon"></i>
            </div>
            <select name="" class="search-alarm-select j-select-alarm-level">
                <option value="">所有级别</option>
            </select>
        </div>
        <div class="alarm-table-box">
             <table class="alarm-table" cellspacing="0" cellpadding="0" border="0" width="100%">
                <thead>
                    <tr>
                        <th>IP地址</th>
                        <th>类型</th>
                        <th>报警级别</th>
                        <th>时间</th>
                    </tr>
                </thead>
             </table>
        </div>
        <div class="openwindowbtns">
          <div class="enturebtn j-alarm-submit">关闭</div>
        </div>
    </div>
</div>
<div class="backblack" style="display: none"></div>
<div class="openbox" style="display: none">
    <div class="opentitle">
        <span class="titleprocess">进度</span><span class="closeerror">×</span>
    </div>
    <div class="opencontent"></div>
    <div class="openfooter">
        <input type="button" class="btn btn-parimy closebtn" value="后台运行" />
        <input type="button" class="btn btn-parimy stopbtn" value="停止" />
    </div>
</div>
<div id="loading" style="display:none;">
    <div class="loading">
      <div class="bounce1"></div>
      <div class="bounce2"></div>
      <div class="bounce3"></div>
    </div>
</div>
<input type="text" name="hideselect" id="hideselect" value="" />
<div class="layertips"></div>
<div class="layertips2"></div>
<script type="text/javascript">
//获取url传参
function query(name) {
    var reg = new RegExp('(^|&)' + name + '=([^&]*)(&|$)', 'i');
    var param = window.location.search.substr(1).match(reg);
    if (param !== null) {
        return unescape(param[2]);
    } else {
        return '';
    }
}
var ctx = "${ctx}";
var ctxImg = "${ctxImg}";
var curTopoId = query('topoId') || localStorage['topoId_'+userid] || "${topoId}";
var _csrf = "${_csrf.parameterName}" ;
var _csrftoken="${_csrf.token}";
var ctxface = "${ctxface}";

var topoData = {
    config: {},
    views: [],
    view: {},
    kpi: {},
    event: {},
    resourceNodes: []
};
</script>

<!-- logic -->
<script src="${ctxJs}/topology/jquery.hydra.min.js"></script>
<script src="${ctxJs}/topology/jquery.lab.min.js"></script>
<script src="${ctxJs}/topology/jquery.svg.min.js"></script>
<!-- ui -->
<script src="${ctxJs}/topology/ui/jquery.easing.1.3.min.js"></script>
<script src="${ctxJs}/topology/ui/jquery.hoverintent.min.js"></script>
<script src="${ctxJs}/topology/ui/jqueryui/jquery-ui-1.10.3.custom.min.js"></script>
<script src="${ctxJs}/topology/ui/hotkeys/jquery.hotkeys.min.js"></script>
<script src="${ctxJs}/topology/ui/layout/jquery.layout-latest.min.js"></script>
<script src="${ctxJs}/topology/ui/navmenu/jquery.navmenu.min.js"></script>
<script src="${ctxJs}/topology/ui/contextmenu/jquery.contextmenu.min.js"></script>
<script src="${ctxJs}/topology/ui/contextmenu/jquery.ctxadapter.min.js"></script>
<script src="${ctxJs}/topology/ui/mousewheel/jquery.mousewheel.min.js"></script>
<script src="${ctxJs}/topology/ui/resize/jquery.ba-resize.min.js"></script>
<script src="${ctxJs}/topology/ui/iphonechkbox/jquery.iphonechkbox.min.js"></script>

<script src="${ctxJs}/plugins/dataTables/js/jquery.dataTables.js"></script>
<script src="${ctxJs}/plugins/dataTables/js/ColReorderWithResize.js"></script>

<script src="${ctxJs}/topology/ui/d3layout/d3forlayout.min.js"></script>
<script src="${ctxJs}/topology/ui/d3layout/layouttree.min.js"></script>
<script src="${ctxJs}/topology/ui/jscounter/jscounter.min.js"></script>
<script src="${ctxJs}/topology/ui/percentbar/jquery.percentbar.min.js"></script>
<script src="${ctxJs}/topology/ui/colorpicker/jquery.colorpicker.min.js"></script>
<!-- config -->
<script src="${ctxJs}/topology/config/config.js"></script>
<script src="${ctxJs}/topology/config/config.event.js"></script>
<script src="${ctxJs}/topology/config/config.objectClass.js"></script>
<script src="${ctxJs}/topology/config/config.graph.js"></script>
<script src="${ctxJs}/topology/config/config.kpi.js"></script>
<script src="${ctxJs}/topology/config/config.context.js"></script>
<script src="${ctxJs}/topology/config/config.convertor.js"></script>
<script src="${ctxJs}/topology/config/config.plugin.js"></script>
<script src="${ctxJs}/topology/config/config.menus.js"></script>

<script src="${ctxJs}/plugins/zTree/js/jquery.ztree.core-3.5.js" type="text/javascript"></script>
<script src="${ctxJs}/plugins/zTree/js/jquery.ztree.excheck-3.5.js" type="text/javascript"></script>
<script src="${ctxJs}/plugins/zTree/js/jquery.ztree.exedit-3.5.js" type="text/javascript"></script>
<!-- main -->
<script src="${ctxJs}/topology/topology.min.js"></script>
<script src="${ctxJs}/topology/main.min.js"></script>
<!-- tooltip -->
<script src="${ctxJs}/topology/ui/tooltip/jquery.tooltip.min.js"></script>
<script src="${ctxJs}/topology/ui/tooltip/jquery.adapter4perf.js"></script>
<script src="${ctxJs}/topology/ui/tooltip/jquery.adapter4hang.js"></script>

<script src="${ctxJs}/topology/tools/treeArea.js"></script>
<script src="${ctxJs}/topology/tools/toolbar.js"></script>
<script src="${ctxJs}/topology/tools/colorPicker.js"></script>
<script src="${ctxJs}/plugins/validate/jquery.validate.js"></script>
<script src="${ctxJs}/validateExtent.js"></script>
<script src="${ctxJs}/custom.js"></script>

<script src="${ctxJs}/layer/layer.js"></script>
<script type="text/javascript">
topoData.config.icon=${icons}
topoData.resourceNodes = [];
var resGroupNodeStr = '${resourceGroup}';
if(resGroupNodeStr!=''){
    var tempNode= eval('${resourceGroup}')
    for (var i = 0; i < tempNode.length; i++) {
        if(tempNode[i].childrenNum!=0){
            topoData.resourceNodes.push(tempNode[i]);
        }
    }
}

// 启动初始化
$(document).ready(function() {
    if(partConfig.length == 0){
        layer.msg('没有查看权限！',{icon : 0});
        return;
    }
    getjson(curTopoId, init)
    function getjson(id, _callback) {
        $.ajax({
            type : "get",
            timeout : 60000, //超时时间设置，单位毫秒
            url : ctx + "/network/loadTopology.do?topoId="+id + "&displayrule=" + displayrule +"&tmp="+new Date().getTime(),
            dataType : "json",
            success : function(msg) {
                viewContent=JSON.parse(msg.topo.viewContent);
                var _veiwContent = msg.topo.viewContent;
                var _id = msg.topo.id;
                topoData.view = eval("[{" + _id + ":" + _veiwContent + "}]")[0];
                var veiwContent = eval("[" + _veiwContent + "]")[0]
                topoData.views = [ veiwContent.view ];
                topoData.queryParams = eval({ type : "1", id : _id, topoType:msg.topo.topoType });
                _callback()
                deviceSet=JSON.parse(_veiwContent).symbols;
                //获取已关联的ip
                AssociatedIPs=$.map(deviceSet,function(obj){
                    return obj.ipaddress
                });
                //显示nat设备信息
                natInfo = msg.natlist;
                showNatDeviecInfo();
                if(query('ip')){//传ip进行检索
                    $('#search_ip').val(query('ip'));
                    $('#search_ip_btn').click();
                }
            }
        });
    }
    dealtooltip();
})


var discoveryTimer = "",content = "",isDiscoveryEnd=true,discoveryTip=null,isDiscoveryCancle=false;
var overflag = 0;
function getFinddata(){
    var urlStr = ctx+"/network/gettopology.do";
    $.ajax({
        type : "get",
        timeout : 60000, //超时时间设置，单位毫秒
        url : urlStr,
        dataType : "json",
        success : function(msg) {
            if (msg == 'success') {
                showDiscovery();
            } else if (msg == 'discovery') {
                showDiscovery();
            } else {
                layer.msg('系统错误，请联系管理员',{icon:0});
            }
        },
        error: function (){
            layer.msg("系统异常，请联系管理员",{icon:0});
        }
    })
}

$("#discoveryStart").click(function(){
    if(discoveryTip){
        layer.close(discoveryTip);
    }
    if(overflag){
        getFinddata();
    }else{
        layer.confirm('开始发现将清空原有拓扑，确定开始发现？', {
            btn: ['确定','取消']
            }, function(index){
                getFinddata();
                layer.closeAll();
        });
    }
}).mouseover(function(){
    var infomsg = "";
    $.ajax({
        type : "get",
        url : ctx + "/network/getdiscoveryinfo.do",
        dataType : "json",
        success : function(msg) {
            var statusflag;
            var text="";
            for(var i = 0 ;i < msg.length;i++){
                var startn = msg[i].indexOf("\n");
                var endn = msg[i].lastIndexOf("\n");
                var starts = msg[i].substring(startn,endn).split("\n");
                if(starts.length == 1){
                } else {
                    infomsg += starts[1] ;
                }
            }
            if ((infomsg != "") && (infomsg.indexOf('停止') == -1) && (infomsg.indexOf('拓扑发现结束') == -1)) {
                text = '正在发现&nbsp;&nbsp;&nbsp;';
                overflag = 1;
            }else if (infomsg != "" && infomsg.indexOf('停止')>-1 && infomsg.indexOf('拓扑发现结束') == -1){
                isDiscoveryCancle=true;
                text = '正在停止发现&nbsp;&nbsp;&nbsp;';
                overflag = 1;
            }
            if(text == ""){
                $(".geSprite-redo").attr('title','发现');
                overflag = 0;
            }else{
                $(".geSprite-redo").removeAttr('title');
                discoveryTip=layer.tips(text + $('#loading').html(), $(".geSprite-redo"), {
                    tips: [1, '#333'],
                    time: 5000,
                    success:function(layero){
                        $(layero).find('.layui-layer-content').css('opacity','0.8');
                    }
                });
            }
        }
    });
});
//发现后台运行
$(".closebtn,.closeerror").click(function(){
    $(".opencontent").html("");
    $(".openbox").hide();
    $(".backblack").hide();
});
//发现停止
$(".stopbtn").click(function(){
    layer.confirm('确定要停止发现吗？', {
        btn: ['确定','取消']
        }, function(index){
            $.ajax({
                type : "get",
                timeout : 60000, //超时时间设置，单位毫秒
                url : ctx + '/network/stopdiscovery.do',
                dataType : "json",
                success : function(msg) {
                    if (msg == 'success') {
                        layer.close(index);
                        layer.msg("正在停止发现...",{icon:1});
                        isDiscoveryCancle=true;
                        $('.stopbtn').hide();
                    } else {
                         layer.msg("停止发现失败！",{icon:2});
                    }
                },
                error: function (){
                    layer.msg("停止发现失败！",{icon:2});
                }
            })
    });
});
function showDiscovery(){
    $(".backblack").show();
    $(".openbox").show();
    if(!isDiscoveryCancle){
       $('.stopbtn').show();
    }
    $(".opencontent").html("").append($('#loading').html());
    getDiscoveryData();
    clearInterval(discoveryTimer);
    discoveryTimer = setInterval(function(){
        getDiscoveryData();
    },10000);
}
function getDiscoveryData(){
    $.ajax({
        type : "get",
        url : ctx + "/network/getdiscoveryinfo.do",
        dataType : "json",
        success : function(msg) {
            content='';
            var isAnimate=false;
            for(var i = 0 ;i < msg.length;i++){
                var startn = msg[i].indexOf("\n");
                var endn = msg[i].lastIndexOf("\n");
                var starts = msg[i].substring(startn,endn).split("\n");
                if(starts.length == 1){
                }else{
                    if(starts[1].indexOf('子网：')>-1){
                        content += "<div class='j-discovery-content' style='line-height:30px;font-size:14px;color:#427BD5'>" + starts[1] + "</div>";
                    }else if(starts[1].indexOf('发现设备：')>-1){
                        content += "<div class='j-discovery-content' style='line-height:30px;font-size:14px;color:#5BBD63'>" + starts[1] + "</div>";
                    }else{
                        content += "<div class='j-discovery-content' style='line-height:30px;font-size:14px'>" + starts[1] + "</div>";
                    }
                    if(starts[1].indexOf('拓扑发现结束')>-1){
                        clearInterval(discoveryTimer);
                        $(".opencontent .loading").remove();
                        isDiscoveryEnd=true;
                        if(isDiscoveryCancle || JSON.stringify(msg).indexOf('停止')>-1){
                            $(".closebtn").click();
                            layer.msg('停止发现成功！',{icon:1})
                        } else if(JSON.stringify(msg).indexOf('失败')>-1){
                            layer.confirm('拓扑发现失败，请检查核心配置！', {
                                btn: ['确定']
                            });
                        } else {
                            layer.confirm('发现完成,要刷新吗？', {
                                btn: ['确定','取消']
                                }, function(){
                                    location.reload();
                            });
                        }
                        isDiscoveryCancle=false;
                    }else{
                        isDiscoveryEnd=false;
                    }
                }
            }
            $(".j-discovery-content").remove();
            $(".opencontent").prepend(content);
            $(".opencontent").get(0).scrollTop = $(".opencontent").get(0).scrollHeight;
        }
    });
}
function dealtooltip(){
    $("body").on('mouseleave', '.tipcontainer .lightblue', function(event) {
        event.preventDefault();
        /* Act on the event */
        $(this).hide();
    });
}
</script>