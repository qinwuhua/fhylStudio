<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath}/css/searchAndNavigation.css" type="text/css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/icon.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/YMLib.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/util/jquery.cookie.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/uploader/swfobject.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/uploader/jquery.uploadify.v2.1.4.js"></script>
<script type="text/javascript"src="${pageContext.request.contextPath }/widget/newlhgdialog/lhgcore.min.js"></script>
<link href="${pageContext.request.contextPath }/js/uploader/uploadify.css" rel="stylesheet" type="text/css" />
<style type="text/css">
.as {
	font-size: 14px;
	color: #4E4E4E;
	text-decoration: none;
}
</style>

<script type="text/javascript">
        var dg = frameElement.lhgDG;
        $(document).ready(function() {
        var url=request('url');
		$("#fileupload").uploadify({
			/*注意前面需要书写path的代码*/
			'uploader' : '${pageContext.request.contextPath }/js/uploader/uploadify.swf',
			'script' : url,
			//'script': function(){return '${pageContext.request.contextPath }/bbdc/fileupload.do?' & ${a}'},
			'cancelImg' : '${pageContext.request.contextPath }/js/uploader/cancel.png',
			'queueID' : 'fileQueue',
			//和存放队列的DIV的id一致 
			'fileDataName' : 'fileupload',
			//和以下input的name属性一致 
			'auto' : false,
			//是否自动开始 
			'multi' : true, 
			//是否支持多文件上传 
			//'buttonText' : '浏览...',
			'buttonImg': '${pageContext.request.contextPath }/js/uploader/btn_view.png',
			//按钮上的文字 
			'simUploadLimit' : 3,
			//一次同步上传的文件数目 
			'sizeLimit' : 20000000,
			//设置单个文件大小限制 
			'queueSizeLimit' : 5,
			//队列中同时存在的文件个数限制 
			'fileDesc' : '支持格式:xls',
			//如果配置了以下的'fileExt'属性，那么这个属性是必须的 
			'fileExt' : '',
			//允许的格式   
			'height' : 30,
			'width' : 92,
			//另外上传的参数
			'scriptData' : {
				id:request('id')
			},
			onComplete : function(event, queueID, fileObj, response, data) {
// 				if(response!=null||response!='error'){
// 					addaqyb(response);
// 				}
//				alert(response);
				var arr=response.substr(response.length-32,response.length);
//				alert(response.substr(response.length-32,response.length).length);
				$('<li></li>').appendTo('.files').html(response.substr(0,response.length-32)+'                   <a id="'+arr+'" href="javascript:DelTz('+"'"+arr+"'"+')"  style="text-decoration:none;"> 删除 </a> ');
			},
			onError : function(event, queueID, fileObj) {
				alert("文件:" + fileObj.name + "上传失败");
			},
			onCancel : function(event, queueID, fileObj) {
				//alert("取消了" + fileObj.name+"上传");
			},
			onQueueFull : function(event, queueSizeLimit) {
				alert("最多支持上传文件数为：" + queueSizeLimit);

			}
		});

	});
   function request(strParame) {
   	var args = new Object( );
   	var query = location.search.substring(1);

   	var pairs = query.split("&"); // Break at ampersand
   	for(var i = 0; i < pairs.length; i++) {
   	var pos = pairs[i].indexOf('=');
   	if (pos == -1) continue;
   	var argname = pairs[i].substring(0,pos);
   	var value = pairs[i].substring(pos+1);
   	value = decodeURIComponent(value);
   	args[argname] = value;
   	}
   	return args[strParame];
   	} 
</script>
<script type="text/javascript">
	function addaqyb(){
		if($("#fsdwmc").val()==''){
			alert("请填写发布单位");
			return;
		}
		if($("#wjmc").val()==''){
			alert("请添加通知名称");
			return;
		}
		if($("#wjgy").val()==''){
			alert("请添加通知内容");
			return;
		}
		if(!confirm("确认保存吗？")){
			return;
		}
		var data= "wjgl.jsdw="+$("#fsdwmc").val()+"&wjgl.wjmc="+$("#wjmc").val()+"&wjgl.wjgy="+''+"&wjgl.fbdw="+$.cookie("unit")
		+"&wjgl.id="+request('id')+"&wjgl.fbr="+$.cookie("truename");
		//alert(data);
		$.ajax({
				type:'post',
				url:'/jxzhpt/wjxt/insertZcwj.do',
				data:data,
				dataType:'json',
				async:false,
				success:function(msg){
					if(Boolean(msg)){
						alert('保存成功！');
						fanhui();
					}else{
						alert('保存失败！');
					}
				}
			});	
	}
	//必须的 
	function shangchuan(){
		if($("#fileQueue").text()==''){
			alert("请添加上传文件");
		}
		uploadifyUpload();
	}
	function tianjia(){
		uploadifyUpload();
		addaqyb();
		//uploadifyUpload();
	}
	function uploadifyUpload() {
		$('#fileupload').uploadifyUpload();
	}
	function fanhui() {
		var data="id="+request('id');
		$.ajax({
			type:'post',
			url:'/jxzhpt/wjxt/deleteWjfile1.do',
			data:data,
			dataType:'json',
			success:function(msg){
				
			}
		});	
		var flag=request('flag');
		parent.window.location = '/jxzhpt/page/zcwj/'+flag;
 		dg.cancel();
	}
	$(function(){
		/* setGydw("jsdw","36");*/
		var data1="yhdw="+$.cookie("unit"); 
		$.ajax({
			type:'post',
			url:'/jxzhpt/xtgl/selAllBm.do',
			data:data1,
			dataType:'json',
			success:function(msg){
				$("#fsdwmc").val(msg[0].text);
			}
		});	
		
	});
	/* function setGydw(id, dwbm){
			$('#' + id).tree(
			{
				checkbox : true,
				//cascadeCheck : false, 
				multiple:true,
				url : '/jxzhpt/gcgl/selAllBm3.do?yhdw=' + dwbm,
				onCheck : function (node){
					var nodes=$('#' + id).tree('getChecked');
					var codes='';
					$('#jsdw').val('');
					for(var i=0;i<nodes.length;i++){
						codes+=nodes[i].id+',';
					}
					$('#jsdw').val(codes);
				},
			});

	} */
	function DelTz(str){
//		alert(str);
		var data="wjgl.id="+str;
		if(confirm("确认删除吗？")){
			$.ajax({
				type:'post',
				url:'/jxzhpt/wjxt/deleteWjfile.do',
				data:data,
				dataType:'json',
				success:function(msg){
					if(Boolean(msg)){
						alert('删除成功！');
						$("#"+str).attr("href","#");
						$("#"+str).attr("style","cursor: default;color: #CCCCCC;text-decoration:none;");
						$("#"+str).text("已删除");
					}else{
						alert('删除失败！');
					}
				}
			});	
	}
}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>无标题文档</title>
</head>

<body onunload="fanhui()">
	<form method="post" enctype="multipart/form-data" id="formfile">
		<center>
		                <table width="100%" border="0" style="border-style: solid; border-width: 3px 1px 1px 1px;
                            border-color: #55BEEE #C0C0C0 #C0C0C0 #C0C0C0; height: 45px;" cellspacing="0"
                            cellpadding="0">
							<tr style="height: 35px;">
                                <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                    color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                    padding-right: 5px; vertical-align: middle;">
                                    <b><font color="#009ACD" style="font-size: 12px;">发布单位 </font></b>
                                </td>
                                <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                                    border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;" colspan="3">
                                   <input type="text" id="fsdwmc">
                                </td>
                            </tr>
                            <tr style="height: 35px;">
                                <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                    color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                    padding-right: 5px; vertical-align: middle;">
                                    <b><font color="#009ACD" style="font-size: 12px">文件名称 </font></b>
                                </td>
                                <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                                    border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;" colspan="3">
                                 <input type="text" id="wjmc"  style="width: 300px;">
                                </td>
                            </tr>
                             <!--  <tr style="height: 35px;">
                                <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                    color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                    padding-right: 5px; vertical-align: middle;">
                                    <b><font color="#009ACD" style="font-size: 12px">文件概要 </font></b>
                                </td>
                                <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                                    border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;" colspan="3">
                                  <textarea rows="5" cols="50" id="wjgy"></textarea>
                                </td>
                                
                            </tr> -->

                       	 <tr style="height: 35px;" >
                             <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                    color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                    width: 15%; padding-right: 5px; vertical-align: middle;" rowspan="2">
                                    <b><font color="#009ACD" style="font-size: 12px">上传文件 </font></b>
                                </td>
                                <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                                    border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;" colspan="1">
                                   <input type="file" name="fileupload" id="fileupload" /><span style="font-size: x-small;vertical-align: 120%">(小于20M)</span>
                                </td>
<!--                                 <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                                    border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;" colspan="2">
                                   <a href="javascript:;" onClick="shangchuan()"  class="easyui-linkbutton" > 上传 </a> 
                                </td> -->
                            </tr>
                            <tr style="height: 64px;" >
                                <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                                    border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;" colspan="3">
                                  <div id="fileQueue"></div>
                                 <ul style="list-style: none;" class=files>
								 </ul>
                                </td>
                            </tr>
                        </table>
		<p>
			<a href="javascript:;" onClick="tianjia()"  class="easyui-linkbutton" iconCls="save"
				class="as" > 保存 </a> 
            <a href="#" class="easyui-linkbutton" iconCls="back" onclick="fanhui()" >返回 </a>
           </p>
		
		</center>
	</form>
</body>
</html>
