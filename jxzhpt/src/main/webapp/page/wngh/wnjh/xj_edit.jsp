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
<script type="text/javascript" src="${pageContext.request.contextPath}/page/wngh/wnjh/js/wnjh.js"></script>

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
			url:'../../../qqgl/cxwnghsjByid.do',
			data:'lxsh.xmlx='+3+'&lxsh.xmbm='+data.id,
			dataType:'json',
			success:function(msg){
				$('#lxsh').form("load",msg);
				loadUnit5("gydw",msg.gydwdm,$.cookie("unit"));
				loadDist5("xzqh",msg.xzqhdm,$.cookie("dist"));
				$('#lc').val(msg.lc);
				$('#bzcs').val(msg.bzys);
				$("#dfzc").html(msg.dfzc);
				$("#lxmc").val(msg.lxmc);
				$("#jsjsdj").val(msg.jsjsdj);
				$("#xmmc").val(msg.xmmc);
				$("#tsdq").val(msg.tsdq);
				$("#xjsdj").html(msg.xjsdj);
				$("#xmbm").html(msg.xmbm);
				$("#xmnf").combobox("setValue",msg.xmnf);
				$("#jhkgn").combobox("setValue",msg.jhkgn);
				$("#jhwgn").combobox("setValue",msg.jhwgn);
				$("#xjlc").val(msg.xjlc);
				$("#gz").val(msg.gz);
				$("#sz").val(msg.sz);
			}
		});
		
	}
	
	$(function(){
		xmnf1("xmnf");
		xmnf2("jhkgn");
		xmnf2("jhwgn");
		load();
			$("#save_button").click(function(){
			/* if($("#lxmc").val()=="" || $("#lxmc").val()==null){
				alert("请填写路线名称！");
				$("#lxmc").focus();
				return false;
			}
			if($("#qdmc").val()=="" || $("#qdmc").val()==null){
				alert("请填写起点名称！");
				return false;
			}
			if($("#zdmc").val()=="" || $("#zdmc").val()==null){
				alert("请填写止点名称！");
				return false;
			} */
			if($("#jsxz").val()=="" || $("#jsxz").val()==null){
				alert("请填写建设性质！");
				$("#jsxz").focus();
				return false;
			}
			if($("#tz").val()=="" || $("#tz").val()==null){
				alert("请填写投资！");
				$("#tz").focus();
				return false;
			}
			if($("#dfzc").html()=="" || $("#dfzc").html()==null){
				alert("请填写地方自筹！");
				return false;
			}
			if($("#bzcs").val()=="" || $("#bzcs").val()==null){
				alert("请填写补助测算");
				return false;
			}
			/* if($("#qdzh").val()==null || $("#qdzh").val()=='' || isNaN($("#qdzh").val()) || parseFloat($("#qdzh").val())<0){
				alert("请填写正确的起点桩号！");
				$("#qdzh").focus();
				return false;
			}
			if($("#zdzh").val()==null || $("#zdzh").val()=='' || isNaN($("#zdzh").val()) || parseFloat($("#zdzh").val())<0){
				alert("请填写正确的止点桩号！");
				$("#zdzh").focus();
				return false;
			}
			if(parseFloat($("#qdzh").val())*1000>parseFloat($("#zdzh").val())*1000){
				alert("对不起，起点桩号不能大于止点桩号！");
				$("#qdzh").focus();
				return false;
			} */
			if(parseInt($("#xmnf").html())>parseInt($("#jhkgn").combobox('getText'))){
				alert("对不起，开工年不能小于项目年份！");
				return false;
			}
			if(parseInt($("#jhkgn").combobox('getText'))>parseInt($("#jhwgn").combobox('getText'))){
				alert("对不起，开工年不能大于完工年！");
				return false;
			}
			saveLxsh();
		});

	});
	
	function saveLxsh(){
		var tz=0;var bzcs=0;
		if($("#tz").val()!='')
			tz=parseFloat($("#tz").val());
		if($("#bzcs").val()!='')
			bzcs=parseFloat($("#bzcs").val());
		if(bzcs>tz){
			alert("投资不能小于补助测算");
			return;
		}
		var sbthcd=$.cookie("unit2").length;
		if($.cookie("unit2")=="______36"){
			sbthcd=7;
		}
		var data ="lxsh.xmmc="+$("#xmmc").val()+"&lxsh.ghlxbh="+$("#lxbm").val()+"&lxsh.lxmc="+$("#lxmc").val()+"&lxsh.xmbm="+parent.obj.id
		+"&lxsh.qdzh="+$("#qdzh").val()+"&lxsh.zdzh="+$("#zdzh").val()+"&lxsh.lc="+$("#lc").val()
		+"&lxsh.qdmc="+$("#qdmc").val()+"&lxsh.zdmc="+$("#zdmc").val()+"&lxsh.jsxz="+$("#jsxz").val()
		+"&lxsh.jsjsdj="+$("#jsjsdj").val()+"&lxsh.xjsdj="+$("#xjsdj").val()
		+"&lxsh.gydw="+$("#gydw").combobox("getText")+"&lxsh.xzqh="+$("#xzqh").combobox("getText")+"&lxsh.gydwdm="
		+$("#gydw").combobox("getValue")+"&lxsh.xzqhdm="+$("#xzqh").combobox("getValue")+"&lxsh.tsdq="+$("#tsdq").val()
		+"&lxsh.xmnf="+$("#xmnf").combobox('getText')+"&lxsh.jhkgn="+$("#jhkgn").combobox('getText')+"&lxsh.jhwgn="+$("#jhwgn").combobox('getText')
		+"&lxsh.tz="+$("#tz").val()+"&lxsh.bzys="+$("#bzcs").val()+"&lxsh.dfzc="+$("#dfzc").html()+"&lxsh.jdbs=0";
		data+="&lxsh.xjlxbm="+$('#xjlxbm').val()+"&lxsh.xjqdzh="+$('#xjqdzh').val()+"&lxsh.xjzdzh="+$('#xjzdzh').val()
		+"&lxsh.xjlc="+$('#xjlc').val()+"&lxsh.bz="+$('#bz').val();
		data+="&lxsh.yilc="+$('#yilc').val()+"&lxsh.erlc="+$('#erlc').val()+"&lxsh.sanlc="+$('#sanlc').val()+
		"&lxsh.silc="+$('#silc').val()+"&lxsh.dwlc="+$('#dwlc').val()+"&lxsh.wllc="+$('#wllc').val()+
		"&lxsh.yhdk="+$('#yhdk').val()+"&lxsh.gz="+$('#gz').val()+"&lxsh.sz="+$('#sz').val();
		//alert(data);
		$.ajax({
			type:'post',
			url:'/jxzhpt/qqgl/updatewnjhxj.do',
	        data:data,
			dataType:'json',
			success:function(msg){
				if(Boolean(msg)){
					alert("保存成功！");
					parent.$('#datagrid').datagrid("reload");
					parent.showgjtj('xj');
					removes('lxxx');
				}else{
					alert('保存失败！');
				}
			}
		});
	}
	function changeZlc(){
		var qd=0;
		var zd=0;
		if($("#zdzh").val()==''){
			zd=0;
		}else{
			zd=parseFloat($("#zdzh").val());
		}
		if($("#qdzh").val()==''){
			qd=0;
		}else{
			qd=parseFloat($("#qdzh").val());
		}
		var zlc=accSub(zd,qd);
		$("#lc").val(zlc);
	}
	function changeZlc2(){
		var qd=0;
		var zd=0;
		if($("#xjzdzh").val()==''){
			zd=0;
		}else{
			zd=parseFloat($("#xjzdzh").val());
		}
		if($("#xjqdzh").val()==''){
			qd=0;
		}else{
			qd=parseFloat($("#xjqdzh").val());
		}
		var zlc=accSub(zd,qd);
		$("#xjlc").val(zlc);
	}
</script>
<form action="" id="lxsh">
	<table style="width: 100%; background-color: #aacbf8; font-size: 12px"
			border="0" cellpadding="3" cellspacing="1">
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					<font color='red' size='2'>*&nbsp;</font>路线编码：
				</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input type="text" id="lxbm" name="lxbm" style="width: 120px"/></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					<font color='red' size='2'>*&nbsp;</font>路线名称：
				</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input type="text" id="lxmc" name="lxmc" style="width: 120px"/>
				</td>
			<!-- 	<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					<font color='red' size='2'>*&nbsp;</font>项目名称：
				</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input type="text" id="xmmc" name="xmmc" style="width: 120px"/>
				</td> -->
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					<font color='red' size='2'>*&nbsp;</font>起点桩号：
				</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input type="text" name="qdzh" id="qdzh" style="width: 120px" onblur="changeZlc()"/><br/>
					<span id="qd"></span>
				</td>
			</tr>
			<tr style="height: 35px;">
				
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					<font color='red' size='2'>*&nbsp;</font>止点桩号：
				</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input type="text" name="zdzh" id="zdzh" style="width: 120px" onblur="changeZlc()"/><br/>
					<span id="zd"></span>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					<font color='red' size='2'>*&nbsp;</font>里程：
				</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input type="text"  id="lc" style="font-size: 14px;width: 50px" value="0"/>公里
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					<font color='red' size='2'>*&nbsp;</font>原起点名称：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" name="qdmc" id="qdmc" style="width: 120px" />
				</td>
			</tr>
			<tr style="height: 35px;">
				
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					<font color='red' size='2'>*&nbsp;</font>原止点名称：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" name="zdmc" id="zdmc" style="width: 120px" />
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					<font color='red' size='2'>*&nbsp;</font>新建路线编码：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" name="xjlxbm" id="xjlxbm" style="width: 120px">
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					<font color='red' size='2'>*&nbsp;</font>新建起点桩号：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" name="xjqdzh" id="xjqdzh" style="width: 120px" onblur="changeZlc2()"/>
				</td>
			</tr>
			<tr style="height: 35px;">
				
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					<font color='red' size='2'>*&nbsp;</font>新建止点桩号：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" name="xjzdzh"id="xjzdzh" style="width: 120px" onblur="changeZlc2()"/>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					<font color='red' size='2'>*&nbsp;</font>新建里程：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text"  id="xjlc" style="font-size: 14px;width: 50px" value="0"/>公里
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					<font color='red' size='2'>*&nbsp;</font>项目名称：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" id="xmmc" style="width: 120px"/>
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					技术等级及里程
				</td>
				<td colspan="5" style="background-color: #ffffff; height: 20px;width:18%" align="left">
					一级公路：<input id="yilc" name="yilc" style="width: 50px;" type="text"/>
					二级公路：<input id="erlc" name="erlc" style="width: 50px;" type="text"/>
					三级公路：<input id="sanlc" name="sanlc" style="width: 50px;" type="text"/>
					四级公路：<input id="silc" name="silc" style="width: 50px;" type="text"/>
					等外公路：<input id="dwlc" name="dwlc" style="width: 50px;" type="text"/>
					无路：<input id="wllc" name="wllc" style="width: 50px;" type="text"/>
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					<font color='red' size='2'>*&nbsp;</font>建设性质：
				</td>
				<td style="background-color: #ffffff; height: 25px;" align="left">
					<input type="text" id="jsxz" style="width: 120px"  value='新建'/>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					<font color='red' size='2'>*&nbsp;</font>管养单位：
				</td>
				<td style="background-color: #ffffff; height: 25px;" align="left">
					<input id='gydw' type="text" style="width: 124px;">
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					<font color='red' size='2'>*&nbsp;</font>行政区划：</td>
				<td style="background-color: #ffffff; height: 25px;" align="left">
					<input id='xzqh' type="text" style="width: 124px;">
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					特殊地区：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input type="text" id="tsdq" style="width: 124px"/>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					<font color='red' size='2'>*&nbsp;</font>建设技术等级：
				</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input id="jsjsdj" name="jsjsdj" type="text" style="width: 120px;"/>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					<font color='red' size='2'>*&nbsp;</font>现状技术等级：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input id="xjsdj" name="xjsdj" type="text" style="width: 120px;"/>
				</td>
			</tr>
			<tr style="height: 35px;">
				
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					<font color='red' size='2'>*&nbsp;</font>项目年份：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<select id="xmnf" style="width:124px" class="easyui-combobox" data-options="panelHeight:'100'"></select>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					<font color='red' size='2'>*&nbsp;</font>计划开工年：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<select id="jhkgn" style="width:124px"class="easyui-combobox" data-options="panelHeight:'100'"></select>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					<font color='red' size='2'>*&nbsp;</font>计划完工年：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<select id="jhwgn" style="width:124px"class="easyui-combobox" data-options="panelHeight:'100'"></select>
				</td>
			</tr>
			<tr style="height: 35px;">
				
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					<font color='red' size='2'>*&nbsp;</font>投资(万元)：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" id="tz" name="tz" onblur="checkdfzc1(this)" style="width: 120px;"/>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right"><font color='red' size='2'>*&nbsp;</font>补助测算(万元)：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type='text' id='bzcs' name="bzcs" onblur="checkdfzc1(this)" style="width: 120px;"/>
				</td>
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
					<input type="text" id="yhdk" name="yhdk" onblur="checkdfzc1(this)" style="width: 120px;"/>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					<font color='red' size='2'>*&nbsp;</font>国债(万元)：
				</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" id="gz" style="width: 120px;" onblur="checkdfzc1(this)"/>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					<font color='red' size='2'>*&nbsp;</font>省债(万元)：
				</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" id="sz" style="width: 120px;" onblur="checkdfzc1(this)"/>
				</td>
			</tr>
			<tr style="height: 60px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">备注：</td>
				<td colspan="5" style="background-color: #ffffff; height: 20px;" align="left">
					<textarea id="bz" name="bz" style="width: 500px;height: 50px;"></textarea>
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