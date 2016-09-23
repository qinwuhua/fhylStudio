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
<script type="text/javascript" src="${pageContext.request.contextPath}/js/autocomplete/jquery.autocomplete.js" ></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/util/jquery.cookie.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/YMLib.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/page/qqgl/js/loadTJ.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/page/qqgl/lxsh/js/sjgz.js"></script>

<style type="text/css">
	TD {font-size: 12px;}
	a{text-decoration:none;}
</style>
</head>
<body>
<script type="text/javascript">
var qdStr;
var zdStr;
var xzqh;
	$(function(){
		loadUnitadd("gydw",$.cookie("unit"));
		loadDistadd("xzqh",$.cookie("dist"));
		$('#xmbm').html(parent.YMLib.Var.Obj.xmbm);
		autoCompleteLXBM();
		autoCompleteGHLXBM();
	});
	function autoCompleteLXBM(){
		var url = "/jxzhpt/qqgl/wnjhGpsroad.do";
		$("#ylxbh").autocomplete(url, {
			multiple : false,
			minChars :4,
			multipleSeparator : ' ',
			mustMatch: true,
	  		cacheLength : 0,
	  		delay : 200,
	  		max : 100,
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
					$("#xzqh,#qdzh,#zdzh,#lc,#jsdj,#gydw,#qd,#zd").attr("value",'');
					xzqh=item.xzqh;
					$("#lxmc").val(item.lxmc);
					$("#qdzh").val(parseFloat(item.qdzh));
					$("#zdzh").val(parseFloat(item.zdzh));
					selectTSDQ(item.ghlxbh,item.qdzh,item.zdzh);
					$("#lc").html(accSub(parseFloat($("#zdzh").val()),parseFloat($("#qdzh").val())));
					//$("#jsjsdj").val(item.xjsdj);
					//$("#xjsdj").val(item.xjsdj);
					//$("#qdmc").val(item.qdmc);
					//$("#zdmc").val(item.zdmc);
					qdStr=parseFloat(item.qdzh);
					zdStr=parseFloat(item.zdzh);
					$("#gpsqdzh").val(qdStr);
					$("#gpszdzh").val(zdStr);
					getghlxinfo(item.ghlxbh,item.qdzh,item.zdzh);
					if(parseFloat(item.qdzh)<parseFloat(item.zdzh)){
						$('#span_qdzh').html(">="+item.qdzh);
						$('#span_zdzh').html("<="+item.zdzh);
					}else{
						$('#span_qdzh').html("<="+item.qdzh);
						$('#span_zdzh').html(">="+item.zdzh);
					}
					
					//querymc('qdzh');
					//querymc('zdzh');
					//queryJsdjAndLc(item.ghlxbh,item.qdzh,item.zdzh);
					//getylxlminfo(item.ghlxbh,item.qdzh,item.zdzh);
// 					$("#qd").html("<font color='red' size='2'>*&nbsp;</font>"+"<font color='red' size='2'>"+item.qdzh);
// 					$("#zd").html("<font color='red' size='2'>*&nbsp;</font>"+"<font color='red' size='2'>"+item.zdzh);
					cxqdmc($('#ylxbh').val(),$('#qdzh').val());
					cxzdmc($('#ylxbh').val(),$('#zdzh').val());
					//getbzcs(item.ghlxbh.substr(0,1),item.xjsdj,accSub(parseFloat($("#zdzh").val()),parseFloat($("#qdzh").val())),'升级改造工程项目');
				});
	}

	function updateLx(){
		
		if($("#xzqh").combobox("getValues").join(',')==''){
			alert('请选择行政区划');
			return;
		}
	
		/*var params="lx.lxbm="+$('#lxbm').val()+"&lx.lxmc="+$('#lxmc').val()+"&lx.gydw="+$('#gydw').combotree("getText")
		+"&lx.gydwdm="+$('#gydw').combotree("getValue")+"&lx.xzqh="+$('#xzqh').combotree("getText")+"&lx.xzqhdm="+$('#xzqh').combotree("getValue")
		+"&lx.qdmc="+$('#qdmc').val()+"&lx.zdmc="+$('#zdmc').val()+"&lx.jsxz="+$('#jsxz').val()+"&lx.qdzh="+$('#qdzh').val()
		+"&lx.zdzh="+$('#zdzh').val()+"&lx.lc="+$('#lc').val()+"&lx.yilc="+$('#yilc').val()+"&lx.erlc="+$('#erlc').val()+"&lx.sanlc="+$('#sanlc').val()
		+"&lx.silc="+$('#silc').val()+"&lx.dwlc="+$('#dwlc').val()+"&lx.wllc="+$('#wllc').val()+"&lx.jhyilc="+$('#jhyilc').val()
		+"&lx.jherlc="+$('#jherlc').val()+"&lx.jhsanlc="+$('#jhsanlc').val()+"&lx.jhsilc="+$('#jhsilc').val()
		+"&lx.jhdwlc="+$('#jhdwlc').val()+"&lx.jhwllc="+$('#jhwllc').val()+"&lx.jsjsdj="+$('#jsjsdj').val()+"&lx.xjsdj="+$('#xjsdj').val()
		+"&lx.bzcs="+$('#bzcs').val()+"&lx.jdbs=0"+"&lx.xmid="+$('#xmbm').html();*/
		var data ="lxsh.xmbm="+$('#xmbm').html()+"&lxsh.xmid="+$('#xmbm').html()+"&lxsh.lxbm="+$('#ylxbh').val()+"&lxsh.ghlxbh="+$("#ylxbh").val()+"&lxsh.lxmc="+$("#lxmc").val()
		+"&lxsh.qdzh="+$("#qdzh").val()+"&lxsh.zdzh="+$("#zdzh").val()+"&lxsh.jhlc="+$("#jhlc").html()+"&lxsh.lc="+$("#lc").html()
		+"&lxsh.qdmc="+$("#qdmc").val()+"&lxsh.zdmc="+$("#zdmc").val()+"&lxsh.jsxz="+'改建'+"&lxsh.sffirst=0"+"&lxsh.jdbs=0"
		+"&lxsh.gydw="+$("#gydw").combobox("getText")
		+"&lxsh.xzqh="+$("#xzqh").combobox("getText")
		+"&lxsh.gydwdm="+$("#gydw").combobox("getValues").join(',')
		+"&lxsh.xzqhdm="+$("#xzqh").combobox("getValues").join(',')
		+"&lxsh.tsdq="+$("#tsdq").html()
		+"&lxsh.jsjsdj="+$("#jsjsdj").val()+"&lxsh.xjsdj="+$("#jsdj").val()+"&lxsh.xmnf="+$('#xmbm').html().substring(0,4)+"&lxsh.xmlx=sjgz"
		+"&lxsh.gpsqdzh="+qdStr+"&lxsh.gpszdzh="+zdStr;
		
		data+="&lxsh.yilc="+$('#yilc').val()+"&lxsh.erlc="+$('#erlc').val()+"&lxsh.sanlc="+$('#sanlc').val()+
		"&lxsh.silc="+$('#silc').val()+"&lxsh.dwlc="+$('#dwlc').val()+"&lxsh.wllc="+$('#wllc').val();
		
		data+="&lxsh.jhyilc="+$('#jhyilc').val()+"&lxsh.jherlc="+$('#jherlc').val()+"&lxsh.jhsanlc="+$('#jhsanlc').val()+
		"&lxsh.jhsilc="+$('#jhsilc').val()+"&lxsh.jhdwlc="+$('#jhdwlc').val()+"&lxsh.jhwllc="+$('#jhwllc').val()
		+"&lxsh.ghxlxmc="+$('#ghlxmc').val()+"&lxsh.ghxlxbm="+$('#ghlxbm').val()
		+"&lxsh.ghlxmc="+$('#ghlxmc').val()+"&lxsh.ghlxbm="+$('#ghlxbm').val()+"&lxsh.ghqdzh="+$('#ghqdzh').val()+"&lxsh.ghzdzh="+$('#ghzdzh').val()
		+"&lxsh.gxlxbm="+$('#gxlxbm').val()+"&lxsh.gxqdzh="+$('#gxqdzh').val()+"&lxsh.gxzdzh="+$('#gxzdzh').val()
		;
	//	alert(data);
		/* var params="lxsh.xmbm="+$('#xmbm').html()+"&lxsh.xmid="+$('#xmbm').html()+"&lxsh.lxbm="+$('#lxbm').val()+"&lxsh.ghlxbh="+$('#lxbm').val()+"&lxsh.lxmc="+$('#lxmc').val()+
			"&lxsh.xzqh="+$('#xzqh').combotree("getText")+"&lxsh.xzqhdm="+$('#xzqh').combotree("getValue")+
			"&lxsh.gydw="+$('#gydw').combotree("getText")+"&lxsh.gydwdm="+$('#gydw').combotree("getValue")+
			"&lxsh.qdzh="+$('#qdzh').val()+"&lxsh.zdzh="+$('#zdzh').val()+"&lxsh.jsjsdj="+$('#jsjsdj').val()+
			"&lxsh.lc="+$('#lc').val()+"&lxsh.xjsdj="+$('#xjsdj').val()+"&lxsh.jsxz="+$('#jsxz').val()+"&lxsh.qdmc="+$('#qdmc').val()+
			"&lxsh.zdmc="+$('#zdmc').val()+"&lxsh.bzys="+$('#bzcs').val()+"&lxsh.sffirst=0"+"&lxsh.jdbs=0"+"&lxsh.gpsqdzh="+$('#gpsqdzh').val()+
			"&lxsh.gpszdzh="+$('#gpszdzh').val()+"&lxsh.xmlx=sjgz"+"&lxsh.yilc="+$('#yilc').val()+"&lxsh.erlc="+$('#erlc').val()+
			"&lxsh.sanlc="+$('#sanlc').val()+"&lxsh.silc="+$('#silc').val()+"&lxsh.dwlc="+$('#dwlc').val()+"&lxsh.wllc="+$('#wllc').val()+
			"&lxsh.jhyilc="+$('#jhyilc').val()+"&lxsh.jherlc="+$('#jherlc').val()+"&lxsh.jhsanlc="+$('#jhsanlc').val()+"&lxsh.jhsilc="+$('#jhsilc').val()+
			"&lxsh.jhdwlc="+$('#jhdwlc').val()+"&lxsh.jhwllc="+$('#jhwllc').val(); */
		$.ajax({
			type:'post',
			url:'/jxzhpt/qqgl/insertLx1.do',
	        data:data,
			dataType:'json',
			success:function(msg){
				if(msg.result=="true"){
					alert("保存成功！");
					if(YMLib.Var.sq=="sq"){
						parent.showAll();
					}else{
						parent.showAllsjsh();
					}
					removes('lxxx');
				}else if(msg.result=="have"){
					alert("此路线已有项目！");
				}else{
					alert("保存失败！");
				}
			}
		});
	}
	function changeZlc(){
		/* if(parseFloat($("#qdzh").val())>parseFloat(zdStr)){
			alert("起点桩号不能大于止点桩号");
			$("#qdzh").val(qdStr);
		} */
		/* if(parseFloat($("#zdzh").val())<parseFloat(qdStr)){
			alert("止点桩号不能小于起点桩号");
			$("#zdzh").val(zdStr);
		} */
		var zlc=accSub(parseFloat($("#zdzh").val()),parseFloat($("#qdzh").val()));
		$("#lc").val(zlc);
		//getbzcs($("#lxbm").val().substr(0,1),$("#jsjsdj").combobox('getText'),$("#lc").html(),'升级改造工程项目');
		queryJsdjAndLc($('#lxbm').val(),$("#qdzh").val(),$("#zdzh").val());
		selectTSDQ($("#lxbm").val(),$("#qdzh").val(),$("#zdzh").val());
		if($("#qdzh").val()!='')
			cxqdmc($("#lxbm").val(),$("#qdzh").val());
		if($("#zdzh").val()!='')
			cxzdmc($("#lxbm").val(),$("#zdzh").val());
		cesuan();
	}
	function cesuan(){
		var yilc=0;var erlc=0;var sanlc=0;var silc=0;var wulc=0;var dwlc=0;
		if($('#jhyilc').val()!='')
			yilc=parseFloat($('#jhyilc').val());
		if($('#jherlc').val()!='')
			erlc=parseFloat($('#jherlc').val());
		if($('#jhsanlc').val()!='')
			sanlc=parseFloat($('#jhsanlc').val());
		if($('#jhsilc').val()!='')
			silc=parseFloat($('#jhsilc').val());
		if($('#jhwllc').val()!='')
			wllc=parseFloat($('#jhwllc').val());
		if($('#jhdwlc').val()!='')
			dwlc=parseFloat($('#jhdwlc').val());
		var hj1=accAdd(yilc,erlc);var hj2=accAdd(sanlc,silc);var hj3=accAdd(wulc,dwlc);
		var hj4=accAdd(hj1,hj2);var hj5=accAdd(hj3,hj4);
		$('#jhlc').html(hj5);
	}
</script>
	<form action="" id="lx">
	<table style="width: 100%; background-color: #aacbf8; font-size: 12px" border="0" cellpadding="3" cellspacing="1">
		
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					<font color='red' size='2'>*&nbsp;</font>原路线编码：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input id="gpsqdzh" name="gpsqdzh" type="hidden"/>
					<input id="gpszdzh" name="gpszdzh" type="hidden"/>
					<input type="text" name="ylxbh" id="ylxbh" style="width: 120px" /></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					<font color='red' size='2'>*&nbsp;</font>原路线名称：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input type="text" id='lxmc' style="width: 120px"/> 
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					<font color='red' size='2'>*&nbsp;</font>原起点桩号：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input type="text" name="qdzh" id="qdzh" style="width: 120px" onblur="changeZlc()"/><br/>
					<span id="span_qdzh" style="font-size: small;color: red;"></span>
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					<font color='red' size='2'>*&nbsp;</font>原止点桩号：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" name="zdzh" id="zdzh" style="width: 120px" onblur="changeZlc()"/><br/>
					<span id="span_zdzh" style="font-size: small;color: red;"></span>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					<font color='red' size='2'>*&nbsp;</font>起点名称：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input id="qdmc" name="qdmc" style="width: 120px;"/>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					<font color='red' size='2'>*&nbsp;</font>止点名称：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input id="zdmc" name="zdmc" style="width: 120px;"/>
				</td>
			</tr>
			 <tr style="height: 30px;">
            	<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					规划路线编号</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input id="ghlxbm" name="ghlxbm" type="text" style="width: 120px;"/>&nbsp;<span style="color: red;">*</span>
					
				</td>
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					规划起点桩号</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input id="ghqdzh" name="ghqdzh" onchange="querymcbygh()" type="text" style="width: 120px;"/>&nbsp;<span style="color: red;">*</span><br/>
				</td>
				<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					规划止点桩号</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input id="ghzdzh" name="ghzdzh" onchange="querymcbygh()" type="text" style="width: 120px;"/>&nbsp;<span style="color: red;">*</span><br/>
				</td>
            </tr>
            <tr style="height: 30px;">
            	<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					共线路线编号</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input id="gxlxbm" name="gxlxbm" type="text" style="width: 120px;" disabled="disabled"/>&nbsp;<span style="color: red;">*</span>
					
				</td>
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					共线起点桩号</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input id="gxqdzh" name="gxqdzh" type="text" style="width: 120px;" disabled="disabled"/>&nbsp;<span style="color: red;">*</span><br/>
				</td>
				<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					共线止点桩号</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input id="gxzdzh" name="gxzdzh" type="text" style="width: 120px;" disabled="disabled"/>&nbsp;<span style="color: red;">*</span><br/>
				</td>
            </tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					<font color='red' size='2'>*&nbsp;</font>规划路线名称：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input id="ghlxmc" name="ghlxmc" style="width: 120px;" />
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					<font color='red' size='2'>*&nbsp;</font>现状技术等级：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input id="jsdj" name="jsdj" style="width: 120px;" />
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					<font color='red' size='2'>*&nbsp;</font>建设技术等级：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input id="jsjsdj" name="jsjsdj" style="width: 120px;" />
				</td>
				
			</tr>
			<tr style="height: 35px;">
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					现技术等<br/>级及里程
				</td>
				<td colspan="5" style="background-color: #ffffff; height: 20px;width:18%" align="left">
					一级：<input onchange="jslc()" id="yilc" name="yilc" style="width: 50px;" type="text" value="0"/>
					二级：<input onchange="jslc()" id="erlc" name="erlc" style="width: 50px;" type="text" value="0"/>
					三级：<input onchange="jslc()" id="sanlc" name="sanlc" style="width: 50px;" type="text" value="0"/>
					四级：<input onchange="jslc()" id="silc" name="silc" style="width: 50px;" type="text" value="0"/>
					等外：<input onchange="jslc()" id="dwlc" name="dwlc" style="width: 50px;" type="text" value="0"/>
					无路：<input onchange="jslc()" id="wllc" name="wllc" style="width: 50px;" type="text" value="0"/>
					总计：<span id="lc" style="font-size: 14px">0</span>&nbsp;公里
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					建设技术<br/>等级及里程
				</td>
				<td colspan="5" style="background-color: #ffffff; height: 20px;width:18%" align="left">
					一级：<input id="jhyilc" onchange="cesuan()" name="jhyilc" style="width: 50px;" value="0" type="text"/>
					二级：<input id="jherlc" onchange="cesuan()" name="jherlc" style="width: 50px;" value="0" type="text"/>
					三级：<input id="jhsanlc" onchange="cesuan()" name="jhsanlc" style="width: 50px;" value="0" type="text"/>
					四级：<input id="jhsilc" onchange="cesuan()" name="jhsilc" style="width: 50px;" value="0" type="text"/>
					等外：<input id="jhdwlc" onchange="cesuan()" name="jhdwlc" style="width: 50px;" value="0" type="text"/>
					无路：<input id="jhwllc" onchange="cesuan()" name="jhwllc" style="width: 50px;" type="text" value="0"/>
					总计：<span id="jhlc" style="font-size: 14px">0</span>&nbsp;公里
				</td>
			</tr>

			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					<font color='red' size='2'>*&nbsp;</font>管养单位：</td>
				<td style="background-color: #ffffff; height: 25px;" align="left">
					<input type='text' id='gydw' style="width: 124px;"></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					<font color='red' size='2'>*&nbsp;</font>行政区划：</td>
				<td style="background-color: #ffffff; height: 25px;" align="left">
					<input type='text' id='xzqh' style="width: 124px;"></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right"><font color='red' size='2'>*&nbsp;</font>项目编码：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="xmbm"></span>
					<input id="id" name="id" type="hidden"/>
				</td>
			</tr>
			<tr style="height: 35px;">
				<td colspan="6" style="background-color: #ffffff;"align="center">
				
				<a href="javascript:void(0)" id="save_button" class="easyui-linkbutton" plain="true" iconCls="icon-save" onclick="updateLx()">保存</a>
				<a href="# "  onclick="removes('lxxx')" class="easyui-linkbutton"  plain="true" iconCls="icon-cancel">取消</a></td>
			</tr>
			</table>
	</table>
	</form>
</body>
</html>