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
	<script type="text/javascript" src="../../../js/uploader/swfobject.js"></script>
	<script type="text/javascript" src="../../../js/uploader/jquery.uploadify.v2.1.4.js"></script>
	<script type="text/javascript" src="../../../widget/newlhgdialog/lhgcore.min.js"></script>
	<script type="text/javascript" src="../../../widget/newlhgdialog/lhgdialog.min.js"></script>
	<script type="text/javascript" src="../../../js/YMLib.js"></script>
	<script type="text/javascript" src="../../../page/qqgl/js/util.js"></script>
	<script type="text/javascript">
		$(function(){
			//根据用户等级展示按钮
			if(userPanduan($.cookie("unit2"))=="省"){
				$.each($("[name='sheng']"),function(index,item){
					$(item).show();
				});
				$.each($("[name='dishi']"),function(index,item){
					$(item).hide();
				});
				$('#ztspan').html("审核状态");
				$('#项目计划库管理').html("项目立项审核");
			}else if(userPanduan($.cookie("unit2"))!="省"){
				$.each($("[name='sheng']"),function(index,item){
					$(item).hide();
				});
				$.each($("[name='dishi']"),function(index,item){
					$(item).show();
				});
				$('#ztspan').html("上报状态");
			}
			loadTsdq("tsdq");
			xmnf("xmnf");
			loadDist1("xzqh",$.cookie("dist"));
			loadUnit1("gydw",$.cookie("unit"));
			loadBmbm3('jsdj','技术等级');
			loadGcfl('gcfl','工程分类');
			loadGldj('gldj');
			YMLib.Var.jdbs=1;
			if(userPanduan($.cookie("unit2"))!="省"){
				loadBmbm2('sqzt','申请状态地市');
			}else{
				loadBmbm2('sqzt','申请状态省');
			}
			queryYhdzx();
		});
		function queryYhdzx(){
			grid.id="grid";
			grid.url="../../../qqgl/queryXmsq.do";
			var params={'xmlx':4,'gydwdm':getgydw('gydw'),'xzqhdm':getxzqhdm('xzqh'),'xmmc':$('#xmmc').val(),
					'tsdq':$('#tsdq').combo("getText"),'jsdj':$('#jsdj').combobox("getValues").join(","),'sqzt':-1,"jdbs":1,
					'jdbs':YMLib.Var.jdbs,'lsjl':$('#lsjl').combobox("getValue"),'xmbm':$('#xmnf').combobox("getValues").join(',')
					,'gcfl':$('#gcfl').combobox("getValues").join(","),"ylxbh":$('#gldj').combobox("getValues").join(",")};
			var sqzt = $('#sqzt').combobox("getValue");
			loadLj(params);
			if(userPanduan($.cookie("unit2"))!="省"){
				params.sqzt=sqzt=='' ? -1 : sqzt;
			}else{
				params.sqzt=sqzt=='' ? -1 : sqzt;
			}
			grid.queryParams=params;
			grid.height=$(window).height()-160;
			grid.width=$('#searchField').width();
			grid.pageSize=10;
			grid.pageNumber=1;
			grid.columns=[[
				{field:'ck',checkbox:true},
				/* {field:'cz',title:'操作',width:150,align:'center',
					formatter: function(value,row,index){
						var result='<a style="text-decoration:none;color:#3399CC;" href="#" onclick="locationXm('+"'"+row.xmbm+"','1'"+')">定位</a>';
						result+='&nbsp;<a href="javascript:openWindow('+"'yhdzxxx'"+','+"'养护大中修项目'"+','+
								"'/jxzhpt/page/qqgl/jhsh/yhdzx_xx.jsp'"+',980,400)" style="color:#3399CC;">详细</a>';
						//if(row.sqzt==0 || row.sqzt==9 || row.sqzt==11){
							result+='&nbsp;<a href="javascript:openWindow('+"'yhdzxedit'"+','+"'养护大中修项目'"+','+
							"'/jxzhpt/page/qqgl/jhsh/yhdzx_edit.jsp'"+',980,400)" style="color:#3399CC;">编辑</a>';
						//}else{
						//	result+='&nbsp;<a style="color:black;">编辑</a>';
						//}
						return result;
					}
				},
				{field:'sqzt',title:'上报状态',width:100,align:'center',
					formatter:function(value,row,index){
						var result="";
						if(userPanduan($.cookie('unit2'))!="省"){
							if(Number(value)==Number($.cookie('unit2').length)){
								result="已上报";
							}else if(Number(value)>0 && Number(value)<Number($.cookie('unit2').length)){
								result="已审核";
							}else if(Number(value)==0 || Number(value)>Number($.cookie('unit2').length)){
								result='<a href="javascript:sb('+"'"+row.xmbm+"'"+')" style="color:#3399CC;">未上报</a>';
							}
						}else if(userPanduan($.cookie('unit2'))=="省"){
							if(Number(value)==Number($.cookie('unit2').length)){
								result="已审核";
							}else if(Number(value)==9){
								result='<a href="javascript:sp('+"'"+row.xmbm+"'"+')" style="color:#3399CC;">未审核</a>';
							}else{
								result="未上报";
							}
						}
						return result;
					}
				},
				{field:'tjlx',title:'添加路线',width:100,align:'center',
					formatter: function(value,row,index){
						if(Number(row.sqzt)==0 || Number(row.sqzt)>Number($.cookie('unit2').length)){
							return '<a href="javascript:openLxAdd('+"'yhdzx','"+row.xmbm+"','"+YMLib.Var.jdbs+"'"+')" style="color:#3399CC;">添加路线</a>';
						}else{
							return '添加路线';
						}
					}
				}, */
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
				{field:'gydw',title:'管养单位',width:100,align:'center'},
				{field:'ylxbh',title:'路线编码',width:100,align:'center'},
				{field:'qdzh',title:'起点桩号',width:100,align:'center'},
				{field:'zdzh',title:'止点桩号',width:100,align:'center'},
				{field:'lc',title:'里程',width:100,align:'center'},
				{field:'jsdj',title:'技术等级',width:100,align:'center'},
				{field:'jhkgsj',title:'计划开工时间',width:100,align:'center'},
				{field:'jhwgsj',title:'计划完工时间',width:100,align:'center'},
				{field:'gq',title:'工期（月）',width:100,align:'center'},
				{field:'ntz',title:'拟投资',width:100,align:'center'}]];
			gridBind11(grid);
		}
		function loadLj(params){
			$.ajax({
				type:'post',
				url:'../../../qqgl/queryLj.do',
				data:params,
				dataType:'json',
				success:function(msg){
					$('#spanntz').html(msg.NTZ);
					$('#spanlc').html(msg.LC);
				}
			});
		}
		function deleteYhdzx(){
			var selRow = $('#grid').datagrid("getSelections");
			var y=true;
			$.each(selRow,function(index,item){
				if(item.sqzt!=0){
					y=false;
					return;
				}
			});
			if(!y){
				alert("只能删除未申请的信息！");
				return;
			}
			if(selArray.length!=0){
				var xmbm = selArray.join(",");
				$.ajax({
					type:'post',
					url:'../../../qqgl/deleteXmsq.do',
					data:'xmlx='+4+'&xmbm='+xmbm,
					dataType:'json',
					success:function(msg){
						if(msg.result=="true"){
							selArray.splice(0,selArray.length);
							alert("删除成功!");
							queryYhdzx();
						}
					}
				});
			}else{
				alert("请选择要删除的信息！");
			}
		}
		function sb(xmbm){
			$.ajax({
				type:'post',
				url:'../../../qqgl/updateXmsqSbzt.do',
				data:'xmlx='+4+'&xmbm='+xmbm+'&xzqhdm='+$.cookie("unit2"),
				dataType:'json',
				success:function(msg){
					if(msg.result=="true"){
						selArray.splice(0,selArray.length);
						alert("上报成功!");
						queryYhdzx();
					}
				}
			});
		}
		function batchSb(){
			var selRow = $('#grid').datagrid("getSelections");
			var y=true;
			$.each(selRow,function(index,item){
				if(item.sqzt!=0){
					y=false;
					return;
				}
			});
			if(!y){
				alert("只能上报未上报过的项目！");
				return;
			}
			if(selArray.length!=0){
				var xmbm = selArray.join(",");
				$.ajax({
					type:'post',
					url:'../../../qqgl/updateXmsqSbzt.do',
					data:'xmlx='+4+'&xmbm='+xmbm+'&xzqhdm='+$.cookie("unit2"),
					dataType:'json',
					success:function(msg){
						if(msg.result=="true"){
							selArray.splice(0,selArray.length);
							alert("上报成功!");
							queryYhdzx();
						}
					}
				});
			}else{
				alert("请选择要上报的信息！");
			}
		}
		function sp(xmbm){
			$.ajax({
				type:'post',
				url:'../../../qqgl/updateXmsqSp.do',
				data:'xmlx='+4+'&xmbm='+xmbm+'&xzqhdm='+$.cookie("unit2")+'&jdbs='+YMLib.Var.jdbs,
				dataType:'json',
				success:function(msg){
					if(msg.result=="true"){
						selArray.splice(0,selArray.length);
						alert("审核成功!");
						queryYhdzx();
					}
				}
			});
		}
		function batchSp(){
			var selRow = $('#grid').datagrid("getSelections");
			var y=true;
			$.each(selRow,function(index,item){
				if(item.sqzt==7 || item.sqzt==0){
					y=false;
					return;
				}
			});
			if(!y){
				alert("只能审批未通过的项目！");
				return;
			}
			if(selArray.length!=0){
				var xmbm = selArray.join(",");
				$.ajax({
					type:'post',
					url:'../../../qqgl/updateXmsqSp.do',
					data:'xmlx='+4+'&xmbm='+xmbm+'&xzqhdm='+$.cookie("unit2")+'&jdbs='+YMLib.Var.jdbs,
					dataType:'json',
					success:function(msg){
						if(msg.result=="true"){
							selArray.splice(0,selArray.length);
							alert("审核成功!");
							queryYhdzx();
						}
					}
				});
			}else{
				alert("请选择要上报的信息！");
			}
		}
		function exportXmsq(){
			var sqzt = $('#sqzt').combobox("getValue");
			if(userPanduan($.cookie("unit2"))!="省"){
				sqzt=sqzt=='' ? -1 : sqzt;
			}else{
				sqzt=sqzt=='' ? -1 : sqzt;
			}
			var param='xmlx=4&sqzt='+sqzt+'&xzqhdm='+getxzqhdm('xzqh')+'&gydwdm='+getgydw("gydw")+
			'&xmbm='+$('#xmnf').combobox("getValues").join(',')+'&jsdj='+$('#jsdj').combobox("getValues").join(",")+
			'&tsdq='+$('#tsdq').combo("getText")+'&xmmc='+$('#xmmc').val()+'&lsjl='+$('#lsjl').combobox("getValue")+
			'&ylxbh='+$('#gldj').combobox("getValues").join(",");
			window.location.href="/jxzhpt/qqgl/exportExcelXmsq.do?"+param;
		}
		function importXmsq(){
			importExcel("/jxzhpt/qqgl/importExcelYhdzx.do","yhlxsh");
		}
		function openYhdzx(){
			openWindow("yhdzxadd","添加养护大中修项目","yhdzxAdd.jsp",980,400);
		}
		function loadGcfl(id,name){
			$.ajax({
				type:'post',
				url:'/jxzhpt/xtgl/getBmbmTreeByName2.do',
				data:'yhm='+ encodeURI(encodeURI(name)),
				dataType:'json',
				async:false,
				success:function(msg){
					$('#' + id).combobox({
						data:msg,
						valueField : 'bmid',
						textField : 'name',
						panelHeight:'auto',
						multiple:true
					});
				}
			});
		}
		$(window).resize(function () { 
			$('#grid').datagrid('resize');
		});
	</script>
</head>
<body>
	<div id="righttop">
		<div id="p_top">计划管理>&nbsp;<span id="spantitle">项目立项申请</span>>&nbsp;养护大中修项目</div>
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
       							<td>&nbsp;管养单位：</td>
       							<td><select id="gydw" style="width:170px;"></select></td>
       							<td>&nbsp;行政区划：</td>
       							<td><select id="xzqh" style="width:124px;"></select></td>
       							<td>&nbsp;技术等级：</td>
       							<td><select name="jsdj" class="easyui-combobox" id="jsdj" style="width:81px;"></select></td>
       							<td>&nbsp;工程分类：</td>
	       						<td><select name="gcfl" class="easyui-combobox" id="gcfl" style="width:100px;"></select></td>
       						</tr>
       						<tr height="32">
       							<td><span id="ztspan">上报状态</span>：</td>
       							<td><select id="sqzt" class="easyui-combobox" style="width: 70px;"></select></td>
       							<td>&nbsp;特殊地区：</td>
       							<td><select name="tsdq" id="tsdq" style="width:170px;" class="easyui-combobox"></select></td>
       							<td>&nbsp;项目名称：</td>
       							<td><input name="xmmc" id="xmmc" style="width:120px;" type="text"/></td>
       							<td>&nbsp;历史记录：</td>
       							<td>
       								<select id="lsjl" class="easyui-combobox" style="width: 81px;">
		       							<option value="" selected="selected">全部</option>
		       							<option value="是">是</option>
		       							<option value="否">否</option>
	       							</select>
       							</td>
       							<td>&nbsp;公路等级：</td>
								<td><select name="gldj" id="gldj" style="width:100px;" class="easyui-combobox"></select></td>
       						</tr>
       						<tr>
       							<td colspan="8">
       								<img onclick="queryYhdzx()" alt="搜索" src="../../../images/Button/Serch01.gif" onmouseover="this.src='../../../images/Button/Serch02.gif'" onmouseout="this.src='../../../images/Button/Serch01.gif'" style="vertical-align:middle;padding-left: 8px;"/>
<!-- 									<img id="sb" name="dishi" alt="上报" onclick="batchSb()" style="border-width:0px;cursor: hand;vertical-align:middle;" onmouseover="this.src='../../../images/Button/shangbao_2.png'" alt="上报" onmouseout="this.src='../../../images/Button/shangbao_1.png'" src="../../../images/Button/shangbao_1.png"/> -->
<!-- 									<img id="tj" name="dishi" alt="添加" onclick="openYhdzx()" style="disborder-width:0px;cursor: hand;vertical-align:middle;" src="../../../images/Button/tianj1.gif" onmouseover="this.src='../../../images/Button/tianj2.gif'" onmouseout="this.src='../../../images/Button/tianj1.gif'" src=""/> -->
<!-- 									<img id="sc" name="dishi" alt="删除" onclick="deleteYhdzx()" style="vertical-align:middle;" src="../../../images/Button/delete1.jpg" onmouseover="this.src='../../../images/Button/delete2.jpg'" onmouseout="this.src='../../../images/Button/delete1.jpg'"> -->
<!-- 									<img id="sp" name="sheng" alt="审批" onclick="batchSp()" style="display:none;border-width:0px;cursor: hand;vertical-align:middle;" onmouseover="this.src='../../../images/Button/sp2.jpg'" alt="上报" onmouseout="this.src='../../../images/Button/sp1.jpg'" src="../../../images/Button/sp1.jpg"/> -->
<!-- 					                <img id="th" name="sheng" alt="退回" onclick="" style="display:none;vertical-align:middle;" alt="退回" src="../../../images/Button/tuihui1.gif" onmouseover="this.src='../../../images/Button/tuihui2.gif'" onmouseout="this.src='../../../images/Button/tuihui1.gif'"/> -->
					                <img id="dcExcel" name="sheng" onclick="exportXmsq()" onmouseover="this.src='../../../images/Button/dcecl2.gif'" alt="上报" onmouseout="this.src='../../../images/Button/dcecl1.gif'" src="../../../images/Button/dcecl1.gif" style="border-width:0px;cursor: hand;vertical-align:middle;"/>
<!-- 					                <img id="drExcel" name="dishi" onclick="importXmsq()" alt="导入" src="../../../images/Button/dreclLeave.GIF" onmouseover="this.src='../../../images/Button/dreclClick.GIF'" onmouseout="this.src='../../../images/Button/dreclLeave.GIF'" style="vertical-align:middle;"/> -->
<!-- 					                <img id="dcmoban" name="dishi" onclick="exportTemplet('Lxsh_Yhdzx')" alt="导出模版" onmouseover="this.src='../../../images/Button/DC2.gif'" onmouseout="this.src='../../../images/Button/DC1.gif'" src="../../../images/Button/DC1.gif" style="border-width:0px;cursor: hand;vertical-align:middle;"/> -->
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
           			<div>投资额累计【<span id="spanntz" style="color: red;">0</span>】,里程累计【<span id="spanlc" style="color: red;">0</span>】</div>
           			<table id="grid"></table>
           		</div>
           	</td>
       	</tr>
	</table>
</body>
</html>
