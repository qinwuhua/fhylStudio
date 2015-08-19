<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>自定义查询</title>
<link rel="stylesheet" type="text/css" href="../../../css/Top.css" />
<link rel="stylesheet" type="text/css" href="../../../css/style.css" />
<link rel="stylesheet" type="text/css" href="../../../easyui/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="../../../easyui/themes/icon.css" />
<script type="text/javascript" src="../../../easyui/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="../../../easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../../../easyui/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/util/jquery.cookie.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/YMLib.js"></script>
<script type="text/javascript" src="../js/sjcx.js"></script>
<script type="text/javascript">
	var lxshCount=0,kxxyjCount=0,cbsjCount=0,jhshCount=0;
	var filedArray = new Array();
	var nameArray = new Array();
	$(function(){
		loadUnit("gydw",$.cookie("unit"));
		loadDist("xzqhmc",$.cookie("dist"));
		loadBmbm2("kgzt","开工状态");
		xmnf("xmnf");
		xmnf("jhnf");
		
		$("#btnSelect").click(function(){
			if($('#xmlx').combobox("getValue")=="4"){
				$('#yhjhsh').show();
				$('#shjhsh').hide();
			}else{
				$('#yhjhsh').hide();
				$('#shjhsh').show();
			}
			$('#dd').dialog('open');
		});
		$("#save_button").click(function(){
			filedArray.splice(0,filedArray.length);
			nameArray.splice(0,nameArray.length);
			lxshCount=$("input[name='xmsq']:checked").length;
			cbsjCount=$("input[name='cbsj']:checked").length;
			jhshCount=$("input[name='jhsh']:checked").length;
			$.each($("input[name='xmsq']:checked"),function(index,item){
				filedArray.push($(item).val().substring(0,$(item).val().indexOf("-")) +" as xm"+$(item).val().substring($(item).val().indexOf(".")+1,$(item).val().indexOf("-")));
				nameArray.push($(item).val().substring($(item).val().indexOf("-")+1));
			});
			$.each($("input[name='cbsj']:checked"),function(index,item){
				filedArray.push($(item).val().substring(0,$(item).val().indexOf("-")) +" as cb"+$(item).val().substring($(item).val().indexOf(".")+1,$(item).val().indexOf("-")));
				nameArray.push($(item).val().substring($(item).val().indexOf("-")+1));
			});
			$.each($("input[name='jhsh']:checked"),function(index,item){
				filedArray.push($(item).val().substring(0,$(item).val().indexOf("-")) +" as jh"+$(item).val().substring($(item).val().indexOf(".")+1,$(item).val().indexOf("-")));
				nameArray.push($(item).val().substring($(item).val().indexOf("-")+1));
			});
			var cols = new Array();
			var title = new Array();
			if(lxshCount>0){
				title.push({colspan:lxshCount,title:"立项审核信息",width:100,align:'center'});
			}
			if(cbsjCount>0){
				title.push({colspan:cbsjCount,title:"初步设计信息",width:100,align:'center'});
			}
			if(jhshCount>0){
				title.push({colspan:jhshCount,title:"计划审核信息",width:100,align:'center'});
			}
			$.each(nameArray,function(index,item){
				var col = {field:filedArray[index].substring(filedArray[index].indexOf("as ")+3).toUpperCase(),
						title:item,width:100,align:'center'};
				cols.push(col);
			});
			var gydw=$('#gydw').combotree("getValue");
			var xzqhdm=$('#xzqhmc').combotree("getValue");
			
			$('#grid').datagrid({
				url:'/jxzhpt/qqgl/zdyQuery.do',
				queryParams:{
					xmlx:$('#xmlx').combobox("getValue"),
					filed:filedArray.join(","),
					gydw: function(){
			    		if(gydw.substr(gydw.length-2,2)=='00'){
			    			gydw=gydw.substr(0,gydw.length-2);
			    			if(gydw.substr(gydw.length-2,2)=='00'){
			    				gydw=gydw.substr(0,gydw.length-2);
			    			}
			    		}
			    		return gydw;
			    	},
			    	xzqh:function(){
				 		if(xzqhdm.substr(xzqhdm.length-2,2)=='00'){
				 			xzqhdm=xzqhdm.substr(0,xzqhdm.length-2);
			    			if(xzqhdm.substr(xzqhdm.length-2,2)=='00'){
			    				xzqhdm=xzqhdm.substr(0,xzqhdm.length-2);
			    			}
			    		}
			    		return xzqhdm;
				 	},
				 	lxmc:$('#lxmc').val(),
				 	lxbm:$('#lxbm').val(),
				 	xmbm:$('#xmnf').combobox("getValue"),
				 	kgzt:$('#kgzt').combobox("getValue")
				},
				striped:true,
				pagination:true,
			    rownumbers:true,
			    pageNumber:1,
			    pageSize:10,
			    height:345,
			    width:1070,
			    columns:[title,cols]
			});
			$('#dd').dialog('close');
		});
	});
	function qx(id){
		$.each($("input[name='"+id+"']"),function(index,item){
			$(item).attr("checked", true);
		});
	}
	function fx(id){
		$.each($("input[name='"+id+"']"),function(index,item){
			$(item).attr("checked", !$(this).attr("checked"));
		});
	}
	function bx(id){
		$.each($("input[name='"+id+"']"),function(index,item){
			$(item).attr("checked", false);
		});
	}
	function qx1(){
		$.each($("input[type='checkbox']"),function(index,item){
			$(item).attr("checked", true);
		});
	}
	function fx1(){
		$.each($("input[type='checkbox']"),function(index,item){
			$(item).attr("checked", !$(this).attr("checked"));
		});
	}
	function bx1(){
		$.each($("input[type='checkbox']"),function(index,item){
			$(item).attr("checked", false);
		});
	}
	function qx3(id){
		var table="",table1="";
		if($('#xmlx').combobox("getValue")=="4"){
			table="yhjhsh";
			table1="shjhsh";
		}else{
			table="shjhsh";
			table1="yhjhsh";
		}
		$.each($("#"+table+" input[name='"+id+"']"),function(index,item){
			$(item).attr("checked", true);
		});
		$.each($("#"+table1+" input[name='"+id+"']"),function(index,item){
			$(item).attr("checked", false);
		});
	}
	function fx3(id){
		var table="",table1="";
		if($('#xmlx').combobox("getValue")=="4"){
			table="yhjhsh";
			table1="shjhsh";
		}else{
			table="shjhsh";
			table1="yhjhsh";
		}
		$.each($("#"+table+" input[name='"+id+"']"),function(index,item){
			$(item).attr("checked", !$(this).attr("checked"));
		});
		$.each($("#"+table1+" input[name='"+id+"']"),function(index,item){
			$(item).attr("checked", false);
		});
	}
	function bx3(id){
		$.each($("input[name='"+id+"']"),function(index,item){
			$(item).attr("checked", false);
		});
	}
	function exportExcel(){
		var gydw=$('#gydw').combotree("getValue");
		var xzqhdm=$('#xzqhmc').combotree("getValue");
		var param="filed="+filedArray.join(",")+"&filedName="+nameArray.join(",")+"&xmlx="+$('#xmlx').combobox("getValue");
		if(gydw.substr(gydw.length-2,2)=='00'){
			gydw=gydw.substr(0,gydw.length-2);
			if(gydw.substr(gydw.length-2,2)=='00'){
				gydw=gydw.substr(0,gydw.length-2);
			}
		}
		param+="&gydw="+gydw;
		if(xzqhdm.substr(xzqhdm.length-2,2)=='00'){
 			xzqhdm=xzqhdm.substr(0,xzqhdm.length-2);
			if(xzqhdm.substr(xzqhdm.length-2,2)=='00'){
				xzqhdm=xzqhdm.substr(0,xzqhdm.length-2);
			}
		}
		param+="&xzqh="+xzqhdm;
		param+="&lxmc="+$('#lxmc').val();
		param+="&lxbm="+$('#lxbm').val();
		param+="&xmbm="+$('#xmnf').combobox("getValue");
		param+="&kgzt="+$('#kgzt').combobox("getValue");
		window.location.href='/jxzhpt/qqgl/zdyExportExcel.do?'+param;
	}
</script>
<style type="text/css">
TD {font-size: 12px;}
a{text-decoration:none;}
</style>
</head>
<body>
	
		<div id="righttop">
		<div id="p_top">数据查询>&nbsp;自定义查询>&nbsp;养护大中修、灾毁自定义查询</div>
		</div>

<center>
<table style="width: 80%; margin-top: 15px; background-color: #aacbf8; font-size: 12px;"
			border="0" cellpadding="3" cellspacing="1">
			<tr  style="height: 30px;">
				<td style="background-color: #ffffff;width:15%" align="right">管养单位：</td>
				<td style="background-color: #ffffff;" align="left">
					<select  id="gydw" style="width:160px"></select></td>
				<td style="background-color: #ffffff;width:15%" align="right">行政区划：</td>
				<td style="background-color: #ffffff;" align="left">
					<select id="xzqhmc" style="width:160px"></select></td>
				<td style="background-color: #ffffff;width:15%" align="right">路线名称：</td>
				<td style="background-color: #ffffff;" align="left">
					<input type="text" id="lxmc" style="width: 145px"/>
				</td>
			</tr>
			<tr  style="height: 30px;">
				<td style="background-color: #ffffff;width:15%" align="right">项目类型：</td>
				<td style="background-color: #ffffff;" align="left">
					<select id="xmlx" style="width: 160px" class="easyui-combobox" >
						<option value="4">养护大中修</option>
						<option value="5">灾毁重建</option>
					</select>
				</td>
				<td style="background-color: #ffffff;width:15%" align="right">开工状态：</td>
				<td style="background-color: #ffffff;" align="left">
					<select  id="kgzt" style="width: 160px"></select>
				</td>
				<td style="background-color: #ffffff;width:15%" align="right">路线编码：</td>
				<td style="background-color: #ffffff;" align="left">
					<input type="text" id="lxbm" style="width: 145px"/>
				</td>
			</tr>
			<tr  style="height: 30px;">
				<td style="background-color: #ffffff;width:15%" align="right">项目年份：</td>
				<td style="background-color: #ffffff;" align="left">
					<select  id="xmnf" style="width:160px"></select></td>
				<td style="background-color: #ffffff;width:15%" align="right"></td>
				<td style="background-color: #ffffff;" align="left"></td>
				<td style="background-color: #ffffff;width:15%" align="right"></td>
				<td style="background-color: #ffffff;" align="left"></td>
			</tr>
			<tr  style="height: 30px;">
				<td colspan="6" style="background-color: #ffffff;width:15%" align="center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<img name="btnSelect" id="btnSelect" onmouseover="this.src='../../../images/Button/Serch02.gif'" alt="查询" onmouseout="this.src='../../../images/Button/Serch01.gif'" src="../../../images/Button/Serch01.gif"  style="border-width:0px;cursor: hand;" />&nbsp;&nbsp;&nbsp;
					<img  onclick="exportExcel()" alt="导出Excel" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/dcecl2.gif'"  onmouseout="this.src='${pageContext.request.contextPath}/images/Button/dcecl1.gif'" src="${pageContext.request.contextPath}/images/Button/dcecl1.gif" style="border-width:0px;cursor: hand;" />
				</td>
			</tr>
			</table><br/>
			<div>
				<table id="grid" width="100%" > </table>
			</div>
			<div id="dd" class="easyui-dialog" title="自定义字段" style="width:1000px;height:450px;" data-options="iconCls:'icon-save',resizable:true,modal:true,closed:true">
				<table style="width: 100%; background-color: #aacbf8; font-size: 12px;" border="1" cellpadding="2" cellspacing="1">
					<tr  style="height: 30px;">
						<td colspan="9" style="background-color: #ffffff;"align="center" >
							<input  type="radio" onclick="qx1()" value="qx" name="radio" id="qx"/>全选
							<input  type="radio" onclick="fx1()" value="fx" name="radio" id="fx"/>反选
							<input  type="radio" onclick="bx1()" value="bx" name="radio" id="bx"/>不选
						</td>
					</tr>
					<tr  style="height: 30px;">
						<td colspan="2" style="background-color: #ffffff;width:33%" align="center">立项审核</td>
						<td colspan="2" style="background-color: #ffffff;width:33%" align="center">初步设计或施工图</td>
						<td colspan="3"  style="background-color: #ffffff;" align="center">计划审核</td>
					</tr>
					<tr  style="height: 30px;">
						<td colspan="2" style="background-color: #ffffff;" align="center">
							<input  type="radio" value="qx" onclick="qx('xmsq')" name="radio1" id="qx1"/>全选
							<input  type="radio" value="fx" onclick="fx('xmsq')" name="radio1" id="fx1"/>反选
							<input  type="radio" value="bx" onclick="bx('xmsq')" name="radio1" id="bx1"/>不选</td>
						<td colspan="2" style="background-color: #ffffff;" align="center">
							<input  type="radio" value="qx" onclick="qx('cbsj')" name="radio2" id="qx2"/>全选
							<input  type="radio" value="fx" onclick="fx('cbsj')" name="radio2" id="fx2"/>反选
							<input  type="radio" value="bx" onclick="bx('cbsj')" name="radio2" id="bx2"/>不选</td>
						<td colspan="3" style="background-color: #ffffff;" align="center">
							<input  type="radio" value="qx" onclick="qx3('jhsh')" name="radio3" id="qx3"/>全选
							<input  type="radio" value="fx" onclick="fx3('jhsh')" name="radio3" id="fx3"/>反选
							<input  type="radio" value="bx" onclick="bx3('jhsh')" name="radio3" id="bx3"/>不选</td>
					</tr>
					<tr  style="height: 30px;">
						<td colspan="2" style="background-color: #ffffff;" align="center">
							<table>
								<tr>
									<td><input type="checkbox" id="x.ylxbh" name="xmsq" value="x.ylxbh-原路线编码"/>原路线编号</td>
									<td style="padding-left: 10px;"><input type="checkbox" id="ghlxbh" name="xmsq" value="x.ghlxbh-规划路线编号"/>规划路线编号</td>
								</tr>
								<tr>
									<td><input type="checkbox" id="x.lmkd" name="xmsq" value="x.lmkd-路面宽度"/>路面宽度</td>
									<td style="padding-left: 10px;"><input type="checkbox" id="x.lxmc" name="xmsq" value="x.lxmc-路线名称"/>路线名称</td>
								</tr>
								<tr>
									<td><input type="checkbox" id="x.qdmc" name="xmsq" value="x.qdmc-起点名称"/>起点名称</td>
									<td style="padding-left: 10px;"><input type="checkbox" id="x.zdmc" name="xmsq" value="x.zdmc-止点名称"/>止点名称</td>
								</tr>
								<tr>
									<td><input type="checkbox" id="x.qdzh" name="xmsq" value="x.qdzh-起点桩号"/>起点桩号</td>
									<td style="padding-left: 10px;"><input type="checkbox" id="x.zdzh" name="xmsq" value="x.zdzh-止点桩号"/>止点桩号</td>
								</tr>
								<tr>
									<td><input type="checkbox" id="x.lc" name="xmsq" value="x.lc-里程"/>里程</td>
									<td style="padding-left: 10px;"><input type="checkbox" id="x.jsdj" name="xmsq" value="x.jsdj-技术等级"/>技术等级</td>
								</tr>
								<tr>
									<td><input type="checkbox" id="x.xzqh" name="xmsq" value="x.xzqh-行政区划"/>行政区划</td>
									<td style="padding-left: 10px;"><input type="checkbox" id="x.gydw" name="xmsq" value="x.gydw-管养单位"/>管养单位</td>
								</tr>
								<tr>
									<td><input type="checkbox" id="x.xmbm" name="xmsq" value="x.xmbm-项目编码"/>项目编码</td>
									<td style="padding-left: 10px;"><input type="checkbox" id="x.xmmc" name="xmsq" value="x.xmmc-项目名称"/>项目名称</td>
								</tr>
								<tr>
									<td><input type="checkbox" id="x.jhkgsj" name="xmsq" value="x.jhkgsj-计划开工时间"/>计划开工时间</td>
									<td style="padding-left: 10px;"><input type="checkbox" id="x.jhwgsj" name="xmsq" value="x.jhwgsj-计划完工时间"/>计划完工时间</td>
								</tr>
								<tr>
									<td><input type="checkbox" id="x.gq" name="xmsq" value="x.gq-工期"/>工期</td>
									<td style="padding-left: 10px;"><input type="checkbox" id="x.gcfl" name="xmsq" value="x.gcfl-工程分类"/>工程分类</td>
								</tr>
								<tr>
									<td><input type="checkbox" id="x.tsdq" name="xmsq" value="x.tsdq-工期"/>特殊地区</td>
									<td style="padding-left: 10px;"><input type="checkbox" id="x.jsfa" name="xmsq" value="x.jsfa-建设方案"/>建设方案</td>
								</tr>
								<tr>
									<td><input type="checkbox" id="x.ntz" name="xmsq" value="x.ntz-拟投资"/>拟投资</td>
									<td style="padding-left: 10px;"></td>
								</tr>
							</table>
						</td>
						<td colspan="2" style="background-color: #ffffff;" align="center">
							<table>
								<tr>
									<td><input type="checkbox" id="c.xmmc" name="cbsj" value="c.xmmc-项目名称"/>项目名称</td>
									<td style="padding-left: 10px;"><input type="checkbox" id="c.jsdw" name="cbsj" value="c.jsdw-建设单位"/>建设单位</td>
								</tr>
								<tr>
									<td><input type="checkbox" id="c.xzqh" name="cbsj" value="c.xzqh-行政区划"/>行政区划</td>
									<td style="padding-left: 10px;"><input type="checkbox" id="c.jsjsdj" name="cbsj" value="c.jsjsdj-建设技术等级"/>建设技术等级</td>
								</tr>
								<tr>
									<td><input type="checkbox" id="c.jsxz" name="cbsj" value="c.jsxz-建设性质"/>建设性质</td>
									<td style="padding-left: 10px;"><input type="checkbox" id="c.qdzh" name="cbsj" value="c.qdzh-起点桩号"/>起点桩号</td>
								</tr>
								<tr>
									<td><input type="checkbox" id="c.zdzh" name="cbsj" value="c.zdzh-止点桩号"/>止点桩号</td>
									<td style="padding-left: 10px;"><input type="checkbox" id="c.mc" name="cbsj" value="c.mc-面层结构"/>面层结构</td>
								</tr>
								<tr>
									<td><input type="checkbox" id="c.jc" name="cbsj" value="c.jc-基层结构"/>基层结构</td>
									<td style="padding-left: 10px;"><input type="checkbox" id="c.dc" name="cbsj" value="c.dc-垫层结构"/>垫层结构</td>
								</tr>
								<tr>
									<td><input type="checkbox" id="c.mc_lc" name="cbsj" value="c.mc_lc-面层里程"/>面层里程</td>
									<td style="padding-left: 10px;"><input type="checkbox" id="c.jc_lc" name="cbsj" value="c.jc_lc-基层里程"/>基层里程</td>
								</tr>
								<tr>
									<td><input type="checkbox" id="c.dc_lc" name="cbsj" value="c.dc_lc-垫层里程"/>垫层里程</td>
									<td style="padding-left: 10px;"><input type="checkbox" id="c.kgsj" name="cbsj" value="c.kgsj-开工时间"/>开工时间</td>
								</tr>
								<tr>
									<td><input type="checkbox" id="c.wgsj" name="cbsj" value="c.wgsj-完工时间"/>完工时间</td>
									<td style="padding-left: 10px;"><input type="checkbox" id="c.gq" name="cbsj" value="c.gq-工期"/>工期</td>
								</tr>
								<tr>
									<td><input type="checkbox" id="c.sjdw" name="cbsj" value="c.sjdw-设计单位"/>设计单位</td>
									<td style="padding-left: 10px;"><input type="checkbox" id="c.sjpfwh" name="cbsj" value="c.sjpfwh-设计批复文号"/>设计批复文号</td>
								</tr>
								<tr>
									<td><input type="checkbox" id="c.pfsj" name="cbsj" value="c.pfsj-批复时间"/>批复时间</td>
									<td style="padding-left: 10px;"><input type="checkbox" id="c.jsfa" name="cbsj" value="c.jsfa-建设方案"/>建设方案</td>
								</tr>
							</table>
						</td>
						<td colspan="3" style="background-color: #ffffff;" align="center">
							<table id="yhjhsh">
								<tr>
									<td><input type="checkbox" id="j.ztz" name="jhsh" value="j.ztz-总投资"/>总投资</td>
									<td style="padding-left: 10px;"><input type="checkbox" id="j.sysbbzj" name="jhsh" value="j.sysbbzj-省以上补助资金"/>省以上补助资金</td>
								</tr>
								<tr>
									<td><input type="checkbox" id="j.yqdbcgs" name="jhsh" value="j.yqdbcgs-已确定部车购税"/>已确定部车购税</td>
									<td style="padding-left: 10px;"><input type="checkbox" id="j.xdwh" name="jhsh" value="j.xdwh-计划下达文号"/>计划下达文号</td>
								</tr>
								<tr>
									<td><input type="checkbox" id="j.xdsj" name="jhsh" value="j.xdsj-计划下达时间"/>计划下达时间</td>
									<td style="padding-left: 10px;"><input type="checkbox" id="j.ylxbh" name="jhsh" value="j.ylxbh-原路线编号"/>原路线编号</td>
								</tr>
								<tr>
									<td><input type="checkbox" id="j.qdzh" name="jhsh" value="j.qdzh-起点桩号"/>起点桩号</td>
									<td style="padding-left: 10px;"><input type="checkbox" id="j.zdzh" name="jhsh" value="j.zdzh-止点桩号"/>止点桩号</td>
								</tr>
								<tr>
									<td><input type="checkbox" id="j.lc" name="jhsh" value="j.lc-里程"/>里程</td>
									<td style="padding-left: 10px;"><input type="checkbox" id="j.mclmlx" name="jhsh" value="j.mclmlx-面层路面类型"/>面层路面类型</td>
								</tr>
								<tr>
									<td><input type="checkbox" id="j.mclx" name="jhsh" value="j.mclx-面层材料类型"/>面层材料类型</td>
									<td style="padding-left: 10px;"><input type="checkbox" id="j.mcsl" name="jhsh" value="j.mcsl-面层数量"/>面层数量</td>
								</tr>
								<tr>
									<td><input type="checkbox" id="j.mcje" name="jhsh" value="j.mcje-面层金额"/>面层金额</td>
									<td style="padding-left: 10px;"><input type="checkbox" id="j.jclx" name="jhsh" value="j.jclx-基层类型"/>基层类型</td>
								</tr>
								<tr>
									<td><input type="checkbox" id="j.jcsl" name="jhsh" value="j.jcsl-基层数量"/>基层数量</td>
									<td style="padding-left: 10px;"><input type="checkbox" id="j.jcje" name="jhsh" value="j.jcje-基层金额"/>基层金额</td>
								</tr>
								<tr>
									<td><input type="checkbox" id="j.xfcsl" name="jhsh" value="j.xfcsl-下封层数量"/>下封层数量</td>
									<td style="padding-left: 10px;"><input type="checkbox" id="j.xfcje" name="jhsh" value="j.xfcje-下封层金额"/>下封层金额</td>
								</tr>
								<tr>
									<td><input type="checkbox" id="j.bxsl" name="jhsh" value="j.bxsl-标线数量"/>标线数量</td>
									<td style="padding-left: 10px;"><input type="checkbox" id="j.bxje" name="jhsh" value="j.bxje-标线金额"/>标线金额</td>
								</tr>
								<tr>
									<td><input type="checkbox" id="j.gfcd" name="jhsh" value="j.gfcd-灌缝数量"/>灌缝数量</td>
									<td style="padding-left: 10px;"><input type="checkbox" id="j.gfje" name="jhsh" value="j.gfje-灌缝金额"/>灌缝金额</td>
								</tr>
								<tr>
									<td><input type="checkbox" id="j.llcl" name="jhsh" value="j.llcl-老路处理"/>老路处理</td>
									<td style="padding-left: 10px;"></td>
								</tr>
							</table>
							<table id="shjhsh">
								<tr>
									<td><input type="checkbox" id="j.pfztz" name="jhsh" value="j.pfztz-批复总投资"/>批复总投资</td>
									<td style="padding-left: 10px;"><input type="checkbox" id="j.bbzzj" name="jhsh" value="j.bbzzj-部补助资金"/>部补助资金</td>
								</tr>
								<tr>
									<td><input type="checkbox" id="j.sbzzj" name="jhsh" value="j.sbzzj-省补助资金"/>省补助资金</td>
									<td style="padding-left: 10px;"><input type="checkbox" id="j.ylxbh" name="jhsh" value="j.ylxbh-原路线编号"/>原路线编号</td>
								</tr>
								<tr>
									<td><input type="checkbox" id="j.qdzh" name="jhsh" value="j.qdzh-起点桩号"/>起点桩号</td>
									<td style="padding-left: 10px;"><input type="checkbox" id="j.zdzh" name="jhsh" value="j.zdzh-止点桩号"/>止点桩号</td>
								</tr>
								<tr>
									<td><input type="checkbox" id="j.lc" name="jhsh" value="j.lc-里程"/>里程</td>
									<td style="padding-left: 10px;"><input type="checkbox" id="j.xdwh" name="jhsh" value="j.xdwh-计划下达文号"/>计划下达文号</td>
								</tr>
								<tr>
									<td><input type="checkbox" id="j.xdsj" name="jhsh" value="j.xdsj-计划下达时间"/>计划下达时间</td>
									<td style="padding-left: 10px;"></td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td colspan="9" style="background-color: #ffffff; height: 35px;"
							align="center"><a href="javascript:void(0)" id="save_button"
							class="easyui-linkbutton" plain="true" iconCls="icon-ok">确认</a> <a
							href="javascript:void(0)" id="qx_window"
							class="easyui-linkbutton" plain="true" iconCls="icon-cancel">取消</a></td>
					</tr>
				</table>
			</div>
		</center>
</body>
</html>