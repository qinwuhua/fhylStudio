<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>工程改造路面改建月报编辑</title>
	<link href="${pageContext.request.contextPath}/css/searchAndNavigation.css" type="text/css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/icon.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="js/gcgzgj.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YMLib.js"></script>
	<script type="text/javascript">
	$(function(){
		var data=parent.obj;
		$("#xg_wc_btz").val(data.wc_btz);
		$("#xg_wc_stz").val(data.wc_stz);
		$("#xg_wc_qttz").val(data.wc_qttz);
		$("#xg_zjdw_btz").val(data.zjdw_btz);
		$("#xg_zjdw_stz").val(data.zjdw_stz);
		$("#xg_zjdw_qttz").val(data.zjdw_qttz);
		$("#xg_bywcdc").val(data.bywcdc);
		$("#xg_bywcjc").val(data.bywcjc);
		$("#xg_bywcmc").val(data.bywcmc);
		$("#xg_kgdl").val(data.kgdl);
		$("#xg_qksm").val(data.qksm);
		$("#xg_wcqk").val(data.wcqk);
		$("#xg_sbsj").text(data.sbsj);
		$("#xg_sbyf").text(data.sbyf);
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
                    <tr style="height: 35px;">
                        <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                            color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                            width: 20%; padding-right: 5px;">
                            <b><font color="#009ACD" style="cursor: hand; font-size: 12px">本月完成投资（万元）</font></b>
                        </td>
                        <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                            border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;" colspan="5">
                            部投资：<input type="text" id="xg_wc_btz" style="width: 50px;"/>&nbsp;&nbsp;&nbsp;&nbsp; 省投资：<input type="text" id="xg_wc_stz"  style="width: 50px;"/>&nbsp;&nbsp;&nbsp;&nbsp; 其他投资：<input type="text" id="xg_wc_qttz"  style="width: 50px;"/>&nbsp;&nbsp;&nbsp;&nbsp;
                        </td>
                    </tr>
                    <tr style="height: 35px;">
                        <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                            color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                            width: 20%; padding-right: 5px;">
                            <b><font color="#009ACD" style="cursor: hand; font-size: 12px">本月资金到位（万元）</font></b>
                        </td>
                        <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                            border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;" colspan="5">
                            部投资：<input name="ZJ_BTZ" type="text" id="xg_zjdw_btz"  style="width: 50px;"/>&nbsp;&nbsp;&nbsp;&nbsp;
                            省投资：<input name="ZJ_STZ" type="text" id="xg_zjdw_stz"  style="width: 50px;"/>&nbsp;&nbsp;&nbsp;&nbsp; 其他投资：<input type="text" id="xg_zjdw_qttz" style="width: 50px;"/>&nbsp;&nbsp;&nbsp;&nbsp;
                        </td>
                    </tr>
                    <tr style="height: 35px;">
                        <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                            color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                            width: 20%; padding-right: 5px;">
                            <b><font color="#009ACD" style="cursor: hand; font-size: 12px">截至开工段落：</font></b>
                        </td>
                        <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                            border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;" colspan="5">
                            <input name="JZKGDL" type="text" id="xg_kgdl" style="width: 50px;" />
                        </td>
                    </tr>
                    <tr style="height: 35px;">
                        <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                            color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                            width: 20%; padding-right: 5px;">
                            <b><font color="#009ACD" style="cursor: hand; font-size: 12px">情况说明：</font></b>
                        </td>
                        <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                            border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;" colspan="5">
                            <input name="QKSM" type="text" id="xg_qksm" style="width: 50px;" />
                        </td>
                    </tr>
                    <tr style="height: 35px;">
                        <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                            color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                            width: 20%; padding-right: 5px;">
                            <font color="#009ACD" style="cursor: hand; font-size: 12px">本月完成垫层（m³）
                        </td>
                        <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                            border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;">
                            <input name="BYWCDC" type="text" id="xg_bywcdc"  style="width: 50px;"/>
                        </td>
                        <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                            color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                            width: 20%; padding-right: 5px;">
                            <font color="#009ACD" style="cursor: hand; font-size: 12px">本月完成基层（m³）
                        </td>
                        <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                            border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;">
                            <input name="BYWCJC" type="text" id="xg_bywcjc"  style="width: 50px;"/>
                        </td>
                        <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                            color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                            width: 20%; padding-right: 5px;">
                            <font color="#009ACD" style="cursor: hand; font-size: 12px">本月完成面层（公里）
                        </td>
                        <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                            border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;">
                            <input name="BYWCMC" type="text" id="xg_bywcmc"  style="width: 50px;"/>
                        </td>
                    </tr>
                    <tr style="height: 35px;">
                        <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                            color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                            width: 20%; padding-right: 5px;">
                            <b><font color="#009ACD" style="cursor: hand; font-size: 12px">本月完成情况（%）：</font></b>
                        </td>
                        <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                            border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;">
                            <input name="BYWCQK" type="text" id="xg_wcqk"  style="width: 50px;"/>
                        </td>
                        <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                            color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                            width: 20%; padding-right: 5px;">
                            <b><font color="#009ACD" style="cursor: hand; font-size: 12px">上报时间：</font></b>
                        </td>
                        <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                            border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;">
                            <span id="xg_sbsj"></span>
                        </td>
                        <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                            color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                            width: 20%; padding-right: 5px;">
                            <b><font color="#009ACD" style="cursor: hand; font-size: 12px">月报月份：</font></b>
                        </td>
                        <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                            border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;">
                            <span id="xg_sbyf"></span>
                        </td>
                    </tr>
                </table>
                    <table width="100%" border="0" style="border-style: solid; border-width: 3px 1px 1px 1px;
                        margin-top: 20px; border-color: #55BEEE #C0C0C0 #C0C0C0 #C0C0C0; height: 45px;"
                        cellspacing="0" cellpadding="0">
                        <tr style="height: 30px;">
                            <td align="center">
                                <img src="${pageContext.request.contextPath}/images/Button/baocun1.gif" id="Img1" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/baocun2.gif'" alt="保存" onmouseout="this.src='${pageContext.request.contextPath}/images/Button/baocun1.gif'" style="cursor: hand" onclick="xggcgzgjyb();" />
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
