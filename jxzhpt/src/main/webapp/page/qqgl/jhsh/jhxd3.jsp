<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>资金下达页面</title>
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
	<script type="text/javascript" src="${pageContext.request.contextPath }/page/qqgl/js/util.js"></script>
	<script type="text/javascript">
	function gldj(id){
		
		var years=[];
			years.push({text:('国道')});
			years.push({text:('省道')});
		$('#'+id).combobox({    
		    data:years,
		    valueField:'text',    
		    textField:'text'   
		});
	}
	
		$(function(){
			
			gldj('gldj1');
			$.ajax({
				type:'post',
				url:'../../../qqgl/queryJhshxxByXmbm.do',
				data:'jhsh.xmlx='+parent.YMLib.Var.xmbm.substr(10,1)+'&jhsh.xmbm='+parent.YMLib.Var.xmbm,
				dataType:'json',
				success:function(data){
					$('#jhxdFrom').form("load",data);
					$('#xmlx').val(parent.YMLib.Var.xmbm.substr(10,1));
					$('#gldj1').combobox('setValue',data.gldj);
					$('#xdzt').val("1");
				}
			});
			fileShow(parent.YMLib.Var.xmbm,"计划下达文件");
			$('#xmbm').val(parent.YMLib.Var.xmbm);
			loadFileUpload();
		});
		function loadFileUpload(){
			$("#uploadJhxd").uploadify({
				/*注意前面需要书写path的代码*/
				'uploader' : '../../../js/uploader/uploadify.swf',
				'script' : '../../../qqgl/uploadJhsh.do',
				'cancelImg' : '../../../js/uploader/cancel.png',
				'queueID' : 'fileQueue',
				'fileDataName' : 'uploadJhxd',
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
					'jhsh.xmbm':parent.YMLib.Var.xmbm,
					'jhsh.xdwh':$('#xdwh').val()
				},
				onComplete : function(event, queueID, fileObj, response, data) {
					alert(response);
					fileShow(parent.YMLib.Var.xmbm,"计划下达文件");
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
		function updataJhsh(){
			if($("#gldj1").combobox('getValue')==''||$("#gldj1").combobox('getValue')==null)
			{
				alert("请选择行政等级");
				return;
			}else{
				$("#gldj").val($("#gldj1").combobox('getValue'));
			}
			var result =true;
			result = validateText('pfztz','number',result);
			//result = validateText('bbzzj','number',result);
			//result = validateText('sbzzj','number',result);
			if(!true){
				return;
			}
			$('#jhxdFrom').ajaxSubmit({
				dataType:'json',
				success:function(msg){
					if(msg.result){
						alert("编辑成功！");
						closeWindow("jhxd");
					}
				},
				error:function(msg){
					alert("编辑失败！");
				}
			});
		}
		function upload(){
			if($('#xdwh').val()==""){
				alert("请填写计划下达文号！");
				return;
			}else{
				$("#uploadJhxd").uploadifySettings('scriptData',{'jhsh.xmbm':parent.YMLib.Var.xmbm,'jhsh.xdwh':$('#xdwh').val()});
				$('#uploadJhxd').uploadifyUpload();
			}
		}
	</script>
</head>
<body>
	<center>
		<table width="98%" height="60%" cellpadding="0" cellspacing="0" border="0" style="margin-top: 10px; margin-left: 13px;">
			<tr>
				<td>
					<form id="jhxdFrom" action="../../../qqgl/updateJhshxx.do" method="post">
					<table width="98%" border="0" style="border-style: solid; border-width: 3px 1px 1px 1px; border-color: #55BEEE #C0C0C0 #C0C0C0 #C0C0C0; height: 45px;" cellspacing="0" cellpadding="0">
						<tr style="height: 30px;font-size: 10px;">
							<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
								<b><font color="#009ACD" style="cursor: hand; font-size: 12px">批复总投资：</font></b>
								<input id="xmbm" name="xmbm" type="hidden"/>
								<input id="xmlx" name="xmlx" type="hidden"/>
								<input id="xdzt" name="xdzt" value="1" type="hidden"/>
							</td>
							<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px; font-size: 12px;">
								<input id="pfztz" name="pfztz" class="easyui-numberbox" type="text" value="0" style="width: 100px;height: 20px;" />万元
							</td>
							<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
								<b><font color="#009ACD" style="cursor: hand; font-size: 12px">车购税：</font></b>
							</td>
							<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
								<input id="bbzzj" name="bbzzj" class="easyui-numberbox" type="text" value="0" style="width: 100px;height: 20px;" />万元
							</td>
							<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
								<b><font color="#009ACD" style="cursor: hand; font-size: 12px">国债：</font></b>
							</td>
							<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
								<input id="gz" name="gz" class="easyui-numberbox" type="text" value="0" style="width: 100px;height: 20px;" />万元
							</td>
							
						</tr>
						<tr style="height: 30px;font-size: 10px;">
							<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
								<b><font color="#009ACD" style="cursor: hand; font-size: 12px">省债：</font></b>
							</td>
							<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
								<input id="sz" name="sz" type="text" class="easyui-numberbox" value="0" style="width: 100px;height: 20px;" />万元
							</td>
							<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
								<b><font color="#009ACD" style="cursor: hand; font-size: 12px">债券：</font></b>
								
							</td>
							<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px; font-size: 12px;">
								<input id="zq" name="zq" class="easyui-numberbox" type="text" value="0" style="width: 100px;height: 20px;" />万元
							</td>
							<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
								<b><font color="#009ACD" style="cursor: hand; font-size: 12px">贷款：</font></b>
							</td>
							<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
								<input id="dk" name="dk" class="easyui-numberbox" type="text" value="0" style="width: 100px;height: 20px;" />万元
							</td>
							
						</tr>
						<tr style="height: 30px;font-size: 10px;">
							<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
								<b><font color="#009ACD" style="cursor: hand; font-size: 12px">奖励：</font></b>
							</td>
							<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
								<input id="jl" name="jl" type="text" class="easyui-numberbox" value="0" style="width: 100px;height: 20px;" />万元
							</td>
							<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
								<b><font color="#009ACD" style="cursor: hand; font-size: 12px">其他：</font></b>
								
							</td>
							<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px; font-size: 12px;">
								<input id="qt" name="qt" class="easyui-numberbox" type="text" value="0" style="width: 100px;height: 20px;" />万元
							</td>
							<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
							<b><font color="#009ACD" style="cursor: hand; font-size: 12px">行政等级：</font></b>
							</td>
							<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
								<input type="text" id='gldj1' class="easyui-combobox"  style="width: 105px" data-options="panelHeight:'50'">
								<input id="gldj" name="gldj" type="hidden"/>
								
							</td>
							
						</tr>
						
						<tr style="height: 30px;font-size: 10px;">
							
							
							<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
								<b><font color="#009ACD" style="cursor: hand; font-size: 12px">重要度排序：</font></b>
							</td>
							<td colspan="5" style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px; font-size: 12px;">
								<input id="zydpx" name="zydpx" type="text" class="easyui-numberbox"   style="width: 100px;height: 20px;" />
							</td>
							
							
						</tr>
						<!-- 
						<tr style="height: 30px;font-size: 10px;">
							<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
								<b><font color="#009ACD" style="cursor: hand; font-size: 12px">计划下达文件：</font></b>
							</td>
							<td colspan="5" style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px; font-size: 12px;">
								<table style="margin-top:5px;background-color: #aacbf8; font-size: 12px" border="0" cellpadding="1" cellspacing="1">
									<tbody id="sjpfTable"></tbody>
								</table>
								<table>
									<tr>
										<td><input type="file" value="选择图片" style="background-image: url('../../../js/uploader/bdll.png');" name="uploadJhxd" id="uploadJhxd" /></td>
										<td><div id="fileQueue" ></div></td>
									</tr>
									<tr>
										<td rowspan="2">
											<img name="uploadFile" id="uploadFile" src="../../../js/uploader/upload.png" onclick="upload()"  style="border-width:0px;cursor: hand;" />
										</td>
									</tr>
								</table>
							</td>
						</tr> -->
					</table>
					<table width="98%" border="0"
						style="border-style: solid; border-width: 3px 1px 1px 1px; margin-top: 20px; border-color: #55BEEE #C0C0C0 #C0C0C0 #C0C0C0; height: 45px;"
						cellspacing="0" cellpadding="0">
						<tr style="height: 30px;">
							<td align="center">
							<td align="center">
								<img onclick="updataJhsh()" alt="保存" onmouseover="this.src='../../../images/Button/baocun2.gif'" onmouseout="this.src='../../../images/Button/baocun1.gif'"
									src="../../../images/Button/baocun1.gif">
								&nbsp; 
								<input type="image" name="btnCancel" id="btnCancel" onmouseover="this.src='../../../images/Button/fanhui2.GIF'" alt="返回"
								onclick="closeWindow('jhxd')" onmouseout="this.src='../../../images/Button/fanhui1.GIF'"
								src="../../../images/Button/fanhui1.GIF" style="border-width: 0px;" />
							</td>
						</tr>
					</table>
					</form>
				</td>
			</tr>
		</table>
	</center>
</body>
</html>