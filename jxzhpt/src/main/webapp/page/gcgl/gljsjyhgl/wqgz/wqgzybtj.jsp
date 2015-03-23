<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>危桥改造月报上报</title>
	<link href="${pageContext.request.contextPath}/css/searchAndNavigation.css" type="text/css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/icon.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="../../../../js/util/jquery.cookie.js"></script>
	<script type="text/javascript" src="js/wqgz.js"></script>
	<script type="text/javascript">
	var sbsj;
	var sbyf;
	$(function(){
			var myDate = new Date();
			var y = myDate.getFullYear();
			var m = myDate.getMonth()+1;       //获取当前月份(0-11,0代表1月)
			var d = myDate.getDate();
			sbsj = y+"-"+m+"-"+d;
			sbyf = y+"-"+m;
			$("#tj_sbsj").text(sbsj);
			getYuefen();
			//alert(parent.data.wcqk);
			
		});
	var wcqkmax;
	var wcqkmin;
	function chaxun(){
		var data="gcglwqgz.jhid="+parent.parent.obj1.jhid+"&yhtype=wqgz"+"&gcglwqgz.sbyf="+$("#tj_sbyf").find("option:selected").text();
		$.ajax({
			type:'post',
			url:'../../../../gcgl/selectWqgzwcqk.do',
			data:data,
			dataType:'json',
			success:function(msg){
				wcqkmax=msg.wcqkmax;
				wcqkmin=msg.wcqkmin;
				if(wcqkmax==100){
					$("#tj_wcqk").val(">"+msg.wcqkmin+",<="+msg.wcqkmax);
				}else{
					$("#tj_wcqk").val(">"+msg.wcqkmin+",<"+msg.wcqkmax);
				}
				$("#tj_wcqk").attr("style",'color:#CCCCCC;width: 70px;');
			}
		});	
	}
	function getYuefen(){
		//alert(parent.parent.obj1.jhid);
		var data="jhid="+parent.parent.obj1.jhid;
		$.ajax({
			type:'post',
			url:'../../../../gcgl/selectWqgzyf.do',
			data:data,
			dataType:'json',
			success:function(msg){
				for ( var i = 0; i < msg.length; i++){
					$("#tj_sbyf").append("<option value="+msg[i].cgsdwzj+">"+msg[i].tbyf+"</option>");
				}
				$("#tj_zjdw_btz").val(msg[0].cgsdwzj);
				$("#tjbtz").text(msg[0].cgsdwzj);
				chaxun();
			}
		});	
		
	}	
	function setZjDW(){
		$("#tj_zjdw_btz").val($("#tj_sbyf").val());
		$("#tjbtz").text($("#tj_sbyf").val());
		chaxun();
	}
	function check(str){
		var g = /^[1-9]+(?=\.{0,1}\d+$|$)|(^0$)|(^0\.[0-9]*[1-9]$)/;
	    if( !g.test(str.value)){
	    	alert("请输入正确的金额");
	    	$(str).val('');
	    }
	    if($("#tj_sbyf").val()==null){
	    	alert("尚未拨付车购税");
	    	$(str).val('');
	    }else{
	    	if(parseFloat($("#tj_sbyf").val())<parseFloat(str.value)){
	    		alert("完成资金不能超过到位资金");
	    		$(str).val('');
	    	}
	    }
	}
	function checkZJ1(aa){
		var g = /^[1-9]+(?=\.{0,1}\d+$|$)|(^0$)|(^0\.[0-9]*[1-9]$)/;
	    if( !g.test(aa.value)){
	    	alert("请输入正确的金额");
	    	$(aa).val('');
	    }
	}
	function checkwcqk1(aa){
		$(aa).val('');
		$("#tj_wcqk").attr("style",'color:#000000;width: 70px;');
	}
	function checkWCQK(aa){
		var g=/(^[1-9][0-9]$)|(^100&)|(^[1-9]$)$/;
		 if( !g.test(aa.value)){
		    	alert("请输入正确的数值1-100");
		    	$(aa).val('');
		    	$("#tj_wcqk").val(">"+wcqkmin+",<"+wcqkmax);
				$("#tj_wcqk").attr("style",'color:#CCCCCC;width: 70px;');
		    }
		if(wcqkmin!=''){
			if(Number(aa.value)<=Number(wcqkmin)){
				alert("请输入大于"+wcqkmin+"的值");
				$(aa).val('');
				$("#tj_wcqk").val(">"+wcqkmin+",<"+wcqkmax);
				$("#tj_wcqk").attr("style",'color:#CCCCCC;width: 70px;');
			}
		}
		if(wcqkmax!=''){
			if(wcqkmax==100){
				if(Number(aa.value)>Number(wcqkmax)){
					alert("请输入小于等于"+wcqkmax+"的值");
					$(aa).val('');
					$("#tj_wcqk").val(">"+wcqkmin+",<="+wcqkmax);
					$("#tj_wcqk").attr("style",'color:#CCCCCC;width: 70px;');
				}
			}else{
				if(Number(aa.value)>=Number(wcqkmax)){
					alert("请输入小于"+wcqkmax+"的值");
					$(aa).val('');
					$("#tj_wcqk").val(">"+wcqkmin+",<"+wcqkmax);
					$("#tj_wcqk").attr("style",'color:#CCCCCC;width: 70px;');
				}
			}
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
                        <tr style="height: 35px;">
                            <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                 padding-right: 5px;">
                                <b><font color="#009ACD" style=" font-size: 12px">本月完成投资（万元）</font></b>
                            </td>
                            <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                                border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;" colspan="5">
                                部投资：<input style="width: 50px" name="WC_BTZ" type="text" id="tj_wc_btz"  onblur='check(this)'/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<!--                                 省投资：<input style="width: 50px" name="WC_STZ" type="text" id="tj_wc_stz" />&nbsp;&nbsp;&nbsp;&nbsp; -->
                                 其他投资：<input style="width: 50px" name="WC_QTTZ" type="text" id="tj_wc_qttz"  onblur='checkZJ1(this)' />&nbsp;&nbsp;&nbsp;&nbsp;
                            </td>
                        </tr>
                        <tr style="height: 35px;">
                            <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                padding-right: 5px;">
                                <font color="#009ACD" style=" font-size: 12px">本月资金到位（万元）
                            </td>
                            <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                                border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;" colspan="5">
                                部投资：
                                <span style="width: 50px" id="tjbtz"></span>
                                <input style="width: 50px" name="ZJ_BTZ" type="hidden" id="tj_zjdw_btz" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<!--                                 省投资：<input style="width: 50px" name="ZJ_STZ" type="text" id="tj_zjdw_stz" />&nbsp;&nbsp;&nbsp;&nbsp;  -->
                                其他投资：<input style="width: 50px" name="ZJ_QTTZ" type="text" id="tj_zjdw_qttz"  onblur='checkZJ1(this)'/>&nbsp;&nbsp;&nbsp;&nbsp;
                            </td>
                        </tr>
                        <tr style="height: 35px;">
                            <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                padding-right: 5px;">
                                <b><font color="#009ACD" style=" font-size: 12px">本月完成面层（公里）</font></b>
                            </td>
                            <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                                border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;" >
                                <input name="BYWCMC" type="text" id="tj_bywcmc" style="width: 50px;" />
                            </td>
                             <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                 padding-right: 5px;">
                                <b><font color="#009ACD" style=" font-size: 12px">本月完成情况（%）：</font></b>
                            </td>
                            <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                                border-bottom: 1px solid #C0C0C0;  text-align: left; padding-left: 10px;" >
                                <input style="width: 70px" name="WCQK" type="text" id="tj_wcqk"  onfocus="checkwcqk1(this)" onblur="checkWCQK(this)"/>
                            </td>
                            <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                padding-right: 5px;">
                                <b><font color="#009ACD" style=" font-size: 12px">截至开工段落：</font></b>
                            </td>
                            <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                                border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;" >
                                <input name="JZKGDL" type="text" id="tj_kgdl" style="width: 50px;" />
                            </td>
                        </tr>
                        <tr style="height: 35px;">
                            <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                 padding-right: 5px;">
                                <b><font color="#009ACD" style=" font-size: 12px">情况说明：</font></b>
                            </td>
                            <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                                border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;" colspan="5">
                                <input name="QKSM" type="text" id="tj_qksm" style="width: 350px;" />
                            </td>
                        </tr>
                        <tr style="height: 35px;">
                            <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                 padding-right: 5px;">
                                <b><font color="#009ACD" style=" font-size: 12px">上报时间：</font></b>
                            </td>
                            <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                                border-bottom: 1px solid #C0C0C0;  text-align: left; padding-left: 10px;">
                                <span id="tj_sbsj"></span>
                            </td>
                            <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                 padding-right: 5px;">
                                <b><font color="#009ACD" style=" font-size: 12px">月报月份：</font></b>
                            </td>
                            <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                                border-bottom: 1px solid #C0C0C0;  text-align: left; padding-left: 10px;" colspan="3">
                                <select id="tj_sbyf" onchange="setZjDW()"></select>
                            </td>
                        </tr>
                    </table>
                    <table width="100%" border="0" style="border-style: solid; border-width: 3px 1px 1px 1px;
                        margin-top: 20px; border-color: #55BEEE #C0C0C0 #C0C0C0 #C0C0C0; height: 45px;"
                        cellspacing="0" cellpadding="0">
                        <tr style="height: 30px;">
                            <td align="center">
                                <img id="addbtn" src="${pageContext.request.contextPath}/images/Button/baocun1.gif" id="Img1" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/baocun2.gif'" alt="保存" onmouseout="this.src='${pageContext.request.contextPath}/images/Button/baocun1.gif'" style="cursor: hand" onclick="tjwqgzyb();" />
                                <img src="${pageContext.request.contextPath}/images/Button/fanhui1.GIF" id="Img2" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/fanhui2.GIF'" alt="返回" onmouseout="this.src='${pageContext.request.contextPath}/images/Button/fanhui1.GIF'" onclick="closes('wqxxtj')" style="cursor: hand" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
</div>

</body>
</html>