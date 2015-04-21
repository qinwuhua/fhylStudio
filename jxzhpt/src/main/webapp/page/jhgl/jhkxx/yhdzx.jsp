<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>养护大中修详细</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/Top.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/icon.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/util/jquery.cookie.js"></script>
</head>
<body>
	<div id="yhdzx_xx" style="text-align: left;font-size: 12px;width:100%;">
		<table width="97%" border="0" style="border-style: solid;border-width: 3px 1px 1px 1px; border-color: #55BEEE #C0C0C0 #C0C0C0 #C0C0C0;margin-left: 13px; height: 45px;"cellspacing="0" cellpadding="0">
			<tr style="height: 25px;">
            	<td colspan="6" style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #55BEEE; font-weight: bold; font-size: small; text-align: left; background-color: #F1F8FF; width: 15%; padding-left: 10px;">
                	养护大中修项目路线信息
                	<input id="jhid" type="hidden"/>
                </td>
            </tr>
			<tr style="height: 30px;">
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					技术等级
				</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 18%; text-align: left; padding-left: 10px;">
					<span id="lblJSDJ"></span>
				</td>
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					原路面类型
				</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<span id="lblYLMLX"></span>
				</td>
				<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					原路面宽度
				</td>
				<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<span id="lblYLMKD">0</span>
				</td>
			</tr>
			<tr style="height: 30px;">
				<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					原路面厚度
				</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<span id="lblYLMHD"></span>
				</td>
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					特殊地区
				</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<span id="lblTSDQ">罗霄山山脉</span>
				</td>
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;"></td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;"></td>
			</tr>
			<tr style="height: 30px;">
				<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					病害内容
				</td>
				<td colspan="5" style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<span id="lblBHNR"></span>
				</td>
			</tr>
            <tr id="tr_scxx" style="height: 25px;">
            	<td colspan="6" style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #55BEEE; font-weight: bold; font-size: small; text-align: left; background-color: #F1F8FF; width: 15%; padding-left: 10px;">
                	养护大中修项目计划信息
                </td>
            </tr>
            <tr style="height: 30px;">
            	<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					上报年份
				</td>
				<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<span id="lblYear"></span>
				</td>
				<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					工程分类
				</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<span id="lblGCFL"></span>
				</td>
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					计划开工时间</td>
				<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<span id="lbljhkgsj"></span>
				</td>
            </tr>
            <tr style="height: 30px;">
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					计划完工时间</td>
				<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<span id="lbljhwgsj"></span>
				</td>
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					计划下达时间</td>
				<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<span id="lbljhxdsj"></span>
				</td>
				<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					垫层</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<span id="lblDC">0</span>
				</td>
            </tr>
            <tr style="height: 30px;">
            	<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					基层</td>
				<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<span id="lblJC">0</span>
				</td>
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					面层</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<span id="lblMC">0</span>
				</td>
				<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					续建表示</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<span id="lblXJBS"></span>
				</td>
            </tr>
            <tr style="height: 30px;">
            	<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					路面结构
				</td>
				<td colspan="5" style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<table style="margin-top: 5px;margin-bottom: 5px;">
						<tr align="center">
							<td width="80" style="border: 1px solid #C0C0C0;">
								<input id="ljkdzj" type="checkbox"/> 路基宽度增加0.5m
							</td>
							<td width="100" style="border: 1px solid #C0C0C0;">材料</td>
							<td width="60" style="border: 1px solid #C0C0C0;">厚度(cm)</td>
							<td style="border: 1px solid #C0C0C0;">单价(元/m³)</td>
							<td name="sdtd" style="border: 1px solid #C0C0C0;">审定单价(元/m³)</td>
						</tr>
						<tr>
							<td align="center" style="border: 1px solid #C0C0C0;">上面层</td>
							<td align="center" style="border: 1px solid #C0C0C0;">
								<select id="selsmc" class="easyui-combobox" style="width:125px;"></select>
							</td>
							<td align="center" style="border: 1px solid #C0C0C0;">
								<span id="txtsmchd">0</span>
							</td>
							<td align="center" style="border: 1px solid #C0C0C0;">
								<span id="txtsmcdj"></span>
							</td>
							<td align="center" style="border: 1px solid #C0C0C0;">
								<span id="txtsmcsddj" name="sdtd"></span>
							</td>
						</tr>
						<tr>
							<td align="center" style="border: 1px solid #C0C0C0;">中面层</td>
							<td align="center" style="border: 1px solid #C0C0C0;">
								<select id="selzmc" class="easyui-combobox" style="width:125px;"></select>
							</td>
							<td align="center" style="border: 1px solid #C0C0C0;">
								<span id="txtzmchd">0</span>
							</td>
							<td align="center" style="border: 1px solid #C0C0C0;">
								<span id="txtzmcdj"></span>
							</td>
							<td align="center" style="border: 1px solid #C0C0C0;">
								<span id="txtzmcsddj" name="sdtd"></span>
							</td>
						</tr>
						<tr>
							<td align="center" style="border: 1px solid #C0C0C0;">下面层</td>
							<td align="center" style="border: 1px solid #C0C0C0;">
								<select id="selxmc" class="easyui-combobox" style="width:125px;"></select>
							</td>
							<td align="center" style="border: 1px solid #C0C0C0;">
								<span id="txtxmchd">0</span>
							</td>
							<td align="center" style="border: 1px solid #C0C0C0;">
								<span id="txtxmcdj"></span>
							</td>
							<td align="center" style="border: 1px solid #C0C0C0;">
								<span id="txtxmcsddj" name="sdtd"></span>
							</td>
						</tr>
						<tr>
							<td align="center" style="border: 1px solid #C0C0C0;">封层</td>
							<td align="center" style="border: 1px solid #C0C0C0;">
								<select id="selfc" class="easyui-combobox" style="width:125px;"></select>
							</td>
							<td align="center" style="border: 1px solid #C0C0C0;">
								<span id="txtfchd">0</span>
							</td>
							<td align="center" style="border: 1px solid #C0C0C0;">
								<span id="txtfcdj"></span>
							</td>
							<td align="center" style="border: 1px solid #C0C0C0;">
								<span id="txtfcsddj" name="sdtd"></span>
							</td>
						</tr>
						<tr>
							<td align="center" style="border: 1px solid #C0C0C0;">上基层</td>
							<td align="center" style="border: 1px solid #C0C0C0;">
								<select id="selsjc" class="easyui-combobox" style="width:125px;"></select>
							</td>
							<td align="center" style="border: 1px solid #C0C0C0;">
								<span id="txtsjchd">0</span>
							</td>
							<td align="center" style="border: 1px solid #C0C0C0;">
								<span id="txtsjcdj"></span>
							</td>
							<td align="center" style="border: 1px solid #C0C0C0;">
								<span id="txtsjcsddj" name="sdtd"></span>
							</td>
						</tr>
						<tr>
							<td align="center" style="border: 1px solid #C0C0C0;">中基层</td>
							<td align="center" style="border: 1px solid #C0C0C0;">
								<select id="selzjc" class="easyui-combobox" style="width:125px;"></select>
							</td>
							<td align="center" style="border: 1px solid #C0C0C0;">
								<span id="txtzjchd">0</span>
							</td>
							<td align="center" style="border: 1px solid #C0C0C0;">
								<span id="txtzjcdj"></span>
							</td>
							<td align="center" style="border: 1px solid #C0C0C0;">
								<span id="txtzjcsddj" name="sdtd"></span>
							</td>
						</tr>
						<tr>
							<td align="center" style="border: 1px solid #C0C0C0;">下基层</td>
							<td align="center" style="border: 1px solid #C0C0C0;">
								<select id="selxjc" class="easyui-combobox" style="width:125px;"></select>
							</td>
							<td align="center" style="border: 1px solid #C0C0C0;">
								<span id="txtxjchd">0</span>
							</td>
							<td align="center" style="border: 1px solid #C0C0C0;">
								<span id="txtxjcdj"></span>
							</td>
							<td align="center" style="border: 1px solid #C0C0C0;">
								<span id="txtxjcsddj" name="sdtd"></span>
							</td>
						</tr>
						<tr>
							<td align="center" style="border: 1px solid #C0C0C0;">垫层</td>
							<td align="center" style="border: 1px solid #C0C0C0;">
								<select id="seldc" class="easyui-combobox" style="width:125px;"></select>
							</td>
							<td align="center" style="border: 1px solid #C0C0C0;">
								<span id="txtdchd">0</span>
							</td>
							<td align="center" style="border: 1px solid #C0C0C0;">
								<span id="txtdcdj"></span>
							</td>
							<td align="center" style="border: 1px solid #C0C0C0;">
								<span id="txtdcsddj" name="sdtd"></span>
							</td>
						</tr>
						<tr>
							<td align="center" style="border: 1px solid #C0C0C0;">原路</td>
							<td align="center" style="border: 1px solid #C0C0C0;">
								<select id="selyl" class="easyui-combobox" style="width:125px;"></select>
							</td>
							<td align="center" style="border: 1px solid #C0C0C0;">
								<span id="txtylhd">0</span>
							</td>
							<td align="center" style="border: 1px solid #C0C0C0;">
								<span id="txtyldj"></span>
							</td>
							<td align="center" style="border: 1px solid #C0C0C0;">
								<span id="txtylsddj" name="sdtd"></span>
							</td>
						</tr>
					</table>
				</td>
            </tr>
            <tr style="height: 30px;">
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					按延米</td>
				<td colspan="5" style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<table id="ymtab" style="border: 1px solid #C0C0C0;margin-top: 5px;margin-bottom: 5px;">
						<tr align="center" id="ymtr">
							<td width="200" height="30" style="border: 1px solid #C0C0C0;">项目：如路肩、标线等</td>
							<td width="120" height="30" style="border: 1px solid #C0C0C0;">说明</td>
							<td width="60" height="30" style="border: 1px solid #C0C0C0;">长度(m)</td>
							<td width="100" height="30" style="border: 1px solid #C0C0C0;">单价(元/m)</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr style="height: 30px;">
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					按数量</td>
				<td colspan="5" id="sltab" style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<table style="border: 1px solid #C0C0C0;margin-top: 5px;margin-bottom: 5px;">
						<tr align="center" id="asltr">
							<td width="200" height="30" style="border: 1px solid #C0C0C0;">项目：如边坡、挡土墙等</td>
							<td width="120" height="30" style="border: 1px solid #C0C0C0;">说明</td>
							<td width="60" height="30" style="border: 1px solid #C0C0C0;">数量(m、m²、m³)</td>
							<td width="100" height="30" style="border: 1px solid #C0C0C0;">单价(元/m、m²、m³)</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					管理费</td>
				<td colspan="5" style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<table style="border: 1px solid #C0C0C0;margin-top: 5px;margin-bottom: 5px;">
						<tr align="center">
							<td width="198" align="center" style="border: 1px solid #C0C0C0;">项目</td>
							<td width="120" align="center" style="border: 1px solid #C0C0C0;">单位</td>
							<td width="58" style="border: 1px solid #C0C0C0;"></td>
							<td width="99" align="center" style="border: 1px solid #C0C0C0;">单价(元)</td>
							<td width="100" style="border: 1px solid #C0C0C0;"></td>
						</tr>
						<tr>
							<td align="center" style="border: 1px solid #C0C0C0;">
								按每%或元/每公里计算
							</td>
							<td align="center" style="border: 1px solid #C0C0C0;">
								<select id="seldw" style="width:100px;">
									<option value="百分比">按%计算</option>
									<option value="公里">按元/每公里</option>
								</select>
							</td>
							<td align="center" style="border: 1px solid #C0C0C0;"></td>
							<td align="center" style="border: 1px solid #C0C0C0;">
								<span id="txtglfdj">0</span>
							</td>
							<td align="center" style="border: 1px solid #C0C0C0;">此项目只能选择一种 </td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					合计</td>
				<td colspan="5" style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<table  style="border: 1px solid #C0C0C0;margin-top: 5px;margin-bottom: 5px;">
						<tr height="25">
							<td width="130" style="border: 1px solid #C0C0C0;">预算单价(万元/公里)：</td>
							<td width="80" style="border: 1px solid #C0C0C0;"><span id="lblysdj" style="margin-left: 5px;">0</span>万元</td>
							<td width="130" style="border: 1px solid #C0C0C0;">评估单价(万元/公里)：</td>
							<td width="80" style="border: 1px solid #C0C0C0;"><span id="lblpgdj" style="margin-left: 5px;">0</span>万元</td>
						</tr>
					</table>
				</td>
			</tr>
            <tr style="height: 30px;">
            	<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					上报经费
				</td>
				<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<span id="lblSBJF">0</span>万元
				</td>
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					核算经费
				</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<span id="lblHSJF">0</span>万元
				</td>
				<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					审定经费
				</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<span id="lblSDJF">0</span>万元
				</td>
            </tr>
            <tr style="height: 30px;">
            	<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					总投资
				</td>
				<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<span id="lblZTZxx">0</span>万元
				</td>
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					地方配套总投资
				</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<span id="lblDFPTZTZ">0</span>万元
				</td>
				<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					总补助资金
				</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<span id="lblZBZZJ">0</span>万元
				</td>
            </tr>
            <tr style="height: 30px;">
            	<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					计划下达文号
				</td>
				<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<span id="lblJHXDWH"></span>
				</td>
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					施工图文号
				</td>
				<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<span id="lblSGTWH">0</span>
				</td>
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					工可批复文号
				</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<span id="lblGKPFWH">0</span>
				</td>
            </tr>
            <tr style="height: 30px;">
				<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					设计批复文号
				</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<span id="lblSJPFWH">0</span>
				</td>
				<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					交通量</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<span id="lblJTL">
						<a href='###' onclick='openAADTDetails(1660.43,1672.181,&#39;G105&#39;,&#39;南昌市公路管理局安义分局&#39;)'
							style='cursor: help;text-decoration: none;' title='点击查看'>400</a>
					</span>
				</td>
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					PQI指标</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 18%; text-align: left; padding-left: 10px;">
					<span id="lblPQI">
						<a href='###' onclick='openPQIDetails(1660.43,1672.181,&#39;G105&#39;,&#39;南昌市公路管理局安义分局&#39;)'
						style='cursor: help;text-decoration: none;' title='点击查看'>良</a></span>
				</td>
			</tr>
			<tr style="height: 30px;">
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					技术处置描述</td>
				<td colspan="5" style="border-left: 1px solid #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 18%; text-align: left; padding-left: 10px;">
					<span id="lblJSCZMS"></span>
				</td>
			</tr>
			<tr style="height: 30px;">
				<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					现场核实情况</td>
				<td colspan="5" style="border-left: 1px solid #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;">
					<span id="lblXCHSQK"></span>
				</td>
			</tr>
			<tr style="height: 50px;">
				<td style="color: #007DB3; font-weight: bold; font-size: small; text-align: right; border-bottom: 1px solid #C0C0C0; background-color: #F1F8FF; padding-right: 5px;">
					省统筹备注</td>
				<td colspan="5" style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;">
					<span id="lblSTCBZ"></span>
				</td>
			</tr>
			<tr style="height: 50px;">
				<td style="color: #007DB3; font-weight: bold; font-size: small; text-align: right; border-bottom: 1px solid #C0C0C0; background-color: #F1F8FF; padding-right: 5px;">
					其它备注
				</td>
				<td colspan="5" style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;">
					<span id="lblQTBZ"></span>
				</td>
			</tr>
            <tr style="height: 30px;">
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					历史对比
				</td>
				<td colspan="5" style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<span id="lblLSDB"></span>
				</td>
			</tr>
			<tr style="height: 30px;">
            	<td align="center" colspan="6">
                	<img onclick="$('#yhdzx_xx').dialog('close')" alt="确定" src="${pageContext.request.contextPath}/images/Button/qd1.gif" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/qd2.gif'" onmouseout="this.src='${pageContext.request.contextPath}/images/Button/qd1.gif' " />
                </td>
            </tr>
		</table>
	</div>
	<script type="text/javascript">
	function loadCslx(id,cslx){
		$.ajax({
			type:'post',
			url:'../../../xtgl/queryYhdzxcsByLx.do',
			dataType:'json',
			async:'false',
			data:'yhdzxcs.cslx='+cslx,
			success:function(result){
				var n={clmc:'---请选择---',id:''};
				result.splice(0,0,n);
				$('#'+id).combobox({
				    data:result,
				    valueField:'id',
				    textField:'clmc',
				    onChange:function(newValue,oldValue){
				    	var lx=id.substring(3);
				    	if(newValue!=""){
				    		$.ajax({
					    		type:'post',
								url:'../../../xtgl/queryYhdzxcsById.do',
								dataType:'json',
								data:'yhdzxcs.id='+newValue,
								success:function(result2){
									$('#txt'+lx+'dj').val(result2.lfmdj);
									$('#txt'+lx+'sddj').val(result2.sddj);
								}
					    	});
				    	}else{
				    		$('#txt'+lx+'dj').val("0");
							$('#txt'+lx+'sddj').val("0");
				    	}
				    }
				}); 
			}
		});
	}
	loadCslx('selsmc','上面层');
	loadCslx('selzmc','中面层');
	loadCslx('selxmc','下面层');
	loadCslx('selfc','封层');
	loadCslx('selsjc','上基层');
	loadCslx('selzjc','中基层');
	loadCslx('selxjc','下基层');
	loadCslx('seldc','垫层');
	loadCslx('selyl','原路');
	var sheng=new RegExp("^[0-9]{5}360000$");
	if(!sheng.test($.cookie("unit"))){
		$.each($('td [name=sdtd]'),function(index,item){
			$(item).hide();
		});
	}
	function loadYhdzxcs(date,cslx,cs){
		$('#sel'+cs).combobox("setValue",date[cslx].clmc);
		$('#txt'+cs+'hd').html(date[cslx].hd);
		$('#txt'+cs+'dj').html(date[cslx].dj);
		$('#txt'+cs+'sddj').html(date[cslx].sddj);
	}
	if(parent.YMLib.Var.jhbm!=null){
		xxId=parent.YMLib.Var.jhbm;
	}
	$.ajax({
		type:'post',
		url:'../../../jhgl/queryYhdzxById.do',
		dataType:'json',
		data:'jh.id='+xxId,
		success:function(data){
			$.each(data.plan_lx_yhdzxs,function(index,item){
				var tr1='<tr style="height: 30px;"><td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">管养单位名称</td><td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 18%; text-align: left; padding-left: 10px;"><span id="lblGYDWMC">'+item.gydwmc+'</span></td><td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">路线名称</td><td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;"><span id="lblLXMC">'+item.lxmc+'</span></td><td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">路线编码</td><td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;"><span id="lblLXBM">'+item.lxbm+'</span></td></tr>';
				var tr2='<tr style="height: 30px;"><td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">行政区划名称</td><td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;"><span id="lblXZQHMC">'+item.xzqhmc+'</span></td><td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">起点桩号</td><td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;"><span id="lblQDZH">'+item.qdzh+'</span></td><td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">止点桩号</td><td style="border-left: 1px solid #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 18%; text-align: left; padding-left: 10px;"><span id="lblZDZH">'+item.zdzh+'</span></td></tr>';
				var tr3='<tr style="height: 30px;"><td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">起止里程</td><td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;"><span id="lblLC">'+item.qzlc+'</span>公里</td><td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">核对里程</td><td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;"><span id="lblHDLC">'+item.hdlc+'</span>公里</td><td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">大中修宽度</td><td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;"><span id="lbldzxkd">'+item.dzxkd+'</span>公里</td></tr>';
				var tr4='';
				var tr5='';
				var tr6='';
				$('#tr_scxx').before(tr1+tr2+tr3+tr4+tr5+tr6);
			});
			$('#lblLXMC').html(data.plan_lx_yhdzxs[0].lxmc);
			$('#lblLXBM').html(data.plan_lx_yhdzxs[0].lxbm);
			$('#lblGYDWMC').html(data.plan_lx_yhdzxs[0].gydwmc);
			$('#lblQDZH').html(data.plan_lx_yhdzxs[0].qdzh);
			$('#lblZDZH').html(data.plan_lx_yhdzxs[0].zdzh);
			$('#lblLC').html(data.plan_lx_yhdzxs[0].qzlc);
			$('#lblHDLC').html(data.plan_lx_yhdzxs[0].hdlc);
			$('#lblXZQHMC').html(data.plan_lx_yhdzxs[0].xzqhmc);
			$('#lblJSDJ').html(data.plan_lx_yhdzxs[0].yjsdj);
			$('#lblYLMKD').html(data.plan_lx_yhdzxs[0].ylmkd);
			$('#lblYLMLX').html(data.plan_lx_yhdzxs[0].ylmlx);
			$('#lblYear').html(data.sbnf);
			$('#lbljhkgsj').html(data.jhkgsj);
			$('#lbljhwgsj').html(data.jhwgsj);
			$('#lbljhxdsj').html(data.xdsj);
			$('#lblGCFL').html(data.classify);
			$('#lblSBJF').html(data.reportingfee);
			$('#lblHSJF').html(data.fee);
			$('#lblSDJF').html(data.newfee);
			$('#lblZTZxx').html(data.totalinvest);
			$('#lblDFPTZTZ').html(data.totalplacefund);
			$('#lblZBZZJ').html(data.totalsubsidyfund);
			$('#lblLJBZZJ').html(data.accumulativesubsidyfund);
			$('#lblBNBZZJ').html(data.nowyearsubsidyfund);
			$('#lblDC').html(data.dianceng);
			$('#lblJC').html(data.jiceng);
			$('#lblMC').html(data.surface);
			$('#lblXJBS').html(data.mark);
			$('#lblPQI').html(data.pqi);
			$('#lblJTL').html(data.aadt);
			$('#lblSGTWH').html(data.constructnumber);
			$('#lblGKPFWH').html(data.replynumber);
			$('#lblSJPFWH').html(data.devisenumbder);
			$('#lblJHXDWH').html(data.plandownnumber);
			$('#lblYLMHD').html(data.plan_lx_yhdzxs[0].ylmhd);
			$('#lblJSCZMS').html(data.description);
			$('#lblXCHSQK').html(data.xchsqk);
			$('#lblSTCBZ').html(data.remarks);
			$('#lblQTBZ').html(data.qtbz);
			
			var lmdate=$.parseJSON(data.plan_lx_yhdzxs[0].lmjg);
			if(data.plan_lx_yhdzxs[0].lmjg!=""){
				loadYhdzxcs(lmdate,"上面层","smc");
				loadYhdzxcs(lmdate,"中面层","zmc");
				loadYhdzxcs(lmdate,"下面层","xmc");
				loadYhdzxcs(lmdate,"封层","fc");
				loadYhdzxcs(lmdate,"上基层","sjc");
				loadYhdzxcs(lmdate,"中基层","zjc");
				loadYhdzxcs(lmdate,"下基层","xjc");
				loadYhdzxcs(lmdate,"垫层","dc");
				loadYhdzxcs(lmdate,"原路","yl");
			}
			if(data.plan_lx_yhdzxs[0].aym!=""){
				$.each(JSON.parse(data.plan_lx_yhdzxs[0].aym),function(index,item){
					var html='<tr align="center" id="'+item.id+'"><td align="center" height="30" style="border:1px solid #c0c0c0;"<span>'+item.xmmc+'</span></td><td align=="center" style="border:1px solid #C0C0C0;"><span>'+item.sm+'</span></td><td align="center" width="50" style="border:1px solid #C0C0C0;"><span>'+item.cd+'</span></td><td align="center" width="100" style="border:1px solid #C0C0C0;"><span>'+item.dj+'</span></td></tr>';
					$('#ymtr').after(html);
				});
			}
			if(data.plan_lx_yhdzxs[0].asl!=""){
				$.each(JSON.parse(data.plan_lx_yhdzxs[0].asl),function(index,item){
					var html='<tr align="center" id="'+item.id+'"><td align="center" height="30" style="border: 1px solid #C0C0C0;"><span>'+item.xmmc+'</span></td><td align="center" style="border: 1px solid #C0C0C0;"><span>'+item.sm+'</span></td><td align="center" width="50" style="border: 1px solid #C0C0C0;"><span>'+item.sl+'</span></td><td align="center" width="100" style="border: 1px solid #C0C0C0;"><span>'+item.dj+'</span></td></tr>';
					$('#asltr').after(html);
				});
			}
			if(data.plan_lx_yhdzxs[0].glf!=""){
				$('#seldw').val(JSON.parse(data.plan_lx_yhdzxs[0].glf).dw);
				$('#txtglfdj').html(JSON.parse(data.plan_lx_yhdzxs[0].glf).dj);
				$('#lblysdj').html(JSON.parse(data.plan_lx_yhdzxs[0].glf).ysdj);
				$('#lblpgdj').html(JSON.parse(data.plan_lx_yhdzxs[0].glf).pgdj);
			}
		}
	});
	</script>
</body>
</html>