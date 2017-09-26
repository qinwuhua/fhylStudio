<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>养护大中修</title>
	<link rel="stylesheet" type="text/css" href="../../../css/Top.css" />
	<link rel="stylesheet" type="text/css" href="../../../css/style.css" />
	<link rel="stylesheet" type="text/css" href="../../../easyui/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="../../../easyui/themes/icon.css" />
	<script type="text/javascript" src="../../../easyui/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="../../../easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="../../../easyui/datagrid-detailview.js"></script>
	<script type="text/javascript" src="../../../easyui/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="../../../js/util/jquery.cookie.js"></script>
	<script type="text/javascript" src="../../../js/YMLib.js"></script>
	<script type="text/javascript" src="../../../page/qqgl/js/util.js"></script>
	<script type="text/javascript">
		$(function(){
			loadTsdq("tsdq");
			loadDist1("xzqh",$.cookie("dist"));
			loadUnit1("gydw",$.cookie("unit"));
			loadBmbm2('jsdj','技术等级');
			loadBmbm2('sqzt','申请状态省');
			xmnf("xmnf");
			loadGldj('gldj');
			YMLib.Var.jdbs=2;
			queryShxm();
		});
		function queryShxm(){
			grid.id="grid";
			grid.url="../../../qqgl/queryJhsh2.do";
			var params={'xmlx':5,'xzqhdm':getxzqhdm('xzqh'),'xmmc':$('#xmmc').val(),'ghlxbh':$('#ylxbh').val(),
					'tsdq':$('#tsdq').combo("getText"),'jsdj':$('#jsdj').combobox("getValues").join(","),
					'xdzt':1,'lsjl':$('#lsjl').combobox("getValue"),'xmbm':$('#xmnf').combobox("getValues").join(','),
					'ylxbh':$('#gldj').combobox("getValues").join(',')};
			grid.queryParams=params;
			grid.height=$(window).height()-160;
			grid.width=$('#searchField').width();
			grid.pageSize=10;
			grid.pageNumber=1;
			grid.columns=[[
				{field:'cz',title:'操作',width:100,align:'center',
					formatter: function(value,row,index){
						var result='<a style="text-decoration:none;color:#3399CC;" href="#" onclick="locationXm('+"'"+row.xmbm+"',"+"'2'"+')">定位</a>';
						result+='&nbsp;<a href="javascript:openWindow('+"'shxmxx'"+','+"'灾毁重建项目'"+','+
						"'/jxzhpt/page/qqgl/jhsh/shxm_xx1.jsp'"+',980,400)" style="color:#3399CC;">详细</a>';
						return result;
					}
				},
				{field:'lsjl',title:'是否有历史记录',width:150,align:'center',
					formatter: function(value,row,index){
						if(value=="是"){
							return '<a href="javascript:openLsjl('+"'"+row.xmbm+"'"+')" style="color:#3399CC;">是</a>';
						}else{
							return value;
						}
					}
				},
				{field:'xdzt',title:'下达状态',width:150,align:'center',
					formatter: function(value,row,index){
						return value=="0" ? "未下达" : "已下达";
					}
				},
				{field:'xmbm',title:'项目编码',width:100,align:'center'},
				{field:'xmmc',title:'项目名称',width:250,align:'center'},
				{field:'xzqh',title:'行政区划',width:100,align:'center'},
				{field:'gydw',title:'管养单位',width:100,align:'center'},
				{field:'ylxbh',title:'路线编码',width:100,align:'center'},
				{field:'qdzh',title:'起点桩号',width:100,align:'center'},
				{field:'zdzh',title:'止点桩号',width:100,align:'center'},
				{field:'lc',title:'里程',width:100,align:'center'},
				{field:'jsdj',title:'技术等级',width:100,align:'center'},
				{field:'jhkgsj',title:'计划开工时间',width:100,align:'center'},
				{field:'jhwgsj',title:'计划完工时间',width:100,align:'center'},
				{field:'gq',title:'工期（月）',width:100,align:'center'},
				{field:'ntz',title:'总投资',width:100,align:'center'}]];
			bindLxGrid();
			gridBind(grid);
		}
		$(window).resize(function () { 
			$('#grid').datagrid('resize');
		});
	</script>
</head>
<body>
	<div id="righttop">
		<div id="p_top">计划管理>&nbsp;项目计划库资金下达>&nbsp;养护大中修项目</div>
	</div>
	<table width="99%" border="0" style="margin-top: 1px; margin-left: 1px;" cellspacing="0" cellpadding="0">
       	<tr>
       		<td align="left" style="padding-left: 10px; padding-right: 10px;">
       			<fieldset id="searchField" style="width:100%; text-align: left; vertical-align: middle;">
       				<legend style="padding: 0 0 0 0; font-weight: bold; color: Gray; font-size: 12px;">
       					<font style="color: #0866A0; font-weight: bold"></font>
       				</legend>
       				<div>
       					<table style="margin:7px; vertical-align:middle;" cellspacing="0" class="abgc_td" >
       					<tr height="32">
       						<td align="right">&nbsp;行政区划：</td>
       						<td><select id="xzqh" style="width:124px;"></select></td>
       						<td align="right">&nbsp;项目名称：</td>
       						<td><input name="xmmc" id="xmmc" style="width:120px;" type="text"/></td>
       						<td>&nbsp;项目年份：</td>
       						<td><select id="xmnf" style="width: 70px;"></select></td>
       						<td align="right">&nbsp;技术等级：</td>
       						<td><select name="jsdj" class="easyui-combobox" id="jsdj" style="width:100px;"></select></td>
       					</tr>
       					<tr height="32">
       						<td align="right">&nbsp;特殊地区：</td>
       						<td><select name="tsdq" class="easyui-combobox" id="tsdq" style="width:124px;"></select></td>
       						<td align="right">&nbsp;原路线编码：</td>
       						<td><input name="ylxbh" id="ylxbh" style="width:120px;" type="text"/></td>
       						<td>&nbsp;补助历史：</td>
       						<td>
       							<select name="lsjl" id="lsjl" class="easyui-combobox" style="width:70px;">
									<option value="" selected="selected">全部</option>
									<option value="否">否</option>
									<option value="是">是</option>
								</select>
       						</td>
       						<td>&nbsp;原行政等级：</td>
							<td><select name="gldj" id="gldj" style="width:100px;" class="easyui-combobox"></select></td>
       						<td>
       							&nbsp;<img onclick="queryShxm()" alt="搜索" src="../../../images/Button/Serch01.gif" onmouseover="this.src='../../../images/Button/Serch02.gif'" onmouseout="this.src='../../../images/Button/Serch01.gif'" style="vertical-align:middle;padding-left: 8px;"/>
       						</td>
       					</tr>
       				</table>
       				</div>
       			</fieldset>
       		</td>
       	</tr>
       	<tr>
           	<td style="padding-left: 10px;padding-top:5px; font-size:12px;">
           		<div>
           			<table id="grid"></table>
           		</div>
           	</td>
       	</tr>
	</table>
</body>
</html>
