<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>工程改造路面升级月报信息</title>
	<link href="${pageContext.request.contextPath}/css/searchAndNavigation.css" type="text/css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/icon.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="js/gcgzsj.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YMLib.js"></script>
	<script type="text/javascript">
		$(function(){
			var datayb=parent.obj;
			$("#cgsdwzj").text(datayb.cgsdwzj);
			$("#yiji").text(datayb.yiji);$("#sanji").text(datayb.sanji);
			$("#erji").text(datayb.erji);$("#siji").text(datayb.siji);
			$("#tbr").text(datayb.tbr);
			$("#tbsj").text(datayb.tbsj);
			$("#tbyf").text(datayb.tbyf);
			$("#stz").text(datayb.stz);
			$("#ssdctc").text(datayb.ssdctc);
			$("#bndsslc").text(datayb.bndsslc);
			$("#wkglc").text(datayb.wkglc);
			$("#wcqk").text(datayb.wcqk);
			$("#qlwcqk_z").text(datayb.qlwcqk_z);$("#qlwcqk_ym").text(datayb.qlwcqk_ym);$("#sdwcqk_z").text(datayb.sdwcqk_z);$("#sdwcqk_ym").text(datayb.sdwcqk_ym);$("#hdwcqk_m").text(datayb.hdwcqk_m);
			$("#ljtsfwcqk").text(datayb.ljtsfwcqk);$("#dcwcqk").text(datayb.dcwcqk);$("#jcwcqk").text(datayb.jcwcqk);$("#bywcmc").text(datayb.bywcmc);$("#lqlmwcqk").text(datayb.lqlmwcqk);$("#snlmwcqk").text(datayb.snlmwcqk);
			$("#zycgs").text(datayb.zycgs);$("#dfbz").text(datayb.dfbz);$("#yhdk").text(datayb.yhdk);$("#sttxdk").text(datayb.sttxdk);$("#qtzj").text(datayb.qtzj);
			$("#kgdl").text(datayb.kgdl);$("#qksm").text(datayb.qksm);$("#bywctze").text(datayb.bywctze);$("#bywcgzl").text(datayb.bywcgzl);
			$("#sbsj").text(datayb.sbsj);$("#sbyf").text(datayb.sbyf); 
			
			$("#shzt").text(datayb.shzt);
			$("#shuser").text(datayb.shuser);
			if(datayb.shtime!=null)
			$("#shtime").text(datayb.shtime);
			else $("#shtime").text('');
			$("#zjje").text(datayb.zjje);
			$("#xgcsyj").text(datayb.xgcsyj);
			$("#cscyj").text(datayb.cscyj);
			
			$("#zgshzt").text(datayb.zgshzt);
			$("#zgshuser").text(datayb.zgshuser);
			if(datayb.zgshtime!=null)
			$("#zgshtime").text(datayb.zgshtime);
			else $("#zgshtime").text('');
			$("#zgshyj").text(datayb.zgshyj);
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
		<table width="99%" border="0" style="margin-top: 1px; margin-left: 1px;" cellspacing="0" cellpadding="0">

           <tr>
                <td>
                    <br />
                    <table width="100%" border="0" style="border-style: solid; border-width: 3px 1px 1px 1px;
                        border-color: #55BEEE #C0C0C0 #C0C0C0 #C0C0C0; height: 45px;" cellspacing="0"
                        cellpadding="0">
                        <tr style="height: 25px;">
                            <td colspan="6" style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                color: #55BEEE; font-weight: bold; font-size: small; text-align: left; background-color: #F1F8FF;
                                width: 25%;; padding-left: 10px;">
                                资金到位情况
                            </td>
                        </tr>
                         <tr style="height: 30px;">
                            <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                color: #009ACD; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                 padding-right: 5px;">
                                车购税资金
                            </td>
                            <td style="border-left: 1px solid #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0;
                                border-bottom: 1px solid #C0C0C0;  text-align: left; padding-left: 10px;"
                                colspan="5">
                                <div>
                                <table>
                                <tr>
                                <td style="width: 155px;">部投资：<span id="cgsdwzj"></span></td><td>省投资：<span id="stz"></span></td>
                                </tr>
                                </table>
                                </div>
                            </td>
                        </tr>
                        <tr style="height: 35px;">
                            <td style="border-bottom: 1px solid #C0C0C0; font-weight: bold; font-size: small;
                                text-align: right; background-color: #F1F8FF;  padding-right: 5px;">
                                <b><font color="#009ACD" style="cursor: hand; font-size: 12px">填报人</font></b>
                            </td>
                            <td style="border-bottom: 1px solid #C0C0C0; border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0;
                                border-top: 1px none #C0C0C0;  text-align: left; padding-left: 10px;">
                                <label id="tbr"></label>
                                &nbsp;
                            </td>
                            <td style="border-bottom: 1px solid #C0C0C0; font-weight: bold; font-size: small;
                                text-align: right; background-color: #F1F8FF;  padding-right: 5px;">
                                <b><font color="#009ACD" style="cursor: hand; font-size: 12px">填报时间</font></b>
                            </td>
                            <td style="border-bottom: 1px solid #C0C0C0; border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0;
                                border-top: 1px none #C0C0C0;  text-align: left; padding-left: 10px;">
                                <label id="tbsj"></label>
                                &nbsp;
                            </td>
                            <td style="border-bottom: 1px solid #C0C0C0; font-weight: bold; font-size: small;
                                text-align: right; background-color: #F1F8FF;  padding-right: 5px;">
                                <b><font color="#009ACD" style="cursor: hand; font-size: 12px">填报月份</font></b>
                            </td>
                            <td style="border-bottom: 1px solid #C0C0C0; border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                                 text-align: left; padding-left: 10px;">
                                <label id="tbyf"></label>
                                &nbsp;
                            </td>
                        </tr>
                        <tr style="height: 25px;">
                            <td colspan="6" style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                color: #55BEEE; font-weight: bold; font-size: small; text-align: left; background-color: #F1F8FF;
                                 padding-left: 10px;">
                                月报详细信息
                            </td>
                        </tr>
                        <tr style="height: 35px;">
                            <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                color: #009ACD; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                 padding-right: 5px;">
                                桥梁完成情况
                            </td>
                            <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                                border-bottom: 1px solid #C0C0C0;  text-align: left; padding-left: 10px;">
                                <label id="qlwcqk_z"></label>座&nbsp;&nbsp;
                                <label id="qlwcqk_ym"></label>延米
                            </td>
                            <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                 padding-right: 5px;">
                                <b><font color="#009ACD" style="cursor: hand; font-size: 12px">隧道完成情况</font></b>
                            </td>
                            <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                                border-bottom: 1px solid #C0C0C0;  text-align: left; padding-left: 10px;">
                                <label id="sdwcqk_z"></label>座&nbsp;&nbsp;
                                <label id="sdwcqk_ym"></label>延米
                            </td>
                            <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                 padding-right: 5px;">
                                <b><font color="#009ACD" style="cursor: hand; font-size: 12px">涵洞完成情况</font></b>
                            </td>
                            <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                                border-bottom: 1px solid #C0C0C0;  text-align: left; padding-left: 10px;">
                                <label id="hdwcqk_m"></label>米
                            </td>
                        </tr>
                        <tr style="height: 35px;">
                            <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                color: #009ACD; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                 padding-right: 5px;">
                                路基土石方完成情况
                            </td>
                            <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                                border-bottom: 1px solid #C0C0C0;  text-align: left; padding-left: 10px;">
                                <label id="ljtsfwcqk"></label>㎡
                            </td>
                            <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                color: #009ACD; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                 padding-right: 5px;">
                                垫层完成情况
                            </td>
                            <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                                border-bottom: 1px solid #C0C0C0;  text-align: left; padding-left: 10px;">
                                <label id="dcwcqk"></label>公里
                            </td>
                            <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                color: #009ACD; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                 padding-right: 5px;">
                                基层完成情况
                            </td>
                            <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                                border-bottom: 1px solid #C0C0C0;  text-align: left; padding-left: 10px;">
                                <label id="jcwcqk"></label>公里
                            </td>
                        </tr>
                        <tr style="height: 35px;">
                            <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                color: #009ACD; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                 padding-right: 5px;">
                                面层完成情况
                            </td>
                            <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                                border-bottom: 1px solid #C0C0C0;  text-align: left; padding-left: 10px;">
                                <label id="bywcmc"></label>公里
                            </td>
                            <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                color: #009ACD; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                 padding-right: 5px;">
                                沥青路面完成情况
                            </td>
                            <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                                border-bottom: 1px solid #C0C0C0;  text-align: left; padding-left: 10px;">
                                <label id="lqlmwcqk"></label>公里
                            </td>
                            <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                color: #009ACD; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                 padding-right: 5px;">
                                水泥路面完成情况
                            </td>
                            <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                                border-bottom: 1px solid #C0C0C0;  text-align: left; padding-left: 10px;">
                                <label id="snlmwcqk"></label>公里
                            </td>
                        </tr>
                        <tr style="height: 35px;">
                            <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                color: #009ACD; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                 padding-right: 5px;" >
                                本月资金到位
                            </td>
                            <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                                border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;" colspan="5">
                                <b>中央车购税</b>：<label id="zycgs"></label>万元&nbsp;&nbsp;&nbsp;
                                <b>地方补助</b>：<label id="dfbz"></label>万元&nbsp;&nbsp;&nbsp;
                                <b>银行贷款</b>：<label id="yhdk"></label>万元&nbsp;&nbsp;&nbsp;
                                 <b>省厅贴息</b>：<label id="sttxdk"></label>万元&nbsp;&nbsp;&nbsp;
                                <b>其他投资</b>：<label id="qtzj"></label>万元
                            </td>
                        </tr>
                       
                         <tr style="height: 35px;">
                            <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                color: #009ACD; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                 padding-right: 5px;">
                                本月完成投资额
                            </td>
                            <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                                border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;" >
                                <label id="bywctze"></label>
                            </td>
                            <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                 padding-right: 5px;">
                                &nbsp;<b><font color="#009ACD" style="cursor: hand; font-size: 12px">本月完成工作量</font></b>
                            </td>
                            <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                                border-bottom: 1px solid #C0C0C0;  text-align: left; padding-left: 10px;">
                                <label id="bywcgzl"></label>公里
                            </td>
                            <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                color: #009ACD; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                padding-right: 5px;">
                                截至开工段落
                            </td>
                            <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                                border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;">
                                <label id="kgdl"></label>
                            </td>
                        </tr>
                        
                         <tr style="height: 35px;">
                         <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                 padding-right: 5px;">
                                <b><font color="#009ACD" style="font-size: 12px">本月完成情况（%）</font></b>
                            </td>
                            <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                                border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;">
                               <span  id="wcqk" ></span>
                            </td>
                              <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                 padding-right: 5px;">
                                <b><font color="#009ACD" style=" font-size: 12px">砂石垫层通车</font></b>
                            </td>
                            <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                                border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;" >
                                <span id="ssdctc"  ></span>
                            </td>
                            <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                 padding-right: 5px;">
                                <b><font color="#009ACD" style=" font-size: 12px">本年度实施里程(公里)</font></b>
                            </td>
                            <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                                border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;" >
                                <span id="bndsslc"  ></span>
                            </td>
                        </tr>
                        <tr style="height: 35px;">
                            <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                color: #009ACD; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                padding-right: 5px;">
                                本月完成：
                            </td>
                            <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                                border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;" colspan="5">
                                一级<span  id="yiji"  ></span>公里；
                                二级<span  id="erji"  ></span>公里；
                                三级<span  id="sanji"  ></span>公里；
                                四级<span  id="siji"  ></span>公里。
                            </td>
                        </tr>
                        <tr style="height: 35px;">
                            <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                color: #009ACD; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                padding-right: 5px;">
                                未开工里程（公里）
                            </td>
                            <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                                border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;" colspan="5">
                                <span id="wkglc"  ></span>
                            </td>
                        </tr>
                        
                         <tr style="height: 35px;">
                            <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                color: #009ACD; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                 padding-right: 5px;">
                                情况说明
                            </td>
                            <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                                border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;" colspan="5">
                                <label id="qksm"></label>
                            </td>
                        </tr>
                        <tr style="height: 35px;">
                            <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                 padding-right: 5px;">
                                &nbsp;<b><font color="#009ACD" style="cursor: hand; font-size: 12px">上报时间</font></b>
                            </td>
                            <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                                border-bottom: 1px solid #C0C0C0;  text-align: left; padding-left: 10px;">
                                <label id="sbsj"></label>
                            </td>
                            <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                 padding-right: 5px;">
                                <b><font color="#009ACD" style="cursor: hand; font-size: 12px">月报月份</font></b>
                            </td>
                            <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                                border-bottom: 1px solid #C0C0C0;  text-align: left; padding-left: 10px;" colspan="3">
                                <label id="sbyf"></label>
                            </td>
                        </tr>
                     <tr style="height: 25px;">
                        <td colspan="6" style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                            color: #55BEEE; font-weight: bold; font-size: small; text-align: left; background-color: #F1F8FF;
                             padding-left: 10px;">
                            月报审核信息
                        </td>
                    </tr>
                    <tr style="height: 35px;">
                        <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                            padding-right: 5px; color: #007DB3; font-weight: bold; font-size: small; text-align: right;
                            background-color: #F1F8FF;">
                            <b><font color="#009ACD" style="cursor: hand; font-size: 12px">审核状态</font></b>
                        </td>
                        <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                            border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;">
                            <label id="shzt"></label>
                            &nbsp;
                        </td>
                        <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                            padding-right: 5px; color: #007DB3; font-weight: bold; font-size: small; text-align: right;
                            background-color: #F1F8FF;">
                            <b><font color="#009ACD" style="cursor: hand; font-size: 12px">审核人</font></b>
                        </td>
                        <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                            border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;">
                            <label id="shuser"></label>
                            &nbsp;
                        </td>
                        <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                            padding-right: 5px; color: #007DB3; font-weight: bold; font-size: small; text-align: right;
                            background-color: #F1F8FF;">
                            <b><font color="#009ACD" style="cursor: hand; font-size: 12px">审核时间</font></b>
                        </td>
                        <td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0;
                            text-align: left; padding-left: 10px;" class="style3">
                            <label id="shtime"></label>
                            &nbsp;
                        </td>
                    </tr>
                    <tr style="height: 35px;">
                        <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                            padding-right: 5px; color: #007DB3; font-weight: bold; font-size: small; text-align: right;
                            background-color: #F1F8FF;">
                            <b><font color="#009ACD" style="cursor: hand; font-size: 12px">综规处审核状态</font></b>
                        </td>
                        <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                            border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;">
                            <label id="zgshzt"></label>
                            &nbsp;
                        </td>
                        <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                            padding-right: 5px; color: #007DB3; font-weight: bold; font-size: small; text-align: right;
                            background-color: #F1F8FF;">
                            <b><font color="#009ACD" style="cursor: hand; font-size: 12px">综规处审核人</font></b>
                        </td>
                        <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                            border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;">
                            <label id="zgshuser"></label>
                            &nbsp;
                        </td>
                        <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                            padding-right: 5px; color: #007DB3; font-weight: bold; font-size: small; text-align: right;
                            background-color: #F1F8FF;">
                            <b><font color="#009ACD" style="cursor: hand; font-size: 12px">综规处审核时间</font></b>
                        </td>
                        <td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0;
                            text-align: left; padding-left: 10px;" class="style3">
                            <label id="zgshtime"></label>
                            &nbsp;
                        </td>
                    </tr>
                   
                    <tr style="height: 35px;">
                        <td style="font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                            padding-right: 5px; border-bottom: 1px solid #C0C0C0;" class="style2">
                            <b><font color="#009ACD" style="cursor: hand; font-size: 12px">综规处审核意见</font></b>
                        </td>
                        <td colspan="5" style="border-left: 1px solid #C0C0C0; border-right: 1px none #C0C0C0;
                            border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; text-align: left;
                            padding-left: 10px;" class="style3">
                            <label id="zgshyj"></label>
                            &nbsp;
                        </td>
                    </tr>
                    <tr style="height: 35px;">
                        <td style="font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                            padding-right: 5px; border-bottom: 1px solid #C0C0C0;" class="style2">
                            <b><font color="#009ACD" style="cursor: hand; font-size: 12px">相关处室意见</font></b>
                        </td>
                        <td colspan="5" style="border-left: 1px solid #C0C0C0; border-right: 1px none #C0C0C0;
                            border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; text-align: left;
                            padding-left: 10px;" class="style3">
                            <label id="xgcsyj"></label>
                            &nbsp;
                        </td>
                    </tr>
                    <tr style="height: 35px;">
                        <td style="font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                            padding-right: 5px;" class="style2">
                            <b><font color="#009ACD" style="cursor: hand; font-size: 12px">财审处意见</font></b>
                        </td>
                        <td colspan="5" style="border-left: 1px solid #C0C0C0; border-right: 1px none #C0C0C0;
                            border-top: 1px none #C0C0C0; text-align: left; padding-left: 10px;" class="style3">
                            <label id="cscyj"></label>
                            &nbsp;
                        </td>
                    </tr>
                </table>
                    <table width="100%" border="0" style="border-style: solid; border-width: 3px 1px 1px 1px;
                        margin-top: 20px; border-color: #55BEEE #C0C0C0 #C0C0C0 #C0C0C0; height: 45px;"
                        cellspacing="0" cellpadding="0">
                        <tr style="height: 30px;">
                            <td align="center">
                                <img src="${pageContext.request.contextPath}/images/Button/fanhui1.GIF" id="Img2" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/fanhui2.GIF'" alt="返回" onmouseout="this.src='${pageContext.request.contextPath}/images/Button/fanhui1.GIF'" onclick="closes('wqxx')" style="cursor: hand" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </div>
</body>
</html>
