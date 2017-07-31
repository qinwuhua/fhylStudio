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
	<script type="text/javascript" src="${pageContext.request.contextPath}/page/qqgl/js/util.js"></script>
	<style type="text/css">
		TD {font-size: 12px;} 
		a{text-decoration:none;}
	</style>
	<script type="text/javascript">
		var qdStr;
		var zdStr;
		$(function(){
			loadDistadd("xzqh",$.cookie("dist"));
			loadUnitadd("gydw",$.cookie("unit"));
			//alert(parent.obj.xmbm);
			$('#xmbm').html(parent.obj.xmbm);
			$('#jdbs').val(parent.obj.jdbs);
			autoCompleteGHLXBM();
		});
		
		function updateLx(){
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
			 if($('#xzqh').combo("getValues").join(",")==""){
					alert("请选择行政区划！");
					return false;
				}
				if($('#gydw').combo("getValues").join(',')==""){
					alert("请选择管养单位！");
					return false;
				}
			var params={'lx.jdbs':$('#jdbs').val(),'lx.xmid':$('#xmbm').html(),'lx.lxmc':$('#lxmc').val(),
					'lx.lxbm':$('#ylxbh').val(),'lx.zdzh':$('#zdzh').val(),'lx.qdzh':$('#qdzh').val(),
					'lx.lc':$('#lc').val(),'lx.qdmc':$('#qdmc').val(),'lx.zdmc':$('#zdmc').val(),'lx.jsxz':$('#jsxz').val(),
					'lx.gydw':$('#gydw').combobox("getText"),'lx.gydwdm':$('#gydw').combobox("getValues").join(','),
					'lx.xzqh':$('#xzqh').combobox("getText"),'lx.xzqhdm':$('#xzqh').combobox("getValues").join(','),
					'lx.yilc':$('#yilc').val(),'lx.erlc':$('#erlc').val(),'lx.sanlc':$('#sanlc').val(),
					'lx.silc':$('#silc').val(),'lx.dwlc':$('#dwlc').val(),'lx.wllc':$('#wllc').val(),
					'lx.jsjsdj':$('#jsjsdj').val(),'lx.xjsdj':$('#jsdj').val(),'lx.jsfa':$('#jsfa').val()
					,"lx.gpsqdzh":$('#gpsqdzh').val(),"lx.gpszdzh":$('#gpszdzh').val()
					,"lx.ghlxmc":$('#ghlxmc').val(),"lx.ghlxbm":$('#ghlxbm').val(),"lx.ghqdzh":$('#ghqdzh').val(),"lx.ghzdzh":$('#ghzdzh').val()
					,"lx.gxlxbm":$('#gxlxbm').val(),"lx.gxqdzh":$('#gxqdzh').val(),"lx.gxzdzh":$('#gxzdzh').val(),'lx.lmkd':$('#lmkd').val()};
			$.ajax({
				type:'post',
				url:'/jxzhpt/qqgl/insertLx.do',
		        data:params,
				dataType:'json',
				success:function(msg){
					if(msg.result=="true"){
						alert("保存成功!");
						if(parent.YMLib.Var.xmbm.substring(10,11)=="4"){
							parent.queryYhdzx();
						}else if(parent.YMLib.Var.xmbm.substring(10,11)=="5"){
							parent.queryShxm();
						}
						closeWindow(parent.obj.id);
					}else if(msg.result=="have"){
						alert("路线 "+$('#ylxbh').val()+"【"+$('#qdzh').val()+"-"+$('#zdzh').val()+"】已存在"+panduanxmlx(msg.lx.xmid)+"【"+msg.lx.xmmc+"】"+"中！");
					}else{
						alert("保存失败！");
					}
				}
			});
		}
		function changeZlc(){
			
			var zlcs=accSub(parseFloat($("#zdzh").val()),parseFloat($("#qdzh").val()));var zlc=Math.abs(zlcs);
			queryJsdjAndLc($('#ghlxbm').val(),$("#ghqdzh").val(),$("#ghzdzh").val());
			
			if(parseFloat($('#ghqdzh').val())<parseFloat($('#ghzdzh').val()))
			getylxlminfo($('#ghlxbm').val(),$('#ghqdzh').val(),$('#ghzdzh').val());
			else
			getylxlminfo($('#ghlxbm').val(),$('#ghzdzh').val(),$('#ghqdzh').val());

			$("#lc").val(zlc);
			//selectTSDQ($("#ghlxbm").val(),$("#ghqdzh").val(),$("#ghzdzh").val());
			if($("#ghqdzh").val()!='')
				cxqdmc($("#ghlxbm").val(),$("#ghqdzh").val());
			if($("#ghzdzh").val()!='')
				cxzdmc($("#ghlxbm").val(),$("#ghzdzh").val());

		}
		function removes(){
			closeWindow(parent.obj.id);
		}
	</script>
</head>
<body>
	<form action="" id="lx">
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
					<span id="span_qdzh"></span>
				</td>
				<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					规划止点桩号</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input id="ghzdzh" name="ghzdzh" onchange="querymcbygh()" type="text" style="width: 120px;"/>&nbsp;<span style="color: red;">*</span><br/>
					<span id="span_zdzh"></span>
				</td>
            </tr>
            <tr style="height: 35px;">
			<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right"><font color='red' size='2'>*&nbsp;</font>原路线编码：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input readonly="readonly" id="ylxbh" name="ylxbh" type="text" style="width: 120px;"/>&nbsp;<span style="color: red;">*</span>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					<font color='red' size='2'>*&nbsp;</font>原起点桩号：
				</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input readonly="readonly" type="text" name="qdzh" id="qdzh" style="width: 120px" onblur="changeZlc()"/>
					<input type="hidden" id="gpsqdzh" name="gpsqdzh"/>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					<font color='red' size='2'>*&nbsp;</font>原止点桩号：
				</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input readonly="readonly" type="text" name="zdzh"id="zdzh" style="width: 120px" onblur="changeZlc()"/><br/>
					<input type="hidden" id="gpszdzh" name="gpszdzh"/>
				</td>
				
			</tr>
             <tr style="height: 30px;">
				<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					共线路线编码</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input id="gxlxbm" name="gxlxbm" type="text" style="width: 120px;" readonly="readonly"/>&nbsp;<span style="color: red;">*</span>
					
				</td>
				<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
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
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right"><font color='red' size='2'>*&nbsp;</font>项目编码：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="xmbm"></span>
					<input id="id" name="id" type="hidden"/>
					<input id="jdbs" name="jdbs" type="hidden"/>
				</td>
				
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right"><font color='red' size='2'>*&nbsp;</font>原路线名称：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input name="lxmc" id="lxmc" type="text" style="width: 120px;">
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					<font color='red' size='2'>*&nbsp;</font>里程：
				</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input name="lc" id="lc" type="text" style="width: 100px;"/>&nbsp;公里
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					<font color='red' size='2'>*&nbsp;</font>管养单位：
				</td>
				<td style="background-color: #ffffff; height: 25px;" align="left">
					<input type='text' id='gydw' name="gydw" style="width: 124px;">
					<input id='gydwdm' name="gydwdm" style="width: 124px;" type="hidden">
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					<font color='red' size='2'>*&nbsp;</font>行政区划：
				</td>
				<td style="background-color: #ffffff; height: 25px;" align="left" >
					<input type='text' id='xzqh' name="xzqh" style="width: 124px;">
					<input id='xzqhdm' name="xzqhdm" style="width: 124px;" type="hidden">
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					<font color='red' size='2'>*&nbsp;</font>路面宽度：
				</td>
				<td style="background-color: #ffffff; height: 25px;" align="left" colspan="3">
					<input id="lmkd" name="lmkd" type="text" style="width: 80px;" readonly="readonly"/>&nbsp;米&nbsp;
				</td>
			</tr>
			
			
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					<font color='red' size='2'>*&nbsp;</font>起点名称：
				</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input name="qdmc" id="qdmc" type="text" style="width: 120px;">
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					<font color='red' size='2'>*&nbsp;</font>止点名称：
				</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input name="zdmc" id="zdmc" type="text" style="width: 120px;"/>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					<font color='red' size='2'>*&nbsp;</font>建设性质：
				</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input name="jsxz" id="jsxz" style="width:120px" type="text"/>
				</td>
			</tr>
			
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					<font color='red' size='2'>*&nbsp;</font>规划路线名称：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input id="ghlxmc" name="ghlxmc" style="width: 120px;" />
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					现技术等<br/>级及里程
				</td>
				<td style="background-color: #ffffff; height: 20px;" align="left" colspan="5">
					一级公路：<input id="yilc" name="yilc" onchange="cesuan2()" style="width: 50px;" type="text"/>
					二级公路：<input id="erlc" name="erlc" onchange="cesuan2()" style="width: 50px;" type="text"/>
					三级公路：<input id="sanlc" name="sanlc" onchange="cesuan2()" style="width: 50px;" type="text"/>
					四级公路：<input id="silc" name="silc" onchange="cesuan2()" style="width: 50px;" type="text"/>
					等外公路：<input id="dwlc" name="dwlc" onchange="cesuan2()" style="width: 50px;" type="text"/>
					无路：<input id="wllc" name="wllc" onchange="cesuan2()" style="width: 50px;" type="text"/>
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					<font color='red' size='2'>*&nbsp;</font>建设技术等级：
				</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input id="jsjsdj" name="jsjsdj" type="text" style="width: 120px;"/>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					<font color='red' size='2'>*&nbsp;</font>现状技术等级：
				</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input name="jsdj" id="jsdj" type="text" style="width: 120px;"/>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right"></td>
				<td style="background-color: #ffffff; height: 20px;" align="left"></td>
			</tr>
			<tr style="height: 70px;">
            	<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					建设方案</td>
				<td colspan="5" style="background-color: #ffffff; height: 20px;" align="left">
					<textarea id="jsfa" name="jsfa" rows="" cols="" style="width: 650px;height: 60px;"></textarea>
				</td>
            </tr>
			<tr style="height: 35px;">
				<td colspan="6" style="background-color: #ffffff;"align="center">
				<a href="javascript:updateLx()" id="save_button" class="easyui-linkbutton" plain="true" iconCls="icon-save">保存</a>
				<a href="# "  onclick="removes()" class="easyui-linkbutton"  plain="true" iconCls="icon-cancel">取消</a></td>
			</tr>
	</table>
	</form>
</body>
</html>