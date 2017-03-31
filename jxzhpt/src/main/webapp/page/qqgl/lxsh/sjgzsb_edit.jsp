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
<script type="text/javascript" src="${pageContext.request.contextPath}/js/autocomplete/jquery.autocomplete.js" ></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/util/jquery.cookie.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/YMLib.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/page/qqgl/js/loadTJ.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/page/qqgl/lxsh/js/sjgz.js"></script>

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
			url:'../../../qqgl/queryLxshByXmbm.do',
			data:'jhsh.xmlx='+1+'&jhsh.xmbm='+data.xmbm,
			dataType:'json',
			success:function(msg){
				$('#lc').val(msg.lc);
				$('#lxsh').form("load",msg);
				
				$("#sfbflx").combobox('setValue',msg.sfbflx);
				$('#bzcs').val(msg.bzys);
				$("#dfzc").html(msg.dfzc);
				$("#lxmc").html(msg.lxmc);
				$("#ylxbh").val(msg.ghlxbh);
				loadUnitedit("gydw",$.cookie("unit"),msg.gydwdm);
				$("#gydw").combotree('setValues',msg.gydwdm.split(","));
				loadDistedit("xzqh",$.cookie("dist"),msg.xzqhdm2);
				$("#xzqh").combotree('setValues',msg.xzqhdm2.split(","));
				$("#tsdq").html(msg.tsdq);
				$("#xjsdj").val(msg.xjsdj);
				$("#xmbm").html(msg.xmbm);
				$("#xmnf").combobox("setValue",msg.xmnf);
				$("#jhkgn").combobox("setValue",msg.jhkgn);
				$("#jhwgn").combobox("setValue",msg.jhwgn);
				$("#xmklx").val(msg.xmklx);
				
				
				
				$("#yilc").val(msg.yilc);
				$("#erlc").val(msg.erlc);
				$("#sanlc").val(msg.sanlc);
				$("#silc").val(msg.silc);
				$("#dwlc").val(msg.dwlc);
				$("#wllc").val(msg.wllc);
				$("#jhyilc").val(msg.jhyilc);
				$("#jherlc").val(msg.jherlc);
				$("#jhsanlc").val(msg.jhsanlc);
				$("#jhsilc").val(msg.jhsilc);
				$("#jhdwlc").val(msg.jhdwlc);
				$("#jhwllc").val(msg.jhwllc);
				var yilc=0;var erlc=0;var sanlc=0;var silc=0;var wulc=0;var dwlc=0;
				var jhyilc=0;var jherlc=0;var jhsanlc=0;var jhsilc=0;var jhwulc=0;var jhdwlc=0;
				if($('#jhyilc').val()!='')
					jhyilc=parseFloat($('#jhyilc').val());
				if($('#jherlc').val()!='')
					jherlc=parseFloat($('#jherlc').val());
				if($('#jhsanlc').val()!='')
					jhsanlc=parseFloat($('#jhsanlc').val());
				if($('#jhsilc').val()!='')
					jhsilc=parseFloat($('#jhsilc').val());
				if($('#jhwllc').val()!='')
					jhwulc=parseFloat($('#jhwllc').val());
				if($('#jhdwlc').val()!='')
					jhdwlc=parseFloat($('#jhdwlc').val());
				var hj1=accAdd(jhyilc,jherlc);var hj2=accAdd(jhsanlc,jhsilc);var hj3=accAdd(jhwulc,jhdwlc);
				var hj4=accAdd(hj1,hj2);var hj5=accAdd(hj3,hj4);
				$('#jszlc').val(hj5);
				
				if($('#yilc').val()!='')
					yilc=parseFloat($('#yilc').val());
				if($('#erlc').val()!='')
					erlc=parseFloat($('#erlc').val());
				if($('#sanlc').val()!='')
					sanlc=parseFloat($('#sanlc').val());
				if($('#silc').val()!='')
					silc=parseFloat($('#silc').val());
				if($('#wllc').val()!='')
					wulc=parseFloat($('#wllc').val());
				if($('#dwlc').val()!='')
					dwlc=parseFloat($('#dwlc').val());
				var hj11=accAdd(yilc,erlc);var hj21=accAdd(sanlc,silc);var hj31=accAdd(wulc,dwlc);
				var hj41=accAdd(hj11,hj21);var hj51=accAdd(hj31,hj41);
				$('#lc').val(hj51);
			}
		});
		
		var data1="lxsh.ghlxbh="+data.ghlxbh+"&lxsh.xmbm="+data.xmbm;
		$.ajax({
			type:'post',
			url:'/jxzhpt/qqgl/qqglGpszh.do',
			data:data1,
			dataType:'json',
			success:function(item){
				if(parseFloat(item.qdzh) < parseFloat(item.zdzh)){
					qdStr=accSub(parseFloat(item.qdzh),5);
					if(qdStr<0){
						qdStr=0;
					}
					zdStr=accAdd(parseFloat(item.zdzh),5);
				}else{
					qdStr=accAdd(parseFloat(item.qdzh),5);
					zdStr=accSub(parseFloat(item.zdzh),5);
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
				
			},
			error : function(){
			 YMLib.Tools.Show('未检索到补助标准错误！error code = 404',3000);
		 }
		});	
	}

	$(function(){
		xmnf1("xmnf",'1');
		xmnf2("jhkgn");
		xmnf2("jhwgn");
		load();
		/*$('#jsjsdj').combobox({
		    onSelect:function(rec){
		    	getbzcs($("#ylxbh").html().substr(0,1),$("#jsjsdj").combobox('getText'),$("#lc").html(),'升级改造工程项目');
		    }
		});*/
		$("#save_button").click(function(){
			
			/* if($("#xmmc").val()=="" || $("#xmmc").val()==null){
				alert("请填写项目名称！");
				$("#xmmc").focus();
				return false;
			}
			if($("#qdmc").val()=="" || $("#qdmc").val()==null){
				alert("请填写起点名称！");
				return false;
			}
			if($("#zdmc").val()=="" || $("#zdmc").val()==null){
				alert("请填写止点名称！");
				return false;
			}
			if($("#jsxz").val()=="" || $("#jsxz").val()==null){
				alert("请填写建设性质！");
				$("#jsxz").focus();
				return false;
			}
			if($("#tz").val()=="" || $("#tz").val()==null){
				alert("请填写投资！");
				$("#tz").focus();
				return false;
			}
			if($("#dfzc").html()=="" || $("#dfzc").html()==null){
				alert("请填写地方自筹！");
				return false;
			}
			if($("#bzcs").val()=="" || $("#bzcs").val()==null){
				alert("未能正确计算出补助测算");
				return false;
			}
			if($("#qdzh").val()==null || $("#qdzh").val()=='' || isNaN($("#qdzh").val()) || parseFloat($("#qdzh").val())<0){
				alert("请填写正确的起点桩号！");
				$("#qdzh").focus();
				return false;
			}
			if($("#zdzh").val()==null || $("#zdzh").val()=='' || isNaN($("#zdzh").val()) || parseFloat($("#zdzh").val())<0){
				alert("请填写正确的止点桩号！");
				$("#zdzh").focus();
				return false;
			}
			if(parseFloat($("#qdzh").val())*1000<qdStr*1000){
				alert("对不起，起点桩号不能小于"+qdStr+"！");
				$("#qdzh").focus();
				return false;
			}
			if(parseFloat($("#zdzh").val())*1000>zdStr*1000){
				alert("对不起，止点桩号不能大于"+zdStr+"！");
				$("#zdzh").focus();
				return false;
			} */
			/* if(parseFloat($("#qdzh").val())*1000>parseFloat($("#zdzh").val())*1000){
				alert("对不起，起点桩号不能大于止点桩号！");
				$("#qdzh").focus();
				return false;
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
			var zlc=$("#jszlc").val();
			/* if(parseFloat(zlc)>(parseFloat($('#lc').val())*1.2)){
				alert("对不起，建设技术等级里程不能大于现状里程的120%");
				return false;
			}  */
			saveLxsh();
		});
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
					$("#lc").html(accSub(parseFloat($("#zdzh").val()),parseFloat($("#qdzh").val())));
					//$("#jsjsdj").val(item.xjsdj);
					//$("#xjsdj").val(item.xjsdj);
					//$("#qdmc").val(item.qdmc);
					//$("#zdmc").val(item.zdmc);
					/* qdStr=parseFloat(item.qdzh);
					zdStr=parseFloat(item.zdzh); */
					$("#gpsqdzh").val(qdStr);
					$("#gpszdzh").val(zdStr);
					getghlxinfo(item.ghlxbh,item.qdzh,item.zdzh);
					getylxlminfo(item.ghlxbh,item.qdzh,item.zdzh);
					/* if(parseFloat(item.qdzh)<parseFloat(item.zdzh)){
						$('#qd').html(">="+item.qdzh);
						$('#zd').html("<="+item.zdzh);
					}else{
						$('#qd').html("<="+item.qdzh);
						$('#zd').html(">="+item.zdzh);
					} */
					
					if(parseFloat(item.qdzh) < parseFloat(item.zdzh)){
						qdStr=accSub(parseFloat(item.qdzh),5);
						if(qdStr<0){
							qdStr=0;
						}
						zdStr=accAdd(parseFloat(item.zdzh),5);
					}else{
						qdStr=accAdd(parseFloat(item.qdzh),5);
						zdStr=accSub(parseFloat(item.zdzh),5);
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
					
					//getghlxinfo($('#ylxbh').val(),$('#qdzh').val(),$('#zdzh').val());
					//querymc('qdzh');
					//querymc('zdzh');
					//queryJsdjAndLc(item.ghlxbh,item.qdzh,item.zdzh);
					//getylxlminfo(item.ghlxbh,item.qdzh,item.zdzh);
// 					$("#qd").html("<font color='red' size='2'>*&nbsp;</font>"+"<font color='red' size='2'>"+item.qdzh);
// 					$("#zd").html("<font color='red' size='2'>*&nbsp;</font>"+"<font color='red' size='2'>"+item.zdzh);
					cxqdmc($('#ghlxbm').val(),$('#ghqdzh').val());
					cxzdmc($('#ghlxbm').val(),$('#ghzdzh').val());
					//getbzcs(item.ghlxbh.substr(0,1),item.xjsdj,accSub(parseFloat($("#zdzh").val()),parseFloat($("#qdzh").val())),'升级改造工程项目');
				});
	}
	function saveLxsh(){
		$("#dfzc").html('');
		var tz=0;var bzcs=0;
		if($("#tz").val()!='')
			tz=parseFloat($("#tz").val());
		if($("#bzcs").val()!='')
			bzcs=parseFloat($("#bzcs").val());
		if(bzcs>tz){
			alert("投资不能小于补助测算");
			return
		}
		var sbthcd=$.cookie("unit2").length;
		if($.cookie("unit2")=="______36"){
			sbthcd=7;
		}
		var data ="lxsh.xmmc="+$("#xmmc").val()+"&lxsh.ghlxbh="+$("#ylxbh").val()+"&lxsh.xmbm="+$("#xmbm").html()
		+"&lxsh.qdzh="+$("#qdzh").val()+"&lxsh.zdzh="+$("#zdzh").val()+"&lxsh.lc="+$("#lc").val()
		+"&lxsh.qdmc="+$("#qdmc").val()+"&lxsh.zdmc="+$("#zdmc").val()+"&lxsh.jsxz="+$("#jsxz").val()
		+"&lxsh.gydw="+$("#gydw").combobox("getText")+"&lxsh.xzqh="+$("#xzqh").combobox("getText")+"&lxsh.gydwdm="+$("#gydw").combobox("getValues").join(',')+"&lxsh.xzqhdm="+$("#xmbm").html().substr(4,6)+"&lxsh.xzqhdm2="+$('#xzqh').combo("getValues").join(",")+"&lxsh.tsdq="+$("#tsdq").html()
		+"&lxsh.jsjsdj="+$("#jsjsdj").val()+"&lxsh.xjsdj="+$("#xjsdj").val()
		+"&lxsh.jhkgn="+$("#jhkgn").combobox('getText')+"&lxsh.jhwgn="+$("#jhwgn").combobox('getText')
		+"&lxsh.tz="+$("#tz").val()+"&lxsh.bzys="+$("#bzcs").val()+"&lxsh.dfzc="+$("#dfzc").html()+"&lxsh.jdbs=0";
		data+="&lx.yilc="+$('#yilc').val()+"&lx.erlc="+$('#erlc').val()+"&lx.sanlc="+$('#sanlc').val()+"&lx.silc="+$('#silc').val()+
			"&lx.dwlc="+$('#dwlc').val()+"&lx.wllc="+$('#wllc').val();
		data+="&lx.jhyilc="+$('#jhyilc').val()+"&lx.jherlc="+$('#jherlc').val()+"&lx.jhsanlc="+$('#jhsanlc').val()+
		"&lx.jhsilc="+$('#jhsilc').val()+"&lx.jhdwlc="+$('#jhdwlc').val()+"&lx.jhwllc="+$('#jhwllc').val()+
		"&lxsh.yhdk="+$('#yhdk').val()+"&lxsh.bz="+$('#bz').val()+"&lxsh.jszlc="+$('#jszlc').val()
		+"&lxsh.ghlxmc="+$('#ghlxmc').val()+"&lxsh.ghlxbm="+$('#ghlxbm').val()+"&lxsh.ghqdzh="+$('#ghqdzh').val()+"&lxsh.ghzdzh="+$('#ghzdzh').val()
		+"&lxsh.gxlxbm="+$('#gxlxbm').val()+"&lxsh.gxqdzh="+$('#gxqdzh').val()+"&lxsh.gxzdzh="+$('#gxzdzh').val()+"&lxsh.xmnf="+$('#xmnf').combobox("getValues")
		+"&lxsh.sfbflx="+$('#sfbflx').combobox('getValue')+'&lxsh.wnid='+parent.obj.wnid+'&lxsh.xmbm1='+parent.obj.xmbm;
		$.ajax({
			type:'post',
			url:'/jxzhpt/qqgl/updateSjgz.do',
	        data:data,
			dataType:'json',
			success:function(msg){
				if(Boolean(msg)){
					alert("保存成功！");
					parent.$('#datagrid').datagrid("reload");
					removes('lxxx');
				}else{
					alert('保存失败！');
				}
			}
		});
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
		var zlcs=accSub(parseFloat($("#zdzh").val()),parseFloat($("#qdzh").val()));var zlc=Math.abs(zlcs);
		getghlxinfo($('#ylxbh').val(),$('#qdzh').val(),$('#zdzh').val());
		getylxlminfo($('#ghlxbm').val(),$('#ghqdzh').val(),$('#ghzdzh').val());
		//$("#lc").val(zlc);
		//queryJsdjAndLc($("#ghlxbm").val(),$("#ghqdzh").val(),$("#ghzdzh").val());
		selectTSDQ($("#ghlxbm").val(),$("#ghqdzh").val(),$("#ghzdzh").val());
		//getbzcs($("#ylxbh").html().substr(0,1),$("#jsjsdj").val(),$("#lc").html(),'升级改造工程项目');
		if($("#ghqdzh").val()!='')
			cxqdmc($("#ghlxbm").val(),$("#ghqdzh").val());
		if($("#ghzdzh").val()!='')
			cxzdmc($("#ghlxbm").val(),$("#ghzdzh").val());
	}
</script>
<form action="" id="lxsh">
	<table style="width: 100%; background-color: #aacbf8; font-size: 12px" border="0" cellpadding="3" cellspacing="1">
			<tr style="height: 30px;">
            	<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					规划路线编号</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input id="ghlxbm" name="ghlxbm" type="text" style="width: 120px;"/>&nbsp;
				</td>
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					规划起点桩号</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input id="ghqdzh" name="ghqdzh" onchange="querymcbygh()" type="text" style="width: 120px;"/>&nbsp;<br/>
				</td>
				<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					规划止点桩号</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input id="ghzdzh" name="ghzdzh" onchange="querymcbygh()" type="text" style="width: 120px;"/>&nbsp;<br/>
				</td>
            </tr>
            <tr style="height: 30px;">
            	<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					共线路线编号</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input id="gxlxbm" name="gxlxbm" type="text" style="width: 120px;" disabled="disabled"/>&nbsp;
					
				</td>
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					共线起点桩号</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input id="gxqdzh" name="gxqdzh" type="text" style="width: 120px;" disabled="disabled"/>&nbsp;<br/>
				</td>
				<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					共线止点桩号</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input id="gxzdzh" name="gxzdzh" type="text" style="width: 120px;" disabled="disabled"/>&nbsp;<br/>
				</td>
            </tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					<font color='red' size='2'>*&nbsp;</font>原路线编码：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input type="text" name="ylxbh" id="ylxbh" style="width: 120px" /></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					<font color='red' size='2'>*&nbsp;</font>原路线名称：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<span id="lxmc"></span>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					<font color='red' size='2'>*&nbsp;</font>原起点桩号：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input type="text" name="qdzh" id="qdzh" style="width: 120px" onblur="changeZlc()"/><br/>
					<span id="span_qdzh"></span>
				</td>
			</tr>
			
			
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					<font color='red' size='2'>*&nbsp;</font>原止点桩号：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" name="zdzh" id="zdzh" style="width: 120px" onblur="changeZlc()"/><br/>
					<span id="span_zdzh"></span>
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
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					<font color='red' size='2'>*&nbsp;</font>现状技术等级：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input id="xjsdj" name="xjsdj" style="width: 120px;" />
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					<font color='red' size='2'>*&nbsp;</font>建设技术等级：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input id="jsjsdj" name="jsjsdj" style="width: 120px;" />
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					<font color='red' size='2'>*&nbsp;</font>规划路线名称：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input id="ghlxmc" name="ghlxmc" style="width: 120px;" />
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">是否部分立项</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<select id='sfbflx' class="easyui-combobox" style="width: 120px;">
						<option value="否" selected="selected">否</option>
						<option value="是">是</option>
					</select>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">项目库类型</td>
				<td colspan="3" style="background-color: #ffffff; height: 20px;" align="left">
					<input id="xmklx" name="xmlkx" style="width: 120px;background-color: #EDEDED;" readonly="readonly"/>
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					现技术等<br/>级及里程
				</td>
				<td colspan="5" style="background-color: #ffffff; height: 20px;width:18%" align="left">
					一级：<input id="yilc" onchange="jsyzlc()" name="yilc" style="width: 50px;" type="text"/>
					二级：<input id="erlc" onchange="jsyzlc()" name="erlc" style="width: 50px;" type="text"/>
					三级：<input id="sanlc" onchange="jsyzlc()" name="sanlc" style="width: 50px;" type="text"/>
					四级：<input id="silc" onchange="jsyzlc()" name="silc" style="width: 50px;" type="text"/>
					等外：<input id="dwlc" onchange="jsyzlc()" name="dwlc" style="width: 50px;" type="text"/>
					无路：<input id="wllc" onchange="jsyzlc()" name="wllc" style="width: 50px;" type="text"/>
					总计：<input id="lc" name="lc" style="width: 50px;" readonly="readonly" type="text" value="0"/>
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
					总计：<input id="jszlc" name="jszlc" style="width: 50px;" readonly="readonly" type="text" value="0"/>
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					<font color='red' size='2'>*&nbsp;</font>项目编码：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="xmbm"></span>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					<font color='red' size='2'>*&nbsp;</font>项目名称：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" id="xmmc" name="xmmc" style="width: 120px"/>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					<font color='red' size='2'>*&nbsp;</font>建设性质：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" id="jsxz" name="jsxz" style="width: 120px" value='升级改造'/></td>
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
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">特殊地区：</td>
				<td style="background-color: #ffffff; height: 25px;" align="left">
					<span id="tsdq" style="font-size: 14px"></span></td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					<font color='red' size='2'>*&nbsp;</font>项目年份：
				</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<select id="xmnf" style="width:124px" class="easyui-combobox" data-options="panelHeight:'100'"></select>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					<font color='red' size='2'>*&nbsp;</font>计划开工年：
				</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<select id="jhkgn" style="width:124px"class="easyui-combobox" data-options="panelHeight:'100'"></select>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					<font color='red' size='2'>*&nbsp;</font>计划完工年：
				</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<select id="jhwgn" style="width:124px"class="easyui-combobox" data-options="panelHeight:'100'"></select>
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					<font color='red' size='2'>*&nbsp;</font>投资(万元)：
				</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" id="tz" name="tz" onblur="checkdfzc(this)" style="width: 120px;"/></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					<font color='red' size='2'>*&nbsp;</font>补助测算(万元)：
				</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" id="bzcs" readonly="readonly"  onblur="checkdfzc(this)" style="width: 120px;"/>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					<font color='red' size='2'>*&nbsp;</font>地方自筹(万元)：
				</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="dfzc">0</span>
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					<font color='red' size='2'>*&nbsp;</font>银行贷款(万元)：
				</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" id="yhdk" name="yhdk" style="width: 120px;"/>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right"></td>
				<td style="background-color: #ffffff; height: 20px;" align="left"></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right"></td>
				<td style="background-color: #ffffff; height: 20px;" align="left"></td>
			</tr>
			<tr style="height: 60px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">备注：</td>
				<td colspan="5" style="background-color: #ffffff; height: 20px;" align="left">
					<textarea id="bz" name="bz" style="width: 580px;height: 50px;"></textarea>
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