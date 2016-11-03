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
	$(function(){
		loadUnitadd("gydw",$.cookie("unit"));
		loadDistadd("xzqh",$.cookie("dist"));
		xmnf1("xmnf",'1');
		xmnf2("jhkgn");
		xmnf2("jhwgn");
		xmbm('xmbm',$.cookie("dist"),new Date().getFullYear(),'1');
		/*$('#jsjsdj').combobox({
		    onSelect:function(rec){
		    	getbzcs($("#lxbm").val().substr(0,1),$("#jsjsdj").combobox('getText'),$("#lc").html(),'升级改造工程项目');
		    }
		});*/
		$("#save_button").click(function(){
			/* if($("#lxbm").val()=="" || $("#lxbm").val()==null){
				alert("请填写路线编码！");
				$("#lxbm").focus();
				return false;
			}
			if($("#xmmc").val()=="" || $("#xmmc").val()==null){
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
				$("#dfzc").focus();
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
			} */
			/* if(parseFloat($("#qdzh").val())*1000<qdStr*1000){
				alert("对不起，起点桩号不能小于"+qdStr+"！");
				$("#qdzh").focus();
				return false;
			}
			if(parseFloat($("#zdzh").val())*1000>zdStr*1000){
				alert("对不起，止点桩号不能大于"+zdStr+"！");
				$("#zdzh").focus();
				return false;
			}
			if(parseFloat($("#qdzh").val())*1000>parseFloat($("#zdzh").val())*1000){
				alert("对不起，起点桩号不能大于止点桩号！");
				$("#qdzh").focus();
				return false;
			}
			 */
			if(qdStr < zdStr){
				if($("#qdzh").val() < qdStr){
					alert("原起点桩号不能小于"+qdStr);
					return false;
				}
				if($("#zdzh").val() > zdStr){
					alert("原止点桩号不能大于"+zdStr);
					return false;
				}
			}else{
				if($("#qdzh").val() > qdStr){
					alert("原起点桩号不能大于"+qdStr);
					return false;
				}
				if($("#zdzh").val() < zdStr){
					alert("原止点桩号不能小于"+zdStr);
					return false;
				}
			}
			if(parseInt($("#jhkgn").combobox('getText'))>parseInt($("#jhwgn").combobox('getText'))){
				alert("对不起，开工年不能大于完工年！");
				return false;
			}
			/* var zlc=$("#jszlc").val();
			if(parseFloat(zlc)>(parseFloat($('#lc').html())*1.2)){
				alert("对不起，建设技术等级里程不能大于现状里程的120%");
				return false;
			}  */
			saveLxsh();
			/*var datas="lxsh.ghlxbh="+$("#lxbm").val()+"&lxsh.qdzh="+$("#qdzh").val()+"&lxsh.zdzh="+$("#zdzh").val()+"&lxsh.xmnf="+$("#xmnf").combobox('getText')+"&lxsh.xmlx=sjgz";
			$.ajax({
				type:'post',
				url:'/jxzhpt/qqgl/selectSFCF.do',
				dataType:'json',
			    data:datas,
				success:function(msg){
					if(Boolean(msg)){
						saveLxsh();
					}else{
						alert('该项目'+$("#xmnf").combobox('getText')+'年已添加过，请勿重复添加！');
					}
				}
			});*/
				
		});
		autoCompleteLXBM();
	});
	var wnobj=new Object();
	function autoCompleteLXBM(){
		var url = "/jxzhpt/qqgl/qqglGpsroad.do";
		$("#xmmc").autocomplete(url, {
			multiple : false,
			minChars :1,
			multipleSeparator : ' ',
			mustMatch: true,
	  		cacheLength : 0,
	  		delay : 200,
	  		max : 150,
	  		extraParams : {
	  			xmmc:function() {
	  				var d = $("#xmmc").val();
	  				return d;
	  			},
	  			xzqh:function() {
	  				var d = $.cookie("dist2");
	  				return d;
	  			},
	  			xmlx:function() {
	  				return 'wnjh_sjgz';
	  			}
	  		},
	  		dataType : 'json',// 返回类型
	  		// 对返回的json对象进行解析函数，函数返回一个数组
	  		parse : function(data) {
	  			var aa = [];
	  			aa = $.map(eval(data), function(row) {
	  					return {
	  						data : row,
	  						value : row.xmmc.replace(/(\s*$)/g,""),
	  						result : row.xmmc.replace(/(\s*$)/g,"")
	  					};
	  				});
	  			return aa;
	  		},
	  		formatItem : function(row, i, max) {
	  			return row.xmmc.replace(/(\s*$)/g,"")+"("+row.qdzh+","+row.zdzh+")"+"<br/>"+row.lxmc.replace(/(\s*$)/g,"");
	  		}
	  	}).result(
				function(e, item) {
					if(item==undefined) return ;
					//$("#xzqh,#qdzh,#zdzh,#lc,#xjsdj,#gydw,#qd,#zd").attr("value",'');
					xmbm('xmbm',$.cookie("dist"),item.xmnf,'1');
					wnobj=item;
					$("#lxmc").html(item.lxmc);$("#lxbm").val(item.ghlxbh);
					$("#xjsdj").val(item.xjsdj);$("#jsjsdj").val(item.jsjsdj);
					$("#tsdq").html(item.tsdq);$("#xmnf").combobox('setValue',item.xmnf);
					$("#jhkgn").combobox('setValue',item.jhkgn);
					$("#jhwgn").combobox('setValue',item.jhwgn);
				
					$("#qdzh").val(parseFloat(item.qdzh));
					$("#zdzh").val(parseFloat(item.zdzh));
					$("#tz").val(parseFloat(item.tz));$("#bzcs").val(parseFloat(item.bzys));$("#dfzc").html(parseFloat(item.dfzc));
					$("#yhdk").val(item.yhdk);$("#bz").val(item.bz);$("#xzqhdm").val(item.xzqhdm);$("#gydwdm").val(item.gydwdm);
					
					loadUnitedit("gydw",'36',item.gydwdm);
					$("#gydw").combotree('setValues',item.gydwdm.split(","));
					loadDistedit("xzqh",'36',item.xzqhdm2);
					$("#xzqh").combotree('setValues',item.xzqhdm2.split(","));
					
					//loadUnit3("gydw",item.gydwdm,$.cookie("unit"));
					//loadDist3("xzqh",item.xzqhdm,$.cookie("dist"));
					//selectTSDQ(item.ghlxbh,item.qdzh,item.zdzh);
					//getbzcs(item.ghlxbh.substr(0,1),item.xjsdj,accSub(parseFloat($("#zdzh").val()),parseFloat($("#qdzh").val())),'路面改造工程项目');
					//$("#lc").html(accSub(parseFloat($("#zdzh").val()),parseFloat($("#qdzh").val())));
					$("#qdmc").val(item.qdmc);
					$("#zdmc").val(item.zdmc);
/* 					qdStr=(parseFloat(item.qdzh)-5);
					zdStr=(parseFloat(item.zdzh)+5);
 */					
					$("#ghlxmc").val(item.ghlxmc);
					$("#ghlxbm").val(item.ghlxbm);
					$("#ghqdzh").val(item.ghqdzh);
					$("#ghzdzh").val(item.ghzdzh);
					$("#gxlxbm").val(item.gxlxbm);
					$("#gxqdzh").val(item.gxqdzh);
					$("#gxzdzh").val(item.gxzdzh);
					/* $("#qd").html("<font color='red' size='2'>*&nbsp;不能小于</font>"+"<font color='red' size='2'>"+qdStr);
					$("#zd").html("<font color='red' size='2'>*&nbsp;不能大于</font>"+"<font color='red' size='2'>"+zdStr); */
					//queryJsdjAndLc(item.ghlxbh,$("#qdzh").val(),$("#zdzh").val());
					//cesuan2(); 
					
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
					if(qdStr > zdStr){
						$("#qd").html("<font color='red' size='2'>*&nbsp;不能></font>"+"<font color='red' size='2'>"+qdStr);
						$("#zd").html("<font color='red' size='2'>*&nbsp;不能<</font>"+"<font color='red' size='2'>"+zdStr);
					}else{
						$("#qd").html("<font color='red' size='2'>*&nbsp;不能<</font>"+"<font color='red' size='2'>"+qdStr);
						$("#zd").html("<font color='red' size='2'>*&nbsp;不能></font>"+"<font color='red' size='2'>"+zdStr);
					}
					
					
					loadjsdjcd();
				});
	}
	function loadjsdjcd(){
		$.ajax({
			type:'post',
			url:'/jxzhpt/qqgl/loadjsdjcd.do',
	        data:'lxsh.id='+wnobj.id,
			dataType:'json',
			success:function(msg){
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
				var yilc=0;var erlc=0;var sanlc=0;var silc=0;var wllc=0;var dwlc=0;
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
					wllc=parseFloat($('#wllc').val());
				if($('#dwlc').val()!='')
					dwlc=parseFloat($('#dwlc').val());
				var hj11=accAdd(yilc,erlc);var hj21=accAdd(sanlc,silc);var hj31=accAdd(wllc,dwlc);
				var hj41=accAdd(hj11,hj21);var hj51=accAdd(hj31,hj41);
				$('#lc').html(hj51);
				//alert(hj51);
				
				//alert(yilc+"+"+erlc+"+"+sanlc+"+"+silc);
			}
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
		var data ="lxsh.ghlxbh="+$("#lxbm").val()+"&lxsh.lxmc="+$("#lxmc").html()+"&lxsh.xmmc="+$("#xmmc").val()
		+"&lxsh.qdzh="+$("#qdzh").val()+"&lxsh.zdzh="+$("#zdzh").val()+"&lxsh.lc="+$("#lc").html()
		+"&lxsh.qdmc="+$("#qdmc").val()+"&lxsh.zdmc="+$("#zdmc").val()+"&lxsh.jsxz="+$("#jsxz").val()
		+"&lxsh.gydw="+$("#gydw").combobox("getText")+"&lxsh.xzqh="+$("#xzqh").combobox("getText")+"&lxsh.gydwdm="+$("#gydw").combobox("getValues").join(',')+"&lxsh.xzqhdm="+$.cookie("dist")+"&lxsh.xzqhdm2="+$("#xzqh").combobox("getValues").join(',')+"&lxsh.tsdq="+$("#tsdq").html()
		+"&lxsh.jsjsdj="+$("#jsjsdj").val()+"&lxsh.xjsdj="+$("#xjsdj").val()+"&lxsh.xmbm="+$("#xmbm").html()
		+"&lxsh.xmnf="+$("#xmnf").combobox('getText')+"&lxsh.jhkgn="+$("#jhkgn").combobox('getText')+"&lxsh.jhwgn="+$("#jhwgn").combobox('getText')
		+"&lxsh.tz="+$("#tz").val()+"&lxsh.bzys="+$("#bzcs").val()+"&lxsh.dfzc="+accSub(parseFloat($("#tz").val()),parseFloat($("#bzcs").val()))+"&lxsh.tbbmbm="+$.cookie("unit")
		+"&lxsh.sbthcd="+sbthcd+"&lxsh.jdbs=0"+"&lxsh.gpsqdzh="+qdStr+"&lxsh.gpszdzh="+zdStr;
		data+="&lxsh.yilc="+$('#yilc').val()+"&lxsh.erlc="+$('#erlc').val()+"&lxsh.sanlc="+$('#sanlc').val()+
		"&lxsh.silc="+$('#silc').val()+"&lxsh.dwlc="+$('#dwlc').val()+"&lxsh.wllc="+$('#wllc').val();
		data+="&lxsh.jhyilc="+$('#jhyilc').val()+"&lxsh.jherlc="+$('#jherlc').val()+"&lxsh.jhsanlc="+$('#jhsanlc').val()+
		"&lxsh.jhsilc="+$('#jhsilc').val()+"&lxsh.jhdwlc="+$('#jhdwlc').val()+"&lxsh.jhwllc="+$('#jhwllc').val()+
		"&lxsh.yhdk="+$('#yhdk').val()+"&lxsh.bz="+$('#bz').val()+"&lxsh.jszlc="+$('#jszlc').val()+"&lxsh.wnid="+wnobj.id+"&lxsh.lsjl="+wnobj.lsjl
		+"&lxsh.ghlxmc="+$('#ghlxmc').val()+"&lxsh.ghlxbm="+$('#ghlxbm').val()+"&lxsh.ghqdzh="+$('#ghqdzh').val()+"&lxsh.ghzdzh="+$('#ghzdzh').val()
		+"&lxsh.gxlxbm="+$('#gxlxbm').val()+"&lxsh.gxqdzh="+$('#gxqdzh').val()+"&lxsh.gxzdzh="+$('#gxzdzh').val()
		+"&lxsh.sfbflx="+$('#sfbflx').combobox('getValue');
		$.ajax({
			type:'post',
			url:'/jxzhpt/qqgl/insertSjgz.do',
	        data:data,
			dataType:'json',
			success:function(msg){
				if(msg.result=="true"){
					alert("保存成功！");
					parent.showAll();
					removes('lxxx');
				}else if(msg.result=="have"){
					alert("路线 "+$('#lxbm').val()+"【"+$('#qdzh').val()+"-"+$('#zdzh').val()+"】已存在"+panduanxmlx(msg.lx.xmid)+"【"+msg.lx.xmmc+"】"+"中！");
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
		//var zlc=accSub(parseFloat($("#zdzh").val()),parseFloat($("#qdzh").val()));
		//$("#lc").html(zlc);
		//getbzcs($("#lxbm").val().substr(0,1),$("#jsjsdj").val(),$("#lc").html(),'升级改造工程项目');
		//queryJsdjAndLc($("#lxbm").val(),$("#qdzh").val(),$("#zdzh").val());
		getghlxinfo($('#lxbm').val(),$('#qdzh').val(),$('#zdzh').val());
		selectTSDQ($("#lxbm").val(),$("#qdzh").val(),$("#zdzh").val());
		if($("#qdzh").val()!='')
		cxqdmc($("#lxbm").val(),$("#qdzh").val());
		if($("#zdzh").val()!='')
		cxzdmc($("#lxbm").val(),$("#zdzh").val());
	}
	
</script>
<table style="width: 100%; background-color: #aacbf8; font-size: 12px"
			border="0" cellpadding="3" cellspacing="1">
			<tr style="height: 35px;">
			<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					<font color='red' size='2'>*&nbsp;</font>项目名称：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" id="xmmc" style="width: 120px"/>

				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					<font color='red' size='2'>*&nbsp;</font>原路线编码：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input type="text" name="lxbm" id="lxbm" style="width: 120px" /></td>
				
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					<font color='red' size='2'>*&nbsp;</font>原起点桩号：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input type="text" name="qdzh" id="qdzh" style="width: 120px" onblur="changeZlc()"/><br/>
					<span id="qd"></span>
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					<font color='red' size='2'>*&nbsp;</font>原止点桩号：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" name="zdzh" id="zdzh" style="width: 120px" onblur="changeZlc()"/><br/>
					<span id="zd"></span>
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
				<td colspan="5" style="background-color: #ffffff; height: 20px;" align="left">
					<select id='sfbflx' class="easyui-combobox" style="width: 120px;">
						<option value="否" selected="selected">否</option>
						<option value="是">是</option>
					</select>
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					现技术等<br/>级及里程
				</td>
				<td colspan="5" style="background-color: #ffffff; height: 20px;width:18%" align="left">
					一级：<input id="yilc" onblur="jsyzlc()" name="yilc" style="width: 50px;" type="text"/>
					二级：<input id="erlc" onblur="jsyzlc()" name="erlc" style="width: 50px;" type="text"/>
					三级：<input id="sanlc" onblur="jsyzlc()" name="sanlc" style="width: 50px;" type="text"/>
					四级：<input id="silc" onblur="jsyzlc()" name="silc" style="width: 50px;" type="text"/>
					等外：<input id="dwlc" onblur="jsyzlc()" name="dwlc" style="width: 50px;" type="text"/>
					无路：<input id="wllc" onblur="jsyzlc()" name="wllc" style="width: 50px;" type="text"/>
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
					总计：<input id="jszlc" name="jszlc" style="width: 50px;" readonly="readonly"  type="text" value="0"/>
				</td>
			</tr>
			<tr style="height: 35px;">
				
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					<font color='red' size='2'>*&nbsp;</font>原路线名称：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<span id="lxmc"></span>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					<font color='red' size='2'>*&nbsp;</font>项目编码：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="xmbm"></span>
				</td>
				
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					<font color='red' size='2'>*&nbsp;</font>建设性质：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" id="jsxz" style="width: 120px" value='升级改造'/></td>
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
					<select id="xmnf" style="width:124px"class="easyui-combobox" data-options="panelHeight:'100'"></select>
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
					<input type="text" id="tz"  onblur="checkdfzc(this)" style="width: 120px;"/></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					<font color='red' size='2'>*&nbsp;</font>补助测算(万元)：
				</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" id="bzcs" readonly="readonly" onblur="checkdfzc(this)" style="width: 120px;"/>
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
					<input type="text" id="yhdk" style="width: 120px;"/>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right"></td>
				<td style="background-color: #ffffff; height: 20px;" align="left"></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right"></td>
				<td style="background-color: #ffffff; height: 20px;" align="left"></td>
			</tr>
			<tr style="height: 60px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">备注：</td>
				<td colspan="5" style="background-color: #ffffff; height: 20px;" align="left">
					<textarea id="bz" style="width: 580px;height: 50px;"></textarea>
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