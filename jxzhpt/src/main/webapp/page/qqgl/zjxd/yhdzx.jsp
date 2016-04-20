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
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/uploader/swfobject.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/uploader/jquery.uploadify.v2.1.4.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/widget/newlhgdialog/lhgcore.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/widget/newlhgdialog/lhgdialog.min.js"></script>
	<script type="text/javascript" src="../../../page/qqgl/js/util.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/page/qqgl/lxsh/js/sjgz.js"></script>
	<script type="text/javascript">
		$(function(){
			loadTsdq("tsdq");
			loadDist1("xzqh",$.cookie("dist"));
			loadUnit1("gydw",$.cookie("unit"));
			loadBmbm3('jsdj','技术等级');
			loadBmbm2('sqzt','申请状态省');
			//xmnf("xmnf");
			urlxmnf("xmnf",getUrlParame('id'));
			loadGldj('gldj');
			YMLib.Var.jdbs=2;
			queryYhdzx();
		});
		function queryYhdzx(){
			grid.id="grid";
			grid.url="../../../qqgl/queryJhsh2.do";
			var params={'xmlx':4,'xzqhdm':getxzqhdm('xzqh'),'xmmc':$('#xmmc').val(),'ylxbh':$('#ylxbh').val(),
					'tsdq':$('#tsdq').combo("getText"),'jsdj':$('#jsdj').combobox("getValues").join(","),
					'xdzt':1,'lsjl':$('#lsjl').combobox("getValue"),'xmbm':$('#xmnf').combobox("getValues").join(','),
					'jhsh.ghlxbh':$('#ylxbh').val(),'ylxbh':$('#gldj').combobox("getValues").join(',')};
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
						result+='&nbsp;<a href="javascript:openWindow('+"'yhdzxxx'"+','+"'养护大中修项目'"+','+
						"'/jxzhpt/page/qqgl/zjxd/yhdzx_xx.jsp'"+',980,400)" style="color:#3399CC;">详细</a>';
						return result;
					}
				},
				{field:'xdzt',title:'资金下达',width:60,align:'center',
					formatter:function(value,row,index){
						xmlx=4;
						var result = '<a href="javascript:openWindow('+"'yhdzxzjxd'"+','+"'养护大中修 — 资金下达'"+','+
						"'/jxzhpt/page/qqgl/zjxd/yhdzx_zjxd.jsp'"+',900,400)" style="color:#3399CC;">资金下达</a>';
						return result;
					}
				},
				{field:'sbzt',title:'审核状态',width:60,align:'center',
					formatter: function(value,row,index){
						var result="";
						xmlx=1;
						if(row.xdzt=='0')
							result='未审核';
						if(row.xdzt=='1')
							result='已审核';	
// 						var result='<a href="javascript:openWindow('+"'jhxd'"+','+"'计划审核'"+','+
// 							"'/jxzhpt/page/qqgl/jhsh/jhxd3.jsp'"+',900,400)" style="color:#3399CC;">计划审核</a>';
						return result;
					}
				},
				{field:'lsjl',title:'历史记录',width:60,align:'center',
					formatter: function(value,row,index){
						if(value=="是"){
							return '<a href="javascript:openLsjl('+"'"+row.xmbm+"'"+')" style="color:#3399CC;">是</a>';
						}else{
							return value;
						}
					}
				},
				{field:'gydw',title:'管养单位',width:100,align:'center'},
				{field:'xzqh',title:'行政区划',width:60,align:'center'},
				{field:'xmnf',title:'项目年份',width:60,align:'center',
					formatter: function(value,row,index){
		        		return row.xmbm.substr(0,4);
		        	}
				},
				{field:'zyd',title:'重要度排序',width:60,align:'center'},
				{field:'xmmc',title:'项目名称',width:150,align:'center',
					formatter: function(value,row,index){
						if(Number(row.xmsl)>1){
		        			return '<label style="color:red;">'+value+'</label>';
		        		}else{
		        			return value;
		        		}
					}
				},
				{field:'xmbm',title:'项目编码',width:100,align:'center'},
				{field:'lc',title:'里程',width:60,align:'center'},
				{field:'jsdj',title:'技术等级',width:60,align:'center'},
				{field:'ylxbh',title:'路线编码',width:60,align:'center'},
				{field:'qdzh',title:'起点桩号',width:70,align:'center'},
				{field:'zdzh',title:'止点桩号',width:70,align:'center'},
				
				{field:'jhkgsj',title:'计划开工时间',width:80,align:'center'},
				{field:'jhwgsj',title:'计划完工时间',width:80,align:'center'},
				{field:'xdwh',title:'下达文号',width:100,align:'center'},
				{field:'xdsj',title:'下达时间',width:70,align:'center'},
				{field:'ztz',title:'总投资',width:60,align:'center'},
				{field:'sysbbzj',title:'燃油税',width:60,align:'center'},
				{field:'yqdbcgs',title:'贷款',width:60,align:'center'},
				
				{field:'qt',title:'其他',width:60,align:'center'},
				{field:'sjpfwh',title:'设计批复文号',width:100,align:'center'},
				{field:'tsdq',title:'特殊地区',width:100,align:'center'}
// 				{field:'gq',title:'工期（月）',width:100,align:'center'},
// 				{field:'ntz',title:'拟投资',width:100,align:'center'}
				]];
			gridBind(grid);
		}
		function loadLj(params){
			$.ajax({
				type:'post',
				url:'../../../qqgl/queryJhshLj.do',
				data:params,
				dataType:'json',
				success:function(msg){
					if(msg!=null){
						$("#xmsl").html(msg.SL);
						 $("#tz").html(msg.TZ);
						 $("#cgs").html(msg.CGS);
						 $('#yssj').datebox('getValue')=='' || $("#ysdw").val()=='' || $("#ysyj").val()==''
						 $("#sjl").html(msg.SJL);
						 $("#lc").html(msg.LC);
						 $("#dftz").html(msg.DFTZ);
					}else{
						$('#spanztz').html("0");
						$('#spansbz').html("0");
						$('#spanbcgs').html("0");
						$('#spanlc').html("0");
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
		<div id="p_top">计划管理>&nbsp;<span id="astext">计划下达</span>>&nbsp;<span id="bstext"></span>>&nbsp;养护大中修项目</div>
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
       						<td align="right">特殊地区：</td>
       						<td><select name="tsdq" class="easyui-combobox" id="tsdq" style="width:124px;"></select></td>
       						<td align="right">技术等级：</td>
       						<td><select name="jsdj" class="easyui-combobox" id="jsdj" style="width:81px;"></select></td>
       						<td>行政等级：</td>
							<td><select name="gldj" id="gldj" style="width:100px;" class="easyui-combobox"></select></td>
       					</tr>
       					<tr height="32">
       						<td>补助历史：</td>
       						<td>
       							<select name="lsjl" id="lsjl" class="easyui-combobox" style="width:70px;">
									<option value="" selected="selected">全部</option>
									<option value="否">否</option>
									<option value="是">是</option>
								</select>
       						</td>
       						<td align="right">项目名称：</td>
       						<td><input name="xmmc" id="xmmc" style="width:120px;" type="text"/></td>
       						<td align="right">原路线编号：</td>
       						<td><input name="ylxbh" id="ylxbh" style="width:120px;" type="text"/></td>
       						<td colspan="4">
       							<img onclick="queryYhdzx()" alt="搜索" src="../../../images/Button/Serch01.gif" onmouseover="this.src='../../../images/Button/Serch02.gif'" onmouseout="this.src='../../../images/Button/Serch01.gif'" style="vertical-align:middle;padding-left: 8px;"/>
								<img onclick="exportZjxd()" id="btnShangbao" onmouseover="this.src='../../../images/Button/dcecl2.gif'" alt="上报" onmouseout="this.src='../../../images/Button/dcecl1.gif'" src="../../../images/Button/dcecl1.gif" style="border-width:0px;cursor: hand;vertical-align:middle;"/>
								<img onclick="importJhshZjzj(7)" alt="删除" src="../../../images/Button/dreclLeave.GIF" onmouseover="this.src='../../../images/Button/dreclClick.GIF'" onmouseout="this.src='../../../images/Button/dreclLeave.GIF'" style="vertical-align:middle;"/>
       						</td>
       					</tr>
       				</table>
       				</div>
       			</fieldset>
       		</td>
       	</tr>
       	<tr>
           	<td style="padding-left: 10px;padding-top:5px; font-size:12px;">
           		<div>项目【<span id="xmsl" style="color: red;">0</span>】个,
            		建设里程【<span id="lc" style="color: red;">0</span>】公里,
            		总投资【<span id="tz" style="color: red;">0</span>】万元,
            		其中车购税【<span id="cgs" style="color: red;">0</span>】万元,
            		省补资金【<span id="sbz" style="color: red;">0</span>】万元,
            		省奖励资金【<span id="sjl" style="color: red;">0</span>】万元,
            		地方投资【<span id="dftz" style="color: red;">0</span>】万元。
            		</div>
           		<div>
           			<table id="grid"></table>
           		</div>
           	</td>
       	</tr>
	</table>
</body>
</html>
