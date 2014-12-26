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
<script type="text/javascript" src="../../../js/YMLib.js"></script>
<script type="text/javascript" src="../js/sjcx.js"></script>
<script type="text/javascript">
	$(function(){
		$("#cc").combotree({
			checkbox: false,
		 	url: "../js/gydw.json",
		});
		$("#ss").combotree({
			checkbox: false,
		 	url: "../js/xzqh.json",
		});
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
		<table align="left"  width="100%">
			<tr><td>
		<div id="righttop">
		<div id="p_top">数据查询>&nbsp;自定义查询>&nbsp;当前位置</div>
		</div>
		</td></tr>
	     </table>

<center>
<table style="width: 80%; margin-top: 15px; background-color: #aacbf8; font-size: 12px"
			border="0" cellpadding="3" cellspacing="1">
			<tr  style="height: 30px;">
				<td style="background-color: #ffffff;width:15%" align="right">管养单位：</td>
				<td style="background-color: #ffffff;" align="left">
					<input  id="cc" style="width: 160px"/></td>
				<td style="background-color: #ffffff;width:15%" align="right">行政区划：</td>
				<td style="background-color: #ffffff;" align="left">
					<input  id="ss" style="width: 160px" /></td>
					<td style="background-color: #ffffff;width:15%" align="right">路线名称：</td>
				<td style="background-color: #ffffff;" align="left">
					<input type="text" id="pid" style="width: 145px"/></td>
			</tr>
			<tr  style="height: 30px;">
				<td style="background-color: #ffffff;width:15%" align="right">项目年份：</td>
				<td style="background-color: #ffffff;" align="left">
					<input  id="cc" style="width: 160px" class="easyui-combobox" /></td>
				<td style="background-color: #ffffff;width:15%" align="right">项目状态：</td>
				<td style="background-color: #ffffff;" align="left">
					<input  id="cc" style="width: 160px" class="easyui-combobox" /></td>
					<td style="background-color: #ffffff;;width:15%" align="right">审核状态：</td>
				<td style="background-color: #ffffff;" align="left">
					<input  id="cc" style="width: 150px" class="easyui-combobox" /></td>
			</tr>
			<tr  style="height: 30px;">
				<td style="background-color: #ffffff;width:15%" align="right">特殊地区：</td>
				<td style="background-color: #ffffff;" align="left">
					<input  id="cc" style="width: 160px" class="easyui-combobox" /></td>
				<td style="background-color: #ffffff;width:15%" align="right">技术等级：</td>
				<td style="background-color: #ffffff;" align="left">
					<input  id="cc" style="width: 160px" class="easyui-combobox" /></td>
				<td colspan="2" style="background-color: #ffffff;width:15%" align="center">
						<img name="btnSelect" id="btnSelect" onmouseover="this.src='../../../images/Button/Serch02.gif'" alt="查询" onmouseout="this.src='../../../images/Button/Serch01.gif'" src="../../../images/Button/Serch01.gif" onclick="cxzd('zdycx_zd.jsp','980','380');" style="border-width:0px;cursor: hand;" />&nbsp;&nbsp;&nbsp;
						<img name="btnExcel" id="btnExcel" onmouseover="this.src='../../../images/Button/dcecl2.gif'" alt="导出Excel" onmouseout="this.src='../../../images/Button/dcecl1.gif'" src="../../../images/Button/dcecl1.gif" style="border-width:0px;cursor: hand;" />
				</td>
			</tr>
			</table><br/>
			<div>
				<table  style="text-align: center;"   id="grid" width="90%" height="320px" > </table>
			</div>
		</center>
</body>
</html>