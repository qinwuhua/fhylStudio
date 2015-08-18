<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>危桥改造月报上报</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/easyui/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/easyui/themes/icon.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/js/autocomplete/jquery.autocomplete.css" />
<script type="text/javascript" src="${pageContext.request.contextPath }/easyui/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/easyui/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/uploader/swfobject.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/uploader/jquery.uploadify.v2.1.4.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/autocomplete/jquery.autocomplete.js" ></script>
	<script type="text/javascript" src="/jxzhpt/js/util/jquery.cookie.js"></script>
	<script type="text/javascript" src="/jxzhpt/js/YMLib.js"></script>
	<script type="text/javascript" src="js/wqgz.js"></script>
	<script type="text/javascript">
	var sbsj;
	var sbyf;
	$(function(){
		fileShow11(parent.obj1.id,"完工桥梁正面文件");
		fileShow12(parent.obj1.id,"完工桥梁侧面文件");
		loadUploadify();
			$("#tj_sjwgsj").datebox({      
			});  
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
			$('#tj_sjwgsj').datebox('setValue', y+'-'+m+'-'+d);
		});
		
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
				'gcgl_jgys.jhid':parent.obj1.id,
				'gcgl_jgys.name':'wgqlzmwj',
			},
			onComplete : function(event, queueID, fileObj, response, data) {
				alert(response);
				fileShow11(parent.obj1.id,"完工桥梁正面文件");
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
			'multi' : false,
			'buttonImg': '/jxzhpt/js/uploader/bdll.png',
			'simUploadLimit' : 3,
			'sizeLimit' : 20000000,
			'queueSizeLimit' : 5,
			'fileDesc' : '支持格式:xls',
			'fileExt' : '',
			'height' : 30,
			'width' : 92,
			'scriptData' : {
				'gcgl_jgys.jhid':parent.obj1.id,
				'gcgl_jgys.name':'wgqlcmwj',
			},
			onComplete : function(event, queueID, fileObj, response, data) {
				alert(response);
				fileShow12(parent.obj1.id,"完工桥梁侧面文件");
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
	var zmzp='false'	
	function yzzmzp(){
		$.ajax({
			type:'post',
			url:'/jxzhpt/gcgl/loadWqgzwgzp.do',
			data:"gcgl_jgys.id="+parent.obj1.jhid+"&gcgl_jgys.name=完工桥梁正面文件",
			dataType:'json',
			async:false,
			success:function(msg){
				if(Boolean(msg)){
					zmzp='true';
				}else{
					alert('请您上传至少一张正面照片！');
					zmzp='false';
				}
			}
		});	
		
	}
	var cmzp='false';
	function yzcmzp(){
		$.ajax({
			type:'post',
			url:'/jxzhpt/gcgl/loadWqgzwgzp.do',
			data:"gcgl_jgys.id="+parent.obj1.jhid+"&gcgl_jgys.name=完工桥梁侧面文件",
			dataType:'json',
			async:false,
			success:function(msg){
				if(Boolean(msg)){
					cmzp='true';
				}else{
					alert('请您上传至少一张侧面照片！');
					cmzp='false';
				}
			}
		});	
	}
	//完工
	function tjwqgzwg1(){
		if(!confirm("确认完工吗？")){
			return;
		}
		yzzmzp();
		if(zmzp=='false')
			return;
		yzcmzp();
		if(cmzp=='false')
			return;
		var data="gcglwqgz.sjwgsj="+$("#tj_sjwgsj").datebox('getValue')+"&gcglwqgz.jhid="+parent.obj1.jhid;
		//alert(data);
		$.ajax({
			type:'post',
			url:'/jxzhpt/gcgl/insertWqgzwg.do',
			data:data,
			dataType:'json',
			success:function(msg){
				if(Boolean(msg)){
					alert('保存成功！');
					parent.$("#datagrid").datagrid('reload');
					closes('wqxx');
				}else{
					alert('保存失败！');
				}
			}
		});	
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
                    <table style="width: 98%; margin-top: 15px;margin-left: 10px; background-color: #aacbf8; font-size: 12px"
						border="0" cellpadding="3" cellspacing="1">
                        <tr style="height: 35px;">
                            <td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
                                <b><font color="#009ACD" style=" font-size: 12px">实际完工时间：</font></b>
                            </td>
                            <td colspan="5" style="background-color: #ffffff; height: 20px;" align="left">
                                <input style="width: 150px" type="text" id="tj_sjwgsj" />
                            </td>
                        </tr>
                  <tr style="height: 35px;">
                    <td colspan="6" style="background-color: #F1F8FF; height: 20px;margin-left: 50px;" align="left">
                        <b><font color="red" >&nbsp;&nbsp;&nbsp;&nbsp;* 注意：您必须上传至少一张正面照片和一张侧面照片。</font></b>
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
									<img name="uploadFile" id="uploadFile" src="${pageContext.request.contextPath }/js/uploader/upload.png" onclick="$('#uploadJGTC').uploadifyUpload()"  style="border-width:0px;" />
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
									<img name="uploadFile" id="uploadFile" src="${pageContext.request.contextPath }/js/uploader/upload.png" onclick="$('#uploadWGYS').uploadifyUpload()"  style="border-width:0px;" />
								</td>
							</tr>
						</table>
				</td>
			</tr>
          </table>
           <table style="width: 98%; margin-top: 15px;margin-left: 10px; background-color: #ffffff; font-size: 12px;" border="0" cellpadding="3" cellspacing="1">
               <tr style="height: 30px;">
                   <td align="center">
                       <img src="${pageContext.request.contextPath}/images/Button/baocun1.gif" id="Img1" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/baocun2.gif'" alt="保存" onmouseout="this.src='${pageContext.request.contextPath}/images/Button/baocun1.gif'" style="cursor: hand" onclick="tjwqgzwg1();" />
                       <img src="${pageContext.request.contextPath}/images/Button/fanhui1.GIF" id="Img2" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/fanhui2.GIF'" alt="返回" onmouseout="this.src='${pageContext.request.contextPath}/images/Button/fanhui1.GIF'" onclick="closes('wqxx')" style="cursor: hand" />
                   </td>
               </tr>
           </table>
</div>

</body>
</html>