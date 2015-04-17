<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>危桥改造月报编辑</title>
	<link href="${pageContext.request.contextPath}/css/searchAndNavigation.css" type="text/css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/icon.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="../../../../js/util/jquery.cookie.js"></script>
	<script type="text/javascript" src="js/abgc.js"></script>
	<script type="text/javascript">
		$(function(){
			var data=parent.obj;
			$("#sh_btz").text(data.zjdw_btz);
			
		});
		function checkZJ(aa){
			var str=aa.value;
			var g = /^\d+(?=\.{0,1}\d+$|$)/;
		    if( !g.test(str)){
		    	alert("请输入正确的金额");
		    	$(aa).val('');
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
		<table width="99%" border="0" style="margin-top: 1px; margin-left: 1px;" cellspacing="0" cellpadding="0">
            <tr>
                <td>
                    <br />
                    <table width="100%" border="0" style="border-style: solid; border-width: 3px 1px 1px 1px;
                        border-color: #55BEEE #C0C0C0 #C0C0C0 #C0C0C0; height: 45px;" cellspacing="0"
                        cellpadding="0">
<!--                         <tr style="height: 35px;"> -->
<!--                             <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; -->
<!-- /*                                 color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; */ -->
<!--                                 width: 30%; padding-right: 5px;"> -->
<!--                                 <b><font color="#009ACD" style="cursor: hand; font-size: 12px">部投资（万元）</font></b> -->
<!--                             </td> -->
<!--                             <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; -->
<!--                                 border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;" colspan="5"> -->
<!--                               <span id="sh_btz" ></span> -->
                             
<!--                             </td> -->
<!--                         </tr> -->
<!--                         <tr style="height: 35px;"> -->
<!--                             <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; -->
<!-- /*                                 color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; */ -->
<!--                                 padding-right: 5px;"> -->
<!--                                 <font color="#009ACD" style="cursor: hand; font-size: 12px">追加资金（万元） -->
<!--                             </td> -->
<!--                             <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; -->
<!--                                 border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;" colspan="5"> -->
<!--                               <input style="width: 50px" type="text" id="tj_zjje"  value="0" onblur="checkZJ(this)"/>&nbsp;&nbsp;&nbsp;&nbsp; -->
                              
<!--                             </td> -->
<!--                         </tr> -->
                        <tr style="height: 35px;">
                            <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                padding-right: 5px;">
                                <b><font color="#009ACD" style="cursor: hand; font-size: 12px">相关处室意见</font></b>
                            </td>
                            <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                                border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;" colspan="5">
                                <input name="BYWCMC" type="text" id="tj_xgcsyj" style="width: 150px;" value="同意" />
                            </td>
                        </tr>
<!--                         <tr style="height: 35px;"> -->
<!--                             <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; -->
<!-- /*                                 color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; */ -->
<!--                                 padding-right: 5px;"> -->
<!--                                 <b><font color="#009ACD" style="cursor: hand; font-size: 12px">财审处意见：</font></b> -->
<!--                             </td> -->
<!--                             <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; -->
<!--                                 border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;" colspan="5"> -->
<!--                                 <input name="JZKGDL" type="text" id="tj_cscyj" style="width: 150px;" value="同意"/> -->
<!--                             </td> -->
<!--                         </tr> -->
                       
                    </table>
                    <table width="100%" border="0" style="border-style: solid; border-width: 3px 1px 1px 1px;
                        margin-top: 20px; border-color: #55BEEE #C0C0C0 #C0C0C0 #C0C0C0; height: 45px;"
                        cellspacing="0" cellpadding="0">
                        <tr style="height: 30px;">
                            <td align="center">
                                <img src="${pageContext.request.contextPath}/images/Button/baocun1.gif" id="Img1" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/baocun2.gif'" alt="保存" onmouseout="this.src='${pageContext.request.contextPath}/images/Button/baocun1.gif'" style="cursor: hand" onclick="shabgcyb();" />
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
