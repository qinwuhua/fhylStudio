<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>基础库管理安保工程项目</title>
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
		$("#gydw").combotree({
			checkbox: false,
		 	url: "../js/gydw.json",
		});
		$("#xzqhmc").combotree({
			checkbox: false,
		 	url: "../js/xzqh.json",
		});
		$("#save_button").click(function(){
			$.messager.alert('提示','修改成功！','info');    
		});
		$("#qx_window").click(function(){
			parent.$('#sck_xg').window('destroy');
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
<table style="width: 98%; margin-top: 15px;margin-left: 10px; background-color: #aacbf8; font-size: 12px"
			border="0" cellpadding="3" cellspacing="1">
			<tr style="height: 25px;">
				<td colspan="6" style="border-style: none none solid none; border-width: 1px; color: #55BEEE; font-weight: bold; font-size: small; text-align: left; background-color: #F1F8FF; width: 15%; padding-left: 10px;">
					安保工程项目基本信息
				</td>
			</tr>
			<tr>
				<td style="background-color: #ffffff; height: 20px;width:15%" align="right">路线编码：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" name="szjgdm" id="szjgdm" style="width: 150px" value="X396360726"/></td>
				<td style="background-color: #ffffff; height: 20px;width:15%" align="right">路线名称：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" name="szjgdm" id="szjgdm" style="width: 156px"value="五星-沙潭" /></td>
					<td style="background-color: #ffffff; height: 20px;width:15%" align="right">管养单位：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input  id="gydw" style="width: 156px"value="南昌市南昌县交通局" />
					<input type="text" id="pid" style="display:none"/></td>
			</tr>
			<tr>
				<td style="background-color: #ffffff; height: 20px;width:15%" align="right">起点桩号：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" name="szjgdm" id="szjgdm" style="width: 150px"value="1.545" /></td>
				<td style="background-color: #ffffff; height: 20px;width:15%" align="right">止点桩号：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" name="name"id="name" style="width: 156px" value="44"/></td>
					<td style="background-color: #ffffff; height: 20px;width:15%" align="right">总里程：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" name="szjgdm" id="szjgdm" style="width: 156px" value="42.455公里"/></td>
			</tr>
			<tr>
				<td style="background-color: #ffffff; height: 20px;width:15%" align="right">行政区划代码：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" name="szjgdm" id="szjgdm" style="width: 150px"value="3303" /></td>
				<td style="background-color: #ffffff; height: 20px;width:15%" align="right">行政区划名称：</td>
				<td style="background-color: #ffffff; height: 20px;"align="left">
					<input type="text" name="name"id="xzqhmc" style="width: 156px"value="南昌市南昌县" /></td>
					<td style="background-color: #ffffff; height: 20px;width:15%" align="right">修建/改建年度：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" name="szjgdm" id="szjgdm" style="width: 156px" value="2014"/></td>
			</tr>
			<tr>
				<td style="background-color: #ffffff; height: 20px;width:15%" align="right">路线技术等级：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" name="szjgdm" id="szjgdm" style="width: 150px"value="四级公路" /></td>
				<td style="background-color: #ffffff; height: 20px;width:15%" align="right">隐患里程：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" name="name"id="name" style="width: 156px" value="5公里"/></td>
					<td style="background-color: #ffffff; height: 20px;width:15%" align="right">特殊地区：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="tsdq">罗霄山山脉</span>
				</td>
			</tr>
			<tr>
				<td style="background-color: #ffffff; height: 20px;width:15%" align="right">项目年份：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" name="szjgdm" id="szjgdm" style="width: 150px" value="2011"/></td>
				<td style="background-color: #ffffff; height: 20px;width:15%" align="right">项目状态：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" name="name"id="name" style="width: 156px"value="待上报" /></td>
				<td colspan="2" style="background-color: #ffffff; height: 20px;" align="left"></td>
			</tr>
			<tr>
				<td style="background-color: #ffffff; height: 20px;width:15%" align="right">病害内容：</td>
				<td colspan="5" style="background-color: #ffffff; height: 20px;" align="left">
					<textarea rows="2"  style="width:99%">2010000000</textarea>
				</td>
			</tr>
			<tr>
				<td style="background-color: #ffffff; height: 20px;width:15%" align="right">备&nbsp;&nbsp;注：</td>
				<td colspan="5" style="background-color: #ffffff; height: 20px;" align="left">
					<textarea rows="2" style="width:99%">无</textarea>
				</td>
			</tr>
			<tr style="height: 25px;">
				<td colspan="6" style="border-style: none none solid none; border-width: 1px; color: #55BEEE; font-weight: bold; font-size: small; text-align: left; background-color: #F1F8FF; width: 15%; padding-left: 10px;">
					安保工程项目审查信息
				</td>
			</tr>
			<tr>
				<td style="background-color: #ffffff; height: 20px;width:15%" align="right">起点桩号：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" name="szjgdm" id="szjgdm" style="width: 150px" value="0"/></td>
				<td style="background-color: #ffffff; height: 20px;width:15%" align="right">止点桩号：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" name="name"id="name" style="width: 156px"value="10.726" /></td>
					<td style="background-color: #ffffff; height: 20px;width:15%" align="right">总里程：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" name="name"id="name" style="width: 110px" value="10.726"/>公里
				</td>
			</tr>
			<tr>
				<td style="background-color: #ffffff; height: 20px;width:15%" align="right">隐患里程：</td>
				<td colspan="5" style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" style="width: 150px"value="5"/>公里
				</td>
			</tr>
			<tr>
				<td style="background-color: #ffffff; height: 20px;width:15%" align="right">方案评估单位：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" name="szjgdm" id="szjgdm" style="width: 150px"value="南昌公路局" /></td>
				<td style="background-color: #ffffff; height: 20px;width:15%" align="right">方案审查单位：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" name="name"id="name" style="width: 156px"value="南昌公路局" /></td>
					<td style="background-color: #ffffff; height: 20px;width:15%" align="right">方案审批时间：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" id="spsj" value="2013-5-6"/>
				</td>
			</tr>
			<tr>
				<td style="background-color: #ffffff; height: 20px;width:15%" align="right">审批文号：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" name="szjgdm" id="szjgdm" style="width: 150px"value="1231654" /></td>
				<td style="background-color: #ffffff; height: 20px;width:15%" align="right">投资估算：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" name="name"id="name" style="width: 156px" value="0"/>万元</td>
					<td style="background-color: #ffffff; height: 20px;width:15%" align="right">建设性质：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<select id="jsxz">
						<option selected>中修</option>
						<option>大修</option>
					</select>
				</td>
			</tr>
				<tr>
				<td style="background-color: #ffffff; height: 20px;width:15%" align="right">建设内容：</td>
				<td colspan="5" style="background-color: #ffffff; height: 20px;" align="left">
					<textarea rows="2"  style="width:99%">修复工程</textarea>
				</td>
			</tr>
			<tr>
				<td style="background-color: #ffffff; height: 20px;width:15%" align="right">备&nbsp;&nbsp;注：</td>
				<td colspan="5" style="background-color: #ffffff; height: 20px;" align="left">
					<textarea rows="2" style="width:99%"></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="6" style="background-color: #ffffff; height: 35px;"
					align="center"><a href="javascript:void(0)" id="save_button"
					class="easyui-linkbutton" plain="true" iconCls="icon-save">保存</a> <a
					href="javascript:void(0)" id="qx_window"
					class="easyui-linkbutton" plain="true" iconCls="icon-cancel">取消</a></td>
			</tr>
			</table>
</body>
</html>