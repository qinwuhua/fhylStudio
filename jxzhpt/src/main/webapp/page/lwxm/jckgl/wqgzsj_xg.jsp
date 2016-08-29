<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>基础库管理危桥改造项目</title>
<link rel="stylesheet" type="text/css" href="/jxzhpt/easyui/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="/jxzhpt/easyui/themes/icon.css" />
<link rel="stylesheet" type="text/css" href="/jxzhpt/js/autocomplete/jquery.autocomplete.css" />
<script type="text/javascript" src="/jxzhpt/easyui/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="/jxzhpt/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="/jxzhpt/easyui/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/uploader/swfobject.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/uploader/jquery.uploadify.v2.1.4.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/autocomplete/jquery.autocomplete.js" ></script>
<script type="text/javascript" src="/jxzhpt/js/util/jquery.cookie.js"></script>
<script type="text/javascript" src="/jxzhpt/js/YMLib.js"></script>
<script type="text/javascript" src="../js/datagrid.js"></script>
<script type="text/javascript" src="../js/lwxm.js"></script>
<script type="text/javascript" src="../js/wqsj.js"></script>
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
<script type="text/javascript">
var xmbm=parent.obj.id;
$(function(){
	xmnf1("xmnf");
	loadUploadify();
	fileShow(xmbm,"桥梁正面文件");
	fileShow1(xmbm,"桥梁侧面文件");
	$("#save_button").click(function(){
		var flag=true;
		$("input[name='bitian']").each(function(){
	        if ($(this).val() == ""||$(this).val() == null){
	        	alert("请将页面除备注外的信息填写完整。");
	        	flag=false;
	        	return false;
	        }
	    });
		if(!flag)
			return;
			var datas="jckwqgzsj.id="+xmbm;
			$.ajax({
				type:'post',
				url:'/jxzhpt/wqgzsj/getwqgzZP.do',
				dataType:'json',
		        data:datas,
				success:function(msg){
					if(Boolean(msg)){
						saveWqgz();
					}else{
						saveWqgz();
						//alert('请您至少添加一张正面照片和一张侧面照片！');
					}
				}
			});
	});
	$("#qx_window").click(function(){
		parent.$('#lxxx').window('destroy');
	});	
 	loadxx();
});
function loadxx(){
	var item=parent.obj;
	selectTSDQ(item.xzqhdm);
	$("#qlmc,#qlzxzh,#gydw,#xzqhdm,#xzqhmc,#lxmc,#lxbm,#kjzc,#qlqc,#qlkd,#dkzdkj,#pddj,#xjgjnd,#akjfl,#sbjgxs,#bhnr,#bz").attr("value",'');
	$("#qlbh").html(item.qlbh);$("#qlmc").html(item.qlmc);$("#qlzxzh").html(parseFloat(item.qlzxzh));
	$("#gydw").html(item.gydw);$("#xzqhdm").html(item.xzqhdm);$("#xzqhmc").html(item.xzqhmc);
	$("#lxmc").html(item.lxmc);$("#lxbm").html(item.lxbm);$("#kjzc").html(item.kjzc);
	$("#qlqc").html(item.qlqc);$("#qlkd").html(item.qlkd);$("#dkzdkj").html(item.dkzdkj);
		$("#jsdj").html(item.jsdj);
	$("#pddj").combobox('setValue',item.pddj);$("#xjgjnd").html(item.xjgjnd);
	$("#akjfl").html(item.akjfl);$("#sbjgxs").val(item.sbjgxs);$("#xmtype").html(item.xmtype);
	$("#bhnr").val(item.bhnr);$("#bz").val(item.bz);$("#qlyhgcs").val(item.qlyhgcs);
	$("#qljggcs").val(item.qljggcs);$("#czyjhjy").val(item.czyjhjy);
	$("#sqs").val(item.sqs);$("#xsq").val(item.xsq);$("#szxz").val(item.szxz);
	$("#synf").combobox('setValue',item.synf);$("#sjhspl").val(item.sjhspl);$("#qxjkuan").val(item.qxjkuan);
	$("#qxjkong").val(item.qxjkong);$("#zqks").val(item.zqks);$("#qmjk").val(item.qmjk);$("#kydwlx").val(item.kydwlx);
	$("#thdj").val(item.thdj);$("#glqlyt").val(item.glqlyt);$("#qdlx").val(item.qdlx);
	$("#qtlx").val(item.qtlx);$("#pzlx").val(item.pzlx);
	$("#sfylrbwqk").combobox('setValue',item.sfylrbwqk);
	$("#xmnf").combobox('setValue',item.xmnf);
	$("#xlxbm").val(item.xlxbm);$("#xlxmc").val(item.xlxmc);$("#xqlbm").val(item.xqlbm);$("#xzxzh").val(item.xzxzh);$("#xqlmc").val(item.xqlmc);
	$("#jd").val(item.ptx);$("#wd").val(item.pty);
}

function selectTSDQ(str){
	$("#tsdq").text("");
	var data="xzqhdm1="+str;
	$.ajax({
		type:'post',
		url:'/jxzhpt/xmjck/selectTSDQ1.do',
		data:data,
		dataType:'json',
		success:function(msg){
			if(msg.length>0){
				var tsdqstr="";
				for(var i=0;i<msg.length;i++){
					tsdqstr=tsdqstr+msg[i]+"、";
				}
				tsdqstr=tsdqstr.substr(0,tsdqstr.length-1);
				$("#tsdq").text(tsdqstr);
			}
		}
	});	
}

function loadUploadify(){
	$("#uploadJGTC").uploadify({
		/*注意前面需要书写path的代码*/
		'uploader' : '/jxzhpt/js/uploader/uploadify.swf',
		'script' : '/jxzhpt/qqgl/uploadJGYSFile.do',
		'cancelImg' : '/jxzhpt/js/uploader/cancel.png',
		'queueID' : 'fileQueue1',
		'fileDataName' : 'uploadJGTC',
		'auto' : false,
		'multi' : true,
		'buttonImg': '/jxzhpt/js/uploader/bdll.png',
		'simUploadLimit' : 3,
		'sizeLimit' : 20000000,
		'queueSizeLimit' : 5,
		'fileDesc' : '支持格式:xls',
		'fileExt' : '',
		'height' : 30,
		'width' : 92,
		'scriptData' : {
			'gcgl_jgys.jhid':xmbm,
			'gcgl_jgys.name':'qlzmwj'
		},
		onComplete : function(event, queueID, fileObj, response, data) {
			alert(response);
			fileShow(xmbm,"桥梁正面文件");
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
	
	$("#uploadWGYS").uploadify({
		/*注意前面需要书写path的代码*/
		'uploader' : '/jxzhpt/js/uploader/uploadify.swf',
		'script' : '/jxzhpt/qqgl/uploadJGYSFile.do',
		'cancelImg' : '/jxzhpt/js/uploader/cancel.png',
		'queueID' : 'fileQueue2',
		'fileDataName' : 'uploadWGYS',
		'auto' : false,
		'multi' : true,
		'buttonImg': '/jxzhpt/js/uploader/bdll.png',
		'simUploadLimit' : 3,
		'sizeLimit' : 20000000,
		'queueSizeLimit' : 5,
		'fileDesc' : '支持格式:xls',
		'fileExt' : '',
		'height' : 30,
		'width' : 92,
		'scriptData' : {
			'gcgl_jgys.jhid':xmbm,
			'gcgl_jgys.name':'qlcmwj'
		},
		onComplete : function(event, queueID, fileObj, response, data) {
			alert(response);
			fileShow1(xmbm,"桥梁侧面文件");
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

function saveWqgz(){
	var data ="jckwqgzsj.xmnf="+$("#xmnf").combobox("getValue")+"&jckwqgzsj.bhnr="+$("#bhnr").val().replace(/%/g, "%25")+"&jckwqgzsj.bz="+$("#bz").val().replace(/%/g, "%25")+
	"&jckwqgzsj.qlyhgcs="+$("#qlyhgcs").val()+"&jckwqgzsj.qljggcs="+$("#qljggcs").val()+"&jckwqgzsj.czyjhjy="+$("#czyjhjy").val().replace(/%/g, "%25")+"&jckwqgzsj.id="+xmbm
	+"&jckwqgzsj.sqs="+$("#sqs").val()+"&jckwqgzsj.xsq="+$("#xsq").val()+"&jckwqgzsj.szxz="+$("#szxz").val()
	+"&jckwqgzsj.synf="+$("#synf").combobox('getValue')+"&jckwqgzsj.sjhspl="+$("#sjhspl").val()+"&jckwqgzsj.qxjkuan="+$("#qxjkuan").val()
	+"&jckwqgzsj.qxjkong="+$("#qxjkong").val()+"&jckwqgzsj.zqks="+$("#zqks").val()+"&jckwqgzsj.qmjk="+$("#qmjk").val()+"&jckwqgzsj.pddj="+$("#pddj").combobox('getValue')+"&jckwqgzsj.sbjgxs="+$("#sbjgxs").val()
	+"&jckwqgzsj.kydwlx="+$("#kydwlx").val()+"&jckwqgzsj.thdj="+$("#thdj").val()+"&jckwqgzsj.glqlyt="+$("#glqlyt").val()+"&jckwqgzsj.jsdj="+$("#jsdj").html()
	+"&jckwqgzsj.qdlx="+$("#qdlx").val()+"&jckwqgzsj.qtlx="+$("#qtlx").val()+"&jckwqgzsj.pzlx="+$("#pzlx").val()+"&jckwqgzsj.tsdq="+$("#tsdq").html()+"&jckwqgzsj.xlxbm="+$("#xlxbm").val()+"&jckwqgzsj.xlxmc="+$("#xlxmc").val()+"&jckwqgzsj.xqlbm="+$("#xqlbm").val()+"&jckwqgzsj.xqlmc="+$("#xqlmc").val()+"&jckwqgzsj.xzxzh="+$("#xzxzh").val()
	+"&jckwqgzsj.ptx="+$("#jd").val()+"&jckwqgzsj.pty="+$("#wd").val()+"&jckwqgzsj.sfylrbwqk="+$("#sfylrbwqk").combobox('getValue');
	//alert(data);
	$.ajax({
		type:'post',
		url:'/jxzhpt/wqgzsj/updateWqgz.do',
        data:data,
		dataType:'json',
		success:function(msg){
			if(Boolean(msg)){
				alert("保存成功！");
				parent.$("#grid").datagrid('reload');
				parent.$('#lxxx').window('destroy');
			}else{
				alert('保存失败！');
			}
		}
	});
}
</script>

<table style="width: 98%; margin-top: 15px;margin-left: 10px; background-color: #aacbf8; font-size: 12px"
			border="0" cellpadding="3" cellspacing="1">
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
					<select id='pddj' class="easyui-combobox" data-options="panelHeight:'70'" >
						<option value="四类">四类</option>
						<option value="五类">五类</option>
					</select>	
					</td>
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
					<input type="text" id="sbjgxs" /></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">特殊地区：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="tsdq"></span>
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">新路线编码：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input name='bitian' type="text" id="xlxbm" /></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">新路线名称：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input name='bitian' type="text" id="xlxmc" /></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">新桥梁编码：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" id="xqlbm" />
					</td>
				
			</tr>
			<tr style="height: 35px;">
				
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">新桥梁名称：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" id="xqlmc" />
					</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">新中心桩号：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input name='bitian' type="text" id="xzxzh" />
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right"><!-- 新中心桩号： --></td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
<!-- 					<input name='bitian' type="text" id="xzxzh" /> -->
				</td>
			</tr>
			<tr style="height: 35px;">
				
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">经度：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" id="jd" /></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">纬度：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input name='bitian' type="text" id="wd" />
					</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right"><!-- 新中心桩号： --></td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
<!-- 					<input name='bitian' type="text" id="xzxzh" /> -->
				</td>
			</tr>
			<tr style="height: 35px;">
			<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">项目状态：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="xmtype"></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">设区市：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input name='bitian' type="text" id="sqs" />
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">县（市、区）：</td>
				<td  style="background-color: #ffffff; height: 20px;" align="left">
					<input name='bitian' type="text" id="xsq" />
				</td>
				
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">所在乡镇：</td>
				<td  style="background-color: #ffffff; height: 20px;" align="left">
					<input name='bitian' type="text" id="szxz" />
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">按建筑材料和&nbsp;&nbsp;<br>使用年限分类：</td>
				<td  style="background-color: #ffffff; height: 20px;" align="left">
					<select id="synf" class="easyui-combobox" data-options="panelHeight:'70'" style="width: 156px">
						<option value="永久性"selected>永久性</option>
						<option value="半永久性">半永久性</option>
						<option value="临时性">临时性</option>
					</select>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">设计洪水频率(年)：</td>
				<td  style="background-color: #ffffff; height: 20px;" align="left">
					<input name='bitian' type="text" id="sjhspl" />
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">桥下净宽（米）：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input name='bitian' type="text" id="qxjkuan" />
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">桥下净空（米）：</td>
				<td  style="background-color: #ffffff; height: 20px;" align="left">
					<input name='bitian' type="text" id="qxjkong" />
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">主桥孔数（孔）：</td>
				<td  style="background-color: #ffffff; height: 20px;" align="left">
					<input name='bitian' type="text" id="zqks" />
				</td>
			</tr>
			<tr style="height: 35px;">
				
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">桥面净宽（米）：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input name='bitian' type="text" id="qmjk" />
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">跨越地物类型：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input name='bitian' type="text" id="kydwlx" />
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">通航等级：</td>
				<td  style="background-color: #ffffff; height: 20px;" align="left">
					<input name='bitian' type="text" id="thdj" />
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">公路桥梁用途：</td>
				<td  style="background-color: #ffffff; height: 20px;" align="left">
					<input name='bitian' type="text" id="glqlyt" />
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">桥墩类型：</td>
				<td  style="background-color: #ffffff; height: 20px;" align="left">
					<input name='bitian' type="text" id="qdlx" />
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">桥台类型：</td>
				<td  style="background-color: #ffffff; height: 20px;" align="left">
					<input name='bitian' type="text" id="qtlx" />
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">铺装类型：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input name='bitian' type="text" id="pzlx" />
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">是否入部危桥库：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<select id="sfylrbwqk" class="easyui-combobox" data-options="panelHeight:'70'" style="width: 156px">
						<option value="否"selected>否</option>
						<option value="是">是</option>
					</select>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">入库时间：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<select id="xmnf"  style="width:155px" class="easyui-combobox" data-options="panelHeight:'100'">
                    </select></td>
			</tr>
			<tr style="height: 35px;">
					
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">桥梁养护工程师：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input name='bitian' type="text" id="qlyhgcs" /></td>
					<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">桥梁监管工程师：</td>
				<td colspan="3" style="background-color: #ffffff; height: 20px;" align="left">
					<input name='bitian' type="text" id="qljggcs" />
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">病害内容：</td>
				<td colspan="5" style="background-color: #ffffff; height: 20px;" align="left">
					<textarea id="bhnr" rows="2"  style="width:99%"></textarea>
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">处置意见和建议：</td>
				<td colspan="5" style="background-color: #ffffff; height: 20px;" align="left">
					<textarea id="czyjhjy" rows="2"  style="width:99%"></textarea>
				</td>
			</tr>
			<tr>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">备&nbsp;&nbsp;注：</td>
				<td colspan="5" style="background-color: #ffffff; height: 20px;" align="left">
					<textarea id="bz" rows="2" style="width:99%"></textarea>
				</td>
			</tr>
			<tr>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">桥梁正面照片：</td>
				<td id="td_jgtc" colspan="5" style="background-color: #ffffff; height: 20px;" align="left">
					<table style="margin-top:10px;background-color: #aacbf8; font-size: 12px" border="0"
								cellpadding="1" cellspacing="1">
						<tbody id="qlzmTable"></tbody>
					</table>
					<table>
							<tr>
								<td><input type="file" value="选择图片" style="background-image: url('${pageContext.request.contextPath }/js/uploader/bdll.png');" name="uploadSjt" id="uploadJGTC" /></td>
								<td><div id="fileQueue1" ></div></td>
							</tr>
							<tr>
								<td rowspan="2">
									<img name="uploadFile" id="uploadFile" src="${pageContext.request.contextPath }/js/uploader/upload.png" onclick="$('#uploadJGTC').uploadifyUpload()"  style="border-width:0px;cursor: hand;" />
								</td>
							</tr>
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
					<table>
							<tr>
								<td><input type="file" value="选择图片" style="background-image: url('${pageContext.request.contextPath }/js/uploader/bdll.png');" name="uploadSjt" id="uploadWGYS" /></td>
								<td><div id="fileQueue2" ></div></td>
							</tr>
							<tr>
								<td rowspan="2">
									<img name="uploadFile" id="uploadFile" src="${pageContext.request.contextPath }/js/uploader/upload.png" onclick="$('#uploadWGYS').uploadifyUpload()"  style="border-width:0px;cursor: hand;" />
								</td>
							</tr>
						</table>
				</td>
			</tr>
			<tr style="height: 35px;">
				<td colspan="6" style="background-color: #ffffff; height: 35px;"
					align="center"><a href="javascript:void(0)" id="save_button"
					class="easyui-linkbutton" plain="true" iconCls="icon-save">保存</a> <a
					href="javascript:void(0)" id="qx_window"
					class="easyui-linkbutton" plain="true" iconCls="icon-cancel">取消</a></td>
			</tr>
			</table>
</body>
</html>