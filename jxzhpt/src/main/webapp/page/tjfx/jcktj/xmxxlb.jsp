<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>项目信息列表</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/Top.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/icon.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/page/tjfx/js/jhkglGrid.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/page/jhgl/js/loadTask.js"></script>
	<script type="text/javascript">
		$(function(){
			xmxxlb("桥梁");
		});
	</script>
</head>
<body>
	<div style="text-align: left; font-size: 12px; margin: 0px;">
		<table width="99%" border="0" style="margin-top: 1px; margin-left: 1px;" cellspacing="0" cellpadding="0">
			<tr>
				<td colspan="2">
	                <div id="righttop">
						<div id="p_top">统计分析>&nbsp;基础库统计分析>&nbsp;项目统计</div>
					</div>
	            </td>
        	</tr>
        	<tr>
        		<td style="padding-left: 10px;padding-top: 10px;" width="40%">
        			<div>
        				<div>
        					<img alt="" src="${pageContext.request.contextPath}/images/jt.jpg">江西省—危桥改造项目【4】个
        				</div>
        				<div style="padding-top: 5px;">
        					<table id="xmgrid"></table>
        				</div>
        			</div>
        		</td>
        		<td style="text-align: center;vertical-align:middle;" rowspan="2">
        			<img alt="" src="${pageContext.request.contextPath}/page/tjfx/img/xmtjdt.png" height="600">
        		</td>
        	</tr>
        	<tr>
        		<td style="padding-left: 10px;padding-top: 10px;">
        			<img alt="" src="${pageContext.request.contextPath}/page/tjfx/img/xmjz.png" width="580">
        		</td>
        	</tr>
		</table>
	</div>
	<div id="xmxx_xx"></div>
</body>
</html>