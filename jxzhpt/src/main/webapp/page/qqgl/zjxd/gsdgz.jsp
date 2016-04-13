<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>工程路面改建路面升级项目</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/Top.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/icon.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/datagrid-detailview.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/util/jquery.cookie.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YMLib.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/uploader/swfobject.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/uploader/jquery.uploadify.v2.1.4.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/widget/newlhgdialog/lhgcore.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/widget/newlhgdialog/lhgdialog.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/page/qqgl/js/util.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/page/qqgl/lxsh/js/sjgz.js"></script>
	<script type="text/javascript">
		$(function(){
			loadDist1("xzqh",$.cookie("dist"));
			loadTsdq("tsdq");
			loadBmbm3('jsdj','技术等级');
			//xmnf("xmnf");
			urlxmnf("xmnf",getUrlParame('id'));
			loadGldj('gldj');
			gsdxmlx('xmlx');
			YMLib.Var.jdbs=2;
			queryLmsj();
		});
		function queryLmsj(){
			var xmlx=$("#xmlx").combobox("getValues").join(",");
			if(xmlx.substr(0,1)==',')
				xmlx=xmlx.substr(1,xmlx.length);
			grid.id="grid";
			grid.url="../../../qqgl/queryGsdgz.do";
			var params={'jhsh.xmlx1':xmlx,'jhsh.xzqhdm':getxzqhdm('xzqh'),'jhsh.ghlxbh':$('#txtlxbm').val(),
					'jhsh.xmmc':$('#txtxmmc').val(),'jhsh.tsdq':$('#tsdq').combo("getText"),'jsdj':$('#jsdj').combobox("getValues").join(","),
					'jhsh.xdzt':1,'lsjl':$('#lsjl').combobox("getValue"),'jhsh.xmbm':$('#xmnf').combobox("getValues").join(','),
					'ylxbh':$('#gldj').combobox("getValues").join(',')};
			grid.queryParams=params;
			loadLj(params);
			grid.height=$(window).height()-160;
			grid.width=$('#searchField').width();
			grid.pageSize=10;
			grid.pageNumber=1;
			grid.columns=[[
				{field:'cz',title:'操作',width:100,align:'center',
					formatter: function(value,row,index){
						var result='<a style="text-decoration:none;color:#3399CC;" href="#" onclick="locationXm('+"'"+row.xmbm+"','2'"+')">定位</a>';
						result+='&nbsp;<a href="javascript:openWindow('+"'lmsjxx'"+','+"'国省道改造'"+','+
						"'/jxzhpt/page/qqgl/jhsh/lmsj_xx.jsp'"+',980,400)" style="color:#3399CC;">详细</a>';
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
				{field:'xdzt',title:'资金下达',width:100,align:'center',
					formatter: function(value,row,index){
						var result='<a href="javascript:openWindow('+"'lmsjzjxd'"+','+"'国省道改造  — 资金下达'"+','+
							"'/jxzhpt/page/qqgl/zjxd/lmsj_zjxd.jsp'"+',900,400)" style="color:#3399CC;">资金下达</a>';
						return result;
					}
				},
				{field:'xmbm',title:'项目编码',width:100,align:'center'},
				{field:'xmmc',title:'项目名称',width:250,align:'center',
					formatter: function(value,row,index){
						if(Number(row.xmsl)>1){
		        			return '<label style="color:red;">'+value+'</label>';
		        		}else{
		        			return value;
		        		}
					}
				},
				{field:'xzqh',title:'行政区划',width:100,align:'center'},
				{field:'ghlxbh',title:'路线编码',width:100,align:'center'},
				{field:'qdzh',title:'起点桩号',width:100,align:'center'},
				{field:'zdzh',title:'止点桩号',width:100,align:'center'},
				{field:'kgsj',title:'开工时间',width:100,align:'center'},
				{field:'wgsj',title:'完工时间',width:100,align:'center'},
				{field:'gq',title:'工期（月）',width:100,align:'center'},
				{field:'gkpfwh',title:'工可批复文号',width:100,align:'center'},
				{field:'sjpfwh',title:'设计批复文号',width:100,align:'center'},
				{field:'xdwh',title:'下达文号',width:100,align:'center'},
				{field:'xdsj',title:'下达时间',width:100,align:'center'},
				{field:'pfztz',title:'批复总投资',width:100,align:'center'},
				{field:'bbzzj',title:'部补助投资',width:100,align:'center'},
				{field:'sbzzj',title:'省补助资金',width:100,align:'center'}]];
			bindLxGrid();
			gridBind(grid);
		}
		function loadLj(params){
			$.ajax({
				type:'post',
				url:'../../../qqgl/queryJhshLjgsdgz.do',
				data:params,
				dataType:'json',
				success:function(msg){
					if(msg!=null){
						$('#spanbbz').html(msg.BBZZJ);
						$('#spansbz').html(msg.SBZZJ);
						$('#spanlc').html(msg.LC);
					}else{
						$('#spanbbz').html("0");
						$('#spansbz').html("0");
						$('#spanlc').html("0");
					}
				}
			});
		}
		function exportZjxd(){
			var xmlx=$("#xmlx").combobox("getValues").join(",");
			if(xmlx.substr(0,1)==',')
				xmlx=xmlx.substr(1,xmlx.length);
			var param='jhsh.xmlx1='+xmlx+'&jhsh.xdzt=1&jhsh.xzqhdm='+getxzqhdm('xzqh')+'&jhsh.ghlxbh='+$('#txtlxbm').val()+
			'&jhsh.xmmc='+$('#txtxmmc').val()+'&jhsh.tsdq='+$('#tsdq').combo("getValue")
			+'&jhsh.xmbm='+$('#xmnf').combobox("getValues").join(',')+'&jsdj='+$('#jsdj').combobox("getValues").join(",")
			+'&ylxbh='+$('#gldj').combobox("getValues").join(',');
			window.location.href="/jxzhpt/qqgl/exportZjxdgsd.do?"+param;
		}
		$(window).resize(function () { 
			$('#grid').datagrid('resize'); 
		});
	</script>
	<style type="text/css">
		TD {font-size: 12px;}
		a{text-decoration:none;}
		.abgc_td td{padding-right:5px;}
	</style>
</head>
<body>
	<div id="righttop">
		<div id="p_top">计划管理>&nbsp;计划下达>&nbsp;十二五>&nbsp;国省道改造</div>
	</div>
		<table width="99%" border="0" style="margin-top: 1px; margin-left: 1px;" cellspacing="0" cellpadding="0">
        	<tr>
        		<td align="left" style="padding-left:10px;padding-right: 10px; padding-top: 10px;">
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
        						<td align="right">特殊地区：</td>
        						<td><select name="tsdq" id="tsdq" class="easyui-combobox" style="width:114px;"></select></td>
        						<td align="right">技术等级：</td>
        						<td><select name="jsdj" class="easyui-combobox" id="jsdj" style="width:81px;"></select></td>
        						<td>行政等级：</td>
								<td><select name="gldj" id="gldj" style="width:100px;" class="easyui-combobox"></select></td>
        					</tr>
        					<tr height="32">
        						<td align="right">补助历史：</td>
        						<td>
        							<select name="lsjl" id="lsjl" class="easyui-combobox" style="width:69px;">
										<option value="" selected="selected">全部</option>
										<option value="否">否</option>
										<option value="是">是</option>
									</select>
        						</td>
        						<td align="right">项目名称：</td>
        						<td><input name="txtxmmc" type="text" id="txtxmmc" style="width:120px;" /></td>
        						<td align="right">路线编码：</td>
        						<td><input name="txtlxbm" type="text" id="txtlxbm" style="width:110px;" /></td>
        						<td>项目类型：</td>
								<td><select name="xmlx" id="xmlx" style="width:100px;" ></select></td>
        						<td colspan="3">
        							<img onclick="queryLmsj()" alt="搜索" src="../../../images/Button/Serch01.gif" onmouseover="this.src='../../../images/Button/Serch02.gif'" onmouseout="this.src='../../../images/Button/Serch01.gif'" style="vertical-align:middle;"/>
									<img onclick="exportZjxd()" id="btnShangbao" onmouseover="this.src='../../../images/Button/dcecl2.gif'" alt="上报" onmouseout="this.src='../../../images/Button/dcecl1.gif'" src="../../../images/Button/dcecl1.gif" style="border-width:0px;cursor: hand;vertical-align:middle;"/>
									<img onclick="importJhshZjzj(4)" alt="导入数据" src="../../../images/Button/dreclLeave.GIF" onmouseover="this.src='../../../images/Button/dreclClick.GIF'" onmouseout="this.src='../../../images/Button/dreclLeave.GIF'" style="vertical-align:middle;"/>
        						</td>
        					</tr>
        				</table>
        				</div>
        			</fieldset>
        		</td>
        	</tr>
        	<!-- <tr>
        		<td style="text-align: left;padding:8px 0px 5px 20px;font-size: 12px;">
        			共有【 <span id="lblCount" style="font-weight: bold; color: #FF0000">0</span> 】个路面升级项目，总里程共
        			【&nbsp;<span id="lblZLC" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】
        			公里，项目里程共【&nbsp;<span id="lblXMLC" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】
        			公里，批复总投资【&nbsp;<span id="lblZTZ" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】
        			万元，其中中央车购税【&nbsp;<span id="lblBTZ" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】
        			万元，省投资【&nbsp;<span id="lblDFTZ" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】万元。
        		</td>
        	</tr> -->
        	<tr>
            	<td style="padding-left: 10px;padding-top:5px; font-size:12px;">
            		<div>部补助资金累计【<span id="spanbbz" style="color: red;">0</span>】,省补助资金累计【<span id="spansbz" style="color: red;">0</span>】,里程累计【<span id="spanlc" style="color: red;">0</span>】</div>
            		<div>
            			<table id="grid"></table>
            		</div>
            	</td>
        	</tr>
		</table>
</body>
</html>
