<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>危桥改造月报信息</title>
	<link href="${pageContext.request.contextPath}/css/searchAndNavigation.css" type="text/css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/icon.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="js/wqgz.js"></script>
	<script type="text/javascript">
		$(function(){
			var ybdata=parent.obj;
			$("#cgsdwzj").text(ybdata.cgsdwzj);
			$("#tbr").text(ybdata.tbr);
			$("#tbsj").text(ybdata.tbsj);
			$("#tbyf").text(ybdata.tbyf);
			$("#stz").text(ybdata.stz);
			$("#wc_btz").text(ybdata.wc_btz);
			$("#wc_stz").text(ybdata.wc_stz);
			$("#wc_qttz").text(ybdata.wc_qttz);
			$("#zjdw_btz").text(ybdata.zjdw_btz);
			$("#zjdw_stz").text(ybdata.zjdw_stz);
			$("#zjdw_qttz").text(ybdata.zjdw_qttz);
			$("#bywcmc").text(ybdata.bywcmc);
			$("#kgdl").text(ybdata.kgdl);
			$("#qksm").text(ybdata.qksm);
			$("#wcqk").text(ybdata.wcqk);
			$("#sbsj").text(ybdata.sbsj);
			$("#sbyf").text(ybdata.sbyf);
			
			$("#shzt").text(ybdata.shzt);
			$("#shuser").text(ybdata.shuser);
			if(ybdata.shtime!=null)
			$("#shtime").text(ybdata.shtime);
			else $("#shtime").text('');
			$("#zjje").text(ybdata.zjje);
			$("#xgcsyj").text(ybdata.xgcsyj);
			$("#cscyj").text(ybdata.cscyj);
			$("#zjc").html(ybdata.zjc);
			$("#xbgz").html(ybdata.xbgz);
			$("#sbjg").html(ybdata.sbjg);
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
                                width: 25%; padding-left: 10px;">
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
                                <b><font color="#009ACD" style=" font-size: 12px">填报人</font></b>
                            </td>
                            <td style="border-bottom: 1px solid #C0C0C0; border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0;
                                border-top: 1px none #C0C0C0;  text-align: left; padding-left: 10px;">
                                <label id="tbr"></label>
                                &nbsp;
                            </td>
                            <td style="border-bottom: 1px solid #C0C0C0; font-weight: bold; font-size: small;
                                text-align: right; background-color: #F1F8FF;  padding-right: 5px;">
                                <b><font color="#009ACD" style=" font-size: 12px">填报时间</font></b>
                            </td>
                            <td style="border-bottom: 1px solid #C0C0C0; border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0;
                                border-top: 1px none #C0C0C0;  text-align: left; padding-left: 10px;">
                                <label id="tbsj"></label>
                                &nbsp;
                            </td>
                            <td style="border-bottom: 1px solid #C0C0C0; font-weight: bold; font-size: small;
                                text-align: right; background-color: #F1F8FF;  padding-right: 5px;">
                                <b><font color="#009ACD" style=" font-size: 12px">填报月份</font></b>
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
                                color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                 padding-right: 5px; ">
                                <b><font color="#009ACD" style=" font-size: 12px">本月完成投资</font></b>
                            </td>
                            <td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0;
                                text-align: left; padding-left: 10px;" colspan="5">
                               <div>
                               <table>
                                <tr>
                                <td style="width: 157px;">部投资：<span style="width: 50px" id="wc_btz"   ></span></td>
                                <td style="width: 157px;">省投资：<span style="width: 50px" id="wc_stz" ></span></td>
                                <td style="width: 157px;">其他投资：<span style="width: 50px" id="wc_qttz"   ></span></td>
                                </tr>
                                </table>
                                </div>
                            </td>
                        </tr>
                        <tr style="height: 35px;">
                            <td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0;
                                border-bottom: 1px solid #C0C0C0; color: #009ACD; font-weight: bold; font-size: small;
                                text-align: right; background-color: #F1F8FF; padding-right: 5px;" class="style1">
                                本月资金到位
                            </td>
                            <td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0;
                                text-align: left; padding-left: 10px;" colspan="5" class="style2">
                                 <div>
                                <table>
                                <tr>
                                <td style="width: 157px;">部投资：<span style="width: 50px" id="zjdw_btz" ></span></td>
                                <td style="width: 157px;">省投资：<span style="width: 50px"  id="zjdw_stz" ></span></td>
                                <td style="width: 157px;">其他投资：<span style="width: 50px" id="zjdw_qttz"  ></span></td>
                                </tr>
                                </table>
                                </div>
                            </td>
                        </tr>
                       <!--  <tr style="height: 35px;">
                            <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                 padding-right: 5px;">
                                <b><font color="#009ACD" style=" font-size: 12px">本月完成面层（公里）</font></b>
                            </td>
                            <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                                border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;" colspan="5">
                                <label id="bywcmc"></label>
                                公里
                            </td>
                        </tr> -->
                       <!--  <tr style="height: 35px;">
                            <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                 padding-right: 5px;">
                                <b><font color="#009ACD" style=" font-size: 12px">截至开工段落</font></b>
                            </td>
                            <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                                border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;" colspan="5">
                                <label id="kgdl"></label>
                            </td>
                        </tr> -->
                           <tr style="height: 35px;">
                            <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                padding-right: 5px;">
                                <b><font color="#009ACD" style=" font-size: 12px">桥梁基础(%)</font></b>
                            </td>
                            <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                                border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;" >
                              <span id='zjc'></span>
                            </td>
                             <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                 padding-right: 5px;">
                                <b><font color="#009ACD" style=" font-size: 12px;width: 35px;">下部构造(桥台、桥墩)：</font></b>
                            </td>
                            <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                                border-bottom: 1px solid #C0C0C0;  text-align: left; padding-left: 10px;" >
                                <span id='xbgz'></span>%
                            </td>
                            <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                padding-right: 5px;">
                                <b><font color="#009ACD" style=" font-size: 12px">上部结构(%)：</font></b>
                            </td>
                            <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                                border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;" >
                                <span id='sbjg'></span>
                            </td>
                        </tr>
                        <tr style="height: 35px;">
                            <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                 padding-right: 5px;">
                                <b><font color="#009ACD" style=" font-size: 12px">情况说明</font></b>
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
                                <b><font color="#009ACD" style=" font-size: 12px">本月完成情况</font></b>
                            </td>
                            <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                                 text-align: left; padding-left: 10px;">
                                <label id="wcqk"></label>
                                % &nbsp;
                            </td>
                            <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                 padding-right: 5px;">
                                <b><font color="#009ACD" style=" font-size: 12px">上报时间</font></b>
                            </td>
                            <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                                 text-align: left; padding-left: 10px;">
                                <label id="sbsj"></label>
                                &nbsp;
                            </td>
                            <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                color: #009ACD; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                 padding-right: 5px;">
                                <b><font color="#009ACD" style=" font-size: 12px">月报月份</font></b>
                            </td>
                            <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;  text-align: left;
                                padding-left: 10px;">
                                <label id="sbyf"></label>
                                &nbsp;
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
                                <b><font color="#009ACD" style=" font-size: 12px">审核状态</font></b>
                            </td>
                            <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                                border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;">
                                <label id="shzt"></label>
                                &nbsp;
                            </td>
                            <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                padding-right: 5px; color: #007DB3; font-weight: bold; font-size: small; text-align: right;
                                background-color: #F1F8FF;">
                                <b><font color="#009ACD" style=" font-size: 12px">审核人</font></b>
                            </td>
                            <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                                border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;">
                                <label id="shuser"></label>
                                &nbsp;
                            </td>
                            <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                padding-right: 5px; color: #007DB3; font-weight: bold; font-size: small; text-align: right;
                                background-color: #F1F8FF;">
                                <b><font color="#009ACD" style=" font-size: 12px">审核时间</font></b>
                            </td>
                            <td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0;
                                text-align: left; padding-left: 10px;" class="style3">
                                <label id="shtime"></label>
                                &nbsp;
                            </td>
                        </tr>
                       
                        <tr style="height: 35px;">
                            <td style="font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                padding-right: 5px; border-bottom: 1px solid #C0C0C0;" class="style2">
                                <b><font color="#009ACD" style=" font-size: 12px">相关处室意见</font></b>
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
                                <b><font color="#009ACD" style=" font-size: 12px">审核意见</font></b>
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
