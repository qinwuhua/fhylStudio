<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>基础库管理危桥改造项目</title>
<link rel="stylesheet" type="text/css" href="../../../css/Top.css" />
<link rel="stylesheet" type="text/css" href="../../../css/style.css" />
<link rel="stylesheet" type="text/css" href="../../../easyui/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="../../../easyui/themes/icon.css" />
<script type="text/javascript" src="../../../easyui/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="../../../easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../../../easyui/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="../../../js/util/jquery.cookie.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/widget/newlhgdialog/lhgcore.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/widget/newlhgdialog/lhgdialog.min.js"></script>
<script type="text/javascript" src="../../../js/YMLib.js"></script>
<script type="text/javascript" src="../js/Datagrid.js"></script>
<script type="text/javascript" src="../js/sjcx.js"></script>
<script type="text/javascript">
$(function(){
	loadUnit("gydw",$.cookie("unit"));
	loadDist("xzqhmc",$.cookie("dist"));
	xmnf("xmnf"); 
	loadBmbm2("sbzt", "上报状态");
	loadBmbm2("jsdj", "技术等级");
	loadBmbm2("akjfl", "跨径分类");
	tsdq("tsdq");
	jckglWqgz();
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
		<div id="p_top">数据查询>&nbsp;路网项目>&nbsp;危桥改造项目基础库</div>
		</div>
	<table align="left" width="99%" cellpadding="0" cellspacing="0" border="0">
		<tr>
			<td align="left" style="padding-left:10px;padding-top: 10px;">
			<fieldset style="width:100%;text-align:left;vertical-align:middle;">
				<legend style="padding: 0 0 0 0; font-weight: bold; color: Gray; font-size: 12px;">
				</legend>
					<div>
					<p style="margin:8px 0px 4px 20px;">
								<span>管养单位：</span>
                              	<select id="gydw" style="width:218px">
                              	</select>
                             	<span>&nbsp;行政区划：</span>
                              	<select id="xzqhmc" style="width:218px">
                              	</select>
                               <span>&nbsp;路线名称：</span>
        						<input type="text" id="lxmc" style="width:70px;" />
        						<span>&nbsp;路线编码：</span>
                              	<input type="text" id="lxbm"style="width:70px"/>
                              <span>&nbsp;桥梁名称：</span>
                              	<input type="text" id="qlmc"style="width:70px"/>
						</p>
                        <p style="margin:8px 0px 4px 20px;">
							  <span>项目年份：</span>
                              	<select id="xmnf"  style="width:70px">
                              	</select>
                              <span style="display: none;">&nbsp;项目状态： </span>
                              	<select id="xmtype" style="width:70px;display: none;">
                              	</select>
                               <span>&nbsp;上报状态：</span>
                              	<select id="sbzt" style="width:70px"class="easyui-combobox">
                              	</select>
                              <span>&nbsp;特殊地区：</span>
                              	<select id="tsdq" style="width:70px"class="easyui-combobox">
                              	</select>
                              <span>&nbsp;技术等级：</span>
                              	<select id="jsdj" style="width:70px"class="easyui-combobox">
                              	</select>
                              	<span>&nbsp;按跨径分类：</span>
                              	<select id="akjfl" style="width:60px"class="easyui-combobox">
                              	</select>
                              	<span>&nbsp;桥梁编号：</span>
                              	<input type="text" id="qlbh"style="width:70px"/>
                             </p>
                             <p style="margin:8px 0px 4px 20px;">
								<img name="btnSelect" id="btnSelect" onmouseover="this.src='../../../images/Button/Serch02.gif'" alt="查询" onmouseout="this.src='../../../images/Button/Serch01.gif'" src="../../../images/Button/Serch01.gif" onclick="jckglWqgz();" style="border-width:0px;cursor: hand;" />
                             </p>
					</div>
				</fieldset>
			</td>
		</tr>
		<tr>
                   <td style="text-align: left; padding-left: 20px; padding-top: 5px; height: 25px; font-size: 12px;" >
        					共有【&nbsp;<span id="wqgz1" style="font-weight: bold; color: #FF0000"></span>&nbsp;】个危桥改造项目。</td>
        </tr>
	</table>
<!-- 	<tbody id="grid"></tbody> -->
	<div id="grid" width="100%" ></div>
</body>
</html>
