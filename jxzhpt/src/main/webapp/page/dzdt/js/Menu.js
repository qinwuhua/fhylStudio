

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
    style.addRules([new OpenLayers.Rule({
        symbolizer: sketchSymbolizers
    })]);
    styleMap = new OpenLayers.StyleMap({
        "default": style
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
    $("#map").css({
        width: w,
        height: h
    });
    //
    map = new OpenLayers.Map('map', options);
    baseLayers = new OpenLayers.Layer.WMS("Geoserver layers - Tiled",
            mapServerUrl + "/wms", {
                LAYERS: tczName,
                STYLES: '',
                format: format,
                tiled: true,
                tilesOrigin: map.maxExtent.left + ','
                + map.maxExtent.bottom
            }, {
                buffer: 0,
                displayOutsideMaxExtent: true,
                isBaseLayer: true,
                numZoomLevels: 10
            });
    map.addControl(new OpenLayers.Control.Navigation());
    map.addLayers([baseLayers]);
    map.zoomToExtent(bounds);
    map.addControl(new OpenLayers.Control.PanZoomBar({
        position: new OpenLayers.Pixel(2, 15)
    }));
    map.events.register("click", map, onMapClick);
}

//i查询，生成查询的范围
function onMapClick(e) {
    var resolution = map.getResolution();
    var lonlat = map.getLonLatFromViewPortPx(e.xy);
    pointClick = new OpenLayers.Geometry.Point(lonlat.lon, lonlat.lat);
    geometry = OpenLayers.Geometry.Polygon.createRegularPolygon(pointClick, 5 * resolution, 20, 0);
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
        drillDown: false,
        maxFeatures: 1000
        //最大返回要素数目1000个
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
    var layers = lxQueryLayes.concat(generateM);
    if (layers.indexOf(layerName) !== -1) {
        spatialQuery(layerName, geometry);
    }
}
/**
 * 调用WFS进行属性查询
 * 注意：这里只封装了单一属性查询，实际上WFS是支持多种属性条件查询和空间查询
 */
var resultLayer = null;
function wfsAttrQuery(layerName, keyCol, keyValue) {
    if (resultLayer == null) {
        resultLayer = new OpenLayers.Layer.Vector("resultLayer", {
            styleMap: styleMap
        });
        map.addLayer(resultLayer);
        //添加数据移动上去显示气泡
        var selectControl = new OpenLayers.Control.SelectFeature(
                resultLayer, {
                    onSelect: onFeatureSelect,
                    onUnselect: onFeatureUnselect,
                    hover: false
                });

        map.addControl(selectControl);
        selectControl.activate();
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
        callback: function (req) {
            var features = req.features;
            resultLayer.addFeatures(features);
            if (resultLayer.features && resultLayer.features.length > 0) {
                map.zoomToExtent(resultLayer.getDataExtent());
            }
        }
    });
    wfsProtocol.read();
}


function spatialQuery(layerName, geo) {
    if (resultLayer == null) {
        resultLayer = new OpenLayers.Layer.Vector("resultLayer", {
            styleMap: styleMap
        });
        map.addLayer(resultLayer);
        //添加数据移动上去显示气泡
        var selectControl = new OpenLayers.Control.SelectFeature(
                resultLayer, {
                    onSelect: onFeatureSelect,
                    onUnselect: onFeatureUnselect,
                    hover: true
                });
        map.addControl(selectControl);
        selectControl.activate();
    }


    var wfsProtocol = new OpenLayers.Protocol.WFS({
        url: mapServerUrl + "/wfs",//正式环境代码：mapServerUrl+"/wfs",
        featureType: layerName,
        featureNS: nameSpace,//正式环境代码：nameSpace
        /**
         * 更复杂的逻辑条件请参考OpenLayers的API
         * */
        filter: new OpenLayers.Filter.Spatial({
            type: OpenLayers.Filter.Spatial.INTERSECTS,
            value: geo,//
            projection: 'EPSG:4326'
        }),
        maxFeatures: 1000,
        callback: function (req) {
            var features = req.features;
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
    //console.info("没有查询到数据");
}

//构造弹出窗口的函数
var selectedFeature = null;

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

//初始化的时候调用，获取所有图层的所有要素并缓存起来
function getLayersFeatures() {
    var queryLayers = qlQueryLayers.concat(lxQueryLayes);
    var len = queryLayers.length;
    for (var i = 0; i < len; i++) {
        var layerName = queryLayers[i];
        getLayerResults(layerName);
    }
}

//根据图层名称,获取单个图层的要素
function getLayerResults(layerName) {
    var attributeName = null;
    if (qlQueryLayers.indexOf(layerName) !== -1) {
        attributeName = "ROADPOS";
    } else {
        attributeName = "ROADSTART";
    }
    if (!queryResultCache[layerName]) {
        var wfsProtocol = new OpenLayers.Protocol.WFS({
            url: mapServerUrl + "/wfs",//正式环境代码：mapServerUrl+"/wfs",
            featureType: layerName,
            featureNS: nameSpace,//正式环境代码：nameSpace
            maxFeatures: 2000,
            callback: function (req) {
                //debugger;
                var features = req.features;
                //根据attributeName代表的值的大小排序，从小到大排序
                features = features.sort(
                        function (a, b) {
                            return a.attributes[attributeName] - b.attributes[attributeName];
                        }
                );
                queryResultCache[layerName] = features;
            }
        });
        wfsProtocol.read();
    }
}

//根据查询参数得到该路线编码所在的图层
function configLXLayerName(param) {
    var queryAttribute = "BM", layerName = "";
    if (param.BM.length > 5) {
        queryAttribute = "ROADCODE";
    }
    var len = lxQueryLayes.length;
    for (var i = 0; i < len; i++) {
        layerName = lxQueryLayes[i];
        var features = queryResultCache[layerName];
        if (features == null) {
            continue;
        }
        var mm = $.grep(features, function (obj) {
            return obj.attributes[queryAttribute] == param.BM;
        });
        if (mm.length !== 0) {
            return layerName;
        }
    }
    return "";
}

//根据传入的条件确认某个桥梁属于哪个图层
function configQLLayerName(params) {
    var len = qlQueryLayers.length;
    for (var i = 0; i < len; i++) {
        var layerName = qlQueryLayers[i];
        var features = queryResultCache[layerName];
        if (features == null) {
            continue;
        }
        var index = qlBinary(features, {
            key: "ROADPOS",
            value: params.ROADPOS
        });
        if (index !== -1) {
            if (features[index].attributes.ROADBM == params.ROADBM) {
                return layerName;
            }
        }
    }
    return null;
}

//二分法查找桥梁数据
function qlBinary(features, obj) {
    var low = 0;
    var high = features.length;
    while (low <= high) {
        var middle = Math.round((low + high) / 2);
        if (obj.value == features[middle].attributes[obj.key]) {
            return middle;
        } else if (obj.value > features[middle].attributes[obj.key]) {
            low = middle + 1;
        } else {
            high = middle - 1;
        }
    }
    return -1;
}

function lxPointBinary(features, obj) {
    //features里的点要按照桩号直升序排列
    var lowreturn = 0, high = features.length;
    for (var low = 0; low < high - 1; low++) {
        if (obj.value * 1000000 >= features[low].m * 1000000 && obj.value * 1000000 <= features[low + 1].m * 1000000) {
            lowreturn = low;
            break;
        }
    }
    return lowreturn;
}

//生成桥梁查询的过滤条件
function generatorQLFilter(listQueryParams) {
    var len = listQueryParams.length;
    var Filter = new OpenLayers.Filter.Logical({
        type: OpenLayers.Filter.Logical.AND
    });
    var ROADBM = listQueryParams.ROADBM;
    var ROADPOS = listQueryParams.ROADPOS;
    var filterLxbm = new OpenLayers.Filter.Comparison({
        type: OpenLayers.Filter.Comparison.EQUAL_TO,
        property: "ROADBM",
        value: ROADBM
    });
    var filtzh = new OpenLayers.Filter.Comparison({
        type: OpenLayers.Filter.Comparison.EQUAL_TO,
        property: "ROADPOS",
        value: ROADPOS
    });
    Filter.filters.push(filterLxbm);
    Filter.filters.push(filtzh);
    return Filter;
}

function testQueryByLXBMZH() {
    //S40的起止点桩号是1.677到191.59
    var listQueryParams = [
        {
            "BM": "X784360824",
            "ROADSTART": 5.700,
            "ROADENDS": 18.000
        }
    ];

    var ldlx = 1;//代表上下行
    var len = listQueryParams.length;
    var queryAttribute = "BM";
    //debugger;
    for (var i = 0; i < len; i++) {
        var param = listQueryParams[i];
        var layerName = configLXLayerName(param);
        //图层中编码有的用中文有的用的是英文，所以需要根据图层名字来区分
        switch (layerName) {
            case "jx_xiangdao":
                queryAttribute = "编码";
                break;
            case "jx_zhuandao":
                queryAttribute = "编码";
                break;
            default:
                queryAttribute = "BM";
                break;
        }

        var lxFeatures = queryResultCache[layerName];
        //通过长度来判断传递的是否是带有行政区划的编码
        if (param.BM.length > 5) {
            queryAttribute = "ROADCODE";
        }
        //根据BM和上下行方向，过滤出某个编码的所有路线
        //上下行方向根据起点桩号止点桩号可判断出来
        var features = null;
        

        if (layerName == "jx_gaosugonglu") {
            features = $.grep(lxFeatures, function (item) {
                return item.attributes[queryAttribute] == param.BM && item.attributes["LDLX"] == ldlx;
            });
        } else {
            features = $.grep(lxFeatures, function (item) {
                return item.attributes[queryAttribute] == param.BM;
            });
        }

        //没有查到符合条件的数据
        if (features.length === 0) {
            return;
        }
        var points = generateM(features);
        var line = generateLine(points, param, ldlx);
    }
}

function generateM(features) {
    var points = [], startZH = 0, endZH = 0;
    var len = features.length;
    startZH = features[0].attributes.ROADSTART;
    endZH = features[len - 1].attributes.ROADENDS;
    startZH = new Number(startZH);
    endZH = new Number(endZH);

    for (var i = 0; i < len; i++) {
        var components = features[i].geometry.components[0].components;
        var comLen = components.length;
        for (var k = 0; k < comLen; k++) {
            points.push(components[k]);
        }
    }

    var p1, p2, length = 0.0, pointsLen = points.length;

    for (var m = 0; m < pointsLen - 1; m++) {
        p1 = points[m];
        p2 = points[m + 1];
        p1.m = length;
        length += Math.sqrt(Math.pow(p1.x - p2.x, 2) + Math.pow(p1.y - p2.y, 2));
        p2.m = length;
    }

    //计算比例因子
    var factor = (endZH - startZH) / length;
    for (var n = 0; n < pointsLen; n++) {
        var p = points[n];
        p.m = startZH + p.m * factor
    }
    if (points[0].m > points[1].m) {
        //按照升序排列点
        points = points.sort(function (pp1, pp2) {
            return pp1.m - pp2.m;
        });
    }
    return points;
}

function getDistance(p1, p2) {
    return Math.sqrt((p1.x - p2.x) * (p1.x - p2.x) + (p1.y - p2.y) * (p1.y - p2.y));
}

function generateLine(pnts, param) {
    var finalPoints = [];
    var startIndex = lxPointBinary(pnts, {
        value: param.ROADSTART
    });
    var endIndex = lxPointBinary(pnts, {
        value: param.ROADENDS
    });
    if (startIndex > endIndex) {
        var temp = startIndex;
        startIndex = endIndex;
        endIndex = temp;
    }
    var len = pnts.length;
    var point = null;
    for (var m = startIndex; m < endIndex; m++) {
        point = pnts[m];
        finalPoints.push(point);
    }
    if (resultLayer == null) {
        resultLayer = new OpenLayers.Layer.Vector("resultLayer", {
            styleMap: styleMap
        });
        map.addLayer(resultLayer);
        //添加数据移动上去显示气泡
        var selectControl = new OpenLayers.Control.SelectFeature(
                resultLayer, {
                    onSelect: onFeatureSelect,
                    onUnselect: onFeatureUnselect,
                    hover: true
                });
        map.addControl(selectControl);
        selectControl.activate();
    }
    var lineStrings = new OpenLayers.Geometry.LineString(finalPoints);
    resultLayer.addFeatures(new OpenLayers.Feature.Vector(lineStrings, {
        "路线编码": param.BM,
        "起点桩号": param.ROADSTART,
        "止点桩号": param.ROADENDS
    }));

    if (resultLayer.features && resultLayer.features.length > 0) {
        map.zoomToExtent(resultLayer.getDataExtent());
    }
}

//测试桥梁查询
function testQueryQLByLXMBZH() {
    var listQueryParams = [
        {
            ROADBM: "X784360824",
            ROADPOS: 602.7
        },
        {
            ROADBM: "CJ55361128L0010",
            ROADPOS: 1.262
        },
        {
            ROADBM: "Y252361128L0030",
            ROADPOS: 7.025
        },
        {
            ROADBM: "G72360735L0100",
            ROADPOS: 356.034
        }
    ];
    var len = listQueryParams.length;
    for (var i = 0; i < len; i++) {
        var param = listQueryParams[i];
        var layerName = configQLLayerName(param);
        if (layerName) {
            queryQLByLXBMZH(param, layerName);
        }
    }
}

function addTempLayer(layerName) {

}

//根据路线编码和桩号查询桥梁信息
function queryQLByLXBMZH(queryParams, layerName) {
    if (resultLayer == null) {
        resultLayer = new OpenLayers.Layer.Vector("resultLayer", {
            styleMap: styleMap
        });
        map.addLayer(resultLayer);
        //添加数据移动上去显示气泡
        var selectControl = new OpenLayers.Control.SelectFeature(
                resultLayer, {
                    onSelect: onFeatureSelect,
                    onUnselect: onFeatureUnselect,
                    hover: true
                });

        map.addControl(selectControl);
        selectControl.activate();
    }

    var wfsProtocol = new OpenLayers.Protocol.WFS({
        url: mapServerUrl + "/wfs",//正式环境代码：mapServerUrl+"/wfs",
        featureType: layerName,
        featureNS: nameSpace,//正式环境代码：nameSpace
        /**
         * 更复杂的逻辑条件请参考OpenLayers的API
         * */
        filter: generatorQLFilter(queryParams),
        maxFeatures: 2000,
        callback: function (req) {
            var features = req.features;
            resultLayer.addFeatures(features);
            if (resultLayer.features && resultLayer.features.length > 0) {
                map.zoomToExtent(resultLayer.getDataExtent());
            }
        }
    });
    wfsProtocol.read();
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
	alert();
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