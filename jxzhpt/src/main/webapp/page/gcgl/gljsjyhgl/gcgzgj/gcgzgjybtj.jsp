<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>工程改造路面改建月报上报</title>
	<link href="${pageContext.request.contextPath}/css/searchAndNavigation.css" type="text/css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/icon.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="../../../../js/util/jquery.cookie.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YMLib.js"></script>
	<script type="text/javascript" src="js/gcgzgj.js"></script>
	<script type="text/javascript">
	$(function(){
		$('#tj_sbyf').datebox({    
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
		var myDate = new Date();
		var y = myDate.getFullYear();
		var m = myDate.getMonth()+1;       //获取当前月份(0-11,0代表1月)
		var d = myDate.getDate();
		sbsj = y+"-"+m+"-"+d;
		$('#tj_sbyf').datebox('setValue',y+"-"+m);
		$("#tj_sbsj").text(sbsj);

		getYuefen();
		pfztz=parent.parent.obj1.PFZTZ;
		pfbtz=parent.parent.obj1.BBZZJ;
		pfstz=parent.parent.obj1.SBZZJ;
		$("#pfztz").text(pfztz);
		$("#pfbtz").text(pfbtz);
		$("#pfstz").text(pfstz);
		$("#zwczj").text(parent.$("#zwczj").text());
		$("#zwcbtz").text(parent.$("#zwcbtz").text());
		$("#zwcy").text(parent.$("#yhdk").text());
		$("#zwcg").text(parent.$("#gz").text());
		$("#zwcs").text(parent.$("#sz").text());
		$("#tbman").val($.cookie("truename"));
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
	var sbyf=$("#tj_sbyf").datebox('getValue');
	if(sbyf==''||sbyf==null)
		sbyf=y+"-"+m;
	var data="jhid="+parent.parent.obj1.XMBM+"&bfyf="+sbyf;
	$.ajax({
		type:'post',
		url:'../../../../gcgl/selectcgsyf.do',
		data:data,
		dataType:'json',
		success:function(msg){
			$("#tj_zjdw_btz").val(msg.zjdw_btz);
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
	var dwb=$("#tj_zjdw_btz").val();
	var dws=$("#zjdw_sz").val();
	var dwy=$("#zjdw_yhdk").val();
	var dwg=$("#zjdw_gz").val();
	var dwq=$("#tj_zjdw_qttz").val();
	var wcb=$("#tj_wc_btz").val();
	var wcs=$("#wc_sz").val();
	var wcy=$("#wc_yhdk").val();
	var wcg=$("#wc_gz").val();
	var wcq=$("#tj_wc_qttz").val();
	if(dwb=='') dwb=0;if(dws=='') dws=0;if(dwg=='') dwg=0;if(dwy=='') dwy=0;if(dwq=='') dwq=0;
	if(wcb=='') wcb=0;if(wcs=='') wcs=0;if(wcg=='') wcg=0;if(wcy=='') wcy=0;if(wcq=='') wcq=0;
	var pfztz=parent.parent.obj1.PFZTZ;
	if(parseFloat(pfztz)==0){
		$("#tj_wcqk").text("0");
	}else
	$("#tj_wcqk").text(((parseFloat(wcb)+parseFloat(wcs)+parseFloat(wcg)+parseFloat(wcy)+parseFloat(wcq))/(parseFloat(pfztz))*100).toFixed(2));
	
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
cursor: pointer;
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
                                <td style="width: 157px;">部投资：<input style="width: 50px" name="WC_BTZ" type="text" id="tj_wc_btz"  onblur='check(this)' /><font color="red">*</font></td>
                                <td style="width: 157px;">银行贷款：<input style="width: 50px" name="WC_STZ" type="text" id="wc_yhdk" onblur='check(this)'/><font color="red">*</font></td>
                                <td style="width: 157px;">国债：<input style="width: 50px" name="WC_STZ" type="text" id="wc_gz" onblur='check(this)'/><font color="red">*</font></td>
                               	</tr>
                                <tr>
                                <td style="width: 157px;">省&nbsp;&nbsp;债：<input style="width: 50px" name="WC_STZ" type="text" id="wc_sz" onblur='check(this)'/><font color="red">*</font></td>
                                <td colspan="2" style="width: 157px;">其他投资：<input style="width: 50px" name="WC_QTTZ" type="text" id="tj_wc_qttz"  onblur='check(this)' /><font color="red">*</font></td>
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
                                <td style="width: 157px;">部投资：<!-- <span style="width: 50px" id="tjbtz"></span> --><input style="width: 50px" name="ZJ_BTZ" type="text" id="tj_zjdw_btz" onblur='check(this)'/></td>
                                <td style="width: 157px;">银行贷款：<!-- <span style="width: 50px" id="tjyhdk"></span> --><input style="width: 50px" name="ZJ_STZ" type="text" id="zjdw_yhdk" onblur='check(this)'/></td>
                                 <td style="width: 157px;">国债：<!-- <span style="width: 50px" id="tjgz"></span> --><input style="width: 50px" name="ZJ_STZ" type="text" id="zjdw_gz" onblur='check(this)'/></td>
                                 </tr>
                                 <tr>
                                  <td style="width: 157px;">省债：<!-- <span style="width: 50px" id="tjsz"></span> --><input style="width: 50px" name="ZJ_STZ" type="text" id="zjdw_sz" onblur='check(this)'/></td>
                                <td style="width: 157px;">其他投资：<input style="width: 50px" name="ZJ_QTTZ" type="text" id="tj_zjdw_qttz"  onblur='check(this)'/><font color="red">*</font></td>
                                </tr>
                                </table>
                                </div>
                            </td>
                        </tr>
                          <tr style="height: 35px;">
                            <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                 padding-right: 5px;">
                                <font color="#009ACD" style="font-size: 12px">本月完成垫层（m³）</font>
                            </td>
                            <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                                border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;">
                                <input name="BYWCDC" type="text" id="tj_bywcdc"  style="width: 50px;"/><font color="red">*</font>
                            </td>
                            <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                 padding-right: 5px;">
                                <font color="#009ACD" style="font-size: 12px">本月完成基层（m³）</font>
                            </td>
                            <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                                border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;">
                                <input name="BYWCJC" type="text" id="tj_bywcjc"  style="width: 50px;"/><font color="red">*</font>
                            </td>
                            <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                 padding-right: 5px;">
                                <font color="#009ACD" style="font-size: 12px">本月完成面层（公里）</font>
                            </td>
                            <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                                border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;">
                                <input name="BYWCMC" type="text" id="tj_bywcmc"  style="width: 50px;"/><font color="red">*</font>
                            </td>
                        </tr>
                        
                        <tr style="height: 35px;">
                         <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                 padding-right: 5px;">
                                <b><font color="#009ACD" style="font-size: 12px">本月完成情况（%）：</font></b>
                            </td>
                            <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                                border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;">
                               <span  id="tj_wcqk" ></span>
                            </td>
                            <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                 padding-right: 5px;">
                                <b><font color="#009ACD" style="font-size: 12px">截至开工段落：</font></b>
                            </td>
                            <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                                border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;" >
                                <input name="JZKGDL" type="text" id="tj_kgdl" style="width: 50px;" />
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
                            <td colspan="3" style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                                border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;">
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
                                <b><font color="#009ACD" style="font-size: 12px">情况说明：</font></b>
                            </td>
                            <td colspan="5" style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                                border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;">
                                <input name="QKSM" type="text" id="tj_qksm" style="width: 350px;" />
                            </td>
                           
                        </tr>
                        <tr style="height: 35px;">
                      		<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                color: #009ACD; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                padding-right: 5px;">填报人：
                            </td>
                            <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                                border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;" colspan="5">
                                <input type="text" id="tbman" />
                            </td>
                        </tr>
                        <tr style="height: 35px;">
                           
                            <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                 padding-right: 5px;">
                                <b><font color="#009ACD" style="font-size: 12px">上报时间：</font></b>
                            </td>
                            <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                                border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;">
                                <span id="tj_sbsj" ></span>
                            </td>
                            <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                 padding-right: 5px;">
                                <b><font color="#009ACD" style="font-size: 12px">月报月份：</font></b>
                            </td>
                            <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                                border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;" colspan="3">
<!--                                 <select id="tj_sbyf" onchange="getYuefen()"></select> -->
                                <input type="text" id='tj_sbyf' >
                            </td>
                        </tr>
                    </table>
                    <table width="100%" border="0" style="border-style: solid; border-width: 3px 1px 1px 1px;
                        margin-top: 20px; border-color: #55BEEE #C0C0C0 #C0C0C0 #C0C0C0; height: 45px;"
                        cellspacing="0" cellpadding="0">
                        <tr style="height: 30px;">
                            <td align="center">
                                <img src="${pageContext.request.contextPath}/images/Button/baocun1.gif" id="Img1" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/baocun2.gif'" alt="保存" onmouseout="this.src='${pageContext.request.contextPath}/images/Button/baocun1.gif'" style="cursor: hand" onclick="tjgcgzgjyb();" />
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