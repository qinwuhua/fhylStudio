<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>水毁月报编辑</title>
	<link href="${pageContext.request.contextPath}/css/searchAndNavigation.css" type="text/css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/icon.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="js/sh.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YMLib.js"></script>
	<script type="text/javascript">
	$(function(){
		var myDate = new Date();
		var y = myDate.getFullYear();
		var m = myDate.getMonth()+1;       //获取当前月份(0-11,0代表1月)
		var d = myDate.getDate();
		sbsj = y+"-"+m+"-"+d;
		$('#xg_sbyf').datebox({    
		    required:false,
		    formatter:function(date){
		    	var y = date.getFullYear();
		    	var m = date.getMonth()+1;
		    	return y+'-'+m;
		    },
		    onSelect: function(date){
		    	getYuefen();
		    }
		}); 
		$("#xg_sbsj").text(sbsj);
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
		$("#tjbtz").text(data.zjdw_btz);
		$("#tjstz").text(data.zjdw_stz);
		$("#xg_sbyf").datebox('setValue',data.sbyf);
		$("#ssdctc").val(data.ssdctc);
		$("#xg_wcqk").text(data.wcqk);
		$("#bndsslc").val(data.bndsslc);
		$("#wkglc").val(data.wkglc);
		$("#wc_yhdk").val(data.yhdk);
		$("#wc_gz").val(data.gz);
		$("#wc_sz").val(data.sz);
		$("#zjdw_yhdk").val(data.dwyhdk);
		$("#zjdw_gz").val(data.dwgz);
		$("#zjdw_sz").val(data.dwsz);
		$("#tjyhdk").text(data.dwyhdk);
		$("#tjgz").text(data.dwgz);
		$("#tjsz").text(data.dwsz);
		getYuefen();
		
		pfztz=parent.parent.obj1.PFZTZ;
		pfbtz=parent.parent.obj1.BBZZJ;
		pfstz=parent.parent.obj1.SBZZJ;
		$("#pfztz").text(pfztz);
		$("#pfbtz").text(pfbtz);
		$("#pfstz").text(pfstz);
		var zwczj=parseFloat(parent.$("#zwczj").html())-parseFloat(parent.obj.wc_btz)-parseFloat(parent.obj.yhdk)-parseFloat(parent.obj.gz)-parseFloat(parent.obj.sz)-parseFloat(parent.obj.wc_qttz);
		$("#zwczj").text(zwczj);
		var zwcbtz=parseFloat(parent.$("#zwcbtz").html())-parseFloat(parent.obj.wc_btz);
		$("#zwcbtz").text(zwcbtz);
		var yhdk=parseFloat(parent.$("#yhdk").html())-parseFloat(parent.obj.yhdk);
		$("#zwcy").text(yhdk);
		var gz=parseFloat(parent.$("#gz").html())-parseFloat(parent.obj.gz);
		$("#zwcg").text(gz);
		var sz=parseFloat(parent.$("#sz").html())-parseFloat(parent.obj.sz);
		$("#zwcs").text(sz);
	});
	function check(str){
		var g = /(^-?\d+$)|(^(-?\d+)(\.\d+)?$)/;
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
		var myDate = new Date();
		var y = myDate.getFullYear();
		var m = myDate.getMonth()+1; 
		var sbyf=$("#xg_sbyf").datebox('getValue');
		if(sbyf==''||sbyf==null)
			sbyf=y+"-"+m;
		var data="jhid="+parent.parent.obj1.XMBM+"&bfyf="+sbyf;
		$.ajax({
			type:'post',
			url:'../../../../gcgl/selectcgsyf.do',
			data:data,
			dataType:'json',
			success:function(msg){
				$("#xg_zjdw_btz").val(msg.zjdw_btz);
				$("#tjbtz").text(msg.zjdw_btz);
				$("#zjdw_yhdk").val(msg.yhdk);
				$("#zjdw_gz").val(msg.gz);
				$("#zjdw_sz").val(msg.sz);
				$("#tjyhdk").text(msg.yhdk);
				$("#tjgz").text(msg.gz);
				$("#tjsz").text(msg.sz);
				shewcqk();
			}
		});
	}
	function shewcqk(){
		var dwb=$("#xg_zjdw_btz").val();
		var dws=$("#zjdw_sz").val();
		var dwy=$("#zjdw_yhdk").val();
		var dwg=$("#zjdw_gz").val();
		var dwq=$("#xg_zjdw_qttz").val();
		var wcb=$("#xg_wc_btz").val();
		var wcs=$("#wc_sz").val();
		var wcy=$("#wc_yhdk").val();
		var wcg=$("#wc_gz").val();
		var wcq=$("#xg_wc_qttz").val();
		if(dwb=='') dwb=0;if(dws=='') dws=0;if(dwg=='') dwg=0;if(dwy=='') dwy=0;if(dwq=='') dwq=0;
		if(wcb=='') wcb=0;if(wcs=='') wcs=0;if(wcg=='') wcg=0;if(wcy=='') wcy=0;if(wcq=='') wcq=0;
		var pfztz=parent.parent.obj1.PFZTZ;
		if(parseFloat(pfztz)==0){
			$("#xg_wcqk").text("0");
		}else
		$("#xg_wcqk").text(((parseFloat(wcb)+parseFloat(wcs)+parseFloat(wcg)+parseFloat(wcy)+parseFloat(wcq))/(parseFloat(pfztz))*100).toFixed(2));
		
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
                  	<td colspan="6" >
                  	 项目批复总投资共【<span id="pfztz" style="color: Red; font-weight: bold;"></span>】万元，
          	  		其中部投资【<span id="pfbtz" style="color: Red; font-weight: bold;"></span>】万元，省投资【<span id="pfstz" style="color: Red; font-weight: bold;"></span>】万元,
					除去本月，累计完成【<span id="zwczj" style="color: Red; font-weight: bold;"></span>】万元,
              		其中部投资【<span id="zwcbtz" style="color: Red; font-weight: bold;"></span>】万元，银行贷款【<span id="zwcy" style="color: Red; font-weight: bold;"></span>】万元，国债【<span id="zwcg" style="color: Red; font-weight: bold;"></span>】万元，省债【<span id="zwcs" style="color: Red; font-weight: bold;"></span>】万元。
                  	</td>
                  </tr>
       <tr>
                <td>
                    <br />
                    <table width="100%" border="0" style="border-style: solid; border-width: 3px 1px 1px 1px;
                        border-color: #55BEEE #C0C0C0 #C0C0C0 #C0C0C0; height: 45px;" cellspacing="0"
                        cellpadding="0">
                        <tr style="height: 35px;">
                            <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                 padding-right: 5px;width: 145px;">
                                <b><font color="#009ACD" style=" font-size: 12px">本月完成投资（万元）</font></b>
                            </td>
                            <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                                border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;" colspan="5">
                                <div>
                                <table>
                                <tr>
                                <td style="width: 157px;">部投资：<input style="width: 50px" name="WC_BTZ" type="text" id="xg_wc_btz"  onblur='check(this)' /><font color="red">*</font></td>
                                <td style="width: 157px;">银行贷款：<input style="width: 50px" name="WC_STZ" type="text" id="wc_yhdk" onblur='check(this)'/><font color="red">*</font></td>
                                <td style="width: 157px;">国债：<input style="width: 50px" name="WC_STZ" type="text" id="wc_gz" onblur='check(this)'/><font color="red">*</font></td>
                               	</tr>
                                <tr>
                                <td style="width: 157px;">省&nbsp;&nbsp;债：<input style="width: 50px" name="WC_STZ" type="text" id="wc_sz" onblur='check(this)'/><font color="red">*</font></td>
                                <td style="width: 157px;">其他投资：<input style="width: 50px" name="WC_QTTZ" type="text" id="xg_wc_qttz"  onblur='check(this)' /><font color="red">*</font></td>
                                </tr>
                                </table>
                                </div>
                            </td>
                        </tr>
                        <tr style="height: 35px;">
                            <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                padding-right: 5px;">
                                <font color="#009ACD" style=" font-size: 12px">本月资金到位（万元）</font>
                            </td>
                            <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                                border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;" colspan="5">
                                <div>
                                <table>
                                <tr>
                                <td style="width: 157px;">部投资：<span style="width: 50px" id="tjbtz"></span><input style="width: 50px" name="ZJ_BTZ" type="hidden" id="xg_zjdw_btz" /></td>
                                <td style="width: 157px;">银行贷款：<span style="width: 50px" id="tjyhdk"></span><input style="width: 50px" name="ZJ_STZ" type="hidden" id="zjdw_yhdk" /></td>
                                 <td style="width: 157px;">国债：<span style="width: 50px" id="tjgz"></span><input style="width: 50px" name="ZJ_STZ" type="hidden" id="zjdw_gz" /></td>
                                 </tr>
                                 <tr>
                                  <td style="width: 157px;">省债：<span style="width: 50px" id="tjsz"></span><input style="width: 50px" name="ZJ_STZ" type="hidden" id="zjdw_sz" /></td>
                                <td style="width: 157px;">其他投资：<input style="width: 50px" name="ZJ_QTTZ" type="text" id="xg_zjdw_qttz"  onblur='check(this)'/><font color="red">*</font></td>
                                </tr>
                                </table>
                                </div>
                            </td>
                        </tr>
                          <tr style="height: 35px;">
                            <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                 padding-right: 5px;">
                                <font color="#009ACD" style=" font-size: 12px">本月完成垫层（m³）</font>
                            </td>
                            <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                                border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;">
                                <input name="BYWCDC" type="text" id="xg_bywcdc"  style="width: 50px;"/><font color="red">*</font>
                            </td>
                            <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                 padding-right: 5px;">
                                <font color="#009ACD" style=" font-size: 12px">本月完成基层（m³）</font>
                            </td>
                            <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                                border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;">
                                <input name="BYWCJC" type="text" id="xg_bywcjc"  style="width: 50px;"/><font color="red">*</font>
                            </td>
                            <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                 padding-right: 5px;">
                                <font color="#009ACD" style=" font-size: 12px">本月完成面层（公里）</font>
                            </td>
                            <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                                border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;">
                                <input name="BYWCMC" type="text" id="xg_bywcmc"  style="width: 50px;"/><font color="red">*</font>
                            </td>
                        </tr>
                        
                        <tr style="height: 35px;">
                         <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                 padding-right: 5px;">
                                <b><font color="#009ACD" style=" font-size: 12px">本月完成情况（%）：</font></b>
                            </td>
                            <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                                border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;">
                                <span  id="xg_wcqk" ></span>
                            </td>
                            <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                 padding-right: 5px;">
                                <b><font color="#009ACD" style=" font-size: 12px">截至开工段落：</font></b>
                            </td>
                            <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                                border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;" >
                                <input name="JZKGDL" type="text" id="xg_kgdl" style="width: 50px;" />
                            </td>
                            <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                 padding-right: 5px;">
                                <b><font color="#009ACD" style=" font-size: 12px">砂石垫层通车：</font></b>
                            </td>
                            <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                                border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;" >
                                <input name="JZKGDL" type="text" id="ssdctc" style="width: 50px;" />
                            </td>
                        </tr>
                        <tr style="height: 35px;">
                            <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                 padding-right: 5px;">
                                <b><font color="#009ACD" style=" font-size: 12px">本年度实施里程(公里)：</font></b>
                            </td>
                            <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                                border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;" >
                                <input name="bndsslc" type="text" id="bndsslc" style="width: 50px;" />
                            </td>
                            <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                color: #009ACD; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                padding-right: 5px;">
                                未开工里程（公里）：
                            </td>
                            <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                                border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;" colspan="3">
                                <input type="text" id="wkglc" style="width: 50px;" />
                            </td>
                        </tr>
                        <tr style="height: 35px;">
                            
                            <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                padding-right: 5px;">
                                <font color="#009ACD" style=" font-size: 12px">沥青路面完成情况：</font>
                            </td>
                            <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                                border-bottom: 1px solid #C0C0C0;  text-align: left; padding-left: 10px;">
                                <input name="LQLMWCQK" type="text" id="lqlmwcqk"  style="width: 50px;"/>公里<font color="red">*</font>
                            </td>
                            <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                padding-right: 5px;">
                                <font color="#009ACD" style=" font-size: 12px">水泥路面完成情况：</font>
                            </td>
                            <td colspan="3" style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                                border-bottom: 1px solid #C0C0C0;  text-align: left; padding-left: 10px;">
                                <input name="SNLMWCQK" type="text" id="snlmwcqk"  style="width: 50px;"/>公里<font color="red">*</font>
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
		                                一级<input type="text" id="yiji" style="width: 50px;" value="0"/>公里；
		                                二级<input type="text" id="erji" style="width: 50px;" value="0"/>公里；
		                                三级<input type="text" id="sanji" style="width: 50px;" value="0"/>公里；
		                                四级<input type="text" id="siji" style="width: 50px;" value="0"/>公里。
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
                                <input name="QKSM" type="text" id="xg_qksm" style="width: 350px;" />
                            </td>
                        </tr>
                      
                        <tr style="height: 35px;">
                           
                            <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                 padding-right: 5px;">
                                <b><font color="#009ACD" style=" font-size: 12px">上报时间：</font></b>
                            </td>
                            <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                                border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;">
                               <span id="xg_sbsj"></span>
                            </td>
                            <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                 padding-right: 5px;">
                                <b><font color="#009ACD" style=" font-size: 12px">月报月份：</font></b>
                            </td>
                            <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                                border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;" colspan="3">
                                <input type="text" id='xg_sbyf' >
                            </td>
                        </tr>
                    </table>
                    <table width="100%" border="0" style="border-style: solid; border-width: 3px 1px 1px 1px;
                        margin-top: 20px; border-color: #55BEEE #C0C0C0 #C0C0C0 #C0C0C0; height: 45px;"
                        cellspacing="0" cellpadding="0">
                        <tr style="height: 30px;">
                            <td align="center">
                                <img src="${pageContext.request.contextPath}/images/Button/baocun1.gif" id="Img1" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/baocun2.gif'" alt="保存" onmouseout="this.src='${pageContext.request.contextPath}/images/Button/baocun1.gif'" style="cursor: hand" onclick="xgshyb();" />
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
