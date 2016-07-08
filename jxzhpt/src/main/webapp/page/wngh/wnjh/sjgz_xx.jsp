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
	$(function(){
		var data=parent.obj;
		$("#lxbm").html(data.ghlxbh);
		$("#lxmc").html(data.lxmc);
		$("#xmmc").html(data.xmmc);
		$("#xmmc").html(data.xmmc);
		$("#qdzh").html(data.minqdzh);
		$("#zdzh").html(data.maxzdzh);
		$("#lc").html(data.lc);
		$("#jhlc").html(data.jhlc);
		$("#qdmc").html(data.qdmc);
		$("#zdmc").html(data.zdmc);
		$("#jsxz").html(data.jsxz);
		$("#gydw").html(data.gydw);
		$("#xzqh").html(data.xzqh);
		$("#tsdq").html(data.tsdq);
		$("#jsjsdj").html(data.jsjsdj);
		$("#xjsdj").html(data.xjsdj);
		$("#xmbm").html(data.xmbm);
		$("#xmnf").html(data.xmnf);
		$("#jhkgn").html(data.jhkgn);
		$("#jhwgn").html(data.jhwgn);
		$("#tz").html(data.tz);
		$("#bzcs").html(data.bzys);
		$("#dfzc").html(data.dfzc);
		
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
		$('#yhdk').html(data.yhdk);
		$('#gz').html(data.gz);
		$('#sz').html(data.sz);
		$("#bz").html(data.bz);
		sfylx();
		getghxx(data.id);
		getghxxone(parent.obj.id,parent.obj.qdzh,parent.obj.zdzh);
	});
	function getghxx(xmid){
		$.ajax({
			type:'post',
			url:'/jxzhpt/qqgl/getghxx.do',
			data:"xmsq.xmbm="+xmid+"&xmsq.jsxz=wn",
			dataType:'json',
			success:function(msg){
				$("#ghlx").html(msg.ghlxbm);
				
			},
			error : function(){
			 YMLib.Tools.Show('未检索到数据错误！error code = 404',3000);
		 }
		});	
	}
	function sfylx(){
		var data="lxsh.xmbm="+parent.obj.id;
		$.ajax({
			type:'post',
			url:'/jxzhpt/qqgl/sfywnlx.do',
			data:data,
			dataType:'json',
			success:function(msg){
				if(msg.shzt>0){
					$("#lxxx").attr('style','height: 35px;');
					$("#lxxx1").attr('style','');
					setlx();
				}
			},
			error : function(){
			 YMLib.Tools.Show('未检索到数据错误！error code = 404',3000);
		 }
		});	
	}
	function setlx(){
		$('#table_lx').datagrid({
    		url:'/jxzhpt/qqgl/selectwnSjlxList.do',
    		 queryParams: {
    			 	jdbs:0,
    			 	'lxsh.xmbm':parent.obj.id
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
			    {field:'jhlc',title:'里程',width:60,align:'center'}
			]]
    	});

	}
	function getghxxone(xmid,qdzh,zdzh){
		$.ajax({
			type:'post',
			url:'/jxzhpt/qqgl/getghxxbyone.do',
			data:"xmsq.xmbm="+xmid+"&xmsq.qdzh="+qdzh+"&xmsq.zdzh="+zdzh+"&xmsq.jsxz=wn",
			dataType:'json',
			success:function(msg){
				$("#ghlxbm").val(msg.ghlxbm);
				$("#ghqdzh").val(msg.ghqdzh);
				$("#ghzdzh").val(msg.ghzdzh);
			},
			error : function(){
			 YMLib.Tools.Show('未检索到数据错误！error code = 404',3000);
		 }
		});	
	}
</script>
<table style="width: 100%; background-color: #aacbf8; font-size: 12px"
			border="0" cellpadding="3" cellspacing="1">
			<tr style="height: 30px;">
            	<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					规划路线编码</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input id="ghlxbm" name="ghlxbm" type="text" style="width: 120px;"/>&nbsp;<span style="color: red;">*</span>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					规划起点桩号</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input id="ghqdzh" name="ghqdzh" type="text" style="width: 120px;"/>&nbsp;<span style="color: red;">*</span>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">
					规划止点桩号</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input id="ghzdzh" name="ghzdzh" type="text" style="width: 80px;"/>&nbsp;米&nbsp;<span style="color: red;">*</span>
				</td>
            </tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:150px" align="right">
					路线编码：</td>
				<td style="background-color: #ffffff; height: 20px;width:200px;" align="left">
					<span id="lxbm" ></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:150px" align="right">
					路线名称：</td>
				<td style="background-color: #ffffff; height: 20px;width:200px;" align="left">
					<span id="lxmc"></span>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:150px" align="right">
					起点桩号：</td>
				<td style="background-color: #ffffff; height: 20px;width:200px;" align="left">
					<span id="qdzh" ></span>
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:150px" align="right">
					止点桩号：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="zdzh" ></span>
				</td>
				<!-- <td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:150px" align="right">
					里程：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="lc" style="font-size: 14px">0</span>&nbsp;公里
				</td> -->
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:150px" align="right">
					起点名称：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="qdmc" style="font-size: 14px"></span>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:150px" align="right">
					止点名称：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="zdmc" style="font-size: 14px"></span>
				</td>
			</tr>
			<tr style="height: 35px;">
				
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:150px" align="right">
					现状技术等级：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="xjsdj"></span>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:150px" align="right">
					建设技术等级：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="jsjsdj"></span>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:150px" align="right">
					项目名称： </td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="xmmc" style="font-size: 14px"></span>
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					共线信息</td>
				<td colspan="5" style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<span id="ghlx"></span>
				</td>
			</tr>
			
			<tr style="height: 35px;">
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 150px; padding-right: 5px;">
					现技术等<br/>级及里程
				</td>
				<td colspan="5" style="background-color: #ffffff; height: 20px;width:200px;" align="left">
					一级：<span id="yilc"></span>
					二级：<span id="erlc"></span>
					三级：<span id="sanlc"></span>
					四级：<span id="silc" ></span>
					等外：<span id="dwlc" ></span>
					无路：<span id="wllc" ></span>
					总计：<span id="lc" style="font-size: 14px">0</span>&nbsp;公里
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 150px; padding-right: 5px;">
					建设技术<br/>等级及里程
				</td>
				<td colspan="5" style="background-color: #ffffff; height: 20px;width:200px;" align="left">
					一级：<span id="jhyilc" ></span>
					二级：<span id="jherlc" ></span>
					三级：<span id="jhsanlc"></span>
					四级：<span id="jhsilc" ></span>
					等外：<span id="jhdwlc" ></span>
					无路：<span id="jhwllc"></span>
					总计：<span id="jhlc" style="font-size: 14px">0</span>&nbsp;公里
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:150px" align="right">
					管养单位：</td>
				<td style="background-color: #ffffff; height: 25px;" align="left">
					<span id='gydw'></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:150px" align="right">
					行政区划：</td>
				<td style="background-color: #ffffff; height: 25px;" align="left">
					<span id='xzqh' ></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:150px" align="right">特殊地区：</td>
				<td style="background-color: #ffffff; height: 25px;" align="left">
					<span id="tsdq" style="font-size: 14px"></span></td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:150px" align="right">
					项目年份：
				</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="xmnf"></span>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:150px" align="right">
					计划开工年：
				</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="jhkgn"></span>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:150px" align="right">
					计划完工年：
				</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="jhwgn"></span>
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:150px" align="right">
					投资(万元)：
				</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="tz"></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:150px" align="right">
					补助测算(万元)：
				</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="bzcs">0</span>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:150px" align="right">
					地方自筹(万元)：
				</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="dfzc">0</span>
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:150px" align="right">
					银行贷款(万元)：
				</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="yhdk"></span>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:150px" align="right">
					国债(万元)：
				</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="gz"></span>
				</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:150px" align="right">
					省债(万元)：
				</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="sz"></span>
				</td>
			</tr>
			<tr style="height: 35px;">
			<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:150px" align="right">
					建设性质：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="jsxz"></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:150px" align="right"></td>
				<td style="background-color: #ffffff; height: 20px;" align="left"></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:150px" align="right">
				</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
				</td>
			</tr>
			<tr style="height: 60px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:150px" align="right">备注：</td>
				<td colspan="5" style="background-color: #ffffff; height: 20px;" align="left">
					<span id="bz" style="width: 580px;height: 50px;"></span>
				</td>
			</tr>
			<tr id="lxxx"  style="height: 35px;display: none">
				<td align="center" colspan="6" style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:150px" >
					<span>路线信息</span>
				</td>
			</tr>
			<tr id="lxxx1" style="height: 35px;display: none">
				<td align="center" colspan="6" style="background-color:#ffffff;color: #007DB3; font-weight: bold;width:150px" >
					<div>
						<table id="table_lx"></table>
					</div>
				</td>
			</tr>
			<tr style="height: 35px;">
				<td colspan="6" style="background-color: #ffffff;"align="center">
				<a href="# "  onclick="removes('lxxx')" class="easyui-linkbutton"  plain="true" iconCls="icon-cancel">关闭</a></td>
			</tr>
			</table>
</body>
</html>