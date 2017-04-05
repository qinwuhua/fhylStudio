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
<script type="text/javascript" src="${pageContext.request.contextPath}/page/wngh/wnjh/js/wnjh.js"></script>

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
		xmnf1("xmnf");
		xmnf2("jhkgn");
		xmnf2("jhwgn");
		$("#save_button").click(function(){
			/* if($("#ylxbh").val()=="" || $("#ylxbh").val()==null){
				alert("请填写路线编码！");
				$("#ylxbh").focus();
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
		/* 	if(parseFloat($("#qdzh").val())*1000<qdStr*1000){
				alert("对不起，起点桩号不能小于"+qdStr+"！");
				$("#qdzh").focus();
				return false;
			}
			if(parseFloat($("#zdzh").val())*1000>zdStr*1000){
				alert("对不起，止点桩号不能大于"+zdStr+"！");
				$("#zdzh").focus();
				return false;
			} */
			
			$.ajax({
				type:'post',
				url:'/jxzhpt/qqgl/selectLmwnjhcf.do',
		        data:'lxsh.ghlxbh='+$("#ylxbh").val()+xzqh+'&lxsh.qdzh='+$("#qdzh").val()+'&lxsh.zdzh='+$("#zdzh").val(),
				dataType:'json',
				success:function(msg){
					if(msg!=null){
						alert("该段路已添加为"+msg.xmnf+"项目,起止桩号为("+msg.qdzh+","+msg.zdzh+")");
					}else{
						saveLxsh();
					}
				}
			});
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
					xzqh=item.xzqh;
					if(item==undefined) return ;
					$("#xzqh,#qdzh,#zdzh,#lc,#jsdj,#gydw,#qd,#zd").attr("value",'');
					$("#lxmc").val(item.lxmc);
					$("#qdzh").val(parseFloat(item.qdzh));
					$("#zdzh").val(parseFloat(item.zdzh));
					selectTSDQ(item.ghlxbm,item.ghqdzh,item.ghzdzh);
					//getbzcs(item.ghlxbh.substr(0,1),item.xjsdj,accSub(parseFloat($("#zdzh").val()),parseFloat($("#qdzh").val())),'路面改造工程项目');
					//$("#lc").html(accSub(parseFloat($("#zdzh").val()),parseFloat($("#qdzh").val())));
					//$("#qdmc").val(item.qdmc);
					//$("#zdmc").val(item.zdmc);
					qdStr=parseFloat(item.qdzh);
					zdStr=parseFloat(item.zdzh);
					$("#gpsqdzh").val(qdStr);
					$("#gpszdzh").val(zdStr);
					getghlxinfo(item.ghlxbh,item.qdzh,item.zdzh);
					cxqdmc($('#ghlxbm').val(),$('#ghqdzh').val());
					cxzdmc($('#ghlxbm').val(),$('#ghzdzh').val());
					if(parseFloat(item.qdzh)<parseFloat(item.zdzh)){
						$('#span_qdzh').html(">="+item.qdzh);
						$('#span_zdzh').html("<="+item.zdzh);
					}else{
						$('#span_qdzh').html("<="+item.qdzh);
						$('#span_zdzh').html(">="+item.zdzh);
					}
					//querymc('');
					//querymc('zdzh');
// 					$("#qd").html("<font color='red' size='2'>*&nbsp;</font>"+"<font color='red' size='2'>"+item.qdzh);
// 					$("#zd").html("<font color='red' size='2'>*&nbsp;</font>"+"<font color='red' size='2'>"+item.zdzh);
					//queryJsdjAndLc(item.ghlxbh,$("#qdzh").val(),$("#zdzh").val());
					cesuan2();
				});
	}
	function saveLxsh(){
		var id=parent.obj.id;		
		var sbthcd=$.cookie("unit2").length;
		if($.cookie("unit2")=="______36"){
			sbthcd=7;
		}
		var data ="lxsh.ghlxbh="+$("#ylxbh").val()+"&lxsh.lxmc="+$("#lxmc").val()+"&lxsh.xmmc="+$("#xmmc").val()
		+"&lxsh.qdzh="+$("#qdzh").val()+"&lxsh.zdzh="+$("#zdzh").val()+"&lxsh.lc="+$("#lc").html()
		+"&lxsh.qdmc="+$("#qdmc").val()+"&lxsh.zdmc="+$("#zdmc").val()+"&lxsh.jsxz="+'路面改造'
		+"&lxsh.gydw="+$("#gydw").combobox("getText")
		+"&lxsh.xzqh="+$("#xzqh").combobox("getText")
		+"&lxsh.gydwdm="+$("#gydw").combobox("getValues").join(',')
		+"&lxsh.xzqhdm="+$("#xzqh").combobox("getValues").join(',')
		+"&lxsh.tsdq="+$("#tsdq").html()
		+"&lxsh.jsjsdj="+$("#jsjsdj").val()+"&lxsh.xjsdj="+$("#jsdj").val()+"&lxsh.xmbm="+id+"&lxsh.xmnf="+parent.obj.xmnf+"&lxsh.xmlx=wnjh_lmgz"
		+"&lxsh.gpsqdzh="+qdStr+"&lxsh.gpszdzh="+zdStr;
		data+="&lxsh.yilc="+$('#yilc').val()+"&lxsh.erlc="+$('#erlc').val()+"&lxsh.sanlc="+$('#sanlc').val()+
		"&lxsh.silc="+$('#silc').val()+"&lxsh.dwlc="+$('#dwlc').val()+"&lxsh.wllc="+$('#wllc').val()
		+"&lxsh.ghxlxmc="+$('#ghlxmc').val()+"&lxsh.ghxlxbm="+$('#ghlxbm').val()
		+"&lxsh.ghlxmc="+$('#ghlxmc').val()+"&lxsh.ghlxbm="+$('#ghlxbm').val()+"&lxsh.ghqdzh="+$('#ghqdzh').val()+"&lxsh.ghzdzh="+$('#ghzdzh').val()
		+"&lxsh.gxlxbm="+$('#gxlxbm').val()+"&lxsh.gxqdzh="+$('#gxqdzh').val()+"&lxsh.gxzdzh="+$('#gxzdzh').val()
		;
		$.ajax({
			type:'post',
			url:'/jxzhpt/qqgl/insertGjlxwnjh.do',
	        data:data,
			dataType:'json',
			success:function(msg){
				if(msg){
					alert("保存成功！");
					parent.showAlllm();
					removes('lxxx');
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
// 		var zlcs=accSub(parseFloat($("#zdzh").val()),parseFloat($("#qdzh").val()));var zlc=Math.abs(zlcs);
// 		$("#lc").html(zlc);
		//getbzcs($("#ylxbh").val().substr(0,1),$("#jsjsdj").html(),$("#lc").html(),'路面改造工程项目');
		queryJsdjAndLc($("#ghlxbm").val(),$("#ghqdzh").val(),$("#ghzdzh").val());
		cesuan2();
		selectTSDQ($("#ghlxbm").val(),$("#ghqdzh").val(),$("#ghzdzh").val());
		if($("#ghqdzh").val()!='')
			cxqdmc($("#ghlxbm").val(),$("#ghqdzh").val());
		if($("#ghzdzh").val()!='')
			cxzdmc($("#ghlxbm").val(),$("#ghzdzh").val());
		getghlxinfo($('#ylxbh').val(),$('#qdzh').val(),$('#zdzh').val());
	}
	
</script>
<table style="width: 100%; background-color: #aacbf8; font-size: 12px"
			border="0" cellpadding="3" cellspacing="1">
			 <tr style="height: 30px;">
            	<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					规划路线编码</td>
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
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					<font color='red' size='2'>*&nbsp;</font>原路线编码：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input id="gpsqdzh" name="gpsqdzh" type="hidden"/>
					<input id="gpszdzh" name="gpszdzh" type="hidden"/>
					<input readonly="readonly" type="text" name="ylxbh" id="ylxbh" style="width: 120px" /></td>
				
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					<font color='red' size='2'>*&nbsp;</font>原起点桩号：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input readonly="readonly" type="text" name="qdzh" id="qdzh" style="width: 120px" onblur="changeZlc()"/><br/>
					<span id="span_qdzh" style="font-size: small;color: red;"></span>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					<font color='red' size='2'>*&nbsp;</font>原止点桩号：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input readonly="readonly" type="text" name="zdzh"id="zdzh" style="width: 120px" onchange="changeZlc()"/><br/>
					<span id="zd"></span>
				</td>
			</tr>
			<tr style="height: 30px;">
            	<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					共线路线编码</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input id="gxlxbm" name="gxlxbm" type="text" style="width: 120px;" readonly="readonly"/>&nbsp;<span style="color: red;">*</span>
					
				</td>
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					共线起点桩号</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input id="gxqdzh" name="gxqdzh" type="text" style="width: 120px;" readonly="readonly"/>&nbsp;<span style="color: red;">*</span><br/>
				</td>
				<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					共线止点桩号</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input id="gxzdzh" name="gxzdzh" type="text" style="width: 120px;" readonly="readonly"/>&nbsp;<span style="color: red;">*</span><br/>
				</td>
            </tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					<font color='red' size='2'>*&nbsp;</font>规划路线名称：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input id="ghlxmc" name="ghlxmc" style="width: 120px;" />
				</td>
				
				
				<!-- <td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					<font color='red' size='2'>*&nbsp;</font>里程：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="lc" style="font-size: 14px">0</span>&nbsp;公里
				</td> -->
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					<font color='red' size='2'>*&nbsp;</font>起点名称：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input id="qdmc" name="qdmc" type="text" style="width: 120px;"/>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					<font color='red' size='2'>*&nbsp;</font>止点名称：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input id="zdmc" name="zdmc" type="text" style="width: 120px;"/>
				</td>
			</tr>
			
            
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					<font color='red' size='2'>*&nbsp;</font>原路线名称：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input type="text" id='lxmc' style="width: 120px"/> 
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					<font color='red' size='2'>*&nbsp;</font>建设技术等级：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input id="jsjsdj" name="jsjsdj" type="text" style="width: 120px;"/>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					<font color='red' size='2'>*&nbsp;</font>现状技术等级：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input id="jsdj" name="jsdj" type="text" style="width: 120px;"/>
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					技术等级及里程
				</td>
				<td colspan="5" style="background-color: #ffffff; height: 20px;width:18%" align="left">
					一级：<input id="yilc" onchange="cesuan2()" name="yilc" style="width: 50px;" type="text"/>
					二级：<input id="erlc" onchange="cesuan2()" name="erlc" style="width: 50px;" type="text"/>
					三级：<input id="sanlc" onchange="cesuan2()" name="sanlc" style="width: 50px;" type="text"/>
					四级：<input id="silc" onchange="cesuan2()" name="silc" style="width: 50px;" type="text"/>
					等外：<input id="dwlc" onchange="cesuan2()" name="dwlc" style="width: 50px;" type="text"/>
					无路：<input id="wllc" onchange="cesuan2()" name="wllc" style="width: 50px;" type="text"/>
					总计：<span id="lc" style="font-size: 14px">0</span>&nbsp;公里
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					<font color='red' size='2'>*&nbsp;</font>管养单位：</td>
				<td style="background-color: #ffffff; height: 25px;" align="left">
					<input type='text' id='gydw' style="width: 124px;"></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right"><font color='red' size='2'>*&nbsp;</font>行政区划：</td>
				<td style="background-color: #ffffff; height: 25px;" align="left">
					<input type='text' id='xzqh' style="width: 124px;"></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">特殊地区：</td>
				<td style="background-color: #ffffff; height: 25px;" align="left">
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