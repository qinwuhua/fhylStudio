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
<script type="text/javascript" src="../../../page/qqgl/js/util.js"></script>

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
		var msg=parent.obj;
		$('#lxsh').form("load",msg);
				$('#lc').html(msg.lc);
				$('#jhlc').html(msg.jhlc);
				$("#lxmc").html(msg.lxmc);
				$("#ylxbh").val(msg.ghlxbh);
				loadUnitedit("gydw",$.cookie("unit"),msg.gydwdm);
				$("#gydw").combotree('setValues',msg.gydwdm.split(","));
				loadDistedit("xzqh",$.cookie("dist"),msg.xzqhdm);
				$("#xzqh").combotree('setValues',msg.xzqhdm.split(","));
				$("#tsdq").html(msg.tsdq);
				$("#xjsdj").val(msg.xjsdj);
				$("#gpsqdzh").val(msg.gpsqdzh);
				$("#gpszdzh").val(msg.gpszdzh);
				//$("#span_qdzh").html("<font color='red' size='2'>*&nbsp;不能<</font>"+"<font color='red' size='2'>"+msg.gpsqdzh);
				//$("#span_zdzh").html("<font color='red' size='2'>*&nbsp;不能></font>"+"<font color='red' size='2'>"+msg.gpszdzh);
				qdStr=parseFloat(msg.gpsqdzh);
				zdStr=parseFloat(msg.gpszdzh);
	}
	
	$(function(){
		xmnf1("xmnf");
		xmnf2("jhkgn");
		xmnf2("jhwgn");
		load();
		autoCompleteGHLXBM();
		$("#save_button").click(function(){
			
			/* if($("#qdmc").val()=="" || $("#qdmc").val()==null){
				alert("请填写起点名称！");
				return false;
			}
			if($("#zdmc").val()=="" || $("#zdmc").val()==null){
				alert("请填写止点名称！");
				return false;
			}
		
			if($("#qdzh").val()==null || $("#qdzh").val()=='' || isNaN($("#qdzh").val()) || parseFloat($("#qdzh").val())<0){
				alert("请填写正确的起点桩号！");
				$("#qdzh").focus();
				return false;
			}
			if($("#zdzh").val()==null || $("#zdzh").val()=='' || isNaN($("#zdzh").val()) || parseFloat($("#zdzh").val())<0){
				alert("请填写正确的止点桩号！");
				$("#zdzh").focus();
				return false;
			} */
			/* if(parseFloat($("#qdzh").val())*1000<qdStr*1000){
				alert("对不起，起点桩号不能小于"+qdStr+"！");
				$("#qdzh").focus();
				return false;
			}
			if(parseFloat($("#zdzh").val())*1000>zdStr*1000){
				alert("对不起，止点桩号不能大于"+zdStr+"！");
				$("#zdzh").focus();
				return false;
			} */
			var redqdzh = $("#span_qdzh").text().substr(5,$("#span_qdzh").text().length);
			var redzdzh = $("#span_zdzh").text().substr(5,$("#span_zdzh").text().length);
			
/* 			 if(parseFloat($("#ghqdzh").val())*1000<redqdzh*1000){
				alert("对不起，起点桩号不能小于"+redqdzh+"！");
				$("#ghqdzh").focus();
				return false;
			}
			if(parseFloat($("#ghzdzh").val())*1000>redzdzh*1000){
				alert("对不起，止点桩号不能大于"+redzdzh+"！");
				$("#ghzdzh").focus();
				return false;
			}  */
			 if(parseFloat($("#ghqdzh").val())*1000>parseFloat($("#ghzdzh").val())*1000){
				alert("对不起，起点桩号不能大于止点桩号！");
				$("#ghqdzh").focus();
				return false;
			} 
		
			saveLxsh();
		});

	});
	
	function saveLxsh(){
		$("#dfzc").html('');
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
		var data ="lxsh.ghlxbh="+$("#ylxbh").val()+"&lxsh.xmbm="+parent.obj.xmbm+"&lxsh.id="+parent.obj.id
		+"&lxsh.qdzh="+$("#qdzh").val()+"&lxsh.zdzh="+$("#zdzh").val()+"&lxsh.lc="+$("#lc").html()+"&lxsh.jhlc="+$("#jhlc").html()
		+"&lxsh.qdmc="+$("#qdmc").val()+"&lxsh.zdmc="+$("#zdmc").val()+"&lxsh.jsxz="+'改建'
		+"&lxsh.gydw="+$("#gydw").combobox("getText")
		+"&lxsh.xzqh="+$("#xzqh").combobox("getText")
		+"&lxsh.gydwdm="+$("#gydw").combobox("getValues").join(',')
		+"&lxsh.xzqhdm="+$("#xzqh").combobox("getValues").join(',')
		+"&lxsh.tsdq="+$("#tsdq").html()+"&lxsh.gpsqdzh="+$("#gpsqdzh").val()+"&lxsh.gpszdzh="+$("#gpszdzh").val()
		+"&lxsh.jsjsdj="+$("#jsjsdj").val()+"&lxsh.xjsdj="+$("#xjsdj").val();
		data+="&lxsh.yilc="+$('#yilc').val()+"&lxsh.erlc="+$('#erlc').val()+"&lxsh.sanlc="+$('#sanlc').val()+"&lxsh.silc="+$('#silc').val()+
			"&lxsh.dwlc="+$('#dwlc').val()+"&lxsh.wllc="+$('#wllc').val();
		data+="&lxsh.jhyilc="+$('#jhyilc').val()+"&lxsh.jherlc="+$('#jherlc').val()+"&lxsh.jhsanlc="+$('#jhsanlc').val()+
		"&lxsh.jhsilc="+$('#jhsilc').val()+"&lxsh.jhdwlc="+$('#jhdwlc').val()+"&lxsh.jhwllc="+$('#jhwllc').val()
		+"&lxsh.ghxlxmc="+$('#ghlxmc').val()+"&lxsh.ghxlxbm="+$('#ghlxbm').val()
		+"&lxsh.ghlxmc="+$('#ghlxmc').val()+"&lxsh.ghlxbm="+$('#ghlxbm').val()+"&lxsh.ghqdzh="+$('#ghqdzh').val()+"&lxsh.ghzdzh="+$('#ghzdzh').val()
		+"&lxsh.gxlxbm="+$('#gxlxbm').val()+"&lxsh.gxqdzh="+$('#gxqdzh').val()+"&lxsh.gxzdzh="+$('#gxzdzh').val()
		;
		$.ajax({
			type:'post',
			url:'/jxzhpt/qqgl/updatewnjhsjlx.do',
	        data:data,
			dataType:'json',
			success:function(msg){
				if(Boolean(msg)){
					alert("保存成功！");
					parent.$("#table_lx"+parent.obj.xmbm).datagrid("reload");
					parent.showgjtj('sjgz');
					removes('lxxx');
				}else{
					alert('保存失败！');
				}
			}
		});
	}
	function changeZlc(){
// 		var zlcs=accSub(parseFloat($("#zdzh").val()),parseFloat($("#qdzh").val()));var zlc=Math.abs(zlcs);
// 		$("#lc").val(zlc);
		queryJsdjAndLc($("#ghlxbm").val(),$("#ghqdzh").val(),$("#ghzdzh").val());
		jslc();
		cesuan();
		selectTSDQ($("#ghlxbm").val(),$("#ghqdzh").val(),$("#ghzdzh").val());
		if($("#ghqdzh").val()!='')
			cxqdmc($("#ghlxbm").val(),$("#ghqdzh").val());
		if($("#ghzdzh").val()!='')
			cxzdmc($("#ghlxbm").val(),$("#ghzdzh").val());
		getghlxinfo($('#ylxbh').val(),$('#qdzh').val(),$('#zdzh').val());
	}
</script>
<form action="" id="lxsh">
	<table style="width: 100%; background-color: #aacbf8; font-size: 12px" border="0" cellpadding="3" cellspacing="1">
			<tr style="height: 30px;">
            	<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					规划路线编码</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input id="ghlxbm" name="ghlxbm" type="text" style="width: 120px;"/>&nbsp;<span style="color: red;">*</span>
					
				</td>
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					规划起点桩号</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input id="ghqdzh" name="ghqdzh" onchange="querymcbygh()" type="text" style="width: 120px;"/>&nbsp;<span style="color: red;">*</span><br/>
					<span id="span_qdzh" style="font-size: small;color: red;"></span>
				</td>
				<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					规划止点桩号</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input id="ghzdzh" name="ghzdzh" onchange="querymcbygh()" type="text" style="width: 120px;"/>&nbsp;<span style="color: red;">*</span><br/>
					<span id="span_zdzh" style="font-size: small;color: red;"></span>
				</td>
            </tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					<font color='red' size='2'>*&nbsp;</font>原路线编码：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input readonly="readonly" type="text" name="ylxbh" id="ylxbh" style="width: 120px" />
					<input id="gpsqdzh" name="gpsqdzh" type="hidden"/>
					<input id="gpszdzh" name="gpszdzh" type="hidden"/>
					</td>
				
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					<font color='red' size='2'>*&nbsp;</font>原起点桩号：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input readonly="readonly" type="text" name="qdzh" id="qdzh" style="width: 120px" onblur="changeZlc()"/><br/>
					
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					<font color='red' size='2'>*&nbsp;</font>原止点桩号：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input readonly="readonly" type="text" name="zdzh" id="zdzh" style="width: 120px" onblur="changeZlc()"/><br/>
					
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					<font color='red' size='2'>*&nbsp;</font>原路线名称：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input type="text" name='lxmc' id='lxmc' style="width: 120px"/> 
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					<font color='red' size='2'>*&nbsp;</font>起点名称：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input id="qdmc" name="qdmc" style="width: 120px;"/>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					<font color='red' size='2'>*&nbsp;</font>止点名称：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input id="zdmc" name="zdmc" style="width: 120px;"/>
				</td>
			</tr>
			 
            <tr style="height: 30px;">
            	<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					共线路线编码</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input id="gxlxbm" name="gxlxbm" type="text" style="width: 120px;" readonly="readonly"/>&nbsp;<span style="color: red;">*</span>
					
				</td>
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					共线起点桩号</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input id="gxqdzh" name="gxqdzh" type="text" style="width: 120px;" readonly="readonly"/>&nbsp;<span style="color: red;">*</span><br/>
				</td>
				<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					共线止点桩号</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input id="gxzdzh" name="gxzdzh" type="text" style="width: 120px;" readonly="readonly"/>&nbsp;<span style="color: red;">*</span><br/>
				</td>
            </tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					<font color='red' size='2'>*&nbsp;</font>规划路线名称：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input id="ghlxmc" name="ghlxmc" style="width: 120px;" />
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					<font color='red' size='2'>*&nbsp;</font>现状技术等级：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input id="xjsdj" name="xjsdj" style="width: 120px;" />
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					<font color='red' size='2'>*&nbsp;</font>建设技术等级：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input id="jsjsdj" name="jsjsdj" style="width: 120px;" />
				</td>
				
			</tr>
			
			<tr style="height: 35px;">
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					现技术等<br/>级及里程
				</td>
				<td colspan="5" style="background-color: #ffffff; height: 20px;width:18%" align="left" >
					一级：<input onchange="jslc()" id="yilc" name="yilc" style="width: 50px;" type="text" value="0"/>
					二级：<input onchange="jslc()" id="erlc" name="erlc" style="width: 50px;" type="text" value="0"/>
					三级：<input onchange="jslc()" id="sanlc" name="sanlc" style="width: 50px;" type="text" value="0"/>
					四级：<input onchange="jslc()" id="silc" name="silc" style="width: 50px;" type="text" value="0"/>
					等外：<input onchange="jslc()" id="dwlc" name="dwlc" style="width: 50px;" type="text" value="0"/>
					无路：<input onchange="jslc()" id="wllc" name="wllc" style="width: 50px;" type="text" value="0"/>
					总计：<span id="lc" style="font-size: 14px">0</span>&nbsp;公里
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					建设技术<br/>等级及里程
				</td>
				<td colspan="5" style="background-color: #ffffff; height: 20px;width:18%" align="left">
					一级：<input id="jhyilc" onchange="cesuan()" name="jhyilc" style="width: 50px;" value="0" type="text"/>
					二级：<input id="jherlc" onchange="cesuan()" name="jherlc" style="width: 50px;" value="0" type="text"/>
					三级：<input id="jhsanlc" onchange="cesuan()" name="jhsanlc" style="width: 50px;" value="0" type="text"/>
					四级：<input id="jhsilc" onchange="cesuan()" name="jhsilc" style="width: 50px;" value="0" type="text"/>
					等外：<input id="jhdwlc" onchange="cesuan()" name="jhdwlc" style="width: 50px;" value="0" type="text"/>
					无路：<input id="jhwllc" onchange="cesuan()" name="jhwllc" style="width: 50px;" type="text" value="0"/>
					总计：<span id="jhlc" style="font-size: 14px">0</span>&nbsp;公里
				</td>
			</tr>
		    <tr style="height: 35px;">
			    <td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					<font color='red' size='2'>*&nbsp;</font>管养单位：</td>
				<td colspan="3" style="background-color: #ffffff; height: 25px;" align="left">
					<input type='text' id='gydw' style="width: 400px;"></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right"></td>
				<td style="background-color: #ffffff; height: 25px;" align="left"></td>	
            </tr>
            <tr style="height: 35px;">
			    <td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					<font color='red' size='2'>*&nbsp;</font>行政区划：</td>
				<td colspan="3" style="background-color: #ffffff; height: 25px;" align="left">
					<input type='text' id='xzqh' style="width: 400px;"></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right"></td>
				<td style="background-color: #ffffff; height: 25px;" align="left"></td>	
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