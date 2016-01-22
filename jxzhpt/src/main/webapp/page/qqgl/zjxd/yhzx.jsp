<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>养护中心</title>
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
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/uploader/swfobject.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/uploader/jquery.uploadify.v2.1.4.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/widget/newlhgdialog/lhgcore.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/widget/newlhgdialog/lhgdialog.min.js"></script>
	<script type="text/javascript" src="../../../page/qqgl/js/util.js"></script>
	<script type="text/javascript">
		$(function(){
			loadDist1("xzqh",$.cookie("dist"));
			loadUnit1("gydw",$.cookie("unit"));
            loadBmbm2('jb','级别');
			loadBmbm2('jsxz','建设性质2');
			xmnf("xmnf");
			YMLib.Var.jdbs=2;
			queryYhzx();
		});
		function queryYhzx(){
			grid.id="grid";
			grid.url="../../../qqgl/queryJhsh2.do";
			var params={'xmlx':6,'xzqhdm':getxzqhdm('xzqh'),'lxmc':$('#lxmc').val(),
					'jsxz':$('#jsxz').combobox("getValue"),
					'jb':$('#jb').combobox("getValue"),'xmmc':$('#xmmc').val(),
					'xmbm':$('#xmnf').combobox("getValues").join(','),
					"ydbmc":$('#ydbmc').val(),'xdzt':1};
			grid.queryParams=params;
			loadLj(params);
			grid.height=$(window).height()-160;
			grid.width=$('#searchField').width();
			grid.pageSize=10;
			grid.pageNumber=1;
			grid.columns=[[
				{rowspan:2,field:'cz',title:'操作',width:100,align:'center',
					formatter: function(value,row,index){
						var result='<a style="text-decoration:none;color:#3399CC;" href="#" onclick="locationXm('+"'"+row.xmbm+"','2'"+')">定位</a>';
						result+='&nbsp;<a href="javascript:openWindow('+"'yhdzxxx'"+','+"'养护中心项目'"+','+
						"'/jxzhpt/page/qqgl/zjxd/yhzx_xx.jsp'"+',980,400)" style="color:#3399CC;">详细</a>';
						return result;
					}
				},
				{rowspan:2,field:'xdzt',title:'资金下达',width:100,align:'center',
					formatter:function(value,row,index){
						xmlx=6;
						var result = '<a href="javascript:openWindow('+"'yhdzxzjxd'"+','+"'养护中心 — 资金下达'"+','+
						"'/jxzhpt/page/qqgl/zjxd/yhzx_zjxd.jsp'"+',900,400)" style="color:#3399CC;">资金下达</a>';
						return result;
					}
				},
				{rowspan:2,field:'xmbm',title:'项目编码',width:150,align:'center'},
				{rowspan:2,field:'xmmc',title:'项目名称',width:250,align:'center'},
				{rowspan:2,field:'xzqh',title:'行政区划',width:100,align:'center'},
				{rowspan:2,field:'gydw',title:'管养单位',width:150,align:'center'},
				{rowspan:2,field:'ydbmc',title:'原道班名称',width:100,align:'center'},
				{rowspan:2,field:'jb',title:'级别',width:100,align:'center',
					formatter: function(value,row,index){
						if(value=='1'){return '市级';}
						else if(value=='2'){return '县级';}
						else return '';
					}
	        	},
				{rowspan:2,field:'lxmc',title:'所在路线名称',width:100,align:'center'},
				{rowspan:2,field:'lxzh',title:'所在路线桩号',width:100,align:'center'},
				{rowspan:2,field:'jsxz',title:'建设性质',width:100,align:'center',
					formatter: function(value,row,index){
						if(value=='1'){return '新建';}
						else if(value=='2'){return '扩建';}
						else if(value=='3'){return '改建';}
						else return '';
					}
				},
				{rowspan:2,field:'jhkgsj',title:'计划开工时间',width:100,align:'center'},
				{rowspan:2,field:'jhwgsj',title:'计划完工时间',width:100,align:'center'},
				{colspan:3,title:'本次计划下达(万元)',width:120,align:'center'},
				{rowspan:2,field:'dfzc',title:'地方自筹(万元)',width:100,align:'center'},
				{rowspan:2,field:'ztz',title:'总投资(万元)',width:100,align:'center'}
				],
				[
                {field:'sbzzj',title:'省补助资金(万元)',width:100,align:'center'},
				{field:'zddzjl',title:'重点打造奖励(万元)',width:110,align:'center'},
				{field:'zbzzj',title:'总补助资金(万元)',width:100,align:'center'}
				]];
			gridBind1(grid);
		}
		
		function loadLj(params){
			$.ajax({
				type:'post',
				url:'../../../qqgl/queryJhshLj.do',
				data:params,
				dataType:'json',
				success:function(msg){
					if(msg!=null){
						$('#spanztz').html(msg.ZTZ);
						$('#spansbz').html(msg.SYSBB);
					}else{
						$('#spanztz').html("0");
						$('#spansbz').html("0");
					}
				}
			});
		}
		$(window).resize(function () { 
			$('#grid').datagrid('resize');
		});
		
		function exportZjxd(){
			var param='jhsh.xmlx=4&xdzt=1&xzqhdm='+getxzqhdm('xzqh')+'&xmmc='+$('#xmmc').val()
				+'&tsdq='+$('#tsdq').combo("getText")+'&jsdj='+$('#jsdj').combobox("getValues").join(",")
				+'&lsjl='+$('#lsjl').combobox("getValue")+'&xmbm='+$('#xmnf').combobox("getValues").join(',')
				+'&jhsh.ghlxbh='+$('#ylxbh').val()+'&ylxbh='+$('#gldj').combobox("getValues").join(',');
			window.location.href="/jxzhpt/qqgl/exportZjxd.do?"+param;
		}
	</script>
	<style type="text/css">
		TD {font-size: 12px;}
		a{text-decoration:none;}
		.abgc_td td{padding-right:5px;}
	</style>
</head>
<body>
	<div id="righttop">
		<div id="p_top">计划管理>&nbsp;计划资金下达>&nbsp;养护中心项目</div>
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
       						<td>项目年份：</td>
       						<td><select id="xmnf" style="width: 70px;"></select></td>
       						<td align="right">行政区划：</td>
       						<td><select id="xzqh" style="width:124px;"></select></td>
       						<td>&nbsp;建设性质：</td>
       						<td><select name="jsxz" class="easyui-combobox" id="jsxz" style="width:81px;"></select></td>
       						<td>&nbsp;级别：</td>
	       					<td><select name="jb" class="easyui-combobox" id="jb" style="width:100px;"></select></td>
       					</tr>
       					<tr height="32">
       						<td align="right">项目名称：</td>
       						<td><input name="xmmc" id="xmmc" style="width:120px;" type="text"/></td>
       						<td>路线名称：</td>
        					<td><input type="text" id="lxmc" style="width:95px;" /></td>
       						<td align="right">原道班名称：</td>
       						<td><input name="yldbmc" id="yldbmc" style="width:120px;" type="text"/></td>
       						<td colspan="4">
       							<img onclick="queryYhzx()" alt="搜索" src="../../../images/Button/Serch01.gif" onmouseover="this.src='../../../images/Button/Serch02.gif'" onmouseout="this.src='../../../images/Button/Serch01.gif'" style="vertical-align:middle;padding-left: 8px;"/>
								<img onclick="exportZjxd()" id="btnShangbao" onmouseover="this.src='../../../images/Button/dcecl2.gif'" alt="上报" onmouseout="this.src='../../../images/Button/dcecl1.gif'" src="../../../images/Button/dcecl1.gif" style="border-width:0px;cursor: hand;vertical-align:middle;"/>
<!-- 								<img onclick="importJhshZjzj(7)" alt="删除" src="../../../images/Button/dreclLeave.GIF" onmouseover="this.src='../../../images/Button/dreclClick.GIF'" onmouseout="this.src='../../../images/Button/dreclLeave.GIF'" style="vertical-align:middle;"/> -->
       						</td>
       					</tr>
       				</table>
       				</div>
       			</fieldset>
       		</td>
       	</tr>
       	<tr>
           	<td style="padding-left: 10px;padding-top:5px; font-size:12px;">
           		<div>总投资累计【<span id="spanztz" style="color: red;">0</span>万元】,
           		省以上补助资金累计【<span id="spansbz" style="color: red;">0</span>万元】
           		</div>
           		<div>
           			<table id="grid"></table>
           		</div>
           	</td>
       	</tr>
	</table>
</body>
</html>
