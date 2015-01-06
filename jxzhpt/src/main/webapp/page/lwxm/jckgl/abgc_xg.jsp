<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>基础库管理安保工程项目修改</title>
<link rel="stylesheet" type="text/css" href="../../../easyui/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="../../../easyui/themes/icon.css" />
<script type="text/javascript" src="../../../easyui/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="../../../easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../../../easyui/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="../../../js/YMLib.js"></script>
<script type="text/javascript" src="../js/Menu.js"></script>
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
		selAbgcById();
		$("#save_button").click(function(){
			var data ="id="+parent.rowid+"&lxbm="+$("#lxbm").val()+"&lxmc="+$("#lxmc").val()+"&gydw="+$("#gydw").val()+"&gydwbm="+1101+"&qdzh="+$("#qdzh").val()
			+"&zdzh="+$("#zdzh").val()+"&qzlc="+$("#qzlc").val()+"&xzqhdm="+$("#xzqhdm").val()+"&xzqhmc="+$("#xzqhmc").val()+"&gjxjnd="+$("#xjnd").val()+
			"&lxjsdj="+$("#lxjsdj").val()+"&yhlc="+$("#yhlc").val()+"&xmnf="+$("#xmnf").val()+"&xmtype="+$("#xmtype").val()+"&yhnr="+$("#yhnr").val()+"&bz="+$("#bz").val();
			alert(data);
			$.ajax({
				type:'post',
				url:'/jxzhpt/xmjck/updateAbgc.do',
		        data:data,
				dataType:'json',
				success:function(msg){
					if(Boolean(msg)){
						alert("保存成功！");
						parent.$('#jck_add').window('destroy');	
					}else{
						alert('保存失败！');
					}
				}
			});
			
		});
		$("#qx_window").click(function(){
			parent.$('#jck_xg').window('destroy');
		});	
	});
	function selAbgcById(){
		$.ajax({
			type : 'post',
			url : '/jxzhpt/xmjck/selectAbgcById.do',
			data :"id="+parent.rowid,
			dataType:'json',
			success : function(msg) {
			$("#lxbm").val(msg.lxbm);
			$("#lxmc").val(msg.lxmc);
			$("#gydw").combotree('setValue',msg.gydw);
			$("#gydw").val(msg.gydw);
			$("#qdzh").val(msg.qdzh);
			$("#zdzh").val(msg.zdzh);
			$("#qzlc").val(msg.qzlc);
			$("#xzqhdm").val(msg.xzqhdm);
			$("#xzqhmc").combotree('setValue',msg.xzqhmc);
			$("#xzqhmc").val(msg.xzqhmc);
			$("#xjnd").val(msg.gjxjnd);
			$("#lxjsdj").val(msg.lxjsdj);
			$("#yhlc").val(msg.yhlc);
			$("#xmnf").val(msg.xmnf);
			$("#xmtype").val(msg.xmtype);
			$("#yhnr").val(msg.yhnr);
			$("#bz").val(msg.bz);
			}
		});
	}		
</script>


<table style="width: 98%; margin-top: 15px;margin-left: 10px; background-color: #aacbf8; font-size: 12px"
			border="0" cellpadding="3" cellspacing="1">
			<tr>
				<td style="background-color: #ffffff; height: 20px;width:15%" align="right">路线编码：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" name="lxbm" id="lxbm" style="width: 156px"/></td>
				<td style="background-color: #ffffff; height: 20px;" align="right">路线名称：</td>
				<td style="background-color: #ffffff; height: 20px;width:15%" align="left">
					<input type="text" id="lxmc" name="lxmc"  style="width: 156px"/></td>
					<td style="background-color: #ffffff; height: 20px;width:15%" align="right">管养单位：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input  id="gydw" style="width: 156px"/></td>
			</tr>
			<tr>
				<td style="background-color: #ffffff; height: 20px;width:15%" align="right">起点桩号：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" name="qdzh" id="qdzh" style="width: 156px"/></td>
				<td style="background-color: #ffffff; height: 20px;" align="right">止点桩号：</td>
				<td style="background-color: #ffffff; height: 20px;width:15%" align="left">
					<input type="text" name="zdzh"id="zdzh" style="width: 156px"/></td>
					<td style="background-color: #ffffff; height: 20px;width:15%" align="right">总里程：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input  type="text" id="qzlc" style="width: 156px"/></td>
			</tr>
			<tr>
				<td style="background-color: #ffffff; height: 20px;width:15%" align="right">行政区划代码：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" name="xzqhdm" id="xzqhdm" style="width: 156px"/></td>
				<td style="background-color: #ffffff; height: 20px;" align="right">行政区划名称：</td>
				<td style="background-color: #ffffff; height: 20px;width:15%" align="left">
					<input type="text" name="xzqhmc"id="xzqhmc" style="width: 156px"/></td>
					<td style="background-color: #ffffff; height: 20px;width:15%" align="right">修建/改建年度：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input  id="xjnd" style="width: 156px"/></td>
			</tr>
			<tr>
				<td style="background-color: #ffffff; height: 20px;width:15%" align="right">路线技术等级：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" name="lxjsdj" id="lxjsdj" style="width: 156px" /></td>
				<td style="background-color: #ffffff; height: 20px;" align="right">隐患里程：</td>
				<td style="background-color: #ffffff; height: 20px;width:15%" align="left">
					<input type="text" name="yhlc"id="yhlc" style="width: 156px"/></td>
					<td style="background-color: #ffffff; height: 20px;width:15%" align="right">特殊地区：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="tsdq"></span>
				</td>
			</tr>
			<tr>
				<td style="background-color: #ffffff; height: 20px;width:15%" align="right">项目年份：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" name="xmnf" id="xmnf" style="width: 156px"/></td>
				<td style="background-color: #ffffff; height: 20px;" align="right">项目状态：</td>
				<td style="background-color: #ffffff; height: 20px;width:15%" align="left">
					<input type="text" name="xmtype"id="xmtype" style="width: 156px" /></td>
				<td colspan="2" style="background-color: #ffffff; height: 20px;width:15%" align="left"></td>
			</tr>
			<tr>
				<td style="background-color: #ffffff; height: 20px;width:15%" align="right">隐患内容：</td>
				<td colspan="5" style="background-color: #ffffff; height: 20px;" align="left">
					<textarea id="yhnr" rows="2"  style="width:99%"></textarea>
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
					class="easyui-linkbutton" plain="true" iconCls="icon-save">保存</a>
					 <a href="javascript:void(0)" id="qx_window"
					class="easyui-linkbutton" plain="true" iconCls="icon-cancel" >取消</a></td>
			</tr>
			</table>
</body>
</html>