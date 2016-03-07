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
	$(function(){
		loadUnit("gydw",$.cookie("unit"));
		loadDist("xzqh",$.cookie("dist"));
		$('#xmbm').html(parent.YMLib.Var.Obj.xmbm);
		autoCompleteLXBM()
	});
	function autoCompleteLXBM(){
		var url = "/jxzhpt/qqgl/wnjhGpsroad.do";
		$("#lxbm").autocomplete(url, {
			multiple : false,
			minChars :4,
			multipleSeparator : ' ',
			mustMatch: true,
	  		cacheLength : 0,
	  		delay : 200,
	  		max : 50,
	  		extraParams : {
  				lxbm:function() {
	  				var d = $("#lxbm").val();
	  				return d;
	  			},
	  			xzqh:function() {
	  				var d = $.cookie("dist");
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
				$("#xzqh,#qdzh,#zdzh,#lc,#xjsdj,#gydw,#qd,#zd").attr("value",'');
				$("#lxmc").val(item.lxmc);
				$("#qdzh").val(parseFloat(item.qdzh));
				$("#zdzh").val(parseFloat(item.zdzh));
				selectTSDQ(item.ghlxbh,item.qdzh,item.zdzh);
				$("#lc").val(accSub(parseFloat($("#zdzh").val()),parseFloat($("#qdzh").val())));
				$("#jsjsdj").val(item.xjsdj);
				$("#xjsdj").val(item.xjsdj);
				$("#qdmc").val(item.qdmc);
				$("#zdmc").val(item.zdmc);
				qdStr=parseFloat(item.qdzh);
				zdStr=parseFloat(item.zdzh);
				$("#qd").html("<font color='red' size='2'>*&nbsp;不能小于</font>"+"<font color='red' size='2'>"+item.qdzh);
				$("#zd").html("<font color='red' size='2'>*&nbsp;不能大于</font>"+"<font color='red' size='2'>"+item.zdzh);
				$("#gpsqdzh").val(item.qdzh);
				$("#gpszdzh").val(item.zdzh);
				queryJsdjAndLc(item.ghlxbh,$("#qdzh").val(),$("#zdzh").val());
				//getbzcs(item.ghlxbh.substr(0,1),item.xjsdj,accSub(parseFloat($("#zdzh").val()),parseFloat($("#qdzh").val())),'升级改造工程项目');
			});
	}
	function updateLx(){
		/*var params="lx.lxbm="+$('#lxbm').val()+"&lx.lxmc="+$('#lxmc').val()+"&lx.gydw="+$('#gydw').combotree("getText")
		+"&lx.gydwdm="+$('#gydw').combotree("getValue")+"&lx.xzqh="+$('#xzqh').combotree("getText")+"&lx.xzqhdm="+$('#xzqh').combotree("getValue")
		+"&lx.qdmc="+$('#qdmc').val()+"&lx.zdmc="+$('#zdmc').val()+"&lx.jsxz="+$('#jsxz').val()+"&lx.qdzh="+$('#qdzh').val()
		+"&lx.zdzh="+$('#zdzh').val()+"&lx.lc="+$('#lc').val()+"&lx.yilc="+$('#yilc').val()+"&lx.erlc="+$('#erlc').val()+"&lx.sanlc="+$('#sanlc').val()
		+"&lx.silc="+$('#silc').val()+"&lx.dwlc="+$('#dwlc').val()+"&lx.wllc="+$('#wllc').val()+"&lx.jhyilc="+$('#jhyilc').val()
		+"&lx.jherlc="+$('#jherlc').val()+"&lx.jhsanlc="+$('#jhsanlc').val()+"&lx.jhsilc="+$('#jhsilc').val()
		+"&lx.jhdwlc="+$('#jhdwlc').val()+"&lx.jhwllc="+$('#jhwllc').val()+"&lx.jsjsdj="+$('#jsjsdj').val()+"&lx.xjsdj="+$('#xjsdj').val()
		+"&lx.bzcs="+$('#bzcs').val()+"&lx.jdbs=0"+"&lx.xmid="+$('#xmbm').html();*/
		var params="lxsh.xmbm="+$('#xmbm').html()+"&lxsh.xmid="+$('#xmbm').html()+"&lxsh.lxbm="+$('#lxbm').val()+"&lxsh.ghlxbh="+$('#lxbm').val()+"&lxsh.lxmc="+$('#lxmc').val()+
			"&lxsh.xzqh="+$('#xzqh').combotree("getText")+"&lxsh.xzqhdm="+$('#xzqh').combotree("getValue")+
			"&lxsh.gydw="+$('#gydw').combotree("getText")+"&lxsh.gydwdm="+$('#gydw').combotree("getValue")+
			"&lxsh.qdzh="+$('#qdzh').val()+"&lxsh.zdzh="+$('#zdzh').val()+"&lxsh.jsjsdj="+$('#jsjsdj').val()+
			"&lxsh.lc="+$('#lc').val()+"&lxsh.xjsdj="+$('#xjsdj').val()+"&lxsh.jsxz="+$('#jsxz').val()+"&lxsh.qdmc="+$('#qdmc').val()+
			"&lxsh.zdmc="+$('#zdmc').val()+"&lxsh.bzys="+"&lxsh.sffirst=0"+"&lxsh.jdbs=1"+"&lxsh.gpsqdzh="+$('#gpsqdzh').val()+
			"&lxsh.gpszdzh="+$('#gpszdzh').val()+"&lxsh.xmlx=lmgz"+"&lxsh.yilc="+$('#yilc').val()+"&lxsh.erlc="+$('#erlc').val()+
			"&lxsh.sanlc="+$('#sanlc').val()+"&lxsh.silc="+$('#silc').val()+"&lxsh.dwlc="+$('#dwlc').val()+"&lxsh.wllc="+$('#wllc').val();
		$.ajax({
			type:'post',
			url:'/jxzhpt/qqgl/insertLx1.do',
	        data:params,
			dataType:'json',
			success:function(msg){
				if(msg.result=="true"){
					alert("保存成功！");
					if(YMLib.Var.sq=="sq"){
						parent.showAlllmgz();
					}else{
						parent.showAlllmsh();
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
		if(parseFloat($("#qdzh").val())>parseFloat(zdStr)){
			alert("起点桩号不能大于止点桩号");
			$("#qdzh").val(qdStr);
		}
		if(parseFloat($("#zdzh").val())<parseFloat(qdStr)){
			alert("止点桩号不能小于起点桩号");
			$("#zdzh").val(zdStr);
		}
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
		var yi=0;
		if($('#jhyilc').val()!="" && $('#jhyilc').val()!="0")
			yi = getbzcs($("#lxbm").val().substr(0,1),"一级",$('#jhyilc').val(),'升级改造工程项目');
		var er=0;
		if($('#jherlc').val()!="" && $('#jherlc').val()!="0")
			er = getbzcs($("#lxbm").val().substr(0,1),"二级",$('#jherlc').val(),'升级改造工程项目');
		var san=0;
		if($('#jhsanlc').val()!="" && $('#jhsanlc').val()!="0")
			san = getbzcs($("#lxbm").val().substr(0,1),"三级",$('#jhsanlc').val(),'升级改造工程项目');
		var si=0;
		if($('#jhsilc').val()!="" && $('#jhsilc').val()!="0")
			si = getbzcs($("#lxbm").val().substr(0,1),"四级",$('#jhsilc').val(),'升级改造工程项目');
		var dw=0;
		if($('#jhdwlc').val()!="" && $('#jhdwlc').val()!="0")
			dw = getbzcs($("#lxbm").val().substr(0,1),"等外",$('#jhdwlc').val(),'升级改造工程项目');
		var wl=0;
		if($('#jhwllc').val()!="" && $('#jhwllc').val()!="0")
			wl = getbzcs($("#lxbm").val().substr(0,1),"无",$('#jhwllc').val(),'升级改造工程项目');
		var zcs=parseFloat(yi)+parseFloat(er)+parseFloat(san)+parseFloat(si)+parseFloat(dw)+parseFloat(wl);
		$('#bzcs').val(zcs);
	}
</script>
	<form action="" id="lx">
	<table style="width: 100%; background-color: #aacbf8; font-size: 12px" border="0" cellpadding="3" cellspacing="1">
		<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right"><font color='red' size='2'>*&nbsp;</font>项目编码：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="xmbm"></span>
					<input id="id" name="id" type="hidden"/>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right"><font color='red' size='2'>*&nbsp;</font>路线编码：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input name="lxbm" id="lxbm" type="text" style="width: 120px;" />
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right"><font color='red' size='2'>*&nbsp;</font>路线名称：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input name="lxmc" id="lxmc" type="text" style="width: 120px;">
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					<font color='red' size='2'>*&nbsp;</font>管养单位：
				</td>
				<td style="background-color: #ffffff; height: 25px;" align="left">
					<input type='text' id='gydw' name="gydw" style="width: 124px;">
					<input id='gydwdm' name="gydwdm" style="width: 124px;" type="hidden">
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					<font color='red' size='2'>*&nbsp;</font>行政区划：
				</td>
				<td style="background-color: #ffffff; height: 25px;" align="left" colspan="3">
					<input type='text' id='xzqh' name="xzqh" style="width: 124px;">
					<input id='xzqhdm' name="xzqhdm" style="width: 124px;" type="hidden">
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					<font color='red' size='2'>*&nbsp;</font>起点桩号：
				</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" name="qdzh" id="qdzh" style="width: 120px" onblur="changeZlc()"/>
					<input type="hidden" name="gpsqdzh" id="gpsqdzh"/>
					<span id="qd"></span>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					<font color='red' size='2'>*&nbsp;</font>止点桩号：
				</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" name="zdzh"id="zdzh" style="width: 120px" onblur="changeZlc()"/><br/>
					<input type="hidden" name="gpszdzh" id="gpszdzh"/>
					<span id="zd"></span>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					<font color='red' size='2'>*&nbsp;</font>里程：
				</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input name="lc" id="lc" type="text" style="width: 100px;"/>&nbsp;公里
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					<font color='red' size='2'>*&nbsp;</font>起点名称：
				</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input name="qdmc" id="qdmc" type="text" style="width: 120px;">
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					<font color='red' size='2'>*&nbsp;</font>止点名称：
				</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input name="zdmc" id="zdmc" type="text" style="width: 120px;"/>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					<font color='red' size='2'>*&nbsp;</font>建设性质：
				</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input name="jsxz" id="jsxz" style="width:120px" value='升级改造' type="text"/>
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					现技术等<br/>级及里程
				</td>
				<td style="background-color: #ffffff; height: 20px;" align="left" colspan="5">
					一级：<input id="yilc" name="yilc" style="width: 50px;" type="text"/>
					二级：<input id="erlc" name="erlc" style="width: 50px;" type="text"/>
					三级：<input id="sanlc" name="sanlc" style="width: 50px;" type="text"/>
					四级：<input id="silc" name="silc" style="width: 50px;" type="text"/>
					等外：<input id="dwlc" name="dwlc" style="width: 50px;" type="text"/>
					无路：<input id="wllc" name="wllc" style="width: 50px;" type="text"/>
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					<font color='red' size='2'>*&nbsp;</font>建设技术等级：
				</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input id="jsjsdj" name="jsjsdj" type="text" style="width: 120px;"/>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					<font color='red' size='2'>*&nbsp;</font>现状技术等级：
				</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input name="xjsdj" id="xjsdj" type="text" style="width: 120px;"/>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
<!-- 					<font color='red' size='2'>*&nbsp;</font>补助测算(万元)： -->
				</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
<!-- 					<input id="bzcs" name="bzcs" type="text" style="width: 120px;"/> -->
				</td>
			</tr>
			<tr style="height: 35px;">
				<td colspan="6" style="background-color: #ffffff;"align="center">
				<a href="javascript:updateLx()" id="save_button" class="easyui-linkbutton" plain="true" iconCls="icon-save">保存</a>
				<a href="# "  onclick="removes('lxxx')" class="easyui-linkbutton"  plain="true" iconCls="icon-cancel">取消</a></td>
			</tr>
	</table>
	</form>
</body>
</html>