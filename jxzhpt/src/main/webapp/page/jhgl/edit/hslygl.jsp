<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>红色旅游公路详细信息</title>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/util/jquery.cookie.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YMLib.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/page/jhgl/js/loadTask.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/page/jhgl/js/plan_hsly.js"></script>
</head>
<body>
	<div id="hslygl_bj" style="text-align: left;font-size: 12px;width:97%;">
		<table id="hslygl_edit" width="97%" border="0"
			style="border-style: solid; border-width: 3px 1px 1px 1px; border-color: #55BEEE #C0C0C0 #C0C0C0 #C0C0C0; margin-left: 13px; height: 45px;"
			cellspacing="0" cellpadding="0">
			<tr style="height: 30px;">
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					项目名称</td>
				<td
					style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<span id="lblXMMC"></span>
				</td>
				<td
					style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px; width: 15%;">
					行政区划</td>
				<td
					style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<span id="lblXZQH"></span>
				</td>
				<td
					style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					计划年份</td>
				<td
					style="border-left: 1px solid #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 18%; text-align: left; padding-left: 10px;">
					<input name="txtJHNF" id="txtJHNF" style="width: 100px;" type="text" onkeyup="value = value.replace(/[^\d]/g, '')" />
				</td>
			</tr>
			<tr style="height: 30px;">
				<td
					style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					建设规模合计</td>
				<td
					style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;">
					<input name="txtJSGMHJ" type="text" id="txtJSGMHJ" style="width:100px;"
					onkeyup="MangeJSGM(event,this)" onblur="checkNum(this)" /> 公里
				</td>
				<td
					style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px; width: 15%;">
					建设规模(一级公路)</td>
				<td
					style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<input name="txtJSGMY" type="text" id="txtJSGMY" style="width:100px;"
					onkeyup="MangeJSGM(event,this)" onblur="checkNum(this)" /> 公里
				</td>
				<td
					style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					建设规模(二级公路)</td>
				<td
					style="border-left: 1px solid #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;">
					<input name="txtJSGME" type="text" id="txtJSGME" style="width:100px;"
					onkeyup="MangeJSGM(event,this)" onblur="checkNum(this)" /> 公里
				</td>
			</tr>
			<tr style="height: 30px;">
				<td
					style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					建设规模(三级公路)</td>
				<td
					style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;">
					<input name="txtJSGMS" type="text" id="txtJSGMS" style="width:100px;"
					onkeyup="MangeJSGM(event,this)" onblur="checkNum(this)" /> 公里
				</td>
				<td
					style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px; width: 15%;">
					建设规模(四级公路)</td>
				<td
					style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<input name="txtJSGMF" type="text" id="txtJSGMF" style="width:100px;"
					onkeyup="MangeJSGM(event,this)" onblur="checkNum(this)" /> 公里
				</td>
				<td
					style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					建设规模(独立大桥)</td>
				<td
					style="border-left: 1px solid #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;">
					<input name="txtJSGMDLDQ" type="text" id="txtJSGMDLDQ" style="width:100px;"
					onkeyup="MangeJSGM(event,this)" onblur="checkNum(this)" /> 公里
				</td>
			</tr>
			<tr style="height: 30px;">
				<td
					style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					总投资</td>
				<td
					style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;">
					<input name="txtZTZ" type="text" id="txtZTZ" onkeyup=""  style="width:100px;"
					onblur="checkNum(this)" /> 万元
				</td>
				<td
					style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px; width: 15%;">
					中央投资车购税</td>
				<td
					style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<input name="txtZYTZ" type="text" id="txtZYTZ" style="width:100px;"
					onkeyup="MangeTZ(event,this)" onblur="checkNum(this)" /> 万元
				</td>
				<td
					style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					地方（企业）自筹</td>
				<td
					style="border-left: 1px solid #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;">
					<input name="txtDFZC" type="text" id="txtDFZC"  style="width:100px;"
					onkeyup="MangeTZ(event,this)" onblur="checkNum(this)" /> 万元
				</td>
			</tr>
			<tr style="height: 30px;">
				<td
					style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					国内贷款</td>
				<td
					style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;">
					<input name="txtGNDK" type="text" id="txtGNDK" style="width:100px;"
					onkeyup="MangeTZ(event,this)" onblur="checkNum(this)" /> 万元
				</td>
				<td
					style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px; width: 15%;">
					利用外资</td>
				<td
					style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<input name="txtLYWZ" type="text" id="txtLYWZ"  style="width:100px;"
					onkeyup="MangeTZ(event,this)" onblur="checkNum(this)" /> 万元
				</td>
				<td
					style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					建设性质</td>
				<td
					style="border-left: 1px solid #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;">
					<input name="txtJSXZ" type="text" id="txtJSXZ"  style="width:100px;"/>
				</td>
			</tr>
			<tr style="height: 30px;">
				<td
					style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					工可批复文号</td>
				<td
					style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;">
					<input name="txtGKPFWH" type="text" id="txtGKPFWH" style="width:100px;"
					onkeyup="MangeTZ(event,this)" onblur="checkNum(this)" />
				</td>
				<td
					style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px; width: 15%;">
					初设或施工图批复文号</td>
				<td
					style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<input id="txtSGTPFWH" name="txtSGTPFWH" type="text" style="width:100px;"
					 onkeyup="MangeTZ(event,this)" onblur="checkNum(this)" />
				</td>
				<td colspan="2" style="border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0;"></td>
			</tr>
			<tr style="height: 50px;">
				<td
					style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					主要建设内容</td>
				<td colspan="5"
					style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;">
					<textarea id="txtZYJSNR" name="txtZYJSNR" rows="2" cols="20" style="border-color: Black; border-width: 1px; border-style: Solid; height: 40px; width: 95%; overflow: auto"></textarea>
				</td>
			</tr>
			<tr style="height: 50px;">
				<td
					style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					新增生产能力</td>
				<td colspan="5"
					style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;">
					<textarea name="txtXZSCNL" rows="2" cols="20" id="txtXZSCNL"
						style="border-color: Black; border-width: 1px; border-style: Solid; height: 40px; width: 95%; overflow: auto"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<script type="text/javascript">
	var xxId=parent.YMLib.Var.jhbm;
	$.ajax({
		type:'post',
		url:'../../../jhgl/queryHslyById.do',
		data:"hsly.id="+xxId,
		dataType:'json',
		success:function(data){
			$('#lblXMMC').html(data.xmmc);
			$('#lblXZQH').html(data.xzqhmc);
			$('#txtJHNF').val(data.jhnf);
			$('#txtJSGMHJ').val(data.jsgmhj);
			$('#txtJSGMY').val(data.jsgmy);
			$('#txtJSGME').val(data.jsgme);
			$('#txtJSGMS').val(data.jsgms);
			$('#txtJSGMF').val(data.jsgmf);
			$('#txtJSGMDLDQ').val(data.jsgmdldq);
			$('#txtZTZxx').val(data.ztz);
			$('#txtZYTZxx').val(data.zytz);
			$('#txtDFZC').val(data.dfta);
			$('#txtGNDK').val(data.gndk);
			$('#txtLYWZ').val(data.lywz);
			$('#txtJSXZ').val(data.jsxz);
			$('#txtGKPFWH').val(data.gkpfwh);
			$('#txtSGTPFWH').val(data.sgtpfwh);
			$('#txtZYJSNR').val(data.zyjsnr);
			$('#txtXZSCNL').val(data.xzscl);
			$.ajax({
				type:'post',
				url:'../../../jhgl/queryHslyZjzj.do',
				data:"hsly.id="+data.id,
				dataType:'json',
				success:function(data){
					if(data.rows!=null && data.rows!=''){
						$('#hslygl_edit').append('<tr style="height: 25px;"><td colspan="6"style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #55BEEE; font-weight: bold; font-size: small; text-align: left; background-color: #F1F8FF; width: 15%; padding-left: 10px;">红色旅游公路资金信息</td></tr>');
						$.each(data.rows,function(index,item){
							$('#hslygl_edit').append('<tr><td colspan="5" style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: left; padding-left: 50px; color: red;">【2014】年资金追加</td><td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; text-align: right; padding-left: 10px;"><a href="javascript:void(0)" style="color: #2C7ED1; font-weight: bold;" onclick=UpdateZJZJ(,)>更新</a>&nbsp;|&nbsp;<a href="javascript:void(0)" style="color: #2C7ED1; font-weight: bold;" onclick="DeleteZJZJ()">删除</a></td></tr>');
							$('#hslygl_edit').append('<tr style="height: 30px;">'+
									'<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">建议计划总投资</td>'+
									'<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">'+
										'<input id="txt_ZTZ'+item.jhnf+'" value="16" type="text" style="border: 1px solid #000000;" maxlength="18" onkeyup=" " onblur="checkNum(this)" />万元</td>'+
									'<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">中央投资车购税</td>'+
									'<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">'+
										'<input id="txt_ZYTZ'+item.jhnf+'" value="16" type="text" style="border: 1px solid #000000;" maxlength="18" onkeyup="MangeZJTZ(event,this,2014)" onblur="checkNum(this)" /> 万元</td>'+
									'<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">地方自筹/省级投资</td>'+
									'<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">'+
										'<input id="txt_DFZC'+item.jhnf+'" value="0" type="text" style="border: 1px solid #000000;" maxlength="18" onkeyup="MangeZJTZ(event,this,2014)" onblur="checkNum(this)"/> 万元</td></tr>');
							$('#hslygl_edit').append(
								'<tr style="height: 30px;"><td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">国内贷款</td>'+
								'<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">'+
									'<input id="txt_GNDK'+item.jhnf+'" value="0" type="text" style="border: 1px solid #000000;" maxlength="18" onkeyup="MangeZJTZ(event,this,2014)" onblur="checkNum(this)" /> 万元</td>'+
								'<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">利用外资</td>'+
								'<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">'+
									'<input id="txt_LYWZ'+item.jhnf+'" value="0" type="text" maxlength="18" onkeyup="MangeZJTZ(event,this,2014)" onblur="checkNum(this)"/> 万元</td>'+
								'<td colspan="2" style="border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0;">&nbsp;</td></tr>');
							$('#hslygl_edit').append(
								'<tr style="height: 30px;"><td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">主要建设内容</td>'+
								'<td colspan="5" style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;">'+
									'<input id="txt_ZYJSNR'+item.jhnf+'" value="16" type="text" style="border: 1px solid #000000; width: 680px;"/></td></tr>');
							$('#hslygl_edit').append(
								'<tr style="height: 30px;"><td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">新增生产力</td>'+
								'<td colspan="5" style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;">'+
									'<input id="txt_XZSCNL'+item.jhnf+'" value="16" type="text" style="border: 1px solid #000000; width: 680px;"/></td></tr>');
						});
					}
				}
			});
		}
	});
	$('#hslygl_edit').append('<tr align="center" style="height: 30px;text-align: center;"><td align="center" colspan="6"><img alt="确定"  style="text-align: center;" src="/jxzhpt/images/Button/qd1.gif" onmouseover="this.src='+"'/jxzhpt/images/Button/qd2.gif'"+'" onmouseout="this.src='+"'/jxzhpt/images/Button/qd1.gif'"+'" onclick="update()" /></td></tr>');
	
	function update(){
		var hsly={'hsly.jhnf':$('#txtJHNF').val(),'hsly.jsgmhj':$('#txtJSGMHJ').val(),
				'hsly.jsgmy':$('#txtJSGMY').val(),'hsly.jsgme':$('#txtJSGME').val(),
				'hsly.jsgms':$('#txtJSGMS').val(),'hsly.jsgmf':$('#txtJSGMF').val(),
				'hsly.jsgmdldq':$('#txtJSGMDLDQ').val(),'hsly.ztz':$('#txtZTZ').val(),
				'hsly.zytz':$('#txtZYTZ').val(),'hsly.dfta':$('#txtDFZC').val(),
				'hsly.gndk':$('#txtGNDK').val(),'hsly.lywz':$('#txtLYWZ').val(),
				'hsly.jsxz':$('#txtJSXZ').val(),'hsly.gkpfwh':$('#txtGKPFWH').val(),
				'hsly.sgtpfwh':$('#txtSGTPFWH').val(),'hsly.zyjsnr':$('#txtZYJSNR').val(),
				'hsly.xzscl':$('#txtXZSCNL').val(),'hsly.id':xxId};
		$.ajax({
			type:'post',
			url:'../../../jhgl/editHsly.do',
			data:hsly,
			dataType:'json',
			success:function(data){
				if(data.result=="true"){
					alert("修改成功");
					$('#hslygl_xx').dialog('close',false);
				}
			}
		});
	}
	</script>
</body>
</html>