<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>基础库管理灾害防治项目</title>
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
var qdStr;
var zdStr;
	$(function(){
		xmnf1("scxmnf");
		selZhfzById();
		loadUploadify();
		fileShow();
		$("#save_button").click(function(){
			if($("#scqdzh").val()==null || $("#scqdzh").val()=='' || isNaN($("#scqdzh").val()) || parseFloat($("#scqdzh").val())<0){
				alert("请填写正确的起点桩号！");
				$("#scqdzh").focus();
				return false;
			}
			if($("#sczdzh").val()==null || $("#sczdzh").val()=='' || isNaN($("#sczdzh").val()) || parseFloat($("#sczdzh").val())<0){
				alert("请填写正确的止点桩号！");
				$("#sczdzh").focus();
				return false;
			}
			if(parseFloat($("#scqdzh").val())*1000<qdStr*1000){
				alert("对不起，起点桩号不能小于"+qdStr+"！");
				$("#scqdzh").focus();
				return false;
			}
			if(parseFloat($("#sczdzh").val())*1000>zdStr*1000){
				alert("对不起，止点桩号不能大于"+zdStr+"！");
				$("#sczdzh").focus();
				return false;
			}
			if(parseFloat($("#scqdzh").val())*1000>parseFloat($("#sczdzh").val())*1000){
				alert("对不起，起点桩号不能大于止点桩号！");
				$("#scqdzh").focus();
				return false;
			}
			if(parseFloat($("#scyhlc").val())*1000>parseFloat($("#yhlc").html())*1000){
				alert("对不起，隐患里程不能大于"+$("#yhlc").html()+"！");
				$("#scyhlc").focus();
				return false;
			}
			if(isNaN($("#tzgs").val()) || parseFloat($("#tzgs").val())<=0){
				alert("请填写正确的投资估算金额！");
				$("#tzgs").focus();
				return false;
			}
			var data ="sckid="+parent.rowid+"&scqdzh="+$("#scqdzh").val()+"&sczdzh="+$("#sczdzh").val()+"&sczlc="+$("#sczlc").val()+"&scyhlc="+$("#scyhlc").val()
			+"&fapgdw="+$("#fapgdw").val()+"&fascdw="+$("#fascdw").val()+"&faspsj="+$("#faspsj").datebox('getValue')+"&spwh="+$("#spwh").val()+"&tzgs="+$("#tzgs").val()+
			"&jsxz="+$("#jsxz").val()+"&jsnr="+$("#jsnr").val()+"&scbz="+$("#scbz").val()+"&scxmnf="+$("#scxmnf").combobox("getValue");
			$.ajax({
				type:'post',
				url:'/jxzhpt/xmsck/updateSckZhfz.do',
		        data:data,
				dataType:'json',
				success:function(msg){
					if(Boolean(msg)){
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
	
	function selZhfzById(){
		$.ajax({
			type : 'post',
			url : '/jxzhpt/xmsck/selectSckzhfzById.do',
			data :"sckid="+parent.rowid,
			dataType:'json',
			success : function(msg) {
			$("#lxbm").html(msg.lxbm);
			$("#lxmc").html(msg.lxmc);
			$("#gydw").html(msg.gydw);
			$("#qdzh").html(msg.qdzh);
			$("#zdzh").html(msg.zdzh);
			qdStr=parseFloat(msg.qdzh);
			zdStr=parseFloat(msg.zdzh);
			$("#qd").html("<font color='red' size='2'>*&nbsp;不能小于</font>"+"<font color='red' size='2'>"+msg.qdzh);
			$("#zd").html("<font color='red' size='2'>*&nbsp;不能大于</font>"+"<font color='red' size='2'>"+msg.zdzh);
			$("#qzlc").html(msg.qzlc);
			$("#xzqhdm").html(msg.xzqhdm);
			$("#xzqhmc").html(msg.xzqhmc);
			$("#gjxjnd").html(msg.gjxjnd);
			$("#lxjsdj").html(msg.lxjsdj);
			$("#yhlc").html(msg.yhlc);
			$("#xmnf").html(msg.xmnf);
			$("#xmtype").html(msg.xmtype);
			$("#yhnr").html(msg.yhnr);
			$("#bz").html(msg.bz);
			$("#tsdq").html(msg.tsdq);
			$("#scqdzh").val(msg.scqdzh);
			$("#sczdzh").val(msg.sczdzh);
			$("#sczlc").val(msg.sczlc);
			$("#scyhlc").val(msg.scyhlc);
			$("#scxmnf").combobox('setValue',msg.scxmnf);
			$("#fapgdw").val(msg.fapgdw);
			$("#fascdw").val(msg.fascdw);
			$("#faspsj").datebox('setValue',msg.faspsj);
			$("#spwh").val(msg.spwh);
			$("#tzgs").val(msg.tzgs);
			$("#jsxz").val(msg.jsxz);
			$("#jsnr").val(msg.jsnr);
			$("#scbz").val(msg.scbz);
			}
		});
	}		
	function changeZlc(){
		var zlc=(parseFloat($("#sczdzh").val())*1000000000000-parseFloat($("#scqdzh").val())*1000000000000)/1000000000000;
		$("#sczlc").html(zlc);
	}
	var xxId=parent.rowid;
	function loadUploadify(){
		$("#uploadGk").uploadify({
			/*注意前面需要书写path的代码*/
			'uploader' : '../../../js/uploader/uploadify.swf',
			'script' : '../../../jhgl/uploadZhfzFile.do',
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
				alert(response);
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
			'script' : '../../../jhgl/uploadZhfzFile.do',
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
						gkbg += "<tr><td style='background-color: #ffffff; height: 25px;' align='left'>" + data[i].filename +"</td><td style='background-color: #ffffff; height: 25px;' align='left'>"+
						'<a href="javascript:void(0)" style="text-decoration:none;color:#3399CC;" onclick="downFile('+"'"+data[i].fileurl+"',"+"'"+data[i].filename+"'"+')">下载</a>  |  '+
						"<a href='javascript:void(0)'style='text-decoration:none;color:#3399CC; ' onclick=deleteFile('"+data[i].id+"')>删除</a></td></tr>";
					}if(data[i].filetype=="设计施工图"){
						sjsgt += "<tr><td style='background-color: #ffffff; height: 25px;' align='left'>" + data[i].filename +"</td><td style='background-color: #ffffff; height: 25px;' align='left'>"+
						'<a href="javascript:void(0)" style="text-decoration:none;color:#3399CC;" onclick="downFile('+"'"+data[i].fileurl+"',"+"'"+data[i].filename+"'"+')">下载</a>  |  '+
						"<a href='javascript:void(0)' style='text-decoration:none;color:#3399CC; ' onclick=deleteFile('"+data[i].id+"')>删除</a></td></tr>";
					}
				}
				$("#gkbgTable").append(gkbg);
				$("#sjsgtTable").append(sjsgt);
			}
		});
	}
	function downFile(fileurl,filename){
		parent.window.location.href="/jxzhpt/jhgl/downAbgcFile.do?uploads.fileurl="+fileurl+"&uploads.filename="+filename;
	}
	function deleteFile(id){
		if(confirm('确定删除所选数据？')){
			$.ajax({
				 type : "POST",
				 url : "/jxzhpt/jhgl/deleteFile.do",
				 dataType : 'json',
				 data : 'uploads.id=' +id,
				 success : function(msg){
					 if(msg){
						 alert('删除成功！');
						 fileShow();
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
	function upload(id){
		$("#"+id).uploadifySettings('scriptData',{'jh.sbnf':$('#scxmnf').combo("getValue"),'uploads.parentid':xxId});
		$('#'+id).uploadifyUpload();
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
					灾害防治项目基本信息
				</td>
			</tr>
			<tr style="height: 30px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">路线编码：</td>
				<td style="background-color: #ffffff;" align="left">
					<span id="lxbm"></span>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">路线名称：</td>
				<td style="background-color: #ffffff;" align="left">
					<span id="lxmc"></span>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">管养单位：</td>
				<td style="background-color: #ffffff; " align="left">
					<span id="gydw"></span>
			</tr>
			<tr style="height: 30px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">起点桩号：</td>
				<td style="background-color: #ffffff; " align="left">
					<span id="qdzh"></span>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">止点桩号：</td>
				<td style="background-color: #ffffff; " align="left">
					<span id="zdzh"></span>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">总里程：</td>
				<td style="background-color: #ffffff; " align="left">
					<span id="qzlc"></span>
			</tr>
			<tr style="height: 30px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">行政区划代码：</td>
				<td style="background-color: #ffffff; " align="left">
					<span id="xzqhdm"></span>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">行政区划名称：</td>
				<td style="background-color: #ffffff; "align="left">
					<span id="xzqhmc"></span>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">修建/改建年度：</td>
				<td style="background-color: #ffffff; " align="left">
					<span id="gjxjnd"></span>
			</tr>
			<tr style="height: 30px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">路线技术等级：</td>
				<td style="background-color: #ffffff; " align="left">
					<span id="lxjsdj"></span>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">隐患里程：</td>
				<td style="background-color: #ffffff; " align="left">
					<span id="yhlc"></span>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">特殊地区：</td>
				<td style="background-color: #ffffff; " align="left">
					<span id="tsdq"></span>
				</td>
			</tr>
			<tr style="height: 30px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">项目年份：</td>
				<td style="background-color: #ffffff; " align="left">
					<span id="xmnf"></span>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">项目状态：</td>
				<td style="background-color: #ffffff; " align="left">
					<span id="xmtype"></span>
				<td colspan="2" style="background-color: #ffffff; height: 20px;" align="left"></td>
			</tr>
			<tr style="height: 30px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">隐患内容：</td>
				<td colspan="5" style="background-color: #ffffff;" align="left">
					<span id="yhnr"></span>
				</td>
			</tr>
			<tr style="height: 30px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">备&nbsp;&nbsp;注：</td>
				<td colspan="5" style="background-color: #ffffff;" align="left">
					<span id="bz"></span>
				</td>
			</tr>
			<tr style="height: 25px;">
				<td colspan="6" style="border-style: none none solid none; border-width: 1px; color: #55BEEE; font-weight: bold; font-size: small; text-align: left; background-color: #F1F8FF; width: 15%; padding-left: 10px;">
					灾害防治项目审查信息
				</td>
			</tr>
			<tr style="height: 30px;">
			<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">起点桩号：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" name="scqdzh" id="scqdzh" style="width: 150px"onblur="changeZlc()"/>
					<br/><span id="qd"></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">止点桩号：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" name="sczdzh"id="sczdzh" style="width: 156px"onblur="changeZlc()"/>
					<br/><span id="zd"></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">总里程：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="sczlc">0</span>&nbsp;公里
				</td>
			</tr>
			<tr style="height: 30px;">
			 <td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">项目年份：</td>
				<td style="background-color: #ffffff;" align="left">
					<select id="scxmnf" style="width: 154px"></select>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">隐患里程：</td>
				<td colspan="3" style="background-color: #ffffff;" align="left">
					<input type="text" id="scyhlc" style="width: 150px"value="0"/>&nbsp;公里
				</td>
			</tr>
			<tr style="height: 30px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">方案评估单位：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" name="fapgdw" id="fapgdw" style="width: 150px"/></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">方案审查单位：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" name="fascdw"id="fascdw" style="width: 156px"/></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">方案审批时间：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" id="faspsj"  class="easyui-datebox"/>
				</td>
			</tr>
			<tr style="height: 30px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">审批文号：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" name="spwh" id="spwh" style="width: 150px"/></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">投资估算：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" name="tzgs"id="tzgs" style="width: 115px"/>&nbsp;万元</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">建设性质：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<select id="jsxz" style="width: 150px">
						<option value="中修"selected>中修</option>
						<option value="大修">大修</option>
						<option value="改建">改建</option>
					</select>
				</td>
			</tr>
			<tr style="height: 30px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">建设内容：</td>
				<td colspan="5" style="background-color: #ffffff; height: 20px;" align="left">
					<textarea id="jsnr"rows="2"  style="width:99%">修复工程</textarea>
				</td>
			</tr>
			<tr>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">备&nbsp;&nbsp;注：</td>
				<td colspan="5" style="background-color: #ffffff; height: 20px;" align="left">
					<textarea id="scbz" rows="2" style="width:99%"></textarea>
				</td>
			</tr>
			<tr>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">工可报告：</td>
				<td id="td_gkbg" colspan="5" style="background-color: #ffffff; height: 20px;" align="left">
					<table style="margin-top:5px;background-color: #aacbf8; font-size: 12px" border="0" cellpadding="1" cellspacing="1">
						<tbody id="gkbgTable"></tbody>
					</table>
					<table>
						<tr>
							<td><input type="file" value="选择图片" style="background-image: url('../../../js/uploader/bdll.png');" name="uploadGk" id="uploadGk" /></td>
							<td><div id="fileQueue" ></div></td>
						</tr>
						<tr>
							<td rowspan="2">
								<img name="uploadFile" id="uploadFile" src="../../../js/uploader/upload.png" onclick="upload('uploadGk')"  style="border-width:0px;cursor: hand;" />
							</td>
						</tr>
					</table>
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
				<td colspan="6" style="background-color: #ffffff; height: 35px;"
					align="center"><a href="javascript:void(0)" id="save_button"
					class="easyui-linkbutton" plain="true" iconCls="icon-save">保存</a> <a
					href="javascript:void(0)" id="qx_window"
					class="easyui-linkbutton" plain="true" iconCls="icon-cancel">取消</a></td>
			</tr>
			</table>
</body>
</html>