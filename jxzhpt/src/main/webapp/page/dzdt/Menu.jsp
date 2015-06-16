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
<script type="text/javascript">
var mapServerUrl = "http://localhost:8989/hdmapserver";
var nameSpace = "jxmap2014";
var tczName="jx_map";
var pointClick = null, geometry = null;
var map, baseLayers, tolerance, resolution;
var format = 'image/png';
var queryResultCache = {};
window.queryResultCache = queryResultCache;
var qlQueryLayers = ["jx_guoshengtedaqiao", "jx_guoshengzhongxiaoqiao",
    "jx_qlzadaoqiao", "jx_xianxiangtedaqiao", "jx_xianxiangzhongxiaoqiao"];
var lxQueryLayes = ["jx_gaosugonglu", "jx_guodao", "jx_shengdao", "jx_xiandao", "jx_xiangdao",
    "jx_cundao", "jx_zhuandao"];
//全图视野范围
var bounds = new OpenLayers.Bounds(113.573, 24.488, 118.482, 30.079);
 
$(function(){
	$(".layout-button-right").click();
	xmlxTj();
	var LeftHeight = $(window).height();
	loadDataunit();
	$('#tab01').css('height', LeftHeight-39);
	$(".datagrid-header").css("display","none");
	OpenLayers.ProxyHost = "../../proxy.jsp?";
	initDefaultStyle();
	initMap();
	getLayersFeatures();
});


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
	
	<div id="lay_east" data-options="region:'east',title:'提醒信息',split:true, iconCls: 'icon-west'"  style="width:420px;">
	    	<table class="table_11"  id="xmlxTj_table" width="398" border="1" align="center" cellpadding="0" cellspacing="0" >
	    	</table>
	    	<div id="anychart_div" style="width:350px;height:300px;margin:10px;">
				<div>
					<param name="wmode" value="transparent" />
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
							<a href="#" onclick="IQuery()"><img src="../../images/iSearch.png"/></a>
							<!-- <button onclick="testQueryByLXBMZH()">根据路线编码和起止桩号查询</button>
							<button onclick="testQueryQLByLXMBZH()">根据路线编码桩号查询桥梁</button> -->
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
