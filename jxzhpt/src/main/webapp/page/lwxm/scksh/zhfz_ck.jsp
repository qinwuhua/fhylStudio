<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>审查库审核灾害防治项目</title>
<link rel="stylesheet" type="text/css" href="../../../easyui/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="../../../easyui/themes/icon.css" />
<script type="text/javascript" src="../../../easyui/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="../../../easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../../../easyui/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="../../../js/YMLib.js"></script>
<script type="text/javascript" src="../js/Menu.js"></script>
<script type="text/javascript" src="../js/Datagrid.js"></script>
<script type="text/javascript">
	$(function(){
		selZhfzById();
		$("#qx_window").click(function(){
			parent.$('#sck_ck').window('destroy');
		});	
		function selZhfzById(){
			$.ajax({
				type : 'post',
				url : '/jxzhpt/xmsck/selectSckzhfzById.do',
				data :"sckid="+parent.rowid,
				dataType:'json',
				success : function(msg) {
				$("#lxbm").html(msg.lxbm);
				$("#lxmc").html(msg.lxmc);
				$("#gydw").html(msg.gydw);
				$("#qdzh").html(msg.qdzh);
				$("#zdzh").html(msg.zdzh);
				$("#qzlc").html(msg.qzlc);
				$("#xzqhdm").html(msg.xzqhdm);
				$("#xzqhmc").html(msg.xzqhmc);
				$("#gjxjnd").html(msg.gjxjnd);
				$("#lxjsdj").html(msg.lxjsdj);
				$("#yhlc").html(msg.yhlc);
				$("#xmnf").html(msg.xmnf);
				$("#xmtype").html(msg.xmtype);
				$("#yhnr").html(msg.yhnr);
				$("#bz").html(msg.bz);
				
				$("#scqdzh").html(msg.scqdzh);
				$("#sczdzh").html(msg.sczdzh);
				$("#sczlc").html(msg.sczlc);
				$("#scyhlc").html(msg.scyhlc);
				$("#fapgdw").html(msg.fapgdw);
				$("#fascdw").html(msg.fascdw);
				$("#faspsj").html(msg.faspsj);
				$("#spwh").html(msg.spwh);
				$("#tzgs").html(msg.tzgs);
				$("#jsxz").html(msg.jsxz);
				$("#jsnr").html(msg.jsnr);
				$("#scbz").html(msg.scbz);
				}
			});
		}		
	});
</script>
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
<table style="width: 98%; margin-top: 15px;margin-left: 10px; background-color: #aacbf8; font-size: 12px"
			border="0" cellpadding="3" cellspacing="1">
			<tr style="height: 25px;">
				<td colspan="6" style="border-style: none none solid none; border-width: 1px; color: #55BEEE; font-weight: bold; font-size: small; text-align: left; background-color: #F1F8FF; width: 15%; padding-left: 10px;">
					安保工程项目基本信息
				</td>
			</tr>
			<tr style="height: 25px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">路线编码：</td>
				<td style="background-color: #ffffff;" align="left">
					<span id="lxbm"></span>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">路线名称：</td>
				<td style="background-color: #ffffff;" align="left">
					<span id="lxmc"></span>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">管养单位：</td>
				<td style="background-color: #ffffff; " align="left">
					<span id="gydw"></span>
			</tr>
			<tr style="height: 25px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">起点桩号：</td>
				<td style="background-color: #ffffff; " align="left">
					<span id="qdzh"></span>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">止点桩号：</td>
				<td style="background-color: #ffffff; " align="left">
					<span id="zdzh"></span>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">总里程：</td>
				<td style="background-color: #ffffff; " align="left">
					<span id="qzlc"></span>
			</tr>
			<tr style="height: 25px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">行政区划代码：</td>
				<td style="background-color: #ffffff; " align="left">
					<span id="xzqhdm"></span>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">行政区划名称：</td>
				<td style="background-color: #ffffff; "align="left">
					<span id="xzqhmc"></span>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">修建/改建年度：</td>
				<td style="background-color: #ffffff; " align="left">
					<span id="gjxjnd"></span>
			</tr>
			<tr style="height: 25px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">路线技术等级：</td>
				<td style="background-color: #ffffff; " align="left">
					<span id="lxjsdj"></span>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">隐患里程：</td>
				<td style="background-color: #ffffff; " align="left">
					<span id="yhlc"></span>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">特殊地区：</td>
				<td style="background-color: #ffffff; " align="left">
					<span id="tsdq"></span>
				</td>
			</tr>
			<tr style="height: 25px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">项目年份：</td>
				<td style="background-color: #ffffff; " align="left">
					<span id="xmnf"></span>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">项目状态：</td>
				<td style="background-color: #ffffff; " align="left">
					<span id="xmtype"></span>
				<td colspan="2" style="background-color: #ffffff; height: 20px;" align="left"></td>
			</tr>
			<tr style="height: 30px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">隐患内容：</td>
				<td colspan="5" style="background-color: #ffffff;" align="left">
					<span id="yhnr"></span>
				</td>
			</tr>
			<tr style="height: 30px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">备&nbsp;&nbsp;注：</td>
				<td colspan="5" style="background-color: #ffffff;" align="left">
					<span id="bz"></span>
				</td>
			</tr>
			<tr style="height: 25px;">
				<td colspan="6" style="border-style: none none solid none; border-width: 1px; color: #55BEEE; font-weight: bold; font-size: small; text-align: left; background-color: #F1F8FF; width: 15%; padding-left: 10px;">
					安保工程项目审查信息
				</td>
			</tr>
			<tr style="height: 25px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">起点桩号：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="scqdzh"></span>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">止点桩号：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="sczdzh"></span>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">总里程：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="sczlc"></span>&nbsp;公里
				</td>
			</tr>
			<tr style="height: 25px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">隐患里程：</td>
				<td colspan="5" style="background-color: #ffffff; height: 20px;" align="left">
					<span id="scyhlc"></span>&nbsp;公里
				</td>
			</tr>
			<tr style="height: 25px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">方案评估单位：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="fapgdw"></span>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">方案审查单位：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="fascdw"></span>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">方案审批时间：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="faspsj"></span>
				</td>
			</tr>
			<tr style="height: 25px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">审批文号：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="spwh"></span>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">投资估算：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="tzgs"></span>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">建设性质：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="jsxz"></span>
				</td>
			</tr>
				<tr style="height: 30px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">建设内容：</td>
				<td colspan="5" style="background-color: #ffffff; height: 20px;" align="left">
					<span id="jsnr"></span>
				</td>
			</tr>
			<tr style="height: 30px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">备&nbsp;&nbsp;注：</td>
				<td colspan="5" style="background-color: #ffffff; height: 20px;" align="left">
					<span id="scbz"></span>
				</td>
			</tr>
			<tr>
				<td colspan="6" style="background-color: #ffffff; height: 35px;"
					align="center"> <a href="javascript:void(0)" id="qx_window"
					class="easyui-linkbutton" plain="true" iconCls="icon-ok">确定</a></td>
			</tr>
			</table>
</body>
</html>