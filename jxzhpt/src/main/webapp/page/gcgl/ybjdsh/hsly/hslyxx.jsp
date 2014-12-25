<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>红色旅游开工详情</title>
<link
	href="${pageContext.request.contextPath}/css/searchAndNavigation.css"
	type="text/css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/easyui/themes/icon.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/easyui/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YMLib.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/easyui/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="js/hsly.js"></script>
<script type="text/javascript"> 

</script>
<style type="text/css">
a {
	text-decoration: none;
}
</style>
</head>
<body style="margin: 0 0 0 0">
	<div style="text-align: left; font-size: 12px; margin: 0px;">
		<table width="99%" border="0"
			style="margin-top: 1px; margin-left: 1px;" cellspacing="0"
			cellpadding="0">
			
			<tr>
				<td height="45" align="left" background="${pageContext.request.contextPath}/images/jt.jpg"
					style="padding-left: 15px; font-size: 14px; color: #007DB2; font-weight: bold; background-repeat: no-repeat; background-position: left center; background-repeat: no-repeat;">
					红色旅游项目计划详情</td>
			</tr>
		</table>
		<table width="97%" border="0" style="border-style: solid; border-width: 3px 1px 1px 1px;
            border-color: #55BEEE #C0C0C0 #C0C0C0 #C0C0C0; margin-left: 13px; height: 45px;"
            cellspacing="0" cellpadding="0">
            <tr style="height: 25px;">
                <td colspan="6" style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                    color: #55BEEE; font-weight: bold; font-size: small; text-align: left; background-color: #F1F8FF;
                    width: 15%; padding-left: 10px;">
                    红色旅游项目基本信息
                </td>
            </tr>
            <tr style="height: 30px;">
                <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                    color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                    width: 15%; padding-right: 5px;">
                    项目名称
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
                    <span id="lblXMMC">grr</span>
                    &nbsp;
                </td>
                <td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small;
                    text-align: right; background-color: #F1F8FF; padding-right: 5px;">
                    行政区划
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
                    <span id="lblXZQHMC">南昌市</span>
                    &nbsp;
                </td>
                <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                    color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                    width: 15%; padding-right: 5px;">
                    计划年份
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; width: 18%; text-align: left; padding-left: 10px;">
                    <span id="lblJHNF">2014</span>
                    &nbsp;
                </td>
            </tr>
            <tr style="height: 30px;">
                <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                    color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                    padding-right: 5px;">
                    建设规模合计
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;">
                    <span id="lblJSGMHJ">2</span>
                    公里
                </td>
                <td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small;
                    text-align: right; background-color: #F1F8FF; padding-right: 5px;">
                    建设规模(一级公路)
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
                    <span id="lblJSGMY">1</span>
                    公里
                </td>
                <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                    color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                    padding-right: 5px;">
                    建设规模(二级公路)
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;">
                    <span id="lblJSGME"></span>
                    公里
                </td>
            </tr>
            <tr style="height: 30px;">
                <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                    color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                    padding-right: 5px;">
                    建设规模(三级公路)
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;">
                    <span id="lblJSGMS"></span>
                    公里
                </td>
                <td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small;
                    text-align: right; background-color: #F1F8FF; padding-right: 5px;">
                    建设规模(四级公路)
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
                    <span id="lblJSGMF"></span>
                    公里
                </td>
                <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                    color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                    padding-right: 5px;">
                    建设规模(独立大桥)
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;">
                    <span id="lblJSGMDLDQ">1</span>
                    公里
                </td>
            </tr>
            <tr style="height: 30px;">
                <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                    color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                    padding-right: 5px;">
                    总投资
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;">
                    <span id="lblZTZ">44</span>
                    万元
                </td>
                <td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small;
                    text-align: right; background-color: #F1F8FF; padding-right: 5px;">
                    中央投资车购税
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
                    <span id="lblZYTZ">22</span>
                    万元
                </td>
                <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                    color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                    padding-right: 5px;">
                    地方（企业）自筹
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;">
                    <span id="lblDFZC">22</span>
                    万元
                </td>
            </tr>
            <tr style="height: 30px;">
                <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                    color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                    padding-right: 5px;">
                    国内贷款
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;">
                    <span id="lblGNDK"></span>
                    万元
                </td>
                <td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small;
                    text-align: right; background-color: #F1F8FF; padding-right: 5px;">
                    利用外资
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
                    <span id="lblLYWZ"></span>
                    万元
                </td>
                <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                    color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                    padding-right: 5px;">
                    建设性质
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;">
                    <span id="lblJSXZ">新改建</span>
                    &nbsp;
                </td>
            </tr>
            <tr style="height: 30px;">
                <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                    color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                    padding-right: 5px;">
                    工可批复文号
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;">
                    <span id="lblGKPFWH">ggrr</span>
                </td>
                <td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small;
                    text-align: right; background-color: #F1F8FF; padding-right: 5px;">
                    初设或施工图批复文号
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
                    <span id="lblSGTPFWH">grr123456</span>
                </td>
                <td colspan="2" style="border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0;">
                    &nbsp;
                </td>
            </tr>
            <tr style="height: 50px;">
                <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                    color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                    padding-right: 5px;">
                    主要建设内容
                </td>
                <td colspan="5" style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;">
                    <span id="lblZYJSNR"></span>
                    &nbsp;
                </td>
            </tr>
            <tr style="height: 50px;">
                <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                    color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                    padding-right: 5px;">
                    新增生产能力
                </td>
                <td colspan="5" style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;">
                    <span id="lblXZSCNL"></span>
                    &nbsp;
                </td>
            </tr>
            <tbody id="YKG">
                <tr style="height: 25px;">
                    <td colspan="6" style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                        color: #55BEEE; font-weight: bold; font-size: small; text-align: left; background-color: #F1F8FF;
                        width: 15%; padding-left: 10px;">
                        红色旅游项目开工信息
                    </td>
                </tr>
                <tr style="height: 30px;">
                    <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                        color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                        width: 15%; padding-right: 5px;">
                        计划下达时间
                    </td>
                    <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                        border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
                        <span id="XDSJ">2014/9/22</span>
                    </td>
                    <td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0;
                        border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small;
                        text-align: right; background-color: #F1F8FF; padding-right: 5px;">
                        实际开工时间
                    </td>
                    <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                        border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
                        <span id="SJKGSJ">2014/9/22</span>
                        &nbsp;
                    </td>
                    <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                        color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                        width: 15%; padding-right: 5px;">
                        预计完工时间
                    </td>
                    <td style="border-left: 1px solid #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0;
                        border-bottom: 1px solid #C0C0C0; width: 18%; text-align: left; padding-left: 10px;">
                        <span id="YJWGSJ">2014/9/22</span>
                        &nbsp;
                    </td>
                </tr>
                <tr style="height: 30px;">
                    <td style="border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small;
                        text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
                        施工单位
                    </td>
                    <td style="border-bottom: 1px solid #C0C0C0; border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0;
                        border-top: 1px none #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
                        <span id="SGDW">cs</span>&nbsp;
                    </td>
                    <td style="border-bottom: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; color: #007DB3;
                        font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                        padding-right: 5px;">
                        监理单位
                    </td>
                    <td style="border-bottom: 1px solid #C0C0C0; border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0;
                        border-top: 1px none #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
                        <span id="JLDW">cs</span>
                        &nbsp;
                    </td>
                    <td style="border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small;
                        text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
                        建设单位
                    </td>
                    <td style="border-bottom: 1px solid #C0C0C0; border-left: 1px solid #C0C0C0; border-right: 1px none #C0C0C0;
                        border-top: 1px none #C0C0C0; width: 18%; text-align: left; padding-left: 10px;">
                        <span id="JSDW">cs</span>
                    </td>
                </tr>
                <tr style="height: 30px;">
                    <td style="color: #007DB3; font-weight: bold; font-size: small; text-align: right;
                        background-color: #F1F8FF; width: 15%; padding-right: 5px;">
                        合同金额（万元）
                    </td>
                    <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                        width: 19%; text-align: left; padding-left: 10px;">
                        <span id="HTJE">22</span>
                    </td>
                    <td style="color: #007DB3; font-weight: bold; font-size: small; text-align: right;
                        background-color: #F1F8FF; width: 15%; padding-right: 5px;">
                        概算总投资（万元）
                    </td>
                    <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                        width: 19%; text-align: left; padding-left: 10px;">
                        <span id="GSZTZ">22</span>
                    </td>
                    <td style="color: #007DB3; font-weight: bold; font-size: small; text-align: right;
                        background-color: #F1F8FF; width: 15%; padding-right: 5px;">
                        &nbsp;
                    </td>
                    <td style="border-left: 1px solid #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0;
                        width: 18%; text-align: left; padding-left: 10px;">
                        &nbsp;
                    </td>
                </tr>
                <tr style="height: 25px;">
                    <td colspan="6" style="border-style: solid none solid solid; border-width: 1px; border-color: #C0C0C0;
                        color: #55BEEE; font-weight: bold; font-size: small; text-align: left; background-color: #F1F8FF;
                        width: 15%; padding-left: 10px;">
                        红色旅游项目进展信息
                    </td>
                </tr>
                <tr style="height: 30px;">
                    <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                        color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                        width: 15%; padding-right: 5px;">
                        施工许可文件
                    </td>
                    <td colspan="5" style="border-left: 1px solid #C0C0C0; border-right: 1px none #C0C0C0;
                        border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 18%; text-align: left;
                        padding-left: 10px;">
                        <div id="divSGXK_TJ">
                            <table width="100%" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td align="left" nowrap="nowrap" style="width: 50%;">
                                        <span id="lblSGXKWJ">暂无附件</span>
                                        <a onclick="return CheckFJ(this.innerText);" id="btnSGXKWJ" href="javascript:__doPostBack('btnSGXKWJ','')" style="color:#2C7ED1;"></a>
                                    </td>
                                    <td align="left">
                                        <table>
                                            <tr>
                                                <td>
                                                    <a onclick="return toDialogRoad('SGXK');" id="btnUpdate_SGXK" href="javascript:__doPostBack('btnUpdate_SGXK','')" style="color:#2C7ED1;">上传</a>
                                                </td>
                                                <td>
                                                    &nbsp;|&nbsp;
                                                </td>
                                                <td>
                                                    
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </td>
                </tr>
                <tr style="height: 30px;">
                    <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                        color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                        width: 15%; padding-right: 5px;">
                        交工通车文件
                    </td>
                    <td colspan="5" style="border-left: 1px solid #C0C0C0; border-right: 1px none #C0C0C0;
                        border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 18%; text-align: left;
                        padding-left: 10px;">
                        <div id="div1">
                            <table width="100%" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td align="left" nowrap="nowrap" style="width: 50%;">
                                        <span id="lblJGTCWJ">暂无附件</span>
                                        <a onclick="return CheckFJ(this.innerText);" id="btnJGTCWJ" href="javascript:__doPostBack('btnJGTCWJ','')" style="color:#2C7ED1;"></a>
                                    </td>
                                    <td align="left">
                                        <table>
                                            <tr>
                                                <td>
                                                    <a onclick="return toDialogRoad('JGTC');" id="btnUpdate_JGTC" href="javascript:__doPostBack('btnUpdate_JGTC','')" style="color:#2C7ED1;">上传</a>
                                                </td>
                                                <td>
                                                    &nbsp;|&nbsp;
                                                </td>
                                                <td>
                                                    
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </td>
                </tr>
                <tr style="height: 30px;">
                    <td style="color: #007DB3; font-weight: bold; font-size: small; text-align: right;
                        background-color: #F1F8FF; width: 15%; padding-right: 5px;">
                        完工验收文件
                    </td>
                    <td colspan="5" style="border-left: 1px solid #C0C0C0; border-right: 1px none #C0C0C0;
                        border-top: 1px none #C0C0C0; width: 18%; text-align: left; padding-left: 10px;">
                        <div id="div3">
                            <table width="100%" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td align="left" nowrap="nowrap" style="width: 50%;">
                                        <span id="lblJGYSWJ">暂无附件</span>
                                        <a onclick="return CheckFJ(this.innerText);" id="btnJGYSWJ" href="javascript:__doPostBack('btnJGYSWJ','')" style="color:#2C7ED1;"></a>
                                    </td>
                                    <td align="left">
                                        <table>
                                            <tr>
                                                <td>
                                                    <a onclick="return toDialogRoad('JGYS');" id="btnUpdate_JGYS" href="javascript:__doPostBack('btnUpdate_JGYS','')" style="color:#2C7ED1;">上传</a>
                                                </td>
                                                <td>
                                                    &nbsp;|&nbsp;
                                                </td>
                                                <td>
                                                    
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </td>
                </tr>
        </table>

		<table width="97%" border="0"
			style="border-style: solid; border-width: 3px 1px 1px 1px; margin-top: 20px; border-color: #55BEEE #C0C0C0 #C0C0C0 #C0C0C0; margin-left: 13px; height: 45px;"
			cellspacing="0" cellpadding="0">
			<tr style="height: 30px;">
				<td align="center"><img alt="确定" src="${pageContext.request.contextPath}/images/Button/qd1.gif"
					onmouseover="this.src='${pageContext.request.contextPath}/images/Button/qd2.gif'"
					onmouseout="this.src='${pageContext.request.contextPath}/images/Button/qd1.gif' "
					onclick="closes('wqxx')" /></td>
			</tr>
		</table>
		<br />
	</div>
</body>
</html>