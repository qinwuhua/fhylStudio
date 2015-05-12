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
                LAYERS: tczName,
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

/**
 * 属性查询示例
 */
 function attrQuery(_roadcode,_lx) {
	YMLib.Var.bm=_roadcode;
	var signFlag=_roadcode.substr(0,1);
	var signName=_roadcode.length>11?"桥梁图层":"路线图层";
	//wfsAttrQuery("jx_xianxiangzhongxiaoqiao", "ROADBM", "Y573360731L0030");
	$.ajax({
		type:"post",
		url : '/jxzhpt/xtgl/getBmbmTreeByName2.do?yhm='
			+ encodeURI(encodeURI(signName)),
		dataType:'json',
		success:function(msg){
			var showLayer="";
			var lx="";
			if(msg.length==4){
				if((signFlag=="G"||signFlag=="S")&&(_lx=="1"||_lx=="2")) showLayer=msg[0].bmid;
				if((signFlag=="G"||signFlag=="S")&&(_lx=="3"||_lx=="4")) showLayer=msg[1].bmid;
				if((signFlag=="X"||signFlag=="Y"||signFlag=="Z"||signFlag=="C")&&(_lx=="1"||_lx=="2")) showLayer=msg[2].bmid;
				if((signFlag=="X"||signFlag=="Y"||signFlag=="Z"||signFlag=="C")&&(_lx=="3"||_lx=="4")) showLayer=msg[3].bmid;
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
//构造弹出窗口的函数
 function onFeatureSelect(feature) {
 	if(YMLib.Var.bm.length>11) YMLib.UI.createWindow('ql_add','桥梁项目查询','./dzdt_ql.jsp','app_add',630,330);
 	else YMLib.UI.createWindow('lx_add','路线项目查询','./dzdt_lx.jsp','app_add',630,330);
 }

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
 * I查询
 * */
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
    var layerName = tableNames[index];
    wfsAttrQuery(layerName, keyId, keyValue);
}

/**
 * 调用WFS进行属性查询
 * 注意：这里只封装了单一属性查询，实际上WFS是支持多种属性条件查询和空间查询
 */
function wfsAttrQuery(layerName, keyCol, keyValue) {
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
            //console.info(req);
            var gmlParse = new OpenLayers.Format.GML();
            var features = gmlParse.read(req.priv.responseText);
            resultLayer.addFeatures(features);
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
}
/**
 * 初始化默认点、线、面样式
 * */
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
function turnTo(_id,_parent,_name){
	var url="";
	var menuId="";
	var sj=$.cookie("dist2")=="36"?"1":"0";
	switch(_id.substr(0,8)){
		case "01010201": url="page/lwxm/Menu.jsp";menuId="Menu_2";break;
		case "01010203": url="page/lwxm/Menu.jsp";menuId="Menu_2";break;
		case "01010301": url="page/jhgl/Menu.jsp";menuId="Menu_3";break;
		case "01010402": url="page/gcgl/Menu.jsp";menuId="Menu_4";break;
	}
	url=url+"?id="+_id+"&sj="+sj;
	parent.$("#c1f").attr("src",url);
	parent.$("#Menu_1").removeClass('now');
	parent.$("#"+menuId).addClass('now');
}
function selAnyChartXml(){
	$.ajax({
		type:"post",
		async:false,
		url:"../../xtgl/selAnyChartXml.do",
		dataType:'json',
		data:"param.sourceid="+$.cookie("unit2")+"&param.xzqh="+$.cookie("dist"),
		success:function(msg){
			createAnyChartXml(msg.hm2.xml);
			var list1=msg.hm1.list;
			for(var i=0;i<list1.length;i++){
				$("#ip_"+list1[i].name).html(list1[i].id);
			}
			var list2=msg.hm1.list2;
			for(var i=0;i<list2.length;i++){
				$("#ip_"+list2[i].parent).html(list2[i].descr);
			}
		}
	});
}
function createAnyChartXml(_xml){
    barChart_1= new AnyChart("/jxzhpt/widget/anyChart/swf/AnyChart.swf");    
    barChart_1.width =350;
    barChart_1.height =300;
    barChart_1.padding =0;
    barChart_1.wMode="transparent";
    barChart_1.write("anychart_div");
    barChart_1.setData(_xml);
}
function xmlxTj(){
	$.ajax({
		type:"post",
		async:false,
		url:"../../xtgl/xmlxCountTj.do",
		dataType:'json',
		data:'param.id='+$.cookie("qx4"),
		success:function(msg){
			if(msg!=null){
				var htmlStr="";
				for(var i=0;i<msg.length;i++){
					if(msg[i].desr!=""){
						htmlStr+="<tr><td height='25' width='140px' bgcolor='#FfFfFf' align='center' rowspan="+msg[i].desr+"><span>"+msg[i].parent+"（<span style='font-weight:700; color:#b80f0f;' id='ip_"+msg[i].id.substr(0,8)+"'></span>）</span></td>"+
					    "<td width='210px' bgcolor='#FFFFFF' style='font-size: 12px' align='center'>"+msg[i].name+"</td>"+
					    "<td bgcolor='#FFFFFF' align='center'><a href='#' onclick=turnTo('"+msg[i].id+"','"+msg[i].parent+"','"+msg[i].name+"') style='font-size: 12px;font-weight:700; color:#b80f0f;' ><span id='ip_"+msg[i].id+"'></span></a></td></tr>";
					}else{
						htmlStr+="<tr><td bgcolor='#FFFFFF' style='font-size: 12px' align='center'>"+msg[i].name+"</td>"+
					    "<td bgcolor='#FFFFFF' align='center'><a href='#' onclick=turnTo('"+msg[i].id+"','"+msg[i].parent+"','"+msg[i].name+"') style='font-size: 12px;font-weight:700; color:#b80f0f;'><span id='ip_"+msg[i].id+"'></span></a></td></tr>";
					}
				}
				$("#xmlxTj_table").html(htmlStr);
			}
		}
	});
	selAnyChartXml();
}