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
	$(function(){
		loadUnit("gydw",$.cookie("unit"));
		loadDist("xzqhmc",$.cookie("dist"));
		loadBmbm2("kgzt","开工状态");
		loadBmbm3('jsdj','技术等级');
		loadGldj('gldj');
		//xmnf("xmnf");
		//xmnf("jhnf");
		
		$("#btnSelect").click(function(){
			YMLib.Var.gydw=$("#gydw").combobox("getValue");
			YMLib.Var.xzqhdm=$("#xzqhmc").combobox("getValue");
			YMLib.Var.kgzt=$("#kgzt").combobox("getValue");
			YMLib.Var.lxmc=$("#lxmc").val();
			YMLib.Var.lxbm=$("#lxbm").val();
			YMLib.Var.xmlx=$("#xmlx").combobox("getValue");
			YMLib.Var.xmnf=$("#xmnf").combobox("getValue");
			//YMLib.Var.jhnf=$("#jhnf").combobox("getValue");
			YMLib.Var.xmName=$("#xmlx").combobox("getValue");
			Wqgzsj();
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
	
		<div id="righttop">
		<div id="p_top">数据查询>&nbsp;自定义查询>&nbsp;危桥改造（交通局）</div>
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
					<input type="text" id="lxmc" style="width: 145px"/></td>
			</tr>
			<tr  style="height: 30px;">
				<td style="background-color: #ffffff;width:15%" align="right">是否部库：</td>
				<td style="background-color: #ffffff;" align="left">
					<select  id="xmlx" style="width: 160px" class="easyui-combobox" >
						<option value="">全部</option>
						<option value="是">是</option>
						<option value="否">否</option>
					</select></td>
					<td style="background-color: #ffffff;width:15%" align="right">开工状态：</td>
				<td style="background-color: #ffffff;" align="left">
					<select  id="kgzt" style="width: 160px">
						<option value="">全部</option>
						<option value="未开工">未开工</option>
						<option value="已开工">已开工</option>
					</select></td>
				<td style="background-color: #ffffff;width:15%" align="right">路线编码：</td>
				<td style="background-color: #ffffff;" align="left">
					<input type="text" id="lxbm" style="width: 145px"/></td>
			</tr>
			<tr  style="height: 30px;">
				<td style="background-color: #ffffff;width:15%" align="right">项目年份：</td>
				<td style="background-color: #ffffff;" align="left">
					<select  id="xmnf" class="easyui-combobox" style="width:160px">
						<option value="2015">2020</option>
						<option value="2014">2019</option>
						<option value="2013">2018</option>
						<option value="2012">2017</option>
						<option value="2011">2016</option>
					</select>
				</td>
				<!-- <td style="background-color: #ffffff;width:15%" align="right">计划年份：</td>
				<td style="background-color: #ffffff;" align="left">
					<select id="jhnf" style="width:160px"></select></td> -->
				<td style="background-color: #ffffff;width:15%" align="right">技术等级：</td>
				<td style="background-color: #ffffff;" align="left">
					<select name="jsdj" id="jsdj" style="width:160px;" class="easyui-combobox"></select>
				</td>
				<td style="background-color: #ffffff;width:15%" align="right">行政等级：</td>
				<td style="background-color: #ffffff;" align="left">
					<select name="gldj" id="gldj" style="width:149px;" class="easyui-combobox"></select>
				</td>
			</tr>
			<tr  style="height: 30px;">
				<td colspan="6" style="background-color: #ffffff;width:15%" align="center">
						<img name="btnSelect" id="btnSelect" onmouseover="this.src='../../../images/Button/Serch02.gif'" alt="查询" onmouseout="this.src='../../../images/Button/Serch01.gif'" src="../../../images/Button/Serch01.gif"  style="border-width:0px;cursor: hand;" />&nbsp;&nbsp;&nbsp;
						<img  onclick="exportExcel_wqsjzdy()" alt="导出Excel" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/dcecl2.gif'"  onmouseout="this.src='${pageContext.request.contextPath}/images/Button/dcecl1.gif'" src="${pageContext.request.contextPath}/images/Button/dcecl1.gif" style="border-width:0px;cursor: hand;" />
				</td>
			</tr>
			</table><br/>
			<div>
				<table id="grid" width="100%" > </table>
			</div>
		</center>
</body>
</html>