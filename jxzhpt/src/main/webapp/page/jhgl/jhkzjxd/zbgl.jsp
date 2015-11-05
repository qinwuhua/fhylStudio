<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>战备公路</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/Top.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/icon.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/page/jhgl/js/jhkglGrid.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/page/jhgl/js/loadTask.js"></script>
	<script type="text/javascript">
		$(function(){
			xzqhComboxTree("xzqh");
			zbglxm_zjxd();
		});
		
		$(window).resize(function () { 
			$('#grid').datagrid('resize'); 
		});
	</script>
</head>
<body>
	<div style="text-align: left; font-size: 12px; margin: 0px;">
		<table width="100%" border="0" style="margin-top: 1px; margin-left: 1px;" cellspacing="0" cellpadding="0">
			<tr>
				<td>
	                <div id="righttop">
						<div id="p_top">计划管理>&nbsp;项目计划库资金下达>&nbsp;战备公路建议计划</div>
					</div>
	            </td>
        	</tr>
        	<tr>
        		<td align="left" style="padding-left: 10px; padding-right: 10px;padding-top: 8px;">
        			<fieldset style="width:99%; text-align: left; vertical-align: middle;">
        				<legend style="padding: 0 0 0 0; font-weight: bold; color: Gray; font-size: 12px;">
        					<font style="color: #0866A0; font-weight: bold"></font>
        				</legend>
        				<div>
        					<p style="margin:8px 0px 8px 20px;">
        						<span style="vertical-align:middle;">行政区划：</span>
        						<select id="xzqh" style="width:224px;vertical-align:middle;"></select>
        						<span style="vertical-align:middle;">&nbsp;计划年份：</span>
        						<select name="ddlSHZT" id="ddlSHZT" style="width:70px;vertical-align:middle;"></select>
        						<span style="vertical-align:middle;">&nbsp;特殊地区：</span>
        						<select name="ddlTSDQ" id="ddlTSDQ" style="width:100px;vertical-align:middle;">
									<option selected="selected" value="">全部</option>
									<option value="2FCE5964394642BAA014CBD9E3829F84">丘陵</option>
									<option value="82C37FE603D54C969D86BAB42D7CABE0">河流</option>
									<option value="ACDB9299F81642E3B2F0526F70492823">罗霄山山脉</option>
									<option value="AEF17CEA8582409CBDA7E7356D9C93B0">盆地</option>
									<option value="FEE9AE40475863D6E040007F010045D7">cs</option>
									<option value="517e0f37-12cd-4de9-a452-6aca259457c1">csss</option>
								</select>
								<img alt="搜索" src="${pageContext.request.contextPath}/images/Button/Serch01.gif" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/Serch02.gif'" onmouseout="this.src='${pageContext.request.contextPath}/images/Button/Serch01.gif'" onclick="importExcel()" style="vertical-align:middle;"/>
        					</p>
        					<p style="margin:8px 0px 8px 20px;">
        						<span>路线名称：</span>
								<input name="txtRoad" type="text" id="txtRoad" style="width:220px;" />
								<span>&nbsp;项目名称：</span>
								<input name="txtName" type="text" id="txtName" style="width:150px;" />
								<span>&nbsp;建设状态：</span>
								<select id="selJszt"  style="width: 100px;"></select>
        					</p>
        				</div>
        			</fieldset>
        		</td>
        	</tr>
        	<tr>
        		<td style="text-align: left; padding-left: 15px; padding-top: 5px; height: 30px; font-size: 12px;">
        			共有【&nbsp;<span id="lblCount" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】个战备公路项目，总补助资金【&nbsp;<span id="lblXDZJ" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】万元。
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
	<div id="zbgl_zjxd" style="text-align: left;font-size: 12px;width:80%;"></div>
</body>
</html>