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
		$(function(){
			$('#xmbm').val(parent.YMLib.Var.xmbm);
			$.ajax({
				type:'post',
				url:'../../../qqgl/queryJhshxxByXmbm2.do',
				data:'jhsh.xmlx='+parent.YMLib.Var.xmlx+'&jhsh.xmbm='+parent.YMLib.Var.xmbm,
				dataType:'json',
				success:function(data){
					$('#jhxdFrom').form("load",data);
					$('#xmlx').val(parent.YMLib.Var.xmlx);
					$("#dfzcSpan").html(data.dfzc);
					$("#zddzjlSpan").html(data.zddzjl);
					$('#xdzt').val("1");
				}
			});
// 			fileShow(parent.YMLib.Var.xmbm,"计划下达文件");
// 			loadFileUpload();
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
					'jhsh.xmbm':parent.YMLib.Var.xmbm
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
			var result =true;
			result = validateText('ztz','number',result);
			result = validateText('zbzzj','number',result);
			result = validateText('sbzzj','number',result);
			result = validateText('xdwh',null,result);
			if(!result){
				return;
			}
				$('#jhxdFrom').ajaxSubmit({
					dataType:'json',
					success:function(msg){
						if(msg.result){
							alert("审核成功！");
							closeWindow("jhxd");
							parent.queryYhzx();
						}
					},
					error:function(msg){
						alert("计划审核失败！");
					}
				});
		}
		function changeDfzc(){
			var ztz=$("#ztz").val();
			var zbzzj=$("#zbzzj").val();
			var result=true;
			result = validateText('ztz','number',result);
			result = validateText('zbzzj','number',result);
			if(!result){return;}
			var dfzc=parseFloat(ztz)-parseFloat(zbzzj);
			$("#dfzcSpan").html(dfzc);
			$("#dfzc").val(dfzc);
		}
		
		function changeZddzjl(){
			var zbzzj=$("#zbzzj").val();
			var sbzzj=$("#sbzzj").val();
			var result=true;
			result = validateText('zbzzj','number',result);
			result = validateText('sbzzj','number',result);
			if(!result){return;}
			var zddzjl=parseFloat(zbzzj)-parseFloat(sbzzj);
			$("#zddzjl").val(zddzjl);
			$("#zddzjlSpan").html(zddzjl);
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
					<form id="jhxdFrom" action="../../../qqgl/updateJhshYhzx.do">
						<input id="xmbm" name="xmbm" type="hidden"/>
						<input id="xmlx" name="xmlx" value="4" type="hidden"/>
						<input id="xdzt" name="xdzt" value="1" type="hidden"/>
					<table width="98%" border="0" style="border-style: solid; border-width: 3px 1px 1px 1px; border-color: #55BEEE #C0C0C0 #C0C0C0 #C0C0C0; height: 45px;" cellspacing="0" cellpadding="0">
					<tr style="height: 30px;">
		            	<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
							计划开工时间</td>
						<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
							<input id="jhkgsj" name="jhkgsj" type="text" class="easyui-datebox" style="width: 124px;"/>
						</td>
						<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
							计划完工时间</td>
						<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
							<input id="jhwgsj" name="jhwgsj" type="text" class="easyui-datebox" style="width: 120px;"/>
						</td>
						<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
							总投资（万元）</td>
						<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
							<input id="ztz" name="ztz" type="text" style="width: 80px;"/>&nbsp;<span style="color: red;">*</span>
						</td>
		            </tr>
		            <tr style="height: 30px;">
		            	<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
							总补助资金（万元）</td>
						<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
							<input id="zbzzj" name="zbzzj" type="text" style="width: 80px;" onblur="changeDfzc()"/>&nbsp;<span style="color: red;">*</span>
						</td>
						<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
							省补助资金（万元）</td>
						<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
							<input id="sbzzj" name="sbzzj" type="text" style="width: 80px;" onblur="changeZddzjl()" />&nbsp;<span style="color: red;">*</span>
						</td>
						<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
							重点打造奖励（万元）</td>
						<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
							<span id="zddzjlSpan"></span>
							<input type="hidden" id="zddzjl" name="zddzjl"/>
						</td>
		            </tr>
		            <tr>
		            <td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
						地方自筹（万元）</td>
					<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						<span id="dfzcSpan"></span>
						<input type="hidden" id="dfzc" name="dfzc"/>
					</td>
					<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
						计划下达时间
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						<input id="xdsj" name="xdsj" type="text" class="easyui-datebox" style="width: 105px;height: 25px;" />
					</td>
					<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
						计划下达文号
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px; font-size: 12px;">
						<input id="xdwh" name="xdwh" type="text"  style="width: 100px;height: 20px;" />
					</td>
		            </tr>
<!-- 						<tr style="height: 30px;font-size: 10px;"> -->
<!-- 							<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;"> -->
<!-- 								<b><font color="#009ACD" style="cursor: hand; font-size: 12px">计划下达文件：</font></b> -->
<!-- 							</td> -->
<!-- 							<td colspan="5" style="border-left: 1px solid #C0C0C0;border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px; font-size: 12px;"> -->
<!-- 								<table style="margin-top:5px;background-color: #aacbf8; font-size: 12px" border="0" cellpadding="1" cellspacing="1"> -->
<!-- 									<tbody id="sjpfTable"></tbody> -->
<!-- 								</table> -->
<!-- 								<table> -->
<!-- 									<tr> -->
<!-- 										<td><input type="file" value="选择图片" style="background-image: url('../../../js/uploader/bdll.png');" name="uploadJhxd" id="uploadJhxd" /></td> -->
<!-- 										<td><div id="fileQueue" ></div></td> -->
<!-- 									</tr> -->
<!-- 									<tr> -->
<!-- 										<td rowspan="2"> -->
<!-- 											<img name="uploadFile" id="uploadFile" src="../../../js/uploader/upload.png" onclick="upload()"  style="border-width:0px;cursor: hand;" /> -->
<!-- 										</td> -->
<!-- 									</tr> -->
<!-- 								</table> -->
<!-- 							</td> -->
<!-- 						</tr> -->
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