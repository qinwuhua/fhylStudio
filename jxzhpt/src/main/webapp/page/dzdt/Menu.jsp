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
<link rel='stylesheet' href='http://js.arcgis.com/3.12/esri/css/esri.css'>
<script type="text/javascript" src="../../easyui/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="../../easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../../easyui/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="../../easyui/jscharts.js"></script>
<script type="text/javascript" src="../../easyui/jscharts.plug.mb.js"></script>
<script type="text/javascript" src="../../widget/anyChart/js/AnyChart.js"></script>
<script type="text/javascript" src="../../js/YMLib.js"></script>
<script type="text/javascript" src="js/Menu.js"></script>
<script type="text/javascript" src="../../js/util/jquery.cookie.js"></script>
<script rel='stylesheet' src='http://js.arcgis.com/3.12/init.js'></script>
<script type="text/javascript">
var map;
$(function(){
	var LeftHeight = $(window).height();
	$('#tab01').css('height', LeftHeight-39);
	loadDataunit();
	$(".datagrid-header").css("display","none");
	//createAnyChartXml();
	dojo.addOnLoad(init);
});
function init() {
    //创建地图对象
    require(["esri/map","esri/layers/ArcGISDynamicMapServiceLayer", "dojo/domReady!"], function(Map,ArcGISDynamicMapServiceLayer) {
        map = new Map("map");
        //叠加图层
        var layer = new ArcGISDynamicMapServiceLayer("http://211.101.37.251:6080/arcgis/rest/services/SXGXPTMAP/MapServer");
        map.addLayer(layer);
    });
}
function createAnyChartXml(){
	//var right=window.document.getElementById("anychart_div"); //获取右侧frame对象
	//var height=$(window).height();
    barChart_1= new AnyChart("/jxzhpt/widget/anyChart/swf/AnyChart.swf");    
    barChart_1.width =350;
    barChart_1.height =300;
    barChart_1.padding =0;
    barChart_1.wMode="transparent";
    barChart_1.write("anychart_div");
    $.ajax({
		type:"post",
		url:"../../xtgl/createAnyChartXml.do",
		dataType:'text',
		success:function(msg){
			//var right=window.parent.window.document.getElementById("rightContent").contentWindow;
			barChart_1.setData(msg);
		}
	});
}
function selLines(_id,_parent){
	$.ajax({
		type:"post",
		url:"../../xtgl/selLines.do",
		dataType:'json',
		success:function(msg){
			addLine();
		}
	});
}
function addLine(){
    require(["esri/geometry/Polyline","esri/graphic","esri/Color","esri/symbols/SimpleLineSymbol"], function(Polyline,Graphic,Color, SimpleLineSymbol) {
        //创建线对象
        var singlePathPolyline = new Polyline([[113.8603169850484,37.85472940612672],[112.58044213169312,37.93973954398797], [112.23567879481143,37.547748352738935]]);
        //创建样式
        var symbol=new SimpleLineSymbol(SimpleLineSymbol.STYLE_SOLID, new Color([0, 0, 255]), 5);
        //创建Graphic
        var graphic = new Graphic(singlePathPolyline, symbol);
        //将Graphic叠加到地图
        map.graphics.add(graphic);
    });
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
	    	<img src="../../images/ymtx.jpg" style="width:100%;"/>
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
					
					 <div title="地图" style="overflow: hidden;" href="" iconCls="icon-note">
						<div id="map" style="width:100%;height:100%;"></div>
					</div>
				</div>
		    </div>
		    <!-- 地图区域结束 -->
		</div> 
    </div>  
</body>
</html>