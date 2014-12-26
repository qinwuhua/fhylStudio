<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>项目信息列表</title>
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
	            <td height="25" align="left" background="${pageContext.request.contextPath}/images/dht_bg.jpg" style="padding-left: 20px; background-repeat: no-repeat; font-size: 12px;" colspan="2">
	                <a style="color: #1a5780;text-decoration: none;" href="#">统计分析</a> &nbsp;>&nbsp;
	                <a style="color: #1a5780;text-decoration: none;" href="#">项目统计分析</a>
	            	<font style="color: #5C5C5C;">&nbsp;>&nbsp;项目类型统计</font>
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
</body>
</html>