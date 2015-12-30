<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>基础库管理病害隧道项目</title>
<link rel="stylesheet" type="text/css" href="../../../easyui/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="../../../easyui/themes/icon.css" />
<script type="text/javascript" src="../../../easyui/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="../../../easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/uploader/swfobject.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/uploader/jquery.uploadify.v2.1.4.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/widget/newlhgdialog/lhgcore.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/widget/newlhgdialog/lhgdialog.min.js"></script>
<script type="text/javascript" src="../../../easyui/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="../../../js/YMLib.js"></script>
<script type="text/javascript" src="../js/Datagrid.js"></script>
<script type="text/javascript" src="../js/lwxm.js"></script>
<script type="text/javascript">
$(function(){
// 	xmnf1("sck_xmnf");
	loadBmbm2("sck_jsxz", "建设性质");
	selBhsdById();
	loadUploadify();
	fileShow();
	$("#save_button").click(function(){
		var nf=new RegExp("^[1-9][0-9]{3}$");
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
		var data ="sckid="+parent.rowid+"&spdw="+$("#spdw").val()+"&sjdw="+$("#sjdw").val()+
		"&spwh="+$("#spwh").val()+"&tzgs="+$("#tzgs").val()+
		"&sck_jsxz="+$("#sck_jsxz").combobox("getValue")+"&zyjsnr="+$("#zyjsnr").val()+"&scbz="+$("#scbz").val()+
		"&sck_sddm="+$("#sddm").val()+"&sck_lxbm="+$("#lxbm").html()+"&sck_lxmc="+$("#lxmc").html()+"&sck_sdzxzh="+$("#sdzxzh").html()+
		"&sck_xmnf="+$("#sck_xmnf").val()+"&sck_sdcd="+$("#sck_sdcd").val()+"&sck_sdkd="+$("#sck_sdkd").val()+"&sck_sdgd="+$("#sck_sdgd").val()+
		"&sck_nsddm="+$("#sck_nsddm").val()+"&sck_nlxbm="+$("#sck_nlxbm").val()+"&sck_nlxmc="+$("#sck_nlxmc").val()+"&sck_nsdzxzh="+$("#sck_nsdzxzh").val();
		
		$.ajax({
			type:'post',
			url:'/jxzhpt/xmsck/updateSckbhsd.do',
	        data:data,
			dataType:'json',
			success:function(msg){
				if(Boolean(msg)){
					parent.sckglBhsd();
					parent.$("#grid").datagrid('reload');
					alert("修改成功！");
					parent.$('#sck_xg').window('destroy');
					
				}else{
					alert('保存失败！');
				}
			}
		});  
	});
	$("#qx_window").click(function(){
		parent.$('#sck_xg').window('destroy');
	});	
});

function selBhsdById(){
	$.ajax({
		type : 'post',
		url : '/jxzhpt/xmsck/selectSckbhsdById.do',
		data :"sckid="+parent.rowid,
		dataType:'json',
		success : function(msg) {
			$("#sddm").html(msg.sddm);
			$("#sdmc").html(msg.sdmc);
			$("#sdzxzh").html(msg.sdzxzh);
			$("#gydw").html(msg.gydw);
			$("#xzqhdm").html(msg.xzqhdm);
			$("#xzqhmc").html(msg.xzqhmc);
			$("#lxbm").html(msg.lxbm);
			$("#lxmc").html(msg.lxmc);
			$("#sdcd").html(msg.sdcd);
			$("#sdkd").html(msg.sdkd);
			$("#sdgd").html(msg.sdgd);
			$("#jsdj").html(msg.jsdj);
			$("#pddj").html(msg.pddj);
			$("#pdtime").html(msg.pdtime);
			$("#jsjd").html(msg.jsjd);
			$("#jswd").html(msg.jswd);
			$("#xjgjnd").html(msg.xjgjnd);
			$("#acdfl").html(msg.acdfl);
			$("#xmnf").html(msg.xmnf);
			$("#bhbw").html(msg.bhbw);
			$("#bhnr").html(msg.bhnr);
			$("#bz").html(msg.bz);
			$("#xmmc").html(msg.xmmc);
			$("#jsxz").html(msg.jsxz);
			$("#nsddm").html(msg.nsddm);
			$("#nlxbm").html(msg.nlxbm);
			$("#nlxmc").html(msg.nlxmc);
			$("#nsdzxzh").html(msg.nsdzxzh);
			
			$("#sck_sdcd").val(msg.sck_sdcd);
			$("#sck_sdkd").val(msg.sck_sdkd);
			$("#sck_sdgd").val(msg.sck_sdgd);
			$("#sck_xmnf").val(msg.sck_xmnf);
			$("#spwh").val(msg.spwh);
			$("#spdw").val(msg.spdw);
			$("#sjdw").val(msg.sjdw);
			$("#tzgs").val(msg.tzgs);
			$("#sck_jsxz").combobox("setValue",msg.sck_jsxz);
			$("#zyjsnr").val(msg.zyjsnr);
			$("#scbz").val(msg.scbz);
			$("#sck_nsddm").val(msg.sck_nsddm);
			$("#sck_nlxbm").val(msg.sck_nlxbm);
			$("#sck_nlxmc").val(msg.sck_nlxmc);
			$("#sck_nsdzxzh").val(msg.sck_nsdzxzh);
		}
	});
}	
var xxId=parent.rowid;
function loadUploadify(){
	$("#uploadGk").uploadify({
		/*注意前面需要书写path的代码*/
		'uploader' : '../../../js/uploader/uploadify.swf',
		'script' : '../../../jhgl/uploadWqgzFile.do',
		'cancelImg' : '../../../js/uploader/cancel.png',
		'queueID' : 'fileQueue',
		'fileDataName' : 'uploadGk',
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
			fileShow();
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
			fileShow();
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
function fileShow(){
	//加载文件
	$.ajax({
		type:'post',
		url:'../../../jhgl/queryFjByParentId.do',
		dataType:'json',
		data:'uploads.id='+xxId,
		success:function(data){
	/* 		var data=datas.rows; */
		/* 	alert(data); */
			$("#gkbgTable").empty();
			$("#sjsgtTable").empty();
			var gkbg="";
			var sjsgt="";
			for ( var i = 0; i < data.length; i++) {
				if(data[i].filetype=="工可报告"){
					gkbg += "<tr><td style='background-color: #ffffff; height: 25px;' align='left'>" + data[i].filename +"</td><td style='background-color: #ffffff; height: 25px;' align='left'><a href='javascript:void(0)'style='text-decoration:none;color:#3399CC; ' onclick=downFile('"+data[i].id+"')>下载</a>  |  <a href='javascript:void(0)'style='text-decoration:none;color:#3399CC; ' onclick=deleteFile('"+data[i].id+"')>删除</a></td></tr>";
				}if(data[i].filetype=="设计施工图"){
					sjsgt += "<tr><td style='background-color: #ffffff; height: 25px;' align='left'>" + data[i].filename +"</td><td style='background-color: #ffffff; height: 25px;' align='left'><a href='javascript:void(0)'style='text-decoration:none;color:#3399CC; ' onclick=downFile('"+data[i].id+"')>下载</a> |  <a href='javascript:void(0)' style='text-decoration:none;color:#3399CC; ' onclick=deleteFile('"+data[i].id+"')>删除</a></td></tr>";
				}
				}
			$("#gkbgTable").append(gkbg);
			$("#sjsgtTable").append(sjsgt);
		}
	});
}
function downFile(id){
	parent.window.location.href="/jxzhpt/jhgl/downAbgcFile.do?uploads.id="+id;
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
					<span id="sddm"></span>
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
				<td colspan="6" style="background-color: #ffffff; height: 35px;"
					align="center"><a href="javascript:void(0)" id="save_button"
					class="easyui-linkbutton" plain="true" iconCls="icon-save">保存</a> <a
					href="javascript:void(0)" id="qx_window"
					class="easyui-linkbutton" plain="true" iconCls="icon-cancel">取消</a></td>
			</tr>
			</table>
</body>
</html>