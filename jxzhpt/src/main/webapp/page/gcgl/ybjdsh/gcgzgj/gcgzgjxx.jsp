<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>工程改造路面改建开工详情</title>
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
<script type="text/javascript" src="js/gcgzgj.js"></script>
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
					工程改造路面改建项目计划详情</td>
			</tr>
		</table>
		<table width="97%" border="0" style="border-style: solid; border-width: 3px 1px 1px 1px;
            border-color: #55BEEE #C0C0C0 #C0C0C0 #C0C0C0; margin-left: 13px; height: 45px;"
            cellspacing="0" cellpadding="0">
            <tr style="height: 25px;">
                <td colspan="6" style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                    color: #55BEEE; font-weight: bold; font-size: small; text-align: left; background-color: #F1F8FF;
                    width: 15%; padding-left: 10px;">
                    <span id="labname3">工程改造路面改建项目基本信息</span>
                </td>
            </tr>
            <tr style="height: 30px;">
                <td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small;
                    text-align: right; background-color: #F1F8FF; padding-right: 5px;">
                    路线名称
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
                    <span id="Lab_LXMC">万安大坝至武术</span>
                </td>
                <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                    color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                    width: 15%; padding-right: 5px;">
                    路线编码
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
                    <span id="Lab_LXBM">Y852360828</span>
                </td>
                <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                    color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                    width: 15%; padding-right: 5px;">
                    建设地点
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0;
                    width: 19%; text-align: left; padding-left: 10px;">
                    <span id="Lab_JSDD">测试</span>
                </td>
            </tr>
            <tr style="height: 30px;">
                <td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small;
                    text-align: right; background-color: #F1F8FF; padding-right: 5px;">
                    起点桩号
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
                    <span id="Lab_QDZH">1.545</span>
                </td>
                <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                    color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                    width: 15%; padding-right: 5px;">
                    止点桩号
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
                    <span id="Lab_ZDZH">44</span>
                </td>
                <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                    color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                    width: 15%; padding-right: 5px;">
                    起止里程
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0;
                    width: 18%; text-align: left; padding-left: 10px;">
                    <span id="Lab_QZLC">42.455</span>（公里）
                </td>
            </tr>
            <tr style="height: 30px;">
                <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                    color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                    width: 15%; padding-right: 5px;">
                    管养单位
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; width: 18%; text-align: left; padding-left: 10px;">
                    <span id="Lab_GYDW">吉安市万安县交通局</span>
                </td>
                <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                    color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                    width: 15%; padding-right: 5px;">
                    行政区划代码
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
                    <span id="Lab_XZQHDM">360828</span>
                </td>
                <td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small;
                    text-align: right; background-color: #F1F8FF; padding-right: 5px;">
                    行政区划
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0;
                    width: 19%; text-align: left; padding-left: 10px;">
                    <span id="Lab_XZQH">吉安市万安县</span>
                </td>
            </tr>
            <tr style="height: 30px;">
                <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                    color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                    width: 15%; padding-right: 5px;">
                    原技术等级
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
                    <span id="Lab_YJSDJ">四级公路</span>&nbsp;
                </td>
                <td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small;
                    text-align: right; background-color: #F1F8FF; padding-right: 5px;">
                    原路面类型
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
                    <span id="Lab_YLMLX">1</span>&nbsp;
                </td>
                <td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small;
                    text-align: right; background-color: #F1F8FF; padding-right: 5px;">
                    隐患里程
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0;
                    width: 19%; text-align: left; padding-left: 10px;">
                    <span id="Lab_LC">10</span>公里
                </td>
            </tr>
            <tr style="height: 50px;">
                <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                    color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                    padding-right: 5px;">
                    病害内容
                </td>
                <td colspan="5" style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;">
                    <span id="Lab_BHNR">大修</span>
                </td>
            </tr>
            <tr>
                <td style="color: #007DB3; font-weight: bold; font-size: small; text-align: right;
                    background-color: #F1F8FF; border-bottom: 1px solid #C0C0C0; padding-right: 5px;"
                    class="style12">
                    备&nbsp;&nbsp;&nbsp; 注
                </td>
                <td colspan="5" style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                    text-align: left; padding-left: 10px; border-bottom: 1px solid #C0C0C0;" class="style12">
                    <span id="Lab_BZ">否</span>
                </td>
            </tr>
            <tr style="height: 25px;">
                <td colspan="6" style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                    color: #55BEEE; font-weight: bold; font-size: small; text-align: left; background-color: #F1F8FF;
                    width: 15%; padding-left: 10px;">
                    <span id="labname4">工程改造路面改建项目审查信息</span>
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
                    <span id="Lab_FZPGDW">hd</span>
                </td>
                <td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small;
                    text-align: right; background-color: #F1F8FF; padding-right: 5px;">
                    方案审查单位
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
                    <span id="Lab_FASCDW">sx</span>
                </td>
                <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                    color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                    width: 15%; padding-right: 5px;">
                    方案审批时间
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0;
                    width: 18%; text-align: left; padding-left: 10px;">
                    <span id="Lab_FASPSJ">2014/7/18</span>
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
                    <span id="Lab_SPWH">20140718</span>
                </td>
                <td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small;
                    text-align: right; background-color: #F1F8FF; padding-right: 5px;" class="style11">
                    投资估算
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;" class="style10">
                    <span id="Lab_TZGS">5</span>
                    万元
                </td>
                <td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small;
                    text-align: right; background-color: #F1F8FF; padding-right: 5px;" class="style9">
                    建设性质
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0;
                    text-align: left; padding-left: 10px;" class="style10">
                    <span id="Lab_JSXZ">路面改造工程项目</span>
                </td>
            </tr>
            <tr style="height: 50px;">
                <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                    color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                    padding-right: 5px;">
                    建设内容
                </td>
                <td colspan="5" style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;">
                    <span id="Lab_JSNR">大修</span>
                </td>
            </tr>
            <tr style="height: 50px;">
                <td style="color: #007DB3; font-weight: bold; font-size: small; text-align: right;
                    border-bottom: 1px solid #C0C0C0; background-color: #F1F8FF; padding-right: 5px;">
                    备&nbsp;&nbsp;&nbsp; 注
                </td>
                <td colspan="5" style="border-left: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0;
                    border-top: 1px none #C0C0C0; text-align: left; padding-left: 10px;">
                    <span id="Lab_BZTWO">否</span>
                </td>
            </tr>
            <tr style="height: 25px;">
                <td colspan="6" style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                    color: #55BEEE; font-weight: bold; font-size: small; text-align: left; background-color: #F1F8FF;
                    width: 15%; padding-left: 10px;">
                    <span id="labname5"> 工程改造路面改建项目计划信息</span>
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
                    <span id="lblJHKGSJ">2014/1/30</span>
                    &nbsp;
                </td>
                <td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small;
                    text-align: right; background-color: #F1F8FF; padding-right: 5px;">
                    计划完工时间
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0;
                    width: 19%; text-align: left; padding-left: 10px;">
                    <span id="lblJHWGSJ">2014/10/1</span>
                    &nbsp;
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
                    <span id="lblXMMC">201407181</span>
                    &nbsp;
                </td>
                <td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small;
                    text-align: right; background-color: #F1F8FF; padding-right: 5px;">
                    路面宽度
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
                    <span id="lblLMKD">20</span>米 &nbsp;
                </td>
                <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                    color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                    width: 15%; padding-right: 5px;">
                    是否提前实施
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0;
                    width: 19%; text-align: left; padding-left: 10px;">
                    <span id="lblSFTQSS">否</span>
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
                    <span id="lblSJDW">d</span>
                    &nbsp;
                </td>
                <td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small;
                    text-align: right; background-color: #F1F8FF; padding-right: 5px;">
                    养护类别
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
                    <span id="lblYHLB">大修</span>&nbsp;
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
                <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                    color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                    width: 15%; padding-right: 5px;">
                    垫层
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; width: 18%; text-align: left; padding-left: 10px;">
                    <span id="lblDC">1</span>m³
                </td>
                <td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small;
                    text-align: right; background-color: #F1F8FF; padding-right: 5px;">
                    基层
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
                    <span id="lblJC">1</span>m³
                </td>
                <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                    color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                    width: 15%; padding-right: 5px;">
                    面层
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; width: 18%; text-align: left; padding-left: 10px;">
                    <span id="lblMC">1</span>km
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
                    <span id="lblSJPFDW">hd</span>
                    &nbsp;
                </td>
                <td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small;
                    text-align: right; background-color: #F1F8FF; padding-right: 5px;">
                    批复文号
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
                    <span id="lblPFWH">2014hd</span>
                    &nbsp;
                </td>
                <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                    color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                    width: 15%; padding-right: 5px;">
                    批复时间
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; width: 18%; text-align: left; padding-left: 10px;">
                    <span id="lblPFSJ">2014/7/20</span>
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
                    <span id="lblJHZTZ">2</span>
                    万元
                </td>
                <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                    color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                    width: 15%; padding-right: 5px;">
                    计划使用部补助金额
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
                    <span id="lblbbz">1</span>
                    万元
                </td>
                <td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small;
                    text-align: right; background-color: #F1F8FF; padding-right: 5px;">
                    计划使用省补助资金
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0;
                    width: 19%; text-align: left; padding-left: 10px;">
                    <span id="lblDFZC">1</span>
                    万元
                </td>
            </tr>
            <tr style="height: 30px;">
                <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                    color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                    width: 15%; padding-right: 5px;">
                    设计路面类型
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
                    <span id="lblSJLMLX">垫层</span>
                    &nbsp;
                </td>
                <td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small;
                    text-align: right; background-color: #F1F8FF; padding-right: 5px;">
                    是否申请按比例补助
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
                    <span id="lblSFSQABLBZ">否</span>
                    &nbsp;
                </td>
                <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                    color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                    width: 15%; padding-right: 5px;">
                    按比例补助申请文号
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; width: 18%; text-align: left; padding-left: 10px;">
                    <span id="lblABLBZWH"></span>&nbsp;
                </td>
            </tr>
            <tr style="height: 30px;">
                <td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small;
                    text-align: right; background-color: #F1F8FF; padding-right: 5px;">
                    是否归口市局养护部门
                </td>
                <td colspan="5" style="border-left: 1px solid #C0C0C0; border-right: 1px none #C0C0C0;
                    border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; text-align: left;
                    padding-left: 10px;">
                    <span id="lblSFGYHBM">是</span>&nbsp;
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
                    <span id="lblJHRemarks">否</span>&nbsp;
                </td>
            </tr>
            <tr style="height: 25px;">
                <td colspan="6" style="border-style: solid none solid solid; border-width: 1px; border-color: #C0C0C0;
                    color: #55BEEE; font-weight: bold; font-size: small; text-align: left; background-color: #F1F8FF;
                    width: 15%; padding-left: 10px;">
                    <span id="labname6">工程改造路面改建项目开工信息</span>
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
                    <span id="XDSJ">2014/9/12</span>
                    &nbsp;
                </td>
                <td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small;
                    text-align: right; background-color: #F1F8FF; padding-right: 5px;">
                    实际开工时间
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
                    <span id="SJKGSJ">2014/9/12</span>
                    &nbsp;
                </td>
                <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                    color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                    width: 15%; padding-right: 5px;">
                    预计完工时间
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0;
                    width: 19%; text-align: left; padding-left: 10px;">
                    <span id="YJWGSJ">2014/9/12</span>
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
                    <span id="SGDW">施工单位</span>
                </td>
                <td style="border-bottom: 1px solid #C0C0C0; border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0;
                    border-top: 1px none #C0C0C0; color: #007DB3; font-weight: bold; font-size: small;
                    text-align: right; background-color: #F1F8FF; padding-right: 5px;">
                    监理单位
                </td>
                <td style="border-bottom: 1px solid #C0C0C0; border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0;
                    border-top: 1px none #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
                    <span id="JLDW">监理单位</span>
                </td>
                <td style="border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small;
                    text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
                    建设单位
                </td>
                <td style="border-bottom: 1px solid #C0C0C0; border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                    width: 19%; text-align: left; padding-left: 10px;">
                    <span id="JSDW">建设单位</span>
                </td>
            </tr>
            <tr style="height: 30px;">
                <td style="color: #007DB3; font-weight: bold; font-size: small; text-align: right;
                    background-color: #F1F8FF; width: 15%; padding-right: 5px;">
                    合同金额（万元）
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                    width: 19%; text-align: left; padding-left: 10px;">
                    <span id="HTJE">123</span>
                </td>
                 <td style="color: #007DB3; font-weight: bold; font-size: small; text-align: right;
                    background-color: #F1F8FF; width: 15%; padding-right: 5px;">
                    概算总投资（万元）
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                    width: 19%; text-align: left; padding-left: 10px;">
                    <span id="GSZTZ"></span>
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
                    <span id="labname7">工程改造路面改建项目进展信息</span>
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
                    完工验收文件
                </td>
                <td colspan="5" style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                    width: 18%; text-align: left; padding-left: 10px;">
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