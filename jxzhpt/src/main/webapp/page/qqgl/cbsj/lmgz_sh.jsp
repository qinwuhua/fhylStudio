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
	<script type="text/javascript">
		$(function(){
			if($.cookie("unit2").length!=7)
				$("img[name='bxs']").attr('style','display:none');
			loadDist1("xzqh",$.cookie("dist"));
			loadTsdq("tsdq");
			loadBmbm3('yjsdj','技术等级');
			loadBmbm3('gjhjsdj','技术等级');
			loadGldj('gldj');
			xmnf("xmnf");
			YMLib.Var.jdbs=2;
			if($.cookie("dist")!="360000"){
				$('#btnShangbao').hide();
				//$('#drExcel').hide();
			}
			queryLmgz();
		});
		function queryLmgz(){
			grid.id="grid";
			grid.url="../../../qqgl/queryCbsj.do";
			var params={'cbsj.xmlx':2,'cbsj.xzqhdm':getxzqhdm('xzqh'),'cbsj.ghlxbh':$('#txtlxbm').val(),'cbsj.xmmc':$('#xmmc').val(),
					'cbsj.xjsdj':$('#yjsdj').combo("getValues").join(","),'cbsj.jsjsdj':$('#gjhjsdj').combo("getValues").join(","),
					'cbsj.sbzt':1,'cbsj.shzt':$('#shzt').combo("getValue"),'cbsj.xmbm':$('#xmnf').combobox("getValues").join(','),
					'tsdq':$('#tsdq').combo("getText"),'lsjl':$('#lsjl').combobox("getValue"),
					'ylxbh':$('#gldj').combobox("getValues").join(',')};
			loadcbsjTjxx(params);
			grid.queryParams=params;
			grid.height=$(window).height()-165;
			grid.width=$('#searchField').width();
			grid.pageSize=10;
			grid.pageNumber=1;
			grid.columns=[[
				{field:'ck',checkbox:true},
				{field:'cz',title:'操作',width:150,align:'center',
					formatter: function(value,row,index){
						var result="";
						result='<a style="text-decoration:none;color:#3399CC;" href="#" onclick="locationXm('+"'"+row.xmbm+"',"+"'2'"+')">定位</a>';
						result+='&nbsp;<a href="javascript:openWindow('+"'lmgzxx'"+','+"'路面改造工程项目'"+','+
						"'/jxzhpt/page/qqgl/cbsj/lmgz_xx.jsp'"+',980,400)" style="color:#3399CC;">详细</a>';
						//if(row.shzt==0){
							if($.cookie("unit2").length!=7)
								result+='&nbsp;编辑';
								else
							result+='&nbsp;<a href="javascript:openWindow('+"'lmgzedit'"+','+"'路面改造工程项目'"+','+
								"'/jxzhpt/page/qqgl/cbsj/lmgz_edit.jsp'"+',980,400)" style="color:#3399CC;">编辑</a>';
						//}else{
						//	result+='&nbsp;<a style="color:black;">编辑</a>';
						//}
						return result;
					}
				},
				{field:'shzt',title:'审核状态',width:100,align:'center',
					formatter: function(value,row,index){
						var result="";
						if($.cookie("unit2").length!=7)
						result = row.shzt==0 ? '未审核' : '已审核';
						else
						result = row.shzt==0 ? '<a href="javascript:sh('+"'"+row.xmbm+"'"+')" style="color:#3399CC;">未审核</a>' : '已审核';
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
				{field:'jsxz',title:'建设性质',width:150,align:'center'},
				{field:'lj',title:'路基（m3）',width:100,align:'center'},
				{field:'ql',title:'桥梁(延米/座)',width:100,align:'center'},
				{field:'hd',title:'涵洞（(米/座)）',width:100,align:'center'},
				{field:'mc',title:'面层（类型/公里）',width:100,align:'center'},
				{field:'jc',title:'基基（公里）',width:100,align:'center'},
				{field:'dc',title:'垫基（公里）',width:100,align:'center'},
				{field:'sd',title:'隧道（延米/座）',width:100,align:'center'},
				{field:'dq',title:'大桥(名称/长度/单跨)',width:150,align:'center'},
				{field:'sdmc',title:'隧道(名称/双幅长度/类型)',width:150,align:'center'},
				/* {field:'kgsj',title:'开工时间',width:100,align:'center'},
				{field:'wgsj',title:'完工时间',width:100,align:'center'}, */
				{field:'gq',title:'工期（月）',width:100,align:'center'},
				{field:'sjdw',title:'设计单位',width:100,align:'center'},
				{field:'sjpfwh',title:'设计批复文号',width:100,align:'center'},
				{field:'pfsj',title:'批复时间',width:100,align:'center'},
				{field:'jaf',title:'建安费',width:100,align:'center'}]];
			gridBind(grid);
		}
		function batchTh(){
			if(selArray.length!=0){
				var xmbm="",sbzt="",shzt="";
				var sels =$('#grid').datagrid("getSelections");
				var breakTh=true;
				$.each(sels,function(index,item){
					if(item.shzt==1){
						breakTh=false;
						return false;
					}
					if(index==sels.length-1){
						xmbm+=item.xmbm;
						sbzt+="0";
						shzt+=item.shzt;
					}else{
						xmbm+=item.xmbm+",";
						sbzt+="0"+",";
						shzt+=item.shzt+",";
					}
				});
				if(breakTh==false){
					alert("不能退回已审核的项目！");
					return;
				}
				$.ajax({
					type:'post',
					url:'../../../qqgl/shCbsjByXmbm.do',
					data:'xmlx='+2+'&xmbm='+xmbm+'&sbzt1='+sbzt+'&shzt1='+shzt,
					dataType:'json',
					success:function(msg){
						if(msg.result=="true"){
							selArray.splice(0,selArray.length);
							alert("退回成功!");
							queryLmgz();
						}
					}
				});
			}else{
				alert("请选择要退回的信息！");
			}
		}
		function sh(xmbm){
			$.ajax({
				type:'post',
				url:'../../../qqgl/shCbsjByXmbm.do',
				data:'xmlx='+2+'&xmbm='+xmbm+'&sbzt1='+1+'&shzt1='+1+'&jdbs='+YMLib.Var.jdbs,
				dataType:'json',
				success:function(msg){
					if(msg.result=="true"){
						selArray.splice(0,selArray.length);
						alert("审核成功!");
						queryLmgz();
					}
				}
			});
		}
		function batchSb(){
			if(selArray.length!=0){
				var xmbm="",sbzt="",shzt="";
				var sels =$('#grid').datagrid("getSelections");
				var breakTh=true;
				$.each(sels,function(index,item){
					if(item.shzt==1){
						breakTh=false;
						return false;
					}
					if(index==sels.length-1){
						xmbm+=item.xmbm;
						sbzt+=item.sbzt;
						shzt+="1";
					}else{
						xmbm+=item.xmbm+",";
						sbzt+=item.sbzt+",";
						shzt+="1,";
					}
				});
				if(breakTh==false){
					alert("不能包含已审核的项目！");
					return;
				}
				$.ajax({
					type:'post',
					url:'../../../qqgl/shCbsjByXmbm.do',
					data:'xmlx='+2+'&xmbm='+xmbm+'&sbzt1='+sbzt+'&shzt1='+shzt+'&jdbs='+YMLib.Var.jdbs,
					dataType:'json',
					success:function(msg){
						if(msg.result=="true"){
							selArray.splice(0,selArray.length);
							alert("审核成功!");
							queryLmgz();
						}
					}
				});
			}else{
				alert("请选择要审核的信息！");
			}
		}
		function exportCbsj(){
			var param='xmlx=2&shzt=-1&xzqhdm='+getxzqhdm('xzqh')+'&xmbm='+$('#xmnf').combobox("getValues").join(',')+
			'&ghlxbh='+$('#txtlxbm').val()+'&xjsdj='+$('#yjsdj').combo("getValues").join(",")+'&jsjsdj='+$('#gjhjsdj').combo("getValues").join(",")+
			'&tsdq='+$('#tsdq').combo("getText")+'&ylxbh='+$('#gldj').combobox("getValues").join(",");
			window.location.href="/jxzhpt/qqgl/exportExcelCbsj.do?"+param;
		}
		function importXmsq(){
			importExcel("/jxzhpt/qqgl/importExcelLmgzCbsj.do","gzcbsj");
		}
		$(window).resize(function () { 
			$('#grid').datagrid('resize'); 
		});
	</script>
			<style type="text/css">
TD {
font-size: 12px;
}
a{
text-decoration:none;
}
.abgc_td td{padding-right:5px;}
</style>
</head>
<body>
	<div id="righttop">
		<div id="p_top">前期管理>&nbsp;初步设计或施工图设计申请>&nbsp;路面改造工程项目</div>
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
        						<td>行政区划：</td>
        						<td><select id="xzqh" style="width:160px;"></select></td>
        						<td>路线编码：</td>
        						<td><input name="txtlxbm" type="text" id="txtlxbm" style="width:100px;" /></td>
								<td>原技术等级：</td>
								<td><select name="yjsdj" id="yjsdj" class="easyui-combobox" style="width:70px;"></select></td>
								<td>建设技术等级：</td>
								<td><select name="yjsdj" id="gjhjsdj" class="easyui-combobox" style="width:70px;"></select></td>
								<td>补助历史：</td>
								<td><select name="lsjl" id="lsjl" class="easyui-combobox" style="width:69px;">
									<option value="" selected="selected">全部</option>
									<option value="是">是</option>
									<option value="否">否</option>
								</select></td>
        					</tr>
        					<tr height="32">
        						<td>特殊地区：</td>
								<td><select name="tsdq" id="tsdq" class="easyui-combobox" style="width:160px;"></select></td>
								<td align="right">项目年份：</td>
        						<td><select id="xmnf" style="width: 100px;"></select></td>
								<td align="right">审核状态：</td>
        						<td><select id="shzt" style="width:70px;" class="easyui-combobox">
									<option selected="selected" value="-1">全部</option>
									<option value="0">未审核</option>
									<option value="1">已审核</option>
								</select></td>
								<td style="text-align: right;">公路等级：</td>
								<td><select name="gldj" id="gldj" style="width:100px;" class="easyui-combobox"></select></td>
							</tr>
							<tr height="32">
								<td>项目名称：</td>
        						<td><input type="text" id="xmmc" style="width:95px;" /></td>
        						
								<td colspan="10">
								<img onclick="queryLmgz()" alt="搜索" src="../../../images/Button/Serch01.gif" onmouseover="this.src='../../../images/Button/Serch02.gif'" onmouseout="this.src='../../../images/Button/Serch01.gif'" style="vertical-align:middle;"/>
								<img name="bxs" onclick="batchSb()" id="btnShangbao" onmouseover="this.src='../../../images/Button/sp2.jpg'" alt="上报" onmouseout="this.src='../../../images/Button/sp1.jpg'" src="../../../images/Button/sp1.jpg" style="border-width:0px;cursor: hand;vertical-align:middle;"/>
								<img name="bxs" onclick="exportCbsj()" id="dcExcel" onmouseover="this.src='../../../images/Button/dcecl2.gif'" alt="上报" onmouseout="this.src='../../../images/Button/dcecl1.gif'" src="../../../images/Button/dcecl1.gif" style="border-width:0px;cursor: hand;vertical-align:middle;"/>
								<!-- <img onclick="batchTh()" alt="删除" src="../../../images/Button/tuihui1.gif" onmouseover="this.src='../../../images/Button/tuihui2.gif'" onmouseout="this.src='../../../images/Button/tuihui1.gif'" style="vertical-align:middle;"/> -->
								<img name="bxs" id="drExcel" onclick="importXmsq()" alt="导入" src="../../../images/Button/dreclLeave.GIF" onmouseover="this.src='../../../images/Button/dreclClick.GIF'" onmouseout="this.src='../../../images/Button/dreclLeave.GIF'" style="vertical-align:middle;"/>
        					</td>
                            </tr></table>
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
            	<div>项目数量【<span id="xmsl" style="color: red;">0</span>】投资额累计【<span id="tz" style="color: red;">0</span>】,补助测算累计【<span id="bzcs" style="color: red;">0</span>】,里程累计【<span id="lc" style="color: red;">0</span>】</div>
            	
            		<div>
            			<table id="grid"></table>
            		</div>
            	</td>
        	</tr>
		</table>
</body>
</html>
