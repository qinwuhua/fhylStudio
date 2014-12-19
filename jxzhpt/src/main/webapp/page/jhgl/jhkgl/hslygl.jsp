<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>红色旅游公路项目</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/icon.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/page/jhgl/js/jhkglGrid.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/page/jhgl/js/comboxtree.js"></script>
	<script type="text/javascript">
		$(function(){
			xzqhComboxTree("xzqh");
			hslyglxm();
		});
		
		$(window).resize(function () { 
			$('#grid').datagrid('resize'); 
		});
	</script>
</head>
<body>
	<div style="text-align: left; font-size: 12px; margin: 0px;">
		<table width="99%" border="0" style="margin-top: 1px; margin-left: 1px;" cellspacing="0" cellpadding="0">
			<tr>
	            <td height="25" align="left" background="${pageContext.request.contextPath}/images/dht_bg.jpg" style="padding-left: 25px; background-repeat: no-repeat; font-size: 12px;">
	                <a style="color: #1a5780" href="#">计划管理</a> &nbsp;>&nbsp;
	                <a style="color: #1a5780" href="#">项目计划库管理</a>
	            	<font style="color: #5C5C5C;">&nbsp;>&nbsp;红色旅游公路建议计划</font>
	            </td>
        	</tr>
        	<tr>
        		<td align="left" style="padding-left: 10px; padding-right: 10px;">
        			<fieldset style="width:99%; text-align: left; vertical-align: middle;">
        				<legend style="padding: 0 0 0 0; font-weight: bold; color: Gray; font-size: 12px;">
        					<font style="color: #0866A0; font-weight: bold">项目信息：</font>
        				</legend>
        				<div>
        					<p style="margin-left: 20px;">
        						<span>行政区划：</span>
        						<select id="xzqh" style="width:224px;"></select>
        						<span>&nbsp;计划年份：</span>
        						<select name="ddlSHZT" id="ddlSHZT" style="width:70px;"></select>
								<span>&nbsp;项目名称：</span>
								<input name="txtName" type="text" id="txtName" style="width:150px;" />
        					</p>
        					<p style="margin: 0px; padding: 0px;margin-left: 20px;">
        						<input type="image" name="btnSelect" id="btnSelect" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/Serch02.gif'" alt="查询" onmouseout="this.src='${pageContext.request.contextPath}/images/Button/Serch01.gif'" src="${pageContext.request.contextPath}/images/Button/Serch01.gif" style="border-width:0px;cursor: hand;" />
								<input type="image" name="btnDCMB" id="btnDCMB" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/DC2.gif'" alt="导出模版" onmouseout="this.src='${pageContext.request.contextPath}/images/Button/DC1.gif'" src="${pageContext.request.contextPath}/images/Button/DC1.gif" style="border-width:0px;cursor: hand;" />
								<img alt="导入" src="${pageContext.request.contextPath}/images/Button/dreclLeave.GIF" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/dreclClick.GIF'" onmouseout="this.src='${pageContext.request.contextPath}/images/Button/dreclLeave.GIF'" onclick="importExcel()" />
                                <input type="image" name="delAll" id="delAll" src="${pageContext.request.contextPath}/images/Button/delete1.jpg" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/delete2.jpg'" onmouseout="this.src='${pageContext.request.contextPath}/images/Button/delete1.jpg'   " src="" onclick="javascript:return CheckSelect();" style="border-width:0px;" />
        					</p>
        				</div>
        			</fieldset>
        		</td>
        	</tr>
        	<tr>
        		<td style="text-align: left; padding-left: 15px; padding-top: 5px; height: 30px; font-size: 12px;">
        			共有【&nbsp;<span id="lblCount" style="font-weight: bold; color: #FF0000">2</span>&nbsp;】红色旅游项目，
        			建设规模合计【&nbsp;<span id="lblGMHJ" style="font-weight: bold; color: #FF0000">10.500</span>&nbsp;】公里，
        			其中，一级公路【&nbsp;<span id="lblYJGL" style="font-weight: bold; color: #FF0000">1.000</span>&nbsp;】公里，二级公路【&nbsp;<span id="lblEJGL" style="font-weight: bold; color: #FF0000">0.000</span>&nbsp;】公里，
        			三级公路【&nbsp;<span id="lblSJGL" style="font-weight: bold; color: #FF0000">8.500</span>&nbsp;】公里，
        			四级公路【&nbsp;<span id="lblSIJGL" style="font-weight: bold; color: #FF0000">0.000</span>&nbsp;】公里，
        			独立大桥【&nbsp;<span id="lblDLDQ" style="font-weight: bold; color: #FF0000">1.000</span>&nbsp;】公里；
        			总投资【&nbsp;<span id="lblZTZ" style="font-weight: bold; color: #FF0000">2751</span>&nbsp;】万元，
        			其中，中央投资车购税【&nbsp;<span id="lblZYTZ" style="font-weight: bold;color: #FF0000">1143</span>&nbsp;】万元； 上年底累计完成投资【&nbsp;<span id="lblSNZTZ" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】万元， 其中，中央投资车购税【&nbsp;<span id="lblSNZYTZ" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】万元。
        		</td>
        	</tr>
        	<tr>
            	<td style="padding-left: 10px;padding-top:5px; font-size:12px;">
            		<div>
            			<table id="grid" width="100%" height="320px"></table>
            		</div>
            	</td>
        	</tr>
		</table>
	</div>
</body>
</html>