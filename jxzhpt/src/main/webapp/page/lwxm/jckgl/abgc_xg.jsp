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
var qdStr;
var zdStr;
	$(function(){
		selAbgcById();
		$("#save_button").click(function(){
			if(parseFloat($("#qdzh").val())*1000<qdStr*1000){
				alert("对不起，起点桩号不能小于"+qdStr+"！");
				return false;
			}
			if(parseFloat($("#zdzh").val())*1000>zdStr*1000){
				alert("对不起，止点桩号不能大于"+zdStr+"！");
				return false;
			}
			if(parseFloat($("#qdzh").val())*1000>parseFloat($("#zdzh").val())*1000){
				alert("对不起，起点桩号不能大于止点桩号！");
				return false;
			}
			if(parseFloat($("#yhlc").val())*1000>parseFloat($("#qzlc").html())*1000){
				alert("对不起，隐患里程不能大于总里程！");
				return false;
			}
			var data ="id="+parent.rowid+"&lxbm="+$("#lxbm").html()+"&lxmc="+$("#lxmc").html()+"&gydw="+$("#gydw").html()+"&qdzh="+$("#qdzh").val()
			+"&zdzh="+$("#zdzh").val()+"&qzlc="+$("#qzlc").html()+"&xzqhdm="+$("#xzqhdm").html()+"&xzqhmc="+$("#xzqhmc").html()+"&gjxjnd="+$("#xjnd").html()+
			"&lxjsdj="+$("#lxjsdj").html()+"&yhlc="+$("#yhlc").val()+"&xmnf="+$("#xmnf").html()+"&xmtype="+$("#xmtype").html()+"&yhnr="+$("#yhnr").val()+"&bz="+$("#bz").val();
			$.ajax({
				type:'post',
				url:'/jxzhpt/xmjck/updateAbgcById.do',
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
	function selAbgcById(){
		$.ajax({
			type : 'post',
			url : '/jxzhpt/xmjck/selectAbgcById.do',
			data :"id="+parent.rowid,
			dataType:'json',
			success : function(msg) {
			$("#lxbm").html(msg.lxbm);
			$("#lxmc").html(msg.lxmc);
			$("#gydw").html(msg.gydw);
			$("#qdzh").val(msg.qdzh);
			$("#zdzh").val(msg.zdzh);
			$("#qzlc").html(msg.qzlc);
			$("#xzqhdm").html(msg.xzqhdm);
			$("#xzqhmc").html(msg.xzqhmc);
			$("#xjnd").html(msg.gjxjnd);
			$("#lxjsdj").html(msg.lxjsdj);
			$("#yhlc").val(msg.yhlc);
			$("#xmnf").html(msg.xmnf);
			$("#xmtype").html(msg.xmtype);
			$("#yhnr").val(msg.yhnr);
			$("#bz").val(msg.bz);
			qdStr=parseFloat(msg.qdzh);
			zdStr=parseFloat(msg.zdzh);
			$("#qd").html("<font color='red' size='2'>*&nbsp;不能小于</font>"+"<font color='red' size='2'>"+msg.qdzh);
			$("#zd").html("<font color='red' size='2'>*&nbsp;不能大于</font>"+"<font color='red' size='2'>"+msg.zdzh);
			}
		});
	}
	function changeZlc(){
		var zlc=(parseFloat($("#zdzh").val())*1000000000000-parseFloat($("#qdzh").val())*1000000000000)/1000000000000;
		$("#qzlc").html(zlc);
	}
</script>


<table style="width: 98%; margin-top: 15px;margin-left: 10px; background-color: #aacbf8; font-size: 12px"
			border="0" cellpadding="3" cellspacing="1">
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">路线编码：</td>
				<td style="background-color: #ffffff; height: 30px;width:18%" align="left">
					<span id="lxbm" style="font-size: 13px"></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">路线名称：</td>
				<td style="background-color: #ffffff; height: 30px;width:18%" align="left">
					<span id="lxmc"></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">管养单位：</td>
				<td style="background-color: #ffffff; height: 30px;" align="left">
					<span id="gydw"></span></td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">起点桩号：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" name="qdzh" id="qdzh" style="width: 145px"onblur="changeZlc()"/><br/>
					<span id="qd"></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">止点桩号：</td>
				<td style="background-color: #ffffff; height: 20px;width:15%" align="left">
					<input type="text" name="zdzh"id="zdzh" style="width: 145px"onblur="changeZlc()"/><br/>
					<span id="zd"></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">总里程：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="qzlc" style="font-size: 13px"></span>公里</td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">行政区划代码：</td>
				<td style="background-color: #ffffff; height: 30px;" align="left">
					<span id="xzqhdm" style="font-size: 14px"></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">行政区划名称：</td>
				<td style="background-color: #ffffff; height: 30px;width:15%" align="left">
					<span id="xzqhmc"></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">修建/改建年度：</td>
				<td style="background-color: #ffffff; height: 30px;" align="left">
					<span id="xjnd" style="font-size: 13px"></span></td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">路线技术等级：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="lxjsdj"></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">隐患里程：</td>
				<td style="background-color: #ffffff; height: 20px;width:15%" align="left">
					<input type="text" name="yhlc"id="yhlc" style="width: 145px"/></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">特殊地区：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="tsdq"></span>
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">项目年份：</td>
				<td style="background-color: #ffffff; height: 30px;" align="left">
					<span id="xmnf" style="font-size: 13px"></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">项目状态：</td>
				<td style="background-color: #ffffff; height: 30px;width:15%" align="left">
					<span id="xmtype"></span></td>
				<td colspan="2" style="background-color: #ffffff; height: 30px;width:15%" align="left"></td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">隐患内容：</td>
				<td colspan="5" style="background-color: #ffffff;" align="left">
					<textarea id="yhnr" rows="2"  style="width:99%"></textarea>
				</td>
			</tr>
			<tr>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">备&nbsp;&nbsp;注：</td>
				<td colspan="5" style="background-color: #ffffff;" align="left">
					<textarea id="bz" rows="2" style="width:99%"></textarea>
				</td>
			</tr>
			<tr style="height: 35px;">
				<td colspan="6" style="background-color: #ffffff;"
					align="center"><a href="javascript:void(0)" id="save_button"
					class="easyui-linkbutton" plain="true" iconCls="icon-save">保存</a>
					 <a href="javascript:void(0)" id="qx_window"
					class="easyui-linkbutton" plain="true" iconCls="icon-cancel" >取消</a></td>
			</tr>
			</table>
</body>
</html>