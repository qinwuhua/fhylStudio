<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>基础库管理安保工程项目</title>
<link rel="stylesheet" type="text/css" href="../../../easyui/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="../../../easyui/themes/icon.css" />
<script type="text/javascript" src="../../../easyui/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="../../../easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../../../easyui/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="../../../js/YMLib.js"></script>
<script type="text/javascript" src="../js/Menu.js"></script>
<script type="text/javascript" src="../js/Datagrid.js"></script>
<script type="text/javascript">
	$(function(){
		selAbgcById();
		$("#save_button").click(function(){
			var data ="sckid="+parent.rowid+"&scqdzh="+$("#scqdzh").val()+"&sczdzh="+$("#sczdzh").val()+"&sczlc="+$("#sczlc").val()+"&scyhlc="+$("#scyhlc").val()
			+"&fapgdw="+$("#fapgdw").val()+"&fascdw="+$("#fascdw").val()+"&faspsj="+$("#faspsj").datebox('getValue')+"&spwh="+$("#spwh").val()+"&tzgs="+$("#tzgs").val()+
			"&jsxz="+$("#jsxz").val()+"&jsnr="+$("#jsnr").val()+"&scbz="+$("#scbz").val();
			alert(data);
			$.ajax({
				type:'post',
				url:'/jxzhpt/xmsck/updateSckabgc.do',
		        data:data,
				dataType:'json',
				success:function(msg){
					if(Boolean(msg)){
						parent.$("#grid").datagrid('reload');
						alert("修改成功！");
						parent.$('#sck_xg').window('destroy');
						
					}else{
						alert('保存失败！');
					}
				}
			});  
		});
		$("#qx_window").click(function(){
			parent.$('#sck_xg').window('destroy');
		});	
	});
	
	function selAbgcById(){
		$.ajax({
			type : 'post',
			url : '/jxzhpt/xmsck/selectSckabgcById.do',
			data :"sckid="+parent.rowid,
			dataType:'json',
			success : function(msg) {
			$("#lxbm").html(msg.lxbm);
			$("#lxmc").html(msg.lxmc);
			$("#gydw").html(msg.gydw);
			$("#qdzh").html(msg.qdzh);
			$("#zdzh").html(msg.zdzh);
			$("#qzlc").html(msg.qzlc);
			$("#xzqhdm").html(msg.xzqhdm);
			$("#xzqhmc").html(msg.xzqhmc);
			$("#gjxjnd").html(msg.gjxjnd);
			$("#lxjsdj").html(msg.lxjsdj);
			$("#yhlc").html(msg.yhlc);
			$("#xmnf").html(msg.xmnf);
			$("#xmtype").html(msg.xmtype);
			$("#yhnr").html(msg.yhnr);
			$("#bz").html(msg.bz);
			
			$("#scqdzh").val(msg.scqdzh);
			$("#sczdzh").val(msg.sczdzh);
			$("#sczlc").val(msg.sczlc);
			$("#scyhlc").val(msg.scyhlc);
			$("#fapgdw").val(msg.fapgdw);
			$("#fascdw").val(msg.fascdw);
			$("#faspsj").datebox('setValue',msg.faspsj);
			$("#spwh").val(msg.spwh);
			$("#tzgs").val(msg.tzgs);
			$("#jsxz").val(msg.jsxz);
			$("#jsnr").val(msg.jsnr);
			$("#scbz").val(msg.scbz);
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
					安保工程项目基本信息
				</td>
			</tr>
			<tr style="height: 25px;">
				<td style="background-color: #ffffff;width:15%" align="right">路线编码：</td>
				<td style="background-color: #ffffff;" align="left">
					<span id="lxbm"></span>
				<td style="background-color: #ffffff;width:15%" align="right">路线名称：</td>
				<td style="background-color: #ffffff;" align="left">
					<span id="lxmc"></span>
					<td style="background-color: #ffffff; width:15%" align="right">管养单位：</td>
				<td style="background-color: #ffffff; " align="left">
					<span id="gydw"></span>
			</tr>
			<tr style="height: 25px;">
				<td style="background-color: #ffffff; width:15%" align="right">起点桩号：</td>
				<td style="background-color: #ffffff; " align="left">
					<span id="qdzh"></span>
				<td style="background-color: #ffffff; width:15%" align="right">止点桩号：</td>
				<td style="background-color: #ffffff; " align="left">
					<span id="zdzh"></span>
					<td style="background-color: #ffffff; width:15%" align="right">总里程：</td>
				<td style="background-color: #ffffff; " align="left">
					<span id="qzlc"></span>
			</tr>
			<tr style="height: 25px;">
				<td style="background-color: #ffffff; width:15%" align="right">行政区划代码：</td>
				<td style="background-color: #ffffff; " align="left">
					<span id="xzqhdm"></span>
				<td style="background-color: #ffffff; width:15%" align="right">行政区划名称：</td>
				<td style="background-color: #ffffff; "align="left">
					<span id="xzqhmc"></span>
					<td style="background-color: #ffffff; width:15%" align="right">修建/改建年度：</td>
				<td style="background-color: #ffffff; " align="left">
					<span id="gjxjnd"></span>
			</tr>
			<tr style="height: 25px;">
				<td style="background-color: #ffffff; width:15%" align="right">路线技术等级：</td>
				<td style="background-color: #ffffff; " align="left">
					<span id="lxjsdj"></span>
				<td style="background-color: #ffffff; width:15%" align="right">隐患里程：</td>
				<td style="background-color: #ffffff; " align="left">
					<span id="yhlc"></span>
					<td style="background-color: #ffffff; width:15%" align="right">特殊地区：</td>
				<td style="background-color: #ffffff; " align="left">
					<span id="tsdq"></span>
				</td>
			</tr>
			<tr style="height: 25px;">
				<td style="background-color: #ffffff; width:15%" align="right">项目年份：</td>
				<td style="background-color: #ffffff; " align="left">
					<span id="xmnf"></span>
				<td style="background-color: #ffffff; width:15%" align="right">项目状态：</td>
				<td style="background-color: #ffffff; " align="left">
					<span id="xmtype"></span>
				<td colspan="2" style="background-color: #ffffff; height: 20px;" align="left"></td>
			</tr>
			<tr style="height: 30px;">
				<td style="background-color: #ffffff;width:15%" align="right">隐患内容：</td>
				<td colspan="5" style="background-color: #ffffff;" align="left">
					<span id="yhnr"></span>
				</td>
			</tr>
			<tr style="height: 30px;">
				<td style="background-color: #ffffff; width:15%" align="right">备&nbsp;&nbsp;注：</td>
				<td colspan="5" style="background-color: #ffffff;" align="left">
					<span id="bz"></span>
				</td>
			</tr>
			<tr style="height: 25px;">
				<td colspan="6" style="border-style: none none solid none; border-width: 1px; color: #55BEEE; font-weight: bold; font-size: small; text-align: left; background-color: #F1F8FF; width: 15%; padding-left: 10px;">
					安保工程项目审查信息
				</td>
			</tr>
			<tr>
				<td style="background-color: #ffffff; height: 20px;width:15%" align="right">起点桩号：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" name="scqdzh" id="scqdzh" style="width: 150px"/></td>
				<td style="background-color: #ffffff; height: 20px;width:15%" align="right">止点桩号：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" name="sczdzh"id="sczdzh" style="width: 156px"/></td>
					<td style="background-color: #ffffff; height: 20px;width:15%" align="right">总里程：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" name="sczlc"id="sczlc" style="width: 110px"/>&nbsp;公里
				</td>
			</tr>
			<tr>
				<td style="background-color: #ffffff; height: 20px;width:15%" align="right">隐患里程：</td>
				<td colspan="5" style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" id="scyhlc" style="width: 150px"/>&nbsp;公里
				</td>
			</tr>
			<tr>
				<td style="background-color: #ffffff; height: 20px;width:15%" align="right">方案评估单位：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" name="fapgdw" id="fapgdw" style="width: 150px"/></td>
				<td style="background-color: #ffffff; height: 20px;width:15%" align="right">方案审查单位：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" name="fascdw"id="fascdw" style="width: 156px"/></td>
					<td style="background-color: #ffffff; height: 20px;width:15%" align="right">方案审批时间：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" id="faspsj"  class="easyui-datebox"/>
				</td>
			</tr>
			<tr>
				<td style="background-color: #ffffff; height: 20px;width:15%" align="right">审批文号：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" name="spwh" id="spwh" style="width: 150px"/></td>
				<td style="background-color: #ffffff; height: 20px;width:15%" align="right">投资估算：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" name="tzgs"id="tzgs" style="width: 115px"/>&nbsp;万元</td>
					<td style="background-color: #ffffff; height: 20px;width:15%" align="right">建设性质：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<select id="jsxz">
						<option value="中修"selected>中修</option>
						<option value="大修">大修</option>
						<option value="改建">改建</option>
					</select>
				</td>
			</tr>
				<tr>
				<td style="background-color: #ffffff; height: 20px;width:15%" align="right">建设内容：</td>
				<td colspan="5" style="background-color: #ffffff; height: 20px;" align="left">
					<textarea id="jsnr"rows="2"  style="width:99%">修复工程</textarea>
				</td>
			</tr>
			<tr>
				<td style="background-color: #ffffff; height: 20px;width:15%" align="right">备&nbsp;&nbsp;注：</td>
				<td colspan="5" style="background-color: #ffffff; height: 20px;" align="left">
					<textarea id="scbz" rows="2" style="width:99%"></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="6" style="background-color: #ffffff; height: 35px;"
					align="center"><a href="javascript:void(0)" id="save_button"
					class="easyui-linkbutton" plain="true" iconCls="icon-save">保存</a> <a
					href="javascript:void(0)" id="qx_window"
					class="easyui-linkbutton" plain="true" iconCls="icon-cancel">取消</a></td>
			</tr>
			</table>
</body>
</html>