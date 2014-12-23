<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>车购税资金到位情况</title>
	<link href="${pageContext.request.contextPath}/css/searchAndNavigation.css" type="text/css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/icon.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="js/sh.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YMLib.js"></script>
	<script type="text/javascript">
		$(function(){
			$('#gydw').combotree({   
				url:"js/gydw.json"
			}); 
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
		<table width="99%" border="0"
			style="margin-top: 1px; margin-left: 1px;" cellspacing="0"
			cellpadding="0">
	
                <tr>
                    <td>
                        <br />
                        <table width="100%" border="0" style="border-style: solid; border-width: 3px 1px 1px 1px;
                            border-color: #55BEEE #C0C0C0 #C0C0C0 #C0C0C0; height: 45px;" cellspacing="0"
                            cellpadding="0">
                            <tr style="height: 35px;">
                                <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                    color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                    width: 15%; padding-right: 5px; vertical-align: middle;">
                                    <b><font color="#009ACD" style="cursor: hand; font-size: 12px">车购税到位资金 </font></b>
                                </td>
                                <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                                    border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;" colspan="5">
                                    <input name="txtCGSZJDW" type="text" id="txtCGSZJDW" onkeyup="MangeTZ(event,this)" onblur="checkNum(this)" />万元
                                </td>
                            </tr>
                            <tr style="height: 35px;">
                                <td style="color: #007DB3; font-weight: bold; font-size: small; text-align: right;
                                    background-color: #F1F8FF; width: 15%; padding-right: 5px;">
                                    <b><font color="#009ACD" style="cursor: hand; font-size: 12px">填报人：</font></b>
                                </td>
                                <td style="border-left: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
                                    <span id="lblUser">系统管理员</span>&nbsp;
                                </td>
                                <td style="border-left: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small;
                                    text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
                                    <b><font color="#009ACD" style="cursor: hand; font-size: 12px">填报时间：</font></b>
                                </td>
                                <td style="border-left: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
                                    <span id="lblReportTime">2014-12-18</span>&nbsp;
                                </td>
                                <td style="border-left: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small;
                                    text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
                                    <b><font color="#009ACD" style="cursor: hand; font-size: 12px">月报月份：</font></b>
                                </td>
                                <td style="border-left: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
                                    <span id="lblSBYF">2014-12</span>&nbsp;
                                </td>
                            </tr>
                        </table>
                        <table width="100%" border="0" style="border-style: solid; border-width: 3px 1px 1px 1px;
                            margin-top: 20px; border-color: #55BEEE #C0C0C0 #C0C0C0 #C0C0C0; height: 45px;"
                            cellspacing="0" cellpadding="0">
                            <tr style="height: 30px;">
                                <td align="center">
                                    <input type="image" name="btnAdd" id="btnAdd" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/baocun2.gif'" alt="保存" onmouseout="this.src='${pageContext.request.contextPath}/images/Button/baocun1.gif'" src="${pageContext.request.contextPath}/images/Button/baocun1.gif" style="border-width:0px;" />
                                    &nbsp;
                                    <input onclick="closes('wqxx')" type="image" name="btnCancel" id="btnCancel" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/fanhui2.GIF'" alt="返回" onmouseout="this.src='${pageContext.request.contextPath}/images/Button/fanhui1.GIF'" src="${pageContext.request.contextPath}/images/Button/fanhui1.GIF" style="border-width:0px;" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
	</body>
</html>