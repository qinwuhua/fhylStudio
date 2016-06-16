<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>基础库管理危桥改造项目</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/easyui/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/easyui/themes/icon.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/js/autocomplete/jquery.autocomplete.css" />
<script type="text/javascript" src="${pageContext.request.contextPath }/easyui/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/easyui/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/uploader/swfobject.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/uploader/jquery.uploadify.v2.1.4.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/autocomplete/jquery.autocomplete.js" ></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/autocomplete/jquery.autocomplete.js" ></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/util/jquery.cookie.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/YMLib.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/page/lwxm/js/lwxm.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/page/lwxm/js/wqsj.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/page/jhgl/js/wqsj.js"></script>
<script type="text/javascript">
function xmnf2(id){
	var myDate = new Date();
	var years=[];
	var first;
	for(var i=0;i<=10;i++){
		if(i==0)
			first=myDate.getFullYear()-i;
		years.push({text:(myDate.getFullYear()+5-i),value:(myDate.getFullYear()+5-i)});
	}
	$('#'+id).combobox({
	    data:years,
	    valueField:'value',
	    textField:'text',
	});
	$('#'+id).combobox("setValue",first);
}
$(function(){
	xmnf2("jhkgsj");
	xmnf2("jhwgsj");
	xmnf1("sbnf");
	loadJhkxx();
	$('#jhjsxz').combobox({onChange: function(group){loadBz();}});
	$('#sfylrbwqk').combobox({onChange: function(group){loadBz();}});
});
function loadJhkxx(){
	$.ajax({
		 type : "POST",
		 url : "/jxzhpt/jhgl/loadwqgzjhkbyid.do",
		 dataType : 'json',
		 data : 'id='+parent.obj,
		 success : function(msg){
			 sckid=msg.sckid;
			 xmkid=msg.xmkid;
			 loadSckxx(msg.sckid);
			 $("#sfylrbwqk").combobox('setValue',msg.sfylrbwqk);
			 //$("#jhjsxz").combobox('setValue',msg.jhjsxz);
			 $("#sbnf").combobox('setValue',msg.sbnf);
			 $("#jhkgsj").combobox('setValue',msg.jhkgsj);
			 $("#jhwgsj").combobox('setValue',msg.jhwgsj);
			 //$("#sjdw").val(msg.sjdw);
			// $("#sjpfdw").val(msg.sjpfdw);
			 //$("#jhpfwh").val(msg.pfwh);
			// $("#pfsj").datebox('setValue',msg.pfsj);
			 radioChecked("sfsqablbz",msg.sfsqablbz);
			if(msg.sfsqablbz=="否"){
				$('#ablbzwh').attr("disabled",'true');
			}
			 $("#ablbzwh").val(msg.ablbzsqwh);
			 $("#pfztz").val(msg.pfztz);
			 if(msg.sfylrbwqk=='是'){
				 $("#shengbz").val(msg.jhsybzje);
			 }else{
				 $("#shengbz").val(msg.shengbz);
			 }
			 $("#dfzc").html(msg.jhsydfzcje);
			 //$("#qlszxz").val(msg.qlszxz);
			 $("#qljsgm").val(msg.qljsgm);
			 $("#zyjsnr").val(msg.zyjsnr);
			 $("#jhbz").val(msg.bz);
			 $("#jhqlqc").val(msg.jhqlqc);
			 $("#jhqlqk").val(msg.jhqlqk);
			 $("#nsqsjl").val(msg.nsqsjl);
			 $("#shijbz").numberbox('setValue',msg.shijbz);
			 $("#xianjbz").numberbox('setValue',msg.xianjbz);
			 
			// loadSbz(msg.sckid);
						
		 }
	});
}
var sbz;
var sckid;
function loadBz(){
	/* 
	var jhqlqcVal = $("#jhqlqc").val();
	var jhqlqkVal = $("#jhqlqk").val();
	
	var reg =/[^\d]/g;
	if(reg.test(jhqlqcVal)){
		alert("请填写数字");
		$("#jhqlqc").val("");
	    $("#jhqlqc").css("background-color","darkorange");
		return false;
	}else{
		 $("#jhqlqc").css("background-color","");
	}
	if(reg.test(jhqlqkVal)){
		alert("请填写数字");
		$("#jhqlqk").val("");
		 $("#jhqlqk").css("background-color","darkorange");
		return false;
	}else{
		 $("#jhqlqk").css("background-color","");
	}
	 */
	var sfbk=$("#sfylrbwqk").combobox('getValue');
	if(sfbk=='是'){
		loadBbz();
	}else{
		loadSbz();
	}
	
	setshengjl();
}
function loadSbz(){
	$.ajax({
		 type : "POST",
		 url : "/jxzhpt/jhgl/loadwqgzsbzbyid.do",
		 dataType : 'json',
		 data : 'id='+sckid+'&jsxz='+$("#jsxz").html(),
		 success : function(item){
			 sbz=Math.round(parseFloat(item.shengbz));
			 
			 $("#trshengbz").html("小于等于"+Math.round(parseFloat(item.shengbz)));
		 }
	 });
}
function loadBbz(id){
	$.ajax({
		 type:'post',
			url:'/jxzhpt/jhgl/lwBzbz.do',
			data:"bzbz.xmlx="+"危桥"+"&bzbz.lx="+$("#jsxz").html(),
			dataType:'json',
			async:false,
			success:function(data){
				var bz=data.bz;
				var bl=data.bl;
				var fd=data.fd;
				if($('#jhqlqc').val()!=''||$('#jhqlqc').val()!=null){
					jhqlqc=$('#jhqlqc').val();
				}
				if($('#jhqlqk').val()!=''||$('#jhqlqk').val()!=null){
					jhqlqk=$('#jhqlqk').val();
				}
				var bzzj=(parseFloat(jhqlqc)*1000000000000000*parseFloat(jhqlqk)*parseFloat(bz)+parseFloat(fd)*1000000000000000)/1000000000000000;
				sbz=Math.round(parseFloat(bzzj.toFixed(3)));
				 if(parseFloat($("#pfztz").val())*0.6<parseFloat(sbz)){
					 $("#trshengbz").html("小于等于"+Math.round(parseFloat($("#pfztz").val())*0.6));
					}else
				$("#trshengbz").html("小于等于"+Math.round(parseFloat(bzzj.toFixed(3))));
		 }
	 });
}

function loadJckxx(id){
	$.ajax({
		 type : "POST",
		 url : "/jxzhpt/jhgl/loadwqgzxmkbyid.do",
		 dataType : 'json',
		 data : 'id='+id,
		 success : function(item){
			 	fileShow2(item.id,"桥梁正面文件");
				fileShow3(item.id,"桥梁侧面文件");
				$("#qlbh").html(item.qlbh);
				$("#qlmc").html(item.qlmc);
				$("#qlzxzh").html(item.qlzxzh);
				$("#gydw").html(item.gydw);
				$("#xzqhmc").html(item.xzqhmc);
				$("#xzqhdm").html(item.xzqhdm);
				$("#lxmc").html(item.lxmc);
				$("#lxbm").html(item.lxbm);
				$("#kjzc").html(item.kjzc);
				$("#qlqc").html(item.qlqc);
				$("#qlkd").html(item.qlkd);
				$("#dkzdkj").html(item.dkzdkj);
				$("#jsdj").html(item.jsdj);
				$("#pddj").html(item.pddj);
				$("#xjgjnd").html(item.xjgjnd);
				$("#akjfl").html(item.akjfl);
				$("#sbjgxs").html(item.sbjgxs);
				$("#xmnf").html(item.xmnf);
				$("#xmtype").html(item.xmtype);
				$("#bhnr").html(item.bhnr);
				$("#bz").html(item.bz);
				$("#tsdq").html(item.tsdq);
				$("#qlyhgcs").html(item.qlyhgcs);
				$("#qljggcs").html(item.qljggcs);
				$("#xmrksj").html(item.xmrksj);
				$("#czyjhjy").html(item.czyjhjy);
				$("#sqs").html(item.sqs);$("#xsq").html(item.xsq);$("#szxz").html(item.szxz);
				$("#synf").html(item.synf);$("#sjhspl").html(item.sjhspl);$("#qxjkuan").html(item.qxjkuan);
				$("#qxjkong").html(item.qxjkong);$("#zqks").html(item.zqks);$("#qmjk").html(item.qmjk);$("#kydwlx").html(item.kydwlx);
				$("#thdj").html(item.thdj);$("#glqlyt").html(item.glqlyt);$("#qdlx").html(item.qdlx);
				$("#qtlx").html(item.qtlx);$("#pzlx").html(item.pzlx);
		 }
	});
}
function loadSckxx(id){
	$.ajax({
		 type : "POST",
		 url : "/jxzhpt/jhgl/loadwqgzsckbyid.do",
		 dataType : 'json',
		 data : 'id='+id,
		 success : function(item){
			 loadJckxx(item.xmkid);
			 sjtfileShow(item.sckid);
			 if($("#jhqlqc").val()==''){
				 $("#jhqlqc").val(item.scqlqc);
			 }
			 if($("#jhqlqk").val()==''){
				 $("#jhqlqk").val(item.scqlqk);
			 }
			 if($("#qlszxz").val()==''){
				 $("#qlszxz").val(item.scszxz);
			 }
			 $("#scqlqc").html(item.scqlqc);
				$("#scqlqk").html(item.scqlqk);
				$("#scxmnf").html(item.scxmnf);
				$("#fapgdw").html(item.fapgdw);
				$("#fascdw").html(item.fascdw);
				$("#faspsj").html(item.faspsj);
				$("#spwh").html(item.spwh);
				$("#jsxz").html(item.jsxz);
				$("#tzgs").html(item.tzgs);
				$("#sjdwmc").html(item.sjdwmc);
				$("#jsgmqc").html(item.jsgmqc);
				$("#jsgmqk").html(item.jsgmqk);
				$("#hzdj").html(item.hzdj);
				$("#scsjhspl").html(item.scsjhspl);
				$("#sck_sbjgxs").html(item.sck_sbjgxs);
				$("#kjzh").html(item.kjzh);
				kjzh=item.kjzh.split("*")[1];
				$("#ztz").html(item.ztz);
				$("#sck_xbjgxs").html(item.sck_xbjgxs);
				$("#sgtpfsj").html(item.sgtpfsj);
				$("#pfwh").html(item.pfwh);
				$("#zgq").html(item.zgq);
				$("#jsnr").html(item.jsnr);
				$("#scbz").html(item.scbz);
				$("#nsqbbz").html(item.nsqbbz);$("#rksj").html(item.rksj);$("#cjqz").html(item.cjqz);
				$("#scthdj").html(item.scthdj);$("#qljc").html(item.qljc);$("#ydgldj").html(item.ydgldj);
				$("#sjsd").html(item.sjsd);$("#scsqs").html(item.scsqs);$("#scxsq").html(item.scxsq);$("#scszxz").html(item.scszxz);
				bzSum();
				loadBz();
				
				//setshengjl();
		 }
	});
}
var kjzh;
var xmkid;
function sjtfileShow(id){
	//加载文件
	$.ajax({
		type:'post',
		url:'/jxzhpt/jhgl/queryFjByParentId.do',
		dataType:'json',
		data:'uploads.id='+id,
		success:function(data){
	/* 		var data=datas.rows; */
		/* 	alert(data); */
			$("#sjsgtTable").empty();
			var gkbg="";
			var sjsgt="";
			for ( var i = 0; i < data.length; i++) {
				if(data[i].filetype=="设计施工图"){
					//alert(data[i].fileurl);
					sjsgt += "<tr><td style='background-color: #ffffff; height: 25px;' align='left'>" + data[i].filename +"</td><td style='background-color: #ffffff; height: 25px;' align='left'>"
					+'<a href="javascript:void(0)" style="text-decoration:none;color:#3399CC;" onclick="sjtdownFile('+"'"+data[i].fileurl.replace(/\\/g,"%2F")+"',"+"'"+data[i].filename+"'"+')">下载</a></td></tr>';
				}
				}
			$("#sjsgtTable").append(sjsgt);
		}
	});
}
function sjtdownFile(fileurl,filename){
	parent.window.location.href="/jxzhpt/jhgl/downAbgcFile.do?uploads.fileurl="+fileurl+"&uploads.filename="+filename;
}
function radioChecked(name,value){
	$.each($("input[name='"+name+"']"),function(index,item){
		if($(item).val()==value){
			$(item).attr('checked','true');
		}
	});
}
function ablwhDis(value){
	if(value=="是"){
		$('#ablbzwh').removeAttr("disabled");
	}else{
		$('#ablbzwh').attr("disabled",'true');
	}
}

function bzSum(){
	var pfztz;var sbz;var trzjdx;
	
	var pfztzVal = $("#pfztz").val();
	var shengbzVal = $("#shengbz").val();
	
	var reg =/(\d+)(\d{3})/;
	if(reg.test(pfztzVal)){
		alert(pfztzVal+"不为数字，请填写数字");
		$("#pfztz").val("");
		 $("#pfztz").css("background-color","darkorange");
		return false;
	}else{
		 $("#pfztz").css("background-color","");
	}
	if(reg.test(shengbzVal)){
		alert(shengbzVal+"不为数字，请填写数字");
		$("#shengbz").val("");
		$("#shengbz").css("background-color","darkorange");
		return false;
	}else{
		 $("#shengbz").css("background-color","");
	}
	
	if($("#pfztz").val()==null||$("#pfztz").val()==''){
		pfztz=0;
	}else{
		pfztz=$("#pfztz").val();
	}
	if($("#shengbz").val()!=''){
		sbz=$("#shengbz").val();
	}else{
		sbz=0;
	}
	if(parseFloat(pfztz)*0.6<parseFloat(sbz)){
		trzjdx=Math.round(parseFloat(pfztz)*0.6);
	}
	else{
		trzjdx=Math.round(parseFloat(sbz));
	}
	if($("#sfylrbwqk").combobox('getValue')=='是')
	$("#trshengbz").html("小于等于"+trzjdx);
	else
		$("#trshengbz").html("小于等于"+sbz);
	if(parseFloat(pfztz)<parseFloat(500)){
		$("#sfsqablbz1").attr('checked','true');
		$("#sfsqablbz0").attr('disabled','true');
		$("#sfsqablbz1").attr('disabled','true');
		document.getElementById("ablbzwh").disabled=true;
	}else{
		$("#sfsqablbz0").attr('checked','true');
		$("#sfsqablbz0").removeAttr('disabled');
		$("#sfsqablbz1").removeAttr('disabled');
		document.getElementById("ablbzwh").disabled=false;
	}
	if($("#shengbz").val()!='')
	$("#dfzc").html(accSub(pfztz, $("#shengbz").val()));
}
function setshengbz(){
	if($("#shengbz").val()!=''){
		if($("#sfylrbwqk").combobox('getValue')=='是'){
		if(parseFloat($("#shengbz").val())>parseFloat(sbz)){
			alert("请按照提示填写补助金额");
			$("#shengbz").val('');
		}
		}
		bzSum();
	}
}
//查询省奖励资金
function setshengjl(){
	/* 
	
	$.ajax({
		 type : "POST",
		 url : "/jxzhpt/jhgl/loadwqgzsjlbyid.do",
		 dataType : 'json',
		 data : 'id='+sckid,
		 success : function(item){
			 $("#nsqsjl").val(item.nsqsjl);
		 }
	 }); */
	var kjfl="";
	if(parseInt(kjzh)>=40)
		kjfl="大桥";
	if(parseInt(kjzh)>=20 && parseInt(kjzh) < 40)
		kjfl="中桥";
	
	$.ajax({
		 type : "POST",
		 url : "/jxzhpt/jhgl/loadwqgzsjlbyid1.do",
		 dataType : 'json',
		 data : 'planwqgzsj.id='+xmkid+"&planwqgzsj.akjfl="+kjfl+"&planwqgzsj.scqlqc="+$("#jhqlqc").val()+"&planwqgzsj.scqlqk="+$("#jhqlqk").val(),
		 success : function(item){
			// $("#nsqsjl").val(item.nsqsjl);
			 $("#nsqsjl").val(item.nsqsjl);
		 }
	 });
	 
}


function editWqgz(){
	if($("#shengbz").val()==''||$("#pfztz").val()==''){
		alert("批复总投资或补助金额未填写正确");
		return
	}
	var nsqbbz1=$("#shengbz").val();
	if($("#sfylrbwqk").combobox('getValue')=='是'){
		if(parseFloat(nsqbbz1)>parseFloat(sbz)){
			alert("请按提示填写正确的补助金额");
			$("#shengbz").val('');
			return;
		}
	}
	
	if(parseFloat($("#shengbz").val())>parseFloat($("#pfztz").val())){
		alert("总投资不能小于补助金额");
		return;
	}
	var jhsybzje=0;
	var shengbz=0;
	if($("#sfylrbwqk").combobox('getValue')=='是'){
		jhsybzje=$("#shengbz").val();
	}else{
		shengbz=$("#shengbz").val();
	}
	var data="planwqgzsj.id="+parent.obj+"&planwqgzsj.sbnf="+$("#sbnf").combobox('getValue')+"&planwqgzsj.jhkgsj="+$("#jhkgsj").datebox('getValue')
	+"&planwqgzsj.jhwgsj="+$("#jhwgsj").datebox('getValue')
	+"&planwqgzsj.sjdw="+''+"&planwqgzsj.sjpfdw="+''
	+"&planwqgzsj.pfwh="+''+"&planwqgzsj.pfsj="+''
	+"&planwqgzsj.sfsqablbz="+$("input[name='sfsqablbz']:checked").val()
	+"&planwqgzsj.ablbzsqwh="+$("#ablbzwh").val()+"&planwqgzsj.pfztz="+$("#pfztz").val()+"&planwqgzsj.shengbz="+shengbz+"&planwqgzsj.jhsybzje="+jhsybzje+"&planwqgzsj.jhsydfzcje="+$("#dfzc").html()
	+"&planwqgzsj.qlszxz="+''+"&planwqgzsj.zyjsnr="+$("#zyjsnr").val()
	+"&planwqgzsj.sfylrbwqk="+$("#sfylrbwqk").combobox('getValue')+"&planwqgzsj.bz="+$("#jhbz").val()+"&planwqgzsj.jhjsxz="+$("#jsxz").html()
	+"&planwqgzsj.jhqlqc="+$("#jhqlqc").val()+"&planwqgzsj.jhqlqk="+$("#jhqlqk").val()
	+"&planwqgzsj.nsqsjl="+$("#nsqsjl").val()+"&planwqgzsj.shijbz="+$("#shijbz").val()+"&planwqgzsj.xianjbz="+$("#xianjbz").val();
	$.ajax({
		type:'post',
		url:'/jxzhpt/jhgl/editwqgzsj.do',
		dataType:'json',
		data:data,
		success:function(msg){
			if(msg){
				alert("保存成功");
				parent.$("#grid").datagrid('reload');
				parent.tjwqgz();
				parent.$('#wq_edit').window('destroy');
			}
		}
	});
}

function loadxxx(){
	alert("xxxxxxxxx");
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
					危桥改造项目基本信息
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">桥梁编号：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<span id='qlbh'></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">桥梁名称：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<span id="qlmc"></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">桥梁中心桩号：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="qlzxzh"></span></td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">管养（监管）单位：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="gydw"></span>
					<input type="text" id="gydwbm" style="display:none"/></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">行政区划代码：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="xzqhdm"></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">行政区划名称：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="xzqhmc"></span></td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">路线名称：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="lxmc"></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">路线编码：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="lxbm"></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">跨径总长(米)：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="kjzc"></span></td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">桥梁全长(米)：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="qlqc"></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">桥梁全宽(米)：</td>
				<td style="background-color: #ffffff; height: 20px;width:15%" align="left">
					<span id="qlkd"></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">单孔最大跨径(米)：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="dkzdkj"></span></td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">技术状况评定：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="jsdj"></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">评定等级：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="pddj"></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">修建/改建年度：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="xjgjnd"></span></td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">按跨径分类：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="akjfl"></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">上部结构形式：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="sbjgxs"></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">特殊地区：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="tsdq"></span>
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">项目状态：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="xmtype"></span></td>
			<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">设区市：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="sqs"></span>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">县（市、区）：</td>
				<td  style="background-color: #ffffff; height: 20px;" align="left">
					<span id="xsq"></span>
				</td>
			</tr>
			
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">所在乡镇：</td>
				<td  style="background-color: #ffffff; height: 20px;" align="left">
					<span id="szxz"></span>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">按建筑材料和&nbsp;&nbsp;<br>使用年限分类：</td>
				<td  style="background-color: #ffffff; height: 20px;" align="left">
					<span id="synf"></span>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">设计洪水频率(年)：</td>
				<td  style="background-color: #ffffff; height: 20px;" align="left">
					<span id="sjhspl"></span>
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">桥下净宽（米）：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="qxjkuan"></span>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">桥下净空（米）：</td>
				<td  style="background-color: #ffffff; height: 20px;" align="left">
					<span id="qxjkong"></span>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">主桥孔数（孔）：</td>
				<td  style="background-color: #ffffff; height: 20px;" align="left">
					<span id="zqks"></span>
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">桥面净宽（米）：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="qmjk"></span>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">跨越地物类型：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="kydwlx"></span>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">通航等级：</td>
				<td  style="background-color: #ffffff; height: 20px;" align="left">
					<span id="thdj"></span>
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">公路桥梁用途：</td>
				<td  style="background-color: #ffffff; height: 20px;" align="left">
					<span id="glqlyt"></span>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">桥墩类型：</td>
				<td  style="background-color: #ffffff; height: 20px;" align="left">
					<span id="qdlx"></span>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">桥台类型：</td>
				<td  style="background-color: #ffffff; height: 20px;" align="left">
					<span id="qtlx"></span>
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">铺装类型：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="pzlx"></span>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">入库时间：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="xmnf"></span>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">桥梁养护工程师：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="qlyhgcs"></span></td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">桥梁监管工程师：</td>
				<td colspan="5" style="background-color: #ffffff; height: 20px;" align="left">
					<span id="qljggcs"></span>
				</td>
				
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">病害内容：</td>
				<td colspan="5" style="background-color: #ffffff; height: 20px;" align="left">
					<span id="bhnr"></span>
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">处置意见和建议：</td>
				<td colspan="5" style="background-color: #ffffff; height: 20px;" align="left">
					<span id="czyjhjy"></span>
				</td>
			</tr>
			<tr>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">备&nbsp;&nbsp;注：</td>
				<td colspan="5" style="background-color: #ffffff; height: 20px;" align="left">
					<span id="bz"></span>
				</td>
			</tr>
			<tr>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">桥梁正面照片：</td>
				<td id="td_jgtc" colspan="5" style="background-color: #ffffff; height: 20px;" align="left">
					<table style="margin-top:10px;background-color: #aacbf8; font-size: 12px" border="0"
								cellpadding="1" cellspacing="1">
						<tbody id="qlzmTable"></tbody>
					</table>
					
				</td>
			</tr>
			<tr>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">桥梁侧面照片：</td>
				<td id="td_wgys" colspan="5" style="background-color: #ffffff; height: 20px;" align="left">
					<table style="margin-top:10px;background-color: #aacbf8; font-size: 12px" border="0"
								cellpadding="1" cellspacing="2">
						<tbody id="qlcmTable"></tbody>
					</table>
					
				</td>
			</tr>
			<tr style="height: 25px;">
				<td colspan="6" style="border-style: none none solid none; border-width: 1px; color: #55BEEE; font-weight: bold; font-size: small; text-align: left; background-color: #F1F8FF; width: 15%; padding-left: 10px;">
					危桥改造项目审查信息
				</td>
			</tr>
			<tr style="height: 30px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">桥梁全长(米)：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="scqlqc"></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">桥梁全宽(米)：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="scqlqk"></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">项目年份：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="scxmnf"></span>
				</td>
			</tr>
			<tr style="height: 30px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">方案评估(设计)单位：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="fapgdw"></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">方案审核(批复)单位：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="fascdw"></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">方案(施工图)批复时间：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="faspsj"></span>
				</td>
			</tr>
			<tr style="height: 30px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">审批文号：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="spwh"></span></td>
				
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">建设性质：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="jsxz"></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">荷载等级：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="hzdj"></span></td>
			</tr>
			
			<tr style="height: 30px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">设计洪水频率：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="scsjhspl"></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">跨径组合：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="kjzh"></span></td>
					<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">上部结构形式：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="sck_sbjgxs"></span>
				</td>
			</tr>
			<tr style="height: 30px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">下部结构形式：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="sck_xbjgxs"></span>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">总工期：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="zgq"></span>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">重建桥址：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="cjqz"></span>米</td>
			</tr>
			<tr style="height: 30px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">通航等级：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="scthdj"></span>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">桥梁基础：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="qljc"></span></td>
					<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">引道行政等级：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="ydgldj"></span></td>
			</tr>
			<tr style="height: 30px;">
				
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">设计速度(km/h)：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="sjsd"></span>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">总投资：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="ztz"></span>&nbsp;万元</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">拟申请部（省）<br>级补助资金（万元）：</td>
				<td colspan="3" style="background-color: #ffffff; height: 20px;" align="left">
					<span id="nsqbbz"></span></td>
			</tr>
			<tr style="height: 30px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">设区市：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="scsqs"></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">县（市、区）：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="scxsq"></span>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">所在乡镇：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="scszxz"></span>
				</td>
			</tr>
			<tr style="height: 30px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">建设内容：</td>
				<td colspan="5" style="background-color: #ffffff; height: 20px;" align="left">
					<span id="jsnr"></span>
				</td>
			</tr>
			<tr style="height: 30px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">备&nbsp;&nbsp;注：</td>
				<td colspan="5" style="background-color: #ffffff; height: 20px;" align="left">
					<span id="scbz"></span>
				</td>
		</tr>
		<tr>
			<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">施工图（初步）<br>设计批复文件：</td>
				<td id="td_sjsgt" colspan="5" style="background-color: #ffffff; height: 20px;" align="left">
					<table style="margin-top:10px;background-color: #aacbf8; font-size: 12px" border="0"
								cellpadding="1" cellspacing="1">
						<tbody id="sjsgtTable"></tbody>
					</table>
				</td>
			</tr>
			<tr style="height: 25px;">
				<td colspan="6" style="border-style: none none solid none; border-width: 1px; color: #55BEEE; font-weight: bold; font-size: small; text-align: left; background-color: #F1F8FF; width: 15%; padding-left: 10px;">
					危桥改造项目计划信息
				</td>
			</tr>
			<tr style="height: 30px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">上报年份：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input id="sbnf" type="text" /></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">计划开工年：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input id="jhkgsj" type="text" class="easyui-combobox"/></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">计划完工年：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input id="jhwgsj" type="text" class="easyui-combobox"/>
				</td>
			</tr>
			<!-- <tr style="height: 30px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">设计单位：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input id="sjdw" type="text" /></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">设计批复单位：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input id="sjpfdw" type="text" /></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">批复文号：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input id="jhpfwh" type="text" />
				</td>
			</tr> -->
			<tr style="height: 30px;">
				<!-- <td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">批复时间：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input id="pfsj" type="text" class="easyui-datebox"/></td> -->
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">桥梁建设规模：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					长<input onchange="loadBz()" type="text" id="jhqlqc" style="width: 53px"/> 宽<input onchange="loadBz()" type="text" id="jhqlqk" style="width: 53px"/></td>	
			<!-- 	<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">建设性质：</td> -->
				<!-- <td style="background-color: #ffffff; height: 20px;" align="left">
					<select id="jhjsxz" class="easyui-combobox" data-options="panelHeight:'50'" >
						<option value="加固改造" selected>加固改造</option>
						<option value="拆除重建">拆除重建</option>
					</select>
				</td> -->
				
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">批复总投资(万元)：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" id="pfztz" onchange="bzSum()"/></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">是否申请按比例补助：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="radio" name="sfsqablbz" onchange="ablwhDis('是')" id="sfsqablbz0" value="是"/>是
					<input type="radio" name="sfsqablbz" onchange="ablwhDis('否')" id="sfsqablbz1" value="否"/>否</td>
			</tr>
			<tr style="height: 30px;">
				
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">按比例补助申请文号：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" id="ablbzwh" style="display:;"/>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">计划使用部(省)补助金额(万元)：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" id='shengbz'  onchange="setshengbz()"/><br><span id="trshengbz" style="color: red"></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">计划使用地方自筹资金(万元)：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="dfzc"></span>
				</td>
			</tr>
			<tr style="height: 30px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">拟申请省奖励资金(万元)：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" id='nsqsjl' disabled="disabled"/><br><span id="trshengjl" style="color: red"></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">市级补助资金(万元)：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" class="easyui-numberbox" id='shijbz'>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">县级自筹(万元)：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" class="easyui-numberbox" id='xianjbz'>
				</td>
				<!-- <td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">桥梁所在乡镇：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" id="qlszxz" /></td> -->
			</tr>
			<tr id="sftr" style="height: 30px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%;" align="right">计划类别：</td>
				<td colspan="5" style="background-color: #ffffff; height: 20px;" align="left">
					<select id="sfylrbwqk" class="easyui-combobox" data-options="panelHeight:'70'" style="width: 156px">
						<option value="是" selected>车购税</option>
						<option value="否">省补</option>
					</select></td>
				
			</tr>
			<tr  style="height: 30px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%;" align="right">主要建设内容：</td>
				<td colspan="5" style="background-color: #ffffff; height: 20px;" align="left">
					<textarea id="zyjsnr" style="width: 700px;height:40px;"></textarea></td>
				
			</tr>
			<tr  style="height: 30px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%;" align="right">备注：</td>
				<td colspan="5" style="background-color: #ffffff; height: 20px;" align="left">
					<textarea id="jhbz" style="width: 700px;height:40px;"></textarea></td>
				
			</tr>
			<tr  style="height: 30px;">
				<td align="center" colspan="6" style="background-color: #ffffff; height: 20px;" >
                	<img alt="确定" src="${pageContext.request.contextPath}/images/Button/qd1.gif" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/qd2.gif'" onmouseout="this.src='${pageContext.request.contextPath}/images/Button/qd1.gif' " onclick="editWqgz()" />
                </td>
			</tr>
		</table>
	</body>
</html>