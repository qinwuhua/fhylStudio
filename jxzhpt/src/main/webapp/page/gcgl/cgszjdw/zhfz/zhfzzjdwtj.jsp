<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>资金到位情况</title>
	<link href="${pageContext.request.contextPath}/css/searchAndNavigation.css" type="text/css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/icon.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="js/zhfz.js"></script>
	<script type="text/javascript" src="../../../../js/util/jquery.cookie.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YMLib.js"></script>
	<script type="text/javascript">
	$(function(){
		var myDate = new Date();
		var y = myDate.getFullYear();
		var m = myDate.getMonth()+1;       //获取当前月份(0-11,0代表1月)
		var d = myDate.getDate();
		tbsj = y+"-"+m+"-"+d;
		tbyf = y+"-"+m;
		$("#tj_tbr").text($.cookie("truename"));
		$("#tj_tbsj").val(tbsj);
//		$("#tj_tbyf").text(tbyf);
		var mystr='';
		var mystr1='';
		var mystr2='';
		var mystr3='';
		var mystr4='';
		if(m==1){
			mystr=y+'-'+m;
			mystr1=(y-1)+'-'+11;
			mystr2=(y-1)+'-'+12;
			mystr3=(y-1)+'-'+10;
			mystr4=(y-1)+'-'+9;
		}
		else if(m==2){
			mystr=y+'-'+m;
			mystr1=(y-1)+'-'+12;
			mystr2=y+'-'+1;
			mystr3=(y-1)+'-'+11;
			mystr4=(y-1)+'-'+10;
		}else if(m==3){
			mystr=y+'-'+m;
			mystr1=y+'-'+1;
			mystr2=y+'-'+2;
			mystr3=(y-1)+'-'+12;
			mystr4=(y-1)+'-'+11;
		}else if(m==4){
			mystr=y+'-'+m;
			mystr1=y+'-'+2;
			mystr2=y+'-'+3;
			mystr3=y+'-'+1;
			mystr4=(y-1)+'-'+12;
		}else{
			mystr=y+'-'+m;
			mystr1=y+'-'+(m-2);
			mystr2=y+'-'+(m-1);
			mystr3=y+'-'+(m-3);
			mystr4=y+'-'+(m-4);
		}

		$("#tj_tbyf").append("<option id="+mystr+" value="+mystr+" selected='selected'>"+mystr+"</option>");
		$("#tj_tbyf").append("<option id="+mystr2+" value="+mystr2+">"+mystr2+"</option>");
		$("#tj_tbyf").append("<option id="+mystr1+" value="+mystr1+">"+mystr1+"</option>");
		$("#tj_tbyf").append("<option id="+mystr1+" value="+mystr3+">"+mystr3+"</option>");
		$("#tj_tbyf").append("<option id="+mystr1+" value="+mystr4+">"+mystr4+"</option>");
	});
	function checkZJ(str1){
		var str=str1.value;
		var g = /(^-?\d+$)|(^(-?\d+)(\.\d+)?$)/;
		if(str=='')
			return;
	    if( !g.test(str)){
	    	alert("请输入正确的金额");
	    	$(str1).val('');
	    }
	}
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
	<table width="99%" border="0"
		style="margin-top: 1px; margin-left: 1px;" cellspacing="0"
		cellpadding="0">

            <tr>
                <td>
                    <br />
                   <table width="100%" border="0" style="border-style: solid; border-width: 3px 1px 1px 1px;
                            border-color: #55BEEE #C0C0C0 #C0C0C0 #C0C0C0; height: 45px;" cellspacing="0"
                            cellpadding="0">
                            <tr style="height: 35px;">
                                <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                padding-right: 5px;">
                                    <font color="#009ACD" style="font-size: 12px">车购税： </font>
                                </td>
                                <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                                border-bottom: 1px solid #C0C0C0;  text-align: left; padding-left: 10px;" >
                                    <input onblur="checkZJ(this)" name="txtCGSZJDW" type="text" id="tj_cgsdwzj"  style="width: 50px" value="0"/>万元
                                </td>
                                <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                padding-right: 5px;">
                                    <font color="#009ACD" style="font-size: 12px">拨付省投资： </font>
                                </td>
                                <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                                border-bottom: 1px solid #C0C0C0;  text-align: left; padding-left: 10px;" colspan="3">
                                    <input onblur="checkZJ(this)" name="txtCGSZJDW" type="text" id="tj_stz"  style="width: 50px" value="0"/>万元
                                </td>
                            </tr>
                            <tr style="height: 35px;">
                                <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                padding-right: 5px;">
                                    <font color="#009ACD" style="font-size: 12px">审核意见： </font>
                                </td>
                                <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                                border-bottom: 1px solid #C0C0C0;  text-align: left; padding-left: 10px;" colspan="5">
                                    <input name="txtCGSZJDW" type="text" id="tj_cscyj"  style="width: 350px" value="同意"/>
                                </td>
                            </tr>
                        <tr style="height: 35px;">
                            <td style="color: #007DB3; font-weight: bold; font-size: small; text-align: right;
                                background-color: #F1F8FF;  padding-right: 5px;">
                                <b><font color="#009ACD" style="cursor: hand; font-size: 12px">填报人：</font></b>
                            </td>
                            <td style="border-left: 1px solid #C0C0C0;  text-align: left; padding-left: 10px;">
                                <span id="tj_tbr"></span>&nbsp;
                            </td>
                            <td style="border-left: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small;
                                text-align: right; background-color: #F1F8FF;  padding-right: 5px;">
                                <b><font color="#009ACD" style="cursor: hand; font-size: 12px">填报时间：</font></b>
                            </td>
                            <td style="border-left: 1px solid #C0C0C0;  text-align: left; padding-left: 10px;">
                                <input type='text' id="tj_tbsj">&nbsp;
                            </td>
                            <td style="border-left: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small;
                                text-align: right; background-color: #F1F8FF;  padding-right: 5px;">
                                <b><font color="#009ACD" style="cursor: hand; font-size: 12px">月报月份：</font></b>
                            </td>
                            <td style="border-left: 1px solid #C0C0C0;  text-align: left; padding-left: 10px;">
                                <select id="tj_tbyf"></select>&nbsp;
                            </td>
                        </tr>
                    </table>
                        <table width="100%" border="0" style="border-style: solid; border-width: 3px 1px 1px 1px;
                            margin-top: 20px; border-color: #55BEEE #C0C0C0 #C0C0C0 #C0C0C0; height: 45px;"
                            cellspacing="0" cellpadding="0">
                            <tr style="height: 30px;">
                                <td align="center">
                                    <input type="image" name="btnAdd" id="btnAdd" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/baocun2.gif'" alt="保存" onmouseout="this.src='${pageContext.request.contextPath}/images/Button/baocun1.gif'" src="${pageContext.request.contextPath}/images/Button/baocun1.gif" style="border-width:0px;" onclick="tjzhfzcgs()"/>
                                    &nbsp;
                                    <input onclick="closes('wqxx')" type="image" name="btnCancel" id="btnCancel" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/fanhui2.GIF'" alt="返回" onmouseout="this.src='${pageContext.request.contextPath}/images/Button/fanhui1.GIF'" src="${pageContext.request.contextPath}/images/Button/fanhui1.GIF" style="border-width:0px;" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
	</body>
</html>