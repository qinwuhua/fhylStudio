<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>工程改造路面改建月报信息</title>
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
			$('#gydw').combotree({   
				url:"js/gydw.json"
			}); 
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
                                width: 15%; padding-left: 10px;">
                                车购税资金到位情况
                            </td>
                        </tr>
                        <tr style="height: 30px;">
                            <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                width: 15%; padding-right: 5px;">
                                车购税资金到位
                            </td>
                            <td style="border-left: 1px solid #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0;
                                border-bottom: 1px solid #C0C0C0; width: 18%; text-align: left; padding-left: 10px;"
                                colspan="5">
                                <span id="lblCGS">43</span>
                            </td>
                        </tr>
                        <tr style="height: 35px;">
                            <td style="border-bottom: 1px solid #C0C0C0; font-weight: bold; font-size: small;
                                text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
                                <b><font color="#009ACD" style="cursor: hand; font-size: 12px">填报人</font></b>
                            </td>
                            <td style="border-bottom: 1px solid #C0C0C0; border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0;
                                border-top: 1px none #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
                                <label id="lblTBR">admin</label>
                                &nbsp;
                            </td>
                            <td style="border-bottom: 1px solid #C0C0C0; font-weight: bold; font-size: small;
                                text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
                                <b><font color="#009ACD" style="cursor: hand; font-size: 12px">填报时间</font></b>
                            </td>
                            <td style="border-bottom: 1px solid #C0C0C0; border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0;
                                border-top: 1px none #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
                                <label id="lblTBSJ">2014-09-20</label>
                                &nbsp;
                            </td>
                            <td style="border-bottom: 1px solid #C0C0C0; font-weight: bold; font-size: small;
                                text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
                                <b><font color="#009ACD" style="cursor: hand; font-size: 12px">填报月份</font></b>
                            </td>
                            <td style="border-bottom: 1px solid #C0C0C0; border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                                width: 19%; text-align: left; padding-left: 10px;">
                                <label id="lblTBYF">2014-09</label>
                                &nbsp;
                            </td>
                        </tr>
                        <tr style="height: 25px;">
                            <td colspan="6" style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                color: #55BEEE; font-weight: bold; font-size: small; text-align: left; background-color: #F1F8FF;
                                width: 15%; padding-left: 10px;">
                                月报详细信息
                            </td>
                        </tr>
                        <tr style="height: 35px;">
                            <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                width: 15%; padding-right: 5px;">
                                <b><font color="#009ACD" style="cursor: hand; font-size: 12px">本月完成投资</font></b>
                            </td>
                            <td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0;
                                text-align: left; padding-left: 10px;" colspan="5">
                                <b>部投资</b>：<label id="WC_BTZ">1</label>万元&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <b>省投资</b>：<label id="WC_STZ">1</label>万元&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <b>其他投资</b>：<label id="WC_QTTZ">1</label>万元&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            </td>
                        </tr>
                        <tr style="height: 35px;">
                            <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                width: 15%; padding-right: 5px;">
                                <b><font color="#009ACD" style="cursor: hand; font-size: 12px">本月资金到位</font></b>
                            </td>
                            <td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0;
                                text-align: left; padding-left: 10px;" colspan="5">
                                <b>部投资</b>：<label id="ZJ_BTZ">43</label>万元&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <b>省投资</b>：<label id="ZJ_STZ">1</label>万元&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <b>其他投资</b>：<label id="ZJ_QTTZ">1</label>万元&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            </td>
                        </tr>
                        <tr style="height: 35px;">
                            <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                width: 15%; padding-right: 5px;">
                                <b><font color="#009ACD" style="cursor: hand; font-size: 12px">截至开工段落：</font></b>
                            </td>
                            <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                                border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;" colspan="5">
                                <label id="JZKGDL">1</label>
                            </td>
                        </tr>
                        <tr style="height: 35px;">
                            <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                width: 15%; padding-right: 5px;">
                                <b><font color="#009ACD" style="cursor: hand; font-size: 12px">情况说明：</font></b>
                            </td>
                            <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                                border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;" colspan="5">
                                <label id="QKSM">1</label>
                            </td>
                        </tr>
                        <tr style="height: 35px;">
                            <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                color: #009ACD; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                width: 15%; padding-right: 5px;">
                                本月完成垫层
                            </td>
                            <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                                border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
                                <label id="BYWCDC">1</label>m³
                            </td>
                            <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                color: #009ACD; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                width: 15%; padding-right: 5px;">
                                本月完成基层
                            </td>
                            <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                                border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
                                <label id="BYWCJC">1</label>m³
                            </td>
                            <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                color: #009ACD; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                width: 15%; padding-right: 5px;">
                                本月完成面层
                            </td>
                            <td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0;
                                width: 19%; text-align: left; padding-left: 10px;">
                                <label id="BYWCMC">1</label>公里
                            </td>
                        </tr>
                        <tr style="height: 35px;">
                            <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                width: 15%; padding-right: 5px;">
                                <b><font color="#009ACD" style="cursor: hand; font-size: 12px">本月完成情况：</font></b>
                            </td>
                            <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                                border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
                                <label id="BYWCQK">1</label>%
                            </td>
                            <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                width: 15%; padding-right: 5px;">
                                <b><font color="#009ACD" style="cursor: hand; font-size: 12px">上报时间：</font></b>
                            </td>
                            <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                                border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
                                <label id="SBSJ">2014-09-20</label>
                            </td>
                            <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                width: 15%; padding-right: 5px;">
                                <b><font color="#009ACD" style="cursor: hand; font-size: 12px">月报月份：</font></b>
                            </td>
                            <td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0;
                                width: 19%; text-align: left; padding-left: 10px;">
                                <label id="SBYF">2014-09</label>
                            </td>
                        </tr>
                        <tr style="height: 25px;">
                            <td colspan="6" style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                color: #55BEEE; font-weight: bold; font-size: small; text-align: left; background-color: #F1F8FF;
                                width: 15%; padding-left: 10px;">
                                月报审核信息
                            </td>
                        </tr>
                        <tr style="height: 35px;">
                            <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                padding-right: 5px; color: #007DB3; font-weight: bold; font-size: small; text-align: right;
                                background-color: #F1F8FF;">
                                <b><font color="#009ACD" style="cursor: hand; font-size: 12px">审核状态：</font></b>
                            </td>
                            <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                                border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;">
                                <label id="SHZT">已审核</label>
                                &nbsp;
                            </td>
                            <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                padding-right: 5px; color: #007DB3; font-weight: bold; font-size: small; text-align: right;
                                background-color: #F1F8FF;">
                                <b><font color="#009ACD" style="cursor: hand; font-size: 12px">审核人：</font></b>
                            </td>
                            <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                                border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;">
                                <label id="SHR">admin</label>
                                &nbsp;
                            </td>
                            <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                padding-right: 5px; color: #007DB3; font-weight: bold; font-size: small; text-align: right;
                                background-color: #F1F8FF;">
                                <b><font color="#009ACD" style="cursor: hand; font-size: 12px">审核时间：</font></b>
                            </td>
                            <td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0;
                                text-align: left; padding-left: 10px;" class="style3">
                                <label id="SHSJ">2014-09-20</label>
                                &nbsp;
                            </td>
                        </tr>
                        <tr style="height: 35px;">
                            <td style="font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                padding-right: 5px; border-bottom: 1px solid #C0C0C0;" class="style2">
                                <b><font color="#009ACD" style="cursor: hand; font-size: 12px">追加金额：</font></b>
                            </td>
                            <td colspan="5" style="border-left: 1px solid #C0C0C0; border-right: 1px none #C0C0C0;
                                border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; text-align: left;
                                padding-left: 10px;" class="style3">
                                <label id="ZJJE">22</label>
                                万元 &nbsp;
                            </td>
                        </tr>
                        <tr style="height: 35px;">
                            <td style="font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                padding-right: 5px; border-bottom: 1px solid #C0C0C0;" class="style2">
                                <b><font color="#009ACD" style="cursor: hand; font-size: 12px">相关处室意见：</font></b>
                            </td>
                            <td colspan="5" style="border-left: 1px solid #C0C0C0; border-right: 1px none #C0C0C0;
                                border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; text-align: left;
                                padding-left: 10px;" class="style3">
                                <label id="XGCSYJ">4</label>
                                &nbsp;
                            </td>
                        </tr>
                        <tr style="height: 35px;">
                            <td style="font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                padding-right: 5px;" class="style2">
                                <b><font color="#009ACD" style="cursor: hand; font-size: 12px">财审处意见：</font></b>
                            </td>
                            <td colspan="5" style="border-left: 1px solid #C0C0C0; border-right: 1px none #C0C0C0;
                                border-top: 1px none #C0C0C0; text-align: left; padding-left: 10px;" class="style3">
                                <label id="CSCYJ">4</label>
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
    </form>
</body>
</html>
