<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>安保工程添加</title>
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
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/other.js"></script>
	<script type="text/javascript">
		$(function(){
			loadBmbm2('jsjsdj','技术等级');
			$.ajax({
				type:'post',
				url:'../../../qqgl/queryCbsjByXmbm.do',
				data:'cbsj.xmlx='+2+'&cbsj.xmbm='+parent.YMLib.Var.xmbm,
				dataType:'json',
				success:function(data){
					/* $('#dq_cd').val("0");
					$('#dq_dk').val("0"); 
					$('#sd_sfcd').val("0");*/
					$('#jaf').val("0");
					$('#cbsj').form("load",data);
					$("#xmbm1").val(data.xmbm);
					$("#xmklx").val(data.xmklx);
					loadUnitedit("gydw1",$.cookie("unit"),data.gydwdm);
					$("#gydw1").combotree('setValues',data.gydwdm.split(","));
					//loadDist3("xzqh",msg.xzqhdm,$.cookie("dist"));
					loadDistedit("xzqh1",$.cookie("dist"),data.xzqhdm);
					$("#xzqh1").combotree('setValues',data.xzqhdm.split(","));
					
					/* var lc=parseFloat(data.gpszdzh)-parseFloat(data.gpsqdzh);
					var qdStr=(parseFloat(data.gpsqdzh)-lc*0.3).toFixed(3);
					var zdStr=(parseFloat(data.gpszdzh)+lc*0.3).toFixed(3);
					if(qdStr<0)
						qdStr=0;
					$('#span_qdzh').html(qdStr);
					$('#span_zdzh').html(zdStr); */
					var lc=Math.abs(accSub(parseFloat(data.gpszdzh),parseFloat(data.gpsqdzh)));
					if(parseFloat(data.gpsqdzh) < parseFloat(data.gpszdzh)){
						qdStr=(parseFloat(data.gpsqdzh)-lc*0.3).toFixed(3);
						if(qdStr<0){
							qdStr=0;
						}
						zdStr=(parseFloat(data.gpszdzh)+lc*0.3).toFixed(3);
					}else{
						qdStr=(parseFloat(data.gpsqdzh)+lc*0.3).toFixed(3);
						zdStr=(parseFloat(data.gpszdzh)-lc*0.3).toFixed(3);
						if(zdStr<0){
							zdStr=0;
						}
					}
					if(parseFloat(qdStr) > parseFloat(zdStr)){
						$("#span_qdzh").html("<font color='red' size='2'>*&nbsp;不能></font>"+"<font color='red' size='2'>"+qdStr);
						$("#span_zdzh").html("<font color='red' size='2'>*&nbsp;不能<</font>"+"<font color='red' size='2'>"+zdStr);
					}else{
						$("#span_qdzh").html("<font color='red' size='2'>*&nbsp;不能<</font>"+"<font color='red' size='2'>"+qdStr);
						$("#span_zdzh").html("<font color='red' size='2'>*&nbsp;不能></font>"+"<font color='red' size='2'>"+zdStr);
					}
					$('#jdbs').val(parent.YMLib.Var.jdbs);
					fileShow(parent.YMLib.Var.xmbm,"设计批复文件");
					$('#sfbj').val(1);
				}
			});
			loadFileUpload();
			autoCompleteLXBM();
			autoCompleteGHLXBM();
		});
		function autoCompleteLXBM(){
			var url = "/jxzhpt/qqgl/wnjhGpsroad.do";
			$("#ylxbh1").autocomplete(url, {
				multiple : false,
				minChars :4,
				multipleSeparator : ' ',
				mustMatch: true,
		  		cacheLength : 0,
		  		delay : 200,
		  		max : 150,
		  		extraParams : {
		  			lxbm:function() {
		  				var d = $("#ylxbh").val();
		  				return d;
		  			},
		  			xzqh:function() {
		  				var d = $.cookie("dist2");
		  				return d;
		  			}
		  		},
		  		dataType : 'json',// 返回类型
		  		// 对返回的json对象进行解析函数，函数返回一个数组
		  		parse : function(data) {
		  			var aa = [];
		  			aa = $.map(eval(data), function(row) {
		  					return {
		  						data : row,
		  						value : row.ghlxbh.replace(/(\s*$)/g,""),
		  						result : row.ghlxbh.replace(/(\s*$)/g,"")
		  					};
		  				});
		  			return aa;
		  		},
		  		formatItem : function(row, i, max) {
		  			return row.ghlxbh.replace(/(\s*$)/g,"")+"("+row.qdzh+","+row.zdzh+")"+"<br/>"+row.lxmc.replace(/(\s*$)/g,"");
		  		}
		  	}).result(
					function(e, item) {
						if(item==undefined) return ;
						$("#xzqh,#qdzh,#zdzh,#lc,#jsdj,#gydw,#span_qdzh,#span_zdzh").attr("value",'');
						xzqh=item.xzqh;
						$("#lxmc").val(item.lxmc);
						$("#qdzh").val(parseFloat(item.qdzh));
						$("#zdzh").val(parseFloat(item.zdzh));
						selectTSDQ(item.ghlxbm,item.ghqdzh,item.ghzdzh);
						$("#lc").val(Math.abs(accSub(parseFloat($("#ghzdzh").val()),parseFloat($("#ghqdzh").val()))));
						var lc=Math.abs(accSub(parseFloat(item.ghzdzh),parseFloat(item.ghqdzh)));
						//$("#jsjsdj").val(item.xjsdj);
						//$("#xjsdj").val(item.xjsdj);
						//$("#qdmc").val(item.qdmc);
						//$("#zdmc").val(item.zdmc);
						/* qdStr=parseFloat(item.qdzh);
						zdStr=parseFloat(item.zdzh); */
						if(parseFloat(item.qdzh) < parseFloat(item.zdzh)){
							qdStr=(parseFloat(item.qdzh)-lc*0.3).toFixed(3);
							if(qdStr<0){
								qdStr=0;
							}
							zdStr=(parseFloat(item.zdzh)+lc*0.3).toFixed(3);
						}else{
							qdStr=(parseFloat(item.qdzh)+lc*0.3).toFixed(3);
							zdStr=(parseFloat(item.zdzh)-lc*0.3).toFixed(3);
							if(zdStr<0){
								zdStr=0;
							}
						}
						if(parseFloat(qdStr) > parseFloat(zdStr)){
							$("#span_qdzh").html("<font color='red' size='2'>*&nbsp;不能></font>"+"<font color='red' size='2'>"+qdStr);
							$("#span_zdzh").html("<font color='red' size='2'>*&nbsp;不能<</font>"+"<font color='red' size='2'>"+zdStr);
						}else{
							$("#span_qdzh").html("<font color='red' size='2'>*&nbsp;不能<</font>"+"<font color='red' size='2'>"+qdStr);
							$("#span_zdzh").html("<font color='red' size='2'>*&nbsp;不能></font>"+"<font color='red' size='2'>"+zdStr);
						}
						$("#gpsqdzh").val(qdStr);
						$("#gpszdzh").val(zdStr);
						getghlxinfo(item.ghlxbh,item.qdzh,item.zdzh);
						cxqdmc($('#ghlxbm').val(),$('#ghqdzh').val());
						cxzdmc($('#ghlxbm').val(),$('#ghzdzh').val());
					});
		}
		
		function loadFileUpload(){
			$("#uploadSjpf").uploadify({
				/*注意前面需要书写path的代码*/
				'uploader' : '../../../js/uploader/uploadify.swf',
				'script' : '../../../qqgl/uploadSjpf.do',
				'cancelImg' : '../../../js/uploader/cancel.png',
				'queueID' : 'fileQueue',
				'fileDataName' : 'uploadSjpf',
				'auto' : false,
				'multi' : false,
				'buttonImg': '../../../js/uploader/bdll.png',
				'simUploadLimit' : 3,
				'sizeLimit' : 100000000,
				'queueSizeLimit' : 5,
				'fileDesc' : '支持格式:xls',
				'fileExt' : '',
				'height' : 30,
				'width' : 92,
				'scriptData' : {
					'cbsj.xmbm':parent.YMLib.Var.xmbm
				},
				onComplete : function(event, queueID, fileObj, response, data) {
					alert(response);
					fileShow(parent.YMLib.Var.xmbm,"设计批复文件");
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
		function uploadLmzj(){
			var submit=true;
			submit=validateText('qdzh','number',submit);
			submit=validateText('zdzh','number',submit);
			submit=validateText('lj','number',submit);
			submit=validateText('mc_lc','number',submit);
			submit=validateText('jc_lc','number',submit);
			submit=validateText('dc_lc','number',submit);
			/* submit=validateText('dq_cd','number',submit);
			submit=validateText('dq_dk','number',submit);
			submit=validateText('sd_sfcd','number',submit); */
			submit=validateText('jaf','number',submit);
			
			$("#gydw").val($("#gydw1").combobox('getText'));
			
			$("#gydwdm").val($("#gydw1").combobox('getValues').join(','));
			
			$("#xzqh").val($("#xzqh1").combobox('getText'));
			$("#xzqhdm").val($("#xzqh1").combobox('getValues').join(','));
			
			
			if(!submit){
				return;
			}
			if(zhuanghao()){
				
				$('#cbsj').ajaxSubmit({
					dataType:'json',
					success:function(msg){
						if(msg.result){
							alert("修改成功！");
							closeWindow("lmgzedit");
						}
					},
					error:function(msg){
						alert("修改失败！");
					}
				});
			}
		}
		function zhuanghao(){
			/* if(Number($('#qdzh').val())<Number($('#span_qdzh').html())){
				alert("起点桩号不能小于"+$('#span_qdzh').html());
				return false;
			}else if(Number($('#zdzh').val())>Number($('#span_zdzh').html())){
				alert("止点桩号不能大于"+$('#span_zdzh').html());
				return false;
			}else if(Number($("#zdzh"))<Number($('#qdzh').val())){
				alert("止点桩号不能小于起点桩号");
				return false;
			}else{
				return true;
			} */
			var redqdzh = $("#span_qdzh").text().substr(5,$("#span_qdzh").text().length);
			var redzdzh = $("#span_zdzh").text().substr(5,$("#span_zdzh").text().length);
			//alert(redqdzh+"  "+redzdzh);
			if(parseFloat(qdStr) < parseFloat(zdStr)){
				if(parseFloat($("#qdzh").val()) < parseFloat(redqdzh)){
					alert("原起点桩号不能小于"+redqdzh);
					return false;
				}
				if(parseFloat($("#zdzh").val()) > parseFloat(redzdzh)){
					alert("原止点桩号不能大于"+redzdzh);
					return false;
				}
			}else{
				if(parseFloat($("#qdzh").val()) > parseFloat(qdStr)){
					alert("原起点桩号不能大于"+redqdzh);
					return false;
				}
				if(parseFloat($("#zdzh").val()) < parseFloat(zdStr)){
					alert("原止点桩号不能小于"+redzdzh);
					return false;
				}
			} 
			return true;
		}
		function upload(){
			if($('#sjpfwh').val()==""){
				alert("请填写计划下达文号！");
				return;
			}else{
				$("#uploadSjpf").uploadifySettings('scriptData',{'cbsj.xmbm':parent.YMLib.Var.xmbm,'cbsj.sjpfwh':$('#sjpfwh').val()});
				$('#uploadSjpf').uploadifyUpload();
			}
		}
	</script>
</head>
<body style="font-size: 12px;">
	<div>
		<form id="cbsj" action="../../../qqgl/updateCbsj.do">
			<table width="97%" border="0" style="border-style: solid; border-width: 3px 1px 1px 1px;border-color: #55BEEE #C0C0C0 #C0C0C0 #C0C0C0; margin-left: 13px; height: 45px;" cellspacing="0" cellpadding="0">
				<tr style="height: 25px;">
					<td colspan="6" style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #55BEEE; font-weight: bold; font-size: small; text-align: left; background-color: #F1F8FF; width: 15%; padding-left: 10px;">
						路面改造工程项目 — 初步设计或施工图设计
					</td>
				</tr>
				<tr style="height: 30px;">
					<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					规划路线编码</td>
					<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<input id="ghlxbm" name="ghlxbm" type="text" style="width: 120px;"/>&nbsp;
					</td>
					<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					规划起点桩号</td>
					<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						<input id="ghqdzh" name="ghqdzh" onchange="querymcbygh()" type="text" style="width: 120px;"/>&nbsp;<br/>
					</td>
					<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					规划止点桩号</td>
					<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<input id="ghzdzh" name="ghzdzh" onchange="querymcbygh()" type="text" style="width: 120px;"/>&nbsp;<br/>
				</td>
            </tr>	
            <tr style="height: 30px;">
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
						原路线编码
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						<input readonly="readonly" id="ylxbh1" name="ylxbh" style="width: 120px;" type="text"/>
					</td>
					<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
						原起点桩号
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						<input readonly="readonly" id="qdzh" name="qdzh" onchange="querymc('qdzh')" style="width:120px;" type="text"/>
						<br/><span id="span_qdzh" style="font-size: small;color: red;"></span>
					</td>
					<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
						原讫点桩号
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						<input readonly="readonly" id="zdzh" name="zdzh" onchange="querymc('zdzh')" style="width: 120px;" type="text"/>
						<br/><span id="span_zdzh" style="font-size: small;color: red;"></span>
					</td>
					
				</tr>	
            <tr style="height: 30px;">
					<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					共线路线编码</td>
					<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<input id="gxlxbm" name="gxlxbm" type="text" style="width: 120px;" readonly="readonly" />&nbsp;
					
				</td>
					<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					共线起点桩号</td>
					<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<input id="gxqdzh" name="gxqdzh" type="text" style="width: 120px;" readonly="readonly"/>&nbsp;<br/>
				</td>
					<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					共线止点桩号</td>
					<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<input id="gxzdzh" name="gxzdzh" type="text" style="width: 120px;" readonly="readonly"/>&nbsp;<br/>
				</td>
            </tr>
				<tr style="height: 30px;">
					<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
						项目编码
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						<input id="xmbm1" name="xmbm1" style="width: 120px;" readonly="readonly" type="text"/>
						<input id="xmbm" name="xmbm" type="hidden"/>
						<input id="id" name="id" type="hidden">
						<input id="xmlx" name="xmlx" value="2" type="hidden"/>
						<input id="sfbj" name="sfbj" value="1" type="hidden"/>
						<!-- 此处ylxbh、qdmc、zdmc用于修改lxsh_lx中的信息 -->
						<input id="jdbs" name="jdbs" type="hidden"/>
						<input id="ylxbh" name="ghlxbh" type="hidden"/>
					</td>
					<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
						项目名称
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						<input id="xmmc" name="xmmc" style="width:120px;" type="text"/>
					</td>
					<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
						建设单位
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						<input id="jsdw" name="jsdw" style="width: 120px;" type="text"/>
					</td>
				</tr>
				<tr style="height: 30px;">
					<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
						行政区划
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						<input id="xzqh1" name="xzqh1" style="width:120px;" type="text"/>
						<input type="hidden" id='xzqh' name='xzqh'>
						<input type="hidden" id='xzqhdm' name="xzqhdm">
					</td>
					<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
						管养单位
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						<input id="gydw1" name="gydw1" style="width: 120px;" type="text"/>
						<input type="hidden" id='gydw' name='gydw'>
						<input type="hidden" id='gydwdm' name="gydwdm">
					</td>
					
					
					<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
						路基(m3)
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						<input id="lj" name="lj" style="width: 120px;" type="text"/>
					</td>
					
				</tr>
				
				<tr style="height: 30px;">
					<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
						里程
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						<input id="lc" name="lc" type="text" style="width: 120px;"/>
					</td>
					<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
						起点名称
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						<input id="qdmc" name="qdmc" type="text" style="width: 120px;"/>
					</td>
					<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
						止点名称
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						<input id="zdmc" name="zdmc" type="text" style="width: 120px;"/>
					</td>
				</tr>
				
				<tr style="height: 30px;">
					
					<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
						建设技术等级
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						<input id="jsjsdj" name="jsjsdj" style="width: 120px;" type="text"/>
					</td>
					<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
						建设性质
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						<input id="jsxz" name="jsxz" style="width: 120px;" type="text"/>
					</td>
					<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
						项目库类型
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						<input id="xmklx" name="xmlkx" style="width: 120px;background-color: #EDEDED;" readonly="readonly"/>
					</td>
					
					
				</tr>
				<tr style="height: 35px;">
					<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
						现技术等<br/>级及里程
					</td>
					<td colspan="5" style="border-left: 1px solid #C0C0C0;border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						一级公路：<input id="yilc" name="yilc" style="width: 50px;" type="text"/>
						二级公路：<input id="erlc" name="erlc" style="width: 50px;" type="text"/>
						三级公路：<input id="sanlc" name="sanlc" style="width: 50px;" type="text"/>
						四级公路：<input id="silc" name="silc" style="width: 50px;" type="text"/>
						等外公路：<input id="dwlc" name="dwlc" style="width: 50px;" type="text"/>
						无路：<input id="wllc" name="wllc" style="width: 50px;" type="text"/>
					</td>
				</tr>
				<tr style="height: 30px;">
					<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
						桥梁
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						<input id="ql" name="ql" style="width:40px;" type="text"/>座
						<input id="ql_ym" name="ql_ym" style="width:40px;" type="text"/>延米
					</td>
					<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
						涵洞
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						<input id="hd" name="hd" style="width: 40px;" type="text"/>座
						<input id="hd_m" name="hd_m" style="width: 40px;" type="text"/>米
					</td>
					<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
						隧道
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						<input id="sd" name="sd" style="width: 40px;" type="text"/>座
						<input id="sd_ym" name="sd_ym" style="width: 40px;" type="text"/>延米
					</td>
				</tr>
				<tr style="height: 30px;">
					<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
						面层类型
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						<input id="mc" name="mc" style="width: 120px;" type="text"/>
					</td>
					<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
						面层里程
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						<input id="mc_lc" name="mc_lc" style="width: 120px;" value="0" type="text"/>&nbsp;km
					</td>
					<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
						基层类型
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						<input id="jc" name="jc" style="width:120px;" type="text"/>
					</td>
				</tr>
				<tr style="height: 30px;">
					<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
						基层里程
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						<input id="jc_lc" name="jc_lc" style="width:120px;" value="0" type="text"/>&nbsp;km
					</td>
					<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
						垫层类型
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						<input id="dc" name="dc" style="width: 120px;" type="text"/>
					</td>
					<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
						垫层里程
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						<input id="dc_lc" name="dc_lc" style="width: 120px;" value="0" type="text"/>&nbsp;km
					</td>
				</tr>
				<!-- <tr style="height: 30px;">
					<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
						大桥名称
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						<input id="dq" name="dq" style="width:120px;" type="text"/>
					</td>
					<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
						大桥长度
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						<input id="dq_cd" name="dq_cd" style="width: 50px;margin-top: 5px;" value="0" type="text"/>米
					</td>
					<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
						大桥单跨
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						<input id="dq_dk" name="dq_dk" style="width:50px;" value="0" type="text"/>米
					</td>
				</tr> -->
				<!-- <tr style="height: 30px;">
					<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
						隧道名称
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						<input id="sdmc" name="sdmc" style="width: 120px;" type="text"/>
					</td>
					<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
						隧道双幅长度
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						<input id="sd_sfcd" name="sd_sfcd" style="width: 50px;margin-top: 5px;" value="0" type="text"/>米
					</td>
					<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
						隧道类型
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						<input id="sd_lx" name="sd_lx" style="width: 50px;" type="text"/>
					</td>
				</tr> -->
				
				<tr style="height: 30px;">
					<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
						设计单位
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						<input id="sjdw" name="sjdw" style="width:120px;" type="text"/>
					</td>
					<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
						设计批复文号
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						<input id="sjpfwh" name="sjpfwh" style="width: 120px;" type="text"/>
					</td>
					<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
						批复时间
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						<input id="pfsj" name="pfsj" style="width:120px;" class="easyui-datebox" type="text"/>
					</td>
				</tr>
				<tr style="height: 30px;">
					<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
						建安费（万元）
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						<input id="jaf" name="jaf" style="width:120px;" value="0" type="text"/>
					</td>
					<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
						地方自筹
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						<input id="dfzc" name="dfzc" type="text" style="width:120px;"/>
					</td>
					<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
						银行贷款
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						<input id="yhdk" name="yhdk" type="text" style="width:120px;"/>
					</td>
				</tr>
				<tr style="height: 30px;">
					
					<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
						工期（月）
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						<input id="gq" name="gq" style="width:120px;" type="text" onblur="checkSZ(this)"/>
					</td>
					
					<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
						设计概算(万元)
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						<input id="tz" name="tz" style="width:120px;" type="text"/>
					</td>
					
					<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
<!-- 						完工时间 -->
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
<!-- 						<input id="wgsj" name="wgsj" style="width: 125px;" class="easyui-datebox" type="text"/> -->
					</td>
				</tr>
				<tr style="height: 30px;">
					<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
						上传设计批复文件
					</td>
					<td colspan="5" style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						<table style="margin-top:5px;background-color: #aacbf8; font-size: 12px" border="0" cellpadding="1" cellspacing="1">
							<tbody id="sjpfTable"></tbody>
						</table>
						<table>
							<tr>
								<td><input type="file" value="选择图片" style="background-image: url('../../../js/uploader/bdll.png');" name="uploadSjpf" id="uploadSjpf" /></td>
								<td><div id="fileQueue" ></div></td>
							</tr>
							<tr>
								<td rowspan="2">
									<img name="uploadFile" id="uploadFile" src="../../../js/uploader/upload.png" onclick="upload()"  style="border-width:0px;cursor: hand;" />
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr style="height: 30px;text-align: center;">
					<td colspan="6" style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0;padding-left: 10px;">
						<img onclick="uploadLmzj()" alt="确定" style="text-align:center;" src="${pageContext.request.contextPath}/images/Button/qd1.gif" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/qd2.gif'" onmouseout="this.src='${pageContext.request.contextPath}/images/Button/qd1.gif' "/>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>