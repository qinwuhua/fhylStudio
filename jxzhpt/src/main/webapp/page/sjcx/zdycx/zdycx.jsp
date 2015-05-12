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
		xmnf("xmnf");
		xmnf("jhnf");
		
		$("#btnSelect").click(function(){
			YMLib.Var.gydw=$("#gydw").combobox("getValue");
			YMLib.Var.xzqhdm=$("#xzqhmc").combobox("getValue");
			YMLib.Var.kgzt=$("#kgzt").combobox("getValue");
			YMLib.Var.lxmc=$("#lxmc").val();
			YMLib.Var.lxbm=$("#lxbm").val();
			YMLib.Var.xmlx=$("#xmlx").combobox("getValue");
			YMLib.Var.xmnf=$("#xmnf").combobox("getValue");
			YMLib.Var.jhnf=$("#jhnf").combobox("getValue");
			YMLib.Var.xmName=$("#xmlx").combobox("getText");
			if($("#xmlx").combobox("getValue")=='wqgz') Wqgz();
			else if($("#xmlx").combobox("getValue")=='abgc') Abgc();	
			else if($("#xmlx").combobox("getValue")=='zhfz') Zhfz();
			else if($("#xmlx").combobox("getValue")=='lmgj') Gcgj();
			else if($("#xmlx").combobox("getValue")=='lmsj')	Gcsj();
			else if($("#xmlx").combobox("getValue")=='yhdzx') Yhdzx();
			else Sh();
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
				<td style="background-color: #ffffff;width:15%" align="right">项目类型：</td>
				<td style="background-color: #ffffff;" align="left">
					<select  id="xmlx" style="width: 160px" class="easyui-combobox" >
						<option value="wqgz">危桥改造</option>
						<option value="abgc">安保工程</option>
						<option value="zhfz">灾害防治</option>
						<option value="lmsj">工程改造路面升级</option>
						<option value="lmgj">工程改造路面改建</option>
						<option value="yhdzx">养护大中修</option>
						<option value="shxm">水毁</option>
					</select></td>
				<!-- <td style="background-color: #ffffff;width:15%" align="right">技术等级：</td>
				<td style="background-color: #ffffff;" align="left">
					<select  id="cc" style="width: 160px" class="easyui-combobox" >
							<option selected="selected" value="">全部</option>
									<option value="一级公路">一级公路</option>
									<option value="二级公路">二级公路</option>
									<option value="三级公路">三级公路</option>
									<option value="四级公路">四级公路</option>
									<option value="等外公路">等外公路</option>
									</select></td> -->
					<td style="background-color: #ffffff;width:15%" align="right">开工状态：</td>
				<td style="background-color: #ffffff;" align="left">
					<select  id="kgzt" style="width: 160px">
					</select></td>
				<td style="background-color: #ffffff;width:15%" align="right">路线编码：</td>
				<td style="background-color: #ffffff;" align="left">
					<input type="text" id="lxbm" style="width: 145px"/></td>
			</tr>
			<tr  style="height: 30px;">
				<td style="background-color: #ffffff;width:15%" align="right">项目年份：</td>
				<td style="background-color: #ffffff;" align="left">
					<select  id="xmnf" style="width:160px"></select></td>
				<td style="background-color: #ffffff;width:15%" align="right">计划年份：</td>
				<td style="background-color: #ffffff;" align="left">
					<select id="jhnf" style="width:160px"></select></td>
				<td style="background-color: #ffffff;width:15%" align="right"></td>
				<td style="background-color: #ffffff;" align="left"></td>
			</tr>
			<tr  style="height: 30px;">
				<td colspan="6" style="background-color: #ffffff;width:15%" align="center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<img name="btnSelect" id="btnSelect" onmouseover="this.src='../../../images/Button/Serch02.gif'" alt="查询" onmouseout="this.src='../../../images/Button/Serch01.gif'" src="../../../images/Button/Serch01.gif"  style="border-width:0px;cursor: hand;" />&nbsp;&nbsp;&nbsp;
						<img  onclick="exportExcel_zdy()" alt="导出Excel" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/dcecl2.gif'"  onmouseout="this.src='${pageContext.request.contextPath}/images/Button/dcecl1.gif'" src="${pageContext.request.contextPath}/images/Button/dcecl1.gif" style="border-width:0px;cursor: hand;" />
				</td>
			</tr>
			</table><br/>
			<div>
				<table id="grid" width="100%" > </table>
			</div>
		</center>
</body>
</html>