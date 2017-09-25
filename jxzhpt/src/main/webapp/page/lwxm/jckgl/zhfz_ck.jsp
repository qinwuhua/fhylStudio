<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>基础库管理灾害防治项目</title>
<link rel="stylesheet" type="text/css" href="../../../easyui/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="../../../easyui/themes/icon.css" />
<script type="text/javascript" src="../../../easyui/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="../../../easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../../../easyui/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="../../../js/YMLib.js"></script>
<script type="text/javascript" src="../js/Datagrid.js"></script>
<script type="text/javascript">
	$(function(){
		selZhfzById();
		$("#qx_window").click(function(){
			parent.$('#jck_ck').window('destroy');
		});	
	});
	function selZhfzById(){
		$.ajax({
			type : 'post',
			url : '/jxzhpt/xmjck/selectZhfzById.do',
			data :"id="+parent.rowid,
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
			$("#xjnd").html(msg.gjxjnd);
			$("#lxjsdj").html(msg.lxjsdj);
			$("#yhlc").html(msg.yhlc);
			$("#xmnf").html(msg.xmnf);
			$("#xmzt").html(msg.xmtype);
			$("#yhnr").html(msg.yhnr);
			$("#bz").html(msg.bz);
			$("#tsdq").html(msg.tsdq);
			$("#xmklx").html(msg.xmklx);
			$("#ylxbm").html(msg.ylxbm);
			$("#yqdzh").html(msg.yqdzh);
			$("#yzdzh").html(msg.yzdzh);
			alert(msg.ylxbm);
			}
		});
	}		
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
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">路线编码：</td>
				<td style="background-color: #ffffff;width:18%" align="left">
					<span id="lxbm" ></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">路线名称：</td>
				<td style="background-color: #ffffff;width:18%" align="left">
					<span id="lxmc"></span></td>
					<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">管养单位：</td>
				<td style="background-color: #ffffff;" align="left">
					<span id="gydw"></span></td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">起点桩号：</td>
				<td style="background-color: #ffffff;"align="left">
					<span id="qdzh"></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">止点桩号：</td>
				<td style="background-color: #ffffff;" align="left">
					<span id="zdzh"></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">总里程：</td>
				<td style="background-color: #ffffff;" align="left">
					<span id="qzlc"></span></td>
			</tr>
 			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">原路线编码：</td>
				<td style="background-color: #ffffff; " align="left">
					<span id="ylxbm"></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">原起点桩号：</td>
				<td style="background-color: #ffffff;"align="left">
					<span id="yqdzh"></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">原止点桩号：</td>
				<td style="background-color: #ffffff;" align="left">
					<span id="yzdzh"></span></td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">行政区划代码：</td>
				<td style="background-color: #ffffff; " align="left">
					<span id="xzqhdm"></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">行政区划名称：</td>
				<td style="background-color: #ffffff;"align="left">
					<span id="xzqhmc"></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">修建/改建年度：</td>
				<td style="background-color: #ffffff;" align="left">
					<span id="xjnd"></span></td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">路线技术等级：</td>
				<td style="background-color: #ffffff;" align="left">
					<span id="lxjsdj"></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">隐患里程：</td>
				<td style="background-color: #ffffff;" align="left">
					<span id="yhlc"></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">特殊地区：</td>
				<td style="background-color: #ffffff;" align="left">
					<span id="tsdq"></span>
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">项目年份：</td>
				<td style="background-color: #ffffff;" align="left">
					<span id="xmnf"></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">项目状态：</td>
				<td style="background-color: #ffffff;" align="left">
					<span id="xmzt"></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">项目库类型：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id='xmklx'></span>
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">隐患内容：</td>
				<td colspan="5" style="background-color: #ffffff;" align="left">
					<span id="yhnr"></span>
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">备&nbsp;&nbsp;注：</td>
				<td colspan="5" style="background-color: #ffffff;" align="left">
					<span id="bz"></span>
				</td>
			</tr>
			<tr style="height: 30px;">
				<td colspan="6" style="background-color: #ffffff;"
					align="center"> <a href="javascript:void(0)" id="qx_window"
					class="easyui-linkbutton" plain="true" iconCls="icon-ok">确定</a></td>
			</tr>
			</table>
</body>
</html>