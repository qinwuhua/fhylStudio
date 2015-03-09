<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>工程改造路面改建开工详情</title>
<link href="${pageContext.request.contextPath}/css/searchAndNavigation.css" type="text/css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/icon.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/YMLib.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/widget/newlhgdialog/lhgcore.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/widget/newlhgdialog/lhgdialog.min.js"></script>
<script type="text/javascript" src="js/gcgzgj.js"></script>
<script type="text/javascript"> 
$(function(){
	var data=parent.obj1;//$("#").text(data.);
	$("#lxmc").text(data.lxmc);$("#lxbm").text(data.lxbm);$("#xzqhdm").text(data.xzqhdm);$("#xzqhmc").text(data.xzqhmc);$("#jsdd").text(data.jsdd);
	$("#gydw").text(data.gydw);$("#gydwbm").text(data.gydwbm);$("#bhnr").text(data.bhnr);$("#qdzh").text(data.qdzh);$("#zdzh").text(data.zdzh);
	$("#qzlc").text(data.qzlc);$("#yhlc").text(data.yhlc);$("#ylmlx").text(data.ylmlx);$("#lxbz").text(data.lxbz);
	$("#fapgdw").text(data.fapgdw);$("#fascdw").text(data.fascdw);$("#faspsj").text(data.faspsj);$("#spwh").text(data.spwh);$("#tzgs").text(data.tzgs);
	$("#jsxz").text(data.jsxz);$("#jsnr").text(data.jsnr);$("#bz").text(data.bz);$("#scbz").text(data.scbz);$("#yjsdj").text(data.yjsdj);
	$("#sbnf").text(data.sbnf);$("#jhkgsj").text(data.jhkgsj);$("#jhwgsj").text(data.jhwgsj);$("#xmmc").text(data.xmmc);$("#lmkd").text(data.lmkd);
	$("#sftqss").text(data.sftqss);$("#sjdw").text(data.sjdw);$("#yhlb").text(data.yhlb);$("#dc").text(data.dc);$("#jc").text(data.jc);
	$("#mc").text(data.mc);$("#sjpfdw").text(data.sjpfdw);$("#pfwh").text(data.pfwh);$("#pfsj").text(data.pfsj);$("#pfztz").text(data.pfztz);
	$("#jhsybzje").text(data.jhsybzje);$("#jhsydfzcje").text(data.jhsydfzcje);$("#sjlmlx").text(data.sjlmlx);$("#sfsqablbz").text(data.sfsqablbz);$("#ablbzsqwh").text(data.ablbzsqwh);
	$("#sfgyhbm").text(data.sfgyhbm);$("#gkbgmc").text(data.gkbgmc);$("#gkbglj").text(data.gkbglj);$("#sjsgtmc").text(data.sjsgtmc);$("#sjsgtlj").text(data.sjsgtlj);
	$("#xdsj").text(data.xdsj);$("#sjkgsj").text(data.sjkgsj);$("#sjwgsj").text(data.sjwgsj);$("#kgzt").text(data.kgzt);$("#jgzt").text(data.jgzt);
	$("#yjwgsj").text(data.yjwgsj);$("#v").text(data.sfqxkg);$("#jsdw").text(data.jsdw);$("#sgdw").text(data.sgdw);$("#jldw").text(data.jldw);
	$("#htje").text(data.htje);$("#sgxkwj").text(data.sgxkwj);$("#jgtcwj").text(data.jgtcwj);$("#jgyswj").text(data.jgyswj);$("#wjsczt").text(data.wjsczt);
	$("#gsztz").text(data.gsztz);$("#scbz").text(data.scbz);$("#jhbz").text(data.jhbz);
	$("#sjwgsj").text(data.sjwgsj);
	if(data.gkbgmc!=''){
		$("#xz_gkbg").text("下载附件");
	}
	if(data.sjsgtmc!=''){
		$("#xz_sjsgt").text("下载附件");
	}
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
	<div style="text-align: left; font-size: 12px; margin: 5px;">
		 <table width="97%" border="0" style="border-style: solid; border-width: 3px 1px 1px 1px;
            border-color: #55BEEE #C0C0C0 #C0C0C0 #C0C0C0; margin-left: 13px; height: 45px;"
            cellspacing="0" cellpadding="0">
            <tr style="height: 25px;">
                <td colspan="6" style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                    color: #55BEEE; font-weight: bold; font-size: small; text-align: left; background-color: #F1F8FF;
                     padding-left: 10px;">
                    <span id="labname3">工程改造路面改建基本信息</span>
                </td>
            </tr>
            <tr style="height: 30px;">
                <td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small;
                    text-align: right; background-color: #F1F8FF; padding-right: 5px;">
                    路线名称
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0;  text-align: left; padding-left: 10px;">
                    <span id="lxmc"></span>
                </td>
                <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                    color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                     padding-right: 5px;">
                    路线编码
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0;  text-align: left; padding-left: 10px;">
                    <span id="lxbm"></span>
                </td>
                <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                    color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                     padding-right: 5px;">
                    建设地点
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0;
                     text-align: left; padding-left: 10px;">
                    <span id="jsdd"></span>
                </td>
            </tr>
            <tr style="height: 30px;">
                <td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small;
                    text-align: right; background-color: #F1F8FF; padding-right: 5px;">
                    起点桩号
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0;  text-align: left; padding-left: 10px;">
                    <span id="qdzh"></span>
                </td>
                <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                    color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                     padding-right: 5px;">
                    止点桩号
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0;  text-align: left; padding-left: 10px;">
                    <span id="zdzh"></span>
                </td>
                <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                    color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                     padding-right: 5px;">
                    起止里程
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0;
                     text-align: left; padding-left: 10px;">
                    <span id="qzlc"></span>（公里）
                </td>
            </tr>
            <tr style="height: 30px;">
                <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                    color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                     padding-right: 5px;">
                    管养单位
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0;  text-align: left; padding-left: 10px;">
                    <span id="gydw"></span>
                </td>
                <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                    color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                     padding-right: 5px;">
                    行政区划代码
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0;  text-align: left; padding-left: 10px;">
                    <span id="xzqhdm"></span>
                </td>
                <td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small;
                    text-align: right; background-color: #F1F8FF; padding-right: 5px;">
                    行政区划
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0;
                     text-align: left; padding-left: 10px;">
                    <span id="xzqhmc"></span>
                </td>
            </tr>
            <tr style="height: 30px;">
                <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                    color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                     padding-right: 5px;">
                    原技术等级
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0;  text-align: left; padding-left: 10px;">
                    <span id="yjsdj"></span>级公路&nbsp;
                </td>
                <td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small;
                    text-align: right; background-color: #F1F8FF; padding-right: 5px;">
                    原路面类型
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0;  text-align: left; padding-left: 10px;">
                    <span id="ylmlx"></span>&nbsp;
                </td>
                <td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small;
                    text-align: right; background-color: #F1F8FF; padding-right: 5px;">
                    隐患里程
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0;
                     text-align: left; padding-left: 10px;">
                    <span id="yhlc"></span>公里
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
                    <span id="bhnr"></span>
                </td>
            </tr>
            <tr style="height: 50px;">
                <td style="color: #007DB3; font-weight: bold; font-size: small; text-align: right;
                    background-color: #F1F8FF; border-bottom: 1px solid #C0C0C0; padding-right: 5px;"
                    class="style12">
                    备&nbsp;&nbsp;&nbsp; 注
                </td>
                <td colspan="5" style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                    text-align: left; padding-left: 10px; border-bottom: 1px solid #C0C0C0;" class="style12">
                    <span id="lxbz"></span>
                </td>
            </tr>
            <tr style="height: 25px;">
                <td colspan="6" style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                    color: #55BEEE; font-weight: bold; font-size: small; text-align: left; background-color: #F1F8FF;
                     padding-left: 10px;">
                    <span id="labname4">工程改造路面改建审查信息</span>
                </td>
            </tr>
            <tr style="height: 30px;">
                <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                    color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                     padding-right: 5px;">
                    方案评估单位
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0;  text-align: left; padding-left: 10px;">
                    <span id="fapgdw"></span>
                </td>
                <td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small;
                    text-align: right; background-color: #F1F8FF; padding-right: 5px;">
                    方案审查单位
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0;  text-align: left; padding-left: 10px;">
                    <span id="fascdw"></span>
                </td>
                <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                    color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                     padding-right: 5px;">
                    方案审批时间
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0;
                     text-align: left; padding-left: 10px;">
                    <span id="faspsj"></span>
                </td>
            </tr>
            <tr style="height: 30px;">
                <td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small;
                    text-align: right; background-color: #F1F8FF; padding-right: 5px;" class="style9">
                    审批文号
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;" class="style10">
                    <span id="spwh"></span>
                </td>
                <td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small;
                    text-align: right; background-color: #F1F8FF; padding-right: 5px;" class="style11">
                    投资估算
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;" class="style10">
                    <span id="tzgs"></span>
                    万元
                </td>
                <td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small;
                    text-align: right; background-color: #F1F8FF; padding-right: 5px;" class="style9">
                    建设性质
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0;
                    text-align: left; padding-left: 10px;" class="style10">
                    <span id="jsxz"></span>
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
                    <span id="jsnr"></span>
                </td>
            </tr>
            <tr style="height: 50px;">
                <td style="color: #007DB3; font-weight: bold; font-size: small; text-align: right;
                    border-bottom: 1px solid #C0C0C0; background-color: #F1F8FF; padding-right: 5px;">
                    备&nbsp;&nbsp;&nbsp; 注
                </td>
                <td colspan="5" style="border-left: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0;
                    border-top: 1px none #C0C0C0; text-align: left; padding-left: 10px;">
                    <span id="scbz"></span>
                </td>
            </tr>
            <tr style="height: 25px;">
                <td colspan="6" style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                    color: #55BEEE; font-weight: bold; font-size: small; text-align: left; background-color: #F1F8FF;
                     padding-left: 10px;">
                    <span id="labname5"> 工程改造路面改建计划信息</span>
                </td>
            </tr>
            <tr style="height: 30px;">
                <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                    color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                     padding-right: 5px;">
                    上报年份
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0;  text-align: left; padding-left: 10px;">
                    <span id="sbnf"></span>
                    &nbsp;
                </td>
                <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                    color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                     padding-right: 5px;">
                    计划开工时间
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0;  text-align: left; padding-left: 10px;">
                    <span id="jhkgsj"></span>
                    &nbsp;
                </td>
                <td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small;
                    text-align: right; background-color: #F1F8FF; padding-right: 5px;">
                    计划完工时间
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0;
                     text-align: left; padding-left: 10px;">
                    <span id="jhwgsj"></span>
                    &nbsp;
                </td>
            </tr>
            <tr style="height: 30px;">
                <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                    color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                     padding-right: 5px;">
                    项目名称
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0;  text-align: left; padding-left: 10px;">
                    <span id="xmmc"></span>
                    &nbsp;
                </td>
                <td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small;
                    text-align: right; background-color: #F1F8FF; padding-right: 5px;">
                    路面宽度
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0;  text-align: left; padding-left: 10px;">
                    <span id="lmkd"></span>米 &nbsp;
                </td>
                <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                    color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                     padding-right: 5px;">
                    是否提前实施
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0;
                     text-align: left; padding-left: 10px;">
                    <span id="sftqss"></span>
                    &nbsp;
                </td>
            </tr>
            <tr style="height: 30px;">
                <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                    color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                     padding-right: 5px;">
                    设计单位
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0;  text-align: left; padding-left: 10px;">
                    <span id="sjdw"></span>
                    &nbsp;
                </td>
                <td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small;
                    text-align: right; background-color: #F1F8FF; padding-right: 5px;">
                    养护类别
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0;  text-align: left; padding-left: 10px;">
                    <span id="yhlb"></span>&nbsp;
                </td>
                <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                    color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                     padding-right: 5px;">
                    &nbsp;
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0;  text-align: left; padding-left: 10px;">
                    &nbsp;
                </td>
            </tr>
            <tr style="height: 30px;">
                <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                    color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                     padding-right: 5px;">
                    垫层
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0;  text-align: left; padding-left: 10px;">
                    <span id="dc"></span>m³
                </td>
                <td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small;
                    text-align: right; background-color: #F1F8FF; padding-right: 5px;">
                    基层
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0;  text-align: left; padding-left: 10px;">
                    <span id="jc"></span>m³
                </td>
                <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                    color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                     padding-right: 5px;">
                    面层
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0;  text-align: left; padding-left: 10px;">
                    <span id="mc"></span>km
                </td>
            </tr>
            <tr style="height: 30px;">
                <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                    color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                     padding-right: 5px;">
                    设计批复单位
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0;  text-align: left; padding-left: 10px;">
                    <span id="sjpfdw"></span>
                    &nbsp;
                </td>
                <td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small;
                    text-align: right; background-color: #F1F8FF; padding-right: 5px;">
                    批复文号
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0;  text-align: left; padding-left: 10px;">
                    <span id="pfwh"></span>
                    &nbsp;
                </td>
                <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                    color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                     padding-right: 5px;">
                    批复时间
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0;  text-align: left; padding-left: 10px;">
                    <span id="pfsj"></span>
                    &nbsp;
                </td>
            </tr>
            <tr style="height: 30px;">
                <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                    color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                     padding-right: 5px;">
                    批复总投资
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0;  text-align: left; padding-left: 10px;">
                    <span id="pfztz"></span>
                    万元
                </td>
                <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                    color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                     padding-right: 5px;">
                    计划使用部补助金额
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0;  text-align: left; padding-left: 10px;">
                    <span id="jhsybzje"></span>
                    万元
                </td>
                <td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small;
                    text-align: right; background-color: #F1F8FF; padding-right: 5px;">
                    计划使用省补助资金
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0;
                     text-align: left; padding-left: 10px;">
                    <span id="jhsydfzcje"></span>
                    万元
                </td>
            </tr>
            <tr style="height: 30px;">
                <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                    color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                     padding-right: 5px;">
                    设计路面类型
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0;  text-align: left; padding-left: 10px;">
                    <span id="sjlmlx"></span>
                    &nbsp;
                </td>
                <td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small;
                    text-align: right; background-color: #F1F8FF; padding-right: 5px;">
                    是否申请按比例补助
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0;  text-align: left; padding-left: 10px;">
                    <span id="sfsqablbz"></span>
                    &nbsp;
                </td>
                <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                    color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                     padding-right: 5px;">
                    按比例补助申请文号
                </td>
                <td style="border-left: 1px solid #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0;
                    border-bottom: 1px solid #C0C0C0;  text-align: left; padding-left: 10px;">
                    <span id="ablbzwh"></span>&nbsp;
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
                    <span id="sfgyhbm"></span>&nbsp;
                </td>
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
					工程改造路面改建项目开工信息</td>
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
					<span id="yjwgsj"></span>
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
					<span id="gsztz"></span>&nbsp;
				</td>
				<td
					style="color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 16%; padding-right: 5px;">
					实际完工时间</td>
				<td
					style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;  text-align: left; padding-left: 10px;">
					<span id="sjwgsj"></span>&nbsp;</td>
			</tr>
			<tr style="height: 25px;">
				<td colspan="6"
					style="border-style: solid none solid solid; border-width: 1px; border-color: #C0C0C0; color: #55BEEE; font-weight: bold; font-size: small; text-align: left; background-color: #F1F8FF; width: 16%; padding-left: 10px;">
					工程改造路面改建项目进展信息</td>
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