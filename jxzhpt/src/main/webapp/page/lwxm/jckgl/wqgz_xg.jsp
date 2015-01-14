<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>基础库管理危桥改造项目修改</title>
<link rel="stylesheet" type="text/css" href="../../../easyui/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="../../../easyui/themes/icon.css" />
<script type="text/javascript" src="../../../easyui/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="../../../easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../../../easyui/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="../../../js/YMLib.js"></script>
<script type="text/javascript" src="../js/Datagrid.js"></script>
<script type="text/javascript" src="../js/lwxm.js"></script>
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
	$("#gydw").combotree({
		checkbox: false,
	 	url: "../js/gydw.json",
	 	onClick:function(node){
	        $("#gydw").val(node.text);
	    	 }
	});
	$("#xzqhmc").combotree({
		checkbox: false,
	 	url: "../js/xzqh.json",
	 	onClick:function(node){
	        $("#xzqhmc").val(node.text);
	    	 }
	});
	wqgzById();
	$("#save_button").click(function(){
		var data ="qlbh="+$("#qlbh").val()+"&qlmc="+$("#qlmc").val()+"&qlzxzh="+$("#qlzxzh").val()+"&gydwbm="+$("#gydwbm").val()+"&gydw="+$("#gydw").val()
		+"&xzqhdm="+$("#xzqhdm").val()+"&xzqhmc="+$("#xzqhmc").val()+"&lxmc="+$("#lxmc").val()+"&lxbm="+$("#lxbm").val()+"&kjzc="+$("#kjzc").val()+
		"&qlqc="+$("#qlqc").val()+"&qlkd="+$("#qlkd").val()+"&dkzdkj="+$("#dkzdkj").val()+"&jsdj="+$("#jsdj").val()+"&pddj="+$("#pddj").val()+"&xjgjnd="+$("#xjgjnd").val()
		+"&akjfl="+$("#akjfl").val()+"&sbjgxs="+$("#sbjgxs").val()+"&xmnf="+$("#xmnf").val()+"&xmtype="+$("#xmtype").val()+"&bhnr="+$("#bhnr").val()+"&bz="+$("#bz").val();
		$.ajax({
			type:'post',
			url:'/jxzhpt/xmjck/updateWqgzById.do',
	        data:data,
			dataType:'json',
			success:function(msg){
				if(Boolean(msg)){
					parent.$("#grid").datagrid('reload');
					alert("修改成功！");
					parent.$('#jck_xg').window('destroy');	
				}else{
					alert('保存失败！');
				}
			},
			error : function(){
			 alert('服务器请求无响应！error code = 404');
		 }
		});
		
	});
	$("#qx_window").click(function(){
		parent.$('#jck_xg').window('destroy');
	});	
});
function wqgzById(){
	$.ajax({
		type : 'post',
		url : '/jxzhpt/xmjck/selectWqgzById.do',
		data :"id="+parent.rowid,
		dataType:'json',
		success : function(msg) {
		$("#qlbh").val(msg.qlbh);
		$("#qlmc").val(msg.qlmc);
		$("#qlzxzh").val(msg.qlzxzh);
		$("#gydw").combotree('setValue',msg.gydw);
		$("#gydw").val(msg.gydw);
		$("#gydwbm").val(msg.gydwbm);
		$("#xzqhdm").val(msg.xzqhdm);
		$("#xzqhmc").combotree('setValue',msg.xzqhmc);
		$("#xzqhmc").val(msg.xzqhmc);
		$("#lxbm").val(msg.lxbm);
		$("#lxmc").val(msg.lxmc);
		$("#kjzc").val(msg.kjzc);
		$("#qlqc").val(msg.qlqc);
		$("#qlkd").val(msg.qlkd);
		$("#dkzdkj").val(msg.dkzdkj);
		$("#jsdj").val(msg.jsdj);
		$("#pddj").val(msg.pddj);
		$("#xjgjnd").val(msg.xjgjnd);
		$("#akjfl").val(msg.akjfl);
		$("#sbjgxs").val(msg.sbjgxs);
		$("#xmnf").val(msg.xmnf);
		$("#xmtype").val(msg.xmtype);
		$("#bhnr").val(msg.bhnr);
		$("#bz").val(msg.bz);
		}
	});
}		
</script>


<table style="width: 98%; margin-top: 15px;margin-left: 10px; background-color: #aacbf8; font-size: 12px"
			border="0" cellpadding="3" cellspacing="1">
			<tr>
				<td style="background-color: #ffffff; height: 20px;width:15%" align="right">桥梁编号：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" name="qlbh"id="qlbh" style="width: 156px" /></td>
				<td style="background-color: #ffffff; height: 20px;width:15%" align="right">桥梁名称：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" name="qlmc" id="qlmc" style="width: 156px" /></td>
					<td style="background-color: #ffffff; height: 20px;width:15%" align="right">桥梁中心桩号：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" name="qlzxzh" id="qlzxzh" style="width: 156px" /></td>
			</tr>
			<tr>
				<td style="background-color: #ffffff; height: 20px;width:15%" align="right">管养单位：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input  id="gydw" style="width: 160px" />
					<input type="text" id="gydwbm" style="display:none"/></td>
				<td style="background-color: #ffffff; height: 20px;" align="right">行政区划代码：</td>
				<td style="background-color: #ffffff; height: 20px;width:15%" align="left">
					<input type="text" name="xzqhdm" id="xzqhdm" style="width: 156px" /></td>
					<td style="background-color: #ffffff; height: 20px;width:15%" align="right">行政区划名称：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input  id="xzqhmc" style="width: 160px" /></td>
			</tr>
			<tr>
				<td style="background-color: #ffffff; height: 20px;width:15%" align="right">路线名称：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" name="lxmc" id="lxmc" style="width: 156px" /></td>
				<td style="background-color: #ffffff; height: 20px;" align="right">路线编码：</td>
				<td style="background-color: #ffffff; height: 20px;width:15%" align="left">
					<input type="text" name="lxbm"id="lxbm" style="width: 156px" /></td>
					<td style="background-color: #ffffff; height: 20px;width:15%" align="right">跨径总长(米)：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" name="kjzc"id="kjzc" style="width: 156px" /></td>
			</tr>
			<tr>
				<td style="background-color: #ffffff; height: 20px;width:15%" align="right">桥梁全长(米)：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" name="qlqc" id="qlqc" style="width: 156px" /></td>
				<td style="background-color: #ffffff; height: 20px;" align="right">桥梁全宽(米)：</td>
				<td style="background-color: #ffffff; height: 20px;width:15%" align="left">
					<input type="text" name="qlkd" id="qlkd" style="width: 156px" /></td>
					<td style="background-color: #ffffff; height: 20px;width:15%" align="right">单孔最大跨径(米)：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" name="dkzdkj"id="dkzdkj" style="width: 156px" /></td>
			</tr>
			<tr>
				<td style="background-color: #ffffff; height: 20px;width:15%" align="right">技术等级：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" name="jsdj" id="jsdj" style="width: 156px" /></td>
				<td style="background-color: #ffffff; height: 20px;" align="right">评定等级：</td>
				<td style="background-color: #ffffff; height: 20px;width:15%" align="left">
					<input type="text" name="pddj"id="pddj" style="width: 156px" /></td>
					<td style="background-color: #ffffff; height: 20px;width:15%" align="right">修建/改建年度：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" name="xjgjnd"id="xjgjnd" style="width: 156px" /></td>
			</tr>
			<tr>
				<td style="background-color: #ffffff; height: 20px;width:15%" align="right">按跨径分类：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" name="akjfl" id="akjfl" style="width: 156px" /></td>
				<td style="background-color: #ffffff; height: 20px;" align="right">上部结构形式：</td>
				<td style="background-color: #ffffff; height: 20px;width:15%" align="left">
					<input type="text" name="sbjgxs"id="sbjgxs" style="width: 156px" /></td>
					<td style="background-color: #ffffff; height: 20px;width:15%" align="right">特殊地区：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="tsdq"></span>
				</td>
			</tr>
			<tr>
				<td style="background-color: #ffffff; height: 20px;width:15%" align="right">项目年份：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" name="xmnf" id="xmnf" style="width: 156px" /></td>
				<td style="background-color: #ffffff; height: 20px;" align="right">项目状态：</td>
				<td style="background-color: #ffffff; height: 20px;width:15%" align="left">
					<input type="text" name="xmtype"id="xmtype" style="width: 156px" /></td>
				<td colspan="2" style="background-color: #ffffff; height: 20px;width:15%" align="left"></td>
			</tr>
			<tr>
				<td style="background-color: #ffffff; height: 20px;width:15%" align="right">病害内容：</td>
				<td colspan="5" style="background-color: #ffffff; height: 20px;" align="left">
					<textarea id="bhnr" rows="2"  style="width:99%"></textarea>
				</td>
			</tr>
			<tr>
				<td style="background-color: #ffffff; height: 20px;width:15%" align="right">备&nbsp;&nbsp;注：</td>
				<td colspan="5" style="background-color: #ffffff; height: 20px;" align="left">
					<textarea id="bz" rows="2" style="width:99%"></textarea>
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