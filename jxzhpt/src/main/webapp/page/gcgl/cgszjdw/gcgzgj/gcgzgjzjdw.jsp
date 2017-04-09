<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>资金到位情况</title>
	<link href="${pageContext.request.contextPath}/css/searchAndNavigation.css" type="text/css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/icon.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YMLib.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/util/jquery.cookie.js"></script>
	<script type="text/javascript" src="js/gcgzgj.js"></script>
	<script type="text/javascript">
		$(function(){
			showAllZJ();
			$("#nf").text(new Date().getFullYear());
			shezhi();
		});
		
	</script>
	<style type="text/css">
<!--
a:link {
 text-decoration: none;
}
a:visited {
 text-decoration: none;
}
a:hover {
 text-decoration: none;
}
a:active {
 text-decoration: none;
}
-->
</style>
</head>
<body>
	<div style="text-align: left; font-size: 12px; margin: 0px;">
		<table width="98%" border="0"
			style="margin-top: 1px; margin-left: 1px;" cellspacing="0"
			cellpadding="0">

			<tr id="trTJ">
				<td height="30" align="left" style="font-size: 12px;">
                    项目计划下达资金共【<span id="jhxdzj" style="color: Red; font-weight: bold;"></span>】万元，
                    累计拨付资金共【<span id="zbfzj" style="color: Red; font-weight: bold;"></span>】万元。
                    其中，<span id="nf"></span>年计划下达资金【<span id="nxdzj" style="color: Red; font-weight: bold;"></span>】万元，
                    已拨付【<span id="nbfzj" style="color: Red; font-weight: bold;"></span>】万元。
                </td>
			</tr>
			<tr>
				<td>
					<table id="zjgrid">
					</table>
				</td>
			</tr>
		</table>
		<table width="100%" border="0"
			style="border-style: solid; border-width: 0px 0px 0px 0px; margin-top: 8px; border-color: #55BEEE #C0C0C0 #C0C0C0 #C0C0C0; height: 45px;"
			cellspacing="0" cellpadding="0">
			<tr style="height: 30px;">
				<td align="center">
					<table>
						<tr>
							<td><input type="image" name="btnAdd" id="btnAdd" onclick="addCgs()"
								onmouseover="this.src='${pageContext.request.contextPath}/images/Button/tianj2.gif'" alt="添加"
								onmouseout="this.src='${pageContext.request.contextPath}/images/Button/tianj1.gif'"
								src="${pageContext.request.contextPath}/images/Button/tianj1.gif"
								style="border-width: 0px; cursor: hand;" /></td>
							<td>
									<img onclick="closes('wqxx1')" src="${pageContext.request.contextPath}/images/Button/fanhui1.GIF" alt="返回"
									onmouseover="this.src='${pageContext.request.contextPath}/images/Button/fanhui2.GIF'"
									onmouseout="this.src='${pageContext.request.contextPath}/images/Button/fanhui1.GIF'"
									style="border: 0" />
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		</body>
</html>