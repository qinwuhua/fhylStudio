<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>基础库管理危桥改造项目</title>
<link rel="stylesheet" type="text/css" href="../../../easyui/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="../../../easyui/themes/icon.css" />
<link rel="stylesheet" type="text/css" href="../../../js/autocomplete/jquery.autocomplete.css" />
<script type="text/javascript" src="../../../easyui/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="../../../easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../../../easyui/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/uploader/swfobject.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/uploader/jquery.uploadify.v2.1.4.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/autocomplete/jquery.autocomplete.js" ></script>
<script type="text/javascript" src="../../../js/autocomplete/jquery.autocomplete.js" ></script>
<script type="text/javascript" src="../../../js/util/jquery.cookie.js"></script>
<script type="text/javascript" src="../../../js/YMLib.js"></script>
<script type="text/javascript" src="../js/lwxm.js"></script>
<script type="text/javascript" src="../js/wqsj.js"></script>
<script type="text/javascript">
var xmkid;
var bzls='';
function loadxx(){
	var item=parent.obj;
	fileShow2(item.xmkid,"桥梁正面文件");
	fileShow3(item.xmkid,"桥梁侧面文件");
	xmkid=item.id;
	$("#jsxz").combobox({onChange:function (n,o) {setbz();}});
	$("#sfylrbwqk").combobox({onChange:function (n,o) {setbz();}});
	$("#scakjfl").combobox({onChange:function (n,o) {setbz();}});
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
	$("#sfylrbwqk").combobox('setValue',item.sfylrbwqk);
	$("#scakjfl").combobox('setValue',item.scakjfl);
	$("#scqlqc").val(item.scqlqc);
	$("#scqlqk").val(item.scqlqk);
	$("#scxmnf").val(item.scxmnf);
	$("#fapgdw").val(item.fapgdw);
	$("#fascdw").val(item.fascdw);
	$("#faspsj").datebox('setValue',item.faspsj);
	$("#spwh").val(item.spwh);
	$("#jsxz").combobox('setValue',item.jsxz);
	$("#tzgs").val(item.tzgs);
	$("#sjdwmc").val(item.sjdwmc);
	$("#jsgmqc").val(item.jsgmqc);
	$("#jsgmqk").val(item.jsgmqk);
	$("#hzdj").val(item.hzdj);
	$("#scsjhspl").val(item.scsjhspl);
	$("#sck_sbjgxs").val(item.sck_sbjgxs);
	$("#kjzh").val(item.kjzh);
	$("#ztz").val(item.ztz);
	$("#sck_xbjgxs").val(item.sck_xbjgxs);
	$("#sgtpfsj").datebox('setValue',item.sgtpfsj);
	$("#pfwh").val(item.pfwh);
	$("#zgq").val(item.zgq);
	$("#jsnr").val(item.jsnr);
	$("#scbz").val(item.scbz);
	$("#nsqbbz").val(item.nsqbbz);$("#rksj").html(item.rksj);
	$("#cjqz1").combobox('setValue',item.cjqz.substring(0,5));
	$("#cjqz").val(item.cjqz.substring(5,item.cjqz.length));
	$("#scthdj").val(item.scthdj);$("#qljc").val(item.qljc);$("#ydgldj").combobox('setValue',item.ydgldj);
	$("#sjsd").val(item.sjsd);$("#scsqs").val(item.scsqs);$("#scxsq").val(item.scxsq);$("#scszxz").val(item.scszxz);
	setbz();
}
$(function(){
	xxId=parent.obj.sckid;
	sjtfileShow();
// 	xmnf1("scxmnf");
	loadxx();
	loadUploadify();
	$("#save_button").click(function(){
		if($("#scqlqc").val()==null || $("#scqlqc").val()=='' || isNaN($("#scqlqc").val()) || parseFloat($("#scqlqc").val())<=0){
			alert("请填写正确的桥梁全长！");
			$("#scqlqc").focus();
			return false;
		}
		if($("#scqlqk").val()==null || $("#scqlqk").val()=='' || isNaN($("#scqlqk").val()) || parseFloat($("#scqlqk").val())<=0){
			alert("请填写正确的桥梁全宽！");
			$("#scqlqk").focus();
			return false;
		}
			bzWqgz();
	});
	$("#qx_window").click(function(){
			parent.$('#lxxx').window('destroy');		
	});	
});

function saveWqgz(){
	var sbthcd=$.cookie("unit2").length;
	if($.cookie("unit2")=="______36"){
		sbthcd=7;
	}
	if($("#nsqbbz").val()==''||$("#ztz").val()==''){
		alert("总投资或补助金额未填写正确");
		return
	}
	var nsqbbz1=$("#nsqbbz").val();
	if($("#sfylrbwqk").combobox('getValue')=='是'){
		if(parseFloat(nsqbbz1)>parseFloat(trzjdx)){
			alert("请按提示填写正确的值");
			$("#nsqbbz").val('');
			return;
		}
	}
	
	if(parseFloat($("#nsqbbz").val())>parseFloat($("#ztz").val())){
		alert("总投资不能小于补助金额");
		return;
	}
	var cjqz = $("#cjqz1").combobox('getValue')+$("#cjqz").val();
	var data ="jckwqgzsj.xmkid="+xmkid+"&jckwqgzsj.fapgdw="+$("#fapgdw").val()+"&jckwqgzsj.fascdw="+$("#fascdw").val()+
	"&jckwqgzsj.faspsj="+$("#faspsj").datebox('getValue')+"&jckwqgzsj.spwh="+$("#spwh").val()+"&jckwqgzsj.tzgs="+''+
	"&jckwqgzsj.jsxz="+$("#jsxz").combobox("getValue")+"&jckwqgzsj.jsnr="+$("#jsnr").val()+"&jckwqgzsj.scbz="+$("#scbz").val()+
	"&jckwqgzsj.scbmbm="+$.cookie("unit")+"&jckwqgzsj.qlbh="+$("#qlbh").val()+"&jckwqgzsj.lxbm="+$("#lxbm").html()+"&jckwqgzsj.qlzxzh="+$("#qlzxzh").html()+
	"&jckwqgzsj.sck_sbthcd="+sbthcd+"&jckwqgzsj.bzls="+bzls+"&jckwqgzsj.scxmnf="+$("#scxmnf").val()+"&jckwqgzsj.scqlqc="+$("#scqlqc").val()+"&jckwqgzsj.scqlqk="+$("#scqlqk").val()
	+"&jckwqgzsj.sjdwmc="+$("#sjdwmc").val()+"&jckwqgzsj.zdezj="+$("#zdezj").val()+"&jckwqgzsj.scakjfl="+$("#scakjfl").combobox('getValue')
	+"&jckwqgzsj.hzdj="+$("#hzdj").val()+"&jckwqgzsj.scsjhspl="+$("#scsjhspl").val()+"&jckwqgzsj.sck_sbjgxs="+$("#sck_sbjgxs").val()
	+"&jckwqgzsj.kjzh="+$("#kjzh").val()+"&jckwqgzsj.ztz="+$("#ztz").val()+"&jckwqgzsj.sck_xbjgxs="+$("#sck_xbjgxs").val()
	+"&jckwqgzsj.sgtpfsj="+''+"&jckwqgzsj.pfwh="+''+"&jckwqgzsj.zgq="+$("#zgq").val()+"&jckwqgzsj.sckid="+xxId
	+"&jckwqgzsj.nsqbbz="+$("#nsqbbz").val()+"&jckwqgzsj.rksj="+$("#rksj").html()+"&jckwqgzsj.cjqz="+cjqz
	+"&jckwqgzsj.scthdj="+$("#scthdj").val()+"&jckwqgzsj.qljc="+$("#qljc").val()+"&jckwqgzsj.ydgldj="+$("#ydgldj").combobox('getValue')
	+"&jckwqgzsj.sjsd="+$("#sjsd").val()+"&jckwqgzsj.scsqs="+$("#scsqs").val()+"&jckwqgzsj.scxsq="+$("#scxsq").val()+"&jckwqgzsj.scszxz="+$("#scszxz").val()+"&jckwqgzsj.sfylrbwqk="+$("#sfylrbwqk").combobox('getValue');
	$.ajax({
		type:'post',
		url:'/jxzhpt/wqgzsj/updateSckwqgz.do',
        data:data,
		dataType:'json',
		success:function(msg){
			if(Boolean(msg)){
				parent.$("#grid").datagrid('reload');
				alert("保存成功！");
				parent.$('#lxxx').window('destroy');
				
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

function loadUploadify(){
	
	$("#uploadSjt").uploadify({
		/*注意前面需要书写path的代码*/
		'uploader' : '../../../js/uploader/uploadify.swf',
		'script' : '../../../jhgl/uploadWqgzFile.do',
		'cancelImg' : '../../../js/uploader/cancel.png',
		'queueID' : 'fileQueue1',
		'fileDataName' : 'uploadSjt',
		'auto' : false,
		'multi' : false,
		'buttonImg': '../../../js/uploader/bdll.png',
		'simUploadLimit' : 3,
		'sizeLimit' : 20000000,
		'queueSizeLimit' : 5,
		'fileDesc' : '支持格式:xls',
		'fileExt' : '',
		'height' : 30,
		'width' : 92,
		'scriptData' : {
			'jh.id':xxId,
		},
		onComplete : function(event, queueID, fileObj, response, data) {
			sjtfileShow();
		},
		onError : function(event, queueID, fileObj) {
			alert("文件:" + fileObj.name + "上传失败");
		},
		onCancel : function(event, queueID, fileObj) {
		},
		onQueueFull : function(event, queueSizeLimit) {
			alert("最多支持上传文件数为：" + queueSizeLimit);

		}
	});
}
function upload(id){
	$("#"+id).uploadifySettings('scriptData',{'jh.sbnf':$('#scxmnf').val(),'uploads.parentid':xxId});
	$('#'+id).uploadifyUpload();
}
var xxId;

function sjtfileShow(){
	//加载文件
	$.ajax({
		type:'post',
		url:'../../../jhgl/queryFjByParentId.do',
		dataType:'json',
		data:'uploads.id='+xxId,
		success:function(data){
	/* 		var data=datas.rows; */
		/* 	alert(data); */
			$("#sjsgtTable").empty();
			var gkbg="";
			var sjsgt="";
			for ( var i = 0; i < data.length; i++) {
				if(data[i].filetype=="设计施工图"){
					sjsgt += "<tr><td style='background-color: #ffffff; height: 25px;' align='left'>" + data[i].filename +"</td><td style='background-color: #ffffff; height: 25px;' align='left'>"+
					'<a href="javascript:void(0)" style="text-decoration:none;color:#3399CC;" onclick="sjtdownFile('+"'"+data[i].fileurl.replace(/\\/g,"%2F")+"',"+"'"+data[i].filename+"'"+')">下载</a>  |  '+
					"<a href='javascript:void(0)' style='text-decoration:none;color:#3399CC; ' onclick=sjtdeleteFile('"+data[i].id+"')>删除</a></td></tr>";
				}
			}
			$("#sjsgtTable").append(sjsgt);
		}
	});
}
function sjtdownFile(fileurl,filename){
	parent.window.location.href="/jxzhpt/jhgl/downAbgcFile.do?uploads.fileurl="+fileurl+"&uploads.filename="+filename;
}
function sjtdeleteFile(id){
	if(confirm('确定删除所选数据？')){
		$.ajax({
			 type : "POST",
			 url : "/jxzhpt/jhgl/deleteFile.do",
			 dataType : 'json',
			 data : 'uploads.id=' +id,
			 success : function(msg){
				 if(msg){
					 alert('删除成功！');
					 sjtfileShow();
				 }else{
					 YMLib.Tools.Show('删除失败,请选择要删除数据！',3000);
				 }
			 },
			 error : function(){
				 YMLib.Tools.Show('服务器请求无响应！error code = 404',3000);
			 }
		});
	}
}
var nsqbbz;
var zdezj;
function getBbz(){
	 $.ajax({
			type:'post',
			url:'/jxzhpt/jhgl/lwBzbz.do',
			data:"bzbz.xmlx="+"危桥"+"&bzbz.lx="+$("#jsxz").combobox('getValue'),
			dataType:'json',
			async:false,
			success:function(data){
				var bz=data.bz;
				var bl=data.bl;
				var fd=data.fd;
				var bzzj=(parseFloat($('#scqlqc').val())*1000000000000000*parseFloat($('#scqlqk').val())*parseFloat(bz)+parseFloat(fd)*1000000000000000)/1000000000000000;
				nsqbbz=bzzj.toFixed(3);
				zdezj=bzzj.toFixed(3);
				setnsqbbz();
			}
		}); 
}
function getSbz(){
	 $.ajax({
			type:'post',
			url:'/jxzhpt/jhgl/lwBzsbz.do',
			data:"planwqgzsj.tsdq="+$("#tsdq").html()+"&planwqgzsj.sck_qlbh="+$("#qlbh").html()+"&planwqgzsj.akjfl="+$("#scakjfl").combobox('getValue')+"&planwqgzsj.jsxz="+$("#jsxz").combobox('getValue')
			+"&planwqgzsj.scqlqc="+$("#scqlqc").val()+"&planwqgzsj.scqlqk="+$("#scqlqk").val(),
			dataType:'json',
			async:false,
			success:function(data){
				nsqbbz=data.shengbz;
				trzjdx=data.shengbz;
				zdezj=data.shengbz;
				$("#trzjdx").html("小于等于"+trzjdx);
			}
		}); 
}
function setbz(){
	var sfbk='';
		sfbk=$("#sfylrbwqk").combobox('getValue');
	if(sfbk=='是'){
		getBbz();
	}else{
		getSbz();
	}
	
}
var trzjdx;
function setnsqbbz(){
	var ztz=$("#ztz").val();
	if(ztz!=null&&ztz!=''){
		if(parseFloat(ztz)*0.6<parseFloat(nsqbbz)){
			trzjdx=Math.round(parseFloat(ztz)*0.6);
		}
		else{
			trzjdx=Math.round(parseFloat(nsqbbz));
		}
	}else{
		trzjdx=Math.round(parseFloat(nsqbbz));
	}
	if($("#sfylrbwqk").combobox('getValue')=='是')
	$("#trzjdx").html("小于等于"+trzjdx);
	else
		$("#trzjdx").html("小于等于或大于"+nsqbbz);
}
function checksfzq(){
	var nsqbbz1=$("#nsqbbz").val();
	if($("#sfylrbwqk").combobox('getValue')=='是'){
		if(parseFloat(nsqbbz1)>parseFloat(trzjdx)){
			alert("请按提示填写正确的值");
			$("#nsqbbz").val('');
		}
	}
	
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
			<tr style="height: 30px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:16%" align="right">桥梁编码：</td>
				<td style="background-color: #ffffff; height: 20px;width:17%" align="left">
					<span id="qlbh"></span></td>
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
					<input type="text" name="scqlqc" id="scqlqc" style="width: 150px" onchange="setbz()"/></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">桥梁全宽(米)：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" name="scqlqk"id="scqlqk" style="width: 150px" onchange="setbz()"/></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">项目年份：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input id="scxmnf" />
				</td>
			</tr>
			<tr style="height: 30px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">方案评估(设计)单位：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" name="fapgdw" id="fapgdw" style="width: 150px" /></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">方案审核(批复)单位：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" name="fascdw"id="fascdw" style="width: 150px" /></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">方案(施工图)批复时间：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" id="faspsj" class="easyui-datebox" />
				</td>
			</tr>
			<tr style="height: 30px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">审批文号：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" name="spwh" id="spwh" style="width: 150px" /></td>
				
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">建设性质：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<select id="jsxz" class="easyui-combobox" data-options="panelHeight:'50'" onchange="setbz()">
						<option value="加固改造"selected>加固改造</option>
						<option value="拆除重建">拆除重建</option>
					</select>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">荷载等级：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" id="hzdj" style="width: 150px" /></td>
			</tr>
			
			
			<tr style="height: 30px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">设计洪水频率：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" id="scsjhspl" style="width: 150px" /></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">跨径组合：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text"  id="kjzh" style="width: 150px" /></td>
					<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">上部结构形式：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" id="sck_sbjgxs" style="width: 150px" />
				</td>
			</tr>
			<tr style="height: 30px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">下部结构形式：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" id="sck_xbjgxs" style="width: 150px" />
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">总工期：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" id="zgq" style="width: 150px" />
				</td>
					<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">重建桥址：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<select id='cjqz1' class='easyui-combobox' style="width: 80px;">
						<option value="原桥址上游">原桥址上游</option>
						<option value="原桥址下游">原桥址下游</option>
					</select><input type="text" id="cjqz" style="width: 45px;vertical-align: middle;" />米</td>
			</tr>
			<tr style="height: 30px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">通航等级：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" id="scthdj" style="width: 150px" />
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">桥梁基础：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" id="qljc" style="width: 150px" /></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">引道行政等级：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<select id='ydgldj' class='easyui-combobox' data-options="panelHeight:'100'" >
						<option value="一级公路">一级公路</option>
						<option value="二级公路">二级公路</option>
						<option value="三级公路">三级公路</option>
						<option value="四级公路">四级公路</option>
					</select>
					</td>
			</tr>
			<tr style="height: 30px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">按跨径分类：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<select id='scakjfl' class='easyui-combobox' data-options="panelHeight:'100'" >
						<option value="特大桥">特大桥</option>
						<option value="大桥">大桥</option>
						<option value="中桥">中桥</option>
						<option value="小桥">小桥</option>
					</select>
				</td>
				<td  style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%; " align="right">是否入部危桥库：</td>
				<td  style="background-color: #ffffff; height: 20px;" align="left">
					<select id="sfylrbwqk" class="easyui-combobox" data-options="panelHeight:'70'" style="width: 156px">
						<option value="否">否</option>
						<option value="是" selected>是</option>
					</select>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right"></td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
				</td>
			</tr>
			<tr style="height: 30px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">设计速度(km/h)：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" id="sjsd" style="width: 150px" />
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">总投资：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" id="ztz" style="width: 115px" onchange="setnsqbbz()"/>&nbsp;万元</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">拟申请部（省）<br>级补助资金（万元）：</td>
				<td colspan="3" style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" id="nsqbbz" style="width: 150px" onblur="checksfzq()"/>&nbsp;&nbsp;<span style="color: red" id='trzjdx'></span></td>
			</tr>
			<tr style="height: 30px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">设区市：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" id="scsqs" style="width: 150px" /></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">县（市、区）：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" id="scxsq" style="width: 150px" />
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">所在乡镇：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" id="scszxz" style="width: 150px" />
				</td>
			</tr>
			<tr id="sf1"  style="height: 30px;display: none">
				
				<td  style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%; " align="right">是否入部危桥库：</td>
				<td colspan="5" style="background-color: #ffffff; height: 20px;" align="left">
					<select id="sfylrbwqk" class="easyui-combobox" data-options="panelHeight:'70'" style="width: 156px">
						<option value="否">否</option>
						<option value="是" selected>是</option>
					</select>
				</td>
			</tr>
			
			<tr style="height: 30px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">建设内容：</td>
				<td colspan="5" style="background-color: #ffffff; height: 20px;" align="left">
					<textarea id="jsnr"rows="2"  style="width:99%"></textarea>
				</td>
			</tr>
			<tr style="height: 30px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">备&nbsp;&nbsp;注：</td>
				<td colspan="5" style="background-color: #ffffff; height: 20px;" align="left">
					<textarea id="scbz"rows="2" style="width:99%"></textarea>
				</td>
			</tr>
				<tr>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">设计施工图：</td>
				<td id="td_sjsgt" colspan="5" style="background-color: #ffffff; height: 20px;" align="left">
					<table style="margin-top:10px;background-color: #aacbf8; font-size: 12px" border="0"
								cellpadding="1" cellspacing="1">
						<tbody id="sjsgtTable"></tbody>
					</table>
					<table>
							<tr>
								<td><input type="file" value="选择图片" style="background-image: url('../../../js/uploader/bdll.png');" name="uploadSjt" id="uploadSjt" /></td>
								<td><div id="fileQueue1" ></div></td>
							</tr>
							<tr>
								<td rowspan="2">
									<img name="uploadFile" id="uploadFile" src="../../../js/uploader/upload.png" onclick="upload('uploadSjt')"  style="border-width:0px;cursor: hand;" />
								</td>
							</tr>
						</table>
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