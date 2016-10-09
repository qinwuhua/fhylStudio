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
		$("#xmmc").html(data.xmmc);
		$('#lxbh').html(data.lxbh);
		$("#qdzh").html(data.minqdzh);
		$("#zdzh").html(data.maxzdzh);
		$("#jsxz").html(data.jsxz);
		$("#xzqh").html(data.xzqh);
		$("#jsjsdj").html(data.jsjsdj);
		$("#xmbm").html(data.xmbm);
		$("#dq").html(data.dq);
		$("#dq_m").html(data.dq_m);
		$("#sd").html(data.sd);
		$("#sd_m").html(data.sd_m);
		$("#jsdw").html(data.jsdw);
		$("#bzdw").html(data.bzdw);
		$("#tzgs").html(data.tzgs);
		$("#gkpfwh").html(data.gkpfwh);
		$("#kgny").html(data.kgny);
		$("#wgny").html(data.wgny);
		$("#pfsj").html(data.pfsj);
		$('#jszlc').html(data.jszlc);
		$('#yilc').html(data.yilc);
		$('#erlc').html(data.erlc);
		$('#sanlc').html(data.sanlc);
		$('#silc').html(data.silc);
		$('#dwlc').html(data.dwlc);
		$('#wllc').html(data.wllc);
		
		$('#jhyilc').html(data.jhyilc);
		$('#jherlc').html(data.jherlc);
		$('#jhsanlc').html(data.jhsanlc);
		$('#jhsilc').html(data.jhsilc);
		$('#jhdwlc').html(data.jhdwlc);
		$('#jhwllc').html(data.jhwllc);
		$('#dfzc').html(data.dfzc);
		$('#yhdk').html(data.yhdk);
		
		$('#lc').html(data.lc);
		$('#qdmc').html(data.qdmc);
		$('#zdmc').html(data.zdmc);
		fileShow1(parent.obj.xmbm,"工可批复文件");
	}
	
	$(function(){
		load();
		sfylx();
	});
	function sfylx(){
		var data="lxsh.xmbm="+parent.obj.xmbm+"&lxsh.xmlx=sjgz"+"&lxsh.jdbs=1";
		$.ajax({
			type:'post',
			url:'/jxzhpt/qqgl/querygkxmXX.do',
			data:data,
			dataType:'json',
			success:function(msg){
				if(msg!=null){
					var data=msg;
					$("#tzsj").html(data.tzsj);
					$("#xmmc1").html(data.xmmc);
					$('#lxbh1').html(data.lxbh);
					$("#qdzh1").html(data.minqdzh);
					$("#zdzh1").html(data.maxzdzh);
					$("#jsxz1").html(data.jsxz);
					$("#xzqh1").html(data.xzqh);
					$("#jsjsdj1").html(data.jsjsdj);
					$("#xmbm1").html(data.xmbm);
					$("#dq1").html(data.dq);
					$("#dq_m1").html(data.dq_m);
					$("#sd1").html(data.sd);
					$("#sd_m1").html(data.sd_m);
					$("#jsdw1").html(data.jsdw);
					$("#bzdw1").html(data.bzdw);
					$("#tzgs1").html(data.tzgs);
					$("#gkpfwh1").html(data.gkpfwh);
					$("#kgny1").html(data.kgny);
					$("#wgny1").html(data.wgny);
					$("#pfsj1").html(data.pfsj);
					$('#jszlc1').html(data.jszlc);
					$('#yilc1').html(data.yilc);
					$('#erlc1').html(data.erlc);
					$('#sanlc1').html(data.sanlc);
					$('#silc1').html(data.silc);
					$('#dwlc1').html(data.dwlc);
					$('#wllc1').html(data.wllc);
					
					$('#jhyilc1').html(data.jhyilc);
					$('#jherlc1').html(data.jherlc);
					$('#jhsanlc1').html(data.jhsanlc);
					$('#jhsilc1').html(data.jhsilc);
					$('#jhdwlc1').html(data.jhdwlc);
					$('#jhwllc1').html(data.jhwllc);
					$('#dfzc1').html(data.dfzc);
					$('#yhdk1').html(data.yhdk);
					
					$('#lc1').html(data.lc);
					$('#qdmc1').html(data.qdmc);
					$('#zdmc1').html(data.zdmc);
					fileShow1(parent.obj.xmbm,"工可批复文件");
				}
			},
			error : function(){
			 YMLib.Tools.Show('未检索到数据错误！error code = 404',3000);
		 }
		});	
	}
	function setlx(){
		$('#table_lx').datagrid({
    		url:'/jxzhpt/qqgl/selectSjgzlxList.do',
    		 queryParams: {
    			 	jdbs:1,
    		    	xmbm:parent.obj.xmbm
    			},
			columns:[[
			    {field:'gydw',title:'管养单位',width:150,align:'center'},    
			    {field:'xzqh',title:'行政区划',width:150,align:'center'},
			    {field:'lxmc',title:'路线名称',width:120,align:'center'},
			    {field:'ghlxbh',title:'路线编码',width:100,align:'center'},
			    {field:'qdzh',title:'起点桩号',width:80,align:'center'},
			    {field:'zdzh',title:'止点桩号',width:80,align:'center'},
			    {field:'qdmc',title:'起点名称',width:100,align:'center'},
			    {field:'zdmc',title:'止点名称',width:100,align:'center'},
			    {field:'jsjsdj',title:'建设技术等级',width:80,align:'center'},
			    {field:'xjsdj',title:'现技术等级',width:80,align:'center'},
			    {field:'lc',title:'里程',width:60,align:'center'}
			]]
    	});

	}
</script>
<table style="width: 100%; background-color: #aacbf8; font-size: 12px"
			border="0" cellpadding="3" cellspacing="1">
			<tr style="height: 25px;">
				<td colspan="6" style="border-style: none none solid none; border-width: 1px; color: #55BEEE; font-weight: bold; font-size: small; text-align: left; background-color: #F1F8FF; width: 15%; padding-left: 10px;">
					变更前信息
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">项目名称：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<span id="xmmc"></span>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">项目编码：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<span id="xmbm"></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">行政区划：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<span id='xzqh'></span>
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">路线编码：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<span id="lxbh"></span>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">起点桩号：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<span id="qdzh"></span>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">止点桩号：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<span id="zdzh"></span>
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">起点名称：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<span id="qdmc"></span>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">止点名称：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<span id="zdmc"></span>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right"></td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left"></td>
			</tr>
			<tr style="height: 35px;">
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					现技术等<br/>级及里程
				</td>
				<td colspan="5" style="background-color: #ffffff; height: 20px;width:18%" align="left">
					一级：<span id="yilc"></span>
					二级：<span id="erlc"></span>
					三级：<span id="sanlc"></span>
					四级：<span id="silc"></span>
					等外：<span id="dwlc"></span>
					无路：<span id="wllc"></span>
					总计：<span id="lc"></span>
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					建设技术<br/>等级及里程
				</td>
				<td colspan="5" style="background-color: #ffffff; height: 20px;width:18%" align="left">
					一级：<span id="jhyilc"></span>
					二级：<span id="jherlc"></span>
					三级：<span id="jhsanlc"></span>
					四级：<span id="jhsilc"></span>
					等外：<span id="jhdwlc"></span>
					无路：<span id="jhwllc"></span>
					总计：<span id="jszlc"></span>
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">工可批复文号：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<span id="gkpfwh"></span>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">建设技术等级：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<span id="jsjsdj"></span>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">建设性质：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<span id="jsxz"></span>
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">特大桥（米）：</td>
				<td style="background-color: #ffffff; height: 25px;" align="left">
					<span id="dq_m"></span>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">特大桥（座）：</td>
				<td style="background-color: #ffffff; height: 25px;" align="left">
					<span id="dq"></span>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right"></td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
<!-- 					<span id="jsdw"></span> -->
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">隧道（米）：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<span id="sd_m"></span>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">隧道（座）：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<span id="sd"></span>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">编制单位：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<span id="bzdw"></span>
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">开工年月：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<span id='kgny'></span>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">完工年月：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<span id='wgny'></span>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">批复时间：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<span id="pfsj"></span>
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">投资估算：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<span id="tzgs"></span>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">地方自筹：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<span id="dfzc"></span>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">银行贷款：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<span id="yhdk"></span>
				</td>
			</tr>
			
			<tr style="height: 25px;">
				<td colspan="6" style="border-style: none none solid none; border-width: 1px; color: #55BEEE; font-weight: bold; font-size: small; text-align: left; background-color: #F1F8FF; width: 15%; padding-left: 10px;">
					变更后信息&nbsp;&nbsp;&nbsp;&nbsp;变更日期：<span id='tzsj'></span>
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">项目名称：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<span id="xmmc1"></span>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">项目编码：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<span id="xmbm1"></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">行政区划：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<span id='xzqh1'></span>
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">路线编码：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<span id="lxbh1"></span>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">起点桩号：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<span id="qdzh1"></span>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">止点桩号：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<span id="zdzh1"></span>
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">起点名称：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<span id="qdmc1"></span>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">止点名称：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<span id="zdmc1"></span>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right"></td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left"></td>
			</tr>
			<tr style="height: 35px;">
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					现技术等<br/>级及里程
				</td>
				<td colspan="5" style="background-color: #ffffff; height: 20px;width:18%" align="left">
					一级：<span id="yilc1"></span>
					二级：<span id="erlc1"></span>
					三级：<span id="sanlc1"></span>
					四级：<span id="silc1"></span>
					等外：<span id="dwlc1"></span>
					无路：<span id="wllc1"></span>
					总计：<span id="lc1"></span>
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					建设技术<br/>等级及里程
				</td>
				<td colspan="5" style="background-color: #ffffff; height: 20px;width:18%" align="left">
					一级：<span id="jhyilc1"></span>
					二级：<span id="jherlc1"></span>
					三级：<span id="jhsanlc1"></span>
					四级：<span id="jhsilc1"></span>
					等外：<span id="jhdwlc1"></span>
					无路：<span id="jhwllc1"></span>
					总计：<span id="jszlc1"></span>
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">工可批复文号：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<span id="gkpfwh1"></span>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">建设技术等级：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<span id="jsjsdj1"></span>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">建设性质：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<span id="jsxz1"></span>
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">特大桥（米）：</td>
				<td style="background-color: #ffffff; height: 25px;" align="left">
					<span id="dq_m1"></span>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">特大桥（座）：</td>
				<td style="background-color: #ffffff; height: 25px;" align="left">
					<span id="dq1"></span>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right"></td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
<!-- 					<span id="jsdw"></span> -->
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">隧道（米）：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<span id="sd_m1"></span>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">隧道（座）：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<span id="sd1"></span>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">编制单位：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<span id="bzdw1"></span>
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">开工年月：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<span id='kgny1'></span>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">完工年月：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<span id='wgny1'></span>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">批复时间：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<span id="pfsj1"></span>
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">投资估算：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<span id="tzgs1"></span>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">地方自筹：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<span id="dfzc1"></span>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">银行贷款：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<span id="yhdk1"></span>
				</td>
			</tr>
			
			<tr style="height: 35px;">
				<td colspan="6" style="background-color: #ffffff;"align="center">
				<a href="# "  onclick="removes('lxxx')" class="easyui-linkbutton"  plain="true" iconCls="icon-cancel">关闭</a></td>
			</tr>
			</table>
</body>
</html>