<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>工程改造路面升级月报编辑</title>
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
		var myDate = new Date();
		var y = myDate.getFullYear();
		var m = myDate.getMonth()+1;       //获取当前月份(0-11,0代表1月)
		var d = myDate.getDate();
		sbsj = y+"-"+m+"-"+d;
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

			$("#xg_sbyf").append("<option id="+mystr+" value="+mystr+" selected='selected'>"+mystr+"</option>");
			$("#xg_sbyf").append("<option id="+mystr2+" value="+mystr2+">"+mystr2+"</option>");
			$("#xg_sbyf").append("<option id="+mystr1+" value="+mystr1+">"+mystr1+"</option>");
			$("#xg_sbyf").append("<option id="+mystr1+" value="+mystr3+">"+mystr3+"</option>");
			$("#xg_sbyf").append("<option id="+mystr1+" value="+mystr4+">"+mystr4+"</option>");
			$("#xg_sbsj").text(sbsj);
			var datayb=parent.obj;
			$("#xg_qlwcqk_z").val(datayb.qlwcqk_z);$("#xg_qlwcqk_ym").val(datayb.qlwcqk_ym);$("#xg_sdwcqk_z").val(datayb.sdwcqk_z);$("#xg_sdwcqk_ym").val(datayb.sdwcqk_ym);$("#xg_hdwcqk_m").val(datayb.hdwcqk_m);
			$("#xg_ljtsfwcqk").val(datayb.ljtsfwcqk);$("#xg_dcwcqk").val(datayb.dcwcqk);$("#xg_jcwcqk").val(datayb.jcwcqk);$("#xg_bywcmc").val(datayb.bywcmc);$("#xg_lqlmwcqk").val(datayb.lqlmwcqk);$("#xg_snlmwcqk").val(datayb.snlmwcqk);
			$("#tj_zycgs").val(datayb.zycgs);$("#tj_dfbz").val(datayb.dfbz);$("#tj_yhdk").val(datayb.yhdk);$("#tj_sttxdk").val(datayb.sttxdk);$("#tj_qtzj").val(datayb.qtzj);
			$("#xg_kgdl").val(datayb.kgdl);$("#xg_qksm").val(datayb.qksm);$("#xg_bywctze").val(datayb.bywctze);$("#xg_bywcgzl").val(datayb.bywcgzl);
			$("#xg_sbsj").text(datayb.sbsj);
			$("#ssdctc").val(datayb.ssdctc);
			$("#bndsslc").val(datayb.bndsslc);
			$("#wkglc").val(datayb.wkglc);
			$("#xg_sbyf").val(datayb.sbyf);
			$("#wcqk").text(datayb.wcqk);
			getYuefen();

		});
	function check(str){
		var g = /^[1-9]+(?=\.{0,1}\d+$|$)|(^0$)|(^0\.[0-9]*[1-9]$)/;
		if(str.value==''){
			return;
		}
	    if( !g.test(str.value)){
	    	alert("请输入正确的金额");
	    	$(str).val('');
	    	return;
	    }else{
	    	shewcqk();
	    }
	}
	function getYuefen(){
		
		var data="jhid="+parent.parent.obj1.jhid+"&bfyf="+$("#tj_sbyf").val();
		$.ajax({
			type:'post',
			url:'../../../../gcgl/selectcgsyf.do',
			data:data,
			dataType:'json',
			success:function(msg){
				$("#tj_zycgs").val(msg.zjdw_btz);
				$("#tjbtz").text(msg.zjdw_btz);
				shewcqk();
			}
		});
	}
	function shewcqk(){
		var dwb=$("#tj_zycgs").val();
		var dws=$("#tj_dfbz").val();
		var dwq=$("#tj_sttxdk").val();
		var wcb=$("#tj_qtzj").val();
		var wcs=$("#xg_bywctze").val();
		if(dwb=='') dwb=0;
		if(dws=='') dws=0;
		if(dwq=='') dwq=0;
		if(wcb=='') wcb=0;
		if(wcs=='') wcs=0;
		if((parseFloat(dwb)+parseFloat(dws)+parseFloat(dwq)+parseFloat(wcb))==0){
			$("#wcqk").text("0");
		}else{
		$("#wcqk").text((parseFloat(wcs)/(parseFloat(dwb)+parseFloat(dws)+parseFloat(dwq)+parseFloat(wcb))*100).toFixed(2));
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
                                <font color="#009ACD" style=" font-size: 12px">桥梁完成情况：</font>
                            </td>
                            <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                                border-bottom: 1px solid #C0C0C0;  text-align: left; padding-left: 10px;">
                                <input name="QLWCQK_Z" type="text" id="xg_qlwcqk_z" style="width: 30px;" />座
                                <input name="QLWCQK_YM" type="text" id="xg_qlwcqk_ym" style="width: 30px;" />延米
                            </td>
                            <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                padding-right: 5px;">
                                <b><font color="#009ACD" style=" font-size: 12px">隧道完成情况：</font></b>
                            </td>
                            <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                                border-bottom: 1px solid #C0C0C0;  text-align: left; padding-left: 10px;">
                                <input name="SDWCQK_Z" type="text" id="xg_sdwcqk_z" style="width: 30px;" />座
                                <input name="SDWCQK_YM" type="text" id="xg_sdwcqk_ym" style="width: 30px;" />延米
                            </td>
                            <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                padding-right: 5px;">
                                <b><font color="#009ACD" style=" font-size: 12px">涵洞完成情况：</font></b>
                            </td>
                            <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                                border-bottom: 1px solid #C0C0C0;  text-align: left; padding-left: 10px;">
                                <input name="HDWCQK_M" type="text" id="xg_hdwcqk_m" style="width: 30px;" />米
                            </td>
                        </tr>
                        <tr style="height: 35px;">
                            <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                padding-right: 5px;">
                                <font color="#009ACD" style=" font-size: 12px">路基土石方完成情况：</font>
                            </td>
                            <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                                border-bottom: 1px solid #C0C0C0;  text-align: left; padding-left: 10px;">
                                <input name="LJTSFWCQK" type="text" id="xg_ljtsfwcqk"  style="width: 30px;"/>㎡
                            </td>
                            <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                padding-right: 5px;">
                                <font color="#009ACD" style=" font-size: 12px">垫层完成情况：</font>
                            </td>
                            <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                                border-bottom: 1px solid #C0C0C0;  text-align: left; padding-left: 10px;">
                                <input name="DCWCQK" type="text" id="xg_dcwcqk"  style="width: 30px;"/>公里
                            </td>
                            <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                padding-right: 5px;">
                                <font color="#009ACD" style=" font-size: 12px">基层完成情况：</font>
                            </td>
                            <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                                border-bottom: 1px solid #C0C0C0;  text-align: left; padding-left: 10px;">
                                <input name="JCWCQK" type="text" id="xg_jcwcqk"  style="width: 30px;"/>公里
                            </td>
                        </tr>
                        <tr style="height: 35px;">
                            <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                padding-right: 5px;">
                                <font color="#009ACD" style=" font-size: 12px">面层完成情况：</font>
                            </td>
                            <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                                border-bottom: 1px solid #C0C0C0;  text-align: left; padding-left: 10px;">
                                <input name="BYWCMC" type="text" id="xg_bywcmc" style="width: 30px;" />公里
                            </td>
                            <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                padding-right: 5px;">
                                <font color="#009ACD" style=" font-size: 12px">沥青路面完成情况：</font>
                            </td>
                            <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                                border-bottom: 1px solid #C0C0C0;  text-align: left; padding-left: 10px;">
                                <input name="LQLMWCQK" type="text" id="xg_lqlmwcqk"  style="width: 30px;"/>公里
                            </td>
                            <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                padding-right: 5px;">
                                <font color="#009ACD" style=" font-size: 12px">水泥路面完成情况：</font>
                            </td>
                            <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                                border-bottom: 1px solid #C0C0C0;  text-align: left; padding-left: 10px;">
                                <input name="SNLMWCQK" type="text" id="xg_snlmwcqk"  style="width: 30px;"/>公里
                            </td>
                        </tr>
                        <tr style="height: 35px;">
                            <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                padding-right: 5px;">
                                <font color="#009ACD" style=" font-size: 12px">本月资金到位：</font>
                            </td>
                           <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                                border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;" colspan="5"
                                class="style1">
                                中央车购税：
                           <span style="width: 50px" id="tjbtz"></span>万元
                           <input name="ZYCGS" type="hidden" id="tj_zycgs"  style="width: 30px;"/>&nbsp;
                                地方补助：<input onblur="check(this)" name="DFBZ" type="text" id="tj_dfbz"  style="width: 30px;"/>万元&nbsp;&nbsp; 银行贷款：<input  name="YHDK" type="text" id="tj_yhdk"  style="width: 30px;"/>万元&nbsp;&nbsp;省厅贴息：<input onblur="check(this)" name="STTX" type="text" id="tj_sttxdk"  style="width: 30px;"/>万元&nbsp;&nbsp; 其他投资：<input onblur="check(this)" name="QTTZ" type="text" id="tj_qtzj"  style="width: 30px;"/>万元
                            </td>
                        </tr>
                       
                        <tr style="height: 35px;">
                         <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                color: #009ACD; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                padding-right: 5px;">
                               本月完成投资额：
                            </td>
                            <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                                border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;" >
                                 <input onblur="check(this)" name="BYWCTZE" type="text" id="xg_bywctze" style="width: 40px;"/>万元
                            </td>
                         <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                            color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                            width: 20%; padding-right: 5px;">
                            <b><font color="#009ACD" style=" font-size: 12px">本月完成工作量：</font></b>
                        </td>
                        <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                            border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;">
                            <input name="BYWCQK" type="text" id="xg_bywcgzl"  style="width: 40px;"/>公里
                        </td>
                            <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                color: #009ACD; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                padding-right: 5px;">
                                截至开工段落：
                            </td>
                            <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                                border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;" >
                                <input name="JZKGDL" type="text" id="xg_kgdl"  style="width: 40px;"/>
                            </td>
                        </tr>
                         <tr style="height: 35px;">
                         <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                color: #009ACD; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                padding-right: 5px;">
                               本月完成情况%：
                            </td>
                            <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                                border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;" >
                                 <span  id="wcqk" ></span>
                            </td>
                         <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                            color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                            width: 20%; padding-right: 5px;">
                            <b><font color="#009ACD" style=" font-size: 12px">砂石垫层通车(公里)：</font></b>
                        </td>
                        <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                            border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;">
                            <input type="text" id="ssdctc" style="width: 50px;" />
                        </td>
                            <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                color: #009ACD; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                padding-right: 5px;">
                                本年度实施里程(公里)：
                            </td>
                            <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                                border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;" >
                                 <input name="bndsslc" type="text" id="bndsslc" style="width: 50px;" />
                            </td>
                        </tr>
                        <tr style="height: 35px;">
                            <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                color: #009ACD; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                padding-right: 5px;">
                                未开工里程（公里）：
                            </td>
                            <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                                border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;" colspan="5">
                                <input type="text" id="wkglc" style="width: 50px;" />
                            </td>
                        </tr>
                        <tr style="height: 35px;">
                            <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                color: #009ACD; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                padding-right: 5px;">
                                情况说明：
                            </td>
                            <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                                border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;" colspan="5">
                                <input name="QKSM" type="text" id="xg_qksm" style="width: 350px;" />
                            </td>
                        </tr>
					<tr style="height: 35px;">
                        <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                            color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                            width: 20%; padding-right: 5px;">
                            <b><font color="#009ACD" style=" font-size: 12px">上报时间：</font></b>
                        </td>
                        <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                            border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;">
                            <span id="xg_sbsj"></span>
                        </td>
                        <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                            color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                            width: 20%; padding-right: 5px;">
                            <b><font color="#009ACD" style=" font-size: 12px">月报月份：</font></b>
                        </td>
                        <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                            border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;" colspan="3">
                            <select id="xg_sbyf" onchange="getYuefen()"></select>
                        </td>
                    </tr>
                    </table>
                    <table width="100%" border="0" style="border-style: solid; border-width: 3px 1px 1px 1px;
                        margin-top: 20px; border-color: #55BEEE #C0C0C0 #C0C0C0 #C0C0C0; height: 45px;"
                        cellspacing="0" cellpadding="0">
                        <tr style="height: 30px;">
                            <td align="center">
                                <img src="${pageContext.request.contextPath}/images/Button/baocun1.gif" id="Img1" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/baocun2.gif'" alt="保存" onmouseout="this.src='${pageContext.request.contextPath}/images/Button/baocun1.gif'" style="cursor: hand" onclick="xggcgzsjyb();" />
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
