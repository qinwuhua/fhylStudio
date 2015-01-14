<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>基础库管理危桥改造项目</title>
<link rel="stylesheet" type="text/css" href="../../../easyui/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="../../../easyui/themes/icon.css" />
<script type="text/javascript" src="../../../easyui/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="../../../easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../../../easyui/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="../../../js/YMLib.js"></script>
<script type="text/javascript" src="../js/Datagrid.js"></script>
<script type="text/javascript">
$(function(){
	selWqgzById();
	$("#qx_window").click(function(){
		parent.$('#sck_ck').window('destroy');
	});	
});

function selWqgzById(){
	$.ajax({
		type : 'post',
		url : '/jxzhpt/xmsck/selectSckwqgzById.do',
		data :"sckid="+parent.rowid,
		dataType:'json',
		success : function(msg) {
		$("#qlbh").html(msg.qlbh);
		$("#qlmc").html(msg.qlmc);
		$("#qlzxzh").html(msg.qlzxzh);
		$("#gydw").html(msg.gydw);
		$("#xzqhdm").html(msg.xzqhdm);
		$("#xzqhmc").html(msg.xzqhmc);
		$("#lxmc").html(msg.lxmc);
		$("#lxbm").html(msg.lxbm);
		$("#kjzc").html(msg.kjzc);
		$("#qlqc").html(msg.qlqc);
		$("#qlkd").html(msg.qlkd);
		$("#dkzdkj").html(msg.dkzdkj);
		$("#jsdj").html(msg.jsdj);
		$("#pddj").html(msg.pddj);
		$("#xjgjnd").html(msg.xjgjnd);
		$("#akjfl").html(msg.akjfl);
		$("#sbjgxs").html(msg.sbjgxs);
		$("#xmnf").html(msg.xmnf);
		$("#xmtype").html(msg.xmtype);
		$("#bhnr").html(msg.bhnr);
		$("#bz").html(msg.bz);
		
		$("#fapgdw").html(msg.fapgdw);
		$("#fascdw").html(msg.fascdw);
		$("#faspsj").html(msg.faspsj);
		$("#spwh").html(msg.spwh);
		$("#tzgs").html(msg.tzgs);
		$("#jsxz").html(msg.jsxz);
		$("#jsnr").html(msg.jsnr);
		$("#scbz").html(msg.scbz);
		}
	});
}		
</script>
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
<table style="width: 98%; margin-top: 15px;margin-left: 10px; background-color: #aacbf8; font-size: 12px"
			border="0" cellpadding="3" cellspacing="1">
			<tr style="height: 25px;">
				<td colspan="6" style="border-style: none none solid none; border-width: 1px; color: #55BEEE; font-weight: bold; font-size: small; text-align: left; background-color: #F1F8FF; width: 15%; padding-left: 10px;">
					危桥改造项目基本信息
				</td>
			</tr>
			<tr>
				<td style="background-color: #ffffff; height: 20px;width:15%" align="right">桥梁编码：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="qlbh"></span></td>
				<td style="background-color: #ffffff; height: 20px;width:15%" align="right">桥梁名称：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="qlmc"></span></td>
					<td style="background-color: #ffffff; height: 20px;width:15%" align="right">桥梁中心桩号：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="qlzxzh"></span></td>
			</tr>
			<tr>
				<td style="background-color: #ffffff; height: 20px;width:15%" align="right">管养单位：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="gydw"></span></td>
				<td style="background-color: #ffffff; height: 20px;" align="right">行政区划代码：</td>
				<td style="background-color: #ffffff; height: 20px;width:15%" align="left">
					<span id="xzqhdm"></span></td>
					<td style="background-color: #ffffff; height: 20px;width:15%" align="right">行政区划名称：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="xzqhmc"></span></td>
			</tr>
			<tr>
				<td style="background-color: #ffffff; height: 20px;width:15%" align="right">路线名称：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="lxmc"></span></td>
				<td style="background-color: #ffffff; height: 20px;" align="right">路线编码：</td>
				<td style="background-color: #ffffff; height: 20px;width:15%" align="left">
					<span id="lxbm"></span></td>
					<td style="background-color: #ffffff; height: 20px;width:15%" align="right">跨径总长(米)：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="kjzc"></span></td>
			</tr>
			<tr>
				<td style="background-color: #ffffff; height: 20px;width:15%" align="right">桥梁全长(米)：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="qlqc"></span></td>
				<td style="background-color: #ffffff; height: 20px;" align="right">桥梁全宽(米)：</td>
				<td style="background-color: #ffffff; height: 20px;width:15%" align="left">
					<span id="qlkd"></span></td>
					<td style="background-color: #ffffff; height: 20px;width:15%" align="right">单孔最大跨径(米)：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="dkzdkj"></span></td>
			</tr>
			<tr>
				<td style="background-color: #ffffff; height: 20px;width:15%" align="right">技术等级：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="jsdj"></span></td>
				<td style="background-color: #ffffff; height: 20px;" align="right">评定等级：</td>
				<td style="background-color: #ffffff; height: 20px;width:15%" align="left">
					<span id="pddj"></span></td>
					<td style="background-color: #ffffff; height: 20px;width:15%" align="right">修建/改建年度：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="xjgjnd"></span></td>
			</tr>
			<tr>
				<td style="background-color: #ffffff; height: 20px;width:15%" align="right">按跨径分类：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="akjfl"></span></td>
				<td style="background-color: #ffffff; height: 20px;" align="right">上部结构形式：</td>
				<td style="background-color: #ffffff; height: 20px;width:15%" align="left">
					<span id="sbjgxs"></span></td>
					<td style="background-color: #ffffff; height: 20px;width:15%" align="right">特殊地区：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="tsdq"></span>
				</td>
			</tr>
			<tr>
				<td style="background-color: #ffffff; height: 20px;width:15%" align="right">项目年份：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="xmnf"></span></td>
				<td style="background-color: #ffffff; height: 20px;" align="right">项目状态：</td>
				<td style="background-color: #ffffff; height: 20px;width:15%" align="left">
					<span id="xmtype"></span></td>
				<td colspan="2" style="background-color: #ffffff; height: 20px;width:15%" align="left"></td>
			</tr>
			<tr>
				<td style="background-color: #ffffff; height: 30px;width:15%" align="right">病害内容：</td>
				<td colspan="5" style="background-color: #ffffff; height: 30px;" align="left">
					<span id="bhnr"></span>
				</td>
			</tr>
			<tr>
				<td style="background-color: #ffffff; height: 30px;width:15%" align="right">备&nbsp;&nbsp;注：</td>
				<td colspan="5" style="background-color: #ffffff; height: 30px;" align="left">
					<span id="bz"></span>
				</td>
			</tr>
			<tr style="height: 25px;">
				<td colspan="6" style="border-style: none none solid none; border-width: 1px; color: #55BEEE; font-weight: bold; font-size: small; text-align: left; background-color: #F1F8FF; width: 15%; padding-left: 10px;">
					危桥改造项目基本信息
				</td>
			</tr>
			<tr>
				<td style="background-color: #ffffff; height: 20px;width:15%" align="right">方案评估单位：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="fapgdw"></span></td>
				<td style="background-color: #ffffff; height: 20px;width:15%" align="right">方案审查单位：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="fascdw"></span></td>
					<td style="background-color: #ffffff; height: 20px;width:15%" align="right">方案审批时间：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="faspsj"></span></td>
			</tr>
			<tr>
				<td style="background-color: #ffffff; height: 20px;width:15%" align="right">审批文号：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="spwh"></span></td>
				<td style="background-color: #ffffff; height: 20px;width:15%" align="right">投资估算：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="tzgs"></span></td>
					<td style="background-color: #ffffff; height: 20px;width:15%" align="right">建设性质：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="jsxz"></span>
				</td>
			</tr>
				<tr>
				<td style="background-color: #ffffff; height: 30px;width:15%" align="right">建设内容：</td>
				<td colspan="5" style="background-color: #ffffff; height: 30px;" align="left">
					<span id="jsnr"></span>
				</td>
			</tr>
			<tr>
				<td style="background-color: #ffffff; height: 30px;width:15%" align="right">备&nbsp;&nbsp;注：</td>
				<td colspan="5" style="background-color: #ffffff; height: 30px;" align="left">
					<span id="scbz"></span>
				</td>
			</tr>
			<tr>
				<td colspan="6" style="background-color: #ffffff; height: 35px;"
					align="center"> <a href="javascript:void(0)" id="qx_window"
					class="easyui-linkbutton" plain="true" iconCls="icon-ok">确定</a></td>
			</tr>
			</table>
</body>
</html>