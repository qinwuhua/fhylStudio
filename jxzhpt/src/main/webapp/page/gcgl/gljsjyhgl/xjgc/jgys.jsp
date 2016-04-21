<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>交工验收</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/icon.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/easyui/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/uploader/swfobject.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/uploader/jquery.uploadify.v2.1.4.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/widget/newlhgdialog/lhgcore.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/widget/newlhgdialog/lhgdialog.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/YMLib.js"></script>
<script type="text/javascript" src="js/gcgzgj.js"></script>
<script type="text/javascript">
	$(function(){
		$("#yssj").datebox({});  
		var date=new Date();
		var y = date.getFullYear();
		var m = date.getMonth()+1;
		var d = date.getDate(); 
		if(m<=9){
			m='0'+m;
		}
		if(d<=9){
			d='0'+d;
		}
		$('#yssj').datebox('setValue', y+'-'+m+'-'+d);
		loadUploadify();
		fileShow();
		showJGYS();
	});
	var xxId=parent.obj1.XMBM;

	function loadUploadify(){
		$("#uploadSGXK").uploadify({
			/*注意前面需要书写path的代码*/
			'uploader' : '../../../../js/uploader/uploadify.swf',
			'script' : '../../../../gcgl/uploadJGYSFile.do',
			'cancelImg' : '../../../../js/uploader/cancel.png',
			'queueID' : 'fileQueue',
			'fileDataName' : 'uploadSGXK',
			'auto' : false,
			'multi' : false,
			'buttonImg': '../../../../js/uploader/bdll.png',
			'simUploadLimit' : 3,
			'sizeLimit' : 20000000,
			'queueSizeLimit' : 5,
			'fileDesc' : '支持格式:xls',
			'fileExt' : '',
			'height' : 30,
			'width' : 92,
			'scriptData' : {
				'gcgl_jgys.jhid':xxId,
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
		
		$("#uploadJGTC").uploadify({
			/*注意前面需要书写path的代码*/
			'uploader' : '../../../../js/uploader/uploadify.swf',
			'script' : '../../../../gcgl/uploadJGYSFile.do',
			'cancelImg' : '../../../../js/uploader/cancel.png',
			'queueID' : 'fileQueue1',
			'fileDataName' : 'uploadJGTC',
			'auto' : false,
			'multi' : true,
			'buttonImg': '../../../../js/uploader/bdll.png',
			'simUploadLimit' : 3,
			'sizeLimit' : 20000000,
			'queueSizeLimit' : 5,
			'fileDesc' : '支持格式:xls',
			'fileExt' : '',
			'height' : 30,
			'width' : 92,
			'scriptData' : {
				'gcgl_jgys.jhid':xxId,
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
		
		$("#uploadWGYS").uploadify({
			/*注意前面需要书写path的代码*/
			'uploader' : '../../../../js/uploader/uploadify.swf',
			'script' : '../../../../gcgl/uploadJGYSFile.do',
			'cancelImg' : '../../../../js/uploader/cancel.png',
			'queueID' : 'fileQueue2',
			'fileDataName' : 'uploadWGYS',
			'auto' : false,
			'multi' : false,
			'buttonImg': '../../../../js/uploader/bdll.png',
			'simUploadLimit' : 3,
			'sizeLimit' : 20000000,
			'queueSizeLimit' : 5,
			'fileDesc' : '支持格式:xls',
			'fileExt' : '',
			'height' : 30,
			'width' : 92,
			'scriptData' : {
				'gcgl_jgys.jhid':xxId,
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
	}
	
	function fileShow(){
		//加载文件
		$.ajax({
			type:'post',
			url:'/jxzhpt/jhgl/queryFjByParentId.do',
			dataType:'json',
			data:'uploads.id='+xxId,
			success:function(data){
		/* 		var data=datas.rows; */
			/* 	alert(data); */
				$("#sgxkTable").empty();
				$("#jgtcTable").empty();
				$("#wgysTable").empty();
				var sgxk="";
				var jgtc="";
				var wgys="";
				for ( var i = 0; i < data.length; i++) {
					if(data[i].filetype=="施工许可"){
						sgxk += "<tr><td style='background-color: #ffffff; height: 25px;' align='left'>" + data[i].filename +"</td><td style='background-color: #ffffff; height: 25px;' align='left'><a href='javascript:void(0)'style='text-decoration:none;color:#3399CC; ' onclick=downFile('"+data[i].id+"')>下载</a>  |  <a href='javascript:void(0)'style='text-decoration:none;color:#3399CC; ' onclick=deleteFile('"+data[i].id+"')>删除</a></td></tr>";
					}
					if(data[i].filetype=="交工通车"){
						jgtc += "<tr><td style='background-color: #ffffff; height: 25px;' align='left'>" + data[i].filename +"</td><td style='background-color: #ffffff; height: 25px;' align='left'><a href='javascript:void(0)'style='text-decoration:none;color:#3399CC; ' onclick=downFile('"+data[i].id+"')>下载</a>  |  <a href='javascript:void(0)'style='text-decoration:none;color:#3399CC; ' onclick=deleteFile('"+data[i].id+"')>删除</a></td></tr>";
					}
					if(data[i].filetype=="完工验收"){
						wgys += "<tr><td style='background-color: #ffffff; height: 25px;' align='left'>" + data[i].filename +"</td><td style='background-color: #ffffff; height: 25px;' align='left'><a href='javascript:void(0)'style='text-decoration:none;color:#3399CC; ' onclick=downFile('"+data[i].id+"')>下载</a> |  <a href='javascript:void(0)' style='text-decoration:none;color:#3399CC; ' onclick=deleteFile('"+data[i].id+"')>删除</a></td></tr>";
					}
					}
				$("#sgxkTable").append(sgxk);
				$("#jgtcTable").append(jgtc);
				$("#wgysTable").append(wgys);
			}
		});
	}
	function downFile(id){
		parent.window.location.href="/jxzhpt/jhgl/downAbgcFile.do?uploads.id="+id;
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
function addjgys(){
		var data='gcgl_jgys.yssj='+$('#yssj').datebox('getValue')+'&gcgl_jgys.ysdw='+$("#ysdw").val()+'&gcgl_jgys.ysyj='+$("#ysyj").val()+'&gcgl_jgys.jhid='+xxId;
		if($("#sbz").html(msg.SBZ);){
			return;
		}
		if(xxId==''){
			return;
		}
		$.ajax({
			 type : "POST",
			 url : "/jxzhpt/gcgl/insertJGYS.do",
			 dataType : 'json',
			 data : data,
			 success : function(msg){
				 if(msg){
					 alert('保存成功！');
				 }else{
					 YMLib.Tools.Show('保存失败',3000);
				 }
			 },
			 error : function(){
				 YMLib.Tools.Show('服务器请求无响应！error code = 404',3000);
			 }
		});
}

function showJGYS(){
	$.ajax({
		 type : "POST",
		 url : "/jxzhpt/gcgl/queryJGYS.do",
		 dataType : 'json',
		 data : 'gcgl_jgys.jhid=' +xxId,
		 success : function(msg){
			$('#yssj').datebox('setValue',msg.yssj);
			$('#ysdw').val(msg.ysdw);
			$('#ysyj').val(msg.ysyj);
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
					交工验收信息
				</td>
			</tr>
			<tr style="height: 30px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">验收时间：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left" colspan="2">
					<input type="text"  id="yssj" style="width: 150px"/>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">验收单位：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left" colspan="2">
					<input type="text"  id="ysdw" style="width: 156px"/>
			</tr>
			<tr style="height: 50px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">验收意见：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left" colspan="5">
					<textarea id="ysyj" rows="3" cols="50%"></textarea>
				</td>
			</tr>
<!-- 			<tr> -->
<!-- 				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">施工许可文件：</td> -->
<!-- 				<td id="td_sgxk" colspan="5" style="background-color: #ffffff; height: 20px;" align="left"> -->
<!-- 					<table style="margin-top:5px;background-color: #aacbf8; font-size: 12px" border="0" cellpadding="1" cellspacing="1"> -->
<!-- 						<tbody id="sgxkTable"></tbody> -->
<!-- 					</table> -->
<!-- 					<table> -->
<!-- 						<tr> -->
<%-- 							<td><input type="file" value="选择图片" style="background-image: url('${pageContext.request.contextPath }/js/uploader/bdll.png');" name="uploadGk" id="uploadSGXK" /></td> --%>
<!-- 							<td><div id="fileQueue" ></div></td> -->
<!-- 						</tr> -->
<!-- 						<tr> -->
<!-- 							<td rowspan="2"> -->
<%-- 								<img name="uploadFile" id="uploadFile" src="${pageContext.request.contextPath }/js/uploader/upload.png" onclick="$('#uploadSGXK').uploadifyUpload()"  style="border-width:0px;cursor: hand;" /> --%>
<!-- 							</td> -->
<!-- 						</tr> -->
<!-- 					</table> -->
<!-- 				</td> -->
<!-- 			</tr> -->
				<tr>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">交工通车文件：</td>
				<td id="td_jgtc" colspan="5" style="background-color: #ffffff; height: 20px;" align="left">
					<table style="margin-top:10px;background-color: #aacbf8; font-size: 12px" border="0"
								cellpadding="1" cellspacing="1">
						<tbody id="jgtcTable"></tbody>
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
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">竣工验收文件：</td>
				<td id="td_wgys" colspan="5" style="background-color: #ffffff; height: 20px;" align="left">
					<table style="margin-top:10px;background-color: #aacbf8; font-size: 12px" border="0"
								cellpadding="1" cellspacing="2">
						<tbody id="wgysTable"></tbody>
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
			<tr style="height: 30px;">
				<td colspan="6" style="background-color: #ffffff; height: 30px;"
					align="center"><a href="javascript:addjgys()" id="save_button"
					class="easyui-linkbutton" plain="true" iconCls="icon-save">保存</a> <a
					href="javascript:closes('wqxx')" id="qx_window"
					class="easyui-linkbutton" plain="true" iconCls="icon-cancel">关闭</a></td>
			</tr>
			</table>
</body>
</html>