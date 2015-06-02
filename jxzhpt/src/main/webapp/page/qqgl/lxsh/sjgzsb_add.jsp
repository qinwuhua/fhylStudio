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
		xmnf1("xmnf");
		xmnf2("jhkgn");
		xmnf2("jhwgn");
		xmbm('xmbm',$.cookie("dist"),new Date().getFullYear())
		$("#save_button").click(function(){
			if($("#lxbm").val()=="" || $("#lxbm").val()==null){
				alert("请填写路线编码！");
				$("#lxbm").focus();
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
			}
			if(parseFloat($("#qdzh").val())*1000>parseFloat($("#zdzh").val())*1000){
				alert("对不起，起点桩号不能大于止点桩号！");
				$("#qdzh").focus();
				return false;
			}
			if(parseFloat($("#yhlc").val())*1000>parseFloat($("#zlc").html())*1000){
				alert("对不起，隐患里程不能大于总里程！");
				$("#yhlc").focus();
				return false;
			}
				var datas="lxbm="+$("#lxbm").val()+"&qdzh="+$("#qdzh").val()+"&zdzh="+$("#zdzh").val();
				$.ajax({
					type:'post',
					url:'/jxzhpt/xmjck/onceAbgc.do',
					dataType:'json',
			        data:datas,
					success:function(msg){
						if(Boolean(msg)){
							saveAbgc();
						}else{
							alert('该项目已添加过，请勿重复添加！');
						}
					}
				});
		});
		$("#qx_window").click(function(){
			parent.$('#jck_add').window('destroy');
		});	
		autoCompleteLXBM();
	});
	function autoCompleteLXBM(){
		var url = "/jxzhpt/xmjck/abgcGpsroad.do";
		$("#lxbm").autocomplete(url, {
			multiple : false,
			minChars :1,
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
	  			gydwbm:function() {
	  				var d = $.cookie("unit2");
	  				if(d=='_____36') return "";
	  				else return d;
	  			},
	  			xzqhdm:function() {
	  				var d = $.cookie("dist");
	  				if(d=='360000') return "";
	  				else return d;
	  			}
	  		},
	  		dataType : 'json',// 返回类型
	  		// 对返回的json对象进行解析函数，函数返回一个数组
	  		parse : function(data) {
	  			var aa = [];
	  			aa = $.map(eval(data), function(row) {
	  					return {
	  						data : row,
	  						value : row.lxbm.replace(/(\s*$)/g,""),
	  						result : row.lxbm.replace(/(\s*$)/g,"")
	  					};
	  				});
	  			return aa;
	  		},
	  		formatItem : function(row, i, max) {
	  			return row.lxbm.replace(/(\s*$)/g,"")+"("+row.qdzh+","+row.zdzh+")"+"<br/>"+row.lxmc.replace(/(\s*$)/g,"");
	  		}
	  	}).result(
				function(e, item) {

					if(item==undefined) return ;
					selectTSDQ(item.xzqhdm);
					$("#xzqh,#qdzh,#zdzh,#lc,#xjsdj,#gydw,#qd,#zd").attr("value",'');
					$("#lxmc").html(item.lxmc);
					$("#xzqhdm").val(item.xzqhdm);
					$("#gydwdm").val(item.gydwbm);
					$("#xzqh").html(item.xzqhmc);
					$("#qdzh").val(parseFloat(item.qdzh));
					$("#zdzh").val(parseFloat(item.zdzh));
					$("#lc").html((parseFloat($("#zdzh").val())*1000-parseFloat($("#qdzh").val())*1000)/1000);
					$("#xjnd").html(item.gjxjnd);
					$("#jsjsdj").combobox('setValue',item.lxjsdj);
					$("#xjsdj").html(item.lxjsdj);
					$("#gydw").html(item.gydw);
					$("#gydwbm").val(item.gydwbm);
					$("#xmzt").html('待上报');
					qdStr=parseFloat(item.qdzh);
					zdStr=parseFloat(item.zdzh);
					$("#qd").html("<font color='red' size='2'>*&nbsp;不能小于</font>"+"<font color='red' size='2'>"+item.qdzh);
					$("#zd").html("<font color='red' size='2'>*&nbsp;不能大于</font>"+"<font color='red' size='2'>"+item.zdzh);
				});
	}
	function saveAbgc(){
		
		var sbthcd=$.cookie("unit2").length;
		if($.cookie("unit2")=="______36"){
			sbthcd=7;
		}
		var data ="lxbm="+$("#lxbm").val()+"&lxmc="+$("#lxmc").html()+"&gydw="+$("#gydw").html()+"&gydwbm="+$("#gydwbm").val()+"&qdzh="+$("#qdzh").val()
		+"&zdzh="+$("#zdzh").val()+"&qzlc="+$("#zlc").html()+"&xzqhdm="+$("#xzqhdm").html()+"&xzqhmc="+$("#xzqhmc").html()+"&gjxjnd="+$("#xjnd").html()+"&tsdq="+$("#tsdq").html()+
		"&lxjsdj="+$("#lxjsdj").html()+"&yhlc="+$("#yhlc").val()+"&xmnf="+$("#xmnf").combobox("getValue")+"&xmtype="+$("#xmzt").html()+"&yhnr="+$("#yhnr").val()+"&bz="+$("#bz").val()
		+"&tbbmbm="+$.cookie("unit")+"&sbthcd="+sbthcd;
		$.ajax({
			type:'post',
			url:'/jxzhpt/xmjck/insertAbgc.do',
	        data:data,
			dataType:'json',
			success:function(msg){
				if(Boolean(msg)){
					parent.jckglAbgc();
					alert("保存成功！");
					parent.jckglAbgc();
					parent.$('#jck_add').window('destroy');
					
				}else{
					alert('保存失败！');
				}
			}
		});
	}
	function changeZlc(){
		var zlc=(parseFloat($("#zdzh").val())*1000000000000-parseFloat($("#qdzh").val())*1000000000000)/1000000000000;
		$("#zlc").html(zlc);
	}
	function selectTSDQ(str){
		$("#tsdq").text("");
		var data="xzqhdm1="+str;
		$.ajax({
			type:'post',
			url:'/jxzhpt/xmjck/selectTSDQ.do',
			data:data,
			dataType:'json',
			success:function(msg){
				if(msg.length>0){
					var tsdqstr="";
					for(var i=0;i<msg.length;i++){
						tsdqstr=tsdqstr+msg[i]+"、";
					}
					tsdqstr=tsdqstr.substr(0,tsdqstr.length-1);
					$("#tsdq").text(tsdqstr);
				}
			}
		});	
	}
</script>
<table style="width: 100%; background-color: #aacbf8; font-size: 12px"
			border="0" cellpadding="3" cellspacing="1">
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right"><font color='red' size='2'>*&nbsp;</font>路线编码：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input type="hidden" name="xzqhdm" id="xzqhdm" style="width: 156px" />
					<input type="hidden" name="gydwdm" id="gydwdm" style="width: 156px" />
					<input type="text" name="lxbm" id="lxbm" style="width: 156px" /></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right"><font color='red' size='2'>*&nbsp;</font>路线名称：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<span id="lxmc"></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right"><font color='red' size='2'>*&nbsp;</font>项目名称：</td>
				<td style="background-color: #ffffff; height: 20px;width:20%" align="left">
					<input type="text" id="xmmc" style="width: 156px"/></td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right"><font color='red' size='2'>*&nbsp;</font>起点桩号：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" name="qdzh" id="qdzh" style="width: 156px" onblur="changeZlc()"/><br/>
					<span id="qd"></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right"><font color='red' size='2'>*&nbsp;</font>止点桩号：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" name="zdzh"id="zdzh" style="width: 145px" onblur="changeZlc()"/><br/>
					<span id="zd"></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right"><font color='red' size='2'>*&nbsp;</font>里程：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="lc" style="font-size: 14px">0</span>&nbsp;公里</td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right"><font color='red' size='2'>*&nbsp;</font>起点名称：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text"  id="qdmc" style="width: 156px" /><br/>
					</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right"><font color='red' size='2'>*&nbsp;</font>止点名称：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" id="zdmc" style="width: 145px" /><br/>
					</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right"><font color='red' size='2'>*&nbsp;</font>建设性质：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="jsxz" style="font-size: 14px">0</span></td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right"><font color='red' size='2'>*&nbsp;</font>管养单位：</td>
				<td style="background-color: #ffffff; height: 25px;" align="left">
					<span id="gydw" style="font-size: 14px"></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right"><font color='red' size='2'>*&nbsp;</font>行政区划：</td>
				<td style="background-color: #ffffff; height: 25px;" align="left">
					<span id="xzqh"></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right"><font color='red' size='2'>*&nbsp;</font>特殊地区：</td>
				<td style="background-color: #ffffff; height: 25px;" align="left">
					<span id="tsdq" style="font-size: 14px"></span></td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right"><font color='red' size='2'>*&nbsp;</font>建设技术等级：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<select id="jsjsdj" style="width:155px"class="easyui-combobox" data-options="panelHeight:'100'">
						<option value="一级公路">一级公路</option>
						<option value="二级公路">二级公路</option>
						<option value="三级公路">三级公路</option>
						<option value="四级公路">四级公路</option>
						<option value="等外公路">等外公路</option>
						<option value="高速公路">高速公路</option>
					</select></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right"><font color='red' size='2'>*&nbsp;</font>现状技术等级：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="xjsdj"></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right"><font color='red' size='2'>*&nbsp;</font>项目编码：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="xmbm"></span>
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right"><font color='red' size='2'>*&nbsp;</font>项目年份：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<select id="xmnf" style="width:155px"class="easyui-combobox" data-options="panelHeight:'100'">
						
					</select>
					</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right"><font color='red' size='2'>*&nbsp;</font>计划开工年：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<select id="jhkgn" style="width:155px"class="easyui-combobox" data-options="panelHeight:'100'">
						
					</select>	</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right"><font color='red' size='2'>*&nbsp;</font>计划完工年：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<select id="jhwgn" style="width:155px"class="easyui-combobox" data-options="panelHeight:'100'">
						
					</select>	</td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right"><font color='red' size='2'>*&nbsp;</font>投资：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" id="tz"/></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right"><font color='red' size='2'>*&nbsp;</font>补助测算：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
<!-- 					<span id="bzcs"></span> --><input type="text" id="bzcs"/></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right"><font color='red' size='2'>*&nbsp;</font>地方自筹：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" id="dfzc"/>
				</td>
			</tr>
			
			<tr style="height: 35px;">
				<td colspan="6" style="background-color: #ffffff;"align="center">
				<a href="javascript:void(0)" id="save_button" class="easyui-linkbutton" plain="true" iconCls="icon-save">保存</a>
				<a href="# "  onclick="remove('lxxx')" class="easyui-linkbutton"  plain="true" iconCls="icon-cancel">取消</a></td>
			</tr>
			</table>
</body>
</html>