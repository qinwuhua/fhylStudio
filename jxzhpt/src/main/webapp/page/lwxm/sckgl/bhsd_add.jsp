<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>审查库管理病害隧道项目</title>
<link rel="stylesheet" type="text/css" href="../../../easyui/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="../../../easyui/themes/icon.css" />
<link rel="stylesheet" type="text/css" href="../../../js/autocomplete/jquery.autocomplete.css" />
<script type="text/javascript" src="../../../easyui/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="../../../easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../../../easyui/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="../../../js/autocomplete/jquery.autocomplete.js" ></script>
<script type="text/javascript" src="../../../js/util/jquery.cookie.js"></script>
<script type="text/javascript" src="../../../js/YMLib.js"></script>
<script type="text/javascript" src="../js/Datagrid.js"></script>
<script type="text/javascript" src="../js/lwxm.js"></script>
<script type="text/javascript">
var xmkid;
var bzls;
$(function(){
// 	xmnf1("sck_xmnf");
	loadBmbm2("sck_jsxz", "建设性质");
	autoCompleteQLBH();
	$("#save_button").click(function(){
		var nf=new RegExp("^[1-9][0-9]{3}$");
		if($("#sddm").val()==null || $("#sddm").val()==''){
			alert("请填写隧道代码！");
			$("#sddm").focus();
			return false;
		}
		if($("#sck_sdcd").val()==null || $("#sck_sdcd").val()=='' || isNaN($("#sck_sdcd").val()) || parseFloat($("#sck_sdcd").val())<=0){
			alert("请填写正确的隧道长度！");
			$("#sck_sdcd").focus();
			return false;
		}
		if($("#sck_sdkd").val()==null || $("#sck_sdkd").val()=='' || isNaN($("#sck_sdkd").val()) || parseFloat($("#sck_sdkd").val())<=0){
			alert("请填写正确的隧道宽度！");
			$("#sck_sdkd").focus();
			return false;
		}
		if($("#sck_sdgd").val()==null || $("#sck_sdgd").val()=='' || isNaN($("#sck_sdgd").val()) || parseFloat($("#sck_sdgd").val())<=0){
			alert("请填写正确的隧道高度！");
			$("#sck_sdgd").focus();
			return false;
		}
		if($("#tzgs").val()==null|| $("#tzgs").val()==''|| isNaN($("#tzgs").val()) || parseFloat($("#tzgs").val())<=0){
			alert("请填写正确的投资估算金额！");
			$("#tzgs").focus();
			return false;
		}
		if($('#sck_xmnf').val()=="" || !nf.test($('#sck_xmnf').val())){
			alert("请正确填写项目年份！");
			return false;
		}
		var datas="sck_lxbm="+$("#lxbm").html()+
		"&sck_sdzxzh="+$("#sdzxzh").html()+"&sck_sddm="+$("#sddm").val()+
		"&sck_xmnf="+$("#sck_xmnf").val();
// 		alert(datas);
		$.ajax({
			type:'post',
			url:'/jxzhpt/xmsck/onceSckBhsd.do',
			dataType:'json',
	        data:datas,
			success:function(msg){
				if(Boolean(msg)){
					saveBhsd();
				}else{
					alert("该项目已添加，请勿重复添加！");
					return;
				}
			}
		});
	});
	$("#qx_window").click(function(){
		parent.$('#sck_add').window('destroy');
	});	
});
function autoCompleteQLBH(){
	var url = "/jxzhpt/xmjck/JckBhsdRoad.do";
	$("#sddm").autocomplete(url, {
		multiple : false,
		minChars :4,
		multipleSeparator : ' ',
		mustMatch: true,
  		cacheLength : 0,
  		delay : 200,
  		max : 50,
  		extraParams : {
  			sddm:function() {
  				var d = $("#sddm").val();
  				return d;
  			},
  			gydwbm:function() {
  				var d = $.cookie("unit2");
  				if(d=='_____36') return "";
  				else return d;
  			},
  			xzqhdm:function() {
  				var d = $.cookie("dist");
  				if(d=='360000') return "";
  				else return d;
  			}
  		},
  		dataType : 'json',// 返回类型
  		// 对返回的json对象进行解析函数，函数返回一个数组
  		parse : function(data) {
  			var aa = [];
  			aa = $.map(eval(data), function(row) {
  					return {
  						data : row,
  						value : row.sddm.replace(/(\s*$)/g,""),
  						result : row.sddm.replace(/(\s*$)/g,"")
  					};
  				});
  			return aa;
  		},
  		formatItem : function(row, i, max) {
  			return row.sddm.replace(/(\s*$)/g,"")+"("+row.sdzxzh+")"+"<br/>"+row.sdmc.replace(/(\s*$)/g,"");
  		}
  	}).result(
			function(e, item) {

				if(item==undefined) return ;
				$("#sdmc,#sdzxzh,#gydw,#xzqhdm,#xzqhmc,#lxmc,#lxbm,#sdcd,#sdkd,#sdgd,#pddj,#pdtime,#jsdj,#xjgjnd,#acdfl,#bhbw,#bhnr").attr("value",'');
				xmkid=item.id;
				$("#sdmc").html(item.sdmc);
				$("#sdzxzh").html(item.sdzxzh);
				$("#gydw").html(item.gydw);
				$("#xzqhdm").html(item.xzqhdm);
				$("#xzqhmc").html(item.xzqhmc);
				$("#lxbm").html(item.lxbm);
				$("#lxmc").html(item.lxmc);
				$("#sdcd").html(item.sdcd);
				$("#sdkd").html(item.sdkd);
				$("#sdgd").html(item.sdgd);
				$("#jsdj").html(item.jsdj);
				$("#pddj").html(item.pddj);
				$("#pdtime").html(item.pdtime);
				$("#jsjd").html(item.jsjd);
				$("#jswd").html(item.jswd);
				$("#xjgjnd").html(item.xjgjnd);
				$("#acdfl").html(item.acdfl);
				$("#xmnf").html(item.xmnf);
				$("#bhbw").html(item.bhbw);
				$("#bhnr").html(item.bhnr);
				$("#bz").html(item.bz);
				$("#xmmc").html(item.xmmc);
				$("#jsxz").html(item.jsxz);
				$("#nsddm").html(item.nsddm);
				$("#nlxbm").html(item.nlxbm);
				$("#nlxmc").html(item.nlxmc);
				$("#nsdzxzh").html(item.nsdzxzh);
				$("#sck_nsddm").val(item.nsddm);
				$("#sck_nlxbm").val(item.nlxbm);
				$("#sck_nlxmc").val(item.nlxmc);
				$("#sck_nsdzxzh").val(item.nsdzxzh);
			});
}
function saveBhsd(){
	var sbthcd=$.cookie("unit2").length;
	var data ="xmkid="+xmkid+"&spdw="+$("#spdw").val()+"&sjdw="+$("#sjdw").val()+
	"&spwh="+$("#spwh").val()+"&tzgs="+$("#tzgs").val()+
	"&sck_jsxz="+$("#sck_jsxz").combobox("getValue")+"&zyjsnr="+$("#zyjsnr").val()+"&scbz="+$("#scbz").val()+
	"&scbmbm="+$.cookie("unit")+"&sck_sddm="+$("#sddm").val()+"&sck_lxbm="+$("#lxbm").html()+"&sck_lxmc="+$("#lxmc").html()+"&sck_sdzxzh="+$("#sdzxzh").html()+
	"&sck_sbthcd="+sbthcd+"&sck_xmnf="+$("#sck_xmnf").val()+"&sck_sdcd="+$("#sck_sdcd").val()+"&sck_sdkd="+$("#sck_sdkd").val()+"&sck_sdgd="+$("#sck_sdgd").val()+
	"&sck_nsddm="+$("#sck_nsddm").val()+"&sck_nlxbm="+$("#sck_nlxbm").val()+"&sck_nlxmc="+$("#sck_nlxmc").val()+"&sck_nsdzxzh="+$("#sck_nsdzxzh").val();
// 	alert(data);
	$.ajax({
		type:'post',
		url:'/jxzhpt/xmsck/insertSckbhsd.do',
        data:data,
		dataType:'json',
		success:function(msg){
			if(Boolean(msg)){
				parent.sckglBhsd();
				alert("保存成功！");
				parent.$('#sck_add').window('destroy');
				
			}else{
				alert('保存失败！');
			}
		}
	});  
}

function bzWqgz(){
	var datas="lxbm="+$("#lxbm").html()+"&qlzxzh="+$("#qlzxzh").html()+"&qlbh="+$("#qlbh").val();
	$.ajax({
		type:'post',
		url:'/jxzhpt/xmsck/bzWqgz.do',
		dataType:'json',
        data:datas,
		success:function(msg){
			if(Boolean(msg)){
				bzls="无";
				saveWqgz();
			}else{
				if(confirm('该项目有补助历史，你确定继续提交吗？')){
					bzls="有";
					saveWqgz();
				}
			}
		}
	});
}
</script>
<style type="text/css">
TD {
font-size: 12px;
}
a{
text-decoration:none;
}
</style>
</head>
<body>
<table style="width: 98%; margin-top: 15px;margin-left: 10px; background-color: #aacbf8; font-size: 12px"
			border="0" cellpadding="3" cellspacing="1">
			<tr style="height: 25px;">
				<td colspan="6" style="border-style: none none solid none; border-width: 1px; color: #55BEEE; font-weight: bold; font-size: small; text-align: left; background-color: #F1F8FF; width: 15%; padding-left: 10px;">
					病害隧道项目基本信息
				</td>
			</tr>
			<tr style="height: 35px;">
			    <td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right"><font color='red' size='2'>*&nbsp;</font>隧道代码：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input type="text" name="sddm"id="sddm" style="width: 150px" />
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">项目名称：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<span id="xmmc"></span>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">建设性质：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
                    <span id="jsxz"></span>
			    </td>
				
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">修建/改建年度：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
                    <span id="xjgjnd"></span>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">隧道名称：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<span id="sdmc"></span>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">隧道中心桩号：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="sdzxzh"></span>
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">管养单位：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="gydw"></span>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">行政区划代码：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="xzqhdm"></span>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">行政区划名称：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="xzqhmc"></span>
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">路线名称：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="lxmc"></span>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">路线编码：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="lxbm"></span>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">项目年份：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
                    <span id="xmnf"></span>
                </td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">隧道全长(米)：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="sdcd"></span>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">隧道净宽(米)：</td>
				<td style="background-color: #ffffff; height: 20px;width:15%" align="left">
					<span id="sdkd"></span>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">隧道宽度(米)：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="sdgd"></span>
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">技术等级：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
				    <span id="jsdj"></span>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">评定等级：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="pddj"></span>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">评定日期</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="pdtime"></span>
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">隧道分类：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="acdfl"></span>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">进遂经度：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="jsjd"></span>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">进遂纬度</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="jswd"></span>
				</td>
				
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">新路线编码：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="nlxbm"></span>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">新路线名称：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="nlxmc"></span>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right"></td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
				</td>
			</tr>
			<tr style="height: 35px;">
			    <td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">新隧道代码：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<span id="nsddm"></span>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">新隧道中心桩号：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="nsdzxzh"></span>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right"></td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">病害部位：</td>
				<td colspan="5" style="background-color: #ffffff; height: 20px;" align="left">
					<span id="bhbw"></span>
			    </td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">病害内容：</td>
				<td colspan="5" style="background-color: #ffffff; height: 20px;" align="left">
					<span id="bhnr"></span>
			    </td>
			</tr>
			<tr>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">备&nbsp;&nbsp;注：</td>
				<td colspan="5" style="background-color: #ffffff; height: 20px;" align="left">
					<span id="bz"></span>
				</td>
			</tr>
			<tr style="height: 25px;">
				<td colspan="6" style="border-style: none none solid none; border-width: 1px; color: #55BEEE; font-weight: bold; font-size: small; text-align: left; background-color: #F1F8FF; width: 15%; padding-left: 10px;">
					病害隧道项目审查信息
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right"><font color='red' size='2'>*&nbsp;</font>隧道长度(米)：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" name="sck_sdcd" id="sck_sdcd" style="width: 150px" />
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right"><font color='red' size='2'>*&nbsp;</font>隧道宽度(米)：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" name="sck_sdkd"id="sck_sdkd" style="width: 150px" />
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right"><font color='red' size='2'>*&nbsp;</font>隧道高度(米)：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" name="sck_sdgd" id="sck_sdgd" style="width: 150px" />
				</td>
			</tr>
			<tr style="height: 30px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">审批单位：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" name="spdw" id="spdw" style="width: 150px" /></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">设计单位：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" name="sjdw"id="sjdw" style="width: 150px" />
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">审批文号：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" name="spwh" id="spwh" style="width: 150px" />
				</td>
			</tr>
			<tr style="height: 30px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">项目年份：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
<!-- 					<select id="sck_xmnf"  style="width:155px" class="easyui-combobox" data-options="panelHeight:'100'"> -->
<!--                     </select> -->
                    <input id="sck_xmnf"  style="width:155px"/>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right"><font color='red' size='2'>*&nbsp;</font>投资估算：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" name="tzgs"id="tzgs" style="width: 115px" />&nbsp;万元</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">建设性质：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<select id="sck_jsxz" class="easyui-combobox" style="width: 115px">
					</select>
				</td>
			</tr>
			<tr style="height: 35px;">
			    <td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">新隧道代码：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input type="text" name="sck_nsddm"id="sck_nsddm" style="width: 115px" />
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">新隧道中心桩号：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" name="sck_nsdzxzh"id="sck_nsdzxzh" style="width: 115px" />
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right"></td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">新路线编码：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" name="sck_nlxbm"id="sck_nlxbm" style="width: 115px" />
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">新路线名称：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" name="sck_nlxmc"id="sck_nlxmc" style="width: 115px" />
				</td>
				 <td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right"></td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
				</td>
			</tr>
			<tr style="height: 30px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">主要建设内容：</td>
				<td colspan="5" style="background-color: #ffffff; height: 20px;" align="left">
					<textarea id="zyjsnr"rows="2"  style="width:99%"></textarea>
				</td>
				
			</tr>
			<tr style="height: 30px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">备&nbsp;&nbsp;注：</td>
				<td colspan="5" style="background-color: #ffffff; height: 20px;" align="left">
					<textarea id="scbz"rows="2" style="width:99%"></textarea>
				</td>
			</tr>
			<tr style="height: 30px;">
				<td colspan="6" style="background-color: #ffffff; height: 30px;"
					align="center"><a href="javascript:void(0)" id="save_button"
					class="easyui-linkbutton" plain="true" iconCls="icon-save">保存</a> <a
					href="javascript:void(0)" id="qx_window"
					class="easyui-linkbutton" plain="true" iconCls="icon-cancel">取消</a></td>
			</tr>
			</table>
</body>
</html>