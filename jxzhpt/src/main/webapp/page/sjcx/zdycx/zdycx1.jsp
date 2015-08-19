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
	var filedArray = new Array();
	var nameArray = new Array();
	$(function(){
		loadUnit("gydw",$.cookie("unit"));
		loadDist("xzqhmc",$.cookie("dist"));
		loadBmbm2("kgzt","开工状态");
		xmnf("xmnf");
		xmnf("jhnf");
		
		$("#btnSelect").click(function(){
			$('#dd').dialog('open');
		});
		$("#save_button").click(function(){
			filedArray.splice(0,filedArray.length);
			nameArray.splice(0,nameArray.length);
			var lxshCount=0,kxxyjCount=0,cbsjCount=0,jhshCount=0;
			
			lxshCount=$("input[name='lxsh']:checked").length;
			kxxyjCount=$("input[name='kxxyj']:checked").length;
			cbsjCount=$("input[name='cbsj']:checked").length;
			jhshCount=$("input[name='jhsh']:checked").length;
			$.each($("input[name='lxsh']:checked"),function(index,item){
				filedArray.push($(item).val().substring(0,$(item).val().indexOf("-")) +" as lx"+$(item).val().substring($(item).val().indexOf(".")+1,$(item).val().indexOf("-")));
				nameArray.push($(item).val().substring($(item).val().indexOf("-")+1));
			});
			$.each($("input[name='kxxyj']:checked"),function(index,item){
				filedArray.push($(item).val().substring(0,$(item).val().indexOf("-")) +" as kxx"+$(item).val().substring($(item).val().indexOf(".")+1,$(item).val().indexOf("-")));
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
				title.push({colspan:lxshCount,title:"立项审核信息",align:'center'});
			}
			if(kxxyjCount>0){
				title.push({colspan:kxxyjCount,title:"可行性研究信息",align:'center'});
			}
			if(cbsjCount>0){
				title.push({colspan:cbsjCount,title:"初步设计信息",align:'center'});
			}
			if(jhshCount>0){
				title.push({colspan:jhshCount,title:"计划审核信息",align:'center'});
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
			    width:1070
			});
			$('#dd').dialog('close');
			var options = $("#grid").datagrid("options");
			var c = new Array();
			c.push(title);
			c.push(cols);
			options.columns=c;
			$('#grid').datagrid(options);
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
	function exportExcel(){
		alert("sssssss");
		var param="filed="+filedArray.join(",")+"&filedName="+nameArray.join(",")+"&xmlx="+$('#xmlx').combobox("getValue");
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
		<div id="p_top">数据查询>&nbsp;自定义查询>&nbsp;改建、改造、新建自定义查询</div>
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
						<option value="1">改建工程</option>
						<option value="2">路面改造工程</option>
						<option value="3">新建工程</option>
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
						<td colspan="2" style="background-color: #ffffff;width:20%" align="center">立项审核</td>
						<td colspan="2" style="background-color: #ffffff;width:20%" align="center">工程可行性研究</td>
						<td colspan="3"  style="background-color: #ffffff;" align="center">初步设计或施工图</td>
						<td colspan="2" style="background-color: #ffffff;width:25%" align="center">计划审核</td>
					</tr>
					<tr  style="height: 30px;">
						<td colspan="2" style="background-color: #ffffff;" align="center">
							<input  type="radio" value="qx" onclick="qx('lxsh')" name="radio1" id="qx1"/>全选
							<input  type="radio" value="fx" onclick="fx('lxsh')" name="radio1" id="fx1"/>反选
							<input  type="radio" value="bx" onclick="bx('lxsh')" name="radio1" id="bx1"/>不选</td>
						<td colspan="2" style="background-color: #ffffff;" align="center">
							<input  type="radio" value="qx" onclick="qx('kxxyj')" name="radio2" id="qx2"/>全选
							<input  type="radio" value="fx" onclick="fx('kxxyj')" name="radio2" id="fx2"/>反选
							<input  type="radio" value="bx" onclick="bx('kxxyj')" name="radio2" id="bx2"/>不选</td>
						<td colspan="3" style="background-color: #ffffff;" align="center">
							<input  type="radio" value="qx" onclick="qx('cbsj')" name="radio3" id="qx3"/>全选
							<input  type="radio" value="fx" onclick="fx('cbsj')" name="radio3" id="fx3"/>反选
							<input  type="radio" value="bx" onclick="bx('cbsj')" name="radio3" id="bx3"/>不选</td>
						<td colspan="2" style="background-color: #ffffff;" align="center">
							<input  type="radio" value="qx" onclick="qx('jhsh')" name="radio3" id="qx3"/>全选
							<input  type="radio" value="fx" onclick="fx('jhsh')" name="radio3" id="fx3"/>反选
							<input  type="radio" value="bx" onclick="bx('jhsh')" name="radio3" id="bx3"/>不选</td>
					</tr>
					<tr  style="height: 30px;">
						<td colspan="2" style="background-color: #ffffff;" align="center">
							<table>
								<tr>
									<td><input type="checkbox" id="lxbm" name="lxsh" value="l.ghlxbh-路线编码"/>路线编码</td>
									<td style="padding-left: 10px;"><input type="checkbox" id="lxmc" name="lxsh" value="l.lxmc-路线名称"/>路线名称</td>
								</tr>
								<tr>
									<td><input type="checkbox" id="qdzh" name="lxsh" value="l.qdzh-起点桩号"/>起点桩号</td>
									<td style="padding-left: 10px;"><input type="checkbox" id="zdzh" name="lxsh" value="l.zdzh-止点桩号"/>止点桩号</td>
								</tr>
								<tr>
									<td><input type="checkbox" id="lc" name="lxsh" value="l.lc-里程"/>里程</td>
									<td style="padding-left: 10px;"><input type="checkbox" id="qdmc" name="lxsh" value="l.qdmc-起点名称"/>起点名称</td>
								</tr>
								<tr>
									<td><input type="checkbox" id="zdmc" name="lxsh" value="l.zdmc-止点名称"/>止点名称</td>
									<td style="padding-left: 10px;"><input type="checkbox" id="xjsdj" name="lxsh" value="l.xjsdj-现技术等级"/>现技术等级</td>
								</tr>
								<tr>
									<td><input type="checkbox" id="jsjsdj" name="lxsh" value="l.jsjsdj-建设技术等级"/>建设技术等级</td>
									<td style="padding-left: 10px;"><input type="checkbox" id="xmbm" name="lxsh" value="l.xmbm-项目编码"/>项目编码</td>
								</tr>
								<tr>
									<td><input type="checkbox" id="xmmc" name="lxsh" value="l.xmmc-项目名称"/>项目名称</td>
									<td style="padding-left: 10px;"><input type="checkbox" id="jsxz" name="lxsh" value="l.jsxz-建设性质"/>建设性质</td>
								</tr>
								<tr>
									<td><input type="checkbox" id="gydw" name="lxsh" value="l.gydw-管养单位"/>管养单位</td>
									<td style="padding-left: 10px;"><input type="checkbox" id="xzqh" name="lxsh" value="l.xzqh-行政区划"/>行政区划</td>
								</tr>
								<tr>
									<td><input type="checkbox" id="xmnf" name="lxsh" value="l.xmnf-项目年份"/>项目年份</td>
									<td style="padding-left: 10px;"><input type="checkbox" id="jhkgn" name="lxsh" value="l.jhkgn-计划开工年"/>计划开工年</td>
								</tr>
								<tr>
									<td><input type="checkbox" id="jhwgn" name="lxsh" value="l.jhwgn-计划完工年"/>计划完工年</td>
									<td style="padding-left: 10px;"><input type="checkbox" id="tz" name="lxsh" value="l.tz-投资"/>投资</td>
								</tr>
								<tr>
									<td><input type="checkbox" id="bzys" name="lxsh" value="l.bzys-补助测算"/>补助测算</td>
									<td style="padding-left: 10px;"><input type="checkbox" id="dfzc" name="lxsh" value="l.dfzc-地方自筹"/>地方自筹</td>
								</tr>
								<tr>
									<td><input type="checkbox" id="yhdk" name="lxsh" value="l.yhdk-银行贷款"/>银行贷款</td>
									<td style="padding-left: 10px;"><input type="checkbox" id="bz" name="lxsh" value="l.bz-备注"/>备注</td>
								</tr>
								<tr>
									<td><input type="checkbox" id="tsdq" name="lxsh" value="l.tsdq-特殊地区"/>特殊地区</td>
									<td style="padding-left: 10px;"></td>
								</tr>
							</table>
						</td>
						<td colspan="2" style="background-color: #ffffff;" align="center">
							<table>
								<tr>
									<td><input type="checkbox" id="k.xmbm" name="kxxyj" value="k.xmbm-项目编码"/>项目编码</td>
									<td style="padding-left: 10px;"><input type="checkbox" id="k.qdzh" name="kxxyj" value="k.qdzh-起点桩号"/>起点桩号</td>
								</tr>
								<tr>
									<td><input type="checkbox" id="k.zdzh" name="kxxyj" value="k.zdzh-止点桩号"/>止点桩号</td>
									<td style="padding-left: 10px;"><input type="checkbox" id="k.lc" name="kxxyj" value="k.lc-里程"/>里程</td>
								</tr>
								<tr>
									<td><input type="checkbox" id="k.jsxz" name="kxxyj" value="k.jsxz-建设性质"/>建设性质</td>
									<td style="padding-left: 10px;"><input type="checkbox" id="k.jsjsdj" name="kxxyj" value="k.jsjsdj-建设技术等级"/>建设技术等级</td>
								</tr>
								<tr>
									<td><input type="checkbox" id="k.jsdw" name="kxxyj" value="k.jsdw-建设单位"/>建设单位</td>
									<td style="padding-left: 10px;"><input type="checkbox" id="k.dq_m" name="kxxyj" value="k.dq_m-大桥长度"/>大桥长度</td>
									
								</tr>
								<tr>
									<td><input type="checkbox" id="k.dq" name="kxxyj" value="k.dq-大桥数量"/>大桥数量</td>
									<td style="padding-left: 10px;"><input type="checkbox" id="k.sd_m" name="kxxyj" value="k.sd_m-隧道长度"/>隧道长度</td>
								</tr>
								<tr>
									
									<td><input type="checkbox" id="k.sd" name="kxxyj" value="k.sd-隧道数量"/>隧道数量</td>
									<td style="padding-left: 10px;"><input type="checkbox" id="k.kgny" name="kxxyj" value="k.kgny-开工年月"/>开工年月</td>
								</tr>
								<tr>
									<td><input type="checkbox" id="k.wgny" name="kxxyj" value="k.wgny-完工年月"/>完工年月</td>
									<td style="padding-left: 10px;"><input type="checkbox" id="k.bzdw" name="kxxyj" value="k.bzdw-编制单位"/>编制单位</td>
								</tr>
								<tr>
									<td><input type="checkbox" id="k.tzgs" name="kxxyj" value="k.tzgs-投资估算"/>投资估算</td>
									<td style="padding-left: 10px;"><input type="checkbox" id="k.gkpfwh" name="kxxyj" value="k.gkpfwh-工可批复文号"/>工可批复文号</td>
								</tr>
								<tr>
									<td><input type="checkbox" id="k.pfsj" name="kxxyj" value="k.pfsj-批复时间"/>批复时间</td>
									<td style="padding-left: 10px;"><input type="checkbox" id="k.xzqh" name="kxxyj" value="k.xzqh-行政区划"/>行政区划</td>
								</tr>
							</table>
						</td>
						<td colspan="3" style="background-color: #ffffff;" align="center">
							<table>
								<tr>
									<td><input type="checkbox" id="c.xzqh" name="cbsj" value="c.xzqh-行政区划"/>行政区划</td>
									<td style="padding-left: 10px;"><input type="checkbox" id="c.jsdw" name="cbsj" value="c.jsdw-建设单位"/>建设单位</td>
									<td style="padding-left: 10px;"><input type="checkbox" id="c.jsxz" name="cbsj" value="c.jsxz-建设性质"/>建设性质</td>
								</tr>
								<tr>
									<td><input type="checkbox" id="c.jsjsdj" name="cbsj" value="c.jsjsdj-建设技术等级"/>建设技术等级</td>
									<td style="padding-left: 10px;"><input type="checkbox" id="c.qdzh" name="cbsj" value="c.qdzh-起点桩号"/>起点桩号</td>
									<td style="padding-left: 10px;"><input type="checkbox" id="c.zdzh" name="cbsj" value="c.zdzh-止点桩号"/>止点桩号</td>
								</tr>
								<tr>
									<td><input type="checkbox" id="c.lj" name="cbsj" value="c.lj-路基(m3)"/>路基(m3)</td>
									<td style="padding-left: 10px;"><input type="checkbox" id="c.lc" name="cbsj" value="c.lc-里程"/>里程</td>
									<td style="padding-left: 10px;"><input type="checkbox" id="c.ql" name="cbsj" value="c.ql-桥梁(座)"/>桥梁(座)</td>
								</tr>
								<tr>
									<td><input type="checkbox" id="c.ql_ym" name="cbsj" value="c.ql_ym-桥梁(延米)"/>桥梁(延米)</td>
									<td style="padding-left: 10px;"><input type="checkbox" id="c.hd" name="cbsj" value="c.hd-涵洞(座)"/>涵洞(座)</td>
									<td style="padding-left: 10px;"><input type="checkbox" id="c.hd_m" name="cbsj" value="c.hd_m-涵洞(延米)"/>涵洞(延米)</td>
								</tr>
								<tr>
									<td><input type="checkbox" id="c.sd" name="cbsj" value="c.sd-隧道(座)"/>隧道(座)</td>
									<td style="padding-left: 10px;"><input type="checkbox" id="c.sd_ym" name="cbsj" value="c.sd_ym-隧道(延米)"/>隧道(延米)</td>
									<td style="padding-left: 10px;"><input type="checkbox" id="c.mc" name="cbsj" value="c.mc-面层类型"/>面层类型</td>
								</tr>
								<tr>
									<td><input type="checkbox" id="c.mc_lc" name="cbsj" value="c.mc_lc-面层里程"/>面层里程</td>
									<td style="padding-left: 10px;"><input type="checkbox" id="c.jc" name="cbsj" value="c.jc-基层类型"/>基层类型</td>
									<td style="padding-left: 10px;"><input type="checkbox" id="c.jc_lc" name="cbsj" value="c.jc_lc-基层里程"/>基层里程</td>
								</tr>
								<tr>
									<td><input type="checkbox" id="c.mc_dc" name="cbsj" value="c.dc-垫层类型"/>垫层类型</td>
									<td style="padding-left: 10px;"><input type="checkbox" id="c.dc_lc" name="cbsj" value="c.dc_lc-垫层里程"/>垫层里程</td>
									<td style="padding-left: 10px;"><input type="checkbox" id="c.dq" name="cbsj" value="c.dq-大桥名称"/>大桥名称</td>
								</tr>
								<tr>
									<td><input type="checkbox" id="c.dq_cd" name="cbsj" value="c.dq_cd-大桥长度"/>大桥长度</td>
									<td style="padding-left: 10px;"><input type="checkbox" id="c.dq_dk" name="cbsj" value="c.dq_dk-大桥单跨"/>大桥单跨</td>
									<td style="padding-left: 10px;"><input type="checkbox" id="c.sdmc" name="cbsj" value="c.sdmc-隧道名称"/>隧道名称</td>
								</tr>
								<tr>
									<td><input type="checkbox" id="c.sd_sfcd" name="cbsj" value="c.sd_sfcd-隧道双幅长度"/>隧道双幅长度</td>
									<td style="padding-left: 10px;"><input type="checkbox" id="c.sd_lx" name="cbsj" value="c.sd_lx-隧道类型"/>隧道类型</td>
									<td style="padding-left: 10px;"><input type="checkbox" id="c.kgsj" name="cbsj" value="c.kgsj-开工时间"/>开工时间</td>
								</tr>
								<tr>
									<td><input type="checkbox" id="c.wgsj" name="cbsj" value="c.wgsj-完工时间"/>完工时间</td>
									<td style="padding-left: 10px;"><input type="checkbox" id="c.gq" name="cbsj" value="c.gq-工期"/>工期</td>
									<td style="padding-left: 10px;"><input type="checkbox" id="c.sjdw" name="cbsj" value="c.sjdw-设计单位"/>设计单位</td>
								</tr>
								<tr>
									<td><input type="checkbox" id="c.sjpfwh" name="cbsj" value="c.sjpfwh-设计批复文号"/>设计批复文号</td>
									<td style="padding-left: 10px;"><input type="checkbox" id="c.pfsj" name="cbsj" value="c.pfsj-批复时间"/>批复时间</td>
									<td style="padding-left: 10px;"><input type="checkbox" id="c.jaf" name="cbsj" value="c.jaf-建安费"/>建安费</td>
								</tr>
								<tr>
									<td><input type="checkbox" id="c.dfzc" name="cbsj" value="c.dfzc-地方自筹"/>地方自筹</td>
									<td style="padding-left: 10px;"><input type="checkbox" id="c.yhdk" name="cbsj" value="c.yhdk-银行贷款"/>银行贷款</td>
									<td style="padding-left: 10px;"></td>
								</tr>
							</table>
						</td>
						<td colspan="2" style="background-color: #ffffff;" align="center">
							<table>
								<tr>
									<td><input type="checkbox" id="j.pfztz" name="jhsh" value="j.pfztz-批复总投资"/>批复总投资</td>
									<td style="padding-left: 10px;"><input type="checkbox" id="j.bbzzj" name="jhsh" value="j.bbzzj-部补助资金"/>部补助资金</td>
								</tr>
								<tr>
									<td><input type="checkbox" id="j.sbzzj" name="jhsh" value="j.sbzzj-省补助资金"/>省补助资金</td>
									<td style="padding-left: 10px;"><input type="checkbox" id="j.xdwh" name="jhsh" value="j.xdwh-计划下达文号"/>下达文号</td>
								</tr>
								<tr>
									<td><input type="checkbox" id="j.xdsj" name="jhsh" value="j.xdsj-计划下达文号"/>下达时间</td>
									<td style="padding-left: 10px;"><input type="checkbox" id="j.sfqxkg" name="jhsh" value="j.sfqxkg-是否全线开工"/>是否全线开工</td>
								</tr>
								<tr>
									<td><input type="checkbox" id="j.sgdw" name="jhsh" value="j.sgdw-施工单位"/>施工单位</td>
									<td style="padding-left: 10px;"><input type="checkbox" id="j.jldw" name="jhsh" value="j.jldw-监理单位"/>监理单位</td>
								</tr>
								<tr>
									<td><input type="checkbox" id="j.jsdw" name="jhsh" value="j.jsdw-建设单位"/>建设单位</td>
									<td style="padding-left: 10px;"><input type="checkbox" id="j.sjkgsj" name="jhsh" value="j.sjkgsj-实际开工时间"/>实际开工时间</td>
								</tr>
								<tr>
									<td><input type="checkbox" id="j.yjwgsj" name="jhsh" value="j.yjwgsj-预计完工时间"/>预计完工时间</td>
									<td style="padding-left: 10px;"><input type="checkbox" id="j.htje" name="jhsh" value="j.htje-合同金额"/>合同金额</td>
								</tr>
								<tr>
									<td><input type="checkbox" id="j.gys" name="jhsh" value="j.gys-概预算"/>概预算</td>
									<td style="padding-left: 10px;"><input type="checkbox" id="j.sfgk" name="jhsh" value="j.sfgk-是否归口"/>是否归口</td>
								</tr>
								<tr>
									<td><input type="checkbox" id="j.sjwgsj" name="jhsh" value="j.sjwgsj-实际完工时间"/>实际完工时间</td>
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