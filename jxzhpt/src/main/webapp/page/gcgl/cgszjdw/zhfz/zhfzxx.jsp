<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>灾害防治开工详情</title>
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
<script type="text/javascript" src="js/zhfz.js"></script>
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
                <td height="45" align="left" background="../images/page/jt.jpg" style="padding-left: 15px;
                    font-size: 14px; color: #007DB2; font-weight: bold; background-repeat: no-repeat;
                    background-position: left center; background-repeat: no-repeat;">
                    灾害防治项目计划详情
                </td>
            </tr>
        </table>
        <table width="97%" border="0" style="border-style: solid; border-width: 3px 1px 1px 1px;
            border-color: #55BEEE #C0C0C0 #C0C0C0 #C0C0C0; margin-left: 13px; height: 45px;"
            cellspacing="0" cellpadding="0">
            <tr style="height: 25px;">
                <td colspan="6" style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                    color: #55BEEE; font-weight: bold; font-size: small; text-align: left; background-color: #F1F8FF;
                    width: 15%; padding-left: 10px;">
                    灾害防治项目基本信息
                </td>
            </tr>
            <tr style="height: 30px;">
                <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                    color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                    width: 15%; padding-right: 5px;">
                    路线名称
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
                    <span id="Lab_LXMC">文坊-冷水</span>
                    &nbsp;
                </td>
                <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                    color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                    width: 15%; padding-right: 5px;">
                    路线编码
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
                    <span id="Lab_LXBM">Y51636068</span>
                    &nbsp;
                </td>
                <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                    color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                    width: 15%; padding-right: 5px;">
                    管养单位
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0;
                    width: 19%; text-align: left; padding-left: 10px;">
                    <span id="Lab_GYDW">鹰潭市贵溪市交通局</span>
                    &nbsp;
                </td>
            </tr>
            <tr style="height: 30px;">
                <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                    color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                    padding-right: 5px;">
                    起点桩号
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;">
                    <span id="Lab_QDZH">30.018</span>
                    &nbsp;
                </td>
                <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                    color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                    width: 15%; padding-right: 5px;">
                    止点桩号
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
                    <span id="Lab_ZDZH">36.913</span>
                    &nbsp;
                </td>
                <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                    color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                    padding-right: 5px;">
                    总里程
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;">
                    <span id="Lab_ZLC">6.895</span>
                    公里
                </td>
            </tr>
            <tr style="height: 30px;">
                <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                    color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                    padding-right: 5px;">
                    行政区划代码
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;">
                    <span id="Lab_XZQHDM">360681</span>
                    &nbsp;
                </td>
                <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                    color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                    width: 15%; padding-right: 5px;">
                    行政区划名称
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
                    <span id="Lab_XZQHMC">鹰潭市贵溪市</span>
                    &nbsp;
                </td>
                <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                    color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                    padding-right: 5px;">
                    修建/改建年度
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;">
                    <span id="Lab_XJND">2006</span>
                    &nbsp;
                </td>
            </tr>
            <tr style="height: 30px;">
                <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                    color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                    padding-right: 5px;">
                    路线技术等级
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;">
                    <span id="lblLXJSDJ">三级公路</span>
                    &nbsp;
                </td>
                <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                    color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                    width: 15%; padding-right: 5px;">
                    建设规模
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
                    <span id="Lab_YHLC">2</span>
                    公里
                </td>
                <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                    color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                    padding-right: 5px;">
                    特殊地区
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;">
                    <span id="lblTSDQ">罗霄山山脉</span>
                    &nbsp;
                </td>
            </tr>
            <tr style="height: 30px;">
                <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                    color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                    width: 15%; padding-right: 5px;">
                    项目年份
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
                    <span id="Lab_XMNF">2014</span>
                    &nbsp;
                </td>
                <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                    color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                    padding-right: 5px;">
                    项目状态
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;">
                    <span id="Lab_XMTYPE">待上报</span>
                    &nbsp;
                </td>
                <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                    color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                    padding-right: 5px;">
                    &nbsp;
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;">
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                    color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                    padding-right: 5px;" class="style13">
                    灾害内容
                </td>
                <td colspan="5" style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;" class="style13">
                    <span id="Lab_ZHNR">g</span>
                    &nbsp;
                </td>
            </tr>
            <tr style="height: 50px;">
                <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                    color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                    padding-right: 5px;">
                    备&nbsp;&nbsp;&nbsp; 注
                </td>
                <td colspan="5" style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;">
                    <span id="Lab_BZ">g</span>
                    &nbsp;
                </td>
            </tr>
            <tr style="height: 25px;">
                <td colspan="6" style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                    color: #55BEEE; font-weight: bold; font-size: small; text-align: left; background-color: #F1F8FF;
                    width: 15%; padding-left: 10px;">
                    灾害防治项目审查信息
                </td>
            </tr>
            <tr style="height: 30px;">
                <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                    color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                    width: 15%; padding-right: 5px;">
                    起点桩号
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
                    <span id="Lab_SCQDZH">30.018</span>
                    &nbsp;
                </td>
                <td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small;
                    text-align: right; background-color: #F1F8FF; padding-right: 5px;">
                    止点桩号
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
                    <span id="Lab_SCZDZH">36.913</span>
                    &nbsp;
                </td>
                <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                    color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                    width: 15%; padding-right: 5px;">
                    总里程
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; width: 18%; text-align: left; padding-left: 10px;">
                    <span id="Lab_SCZLC">6.895</span>公里 &nbsp;
                </td>
            </tr>
            <tr style="height: 30px;">
                <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                    color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                    padding-right: 5px;">
                    隐患里程
                </td>
                <td colspan="5" style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;">
                    <span id="Lab_SCYHLC">2</span>公里 &nbsp;
                </td>
            </tr>
            <tr style="height: 30px;">
                <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                    color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                    width: 15%; padding-right: 5px;">
                    方案评估单位
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
                    <span id="FAPGDW">g</span>
                    &nbsp;
                </td>
                <td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small;
                    text-align: right; background-color: #F1F8FF; padding-right: 5px;">
                    方案审查单位
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
                    <span id="FASCDW">r</span>
                    &nbsp;
                </td>
                <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                    color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                    width: 15%; padding-right: 5px;">
                    方案审批时间
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; width: 18%; text-align: left; padding-left: 10px;">
                    <span id="FASPSJ">2014/7/17</span>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small;
                    text-align: right; background-color: #F1F8FF; padding-right: 5px;" class="style9">
                    审批文号
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;" class="style10">
                    <span id="SPWH">20140717</span>
                    &nbsp;
                </td>
                <td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small;
                    text-align: right; background-color: #F1F8FF; padding-right: 5px;" class="style11">
                    投资估算
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;" class="style10">
                    <span id="TZGS">10</span>
                    万元
                </td>
                <td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small;
                    text-align: right; background-color: #F1F8FF; padding-right: 5px;" class="style9">
                    建设性质
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;" class="style12">
                    <span id="JSXZ">中修</span>
                    &nbsp;
                </td>
            </tr>
            <tr style="height: 50px;">
                <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                    color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                    padding-right: 5px;">
                    建设内容
                </td>
                <td colspan="5" style="border-left: 1px solid #C0C0C0; border-right: 1px none #C0C0C0;
                    border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; text-align: left;
                    padding-left: 10px;">
                    <span id="JSNR">中修</span>
                    &nbsp;
                </td>
            </tr>
            <tr style="height: 50px;">
                <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                    color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                    padding-right: 5px;">
                    备&nbsp;&nbsp;&nbsp; 注
                </td>
                <td colspan="5" style="border-left: 1px solid #C0C0C0; border-right: 1px none #C0C0C0;
                    border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; text-align: left;
                    padding-left: 10px;">
                    <span id="SCREMARKS">grr</span>
                    &nbsp;
                </td>
            </tr>
            <tr style="height: 25px;">
                <td colspan="6" style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                    color: #55BEEE; font-weight: bold; font-size: small; text-align: left; background-color: #F1F8FF;
                    width: 15%; padding-left: 10px;">
                    灾害防治建议计划信息
                </td>
            </tr>
            <tr style="height: 30px;">
                <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                    color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                    width: 15%; padding-right: 5px;">
                    上报年份
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
                    <span id="lblJHNF">2014</span>
                    &nbsp;
                </td>
                <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                    color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                    width: 15%; padding-right: 5px;">
                    计划开工时间
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
                    <span id="lblJHKGSJ">2014-07-17</span>
                    &nbsp;
                </td>
                <td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small;
                    text-align: right; background-color: #F1F8FF; padding-right: 5px;">
                    计划完工时间
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0;
                    width: 19%; text-align: left; padding-left: 10px;">
                    <span id="lblJHWGSJ">2015-07-17</span>
                    &nbsp;
                </td>
            </tr>
            <tr style="height: 30px;">
                <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                    color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                    width: 15%; padding-right: 5px;">
                    设计单位
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; width: 18%; text-align: left; padding-left: 10px;">
                    <span id="lblSJDW">hd</span>
                    &nbsp;
                </td>
                <td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small;
                    text-align: right; background-color: #F1F8FF; padding-right: 5px;">
                    &nbsp;
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
                    &nbsp;
                </td>
                <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                    color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                    width: 15%; padding-right: 5px;">
                    &nbsp;&nbsp; &nbsp;
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; width: 18%; text-align: left; padding-left: 10px;">
                    &nbsp; &nbsp;
                </td>
            </tr>
            <tr style="height: 30px;">
                <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                    color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                    width: 15%; padding-right: 5px;">
                    设计批复单位
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
                    <span id="lblSJPFDW">xs</span>
                    &nbsp;
                </td>
                <td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small;
                    text-align: right; background-color: #F1F8FF; padding-right: 5px;">
                    批复文号
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
                    <span id="lblPFWH">20140717</span>
                    &nbsp;
                </td>
                <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                    color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                    width: 15%; padding-right: 5px;">
                    批复时间
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; width: 18%; text-align: left; padding-left: 10px;">
                    <span id="lblPFSJ">2014-07-17</span>
                    &nbsp;
                </td>
            </tr>
            <tr style="height: 30px;">
                <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                    color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                    width: 15%; padding-right: 5px;">
                    批复总投资
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; width: 18%; text-align: left; padding-left: 10px;">
                    <span id="lblJHZTZ">20</span>
                    万元
                </td>
                <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                    color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                    width: 15%; padding-right: 5px;">
                    计划使用部补助金额
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
                    <span id="lblbbz">10</span>
                    万元
                </td>
                <td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small;
                    text-align: right; background-color: #F1F8FF; padding-right: 5px;">
                    计划使用地方自筹资金
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0;
                    width: 19%; text-align: left; padding-left: 10px;">
                    <span id="lblDFZC">10</span>
                    万元
                </td>
            </tr>
            <tr style="height: 30px;">
                <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                    color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                    width: 15%; padding-right: 5px;">
                    是否申请按比例补助
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
                    <span id="lblSFSQABLBZ">否</span>
                    &nbsp;
                </td>
                <td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small;
                    text-align: right; background-color: #F1F8FF; padding-right: 5px;">
                    按比例补助申请文号
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
                    <span id="lblABLBZWH"></span>
                    &nbsp;
                </td>
                <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                    color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                    width: 15%; padding-right: 5px;">
                    &nbsp;
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; width: 18%; text-align: left; padding-left: 10px;">
                    &nbsp;
                </td>
            </tr>
            <tr style="height: 30px;">
                <td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small;
                    text-align: right; background-color: #F1F8FF; padding-right: 5px;">
                    工可报告
                </td>
                <td colspan="5" style="border-left: 1px solid #C0C0C0; border-right: 1px none #C0C0C0;
                    border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; text-align: left;
                    padding-left: 10px;">
                    <span id="lblGKBG_XZ">暂无附件！</span>
                    <a onclick="return CheckFJ(this.innerText);" id="btnGKBG_GK" href="javascript:__doPostBack('btnGKBG_GK','')" style="color:#2C7ED1;"></a>
                </td>
            </tr>
            <tr style="height: 30px;">
                <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                    color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                    width: 15%; padding-right: 5px;">
                    设计施工图
                </td>
                <td colspan="5" style="border-left: 1px solid #C0C0C0; border-right: 1px none #C0C0C0;
                    border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 18%; text-align: left;
                    padding-left: 10px;">
                    <span id="lblSJSGT_XZ">暂无附件！</span>
                    <a onclick="return CheckFJ(this.innerText);" id="btnSJSGT_SG" href="javascript:__doPostBack('btnSJSGT_SG','')" style="color:#2C7ED1;"></a>
                </td>
            </tr>
            <tr style="height: 50px;">
                <td style="color: #007DB3; font-weight: bold; font-size: small; text-align: right;
                    background-color: #F1F8FF; padding-right: 5px;">
                    备&nbsp;&nbsp;&nbsp; 注
                </td>
                <td colspan="5" style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                    text-align: left; padding-left: 10px;">
                    <span id="lblJHRemarks">g</span>&nbsp;
                </td>
            </tr>
            <tr style="height: 25px;">
                <td colspan="6" style="border-style: solid none solid solid; border-width: 1px; border-color: #C0C0C0;
                    color: #55BEEE; font-weight: bold; font-size: small; text-align: left; background-color: #F1F8FF;
                    width: 15%; padding-left: 10px;">
                    灾害防治项目开工信息
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
                    <span id="XDSJ">2014-07-17</span>
                    &nbsp;
                </td>
                <td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small;
                    text-align: right; background-color: #F1F8FF; padding-right: 5px;">
                    实际开工时间
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
                    <span id="SJKGSJ">2014-08-01</span>
                    &nbsp;
                </td>
                <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                    color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                    width: 15%; padding-right: 5px;">
                    预计完工时间
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0;
                    width: 19%; text-align: left; padding-left: 10px;">
                    <span id="YJWGSJ">2014-08-01</span>
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
                    <span id="SGDW">2</span>&nbsp;
                </td>
                <td style="border-bottom: 1px solid #C0C0C0; border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0;
                    border-top: 1px none #C0C0C0; color: #007DB3; font-weight: bold; font-size: small;
                    text-align: right; background-color: #F1F8FF; padding-right: 5px;">
                    监理单位
                </td>
                <td style="border-bottom: 1px solid #C0C0C0; border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0;
                    border-top: 1px none #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
                    <span id="JLDW">22</span>&nbsp;
                </td>
                <td style="border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small;
                    text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
                    建设单位
                </td>
                <td style="border-bottom: 1px solid #C0C0C0; border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                    width: 19%; text-align: left; padding-left: 10px;">
                    <span id="JSDW">222</span>&nbsp;
                </td>
            </tr>
            <tr style="height: 30px;">
                <td style="color: #007DB3; font-weight: bold; font-size: small; text-align: right;
                    background-color: #F1F8FF; width: 15%; padding-right: 5px;">
                    合同金额（万元）
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                    width: 19%; text-align: left; padding-left: 10px;">
                    <span id="HTJE">2</span>&nbsp;
                </td>
                <td style="color: #007DB3; font-weight: bold; font-size: small; text-align: right;
                    background-color: #F1F8FF; width: 15%; padding-right: 5px;">
                    概预算（万元）
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                    width: 19%; text-align: left; padding-left: 10px;">
                    <span id="GYS"></span>&nbsp;
                </td>
                <td style="color: #007DB3; font-weight: bold; font-size: small; text-align: right;
                    background-color: #F1F8FF; width: 15%; padding-right: 5px;">
                    &nbsp;
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; width: 19%;
                    text-align: left; padding-left: 10px;">
                    &nbsp;
                </td>
            </tr>
            <tr style="height: 25px;">
                <td colspan="6" style="border-style: solid none solid solid; border-width: 1px; border-color: #C0C0C0;
                    color: #55BEEE; font-weight: bold; font-size: small; text-align: left; background-color: #F1F8FF;
                    width: 15%; padding-left: 10px;">
                    灾害防治项目进展信息
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
                <td style="color: #007DB3; font-weight: bold; font-size: small; text-align: right;
                    background-color: #F1F8FF; width: 15%; padding-right: 5px;">
                    交工通车文件
                </td>
                <td colspan="5" style="border-left: 1px solid #C0C0C0; border-right: 1px none #C0C0C0;
                    border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 18%; text-align: left;
                    padding-left: 10px;">
                    <div id="div1">
                        <table width="100%" cellpadding="0" cellspacing="0">
                            <tr>
                                <td align="left" nowrap="nowrap" class="style7">
                                    <span id="lblJGTCWJ">暂无附件</span>
                                    <a onclick="return CheckFJ(this.innerText);" id="btnJGTCWJ" href="javascript:__doPostBack('btnJGTCWJ','')" style="color:#2C7ED1;"></a>
                                </td>
                                <td align="left" class="style8">
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