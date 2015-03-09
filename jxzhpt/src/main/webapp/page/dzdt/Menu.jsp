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
	createAnyChartXml();
	dojo.addOnLoad(init);
	xmlxTj();
});

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
function xmlxTj(){
	$.ajax({
		type:"post",
		url:"../../xtgl/xmlxCountTj.do",
		dataType:'json',
		data:'param.id='+$.cookie("qx4"),
		success:function(msg){
			if(msg!=null){
				var htmlStr="";
				for(var i=0;i<msg.length;i++){
					if(msg[i].desr!=""){
						htmlStr+="<tr><td height='25' width='120px' bgcolor='#FfFfFf' align='center' rowspan="+msg[i].desr+"><span>"+msg[i].parent+"（<span style='font-weight:700; color:#b80f0f;'>5</span>）</span></td>"+
					    "<td width='250px' bgcolor='#FFFFFF' style='font-size: 12px' align='center'>"+msg[i].name+"</td>"+
					    "<td bgcolor='#FFFFFF' align='center'><a href='#' onclick=turnTo('"+msg[i].parent+"','"+msg[i].name+"') style='font-size: 12px;font-weight:700; color:#b80f0f;' >"+msg[i].bz+"</a></td></tr>";
					}else{
						htmlStr+="<tr><td width='250px' bgcolor='#FFFFFF' style='font-size: 12px' align='center'>"+msg[i].name+"</td>"+
					    "<td bgcolor='#FFFFFF' align='center'><a href='#' onclick=turnTo('"+msg[i].parent+"','"+msg[i].name+"') style='font-size: 12px;font-weight:700; color:#b80f0f;'>"+msg[i].bz+"</a></td></tr>";
					}
				}
				$("#xmlxTj_table").html(htmlStr);
			}
		}
	});
}
function turnTo(_parent,_name){
	alert(_parent);
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