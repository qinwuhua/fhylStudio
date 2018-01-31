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
		xmnf1("xmnf",'3');
		xmnf2("jhkgn");
		xmnf2("jhwgn");
		xmbm('xmbm',$.cookie("dist"),new Date().getFullYear(),'3');
		//Stsdq1('tsdq','');
		$("#save_button").click(function(){
			/* if($("#lxbm").val()=="" || $("#lxbm").val()==null){
				alert("请填写路线编码！");
				$("#lxbm").focus();
				return false;
			}
			if($("#lxmc").val()=="" || $("#lxmc").val()==null){
				alert("请填写路线名称！");
				$("#lxmc").focus();
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
				return false;
			}
			if($("#bzcs").val()=="" || $("#bzcs").val()==null){
				alert("请填写补助测算");
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
			
			/* if(parseFloat($("#qdzh").val())*1000>parseFloat($("#zdzh").val())*1000){
				alert("对不起，起点桩号不能大于止点桩号！");
				$("#qdzh").focus();
				return false;
			}
			 */
			if(parseInt($("#jhkgn").combobox('getText'))>parseInt($("#jhwgn").combobox('getText'))){
				alert("对不起，开工年不能大于完工年！");
				return false;
			}

			saveLxsh();
			/*
				var datas="lxsh.ghlxbh="+$("#lxbm").val()+"&lxsh.qdzh="+$("#qdzh").val()+"&lxsh.zdzh="+$("#zdzh").val()+"&lxsh.xmnf="+$("#xmnf").combobox('getText')+"&lxsh.xmlx=xj";
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
				});
			*/
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
	  				return 'wnjh_xj';
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
					xmbm('xmbm',$.cookie("dist"),item.xmnf,'3');
					wnobj=item;
					$("#lxmc").val(item.lxmc);$("#lxbm").val(item.ghlxbh);
					$("#xjsdj").val(item.xjsdj);$("#jsjsdj").val(item.jsjsdj);
					$("#tsdq").val(item.tsdq);$("#xmnf").combobox('setValue',item.xmnf);
					$("#jhkgn").combobox('setValue',item.jhkgn);
					$("#jhwgn").combobox('setValue',item.jhwgn);
					
/* 					$("#qdzh").val(item.qdzh);
					$("#zdzh").val(item.zdzh);
					$("#tz").val(parseFloat(item.tz));$("#bzcs").val(parseFloat(item.bzys));$("#dfzc").html(parseFloat(item.dfzc));
					$("#yhdk").val(item.yhdk); */
					if(isNaN(parseFloat(item.qdzh))){
						$("#qdzh").val(item.qdzh);
					}else{
						$("#qdzh").val(parseFloat(item.qdzh));
					}
					if(isNaN(parseFloat(item.zdzh))){
						$("#zdzh").val(item.zdzh);
					}else{
						$("#zdzh").val(parseFloat(item.zdzh));
					}
					if(isNaN(parseFloat(item.tz))){
						$("#tz").val(item.tz);
					}else{
						$("#tz").val(parseFloat(item.tz).toFixed(2));
					}
					if(isNaN(parseFloat(item.bzys))){
						$("#bzcs").val(item.bzys);
					}else{
						$("#bzcs").val(parseFloat(item.bzys).toFixed(2));
					}
					
					if(isNaN(parseFloat(item.dfzc))){
						$("#dfzc").html(item.dfzc);
					}else{
						$("#dfzc").html(parseFloat(item.dfzc).toFixed(2));
					}
					
					if(isNaN(parseFloat(item.yhdk))){
						$("#yhdk").val(item.yhdk);
					}else{
						$("#yhdk").val(parseFloat(item.yhdk).toFixed(2));
					}	
					$("#bz").val(item.bz);
					$("#xzqhdm").val(item.xzqhdm);$("#gydwdm").val(item.gydwdm);
					loadUnitedit("gydw",'36',item.gydwdm);
					$("#gydw").combotree('setValues',item.gydwdm.split(","));
					loadDistedit("xzqh",'36',item.xzqhdm2);
					$("#xzqh").combotree('setValues',item.xzqhdm2.split(","));
					$("#xjlc").html(item.xjlc);
					//alert(item.jszlc);
					$("#lc").html(item.lc);
					//loadUnit3("gydw",item.gydwdm,$.cookie("unit"));
					//loadDist3("xzqh",item.xzqhdm,$.cookie("dist"));
					//selectTSDQ(item.ghlxbm,item.ghqdzh,item.ghzdzh);
					//getbzcs(item.ghlxbh.substr(0,1),item.xjsdj,accSub(parseFloat($("#zdzh").val()),parseFloat($("#qdzh").val())),'路面改造工程项目');
					$("#xmklx").val(item.xmklx);
					
					$("#qdmc").val(item.qdmc);
					$("#zdmc").val(item.zdmc);
					qdStr=(parseFloat(item.qdzh)-5);
					zdStr=(parseFloat(item.zdzh)+5);
					//$("#qd").html("<font color='red' size='2'>*&nbsp;不能小于</font>"+"<font color='red' size='2'>"+qdStr);
					//$("#zd").html("<font color='red' size='2'>*&nbsp;不能大于</font>"+"<font color='red' size='2'>"+zdStr);
					//queryJsdjAndLc(item.ghlxbh,$("#qdzh").val(),$("#zdzh").val());
					//cesuan2(); 
					loadjsdjcd();
					//changeZlc2()
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
				$("#xjlxbm").val(msg.xjlxbm);
				$("#xjqdzh").val(msg.xjqdzh);
				$("#xjzdzh").val(msg.xjzdzh);
				//$("#xjlc").val(accSub(parseFloat(msg.xjzdzh),parseFloat(msg.xjqdzh)));
			}
		});
	}
	function saveLxsh(){
		/* var tz=0;var bzcs=0;
		if($("#tz").val()!='')
			tz=parseFloat($("#tz").val());
		if($("#bzcs").val()!='')
			bzcs=parseFloat($("#bzcs").val()); */
		var tz=0; var bzcs=0;		
		if($("#tz").val()!='' || $("#tz").val()!=undefined || $("#tz").val()!=null){
			tz=parseFloat($("#tz").val());
		}	
		if($("#bzcs").val()!=''|| $("#bzcs").val()!=undefined || $("#bzcs").val()!=null){
			bzcs=parseFloat($("#bzcs").val());
		}
		var dfzc = accSub(parseFloat($("#tz").val()),parseFloat($("#bzcs").val()));
		if(isNaN(dfzc)){ dfzc=0;}
		if(bzcs>tz){
			alert("投资不能小于补助测算");
			return;
		}
		var sbthcd=$.cookie("unit2").length;
		if($.cookie("unit2")=="______36"){
			sbthcd=7;
		}

		var data ="lxsh.ghlxbh="+$("#lxbm").val()+"&lxsh.lxmc="+$("#lxmc").val()+"&lxsh.xmmc="+$("#xmmc").val()
		+"&lxsh.qdzh="+$("#qdzh").val()+"&lxsh.zdzh="+$("#zdzh").val()+"&lxsh.lc="+$("#lc").html()
		+"&lxsh.qdmc="+$("#qdmc").val()+"&lxsh.zdmc="+$("#zdmc").val()+"&lxsh.jsxz="+$("#jsxz").val()
		+"&lxsh.gydw="+$("#gydw").combobox("getText")+"&lxsh.xzqh="+$("#xzqh").combobox("getText")+"&lxsh.gydwdm="+$("#gydw").combobox("getValues").join(',')+"&lxsh.xzqhdm="+$.cookie("dist")+"&lxsh.xzqhdm2="+$("#xzqh").combobox("getValues").join(',')+"&lxsh.tsdq="+$("#tsdq").val()
		+"&lxsh.jsjsdj="+$("#jsjsdj").val()+"&lxsh.xjsdj="+$("#xjsdj").val()+"&lxsh.xmbm="+$("#xmbm").html()
		+"&lxsh.xmnf="+$("#xmnf").combobox('getText')+"&lxsh.jhkgn="+$("#jhkgn").combobox('getText')+"&lxsh.jhwgn="+$("#jhwgn").combobox('getText')
		+"&lxsh.tz="+$("#tz").val()+"&lxsh.bzys="+$("#bzcs").val()+"&lxsh.dfzc="+dfzc+"&lxsh.tbbmbm="+$.cookie("unit")
		+"&lxsh.sbthcd="+sbthcd+"&lxsh.jdbs=0"+"&lxsh.gpsqdzh=''&lxsh.gpszdzh=''";
		
		data+="&lxsh.xjlxbm="+$('#xjlxbm').val()+"&lxsh.xjqdzh="+$('#xjqdzh').val()+"&lxsh.xjzdzh="+$('#xjzdzh').val()+
		"&lxsh.xjlc="+$('#xjlc').html()+"&lxsh.bz="+$('#bz').val()+"&lxsh.xmklx="+$('#xmklx').val();
		
		data+="&lxsh.yilc="+$('#yilc').val()+"&lxsh.erlc="+$('#erlc').val()+"&lxsh.sanlc="+$('#sanlc').val()+
		"&lxsh.silc="+$('#silc').val()+"&lxsh.dwlc="+$('#dwlc').val()+"&lxsh.wllc="+$('#wllc').val()+"&lxsh.yhdk="+$('#yhdk').val()+"&lxsh.jszlc="+$('#jszlc').val()+"&lxsh.wnid="+wnobj.id+"&lxsh.lsjl="+wnobj.lsjl+"&lxsh.sfbflx="+$('#sfbflx').combobox('getValue');
		data+="&lxsh.jhyilc="+$('#jhyilc').val()+"&lxsh.jherlc="+$('#jherlc').val()+"&lxsh.jhsanlc="+$('#jhsanlc').val()+"&lxsh.jhsilc="+$('#jhsilc').val()+"&lxsh.jhdwlc="+$('#jhdwlc').val()+"&lxsh.jhwllc="+$('#jhwllc').val();
		//alert();
		//alert(data);
		$.ajax({
			type:'post',
			url:'/jxzhpt/qqgl/insertXj.do',
	        data:data,
			dataType:'json',
			success:function(msg){
				if(msg.result=="true"){
					alert("保存成功！");
					parent.showAllxj();
					removes('lxxx');
				}else if(msg.result=="have"){
					alert("路线 "+$('#lxbm').val()+"【"+$('#qdzh').val()+"-"+$('#zdzh').val()+"】已存在"+panduanxmlx(msg.lx.xmid)+"【"+msg.lx.xmmc+"】"+"中！");
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
		}
		if(parseFloat($("#zdzh").val())<parseFloat(qdStr)){
			alert("止点桩号不能小于起点桩号");
			$("#zdzh").val(zdStr);
		} */
		var qd=0;
		var zd=0;
		if($("#zdzh").val()==''){
			zd=0;
		}else{
			zd=parseFloat($("#zdzh").val());
		}
		if($("#qdzh").val()==''){
			qd=0;
		}else{
			qd=parseFloat($("#qdzh").val());
		}
		var zlc=accSub(zd,qd);
		if(!isNaN(zlc))
		$("#lc").html(zlc);
// 		getbzcs($("#lxbm").val().substr(0,1),$("#jsjsdj").html(),$("#lc").html(),'路面改造工程项目');
// 		selectTSDQ($("#lxbm").val(),$("#qdzh").val(),$("#zdzh").val());
// 		if($("#ghqdzh").val()!='')
// 			cxqdmc($("#ghlxbm").val(),$("#ghqdzh").val());
// 		if($("#ghzdzh").val()!='')
// 			cxzdmc($("#ghlxbm").val(),$("#ghzdzh").val());
	}
	function changeZlc2(){
		 /* if(parseFloat($("#xjqdzh").val())>parseFloat(zdStr)){
			alert("起点桩号不能大于止点桩号");
			$("#xjqdzh").val(qdStr);
		}
		if(parseFloat($("#xjzdzh").val())<parseFloat(qdStr)){
			alert("止点桩号不能小于起点桩号");
			$("#xjzdzh").val(zdStr);
		}  */
		var qd=0;
		var zd=0;
		if($("#xjzdzh").val()==''){
			zd=0;
		}else{
			zd=parseFloat($("#xjzdzh").val());
		}
		if($("#xjqdzh").val()==''){
			qd=0;
		}else{
			qd=parseFloat($("#xjqdzh").val());
		}
		var zlc=accSub(zd,qd);
		if(!isNaN(zlc))
		$("#xjlc").html(zlc);
	}

</script>
<table style="width: 100%; background-color: #aacbf8; font-size: 12px"
			border="0" cellpadding="3" cellspacing="1">
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right"><font color='red' size='2'>*&nbsp;</font>项目名称：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input type="text" id="xmmc" style="width: 120px"/></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right"><font color='red' size='2'>*&nbsp;</font>路线编码：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input type="hidden" name="xzqhdm" id="xzqhdm" style="width: 156px" />
					<input type="hidden" name="gydwdm" id="gydwdm" style="width: 156px" />
					<input type="text" name="lxbm" id="lxbm" style="width: 120px" /></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right"><font color='red' size='2'>*&nbsp;</font>路线名称：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input type="text" name="lxmc" id="lxmc" style="width: 120px" /></td>
				
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right"><font color='red' size='2'>*&nbsp;</font>起点桩号：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" name="qdzh" id="qdzh" style="width: 120px" onblur="changeZlc()"/><br/>
					<span id="qd"></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right"><font color='red' size='2'>*&nbsp;</font>止点桩号：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" name="zdzh"id="zdzh" style="width: 120px" onblur="changeZlc()"/><br/>
					<span id="zd"></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right"><font color='red' size='2'>*&nbsp;</font>里程：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="lc" style="font-size: 14px">0</span>&nbsp;公里</td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					<font color='red' size='2'>*&nbsp;</font>原起点名称：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" name="qdmc" id="qdmc" style="width: 120px" />
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					<font color='red' size='2'>*&nbsp;</font>原止点名称：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" name="zdmc" id="zdmc" style="width: 120px" />
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					<font color='red' size='2'>*&nbsp;</font>新建路线编码：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" name="xjlxbm" id="xjlxbm" style="width: 120px">
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					<font color='red' size='2'>*&nbsp;</font>新建起点桩号：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" name="xjqdzh" id="xjqdzh" style="width: 120px" onblur="changeZlc2()"/>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					<font color='red' size='2'>*&nbsp;</font>新建止点桩号：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" name="xjzdzh"id="xjzdzh" style="width: 120px" onblur="changeZlc2()"/>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					<font color='red' size='2'>*&nbsp;</font>新建里程：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="xjlc" style="font-size: 14px">0</span>&nbsp;公里
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
					现技术等级及里程
				</td>
				<td colspan="5" style="background-color: #ffffff; height: 20px;width:18%" align="left">
					一级公路：<input id="jhyilc" name="jhyilc" style="width: 50px;" type="text" onblur="checkSZ(this)"/>
					二级公路：<input id="jherlc" name="jherlc" style="width: 50px;" type="text" onblur="checkSZ(this)"/>
					三级公路：<input id="jhsanlc" name="jhsanlc" style="width: 50px;" type="text" onblur="checkSZ(this)"/>
					四级公路：<input id="jhsilc" name="jhsilc" style="width: 50px;" type="text" onblur="checkSZ(this)"/>
					等外公路：<input id="jhdwlc" name="jhdwlc" style="width: 50px;" type="text" onblur="checkSZ(this)"/>
					无路：<input id="jhwllc" name="jhwllc" style="width: 50px;" type="text" onblur="checkSZ(this)"/>
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					新建技术等级及里程
				</td>
				<td colspan="5" style="background-color: #ffffff; height: 20px;width:18%" align="left">
					一级公路：<input id="yilc" name="yilc" style="width: 50px;" type="text" onblur="checkSZ(this)"/>
					二级公路：<input id="erlc" name="erlc" style="width: 50px;" type="text" onblur="checkSZ(this)"/>
					三级公路：<input id="sanlc" name="sanlc" style="width: 50px;" type="text" onblur="checkSZ(this)"/>
					四级公路：<input id="silc" name="silc" style="width: 50px;" type="text" onblur="checkSZ(this)"/>
					等外公路：<input id="dwlc" name="dwlc" style="width: 50px;" type="text" onblur="checkSZ(this)"/>
					无路：<input id="wllc" name="wllc" style="width: 50px;" type="text" onblur="checkSZ(this)"/>
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right"><font color='red' size='2'>*&nbsp;</font>建设性质：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" id="jsxz" style="width: 120px"  value='新建'/>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right"><font color='red' size='2'>*&nbsp;</font>管养单位：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type='text' id='gydw' style="width: 124px;">
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right"><font color='red' size='2'>*&nbsp;</font>行政区划：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type='text' id='xzqh' style="width:124px;">
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">特殊地区：</td>
				<td style="background-color: #ffffff; height: 25px;" align="left">
					<input type="text" id="tsdq" style="width: 124px;"/>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right"><font color='red' size='2'>*&nbsp;</font>建设技术等级：</td>
				<td style="background-color: #ffffff; height: 25px;" align="left">
					<input id="jsjsdj" name="jsjsdj" type="text" style="width: 120px;"/>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right"><font color='red' size='2'>*&nbsp;</font>现状技术等级：</td>
				<td style="background-color: #ffffff; height: 25px;" align="left">
					<input id="xjsdj" name="xjsdj" type="text" style="width: 120px;"/>
					<!-- <select id="xjsdj" style="width:124px"class="easyui-combobox" data-options="panelHeight:'120'">
						<option value="一级公路">一级公路</option>
						<option value="二级公路">二级公路</option>
						<option value="三级公路">三级公路</option>
						<option value="四级公路">四级公路</option>
						<option value="等外公路">等外公路</option>
						<option value="高速公路">高速公路</option>
					</select> -->
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right"><font color='red' size='2'>*&nbsp;</font>项目编码：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="xmbm"></span>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right"><font color='red' size='2'>*&nbsp;</font>项目年份：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<select id="xmnf" style="width:124px"class="easyui-combobox" data-options="panelHeight:'100'"></select>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right"><font color='red' size='2'>*&nbsp;</font>计划开工年：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<select id="jhkgn" style="width:124px"class="easyui-combobox" data-options="panelHeight:'100'"></select>
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right"><font color='red' size='2'>*&nbsp;</font>计划完工年：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<select id="jhwgn" style="width:124px"class="easyui-combobox" data-options="panelHeight:'100'"></select>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right"><font color='red' size='2'>*&nbsp;</font>投资(万元)：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" id="tz"  onblur="checkdfzc1(this)" style="width: 120px;"/>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right"><font color='red' size='2'>*&nbsp;</font>补助测算(万元)：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type='text' id='bzcs' readonly="readonly" onblur="checkdfzc1(this)" style="width: 120px;"/>
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right"><font color='red' size='2'>*&nbsp;</font>地方自筹(万元)：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="dfzc"></span>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					<font color='red' size='2'>*&nbsp;</font>银行贷款(万元)：
				</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" id="yhdk" style="width: 120px;"/>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right"></td>
				<td style="background-color: #ffffff; height: 20px;" align="left"></td>
			</tr>
			
			<tr style="height: 60px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">备注：</td>
				<td colspan="5" style="background-color: #ffffff; height: 20px;" align="left">
					<textarea id="bz" name="bz" style="width: 500px;height: 50px;"></textarea>
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