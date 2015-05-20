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
<script type="text/javascript" src="../../../../js/util/jquery.cookie.js"></script>
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
			'multi' : false,
			//是否支持多文件上传 
			//'buttonText' : '浏览...',
			'buttonImg': '${pageContext.request.contextPath }/js/uploader/btn_view.png',
			//按钮上的文字 
			'simUploadLimit' : 1,
			//一次同步上传的文件数目 
			'sizeLimit' : 20000000,
			//设置单个文件大小限制 
			'queueSizeLimit' : 1,
			//队列中同时存在的文件个数限制 
			'fileDesc' : '支持格式:xls',
			//如果配置了以下的'fileExt'属性，那么这个属性是必须的 
			'fileExt' : '',
			//允许的格式   
			'height' : 30,
			'width' : 92,
			//另外上传的参数
			'scriptData' : {
				id:parent.obj1.id
			},
			onComplete : function(event, queueID, fileObj, response, data) {
				if(response!=null||response!='error'){
					addaqyb(response);
				}else{
					alert("对不起，附件未上传成功");
				}
				$('<li></li>').appendTo('.files').text(response);
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
	function addaqyb(response){
		var data= "gcglaqyb.sendingunits="+$("#sendingunitsid").val()+"&gcglaqyb.filename="+$("#tj_filename").val()+"&gcglaqyb.wenhao="+$("#tj_wenhao").val()+"&gcglaqyb.reportmonth="+$("#tj_reportmonth").val()+"&gcglaqyb.remark="+$("#tj_remark").val()
		+"&gcglaqyb.id="+response;
		//alert(data);
		$.ajax({
				type:'post',
				url:'../../../../gcgl/insertAqybb1.do',
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
	function tianjian(){
		if($("#fileQueue").text()=="原文件："+parent.obj1.xspath){
			addaqyb(parent.obj1.id);
		}
		uploadifyUpload();
	}
	function uploadifyUpload() {
		$('#fileupload').uploadifyUpload();
	}
	function fanhui() {
		var flag=request('flag');
		//alert(flag);
			parent.window.location = '/jxzhpt/page/gcgl/'+flag+'.jsp';
		
 		dg.cancel();
	}
	$(function(){
		setGydw("tj_sendingunits","36");
		var data1="yhdw="+$.cookie("unit");
		var mystr='';
		var mystr1='';
		var mystr2='';
		var myDate = new Date();
		var y = myDate.getFullYear();
		var m = myDate.getMonth()+1;       //获取当前月份(0-11,0代表1月)
		if(m==1){
			mystr=y+'-'+m;
			mystr1=(y-1)+'-'+11;
			mystr2=(y-1)+'-'+12;
		}
		else if(m==2){
			mystr=y+'-'+m;
			mystr1=(y-1)+'-'+12;
			mystr2=y+'-'+1;
		}else if(m==11){
			mystr=y+'-'+m;
			mystr1=y+'-'+9;
			mystr2=y+'-'+10;
		}else if(m==12){
			mystr=y+'-'+m;
			mystr1=y+'-'+10;
			mystr2=(y-1)+'-'+11;
		}else{
			mystr=y+'-'+m;
			mystr1=y+'-'+(m-2);
			mystr2=y+'-'+(m-1);
		}
		$("#tj_reportmonth").append("<option value="+mystr+" selected='selected'>"+mystr+"</option>");
		$("#tj_reportmonth").append("<option value="+mystr2+">"+mystr2+"</option>");
		$("#tj_reportmonth").append("<option value="+mystr1+">"+mystr1+"</option>");
		// 		$("#tj_reportmonth").append("<option value="+mystr3+">"+mystr3+"</option>");
		// 		$("#tj_reportmonth").append("<option value="+mystr4+">"+mystr4+"</option>");
		$.ajax({
			type:'post',
			url:'/jxzhpt/xtgl/selAllBm.do',
			data:data1,
			dataType:'json',
			success:function(msg){
				$("#uploadpath").val(msg[0].text);
			}
		});	
		$("#tj_filename").val(parent.obj1.filename);
		$("#tj_wenhao").val(parent.obj1.wenhao);
		$("#tj_reportmonth").val(parent.obj1.reportmonth);
		$("#tj_remark").val(parent.obj1.remark);
		$("#fileQueue").text("原文件："+parent.obj1.xspath);
	});
	function setGydw(id, dwbm){
			$('#' + id).tree(
			{
				checkbox : true,
				cascadeCheck : false, 
				multiple:true,
				url : '/jxzhpt/gcgl/selAllBm4.do?id=' + parent.obj1.id,
				onCheck : function (node){
					var nodes=$('#' + id).tree('getChecked');
					var codes='';
					$('#sendingunitsid').val('');
					for(var i=0;i<nodes.length;i++){
						codes+=nodes[i].id+',';
					}
					$('#sendingunitsid').val(codes);
				},
			onLoadSuccess: function (node){
// 					var data=parent.obj1.sendingunits.split(",");
// 					for(var i=0,len=data.length;i<len;i++){
// 						var node1 = $('#' + id).tree('find', data[i]);
// 						$('#' + id).tree('check', node1.target);
// 					}
// 					$(data).each(function(i, obj){
//                                 var n = $('#' + id).tree('find',obj);
//                                 if(n){
//                                     $('#' + id).tree('check',n.target);
//                                 }
//                    });
				var nodes=$('#' + id).tree('getChecked');
				codes='';
				$('#sendingunitsid').val('');
				for(var i=0;i<nodes.length;i++){
					codes+=nodes[i].id+',';
				}
				$('#sendingunitsid').val(codes);
				}
			});
			
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
                                    <b><font color="#009ACD" style="font-size: 12px">接收单位 </font></b>
                                </td>
                                <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                                    border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;" colspan="3">
                               		<ul id="tj_sendingunits"></ul>
                             	  <input type="hidden" id="uploadpath">
                                   <input type="hidden" id="sendingunitsid">
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
                                <input maxlength="20" type="text" id="tj_filename" name="gcglaqyb.filename"/>
                                </td>
                            
                                
                            </tr>
                              <tr style="height: 35px;">
                                <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                    color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                    width: 15%; padding-right: 5px; vertical-align: middle;">
                                    <b><font color="#009ACD" style="font-size: 12px">文号 </font></b>
                                </td>
                                <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                                    border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;" colspan="3">
                                   <input maxlength="20" type="text" id="tj_wenhao" name="gcglaqyb.wenhao">
                                </td>
                                
                            </tr>
                            <tr style="height: 35px;">
                             <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                    color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                    width: 15%; padding-right: 5px; vertical-align: middle;">
                                    <b><font color="#009ACD" style="font-size: 12px">上报月份 </font></b>
                                </td>
                                <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                                    border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;" colspan="3">
                                   <select id="tj_reportmonth" ></select>
                                </td>
                            </tr>
                            <tr style="height: 40px;">
                             <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                    color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                    width: 15%; padding-right: 5px; vertical-align: middle;">
                                    <b><font color="#009ACD" style="font-size: 12px">备注 </font></b>
                                </td>
                                <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                                    border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;" colspan="3">
                                  <textarea rows="" cols="50" id="tj_remark" name="gcglaqyb.remark"></textarea>
                                </td>
                            </tr>
                       	 <tr style="height: 35px;" >
                             <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                    color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                    width: 15%; padding-right: 5px; vertical-align: middle;" rowspan="2">
                                    <b><font color="#009ACD" style="font-size: 12px">上传文件 </font></b>
                                </td>
                                <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                                    border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;" colspan="3">
                                   <input type="file" name="fileupload" id="fileupload" /><span style="font-size: x-small;vertical-align: 120%">(小于20M)</span>
                                </td>
                            </tr>
                            <tr style="height: 64px;" >
                                <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                                    border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;" colspan="3">
                                  <div id="fileQueue"></div>
                                </td>
                            </tr>
                        </table>
		
		
		<p>
			<a href="#" onClick="tianjian()"  class="easyui-linkbutton" iconCls="save"
				class="as" > 保存 </a> 
            <a href="#" class="easyui-linkbutton" iconCls="back" onclick="fanhui()" >返回 </a>
           </p>
		<ol id="msg" class=files style="display: none" on>
		</ol>
		</center>
	</form>
</body>
</html>
