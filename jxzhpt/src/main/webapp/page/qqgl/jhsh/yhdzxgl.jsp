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
			//根据用户等级展示按钮
			if(userPanduan($.cookie("unit2"))=="省"){
				$.each($("[name='sheng']"),function(index,item){
					$(item).show();
				});
				$.each($("[name='dishi']"),function(index,item){
					$(item).hide();
				});
			}else if(userPanduan($.cookie("unit2"))!="省"){
				$.each($("[name='sheng']"),function(index,item){
					$(item).hide();
				});
				$.each($("[name='dishi']"),function(index,item){
					$(item).show();
				});
			}
			loadTsdq("tsdq");
			loadDist1("xzqh",$.cookie("dist"));
			loadUnit1("gydw",$.cookie("unit"));
			loadBmbm2('jsdj','技术等级');
			if(userPanduan($.cookie("unit2"))!="省")
				loadBmbm2('sqzt','申请状态地市');
			else
				loadBmbm2('sqzt','申请状态省');
			queryYhdzx();
		});
		function queryYhdzx(){
			grid.id="grid";
			grid.url="../../../qqgl/queryXmsq.do";
			var params={'xmlx':4,'gydwdm':getgydw('gydw'),'xzqhdm':getxzqhdm('xzqh'),'xmmc':$('#xmmc').val(),
					'tsdq':$('#tsdq').combo("getText"),'jsdj':$('#jsdj').combobox("getValue"),'sqzt':-1};
			var sqzt = $('#sqzt').combobox("getValue");
			if(userPanduan($.cookie("unit2"))!="省"){
				params.sqzt=sqzt=='' ? -1 : sqzt;
			}else{
				params.sqzt=sqzt=='' ? -1 : sqzt;
			}
			grid.queryParams=params;
			grid.height=$(window).height()-180;
			grid.width=$('#searchField').width();
			grid.pageSize=10;
			grid.pageNumber=1;
			grid.columns=[[
				{field:'cz',title:'操作',width:150,align:'center',
					formatter: function(value,row,index){
						var result='<a style="text-decoration:none;color:blue;" href="#" onclick="locationXm('+"'"+row.ylxbh+"'"+')">定位</a>';
						result+='&nbsp;|&nbsp;<a href="javascript:openWindow('+"'yhdzxxx'"+','+"'养护大中修项目'"+','+
								"'/jxzhpt/page/qqgl/jhsh/yhdzx_xx.jsp'"+',980,400)" style="color:blue;">详细</a>';
						if(row.sqzt==0 || row.sqzt==9 || row.sqzt==11){
							result+='&nbsp;|&nbsp;<a href="javascript:openWindow('+"'yhdzxedit'"+','+"'养护大中修项目'"+','+
							"'/jxzhpt/page/qqgl/jhsh/yhdzx_edit.jsp'"+',980,400)" style="color:blue;">编辑</a>';
						}else{
							result+='&nbsp;|&nbsp;<a style="color:black;">编辑</a>';
						}
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
								result="未上报";
							}
						}else if(userPanduan($.cookie('unit2'))=="省"){
							if(Number(value)==Number($.cookie('unit2').length)){
								result="已审核";
							}else if(Number(value)==9){
								result="未审核";
							}else{
								result="未上报";
							}
						}
						return result;
					}
				},
				{field:'xmbm',title:'项目编码',width:100,align:'center'},
				{field:'xmmc',title:'项目名称',width:250,align:'center'},
				{field:'xzqh',title:'行政区划',width:100,align:'center'},
				{field:'gydw',title:'管养单位',width:100,align:'center'},
				{field:'ylxbh',title:'原路线编码',width:100,align:'center'},
				{field:'qdzh',title:'起点桩号',width:100,align:'center'},
				{field:'zdzh',title:'止点桩号',width:100,align:'center'},
				{field:'lc',title:'里程',width:100,align:'center'},
				{field:'jsdj',title:'技术等级',width:100,align:'center'},
				{field:'jhkgsj',title:'计划开工时间',width:100,align:'center'},
				{field:'jhwgsj',title:'计划完工时间',width:100,align:'center'},
				{field:'gq',title:'工期',width:100,align:'center'},
				{field:'ntz',title:'拟投资',width:100,align:'center'}]];
			gridBind(grid);
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
		function openYhdzx(){
			openWindow("yhdzxadd","添加养护大中修项目","yhdzxAdd.jsp",980,400);
		}
		$(window).resize(function () { 
			$('#grid').datagrid('resize');
		});
	</script>
</head>
<body>
	<div id="righttop">
		<div id="p_top">计划管理>&nbsp;项目计划库管理>&nbsp;养护大中修项目</div>
	</div>
	<table width="99%" border="0" style="margin-top: 1px; margin-left: 1px;" cellspacing="0" cellpadding="0">
       	<tr>
       		<td align="left" style="padding-left: 10px; padding-right: 10px;">
       			<fieldset id="searchField" style="width:100%; text-align: left; vertical-align: middle;">
       				<legend style="padding: 0 0 0 0; font-weight: bold; color: Gray; font-size: 12px;">
       					<font style="color: #0866A0; font-weight: bold"></font>
       				</legend>
       				<div>
       					<p style="margin:8px 0px 8px 20px;">
       						<span>管养单位：</span>
       						<select id="gydw" style="width:237px;"></select>
       						<span>&nbsp;行政区划：</span>
       						<select id="xzqh" style="width:170px;"></select>
       						<span>&nbsp;特殊地区：</span>
							<select name="tsdq" class="easyui-combobox" id="tsdq" style="width:150px;"></select>
       					</p>
       					<p style="margin:8px 0px 8px 20px;">
       						<span>项目名称：</span>
       						<input name="xmmc" id="xmmc" style="width:80px;" type="text"/>
							<span>&nbsp;技术等级:</span>
							<select name="jsdj" class="easyui-combobox" id="jsdj" style="width:81px;"></select>
							<span>&nbsp;上报状态：</span>
       						<select id="sqzt" class="easyui-combobox" style="width: 70px;"></select>
							<img onclick="queryYhdzx()" alt="搜索" src="../../../images/Button/Serch01.gif" onmouseover="this.src='../../../images/Button/Serch02.gif'" onmouseout="this.src='../../../images/Button/Serch01.gif'" style="vertical-align:middle;padding-left: 8px;"/>
							<img id="tj" name="dishi" alt="添加" onclick="openYhdzx()" style="disborder-width:0px;cursor: hand;vertical-align:middle;" src="../../../images/Button/tianj1.gif" onmouseover="this.src='../../../images/Button/tianj2.gif'" onmouseout="this.src='../../../images/Button/tianj1.gif'" src=""/>
							<img id="sb" name="dishi" alt="上报" onclick="batchSb()" style="border-width:0px;cursor: hand;vertical-align:middle;" onmouseover="this.src='../../../images/Button/shangbao_2.png'" alt="上报" onmouseout="this.src='../../../images/Button/shangbao_1.png'" src="../../../images/Button/shangbao_1.png"/>
							<img id="sc" name="dishi" alt="删除" onclick="deleteYhdzx()" style="vertical-align:middle;" src="../../../images/Button/delete1.jpg" onmouseover="this.src='../../../images/Button/delete2.jpg'" onmouseout="this.src='../../../images/Button/delete1.jpg'">
							<img id="sp" name="sheng" alt="审批" onclick="batchSp()" style="display:none;border-width:0px;cursor: hand;vertical-align:middle;" onmouseover="this.src='../../../images/Button/sp2.jpg'" alt="上报" onmouseout="this.src='../../../images/Button/sp1.jpg'" src="../../../images/Button/sp1.jpg"/>
			                <img id="th" name="sheng" alt="退回" onclick="" style="display:none;vertical-align:middle;" alt="退回" src="../../../images/Button/tuihui1.gif" onmouseover="this.src='../../../images/Button/tuihui2.gif'" onmouseout="this.src='../../../images/Button/tuihui1.gif'"/>
       					</p>
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
