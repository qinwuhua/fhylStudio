<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" /> 
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../../easyui/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="../../easyui/themes/icon.css" />
<link rel="stylesheet" type="text/css" href="../../css/style.css" />
 <script type="text/javascript" src="../../easyui/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="../../easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../../easyui/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="../../easyui/jscharts.js"></script>
<script type="text/javascript" src="../../easyui/jscharts.plug.mb.js"></script>
<script type="text/javascript" src="../../widget/anyChart/js/AnyChart.js"></script>
<script type="text/javascript" src="../../js/YMLib.js"></script>
<script type="text/javascript" src="js/Menu.js"></script>
<script type="text/javascript" src="../../js/util/jquery.cookie.js"></script>
<script type="text/javascript" src="../../2.x/OpenLayers.js"></script>
<script type="text/javascript" src="../../framework/jquery.tabletojson.js"></script>
 <script type="text/javascript">
$(function(){
	xmlxTj();
	var LeftHeight = $(window).height();
	loadDataunit();
	$('#tab01').css('height', LeftHeight-39);
	$(".datagrid-header").css("display","none");
	OpenLayers.ProxyHost = "../../proxy.jsp?";
	initDefaultStyle();
	initMap();
});
function loadDataunit(){
	$("#dataunit_tree").treegrid({
		border : false,
		rownumbers: false,
		animate:true,
		collapsible:true,
		fit:true,
		fitColumns : true,
		pagination : false,
		loadMsg : '正在加载请稍候...',
		url:'../../xtgl/selectXzqhList.do',
		queryParams : {
			"unit.id":$.cookie("dist2")
		},
		idField:'id',
		treeField:'name',
		showFooter:false,
		columns:[[
            {field:'name',width:200}
		]],
		onBeforeExpand:function(row){
			if(row.id.length==6){
				var child=$("#dataunit_tree").treegrid("getChildren",row.id);
				if(child == ""){
					var node = $('#dataunit_tree').treegrid('getSelected');
					$('#dataunit_tree').treegrid('append',{
						parent: row.id,
						data: [{
							id: 'G'+row.id,name: '国道',state:'closed',iconCls:'icon-none',parent: row.id
						  	},{
							id: 'S'+row.id,name: '省道',state:'closed',iconCls:'icon-none',parent: row.id
							},{
							id: 'X'+row.id,name: '县道',state:'closed',iconCls:'icon-none',parent: row.id
							},{
							id: 'Y'+row.id,name: '乡道',state:'closed',iconCls:'icon-none',parent: row.id
							},{
							id: 'Z'+row.id,name: '专道',state:'closed',iconCls:'icon-none',parent: row.id
							},{
							id: 'C'+row.id,name: '村道',state:'closed',iconCls:'icon-none',parent: row.id
							}
						]
					});
				}
			}else{
				$("#dataunit_tree").treegrid("getChildren",row.id);
			}
		},onDblClickRow:function(row){
			if(row.bmid!="") attrQuery(row.id,row.bmid);
		},onClickRow:function(row){
			if(row.bmid!="") attrQuery(row.id,row.bmid);
		}
	});
}
/**
 * 初始化地图
 */
function initMap() {
    var options = {
        controls: [],
        maxExtent: bounds,
        maxResolution: 0.02183984375,
        projection: "EPSG:4326",
        units: 'degrees'
    };
    //可选代码 设置地图的宽度、高度
    var w = $(document.body).width();
    var h = $(document.body).height();
    $("#map").css({width: w,height: h});
    //
    map = new OpenLayers.Map('map', options);
    baseLayers = new OpenLayers.Layer.WMS(
            "Geoserver layers - Tiled",
            mapServerUrl + "/wms",
            {
                LAYERS: 'jiangxi_map',
                STYLES: '',
                format: format,
                tiled: true,
                tilesOrigin: map.maxExtent.left + ',' + map.maxExtent.bottom
            },
            {
                buffer: 0,
                displayOutsideMaxExtent: true,
                isBaseLayer: true,
                numZoomLevels: 10
            }
    );
    map.addControl(new OpenLayers.Control.Navigation());
    map.addLayers([baseLayers]);
    map.zoomToExtent(bounds);
    map.addControl(new OpenLayers.Control.PanZoomBar({
        position: new OpenLayers.Pixel(2, 15)
    }));
}
var mapServerUrl = "http://localhost:8989/hdmapserver";
var nameSpace = "http://localhost:8989/hdmapserver/jiangximap";
var map, baseLayers;
var format = 'image/png';
var bounds = new OpenLayers.Bounds(
        113.573, 24.488,
        125.482, 30.079
);
/**
 * 初始化默认点、线、面样式
 * */
var styleMap = null;
function initDefaultStyle() {
    var sketchSymbolizers = {
        "Point": {
            pointRadius: 4,
            graphicName: "square",
            fillColor: "white",
            fillOpacity: 1,
            strokeWidth: 1,
            strokeOpacity: 1,
            strokeColor: "#333333",
            externalGraphic: "../../images/mark.png",
            graphicWidth: 24,
            graphicHeight: 24
        },
        "Line": {
            strokeWidth: 3,
            strokeOpacity: 1,
            strokeColor: "#0000FF"
        },
        "Polygon": {
            strokeWidth: 2,
            strokeOpacity: 1,
            strokeColor: "#ffffff",
            fillColor: "#0000FF",
            fillOpacity: 0.3
        }
    };
    var style = new OpenLayers.Style();
    style.addRules([
        new OpenLayers.Rule({symbolizer: sketchSymbolizers})
    ]);
    styleMap = new OpenLayers.StyleMap({"default": style});
}

/**
 * 属性查询示例
 */
 function attrQuery(_roadcode,_lx) {
		YMLib.Var.bm=_roadcode;
		var signFlag=_roadcode.substr(0,1);
		var signName=_roadcode.length>11?"桥梁图层":"路线图层";
		$.ajax({
			type:"post",
			url : '/jxzhpt/xtgl/getBmbmTreeByName2.do?yhm='
				+ encodeURI(encodeURI(signName)),
			dataType:'json',
			success:function(msg){
				var showLayer="";
				var lx="";
				if(msg.length==4){
					if((signFlag=="G"||signFlag=="S")&&(_lx=="特大桥"||_lx=="大桥")) showLayer=msg[0].bmid;
					if((signFlag=="G"||signFlag=="S")&&(_lx=="中桥"||_lx=="小桥")) showLayer=msg[1].bmid;
					if((signFlag=="X"||signFlag=="Y"||signFlag=="Z"||signFlag=="C")&&(_lx=="特大桥"||_lx=="大桥")) showLayer=msg[2].bmid;
					if((signFlag=="X"||signFlag=="Y"||signFlag=="Z"||signFlag=="C")&&(_lx=="中桥"||_lx=="小桥")) showLayer=msg[3].bmid;
					lx="ROADBM";
				}else if(msg.length==6){
					if(_lx=="G") showLayer=msg[0].bmid;
					if(_lx=="S") showLayer=msg[1].bmid;
					if(_lx=="X") showLayer=msg[2].bmid;
					if(_lx=="Y") showLayer=msg[3].bmid;
					if(_lx=="Z") showLayer=msg[4].bmid;
					if(_lx=="C") showLayer=msg[5].bmid;
					lx="ROADCODE";
				}
				wfsAttrQuery(showLayer, lx, _roadcode);
				//wfsAttrQuery("jx_guodao", "ROADCODE", "G6001");
			}
		});
		
	}
/**
 * I查询
 * */
var infoControl = null;
function IQuery() {
    if (infoControl != null) {
        infoControl.activate();
        return;
    }
    infoControl = new OpenLayers.Control.WMSGetFeatureInfo({
        url: mapServerUrl + '/wms',
        layers: [baseLayers],
        queryVisible: true,//查找可见图层
        drillDown: true,
        maxFeatures: 50//最大返回要素数目50个
    });
    infoControl.events.register("getfeatureinfo", this, showInfo);
    infoControl.events.register("nogetfeatureinfo", this, notGetInfo);
    map.addControl(infoControl);
    infoControl.activate();
}
/**
 * I查询查询到数据后的处理方法
 */
var layersConfig = [];
function showInfo(event) {
    var parser = new DOMParser();
    var responseTest = parser.parseFromString(event.text, "text/html");
    var jsonTables = [];
    var tableNames = [];
    $("table.featureInfo", responseTest).each(function (i, obj) {
        var table = $(obj).tableToJSON({
            ignoreHiddenRows: false
        });
        jsonTables[i] = table;
        tableNames[i] = $(obj).find("caption").html();
    });
    // console.info(tableNames,jsonTables);
    /*jsonTables = JSON.stringify(jsonTables);
     console.log(jsonTables);*/
    //
    var len = jsonTables.length;
    var keyId = "ID";//主键字段
    var keyValue = null;
    var index = len - 1;
    for (var i = len - 1; i >= 0; i--) {
        var jsonTable = jsonTables[i];
        if (jsonTable[0][keyId]) {
            index = i;
            keyValue = jsonTable[0][keyId];
            break;
        }
    }
    //
    var layerName = tableNames[index];
    wfsAttrQuery(layerName, keyId, keyValue);
}
/**
 * 调用WFS进行属性查询
 * 注意：这里只封装了单一属性查询，实际上WFS是支持多种属性条件查询和空间查询
 */
var resultLayer = null;
function wfsAttrQuery(layerName, keyCol, keyValue) {
    //debugger;
    if (resultLayer == null) {
        resultLayer = new OpenLayers.Layer.Vector("resultLayer", {styleMap: styleMap});
        map.addLayer(resultLayer);
        //添加数据移动上去显示气泡
        var selectControl = new OpenLayers.Control.SelectFeature(resultLayer, {
			onSelect: onFeatureSelect,
			onUnselect: onFeatureUnselect,
			hover: false
        });
        map.addControl(selectControl);
        selectControl.activate();
    } else {
        resultLayer.removeAllFeatures();
    }
    var wfsProtocol = new OpenLayers.Protocol.WFS({
        url: mapServerUrl + "/wfs",//正式环境代码：mapServerUrl+"/wfs",
        featureType: layerName,
        featureNS: nameSpace,//正式环境代码：nameSpace
        /**
         * 更复杂的逻辑条件请参考OpenLayers的API
         * */
        filter: new OpenLayers.Filter.Comparison({
            type: OpenLayers.Filter.Comparison.EQUAL_TO,
            property: keyCol,
            value: keyValue
        }),
        maxFeatures: 1000,
        outputFormat: 'GML2',
        callback: function (req) {
            var gmlParse = new OpenLayers.Format.GML();
            var features = gmlParse.read(req.priv.responseText);
            resultLayer.addFeatures(features);
            //map.setCenter();
            if (resultLayer.features && resultLayer.features.length > 0) {
                map.zoomToExtent(resultLayer.getDataExtent());
            }

        }
    });
    wfsProtocol.read();
}
/**
 * I查询没有查询到数据的处理方法
 */
function notGetInfo() {
	//alert("暂无数据");
}
//构造弹出窗口的函数
var selectedFeature = null;
function onFeatureSelect(feature) {
	if(YMLib.Var.bm.length>10) YMLib.UI.createWindow('qllx_add','项目查询','./dzdt_ql.jsp','app_add',630,330);
	else YMLib.UI.createWindow('qllx_add','项目查询','./dzdt_lx.jsp','app_add',630,330);
}
//销毁弹出窗口的函数
function onFeatureUnselect(feature) {
    map.removePopup(feature.popup);
    feature.popup.destroy();
    feature.popup = null;
}
//关闭弹出窗口的函数
function onPopupClose(evt) {
    selectControl.unselect(selectedFeature);
}
</script>
</head>
<body class="easyui-layout" style="background:#fafafa;" scroll="no">
	<div region="west" iconCls="icon-table"  split="true" href="" style="width:250px;">
		<div border="false" class="easyui-tabs" fit="true">
			<div title="定位" class="tab_content" style="overflow:hidden;height:500px;"  id="tab01">
				<table id="dataunit_tree" cellspacing="0" cellpadding="0"></table>
			</div>
    	</div>
    </div>
	
	<div region="east" iconCls="icon-table"  split="true" style="width:420px;">
		<div border="false" class="easyui-tabs">
	    	<div title="提醒信息">您当前共有 10 条信息需要处理， 共有 0 条通知。
	    	<table id="xmlxTj_table" width="398" border="0" align="center" cellpadding="0" cellspacing="1" class="ll" bgcolor="#b8bdc1" style="font-size:12px;"></table>
	    	<div id="anychart_div" style="width:350px;height:300px;margin:10px;"> 
				<div>
					<param name="wmode" value="transparent" />
				</div>
			</div>
			
			</div>
	    </div>
	</div>
	
    <div region="center" style="padding:0px;background:#eee;">
    	<div class="easyui-layout" fit="true">
			<!-- 地图区域开始 -->
		    <div region="center" style="padding:0px;" border="false">
				<div id="mainTab" border="false" class="easyui-tabs" fit="true">
					
					 <div title="地图" style="overflow: hidden;" iconCls="icon-note">
						 <div style="position: absolute;top: 35px;right:30px;z-index: 9999">
							<!-- <button onclick="attrQuery()">桥梁属性查询</button> -->
							<a href="#" onclick="IQuery()"><img src="../../images/iSearch.png"/></a>
						</div>
						<div id="map" style="width:100%;height:100%;"></div>
					</div>
				</div>
		    </div>
		    <!-- 地图区域结束 -->
		</div> 
    </div>  
</body>
</html>