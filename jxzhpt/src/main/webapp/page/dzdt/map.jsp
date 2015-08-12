<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
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
<style>
.table_11{background-color:#b8bdc1;font-size:12px;border-collapse: collapse; border:1px solid #b8bdc1; margin:10px;}
.table_11 td{border:1px solid #bedaf5; text-align:center;}
</style>
<script>
        /**
         * DEMO代码主要完成技术突破和技术验证使用，请在理解的基础上按需COPY
         * 代码设计还有待完善
         * */

        /**
         *地图服务地址
         **/
        var mapServerUrl = "http://192.168.1.108:8989/hdmapserver";
        /**
         * 服务命名空间 不能随便填，请通过hdmapserver服务查看
         **/
        var nameSpace = "jx_2014Query",iQueryNameSpace = "jxmap2014";
        var qlIQueryLayers = ["jx_guoshengtedaqiao", "jx_guoshengzhongxiaoqiao",
            "jx_qlzadaoqiao", "jx_xianxiangtedaqiao", "jx_xianxiangzhongxiaoqiao"];
        var lxIQueryLayes = ["jx_gaosugonglu", "jx_guodao", "jx_shengdao", "jx_xiandao", "jx_xiangdao",
            "jx_cundao", "jx_zhuandao"];
        var qlQueryLayer = "jx_2014_ql", lxQueryLaye = "jx_2014_lx";

        var pointClick = null, geometry = null;
         jQuery(document).ready(function () {
         	$(".layout-button-right").click();
			xmlxTj();
            OpenLayers.ProxyHost = "../../proxy.jsp?";
            initMap();
            initDefaultStyle();
            
        });
		
		function test(){
			wfsAttrQuery(lxQueryLaye, "ROADCODE", "X779360823");
			//wfsAttrQuery("jx_2014_lx", "ROADCODE", "S304360423");
		}
		
		
        var map, baseLayers, tolerance, resolution;
        var format = 'image/png';

        //全图视野范围
        var bounds = new OpenLayers.Bounds(113.573, 24.488, 118.482, 30.079);
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
                        LAYERS: 'jx_map',
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
         * 属性查询示例
         */
        function attrQuery(_roadcode) {
        	YMLib.Var.bm=_roadcode;
        	clearGraphics();
            if(_roadcode.length<=10){
            	wfsAttrQuery(lxQueryLaye, "ROADCODE", _roadcode);
            }else{
            	wfsAttrQuery(qlQueryLayer, "ROADBM", _roadcode);
            }
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
                output: 'features',
                infoFormat: 'application/json',
                format: new OpenLayers.Format.JSON,
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
        function showInfo(object) {
            var features = object.features.features;
            var len = features.length;
            var tableNames = [];
            for (var i = 0; i < len; i++) {
                var name = features[i].id;
                var layerNameTemp = name.split(".")[0];
                var tableLenTemp = tableNames.length;

                if ($.inArray(layerNameTemp, tableNames) == -1) {
                    tableNames.push(layerNameTemp);
                }
                var layers = qlIQueryLayers.concat(lxIQueryLayes);
                var tableLen = tableNames.length;
                for (var n = tableLen - 1; n >= 0; n--) {
                    var layerName = tableNames[n];
                    if ($.inArray(layerName, layers) !== -1) {
                        spatialQuery(layerName, geometry);
                    }
                }
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
                            hover: false
                        });
                map.addControl(selectControl);
                selectControl.activate();
            }


            var wfsProtocol = new OpenLayers.Protocol.WFS({
                url: mapServerUrl + "/wfs",//正式环境代码：mapServerUrl+"/wfs",
                featureType: layerName,
                featureNS: iQueryNameSpace,//正式环境代码：nameSpace
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
            ///console.info("没有查询到数据");
        }

        //构造弹出窗口的函数
        var selectedFeature = null;
        function onFeatureSelect(feature) {
        	if(YMLib.Var.bm==undefined){
        		if(feature.attributes.ROADBM==undefined) YMLib.Var.bm=feature.attributes.ROADCODE;
        		else YMLib.Var.bm=feature.attributes.ROADBM;
        	}
        	//YMLib.Var.bm=parent.YMLib.Var.bm;
        	if(YMLib.Var.bm.length>11) YMLib.UI.createWindow('ql_add','桥梁项目查询','/jxzhpt/page/dzdt/dzdt_ql.jsp','app_add',630,330);
         	else YMLib.UI.createWindow('lx_add','路线项目查询','/jxzhpt/page/dzdt/dzdt_lx.jsp','app_add',630,330);
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


        function getQLFeatures(params) {
            var wfsProtocol = new OpenLayers.Protocol.WFS({
                url: mapServerUrl + "/wfs",//正式环境代码：mapServerUrl+"/wfs",
                featureType: qlQueryLayer,
                featureNS: nameSpace,//正式环境代码：nameSpace
                maxFeatures: 2000,
                filter: generatorQLFilter(params),
                callback: function (req) {
                    var features = req.features;
                    if (features && features.length > 0) {
                        addQLGraphicToMap(params, features);
                    }
                }
            });
            wfsProtocol.read();
        }

        //根据查询参数,获取路线图层的要素
        function getLXFeatures(param) {
            var sortAttribute = "ROADSTART";
            var wfsProtocol = new OpenLayers.Protocol.WFS({
                url: mapServerUrl + "/wfs",//正式环境代码：mapServerUrl+"/wfs",
                featureType: lxQueryLaye,
                featureNS: nameSpace,//正式环境代码：nameSpace
                maxFeatures: 2000,
                filter: generatorLXFilter(param),
                callback: function (req) {
                    var features = req.features;
                    if (features && features.length > 0) {
                        features = features.sort(
                                function (a, b) {
                                    return a.attributes[sortAttribute] - b.attributes[sortAttribute];
                                }
                        );
                        addLXGraphicToMap(param, features);
                    } else {
                        console.info("没有查询到数据 : " + param.BM);
                    }
                }
            });
            wfsProtocol.read();
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

        //生成路线查询的过滤条件
        function generatorLXFilter(listQueryParams) {
            var Filter = new OpenLayers.Filter.Comparison({
                type: OpenLayers.Filter.Comparison.EQUAL_TO,
                property: listQueryParams.queryAttribute,
                value: listQueryParams.BM
            });
            return Filter;
        }

        function addQLGraphicToMap(params, features) {
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
            resultLayer.addFeatures(features);
            if (resultLayer.features && resultLayer.features.length > 0) {
                map.zoomToExtent(resultLayer.getDataExtent());
            }
        }


        function addLXGraphicToMap(param, features) {
            var points = generateM(features);
            var lineStrings = generateLine(points, param);
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

            resultLayer.addFeatures(new OpenLayers.Feature.Vector(lineStrings, {
                "路线编码": param.BM,
                "起点桩号": param.ROADSTART,
                "止点桩号": param.ROADENDS
            }));

            if (resultLayer.features && resultLayer.features.length > 0) {
                map.zoomToExtent(resultLayer.getDataExtent());
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
            var lineStrings = new OpenLayers.Geometry.LineString(finalPoints);
            return lineStrings;
        }

        //测试桥梁查询
        function testQueryQLByLXMBZH() {
            var listQueryParams = [
                {
                    ROADBM: "G60360681L0160",
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
                getQLFeatures(param);
            }
        }

        function testQueryByLXBMZH() {
            //S40的起止点桩号是1.677到191.59
            var listQueryParams = [
                {
                    "BM": "S40",
                    "ROADSTART": 2.5678,
                    "ROADENDS": 91.59
                },
                {
                    "BM": "G56",
                    "ROADSTART": 272.147,
                    "ROADENDS": 257.969
                },
                {
                    "BM": "G56",
                    "ROADSTART": 477.869,
                    "ROADENDS": 478.247
                },
                {
                    "BM": "S26361130",
                    "ROADSTART": 31.828,
                    "ROADENDS": 32.503
                },
                {
                    "BM": "X308360521",
                    "ROADSTART": 0,
                    "ROADENDS": 1.143
                },
                {
                    "BM": "C388360502",
                    "ROADSTART": 0.751,
                    "ROADENDS": 1.021
                }
            ];
            var len = listQueryParams.length;
            var queryAttribute = "BM";
            for (var i = 0; i < len; i++) {
                var param = listQueryParams[i];
                if (param.BM.length > 7) {
                    queryAttribute = "ROADCODE";
                }
                param.queryAttribute = queryAttribute;
                var layerName = lxQueryLaye;
                getLXFeatures(param);
            }
        }


        function addTempLayer(layerName) {

        }

        //根据路线编码和桩号查询桥梁信息
        function queryQLByLXBMZH(queryParams, layerName) {
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

 		function clearGraphics() {
            //根据图层名字来得到图层，图层的名字在创建的时候设定了
            var resultLayer = map.getLayersByName("resultLayer")[0];
            if(resultLayer!=undefined) resultLayer.removeAllFeatures();
            //console.info("点击清楚按钮");
        }

</script>
</head>
<body class="easyui-layout" style="background:#fafafa;" scroll="no">
    <div region="center" style="padding:0px;background:#eee;">
    	<div class="easyui-layout" fit="true">
			<!-- 地图区域开始 -->
		    <div region="center" style="padding:0px;" border="false">
				<div id="mainTab" border="false" class="easyui-tabs" fit="true">

					 <div title="地图" style="overflow: hidden;" iconCls="icon-note">
						 
						 <div style="position: absolute;top: 35px;right:30px;z-index: 9999">
							<a href="#" onclick="IQuery()"><img src="../../images/iSearch.png"/></a>
						</div>
						
						<div id="map" style="width:100%;height:100%;"></div>
					</div>
				</div>
		    </div>
		    <!-- 地图区域结束 -->
		</div>
    </div>
    
    <div id="lay_east" data-options="region:'east',title:'提醒信息',split:true, iconCls: 'icon-west'"  style="width:420px;">
	    	<table class="table_11"  id="xmlxTj_table" width="398" border="1" align="center" cellpadding="0" cellspacing="0" >
	    	</table>
	    	<div id="anychart_div" style="width:350px;height:300px;margin:10px;">
				<div>
					<param name="wmode" value="transparent" />
				</div>
			</div>
	</div>
</body>
</html>
