<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>红色旅游开工详情</title>
<link href="${pageContext.request.contextPath}/css/searchAndNavigation.css" type="text/css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/icon.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/YMLib.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/widget/newlhgdialog/lhgcore.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/widget/newlhgdialog/lhgdialog.min.js"></script>
<script type="text/javascript" src="js/hsly.js"></script>
<script type="text/javascript"> 
$(function(){
	var data=parent.obj1;//$("#").text(data.);
	$("#sjwgsj").text(data.sjwgsj);
	$("#xmmc").text(data.xmmc);$("#xzqhdm").text(data.xzqhdm);$("#xzqhmc").text(data.xzqhmc);$("#jhnf").text(data.jhnf);$("#jsgmhj").text(data.jsgmhj);
	$("#jsgmy").text(data.jsgmy);$("#jsgme").text(data.jsgme);$("#jsgms").text(data.jsgms);$("#jsgmf").text(data.jsgmf);$("#jsgmdldq").text(data.jsgmdldq);
	$("#ztz").text(data.ztz);$("#zytz").text(data.zytz);$("#dfta").text(data.dfta);$("#gndk").text(data.gndk);$("#lywz").text(data.lywz);
	$("#jsxz").text(data.jsxz);$("#gkpfwh").text(data.gkpfwh);$("#sgtpfwh").text(data.sgtpfwh);$("#zyjsnr").text(data.zyjsnr);$("#xzscl").text(data.xzscl);
	$("#xdsj").text(data.xdsj);$("#sjkgsj").text(data.sjkgsj);$("#yjwgsj").text(data.yjwgsj);$("#sjwgsj").text(data.sjwgsj);$("#sgdw").text(data.sgdw);
	$("#jldw").text(data.jldw);$("#jsdw").text(data.jsdw);$("#htje").text(data.htje);$("#gsztz").text(data.gsztz);
	var data1="jhid="+data.id;
	jiazai(data1);
});
</script>
<style type="text/css">
a {
	text-decoration: none;
}
</style>
</head>
<body style="margin: 0 0 0 0">
	<div style="text-align: left; font-size: 12px; margin: 0px;">
		
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
                    <span id="xmmc"></span>
                    &nbsp;
                </td>
                <td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small;
                    text-align: right; background-color: #F1F8FF; padding-right: 5px;">
                    行政区划
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
                    <span id="xzqhmc">南昌市</span>
                    &nbsp;
                </td>
                <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                    color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                    width: 15%; padding-right: 5px;">
                    计划年份
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; width: 18%; text-align: left; padding-left: 10px;">
                    <span id="jhnf"></span>
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
                    <span id="jsgmhj"></span>
                    公里
                </td>
                <td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small;
                    text-align: right; background-color: #F1F8FF; padding-right: 5px;">
                    
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
                    <span id="jsgmy"></span>
                    公里
                </td>
                <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                    color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                    padding-right: 5px;">
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;">
                    <span id="jsgme"></span>
                    公里
                </td>
            </tr>
            <tr style="height: 30px;">
                <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                    color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                    padding-right: 5px;">
                    
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;">
                    <span id="jsgms"></span>
                    公里
                </td>
                <td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small;
                    text-align: right; background-color: #F1F8FF; padding-right: 5px;">
                    建设规模(四级公路)
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
                    <span id="jsgmf"></span>
                    公里
                </td>
                <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                    color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                    padding-right: 5px;">
                    建设规模(独立大桥)
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;">
                    <span id="jsgmdldq"></span>
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
                    <span id="ztz"></span>
                    万元
                </td>
                <td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small;
                    text-align: right; background-color: #F1F8FF; padding-right: 5px;">
                    中央投资车购税
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
                    <span id="zytz"></span>
                    万元
                </td>
                <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                    color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                    padding-right: 5px;">
                    地方（企业）自筹
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;">
                    <span id="dfta"></span>
                    万元
                </td>
            </tr>
            <tr style="height: 30px;">
                <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                    color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                    padding-right: 5px;">
                    国内厅贷款
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;">
                    <span id="gndk"></span>
                    万元
                </td>
                <td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small;
                    text-align: right; background-color: #F1F8FF; padding-right: 5px;">
                    利用外资
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
                    <span id="lywz"></span>
                    万元
                </td>
                <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                    color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                    padding-right: 5px;">
                    建设性质
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;">
                    <span id="jsxz"></span>
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
                    <span id="gkpfwh"></span>
                </td>
                <td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small;
                    text-align: right; background-color: #F1F8FF; padding-right: 5px;">
                    初设或施工图批复文号
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
                    <span id="sgtpfwh"></span>
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
                    <span id="zyjsnr"></span>
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
                    <span id="xzscl"></span>
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
                        <span id="xdsj"></span>
                    </td>
                    <td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0;
                        border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small;
                        text-align: right; background-color: #F1F8FF; padding-right: 5px;">
                        实际开工时间
                    </td>
                    <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                        border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
                        <span id="sjkgsj"></span>
                        &nbsp;
                    </td>
                    <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                        color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                        width: 15%; padding-right: 5px;">
                        预计完工时间
                    </td>
                    <td style="border-left: 1px solid #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0;
                        border-bottom: 1px solid #C0C0C0; width: 18%; text-align: left; padding-left: 10px;">
                        <span id="yjwgsj"></span>
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
                        <span id="sgdw"></span>&nbsp;
                    </td>
                    <td style="border-bottom: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; color: #007DB3;
                        font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                        padding-right: 5px;">
                        监理单位
                    </td>
                    <td style="border-bottom: 1px solid #C0C0C0; border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0;
                        border-top: 1px none #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
                        <span id="jldw"></span>
                        &nbsp;
                    </td>
                    <td style="border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small;
                        text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
                        建设单位
                    </td>
                    <td style="border-bottom: 1px solid #C0C0C0; border-left: 1px solid #C0C0C0; border-right: 1px none #C0C0C0;
                        border-top: 1px none #C0C0C0; width: 18%; text-align: left; padding-left: 10px;">
                        <span id="jsdw"></span>
                    </td>
                </tr>
                <tr style="height: 30px;">
                    <td style="color: #007DB3; font-weight: bold; font-size: small; text-align: right;
                        background-color: #F1F8FF; width: 15%; padding-right: 5px;">
                        合同金额（万元）
                    </td>
                    <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                        width: 19%; text-align: left; padding-left: 10px;">
                        <span id="htje"></span>
                    </td>
                    <td style="color: #007DB3; font-weight: bold; font-size: small; text-align: right;
                        background-color: #F1F8FF; width: 15%; padding-right: 5px;">
                        概算总投资（万元）
                    </td>
                    <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                        width: 19%; text-align: left; padding-left: 10px;">
                        <span id="gsztz"></span>
                    </td>
                   <td
					style="color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 16%; padding-right: 5px;">
					实际完工时间</td>
				<td
					style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;  text-align: left; padding-left: 10px;">
					<span id="sjwgsj"></span>&nbsp;</td>
                </tr>
                <tr style="height: 25px;">
                    <td colspan="6" style="border-style: solid none solid solid; border-width: 1px; border-color: #C0C0C0;
                        color: #55BEEE; font-weight: bold; font-size: small; text-align: left; background-color: #F1F8FF;
                        width: 15%; padding-left: 10px;">
                        红色旅游项目进展信息
                    </td>
                </tr>
 			<tr style="height: 30px;">
				<td
					style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;"
					class="style2">施工许可文件</td>
				<td colspan="5"
					style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;"
					class="style3">
					<div id="div1q">
						<table width="100%" cellpadding="0" cellspacing="0">
							<tr>
								<td align="center" nowrap="nowrap" style="width: 50%;"><a
									onclick="downFile('sgxkwj')" id="xz_sgxkwj"
									href="#"
									style="color: #000000;cursor:default">暂无附件</a></td>
								
							</tr>
						</table>
					</div>
				</td>
			</tr>
			<tr style="height: 30px;">
				<td
					style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;"
					class="style2">交工通车文件</td>
				<td colspan="5"
					style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;"
					class="style3">
					<div id="div1">
						<table width="100%" cellpadding="0" cellspacing="0">
							<tr>
								<td align="center" nowrap="nowrap" style="width: 50%;"><a
									onclick="downFile('jgtcwj')" id="xz_jgtcwj"
									href="#"
									style="color: #000000;cursor:default">暂无附件</a></td>
								
							</tr>
						</table>
					</div>
				</td>
			</tr>
			<tr style="height: 30px;">
				<td
					style="color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;"
					class="style2">完工验收文件</td>
				<td colspan="5"
					style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; text-align: left; padding-left: 10px;"
					class="style3">
					<div id="div3">
						<table width="100%" cellpadding="0" cellspacing="0">
							<tr>
								<td align="center" nowrap="nowrap" style="width: 50%;"><a
									onclick="downFile('jgyswj')" id="xz_jgyswj"
									href="#"
									style="color: #000000;cursor:default">暂无附件</a></td>
							
							</tr>
						</table>
					</div>
				</td>
			</tr>
			</tbody>
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