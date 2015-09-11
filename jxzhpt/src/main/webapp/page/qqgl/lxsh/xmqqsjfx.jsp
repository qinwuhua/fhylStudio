<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../../../easyui/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="../../../easyui/themes/icon.css" />
<link rel="stylesheet" type="text/css" href="../../../css/Top.css" />
<link rel="stylesheet" type="text/css" href="../../../css/style.css" />
<script type="text/javascript" src="../../../easyui/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="../../../easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../../../easyui/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="../../../js/util/jquery.cookie.js"></script>
<script type="text/javascript" src="../../../js/YMLib.js"></script>
	<style type="text/css">
<!--
a:link {
 text-decoration: none;
}
a:visited {
 text-decoration: none;
}
a:hover {
 text-decoration: none;
}
a:active {
 text-decoration: none;
}
#bbtable {
	border-collapse:collapse;
}
#bbtable thead tr td {
	text-align:center; 	
	font-size:1em;
	font-weight:bold;
  	border:1px solid black;
  	padding:3px 7px 2px 7px;
}
#bbtable tbody tr td {
	text-align:center; 	
	font-size:1em;
/* 	font-weight:bold; */
  	border:1px solid black;
  	padding:3px 7px 2px 7px;
}
-->
</style>
<script type="text/javascript">
$(function(){
	loadDist1("xzqh",$.cookie("dist"));
	//queryDate();
});
function selXm(){
	$('#dd').dialog("open");
	var xz = $("#xzqh").combotree("getValues");
	var xzqh =xz.join(',');
	$('#sel_table').datagrid({
		url:'/jxzhpt/qqgl/queryXmqq.do',
	    striped:true,
	    rownumbers:true,
	    height:330,
	    width:785,
	    queryParams: {
	    	xzqh:xzqh,
	    	jsxz:$('#jsxz').val(),
	    	shzt1:$('#shzt').val(),
	    	lxbm:$('#lxbm').val(),
	    	wgny:$('#wgsj').datebox("getValue")
	    },
	    columns:[[
			{field:'xmmc',title:'项目名称',width:110,align:'center'},
			{field:'xzqh',title:'行政区划',width:110,align:'center'},
			{field:'lxbm',title:'路线编码',width:110,align:'center'},
			{field:'qdzh',title:'起点桩号',width:110,align:'center'},
			{field:'zdzh',title:'止点桩号',width:110,align:'center'},
			{field:'wgny',title:'完工年月',width:110,align:'center'},
			{field:'jsxz',title:'建设性质',width:110,align:'center'},
			{field:'yilc',title:'一级里程',width:110,align:'center'},
			{field:'erlc',title:'二级里程',width:110,align:'center'},
			{field:'sanlc',title:'三级里程',width:110,align:'center'},
			{field:'silc',title:'四级里程',width:110,align:'center'},
			{field:'wllc',title:'无路里程',width:110,align:'center'}
	    ]]
	});
}
function search(){
	var sels = $('#sel_table').datagrid("getSelections");
	var xmbm="";
	for(var i=0;i<sels.length;i++){
		xmbm+= i==sels.length-1 ? "'"+sels[i].xmbm+"'" : "'"+sels[i].xmbm+"',";
	}
	queryDate(xmbm);
	$('#dd').dialog("close");
}
function queryDate(xmbm){
	$('#table_tbody').html("");
	var xz = $("#xzqh").combotree("getValues");
	var xzqh =xz.join(',');
	$.ajax({
		type:'post',
		url:'/jxzhpt/qqgl/queryXmQqfx.do',
		data:'xzqh='+xzqh+'&jsxz='+$('#jsxz').val()+'&shzt1='+$('#shzt').val()+'&lxbm='+$('#lxbm').val()+'&wgny='+$('#wgsj').datebox("getValue")+'&xmbm='+xmbm,
		dataType:'json',
		success:function(msg){
			var befromLen=0;
			if(msg.befrom!=null){
				befromLen=msg.befrom.length;
			}
			loadbeform(Number(befromLen)+Number(msg.befrom2.length),msg.befrom,msg.befrom2);
			loadXjxm(msg.xjxm);
			loadNdwg(Number(msg.ndwglx.length)+Number(msg.ndwgxzqh.length),msg.ndwglx,msg.ndwgxzqh);
		}
	});
}
function loadbeform(rows,befrom,befrom2){
	if(befrom!=null){
		$.each(befrom,function(index,item){
			var tr='<tr>';
			if(index==0){
				tr+='<td align="center" rowspan="'+rows+'">截止2014年底</td>';
			}
			tr+='<td align="center">'+item.ROADCODE+'</td>';
			tr+='<td align="center">/</td>';
			tr+='<td align="center">'+item.ROADSTART+'</td>';
			tr+='<td align="center">'+item.ROADENDS+'</td>';
			tr+='<td align="center">'+item.WGNF+'</td>';
			tr+='<td align="center">/</td>';
			tr+='<td align="center">'+item.YJ+'</td>';
			tr+='<td align="center">'+Math.round(item.YJ/item.LC*10000)/100+'%</td>';
			tr+='<td align="center">/</td>';
			tr+='<td align="center">'+item.EJ+'</td>';
			tr+='<td align="center">'+Math.round(item.EJ/item.LC*10000)/100+'%</td>';
			tr+='<td align="center">/</td>';
			tr+='<td align="center">'+item.SJ+'</td>';
			tr+='<td align="center">'+Math.round(item.SJ/item.LC*10000)/100+'%</td>';
			tr+='<td align="center">/</td>';
			tr+='<td align="center">'+item.SIJ+'</td>';
			tr+='<td align="center">'+Math.round(item.SIJ/item.LC*10000)/100+'%</td>';
			tr+='<td align="center">/</td>';
			tr+='<td align="center">'+item.WL+'</td>';
			tr+='<td align="center">'+Math.round(item.WL/item.LC*10000)/100+'%</td>';
			tr+='<td align="center">/</td>';
			tr+='</tr>';
			$('#table_tbody').append(tr);
		});
	}
	loadbeform2(befrom2);
}
function loadbeform2(beform2){
	$.each(beform2,function(index,item){
		var tr='<tr>';
		var xz="";
		if(item.ROADCODE=="G"){
			xz=item.XZQHMC+"国道合计";
		}else{
			xz=item.XZQHMC+"省道合计";
		}
		tr+='<td align="center">'+xz+'</td>';
		tr+='<td align="center">/</td>';
		tr+='<td align="center">/</td>';
		tr+='<td align="center">/</td>';
		tr+='<td align="center">/</td>';
		tr+='<td align="center">/</td>';
		tr+='<td align="center">'+item.YJ+'</td>';
		tr+='<td align="center">/</td>';
		tr+='<td align="center">/</td>';
		tr+='<td align="center">'+item.EJ+'</td>';
		tr+='<td align="center">/</td>';
		tr+='<td align="center">/</td>';
		tr+='<td align="center">'+item.SJ+'</td>';
		tr+='<td align="center">/</td>';
		tr+='<td align="center">/</td>';
		tr+='<td align="center">'+item.SIJ+'</td>';
		tr+='<td align="center">/</td>';
		tr+='<td align="center">/</td>';
		tr+='<td align="center">'+item.WL+'</td>';
		tr+='<td align="center">/</td>';
		tr+='<td align="center">/</td>';
		tr+='</tr>';
		$('#table_tbody').append(tr);
	});
}
function loadXjxm(xjxm){
	$.each(xjxm,function(index,item){
		var tr='<tr>';
		if(index==0){
			tr+='<td align="center" rowspan="'+xjxm.length+'">新增项目</td>';
		}
		tr+='<td align="center">'+item.xmmc+'</td>';
		tr+='<td align="center">'+item.xzqh+'</td>';
		tr+='<td align="center">'+item.qdzh+'</td>';
		tr+='<td align="center">'+item.zdzh+'</td>';
		tr+='<td align="center">'+item.wgny+'</td>';
		tr+='<td align="center">'+item.jsxz+'</td>';
		tr+='<td align="center">'+item.yilc+'</td>';
		tr+='<td align="center">/</td>';
		tr+='<td align="center">/</td>';
		tr+='<td align="center">'+item.erlc+'</td>';
		tr+='<td align="center">/</td>';
		tr+='<td align="center">/</td>';
		tr+='<td align="center">'+item.sanlc+'</td>';
		tr+='<td align="center">/</td>';
		tr+='<td align="center">/</td>';
		tr+='<td align="center">'+item.silc+'</td>';
		tr+='<td align="center">/</td>';
		tr+='<td align="center">/</td>';
		tr+='<td align="center">'+item.wllc+'</td>';
		tr+='<td align="center">/</td>';
		tr+='<td align="center">/</td>';
		tr+='</tr>';
		$('#table_tbody').append(tr);
	});
}
function loadNdwg(rows,befrom,befrom2){
	if(befrom!=null){
		$.each(befrom,function(index,item){
			var tr='<tr>';
			if(index==0){
				tr+='<td align="center" rowspan="'+rows+'">截止完工年底</td>';
			}
			tr+='<td align="center">'+item.ROADCODE+'</td>';
			tr+='<td align="center">/</td>';
			tr+='<td align="center">'+item.ROADSTART+'</td>';
			tr+='<td align="center">'+item.ROADENDS+'</td>';
			tr+='<td align="center">'+item.WGNF+'</td>';
			tr+='<td align="center">/</td>';
			tr+='<td align="center">'+item.YJ+'</td>';
			tr+='<td align="center">'+Math.round(item.YJ/item.LC*10000)/100+'%</td>';
			tr+='<td align="center">/</td>';
			tr+='<td align="center">'+item.EJ+'</td>';
			tr+='<td align="center">'+Math.round(item.EJ/item.LC*10000)/100+'%</td>';
			tr+='<td align="center">/</td>';
			tr+='<td align="center">'+item.SJ+'</td>';
			tr+='<td align="center">'+Math.round(item.SJ/item.LC*10000)/100+'%</td>';
			tr+='<td align="center">/</td>';
			tr+='<td align="center">'+item.SIJ+'</td>';
			tr+='<td align="center">'+Math.round(item.SIJ/item.LC*10000)/100+'%</td>';
			tr+='<td align="center">/</td>';
			tr+='<td align="center">'+item.WL+'</td>';
			tr+='<td align="center">'+Math.round(item.WL/item.LC*10000)/100+'%</td>';
			tr+='<td align="center">/</td>';
			tr+='</tr>';
			$('#table_tbody').append(tr);
		});
	}
	loadNdwg2(befrom2);
}
function loadNdwg2(beform2){
	$.each(beform2,function(index,item){
		var tr='<tr>';
		var xz="";
		if(item.LXBM=="G"){
			xz=item.XZQHMC+"国道合计";
		}else{
			xz=item.XZQHMC+"省道合计";
		}
		tr+='<td align="center">'+xz+'</td>';
		tr+='<td align="center">/</td>';
		tr+='<td align="center">/</td>';
		tr+='<td align="center">/</td>';
		tr+='<td align="center">/</td>';
		tr+='<td align="center">/</td>';
		tr+='<td align="center">'+item.JHYILC+'</td>';
		tr+='<td align="center">/</td>';
		tr+='<td align="center">/</td>';
		tr+='<td align="center">'+item.JHERLC+'</td>';
		tr+='<td align="center">/</td>';
		tr+='<td align="center">/</td>';
		tr+='<td align="center">'+item.JHSANLC+'</td>';
		tr+='<td align="center">/</td>';
		tr+='<td align="center">/</td>';
		tr+='<td align="center">'+item.JHSILC+'</td>';
		tr+='<td align="center">/</td>';
		tr+='<td align="center">/</td>';
		tr+='<td align="center">'+item.JHWLLC+'</td>';
		tr+='<td align="center">/</td>';
		tr+='<td align="center">/</td>';
		tr+='</tr>';
		$('#table_tbody').append(tr);
	});
}
</script>
</head>
<body  style="padding-right:1px">
	<div style="text-align: left; font-size: 12px; margin: 0px;">
		<table width="100%" border="0" style="margin-top: 1px; margin-left: 1px;" cellspacing="0" cellpadding="0">
			<tr>
				<div id="righttop">
					<div id="p_top">前期管理>&nbsp;项目立项审核>&nbsp;项目前期数据分析</div>
				</div>
        	</tr>
        	<tr>
        		<td align="left" style="padding-left: 10px; padding-right: 10px;">
        			<fieldset style="width:100%; text-align: left; vertical-align: middle;margin: 8px 0px 0px 0px;">
	        			<legend style="padding: 0 0 0 0; font-weight: bold; color: Gray; font-size: 12px;">
	        					<font style="color: #0866A0; font-weight: bold"></font>
	        			</legend>
        				<div>
        					<p style="margin: 8px 0px 8px 20px;">
        						<span>行政区划：</span>
        						<input id="xzqh" type="text" width="100"/>
        						<span>审核状态：</span>
        						<select id="shzt" style="width: 100px;">
        							<option value="" selected="selected">全部</option>
        							<option value="1">已审核</option>
        							<option value="0">未审核</option>
        						</select>
        						<span>建设性质</span>
        						<select id="jsxz" style="width: 100px;">
        							<option value="">全部</option>
        							<option value="路面改造">路面改造</option>
        							<option value="改建">改建</option>
        						</select>
        						<span>完工时间：</span>
        						<input id="wgsj" class="easyui-datebox" type="text" width="100"/>
        					</p>
        					<p style="margin: 8px 0px 8px 20px;">
        						<span>路线编码：</span>
        						<input id="lxbm" type="text" style="width: 145px;"/>
								<img alt="查询" src="../../../images/Button/Serch01.gif" onmouseover="this.src='../../../images/Button/Serch02.gif'"
									 onclick="selXm()" onmouseout="this.src='../../../images/Button/Serch01.gif'" style="border-width:0px;cursor: hand;vertical-align: -50%;" />
								<img alt="导出Excel" src="../../../images/Button/dcecl1.gif" onmouseover="this.src='../../../images/Button/dcecl2.gif'"
                                	onmouseout="this.src='../../../images/Button/dcecl1.gif' " onclick="exportExcel()" style="vertical-align: -50%;" />
        					</p>
        				</div>
        			</fieldset>
        		</td>
        	</tr>
			<tr>
                <td style="padding-top: 10px;padding-left:10px;padding-right:10px;">
                	<div id="gddiv" style="width:100%;height:400px" >
                	<script type="text/javascript">
                	$("#gddiv").attr('style','width:100%;height:'+($(window).height()-110)+'px');
                	</script>
                		<div  class="easyui-layout" fit="true" >
							<div data-options="region:'center',border:false" style="overflow: auto;">
							<table id="bbtable" class="table_body" width="2700px" >
								<caption align="top" style="font-size:x-large;font-weight: bolder;"><span id="titleYear" style="font-size:x-large;font-weight: bolder;"></span>年交通固定资产投资建设计划(路网结构改造)</caption>
								<thead>
									<tr>
										<td align="center" colspan="22">项目前期数据分析表</td>
									</tr>
									<tr>
										<td align="center" rowspan="3" width="100">截点</td>
										<td align="center" rowspan="3" width="150">名称</td>
										<td align="center" rowspan="3" width="100">行政区划</td>
										<td align="center" rowspan="3" width="100">起点桩号</td>
										<td align="center" rowspan="3" width="100">止点桩号</td>
										<td align="center" rowspan="3" width="100">完工年份</td>
										<td align="center" rowspan="3" width="100">建设性质</td>
										<td align="center" colspan="15">规模</td>
									</tr>
									<tr>
										<td align="center" colspan="3">一级</td>
										<td align="center" colspan="3">二级</td>
										<td align="center" colspan="3">三级</td>
										<td align="center" colspan="3">四级</td>
										<td align="center" colspan="3">无路</td>
									</tr>
									<tr>
										<td align="center" width="80">里程</td>
										<td align="center" width="80">百分比</td>
										<td align="center" width="80">变化率(±)</td>
										<td align="center" width="80">里程</td>
										<td align="center" width="80">百分比</td>
										<td align="center" width="80">变化率(±)</td>
										<td align="center" width="80">里程</td>
										<td align="center" width="80">百分比</td>
										<td align="center" width="80">变化率(±)</td>
										<td align="center" width="80">里程</td>
										<td align="center" width="80">百分比</td>
										<td align="center" width="80">变化率(±)</td>
										<td align="center" width="80">里程</td>
										<td align="center" width="80">百分比</td>
										<td align="center" width="80">变化率(±)</td>
									</tr>
								</thead>
								<tbody id="table_tbody"></tbody>
							</table>
							</div>
						</div>
					</div>
				</td>
			</tr>
		</table>
	</div>
	<div id="dd" class="easyui-dialog" title="选择项目" style="width:800px;height:400px;" 
		data-options="iconCls:'icon-save',resizable:true,modal:true,closed: true,toolbar:[{
				text:'查询',
				iconCls:'icon-search',
				handler:function(){search()}
			}]">
		<!-- <div style="height: 20px;">
			<img alt="查询" src="../../../images/Button/Serch01.gif" onmouseover="this.src='../../../images/Button/Serch02.gif'"
				onclick="" onmouseout="this.src='../../../images/Button/Serch01.gif'" style="border-width:0px;cursor: hand;vertical-align: -50%;" />
		</div> -->
		<table id="sel_table"></table>
	</div>  
</body>
</html>