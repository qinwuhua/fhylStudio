<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>基础库管理安保工程项目</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/icon.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/autocomplete/jquery.autocomplete.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-form.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/uploader/swfobject.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/uploader/jquery.uploadify.v2.1.4.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/autocomplete/jquery.autocomplete.js" ></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/util/jquery.cookie.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/YMLib.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/page/qqgl/js/loadTJ.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/page/qqgl/kxxyj/js/kxxyj.js"></script>

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
	$(function(){
		fileShow(parent.obj.xmbm,"工可批复文件");
		loadFileUpload();
	});

	function loadFileUpload(){
		$("#uploadGkpf").uploadify({
			/*注意前面需要书写path的代码*/
			'uploader' : '../../../js/uploader/uploadify.swf',
			'script' : '../../../qqgl/uploadGkpf.do',
			'cancelImg' : '../../../js/uploader/cancel.png',
			'queueID' : 'fileQueue',
			'fileDataName' : 'uploadGkpf',
			'auto' : false,
			'multi' : false,
			'buttonImg': '../../../js/uploader/bdll.png',
			'simUploadLimit' : 3,
			'sizeLimit' : 524288000,
			'queueSizeLimit' : 5,
			'fileDesc' : '支持格式:doc，docx，pdf，rar，zip',
			'fileExt' : '*.doc;*.docx;*.pdf;*.rar;*.zip;',
			'height' : 30,
			'width' : 92,
			'scriptData' : {
				'kxxyj.xmbm':parent.obj.xmbm
			},
			onComplete : function(event, queueID, fileObj, response, data) {
				alert(response);
				fileShow(parent.obj.xmbm,"工可批复文件");
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
	function upload(){		
/* 			$("#uploadGkpf").uploadifySettings('scriptData',{'kxxyj.xmbm':parent.YMLib.Var.xmbm,'kxxyj.gkpfwh':$('#gkpfwh').val()});
 */			$('#uploadGkpf').uploadifyUpload();
	
	}
</script>
<form action="" id="kxxyj">
<table style="width: 100%; background-color: #aacbf8; font-size: 12px" border="0" cellpadding="3" cellspacing="1">
			<tr style="height: 15px;">
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left" colspan="5">
					<table style="margin-top:5px;background-color: #aacbf8; font-size: 12px" border="0" cellpadding="1" cellspacing="1">
							<tbody id="gkpfTable"></tbody>
						</table>
						<table>
							<tr>
								<td><input type="file" value="选择批复文件" style="background-image: url('../../../js/uploader/bdll.png');" name="uploadGkpf" id="uploadGkpf" /></td>
								<td><div id="fileQueue" ></div></td>
							</tr>
						</table>
				</td>
			</tr>
			<tr style="height: 35px;">
				<td colspan="6" style="background-color: #ffffff;"align="center">
				<a href="javascript:void(0)" name="uploadFile" id="uploadFile" class="easyui-linkbutton" iconCls="upload"  onclick="upload()"  style="border-width:0px;cursor: hand;" >上传</a>
			</tr>
		</table>
	</form>
</body>
</html>