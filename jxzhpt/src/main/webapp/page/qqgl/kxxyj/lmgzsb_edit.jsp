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
		$.ajax({
			type:'post',
			url:'../../../qqgl/queryKxxyjByXmbm.do',
			data:'xmlx='+2+'&xmbm='+data.xmbm,
			dataType:'json',
			success:function(msg){
				$('#kxxyj').form("load",msg);
				//var lc=parseFloat(msg.gpszdzh)-parseFloat(msg.gpsqdzh);
				var lc=Math.abs(accSub(parseFloat(msg.gpszdzh),parseFloat(msg.gpsqdzh)));
				qdStr=msg.gpsqdzh;
				zdStr=msg.gpszdzh;
				$("#span_qdzh").html("<font color='red' size='2'>*&nbsp;不能<</font>"+"<font color='red' size='2'>"+msg.gpsqdzh);
				$("#span_zdzh").html("<font color='red' size='2'>*&nbsp;不能></font>"+"<font color='red' size='2'>"+msg.gpszdzh);
				
				loadUnitedit("gydw",$.cookie("unit"),msg.gydwdm1);
				$("#gydw").combotree('setValues',msg.gydwdm1.split(","));
				//loadDist3("xzqh",msg.xzqhdm,$.cookie("dist"));
				loadDistedit("xzqh",$.cookie("dist"),msg.xzqhdm);
				$("#xzqh").combotree('setValues',msg.xzqhdm.split(","));
				
				$('#ylxbh').val(msg.lxbm);
				$("#xmbm").html(msg.xmbm);
				$("#jsjsdj").html(msg.jsjsdj);
				$('#xmklx').val(msg.xmklx);
				$('qdzh').val(msg.minqdzh);
				$('zdzh').val(mgs.maxzdzh);
			}
		});
		fileShow(parent.obj.xmbm,"工可批复文件");
		var data1="lxsh.ghlxbh="+data.lxbh+"&lxsh.xmbm="+data.xmbm;
		$.ajax({
			type:'post',
			url:'/jxzhpt/qqgl/qqglGpszh.do',
			data:data1,
			dataType:'json',
			success:function(msg){
							},
			error : function(){
			 YMLib.Tools.Show('未检索到补助标准错误！error code = 404',3000);
		 }
		});	
	}
	
	$(function(){
		xmny('kgny');
		xmny('wgny');
		xmsj('pfsj');
		xmsj('tgsj');
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
			var redqdzh = $("#span_qdzh").text().substr(5,$("#span_qdzh").text().length);
			var redzdzh = $("#span_zdzh").text().substr(5,$("#span_zdzh").text().length);
			//alert(redqdzh+"  "+redzdzh);
			 if(parseFloat($("#ghqdzh").val())*1000<redqdzh*1000){
				alert("对不起，起点桩号不能小于"+redqdzh+"！");
				$("#ghqdzh").focus();
				return false;
			}
			if(parseFloat($("#ghzdzh").val())*1000>redzdzh*1000){
				alert("对不起，止点桩号不能大于"+redzdzh+"！");
				$("#ghzdzh").focus();
				return false;
			} 
			 if(parseFloat($("#ghqdzh").val())*1000>parseFloat($("#ghzdzh").val())*1000){
				alert("对不起，起点桩号不能大于止点桩号！");
				$("#ghqdzh").focus();
				return false;
			} 
			
			saveLxsh();
		});
		autoCompleteGHLXBM();
	});
	
	function saveLxsh(){
		var sbthcd=$.cookie("unit2").length;
		if($.cookie("unit2")=="______36"){
			sbthcd=7;
		}
		//alert();
		var data="kxxyj.xmbm="+parent.obj.xmbm+"&kxxyj.xmmc="+$('#xmmc').val()+"&kxxyj.sbthcd="+sbthcd+"&kxxyj.tbbmbm="+$.cookie("unit")
		+"&kxxyj.qdzh="+$('#qdzh').val()+"&kxxyj.zdzh="+$('#zdzh').val()+"&kxxyj.jsxz="+$('#jsxz').val()
		+"&kxxyj.dq="+"&kxxyj.dq_m="+"&kxxyj.jsjsdj="+$('#jsjsdj').val()+"&kxxyj.xzqh="+$('#xzqh').combobox('getText')+"&kxxyj.xzqhdm="+$('#xzqh').combo("getValues").join(",")+"&kxxyj.gydw="+$("#gydw").combobox("getText")+"&kxxyj.gydwdm="+$("#gydw").combobox("getValues").join(',')
		+"&kxxyj.sd="+"&kxxyj.sd_m="+"&kxxyj.jsdw="
		+"&kxxyj.kgny="+$('#kgny').datebox('getValue')+"&kxxyj.wgny="+$('#wgny').datebox('getValue')+"&kxxyj.bzdw="+$('#bzdw').val()
		+"&kxxyj.tzgs="+$('#tzgs').val()+"&kxxyj.gkpfwh="+$('#gkpfwh').val()+"&kxxyj.pfsj="+$('#pfsj').datebox('getValue')+
		"&kxxyj.dfzc="+$('#dfzc').val()+"&kxxyj.yhdk="+$('#yhdk').val()+"&kxxyj.lxbh="+$('#ylxbh').val()+"&kxxyj.hyscyj="+$('#hyscyj').val()+"&kxxyj.tgsj="+$('#tgsj').datebox('getValue');
		
		data+="&lx.yilc="+$('#yilc').val()+"&lx.erlc="+$('#erlc').val()+"&lx.sanlc="+$('#sanlc').val()+"&lx.silc="+$('#silc').val()
		+"&lx.dwlc="+$('#dwlc').val()+"&lx.wllc="+$('#wllc').val()+"&lx.qdmc="+$('#qdmc').val()+"&lx.zdmc="+$('#zdmc').val()
		+"&kxxyj.ghlxmc="+$('#ghlxmc').val()+"&kxxyj.ghlxbm="+$('#ghlxbm').val()+"&kxxyj.ghqdzh="+$('#ghqdzh').val()+"&kxxyj.ghzdzh="+$('#ghzdzh').val()
		+"&kxxyj.gxlxbm="+$('#gxlxbm').val()+"&kxxyj.gxqdzh="+$('#gxqdzh').val()+"&kxxyj.gxzdzh="+$('#gxzdzh').val();
		
		//alert(data);
		if(confirm('您确定要更改当前数据？')){
		$.ajax({
			type:'post',
			url:'/jxzhpt/qqgl/updateLmgzkxx.do',
	        data:data,
			dataType:'json',
			success:function(msg){
				if(Boolean(msg)){
					alert("保存成功！");
					parent.showAlllmsh();
					removes('lxxx');
				}else{
					alert('保存失败！');
				}
			}
		});
	  }
	}
	function changeZlc(){
		/* if(parseFloat($("#qdzh").val())>parseFloat(zdStr)){
			alert("起点桩号不能大于止点桩号");
			$("#qdzh").val(qdStr);
		}
		if(parseFloat($("#zdzh").val())<parseFloat(qdStr)){
			alert("止点桩号不能小于起点桩号");
			$("#zdzh").val(zdStr);
		} */
		
		getghlxinfo($('#ylxbh').val(),$('#qdzh').val(),$('#zdzh').val());
		//queryJsdjAndLc($("#lxbh").val(),$("#qdzh").val(),$("#zdzh").val());
		//selectTSDQ($("#ylxbh").html(),$("#qdzh").val(),$("#zdzh").val());
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
			'fileExt' : '*.doc;*.docx;*.pdf;',
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
<form action="" id="kxxyj">
	<table style="width: 100%; background-color: #aacbf8; font-size: 12px"
			border="0" cellpadding="3" cellspacing="1">
			 <tr style="height: 25px;">
				<td colspan="6" style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #55BEEE; font-weight: bold; font-size: small; text-align: left; background-color: #F1F8FF; width: 15%; padding-left: 10px;">
					项目基本信息
				</td>
		    </tr>
			<tr style="height: 30px;">
            	<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					规划路线编码</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input id="ghlxbm" name="ghlxbm" type="text" style="width: 120px;"/>&nbsp;
				</td>
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					规划起点桩号</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input id="ghqdzh" name="ghqdzh" onchange="querymcbygh()" type="text" style="width: 120px;"/>&nbsp;<br/>
					<span id="span_qdzh"></span>
				</td>
				<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					规划止点桩号</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input id="ghzdzh" name="ghzdzh" onchange="querymcbygh()" type="text" style="width: 120px;"/>&nbsp;<br/>
					<span id="span_zdzh"></span>
				</td>
            </tr>
            <tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">原路线编码：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input readonly="readonly" id="ylxbh" name="lxbh" type="text" style="width: 120px;"/>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">原起点桩号：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input readonly="readonly" type="text" name="qdzh" id="qdzh"  onblur="changeZlc()" style="width: 120px;"/><br/>
					
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">原止点桩号：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input readonly="readonly" type="text" name="zdzh" id="zdzh" onblur="changeZlc()" style="width: 120px;"/><br/>
					
				</td>
			</tr>
            <tr style="height: 30px;">
            	<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					共线路线编码</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input id="gxlxbm" name="gxlxbm" type="text" style="width: 120px;" readonly="readonly"/>&nbsp;
					
				</td>
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					共线起点桩号</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input id="gxqdzh" name="gxqdzh" type="text" style="width: 120px;" readonly="readonly"/>&nbsp;<br/>
				</td>
				<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					共线止点桩号</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input id="gxzdzh" name="gxzdzh" type="text" style="width: 120px;" readonly="readonly"/>&nbsp;<br/>
				</td>
            </tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">项目名称：</td>
				<td colspan="3" style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input type="text" id="xmmc" name="xmmc" style="width: 405px;"/></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">项目编码：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<span id="xmbm"></span></td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">行政区划：</td>
				<td colspan="3" style="background-color: #ffffff; height: 20px;width:18%" align="left">
<!-- 					<span id="xzqh"></span> -->
					<input type="text" id='xzqh' name="xzqh" style="width: 410px;"/>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					<font color='red' size='2'>*&nbsp;</font>规划路线名称：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input id="ghlxmc" name="ghlxmc" style="width: 120px;" />
				</td>
			</tr>
			
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">原起点名称：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input id="qdmc" name="qdmc" type="text" style="width: 120px;"/>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">原止点名称：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input id="zdmc" name="zdmc" type="text" style="width: 120px;"/>
				</td>
                <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					项目库类型
				</td>
				<td colspan="5" style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input id="xmklx" name="xmlkx" style="width: 120px;background-color: #EDEDED;" readonly="readonly"/>
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					现技术等<br/>级及里程
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
			<tr style="height: 25px; margin -top:10px">
				<td colspan="6" style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #55BEEE; font-weight: bold; font-size: small; text-align: left; background-color: #F1F8FF; width: 15%; padding-left: 10px;">
					行业审查
				</td>
		    </tr>
		    <tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">行业审查意见：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
				<input type="text" id="hyscyj" name="hyscyj" style="width: 120px;"/></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">通过时间：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input type="text" id="tgsj" name="tgsj" style="width: 120px;"/>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right"></td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left"></td>
			</tr>
			<tr style="height: 25px; margin -top:10px">
				<td colspan="6" style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #55BEEE; font-weight: bold; font-size: small; text-align: left; background-color: #F1F8FF; width: 15%; padding-left: 10px;">
					工程可行性研究
				</td>
		    </tr>	
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">建设性质：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input type="text" id="jsxz" name="jsxz" style="width: 120px;"/>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">建设技术等级：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input type="text" id="jsjsdj" name="jsjsdj" style="width: 120px;"/>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">开工年月：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input type='text' id='kgny' name="kgny" style="width: 120px;"/>
					</td>
			</tr>
			 <tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">管养单位：</td>
				<td colspan="3" style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input type="text" id="gydw" name="gydw" style="width: 408px;"/>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">完工年月：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input type='text' id='wgny' name="wgny" style="width: 120px;"/>
					</td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">工可批复文号：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
				<input type="text" id="gkpfwh" name="gkpfwh" style="width: 120px;"/></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">批复时间：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input type="text" id="pfsj" name="pfsj" style="width: 120px;"/>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">编制单位：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input type="text" id="bzdw" name="bzdw" style="width: 120px;"/>
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">投资估算：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input type="text" id="tzgs" name="tzgs" onblur="checkSZ(this)" style="width: 120px;"/></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">地方自筹：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input type="text" id="dfzc" name="dfzc" style="width: 120px;"/></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">银行贷款：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input type="text" id="yhdk" name="yhdk" style="width: 120px;"/>
				</td>
			</tr>
			
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">批复文件：</td>
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
</form>
</body>
</html>