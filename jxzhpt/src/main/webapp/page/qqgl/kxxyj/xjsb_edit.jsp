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
	var qdStr;
	var zdStr;
	function load(){
		var data=parent.obj;
		loadDist3("xzqh",data.xzqhdm,$.cookie("dist"));
		
		$("#xmmc").val(data.xmmc);
		$("#lxbh").val(data.lxbh);
		$("#lxmc").val(data.lxmc);
		$("#qdzh").val(data.qdzh);
		$("#zdzh").val(data.zdzh);
		$("#qdmc").val(data.qdmc);
		$("#zdmc").val(data.zdmc);
		$("#lc").val(data.lc);
		$("#xjlxbh").val(data.xjlxbm);
		$("#xjqdzh").val(data.xjqdzh);
		$("#xjzdzh").val(data.xjzdzh);
		$("#xjlc").val(data.xjlc);
		$('#yilc').val(data.yilc);
		$('#erlc').val(data.erlc);
		$('#sanlc').val(data.sanlc);
		$('#silc').val(data.silc);
		$('#dwlc').val(data.dwlc);
		$('#wllc').val(data.wllc);
		$("#jsxz").val(data.jsxz);
		$("#xzqh").html(data.xzqh);
		$("#jsjsdj").val(data.jsjsdj);
		$("#xmbm").html(data.xmbm);
		$("#dq").val(data.dq);
		$("#dq_m").val(data.dq_m);
		$("#sd").val(data.sd);
		$("#sd_m").val(data.sd_m);
		$("#jsdw").val(data.jsdw);
		$("#bzdw").val(data.bzdw);
		$("#tzgs").val(data.tzgs);
		$("#dfzc").val(data.dfzc);
		$("#yhdk").val(data.yhdk);
		
		$("#gkpfwh").val(data.gkpfwh);
		$("#kgny").datebox('setValue',data.kgny);
		$("#wgny").datebox('setValue',data.wgny);
		$("#pfsj").datebox('setValue',data.pfsj);
		fileShow(parent.obj.xmbm,"工可批复文件");
		
		
		$.ajax({
			type:'post',
			url:'../../../qqgl/queryKxxyjByXmbm.do',
			data:'xmlx='+3+'&xmbm='+data.xmbm,
			dataType:'json',
			success:function(msg){
				$('#kxxyj').form("load",msg);
				loadUnitedit("gydw",$.cookie("unit"),msg.gydwdm1);
				$("#gydw").combotree('setValues',msg.gydwdm1.split(","));
				//alert(msg.xzqhdm);
				loadDistedit("xzqh",$.cookie("dist"),msg.xzqhdm);
				$("#xzqh").combotree('setValues',msg.xzqhdm.split(","));
				
				var lc=parseFloat(msg.gpszdzh)-parseFloat(msg.gpsqdzh);
				qdStr=(parseFloat(msg.gpsqdzh)-lc*0.3).toFixed(3);
				zdStr=(parseFloat(msg.gpszdzh)+lc*0.3).toFixed(3);
				if(qdStr<0)
					qdStr=0;
				$("#qd").html("<font color='red' size='2'>*&nbsp;不能小于</font>"+"<font color='red' size='2'>"+qdStr);
				$("#zd").html("<font color='red' size='2'>*&nbsp;不能大于</font>"+"<font color='red' size='2'>"+zdStr);
				
				$('#ylxbh').val(msg.lxbm);
				$("#xmbm").html(msg.xmbm);
				$("#jsjsdj").html(msg.jsjsdj);
			}
		});
		
// 		var data1="ghlxbh="+data.lxbh+"&xzqh="+data.xzqhdm;
// 		$.ajax({
// 			type:'post',
// 			url:'/jxzhpt/qqgl/qqglGpsroad.do',
// 			data:data1,
// 			dataType:'json',
// 			success:function(msg){
// 				var item=msg[0];
// 				qdStr=parseFloat(item.qdzh);
// 				zdStr=parseFloat(item.zdzh);
// 				$("#qd").html("<font color='red' size='2'>*&nbsp;不能小于</font>"+"<font color='red' size='2'>"+item.qdzh);
// 				$("#zd").html("<font color='red' size='2'>*&nbsp;不能大于</font>"+"<font color='red' size='2'>"+item.zdzh);
// 			},
// 			error : function(){
// 			 YMLib.Tools.Show('未检索到补助标准错误！error code = 404',3000);
// 		 }
// 		});	
	}
	
	$(function(){
		
		xmny('kgny');
		xmny('wgny');
		xmsj('pfsj');
		load();
		loadFileUpload();
		$("#save_button").click(function(){
			if($("#xmmc").val()=="" || $("#xmmc").val()==null){
				alert("请填写项目名称！");
				$("#xmmc").focus();
				return false;
			}
			if($("#jsxz").val()=="" || $("#jsxz").val()==null){
				alert("请填写建设性质！");
				$("#jsxz").focus();
				return false;
			}
			if($("#zdzh").val()==null || $("#zdzh").val()=='' || isNaN($("#zdzh").val()) || parseFloat($("#zdzh").val())<0){
				alert("请填写正确的止点桩号！");
				$("#zdzh").focus();
				return false;
			}

			if(parseFloat($("#qdzh").val())*1000>parseFloat($("#zdzh").val())*1000){
				alert("对不起，起点桩号不能大于止点桩号！");
				$("#qdzh").focus();
				return false;
			}
			
			saveLxsh();
		});

	});
	
	function saveLxsh(){
		var sbthcd=$.cookie("unit2").length;
		if($.cookie("unit2")=="______36"){
			sbthcd=7;
		}
		var data="kxxyj.xmbm="+parent.obj.xmbm+"&kxxyj.xmmc="+$('#xmmc').val()+"&kxxyj.sbthcd="+sbthcd+"&kxxyj.tbbmbm="+$.cookie("unit")
		+"&kxxyj.qdzh="+$('#qdzh').val()+"&kxxyj.zdzh="+$('#zdzh').val()+"&kxxyj.jsxz="+$('#jsxz').val()
		+"&kxxyj.dq="+$('#dq').val()+"&kxxyj.dq_m="+$('#dq_m').val()+"&kxxyj.jsjsdj="+$('#jsjsdj').val()+"&kxxyj.xzqh="+$('#xzqh').combobox('getText')+"&kxxyj.xzqhdm="+$('#xzqh').combo("getValues").join(",")+"&kxxyj.gydw="+$("#gydw").combobox("getText")+"&kxxyj.gydwdm="+$("#gydw").combobox("getValues").join(',')
		+"&kxxyj.sd="+$('#sd').val()+"&kxxyj.sd_m="+$('#sd_m').val()+"&kxxyj.jsdw="
		+"&kxxyj.kgny="+$('#kgny').datebox('getValue')+"&kxxyj.wgny="+$('#wgny').datebox('getValue')+"&kxxyj.bzdw="+$('#bzdw').val()
		+"&kxxyj.tzgs="+$('#tzgs').val()+"&kxxyj.gkpfwh="+$('#gkpfwh').val()+"&kxxyj.pfsj="+$('#pfsj').datebox('getValue')
		+"&kxxyj.dfzc="+$('#dfzc').val()+"&kxxyj.yhdk="+$('#yhdk').val();
		data+="&lx.xjlxbm="+$('#xjlxbh').val()+"&lx.xjqdzh="+$('#xjqdzh').val()+"&lx.xjzdzh="+$('#xjzdzh').val();
		data+="&lx.yilc="+$('#yilc').val()+"&lx.erlc="+$('#erlc').val()+"&lx.sanlc="+$('#sanlc').val()+"&lx.silc="+$('#silc').val()
		+"&lx.dwlc="+$('#dwlc').val()+"&lx.wllc="+$('#wllc').val()+"&lx.lxmc="+$('#lxmc').val()+"&lx.qdmc="+$('#qdmc').val()
		+"&lx.zdmc="+$('#zdmc').val()+"&lx.xjlc="+$('#xjlc').val();
		//alert(data);
		$.ajax({
			type:'post',
			url:'/jxzhpt/qqgl/updateXjkxx.do',
	        data:data,
			dataType:'json',
			success:function(msg){
				if(Boolean(msg)){
					alert("保存成功！");
					parent.showAllxjsh();
					removes('lxxx');
				}else{
					alert('保存失败！');
				}
			}
		});
	}
	function changeZlc(){
		if(parseFloat($("#qdzh").val())>parseFloat(zdStr)){
			alert("起点桩号不能大于止点桩号");
			$("#qdzh").val(qdStr);
		}
		if(parseFloat($("#zdzh").val())<parseFloat(qdStr)){
			alert("止点桩号不能小于起点桩号");
			$("#zdzh").val(zdStr);
		}
		//selectTSDQ($("#lxbm").html(),$("#qdzh").val(),$("#zdzh").val());
	}
	
	
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
			'sizeLimit' : 100000000,
			'queueSizeLimit' : 5,
			'fileDesc' : '支持格式:xls',
			'fileExt' : '',
			'height' : 30,
			'width' : 92,
			'scriptData' : {
				'lxsh.xmbm':parent.obj.xmbm
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
		if($('#gkpfwh').val()==""){
			alert("请填写计划下达文号！");
			return;
		}else{
			$("#uploadGkpf").uploadifySettings('scriptData',{'kxxyj.xmbm':parent.obj.xmbm,'kxxyj.gkpfwh':$('#gkpfwh').val()});
			$('#uploadGkpf').uploadifyUpload();
		}
	}
</script>
<table style="width: 100%; background-color: #aacbf8; font-size: 12px"
			border="0" cellpadding="3" cellspacing="1">
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">项目名称：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input type="text" id="xmmc" style="width: 120px;"/></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">路线名称：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input id="lxmc" name="lxmc" type="text" style=" width: 120px;"/>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">路线编码</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input id="lxbh" type="text" style="width: 120px;" />
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">起点桩号：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input type="text" name="qdzh" id="qdzh" style="width: 120px;" onblur="changeZlc()"/><br/>
					<span id="qd"></span>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">止点桩号：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input type="text" name="zdzh"id="zdzh" style="width: 120px;" onblur="changeZlc()"/><br/>
					<span id="zd"></span>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">里程：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input id="lc" type="text" style="width: 120px;" />
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">起点名称：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input type="text" name="qdmc" id="qdmc" style="width: 120px;"/>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">止点名称：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input type="text" name="zdmc" id="zdmc" style="width: 120px;"/>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">新建路线编码</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input id="xjlxbh" type="text" style="width: 120px;" />
				</td>
			</tr>
			
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">新建起点桩号：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input type="text" name="xjqdzh" id="xjqdzh" style="width: 120px;" onblur="changeZlc()"/>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">新建止点桩号：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input type="text" name="xjzdzh" id="xjzdzh" style="width: 120px;" onblur="changeZlc()"/>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">新建里程：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input type="text" name="xjlc" id="xjlc" style="width: 120px;"/>
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					新建技术等<br/>级及里程
				</td>
				<td colspan="5" style="background-color: #ffffff; height: 20px;width:18%" align="left">
					一级公路：<input id="yilc" name="yilc" style="width: 50px;" type="text"/>
					二级公路：<input id="erlc" name="erlc" style="width: 50px;" type="text"/>
					三级公路：<input id="sanlc" name="sanlc" style="width: 50px;" type="text"/>
					四级公路：<input id="silc" name="silc" style="width: 50px;" type="text"/>
					等外公路：<input id="dwlc" name="dwlc" style="width: 50px;" type="text"/>
					无路：<input id="wllc" name="wllc" style="width: 50px;" type="text"/>
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">项目编码：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<span id="xmbm"></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">行政区划：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input type="text" id='xzqh' style="width: 120px;"/>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">建设技术等级：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input type="text" id='jsjsdj' name="jsjsdj" style="width: 120px;"/>
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">特大桥（米）：</td>
				<td style="background-color: #ffffff; height: 25px;" align="left">
					<input type="text" id="dq_m" style="width: 120px;" onblur="checkSZ(this)"/></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">特大桥（座）：</td>
				<td style="background-color: #ffffff; height: 25px;" align="left">
					<input type="text" id="dq" style="width: 120px;" onblur="checkSZ(this)"/></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">建设性质：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input type="text" id="jsxz" style="width: 120px;"/>
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">隧道（米）：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input type="text" id="sd_m" onblur="checkSZ(this)" style="width: 120px;"/></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">隧道（座）：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input type="text" id="sd" onblur="checkSZ(this)" style="width: 120px;"/></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">管养单位：</td>
				<td  style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input type="text" id="gydw" name="gydw" style="width: 120px;"/>
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">开工年月：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input type='text' id='kgny' style="width: 120px;"/>
					</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">完工年月：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input type='text' id='wgny' style="width: 120px;"/>
					</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">编制单位：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input type="text" id="bzdw" style="width: 120px;"/>
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">投资估算：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input type="text" id="tzgs" onblur="checkSZ(this)" style="width: 120px;"/></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">地方自筹：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input type="text" id="dfzc" style="width: 120px;"/></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">银行贷款：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input type="text" id="yhdk" style="width: 120px;"/>
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">工可批复文号：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input type="text" id="gkpfwh" style="width: 120px;"/>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">批复时间：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input type="text" id="pfsj" style="width: 120px;"/>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right"></td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left"></td>
			</tr>
			
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">工可批复文件：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left" colspan="5">
					<table style="margin-top:5px;background-color: #aacbf8; font-size: 12px" border="0" cellpadding="1" cellspacing="1">
							<tbody id="gkpfTable"></tbody>
						</table>
						<table>
							<tr>
								<td><input type="file" value="选择图片" style="background-image: url('../../../js/uploader/bdll.png');" name="uploadGkpf" id="uploadGkpf" /></td>
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
			<tr style="height: 35px;">
				<td colspan="6" style="background-color: #ffffff;"align="center">
				<a href="javascript:void(0)" id="save_button" class="easyui-linkbutton" plain="true" iconCls="icon-save">保存</a>
				<a href="# "  onclick="removes('lxxx')" class="easyui-linkbutton"  plain="true" iconCls="icon-cancel">取消</a></td>
			</tr>
			</table>
</body>
</html>