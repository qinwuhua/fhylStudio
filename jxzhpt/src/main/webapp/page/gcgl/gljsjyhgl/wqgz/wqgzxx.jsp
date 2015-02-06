<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>危桥改造开工详情</title>
<link href="${pageContext.request.contextPath}/css/searchAndNavigation.css" type="text/css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/icon.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/widget/newlhgdialog/lhgcore.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/widget/newlhgdialog/lhgdialog.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/YMLib.js"></script>
<script type="text/javascript" src="js/wqgz.js"></script>
<script type="text/javascript"> 
$(function(){
	//$("#").text(data.);
	var data=parent.obj1;
	$("#xzqhdm").text(data.xzqhdm);$("#xzqhmc").text(data.xzqhmc);
	$("#qlmc").text(data.qlmc);$("#qlbm").text(data.qlbh);$("#qlzxzh").text(data.qlzxzh);$("#gydw").text(data.gydw);$("#lxmc").text(data.lxmc);$("#lxbm").text(data.lxbm);$("#qlkd").text(data.qlkd);
	$("#qlqc").text(data.qlqc);$("#kjzc").text(data.kjzc);$("#dkzdkj").text(data.dkzdkj);$("#jsdj").text(data.jsdj);$("#pddj").text(data.pddj);$("#xjgjnd").text(data.xjgjnd);
	$("#akjfl").text(data.akjfl);$("#sbjgxs").text(data.sbjgxs);$("#xmnf").text(data.xmnf);$("#xmtype").text(data.xmtype);
	$("#bhnr").text(data.bhnr);$("#bz").text(data.bz);$("#tsdq").text(data.tsdq);
	$("#tzgs").text(data.tzgs);$("#spwh").text(data.spwh);$("#fapgdw").text(data.fapgdw);$("#fascdw").text(data.fascdw);
	$("#faspsj").text(data.faspsj);$("#jsxz").text(data.jsxz);$("#jsnr").text(data.jsnr);$("#scbz").text(data.scbz);
	$("#sbnf").text(data.sbnf);$("#jhkgsj").text(data.jhkgsj);$("#jhwgsj").text(data.jhwgsj);$("#sjdw").text(data.sjdw);$("#sjpfdw").text(data.sjpfdw);$("#pfwh").text(data.pfwh);$("#pfsj").text(data.pfsj);$("#pfztz").text(data.pfztz);
	$("#jhsybzje").text(data.jhsybzje);$("#jhsydfzcje").text(data.jhsydfzcje);$("#sfsqablbz").text(data.sfsqablbz);$("#ablbzsqwh").text(data.ablbzsqwh);
	$("#jhbz").text(data.jhbz);$("#xdsj").text(data.xdsj);$("#sjkgsj").text(data.sjkgsj);
	$("#yjjgsj").text(data.yjjgsj);$("#sgdw").text(data.sgdw);$("#jldw").text(data.jldw);$("#jsdw").text(data.jsdw);
	$("#gys").text(data.gys);$("#htje").text(data.htje);$("#sjwgsj").text(data.sjwgsj);$("#jhbz").text(data.jhbz);	
	if(data.gkbgmc!=''){
		$("#xz_gkbg").text("下载附件");
	}
	if(data.sjsgtmc!=''){
		$("#xz_sjsgt").text("下载附件");
	}
	var data1="jhid="+data.jhid;
	jiazaifujian(data1);
});

</script>
<style type="text/css">
a {
	text-decoration: none;
}
</style>
</head>
<body style="margin: 0 0 0 0">
	<div style="text-align: left; font-size: 12px; margin: 5px;">
		<table width="97%" border="0"
			style="border-style: solid; border-width: 3px 1px 1px 1px; border-color: #55BEEE #C0C0C0 #C0C0C0 #C0C0C0; margin-left: 13px;"
			cellspacing="0" cellpadding="0">
			<tr style="height: 25px;">
				<td colspan="6"
					style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #55BEEE; font-weight: bold; font-size: small; text-align: left; background-color: #F1F8FF; padding-left: 10px;">
					危桥改造项目基本信息</td>
			</tr>
			<tr style="height: 30px;">
				<td
					style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 16%; padding-right: 5px;">
					桥梁名称</td>
				<td
					style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0;  text-align: left; padding-left: 10px;">
					<span id="qlmc"></span>
				</td>
				<td
					style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 16%; padding-right: 5px;">
					桥梁编码</td>
				<td
					style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0;  text-align: left; padding-left: 10px;">
					<span id="qlbm"></span>
				</td>
				<td
					style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 16%; padding-right: 5px;">
					桥梁中心桩号</td>
				<td
					style="border-left: 1px solid #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0;  text-align: left; wid padding-left: 10px;">
					<span id="qlzxzh"></span>
				</td>
			</tr>
			<tr style="height: 30px;">
				<td
					style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					&nbsp;管养单位</td>
				<td
					style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;">
					<span id="gydw"></span>
				</td>
				<td
					style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 16%; padding-right: 5px;">
					行政区划代码</td>
				<td
					style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0;  text-align: left; padding-left: 10px;">
					<span id="xzqhdm"></span>
				</td>
				<td
					style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					行政区划名称</td>
				<td
					style="border-left: 1px solid #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;">
					<span id="xzqhmc"></span>
				</td>
			</tr>
			<tr style="height: 30px;">
				<td
					style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					路线名称</td>
				<td
					style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;">
					<span id="lxmc"></span>
				</td>
				<td
					style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 16%; padding-right: 5px;">
					路线编码</td>
				<td
					style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0;  text-align: left; padding-left: 10px;">
					<span id="lxbm"></span>
				</td>
				<td
					style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 16%; padding-right: 5px;">
					跨径总长</td>
				<td
					style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0;  text-align: left; padding-left: 10px;">
					<span id="kjzc"></span> 米
				</td>
			</tr>
			<tr style="height: 30px;">
				<td
					style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					桥梁全长&nbsp;</td>
				<td
					style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;">
					<span id="qlqc"></span> 米
				</td>
				<td
					style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					桥梁全宽</td>
				<td
					style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;">
					<span id="qlqk"></span> 米
				</td>
				<td
					style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					单孔最大跨径</td>
				<td
					style="border-left: 1px solid #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;">
					<span id="dkzdkj"></span> 米
				</td>
			</tr>
			<tr style="height: 30px;">
				<td
					style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					技术等级</td>
				<td
					style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;">
					<span id="jsdj"></span>
				</td>
				<td
					style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 16%; padding-right: 5px;">
					评定等级</td>
				<td
					style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0;  text-align: left; padding-left: 10px;">
					<span id="pddj"></span>
				</td>
				<td
					style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					修建/改建年度</td>
				<td
					style="border-left: 1px solid #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;">
					<span id="xjgjnd"></span>
				</td>
			</tr>
			<tr style="height: 30px;">
				<td
					style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					按跨径分类</td>
				<td
					style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;">
					<span id="akjfl"></span>
				</td>
				<td
					style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 16%; padding-right: 5px;">
					上部结构形式</td>
				<td
					style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0;  text-align: left; padding-left: 10px;">
					<span id="sbjgxs"></span>
				</td>
				<td
					style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					特殊地区</td>
				<td
					style="border-left: 1px solid #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;">
					<span id="tsdq"></span>&nbsp;&nbsp;
				</td>
			</tr>
			<tr style="height: 30px;">
				<td
					style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					项目年份</td>
				<td
					style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;">
					<span id="xmnf"></span>&nbsp;
				</td>
				<td
					style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 16%; padding-right: 5px;">
					项目状态</td>
				<td
					style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0;  text-align: left; padding-left: 10px;">
					<span id="xmtype"></span> &nbsp;
				</td>
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					&nbsp;
				</td>
				<td
					style="border-left: 1px solid #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;">
					&nbsp;
				</td>
			</tr>
			<tr style="height: 30px;">
				<td
					style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;"
					class="style3">病害内容</td>
				<td colspan="5"
					style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;"
					class="style3"><span id="bhnr"></span> &nbsp;</td>
			</tr>
			<tr style="height: 50px;">
				<td
					style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					备注&nbsp;&nbsp;&nbsp;&nbsp;</td>
				<td colspan="5"
					style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;">
					<span id="bz"></span> &nbsp;
				</td>
			</tr>
			<tr style="height: 25px;">
				<td colspan="6"
					style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #55BEEE; font-weight: bold; font-size: small; text-align: left; background-color: #F1F8FF; padding-left: 10px;"
					class="style4">危桥改造项目审查信息</td>
			</tr>
			<tr style="height: 30px;">
				<td
					style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 16%; padding-right: 5px;">
					方案评估单位</td>
				<td
					style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0;  text-align: left; padding-left: 10px;">
					<span id="fapgdw"></span>
				</td>
				<td
					style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					方案审查单位</td>
				<td
					style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0;  text-align: left; padding-left: 10px;">
					<span id="fascdw"></span>
				</td>
				<td
					style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 16%; padding-right: 5px;">
					方案审批时间</td>
				<td
					style="border-left: 1px solid #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0;  text-align: left; padding-left: 10px;">
					<span id="faspsj"></span>
				</td>
			</tr>
			<tr style="height: 30px;">
				<td
					style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 16%; padding-right: 5px;">
					审批文号</td>
				<td
					style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0;  text-align: left; padding-left: 10px;">
					<span id="spwh"></span>
				</td>
				<td
					style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					投资估算</td>
				<td
					style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0;  text-align: left; padding-left: 10px;">
					<span id="tzgs"></span> 万元
				</td>
				<td
					style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 16%; padding-right: 5px;">
					建设性质</td>
				<td
					style="border-left: 1px solid #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 16%; text-align: left; padding-left: 10px;">
					<span id="jsxz"></span>&nbsp;
				</td>
			</tr>
			<tr style="height: 50px;">
				<td
					style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					建设内容</td>
				<td colspan="5"
					style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;">
					<span id="jsnr"></span>
				</td>
			</tr>
			<tr style="height: 50px;">
				<td
					style="border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					备&nbsp;&nbsp;&nbsp; 注</td>
				<td colspan="5"
					style="border-bottom: 1px solid #C0C0C0; border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; text-align: left; padding-left: 10px;">
					<span id="scbz"></span> &nbsp;
				</td>
			</tr>
			<tr style="height: 25px;">
				<td colspan="6"
					style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #55BEEE; font-weight: bold; font-size: small; text-align: left; background-color: #F1F8FF; width: 16%; padding-left: 10px;">
					危桥改造项目计划信息</td>
			</tr>
			<tr style="height: 30px;">
				<td
					style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 16%; padding-right: 5px;">
					上报年份</td>
				<td
					style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0;  text-align: left; padding-left: 10px;">
					<span id="sbnf"></span>&nbsp;
				</td>
				<td
					style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 16%; padding-right: 5px;">
					计划开工时间</td>
				<td
					style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0;  text-align: left; padding-left: 10px;">
					<span id="jhkgsj"></span>&nbsp;
				</td>
				<td
					style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					计划完工时间</td>
				<td
					style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0;  text-align: left; padding-left: 10px;">
					<span id="jhwgsj"></span>&nbsp;
				</td>
			</tr>
			<tr style="height: 30px;">
				<td
					style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 16%; padding-right: 5px;">
					设计单位</td>
				<td
					style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0;  text-align: left; padding-left: 10px;">
					<span id="sjdw"></span>
				</td>
				<td
					style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					设计批复单位</td>
				<td
					style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0;  text-align: left; padding-left: 10px;">
					<span id="sjpfdw"></span>
				</td>
				<td
					style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 16%; padding-right: 5px;">
					&nbsp;</td>
				<td
					style="border-left: 1px solid #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0;  text-align: left; padding-left: 10px;">
					&nbsp;</td>
			</tr>
			<tr style="height: 30px;">
				<td
					style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					批复文号</td>
				<td
					style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0;  text-align: left; padding-left: 10px;">
					<span id="pfwh"></span> &nbsp;
				</td>
				<td
					style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 16%; padding-right: 5px;">
					批复时间</td>
				<td
					style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0;  text-align: left; padding-left: 10px;">
					<span id="pfsj"></span>&nbsp;
				</td>
				<td
					style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 16%; padding-right: 5px;">
					&nbsp;</td>
				<td
					style="border-left: 1px solid #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0;  text-align: left; padding-left: 10px;">
					&nbsp;</td>
			</tr>
			<tr style="height: 30px;">
				<td
					style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 16%; padding-right: 5px;">
					批复投资</td>
				<td
					style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0;  text-align: left; padding-left: 10px;">
					<span id="pfztz"></span>万元
				</td>
				<td
					style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					计划使用部补助金额</td>
				<td
					style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0;  text-align: left; padding-left: 10px;">
					&nbsp;<span id="jhsybzje"></span>万元
				</td>
				<td
					style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 16%; padding-right: 5px;">
					计划使用地方补助金额</td>
				<td
					style="border-left: 1px solid #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0;  text-align: left; padding-left: 10px;">
					&nbsp;<span id="jhsydfzcje"></span>万元
				</td>
			</tr>
			<tr style="height: 30px;">
				<td
					style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 16%; padding-right: 5px;">
					是否申请按比例补助</td>
				<td
					style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0;  text-align: left; padding-left: 10px;">
					<span id="sfsqablbz"></span> &nbsp;
				</td>
				<td
					style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					按比例补助申请文号</td>
				<td
					style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0;  text-align: left; padding-left: 10px;">
					<span id="ablbzsqwh"></span> &nbsp;
				</td>
				<td
					style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 16%; padding-right: 5px;">
					&nbsp;</td>
				<td
					style="border-left: 1px solid #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0;  text-align: left; padding-left: 10px;">
					&nbsp;</td>
			</tr>
			<tr style="height: 30px;">
				<td
					style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					工可报告</td>
				<td colspan="5"
					style="border-left: 1px solid #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;">
					<a
					onclick="uploadFile1('gkbg')" id="xz_gkbg"
					href="#" 
					style="color: #2C7ED1;">暂无附件</a>
				</td>
			</tr>
			<tr style="height: 30px;">
				<td
					style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 16%; padding-right: 5px;">
					设计施工图</td>
				<td colspan="5"
					style="border-left: 1px solid #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0;  text-align: left; padding-left: 10px;">
					 <a
					onclick="uploadFile1('sjsgt');" id="xz_sjsgt"
					href="#"
					style="color: #2C7ED1;">暂无附件</a>
				</td>
			</tr>
			<tr style="height: 50px;">
				<td
					style="color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;"
					class="style1">备&nbsp;&nbsp;&nbsp; 注</td>
				<td colspan="5"
					style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; text-align: left; padding-left: 10px;">
					<span id="jhbz"></span>
				</td>
			</tr>
			<tr style="height: 25px;">
				<td colspan="6"
					style="border-style: solid none solid solid; border-width: 1px; border-color: #C0C0C0; color: #55BEEE; font-weight: bold; font-size: small; text-align: left; background-color: #F1F8FF; width: 16%; padding-left: 10px;">
					危桥改造项目开工信息</td>
			</tr>
			<tr style="height: 30px;">
				<td
					style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 16%; padding-right: 5px;">
					计划下达时间</td>
				<td
					style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0;  text-align: left; padding-left: 10px;">
					<span id="xdsj"></span>
				</td>
				<td
					style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					实际开工时间</td>
				<td
					style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0;  text-align: left; padding-left: 10px;">
					<span id="sjkgsj"></span>
				</td>
				<td
					style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 16%; padding-right: 5px;">
					预计完工时间</td>
				<td
					style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0;  text-align: left; padding-left: 10px;">
					<span id="yjjgsj"></span>
				</td>
			</tr>
			<tr style="height: 30px;">
				<td
					style="border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 16%; padding-right: 5px;">
					施工单位</td>
				<td
					style="border-bottom: 1px solid #C0C0C0; border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;  text-align: left; padding-left: 10px;">
					<span id="sgdw"></span>
				</td>
				<td
					style="border-bottom: 1px solid #C0C0C0; border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					监理单位</td>
				<td
					style="border-bottom: 1px solid #C0C0C0; border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;  text-align: left; padding-left: 10px;">
					<span id="jldw"></span>
				</td>
				<td
					style="border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 16%; padding-right: 5px;">
					建设单位</td>
				<td
					style="border-bottom: 1px solid #C0C0C0; border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;  text-align: left; padding-left: 10px;">
					<span id="jsdw"></span>&nbsp;
				</td>
			</tr>
			<tr style="height: 30px;">
				<td
					style="color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 16%; padding-right: 5px;">
					合同金额（万元）</td>
				<td
					style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;  text-align: left; padding-left: 10px;">
					<span id="htje"></span>&nbsp;
				</td>
				<td
					style="color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 16%; padding-right: 5px;">
					概预算（万元）</td>
				<td
					style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;  text-align: left; padding-left: 10px;">
					<span id="gys"></span>&nbsp;
				</td>
				<td
					style="color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 16%; padding-right: 5px;">
					&nbsp;</td>
				<td
					style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;  text-align: left; padding-left: 10px;">
					&nbsp;</td>
			</tr>
			<tr style="height: 25px;">
				<td colspan="6"
					style="border-style: solid none solid solid; border-width: 1px; border-color: #C0C0C0; color: #55BEEE; font-weight: bold; font-size: small; text-align: left; background-color: #F1F8FF; width: 16%; padding-left: 10px;">
					危桥改造项目进展信息</td>
			</tr>
			<tr style="height: 30px;">
				<td
					style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;"
					class="style5">施工许可文件</td>
				<td colspan="5"
					style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;"
					class="style6">
					<div id="sgxkwj">
						<table width="100%" cellpadding="0" cellspacing="0">
							<tr>
								<td align="center" nowrap="nowrap" style="width: 50%;"> <a
									onclick="downFile('sgxkwj')" id="xz_sgxkwj"
									href=""
									style="color: #000000;cursor:default; ">暂无附件</a></td>
								<td align="left">
									<table>
										<tr>
											<td><a onclick="uploadFile('sgxkwj')"
												id="sc_sgxkwj"
												href="#"
												style="color: #2C7ED1;">上传</a></td>
											<td>&nbsp;|&nbsp;</td>
											<td><a onclick="deleteFile('sgxkwj')"
												href="#"
												style="color: #2C7ED1;">删除</a></td>
										</tr>
									</table>
								</td>
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
									href=""
									style="color: #000000;cursor:default; ">暂无附件</a></td>
								<td align="left">
									<table>
										<tr>
											<td><a onclick="uploadFile('jgtcwj')"
												id="sc_jgtcwj"
												href="#"
												style="color: #2C7ED1;">上传</a></td>
											<td>&nbsp;|&nbsp;</td>
											<td><a onclick="deleteFile('jgtcwj')"
												
												href="#"
												style="color: #2C7ED1;">删除</a></td>
										</tr>
									</table>
								</td>
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
									href=""  
									style="color: #000000;cursor:default; ">暂无附件</a></td>
								<td align="left">
									<table>
										<tr>
											<td><a onclick="uploadFile('jgyswj')"
												id="sc_jgyswj"
												href="#"
												style="color: #2C7ED1;">上传</a></td>
											<td>&nbsp;|&nbsp;</td>
											<td><a onclick="deleteFile('jgyswj')"
											
												href="#"
												style="color: #2C7ED1;">删除</a></td>
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
					onclick="closes('wqxx')"/></td>
			</tr>
		</table>
		<br />
	</div>
</body>
</html>