<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>工程改造路面升级月报上报</title>
	<link href="${pageContext.request.contextPath}/css/searchAndNavigation.css" type="text/css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/icon.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/util/jquery.cookie.js"></script>	
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YMLib.js"></script>
	<script type="text/javascript" src="js/gcxmjd.js"></script>
	<script type="text/javascript">
	$(function(){
		ybnf('nf',parent.obj.ybyf.substr(0,parent.obj.ybyf.indexOf('-')));
		ybyf('yf',parent.obj.ybyf.substr(parent.obj.ybyf.indexOf('-')+1,parent.obj.ybyf.length));
		getbyzjdw();
		if(parent.parent.obj1.XMBM.substr(10,1)=='4'){
			$(".yh").attr('style','');
			$(".fyh").attr('style','display:none');
		}else{
			$(".fyh").attr('style','');
			$(".yh").attr('style','display:none');
			if(parent.parent.obj1.XMBM.substr(10,1)=='5'){
				$(".zhhf").attr('style','');
			}else{
				$(".zhhf").attr('style','display:none');
			}
		}
		loadYbxx();
	});
	function loadYbxx(){
		var data=parent.obj;
		$("#zfcgs").numberbox('setValue',data.zfcgs);
		$("#zfgz").numberbox('setValue',data.zfgz);
		$("#zfsz").numberbox('setValue',data.zfsz);
		$("#zfzq").numberbox('setValue',data.zfzq);
		$("#zfdk").numberbox('setValue',data.zfdk);
		$("#zfdkyh").numberbox('setValue',data.zfdk);
		$("#zfjl").numberbox('setValue',data.zfjl);
		$("#zfqt").numberbox('setValue',data.zfqt);
		$("#zfqtyh").numberbox('setValue',data.zfqt);
		$("#zfdfzc").numberbox('setValue',data.zfdfzc);
		$("#zfyhdk").numberbox('setValue',data.zfyhdk);
		$("#zfrys").numberbox('setValue',data.zfrys);
		$("#wccgs").numberbox('setValue',data.wccgs);
		$("#wcgz").numberbox('setValue',data.wcgz);
		$("#wcsz").numberbox('setValue',data.wcsz);
		$("#wczq").numberbox('setValue',data.wczq);
		$("#wcdk").numberbox('setValue',data.wcdk);
		$("#wcdkyh").numberbox('setValue',data.wcdk);
		$("#wcjl").numberbox('setValue',data.wcjl);
		$("#wcqt").numberbox('setValue',data.wcqt);
		$("#wcqtyh").numberbox('setValue',data.wcqt);
		$("#wcdfzc").numberbox('setValue',data.wcdfzc);
		$("#wcyhdk").numberbox('setValue',data.wcyhdk);
		$("#wcrys").numberbox('setValue',data.wcrys);
		$("#yilc").numberbox('setValue',data.yilc);
		$("#erlc").numberbox('setValue',data.erlc);
		$("#sanlc").numberbox('setValue',data.sanlc);
		$("#silc").numberbox('setValue',data.silc);
		$("#lq").numberbox('setValue',data.lq);
		$("#sn").numberbox('setValue',data.sn);
		$("#bndsslc").numberbox('setValue',data.bndsslc);
		$("#ssdctc").numberbox('setValue',data.ssdctc);
		$("#wwcgcl").numberbox('setValue',data.wwcgcl);
		$("#tbsj").html(data.tbsj);$("#tbr").val(data.tbr);$("#qksm").val(data.qksm);
		$("#nf").combobox('setValue',data.ybyf.substr(0,data.ybyf.indexOf('-')));
		$("#yf").combobox('setValue',data.ybyf.substr(data.ybyf.indexOf('-')+1,data.ybyf.length));
	}

function shewcqk(){
	var dwb=$("#tj_zycgs").val();
	var dws=$("#tj_dfbz").val();
	var dwq=$("#tj_sttxdk").val();
	var wcb=$("#tj_qtzj").val();
	var wcs=$("#tj_bywctze").val();
	if(dwb=='') dwb=0;
	if(dws=='') dws=0;
	if(dwq=='') dwq=0;
	if(wcb=='') wcb=0;
	if(wcs=='') wcs=0;
	var pfztz=parent.parent.obj1.PFZTZ;
	if(parseFloat(pfztz)==0){
		$("#tj_wcqk").text("0");
	}else{
	$("#wcqk").text((parseFloat(wcs)/(parseFloat(pfztz))*100).toFixed(2));
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
                    <table width="100%" border="0" style="border-style: solid; border-width: 3px 1px 1px 1px;
                        border-color: #55BEEE #C0C0C0 #C0C0C0 #C0C0C0; height: 45px;" cellspacing="0"
                        cellpadding="0">
                        <tr style="height: 35px;">
                            <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                padding-right: 5px;">
                                <font color="#009ACD" style=" font-size: 12px">本月到位资金(万元)：</font>
                            </td>
                            <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                                border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;" colspan="5">
               					<table class='fyh'>
               					 <tr>
               					 	<td>车购税：</td><td><input id='dwcgs' type="text" class="easyui-numberbox" style="width: 50px;" readonly="readonly"></td>
               					 	<td>国债：</td><td><input id='dwgz' type="text" class="easyui-numberbox" style="width: 50px;" readonly="readonly"></td>
               					 	<td>省债：</td><td><input id='dwsz' type="text" class="easyui-numberbox" style="width: 50px;" readonly="readonly"></td>
               					 	<td>债券：</td><td><input id='dwzq' type="text" class="easyui-numberbox" style="width: 50px;" readonly="readonly"></td>
               					 	<td>厅贷款：</td><td><input id='dwdk' type="text" class="easyui-numberbox" style="width: 50px;" readonly="readonly"></td>
               					 </tr>
               					 <tr>
               						<td>奖励：</td><td><input id='dwjl' type="text" class="easyui-numberbox" style="width: 50px;" readonly="readonly"></td>
               					 	<td>其他：</td><td><input id='dwqt' type="text" class="easyui-numberbox" style="width: 50px;" readonly="readonly"></td>
               					 	<div class='zhhf'>
	               					 	<td>地方自筹：</td><td><input id='dwdfzc' type="text" class="easyui-numberbox" style="width: 50px;" readonly="readonly"></td>
	               					 	<td>银行贷款：</td><td><input id='dwyhdk' type="text" class="easyui-numberbox" style="width: 50px;" readonly="readonly"></td>
               					 	</div>
               					 </tr>
               					</table>
               					<table class='yh'>
               					 <tr>
               					 	<td>燃油税：</td><td><input id='dwrys' type="text" class="easyui-numberbox" style="width: 50px;" readonly="readonly"></td>
               					 	<td>厅贷款：</td><td><input id='dwdkyh' type="text" class="easyui-numberbox" style="width: 50px;" readonly="readonly"></td>
               					 	<td>其他：</td><td><input id='dwqtyh' type="text" class="easyui-numberbox" style="width: 50px;" readonly="readonly"></td>
               					 </tr>
               					</table>
               					
                            </td>
                        </tr>
                         <tr style="height: 35px;display: none">
                            <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                padding-right: 5px;">
                                <font color="#009ACD" style=" font-size: 12px">本月支付资金(万元)：</font>
                            </td>
                            <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                                border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;" colspan="5">
               					<table class='fyh'>
               					 <tr>
               					 	<td>车购税：</td><td><input id='zfcgs' type="text" class="easyui-numberbox" style="width: 50px;" value='0'></td>
               					 	<td>国债：</td><td><input id='zfgz' type="text" class="easyui-numberbox" style="width: 50px;" value='0'></td>
               					 	<td>省债：</td><td><input id='zfsz' type="text" class="easyui-numberbox" style="width: 50px;" value='0'></td>
               					 	<td>债券：</td><td><input id='zfzq' type="text" class="easyui-numberbox" style="width: 50px;" value='0'></td>
               					 	<td>厅贷款：</td><td><input id='zfdk' type="text" class="easyui-numberbox" style="width: 50px;" value='0'></td>
               					 </tr>
               					 <tr>
               						<td>奖励：</td><td><input id='zfjl' type="text" class="easyui-numberbox" style="width: 50px;" value='0'></td>
               					 	<td>其他：</td><td><input id='zfqt' type="text" class="easyui-numberbox" style="width: 50px;" value='0'></td>
               					 	<div class='zhhf'>
	               					 	<td>地方自筹：</td><td><input id='zfdfzc' type="text" class="easyui-numberbox" style="width: 50px;" value='0'></td>
	               					 	<td>银行贷款：</td><td><input id='zfyhdk' type="text" class="easyui-numberbox" style="width: 50px;" value='0'></td>
               					 	</div>
               					 </tr>
               					</table>
               					<table class='yh'>
               					 <tr>
               					 	<td>燃油税：</td><td><input id='zfrys' type="text" class="easyui-numberbox" style="width: 50px;" value='0'></td>
               					 	<td>厅贷款：</td><td><input id='zfdkyh' type="text" class="easyui-numberbox" style="width: 50px;" value='0'></td>
               					 	<td>其他：</td><td><input id='zfqtyh' type="text" class="easyui-numberbox" style="width: 50px;" value='0'></td>
               					 </tr>
               					</table>
                            </td>
                        </tr>
                         <tr style="height: 35px;">
                            <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                padding-right: 5px;">
                                <font color="#009ACD" style=" font-size: 12px">本月完成资金(万元)：</font>
                            </td>
                            <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                                border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;" colspan="5">
               					<table class='fyh'>
               					
               					<tr>
               					 	<td style="display: none;">车购税：</td><td><input id='wccgs' type="text" class="easyui-numberbox" style="width: 50px;" value='0'></td>
               					 	<td style="display: none;">国债：</td><td style="display: none;"><input id='wcgz' type="text" class="easyui-numberbox" style="width: 50px;" value='0'></td>
               					 	<td style="display: none;">省债：</td><td style="display: none;"><input id='wcsz' type="text" class="easyui-numberbox" style="width: 50px;" value='0'></td>
               					 	<td style="display: none;">债券：</td><td style="display: none;"><input id='wczq' type="text" class="easyui-numberbox" style="width: 50px;" value='0'></td>
               					 	<td style="display: none;">厅贷款：</td><td style="display: none;"><input id='wcdk' type="text" class="easyui-numberbox" style="width: 50px;" value='0'></td>
               					 </tr>
               					 <tr style="display: none;">
               						<td>奖励：</td><td><input id='wcjl' type="text" class="easyui-numberbox" style="width: 50px;" value='0'></td>
               					 	<td>其他：</td><td><input id='wcqt' type="text" class="easyui-numberbox" style="width: 50px;" value='0'></td>
               					 	<div class='zhhf'>
	               					 	<td>地方自筹：</td><td><input id='wcdfzc' type="text" class="easyui-numberbox" style="width: 50px;" value='0'></td>
	               					 	<td>银行贷款：</td><td><input id='wcyhdk' type="text" class="easyui-numberbox" style="width: 50px;" value='0'></td>
               					 	</div>
               					 </tr>
               					
               					</table>
               					<table class='yh'>
               					 <tr>
               					 	<td>燃油税：</td><td><input id='wcrys' type="text" class="easyui-numberbox" style="width: 50px;" value='0'></td>
               					 	<td>厅贷款：</td><td><input id='wcdkyh' type="text" class="easyui-numberbox" style="width: 50px;" value='0'></td>
               					 	<td>其他：</td><td><input id='wcqtyh' type="text" class="easyui-numberbox" style="width: 50px;" value='0'></td>
               					 </tr>
               					</table>
                            </td>
                        </tr>
                        
                        <tr style="height: 35px;">
                            <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                padding-right: 5px;">
                                <font color="#009ACD" style=" font-size: 12px">本月完成里程(公里)：</font>
                            </td>
                            <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                                border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;" colspan="5">
               					<table>
               					 <tr>
               					 	<td>按技术等级：</td>
               					 	<td>一级<input id='yilc' type="text" class="easyui-numberbox" style="width: 50px;" data-options="precision:3" value='0'></td>
               					 	<td>二级<input id='erlc' type="text" class="easyui-numberbox" style="width: 50px;" data-options="precision:3" value='0'></td>
               					 	<td>三级<input id='sanlc' type="text" class="easyui-numberbox" style="width: 50px;" data-options="precision:3" value='0'></td>
               					 	<td>四级<input id='silc' type="text" class="easyui-numberbox" style="width: 50px;" data-options="precision:3" value='0'></td>
               					 </tr>
               					 <tr>
               						<td>按路面类型：</td>
               						<td>沥青<input id='lq' type="text" class="easyui-numberbox" style="width: 50px;" data-options="precision:3" value='0'></td>
               					 	<td>水泥<input id='sn' type="text" class="easyui-numberbox" style="width: 50px;" data-options="precision:3" value='0'></td>
               					 	
               					 </tr>
               					</table>
               					
                            </td>
                        </tr>
                       <tr style="height: 35px;">
                            <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                padding-right: 5px;display: none;">
                                <font color="#009ACD" style=" font-size: 12px">本年度实施里程(公里)：</font>
                            </td>
                            <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                                border-bottom: 1px solid #C0C0C0;  text-align: left; padding-left: 10px;display: none;">
                                <input type="text" id="bndsslc" style="width: 50px;" class='easyui-numberbox' value='0'/><font color="red">*</font>
                            </td>
                            <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                padding-right: 5px;">
                                <font color="#009ACD" style=" font-size: 12px">完成垫层里程(公里)：</font>
                            </td>
                            <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                                border-bottom: 1px solid #C0C0C0;  text-align: left; padding-left: 10px;">
                                <input type="text" id="ssdctc"  style="width: 50px;" class="easyui-numberbox" data-options="precision:3" value='0'/><font color="red">*</font>
                            </td>
                            <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                padding-right: 5px;">
                                <font color="#009ACD" style=" font-size: 12px">未完成工程量(公里)：</font>
                            </td>
                            <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                                border-bottom: 1px solid #C0C0C0;  text-align: left; padding-left: 10px;">
                                <input type="text" id="wwcgcl"  style="width: 50px;" class="easyui-numberbox" data-options="precision:3" value='0'/><font color="red">*</font>
                            </td>
                            
                            <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                padding-right: 5px;">
                               
                            </td>
                            <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                                border-bottom: 1px solid #C0C0C0;  text-align: left; padding-left: 10px;">
          
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
                                <input type="text" id="qksm" style="width: 350px;" />
                            </td>
                        </tr>
					<tr style="height: 35px;">
						<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                            color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                             padding-right: 5px;">
                            <b><font color="#009ACD" style=" font-size: 12px">填报人：</font></b>
                        </td>
                        <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                            border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;">
                            <input type="text" id='tbr'  style="width: 100px;"/>
                        </td>
                        <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                            color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                             padding-right: 5px;">
                            <b><font color="#009ACD" style=" font-size: 12px">填报时间：</font></b>
                        </td>
                        <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                            border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;">
                            <span id="tbsj"></span>
                        </td>
                        <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                            color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                             padding-right: 5px;">
                            <b><font color="#009ACD" style=" font-size: 12px">月报月份：</font></b>
                        </td>
                        <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                            border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;" colspan="3">
                             <input type="text" class='easyui-combobox' id='nf' style="width: 55px;">-<input type="text" class='easyui-combobox' id='yf' style="width: 40px;">
                        </td>
                    </tr>
                    </table>

                    <table width="100%" border="0" style="border-style: solid; border-width: 3px 1px 1px 1px;
                        margin-top: 20px; border-color: #55BEEE #C0C0C0 #C0C0C0 #C0C0C0; height: 45px;"
                        cellspacing="0" cellpadding="0">
                        <tr style="height: 30px;">
                            <td align="center">
                                <img src="${pageContext.request.contextPath}/images/Button/baocun1.gif" id="Img1" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/baocun2.gif'" alt="保存" onmouseout="this.src='${pageContext.request.contextPath}/images/Button/baocun1.gif'" style="cursor: hand" onclick="xgyb();" />
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