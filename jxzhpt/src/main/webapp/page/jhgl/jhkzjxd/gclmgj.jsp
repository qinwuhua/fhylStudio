<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>工程改造路面改建项目</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/icon.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/page/jhgl/js/jhkglGrid.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/page/jhgl/js/loadTask.js"></script>
	<script type="text/javascript">
		$(function(){
			gydwComboxTree("gydw");
			xzqhComboxTree("xzqh"); 
			gclmgjxm_zjxd();
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
	                <a style="color: #1a5780" href="#">项目计划库资金下达</a>
	            	<font style="color: #5C5C5C;">&nbsp;>&nbsp;工程改造路面改建项目</font>
	            </td>
        	</tr>
        	<tr>
        		<td align="left" style="padding-left: 10px; padding-right: 10px;">
        			<fieldset style="width:99%; text-align: left; vertical-align: middle;">
        				<legend style="padding: 0 0 0 0; font-weight: bold; color: Gray; font-size: 12px;">
        					<font style="color: #0866A0; font-weight: bold"></font>
        				</legend>
        				<div>
        					<p style="margin-left: 20px;">
        						<span>管养单位：</span>
        						<select id="gydw" style="width:237px;"></select>
        						<span>&nbsp;行政区划：</span>
        						<select id="xzqh" style="width:214px;"></select>
        						<span>&nbsp;路线名称：</span>
        						<input name="txtRoad" type="text" id="txtRoad" style="width:100px;" />
        					</p>
        					<p style="margin-left: 20px;">
        						<span style="vertical-align:middle;">上报年份：</span>
        						<select id="sbnf" style="width: 80px;vertical-align:middle;"></select>
								<span style="vertical-align:middle;">&nbsp;特殊地区：</span>
								<select name="ddlTSDQ" id="ddlTSDQ" style="width:80px;vertical-align:middle;">
									<option selected="selected" value="">全部</option>
									<option value="2FCE5964394642BAA014CBD9E3829F84">丘陵</option>
									<option value="82C37FE603D54C969D86BAB42D7CABE0">河流</option>
									<option value="ACDB9299F81642E3B2F0526F70492823">罗霄山山脉</option>
									<option value="AEF17CEA8582409CBDA7E7356D9C93B0">盆地</option>
									<option value="FEE9AE40475863D6E040007F010045D7">cs</option>
									<option value="517e0f37-12cd-4de9-a452-6aca259457c1">csss</option>
								</select>
								<span style="vertical-align:middle;">&nbsp;建设状态：</span>
        						<select name="ddlSHZT" id="ddlSHZT" style="width:70px;vertical-align:middle;">
									<option selected="selected" value="">全部</option>
									<option value="未上报">未开工</option>
									<option value="已上报">在建</option>
									<option value="未审核">竣工</option>
								</select>
								<span style="vertical-align:middle;">&nbsp;技术等级：</span>
								<select name="ddlPDDJ" id="ddlPDDJ" style="width:65px;vertical-align:middle;">
									<option selected="selected" value="">全部</option>
									<option value="1">一级公路</option>
									<option value="2">二级公路</option>
									<option value="3">三级公路</option>
									<option value="4">四级公路</option>
									<option value="5">等外公路</option>
								</select>
								<span style="vertical-align:middle;">&nbsp;公路等级：</span>
								<select name="ddlGldj" id="ddlGldj" style="width:104px;vertical-align:middle;">
									<option selected="selected" value="">全部</option>
									<option value="G">国道</option>
									<option value="S">省道</option>
									<option value="X">县道</option>
									<option value="Y">乡道</option>
									<option value="C">村道</option>
									<option value="Z">专道</option>
								</select>
								<input type="image" name="btnSelect" id="btnSelect" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/Serch02.gif'" alt="查询" onmouseout="this.src='${pageContext.request.contextPath}/images/Button/Serch01.gif'" src="${pageContext.request.contextPath}/images/Button/Serch01.gif" style="border-width:0px;cursor: hand;vertical-align:middle;" />
        					</p>
        				</div>
        			</fieldset>
        		</td>
        	</tr>
        	<tr>
        		<td style="text-align: left; padding-left: 20px; padding-top: 5px; height: 30px; font-size: 12px;">
        			共有【 <span id="lblCount"></span> 】个路面升级项目，总里程共
        			【&nbsp;<span id="lblZLC" style="font-weight: bold; color: #FF0000">49.350</span>&nbsp;】
        			公里，项目里程共【&nbsp;<span id="lblXMLC" style="font-weight: bold; color: #FF0000"></span>&nbsp;】
        			公里，批复总投资【&nbsp;<span id="lblZTZ" style="font-weight: bold; color: #FF0000">14</span>&nbsp;】
        			万元，其中部投资【&nbsp;<span id="lblBTZ" style="font-weight: bold; color: #FF0000">6</span>&nbsp;】
        			万元，地方投资【&nbsp;<span id="lblDFTZ" style="font-weight: bold; color: #FF0000">8</span>&nbsp;】万元。
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