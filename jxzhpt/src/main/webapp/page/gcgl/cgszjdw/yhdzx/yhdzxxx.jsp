<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>养护大中修开工详情</title>
<link
	href="${pageContext.request.contextPath}/css/searchAndNavigation.css"
	type="text/css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/easyui/themes/icon.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/easyui/jquery-1.9.1.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/easyui/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="js/yhdzx.js"></script>
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
				<td height="25" align="left"
					background="${pageContext.request.contextPath}/images/dht_bg.jpg"
					style="padding-left: 25px; background-repeat: no-repeat; font-size: 12px;">
					<a style="color: #1a5780" href="#">工程管理</a> &nbsp;>&nbsp; <a
					style="color: #1a5780" href="#">项目进度管理</a> <font
					style="color: #5C5C5C;">&nbsp;>&nbsp;养护大中修施工过程详细信息</font>
				</td>
			</tr>
			<tr>
				<td height="45" align="left" background="${pageContext.request.contextPath}/images/jt.jpg"
					style="padding-left: 15px; font-size: 14px; color: #007DB2; font-weight: bold; background-repeat: no-repeat; background-position: left center; background-repeat: no-repeat;">
					养护大中修项目计划详情
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
                    养护大中修项目计划信息
                </td>
            </tr>
            <tr style="height: 30px;">
                <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                    color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                    width: 15%; padding-right: 5px;">
                    上报年份
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
                    <span id="lblYear">2014</span>
                </td>
                <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                    color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                    width: 15%; padding-right: 5px;">
                    路线名称
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
                    <span id="lblLXMC">北京-珠海</span>
                </td>
                <td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small;
                    text-align: right; background-color: #F1F8FF; padding-right: 5px;">
                    路线编码
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0;
                    width: 19%; text-align: left; padding-left: 10px;">
                    <span id="lblLXBM">G105</span>
                </td>
            </tr>
            <tr style="height: 30px;">
                <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                    color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                    width: 15%; padding-right: 5px;">
                    管养单位名称
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; width: 18%; text-align: left; padding-left: 10px;">
                    <span id="lblGYDWMC">南昌市公路管理局安义分局</span>
                </td>
                <td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small;
                    text-align: right; background-color: #F1F8FF; padding-right: 5px;">
                    起点桩号
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
                    <span id="lblQDZH">1660.430</span>
                </td>
                <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                    color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                    width: 15%; padding-right: 5px;">
                    止点桩号
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; width: 18%; text-align: left; padding-left: 10px;">
                    <span id="lblZDZH">1672.181</span>
                </td>
            </tr>
            <tr style="height: 30px;">
                <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                    color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                    width: 15%; padding-right: 5px;">
                    里程
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
                    <span id="lblLC">11.751</span>公里
                </td>
                <td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small;
                    text-align: right; background-color: #F1F8FF; padding-right: 5px;">
                    核对后里程
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
                    <span id="lblHDLC">11.751</span>公里
                </td>
                <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                    color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                    width: 15%; padding-right: 5px;">
                    行政区划名称
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; width: 18%; text-align: left; padding-left: 10px;">
                    <span id="lblXZQHMC">南昌市安义县</span>
                </td>
            </tr>
            <tr style="height: 30px;">
                <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                    color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                    width: 15%; padding-right: 5px;">
                    技术等级
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; width: 18%; text-align: left; padding-left: 10px;">
                    <span id="lblJSDJ">一级公路</span>
                </td>
                <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                    color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                    width: 15%; padding-right: 5px;">
                    特殊地区
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
                    <span id="lblTSDQ">罗霄山山脉</span>
                </td>
                <td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small;
                    text-align: right; background-color: #F1F8FF; padding-right: 5px;">
                    原路面宽度
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0;
                    width: 19%; text-align: left; padding-left: 10px;">
                    <span id="lblYLMKD">9.00</span>
                </td>
            </tr>
            <tr style="height: 30px;">
                <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                    color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                    width: 15%; padding-right: 5px;">
                    原路面类型
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
                    <span id="lblYLMLX">沥青混凝土</span>
                </td>
                <td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small;
                    text-align: right; background-color: #F1F8FF; padding-right: 5px;">
                    工程分类
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
                    <span id="lblGCFL">大修</span>
                </td>
                <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                    color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                    width: 15%; padding-right: 5px;">
                    上报经费
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; width: 18%; text-align: left; padding-left: 10px;">
                    <span id="lblSBJF">1935.97</span>万元
                </td>
            </tr>
            <tr style="height: 30px;">
                <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                    color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                    width: 15%; padding-right: 5px;">
                    核算经费
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
                    <span id="lblHSJF">1491.20</span>万元
                </td>
                <td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small;
                    text-align: right; background-color: #F1F8FF; padding-right: 5px;">
                    审定经费
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
                    <span id="lblSDJF">1000.00</span>万元
                </td>
                <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                    color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                    width: 15%; padding-right: 5px;">
                    总投资
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; width: 18%; text-align: left; padding-left: 10px;">
                    <span id="lblZTZ">1935.977</span>万元
                </td>
            </tr>
            <tr style="height: 30px;">
                <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                    color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                    width: 15%; padding-right: 5px;">
                    地方配套总投资
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
                    <span id="lblDFPTZTZ">444.775</span>万元
                </td>
                <td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small;
                    text-align: right; background-color: #F1F8FF; padding-right: 5px;">
                    总补助资金
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
                    <span id="lblZBZZJ">1000.000</span>万元
                </td>
                <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                    color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                    width: 15%; padding-right: 5px;">
                    累计补助资金
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; width: 18%; text-align: left; padding-left: 10px;">
                    <span id="lblLJBZZJ">750.000</span>万元
                </td>
            </tr>
            <tr style="height: 30px;">
                <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                    color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                    width: 15%; padding-right: 5px;">
                    本年补助资金
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
                    <span id="lblBNBZZJ">250.000</span>万元
                </td>
                <td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small;
                    text-align: right; background-color: #F1F8FF; padding-right: 5px;">
                    垫层
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
                    <span id="lblDC">100</span>
                </td>
                <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                    color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                    width: 15%; padding-right: 5px;">
                    基层
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; width: 18%; text-align: left; padding-left: 10px;">
                    <span id="lblJC">100</span>
                </td>
            </tr>
            <tr style="height: 30px;">
                <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                    color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                    width: 15%; padding-right: 5px;">
                    面层
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
                    <span id="lblMC">100</span>
                </td>
                <td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small;
                    text-align: right; background-color: #F1F8FF; padding-right: 5px;">
                    续建表示
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
                    <span id="lblXJBS">否</span>
                </td>
                <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                    color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                    width: 15%; padding-right: 5px;">
                    PQI指标
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; width: 18%; text-align: left; padding-left: 10px;">
                    <span id="lblPQI"><a href='#' onclick="openDeatis()" >良</a></span>
                </td>
            </tr>
            <tr style="height: 30px;">
                <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                    color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                    width: 15%; padding-right: 5px;">
                    历史对比
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
                    <span id="lblLSDB"><a href='###' onclick='openshuihui(1661.700,1680.700,2013,1)' style='cursor:help;'  title='点击查看2013年水毁灾害路面重建[1661.700-1672.181];'>2013年水毁灾害路面重建[1661.700-1672.181];</a></span>
                </td>
                <td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small;
                    text-align: right; background-color: #F1F8FF; padding-right: 5px;">
                    交通量
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
                    <span id="lblJTL"><a href='###' onclick="openAADTDetails()" style='cursor:help;' title='点击查看' >400</a></span>
                </td>
                <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                    color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                    width: 15%; padding-right: 5px;">
                    施工图文号
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; width: 18%; text-align: left; padding-left: 10px;">
                    <span id="lblSGTWH">100</span>
                </td>
            </tr>
            <tr style="height: 30px;">
                <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                    color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                    width: 15%; padding-right: 5px;">
                    工可批复文号
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
                    <span id="lblGKPFWH">100</span>
                </td>
                <td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small;
                    text-align: right; background-color: #F1F8FF; padding-right: 5px;">
                    设计批复文号
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
                    <span id="lblSJPFWH">100</span>
                </td>
                <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                    color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                    width: 15%; padding-right: 5px;">
                    计划下达文号
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; width: 18%; text-align: left; padding-left: 10px;">
                    <span id="lblJHXDWH"></span>
                </td>
            </tr>
            <tr style="height: 30px;">
                <td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small;
                    text-align: right; background-color: #F1F8FF; padding-right: 5px;">
                    原路面厚度
                </td>
                <td colspan="5" style="border-left: 1px solid #C0C0C0; border-right: 1px none #C0C0C0;
                    border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; text-align: left;
                    padding-left: 10px;">
                    <span id="lblYLMHD">沥青混凝土/3cm + 石灰稳定粒料/10-15cm</span>
                </td>
            </tr>
            <tr style="height: 30px;">
                <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                    color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                    width: 15%; padding-right: 5px;">
                    技术处置描述
                </td>
                <td colspan="5" style="border-left: 1px solid #C0C0C0; border-right: 1px none #C0C0C0;
                    border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 18%; text-align: left;
                    padding-left: 10px;">
                    <span id="lblJSCZMS">AC-16沥青混凝土+混泥土垫层</span>
                </td>
            </tr>
            <tr style="height: 30px;">
                <td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small;
                    text-align: right; background-color: #F1F8FF; padding-right: 5px;">
                    现场核实情况
                </td>
                <td colspan="5" style="border-left: 1px solid #C0C0C0; border-right: 1px none #C0C0C0;
                    border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; text-align: left;
                    padding-left: 10px;">
                    <span id="lblXCHSQK"></span>
                </td>
            </tr>
            <tr style="height: 50px;">
                <td style="color: #007DB3; font-weight: bold; font-size: small; text-align: right;
                    border-bottom: 1px solid #C0C0C0; background-color: #F1F8FF; padding-right: 5px;">
                    省统筹备注
                </td>
                <td colspan="5" style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;">
                    <span id="lblSTCBZ">第二批</span>
                </td>
            </tr>
            <tr style="height: 50px;">
                <td style="color: #007DB3; font-weight: bold; font-size: small; text-align: right;
                    border-bottom: 1px solid #C0C0C0; background-color: #F1F8FF; padding-right: 5px;">
                    其它备注
                </td>
                <td colspan="5" style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;">
                    <span id="lblQTBZ"></span>
                </td>
            </tr>
            <tr style="height: 25px;">
                <td colspan="6" style="border-style: solid none solid solid; border-width: 1px; border-color: #C0C0C0;
                    color: #55BEEE; font-weight: bold; font-size: small; text-align: left; background-color: #F1F8FF;
                    width: 15%; padding-left: 10px;">
                    养护大中修项目开工信息
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
                    <span id="XDSJ">2014/9/4</span>
                </td>
                <td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small;
                    text-align: right; background-color: #F1F8FF; padding-right: 5px;">
                    实际开工时间
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
                    <span id="SJKGSJ">2014/9/12</span>
                </td>
                <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                    color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                    width: 15%; padding-right: 5px;">
                    预计完工时间
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0;
                    width: 18%; text-align: left; padding-left: 10px;">
                    <span id="YJWGSJ">2014/9/12</span>
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
                    width: 18%; text-align: left; padding-left: 10px;">
                    <span id="JSDW">建设单位</span>&nbsp;
                </td>
            </tr>
            <tr style="height: 30px;">
                <td style="color: #007DB3; font-weight: bold; font-size: small; text-align: right;
                    background-color: #F1F8FF; width: 15%; padding-right: 5px;">
                    合同金额（万元）
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                    width: 19%; text-align: left; padding-left: 10px;">
                    <span id="HTJE">123</span>&nbsp;
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
                <td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; width: 18%;
                    text-align: left; padding-left: 10px;">
                    &nbsp;
                </td>
            </tr>
            <tr style="height: 25px;">
                <td colspan="6" style="border-style: solid none solid solid; border-width: 1px; border-color: #C0C0C0;
                    color: #55BEEE; font-weight: bold; font-size: small; text-align: left; background-color: #F1F8FF;
                    width: 15%; padding-left: 10px;">
                    养护大中修项目进展信息
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
					onclick="RetAck()" /></td>
			</tr>
		</table>
		<br />
	</div>
</body>
</html>