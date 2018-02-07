<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>基础库管理安保工程项目</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/icon.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/autocomplete/jquery.autocomplete.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/autocomplete/jquery.autocomplete.js" ></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/util/jquery.cookie.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/YMLib.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/page/qqgl/js/loadTJ.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/page/qqgl/lxsh/js/sjgz.js"></script>

<style type="text/css">
TD {
font-size: 12px;
} 
a{
text-decoration:none;
}
</style>
</head>
<body>
<script type="text/javascript">
	var qdStr;
	var zdStr;
	function load(){
		var data=parent.obj;
		$.ajax({
			type:'post',
			url:'../../../qqgl/queryLxshByXmbm.do',
			data:'jhsh.xmlx='+2+'&jhsh.xmbm='+data.xmbm,
			dataType:'json',
			success:function(msg){
				$('#lxsh').form("load",msg);
				$("#sfbflx").combobox('setValue',msg.sfbflx);
				loadUnitedit("gydw",$.cookie("unit"),msg.gydwdm);
				$("#gydw").combotree('setValues',msg.gydwdm.split(","));
				loadDistedit("xzqh",$.cookie("dist"),msg.xzqhdm2);
				$("#xzqh").combotree('setValues',msg.xzqhdm2.split(","));
				//loadDist3("xzqh",msg.xzqhdm,$.cookie("dist"));
				$('#bzcs').val(msg.bzys);
				$("#dfzc").html(msg.dfzc);
				$("#lxmc").html(msg.lxmc);
				$("#ylxbh").val(msg.ghlxbh);
				$("#jsjsdj").val(msg.jsjsdj);
				$("#tsdq").html(msg.tsdq);
				$("#xjsdj").val(msg.xjsdj);
				$("#xmbm").html(msg.xmbm);
				$("#xmnf").combobox("setValue",msg.xmnf);
				$("#jhkgn").combobox("setValue",msg.jhkgn);
				$("#jhwgn").combobox("setValue",msg.jhwgn);
				qdStr=msg.gpsqdzh;
				zdStr=msg.gpszdzh;
				$("#span_qdzh").html("<font color='red' size='2'>*&nbsp;不能<</font>"+"<font color='red' size='2'>"+msg.gpsqdzh);
				$("#span_zdzh").html("<font color='red' size='2'>*&nbsp;不能></font>"+"<font color='red' size='2'>"+msg.gpszdzh);
				$("#xmklx").val(msg.xmklx);
			}
		});
			
	}
	
	$(function(){
		var data=parent.obj;
		$("#lxbm").val(data.ghlxbh);
		$("#lxmc").val(data.lxmc);
		$("#xmmc").val(data.xmmc);
		$("#qdzh").val(data.minqdzh);
		$("#zdzh").val(data.maxzdzh);
		$("#lc").val(data.lc);
		$("#qdmc").val(data.qdmc);
		$("#zdmc").val(data.zdmc);
		$("#jsxz").val(data.jsxz);
		$("#gydw").val(data.gydw);
		$("#xzqh").val(data.xzqh);
		$("#tsdq").val(data.tsdq);
		$("#jsjsdj").val(data.jsjsdj);
		$("#xjsdj").val(data.xjsdj);
		$("#xmbm").val(data.xmbm);
		$("#xmnf").val(data.xmnf);
		$("#jhkgn").val(data.jhkgn);
		$("#jhwgn").val(data.jhwgn);
		$("#tz").val(data.tz);
		$('#bz').val(data.bz);
		$("#bzcs").val(data.bzys);
		$("#dfzc").val(data.dfzc);
		$("#ghlxmc").val(data.ghlxmc);
		$("#ghlxbm").val(data.ghlxbm);
		$("#ghqdzh").val(data.ghqdzh);
		$("#ghzdzh").val(data.ghzdzh);
		$("#gxlxbm").val(data.gxlxbm);
		$("#gxqdzh").val(data.gxqdzh);
		$("#gxzdzh").val(data.gxzdzh);
		$('#yilc').val(data.yilc);
		$('#erlc').val(data.erlc);
		$('#sanlc').val(data.sanlc);
		$('#silc').val(data.silc);
		$('#dwlc').val(data.dwlc);
		$('#wllc').val(data.wllc);
		$("#yhdk").val(data.yhdk);
		$("#sfbflx").val(data.sfbflx);
		$("#xmklx").val(data.xmklx);
	
		xmnf1("xmnf",'2');
		xmnf2("jhkgn");
		xmnf2("jhwgn");
		load();
			$("#save_button").click(function(){
				var redqdzh = $("#span_qdzh").text().substr(5,$("#span_qdzh").text().length);
				var redzdzh = $("#span_zdzh").text().substr(5,$("#span_zdzh").text().length);
				//alert(redqdzh+"  "+redzdzh);
				if(parseFloat($("#ghqdzh").val())*1000<redqdzh*1000){
					alert("对不起，起点桩号不能小于"+redqdzh+"！");
					$("#ghqdzh").focus();
					return false;
				}
				if(parseFloat($("#ghzdzh").val())*1000>redzdzh*1000){
					alert("对不起，止点桩号不能大于"+redzdzh+"！");
					$("#ghzdzh").focus();
					return false;
				} 
				 if(parseFloat($("#ghqdzh").val())*1000>parseFloat($("#ghzdzh").val())*1000){
					alert("对不起，起点桩号不能大于止点桩号！");
					$("#ghqdzh").focus();
					return false;
				} 
			saveLxsh();
			
		});
			
			autoCompleteGHLXBM();
	});
	
	
	
	function saveLxsh(){
		//$("#dfzc").html('');
		var tz=0;var bzcs=0;
		if($("#tz").val()!='')
			tz=parseFloat($("#tz").val());
		if($("#bzcs").val()!='')
			bzcs=parseFloat($("#bzcs").val());
		if(bzcs>tz){
			alert("投资不能小于补助测算");
			return
		}
		var sbthcd=$.cookie("unit2").length;
		if($.cookie("unit2")=="______36"){
			sbthcd=7;
		}
		var data ="lxsh.xmmc="+$("#xmmc").val()+"&lxsh.ghlxbh="+$("#ylxbh").val()+"&lxsh.xmbm="+$("#xmbm").html()
		+"&lxsh.qdzh="+$("#qdzh").val()+"&lxsh.zdzh="+$("#zdzh").val()+"&lxsh.lc="+$("#lc").html()
		+"&lxsh.qdmc="+$("#qdmc").val()+"&lxsh.zdmc="+$("#zdmc").val()+"&lxsh.jsxz="+$("#jsxz").val()
		+"&lxsh.gydw="+$("#gydw").combobox("getText")+"&lxsh.xzqh="+$("#xzqh").combobox("getText")+"&lxsh.gydwdm="+$("#gydw").combobox("getValues").join(',')+"&lxsh.xzqhdm="+$("#xmbm").html().substr(4,6)+"&lxsh.xzqhdm2="+$('#xzqh').combo("getValues").join(",")+"&lxsh.tsdq="+$("#tsdq").html()
		+"&lxsh.jsjsdj="+$("#jsjsdj").val()+"&lxsh.xjsdj="+$("#xjsdj").val()
		+"&lxsh.jhkgn="+$("#jhkgn").combobox('getText')+"&lxsh.jhwgn="+$("#jhwgn").combobox('getText')
		+"&lxsh.tz="+$("#tz").val()+"&lxsh.bzys="+$("#bzcs").val()+"&lxsh.dfzc="+$("#dfzc").html()+"&lxsh.jdbs=0";
		//alert(data);
		data+="&lx.yilc="+$('#yilc').val()+"&lx.erlc="+$('#erlc').val()+"&lx.sanlc="+$('#sanlc').val()+"&lx.silc="+$('#silc').val()+
			"&lx.dwlc="+$('#dwlc').val()+"&lx.wllc="+$('#wllc').val()+"&lxsh.bz="+$('#bz').val()+"&lxsh.yhdk="+$('#yhdk').val()
			+"&lxsh.ghlxmc="+$('#ghlxmc').val()+"&lxsh.ghlxbm="+$('#ghlxbm').val()+"&lxsh.ghqdzh="+$('#ghqdzh').val()+"&lxsh.ghzdzh="+$('#ghzdzh').val()
			+"&lxsh.gxlxbm="+$('#gxlxbm').val()+"&lxsh.gxqdzh="+$('#gxqdzh').val()+"&lxsh.gxzdzh="+$('#gxzdzh').val()+"&lxsh.xmnf="+$('#xmnf').combobox("getValues")
			+"&lxsh.sfbflx="+$('#sfbflx').combobox('getValue')+'&lxsh.wnid='+parent.obj.wnid+'&lxsh.xmbm1='+parent.obj.xmbm;
		$.ajax({
			type:'post',
			url:'/jxzhpt/qqgl/updateLmgz.do',
	        data:data,
			dataType:'json',
			success:function(msg){
				if(Boolean(msg)){
					alert("保存成功！");
					parent.$('#datagrid').datagrid("reload");
					removes('lxxx');
				}else{
					alert('保存失败！');
				}
			}
		});
	}
	function changeZlc(){
		var zlc=Math.abs(accSub(parseFloat($("#zdzh").val()),parseFloat($("#qdzh").val())));
		$("#lc").val(zlc);
		selectTSDQ($("#ghlxbm").val(),$("#ghqdzh").val(),$("#ghzdzh").val());
		if($("#ghqdzh").val()!='')
			cxqdmc($("#ghlxbm").val(),$("#ghqdzh").val());
		if($("#ghzdzh").val()!='')
			cxzdmc($("#ghlxbm").val(),$("#ghzdzh").val());
	}
	
</script>
<form action="" id="lxsh">
	<table style="width: 100%; background-color: #aacbf8; font-size: 12px"
			border="0" cellpadding="3" cellspacing="1">
			<tr style="height: 30px;">
            	<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					规划路线编码</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input id="ghlxbm" name="ghlxbm" type="text" style="width: 120px;"/>&nbsp;
					
				</td>
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					规划起点桩号</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input id="ghqdzh" name="ghqdzh" onchange="querymcbygh()" type="text" style="width: 120px;"/>&nbsp;<br/>
					<span id="span_qdzh"></span>
				</td>
				<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					规划止点桩号</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input id="ghzdzh" name="ghzdzh" onchange="querymcbygh()" type="text" style="width: 120px;"/>&nbsp;<br/>
					<span id="span_zdzh"></span>
				</td>
            </tr>
            <tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					<font color='red' size='2'>*&nbsp;</font>原路线编码：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input type="hidden" name="xzqhdm" id="xzqhdm" style="width: 120px" />
					<input type="hidden" name="gydwdm" id="gydwdm" style="width: 120px" />
					<input readonly="readonly" name="ylxbh" id="ylxbh" type="text" style="width: 120px" /></td>
				
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					<font color='red' size='2'>*&nbsp;</font>原起点桩号：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input readonly="readonly" type="text" name="qdzh" id="qdzh" style="width: 120px" onblur="changeZlc()"/><br/>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					<font color='red' size='2'>*&nbsp;</font>原止点桩号：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input readonly="readonly" name="zdzh" id="zdzh" type="text" style="width: 120px" onblur="changeZlc()"/><br/>
				</td>
			</tr>
            <tr style="height: 30px;">
            	<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					共线路线编码</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input id="gxlxbm" name="gxlxbm" type="text" style="width: 120px;" readonly="readonly"/>&nbsp;
					
				</td>
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					共线起点桩号</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input id="gxqdzh" name="gxqdzh" type="text" style="width: 120px;" readonly="readonly"/>&nbsp;<br/>
				</td>
				<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					共线止点桩号</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input id="gxzdzh" name="gxzdzh" type="text" style="width: 120px;" readonly="readonly"/>&nbsp;<br/>
				</td>
            </tr>
			
			<tr style="height: 35px;">
			<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					<font color='red' size='2'>*&nbsp;</font>原路线名称：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<span id="lxmc"></span></td>
				
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					<font color='red' size='2'>*&nbsp;</font>里程：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input id="lc" name="lc" style="font-size: 14px;width: 100px;" type="text"/>&nbsp;公里
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					<font color='red' size='2'>*&nbsp;</font>起点名称：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input id="qdmc" name="qdmc" type="text" style="width: 120px;"/>
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					<font color='red' size='2'>*&nbsp;</font>止点名称：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input id="zdmc" name="zdmc" type="text" style="width: 120px;"/>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					<font color='red' size='2'>*&nbsp;</font>建设技术等级：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input id="jsjsdj" name="jsjsdj" type="text" style="width: 120px;"/>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					<font color='red' size='2'>*&nbsp;</font>现状技术等级：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input id="xjsdj" name="xjsdj" type="text" style="width: 120px;"/>
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">是否部分立项</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<select id='sfbflx' class="easyui-combobox" style="width: 120px;">
						<option value="否" selected="selected">否</option>
						<option value="是">是</option>
					</select>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">项目库类型</td>
				<td colspan="3" style="background-color: #ffffff; height: 20px;" align="left">
					<input id="xmklx" name="xmlkx" style="width: 120px;background-color: #EDEDED;" readonly="readonly"/>
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					技术等级及里程
				</td>
				<td colspan="5" style="background-color: #ffffff; height: 20px;width:18%" align="left">
					一级公路：<input id="yilc" onchange="cesuan2()" name="yilc" style="width: 50px;" type="text"/>
					二级公路：<input id="erlc" onchange="cesuan2()" name="erlc" style="width: 50px;" type="text"/>
					三级公路：<input id="sanlc" onchange="cesuan2()" name="sanlc" style="width: 50px;" type="text"/>
					四级公路：<input id="silc" onchange="cesuan2()" name="silc" style="width: 50px;" type="text"/>
					等外公路：<input id="dwlc" onchange="cesuan2()" name="dwlc" style="width: 50px;" type="text"/>
					无路：<input id="wllc" onchange="cesuan2()" name="wllc" style="width: 50px;" type="text"/>
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					<font color='red' size='2'>*&nbsp;</font>项目名称：
				</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input type="text" id="xmmc" name="xmmc" style="width: 120px"/>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">项目编码：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<span id="xmbm"></span>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					<font color='red' size='2'>*&nbsp;</font>建设性质：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input type="text" id="jsxz" name="jsxz" style="width: 120px"  value='路面改造'/>
				</td>
			</tr>
            <tr style="height: 35px;">
			    <td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					<font color='red' size='2'>*&nbsp;</font>管养单位：</td>
			    <td colspan="3" style="background-color: #ffffff; height: 25px;" align="left">
					<input type='text' id='gydw' style="width: 410px;"></td>
					
			    <td rowspan="2" style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">特殊地区：</td>
			    <td rowspan="2" style="background-color: #ffffff; height: 25px;" align="left">
					<span id="tsdq" style="font-size: 14px"></span></td>
			</tr>
			
			<tr style="height: 35px;">
			    <td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					<font color='red' size='2'>*&nbsp;</font>行政区划：</td>
			    <td colspan="3" style="background-color: #ffffff; height: 25px;" align="left">
					<input type='text' id='xzqh' style="width: 410px;"></td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right"><font color='red' size='2'>*&nbsp;</font>项目年份：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<select id="xmnf" name="xmnf" style="width:124px"class="easyui-combobox" data-options="panelHeight:'100'"></select>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right"><font color='red' size='2'>*&nbsp;</font>计划开工年：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<select id="jhkgn" name="jhkgn" style="width:124px"class="easyui-combobox" data-options="panelHeight:'100'"></select>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right"><font color='red' size='2'>*&nbsp;</font>计划完工年：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<select id="jhwgn" name="jhwgn" style="width:124px"class="easyui-combobox" data-options="panelHeight:'100'"></select>
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					<font color='red' size='2'>*&nbsp;</font>投资(万元)：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" id="tz" name="tz" onblur="checkdfzc(this)" style="width: 120px;"/></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					<font color='red' size='2'>*&nbsp;</font>补助测算(万元)：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" id="bzcs" readonly="readonly"  onblur="checkdfzc(this)" style="width: 120px;"/></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					<font color='red' size='2'>*&nbsp;</font>地方自筹(万元)：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="dfzc"></span>
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					<font color='red' size='2'>*&nbsp;</font>银行贷款(万元)：
				</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" id="yhdk" name="yhdk" style="width: 120px;"/>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right"></td>
				<td style="background-color: #ffffff; height: 20px;" align="left"></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right"></td>
				<td style="background-color: #ffffff; height: 20px;" align="left"></td>
			</tr>
			<tr style="height: 60px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					备注：</td>
				<td colspan="5" style="background-color: #ffffff; height: 20px;" align="left">
					<textarea id="bz" name="bz" style="width: 580px;height: 50px;"></textarea>
				</td>
			</tr>
			
			<tr style="height: 35px;">
				<td colspan="6" style="background-color: #ffffff;"align="center">
				<a href="javascript:void(0)" id="save_button" class="easyui-linkbutton" plain="true" iconCls="icon-save">保存</a>
				<a href="# "  onclick="removes('lxxx')" class="easyui-linkbutton"  plain="true" iconCls="icon-cancel">取消</a></td>
			</tr>
	</table>
</form>
</body>
</html>