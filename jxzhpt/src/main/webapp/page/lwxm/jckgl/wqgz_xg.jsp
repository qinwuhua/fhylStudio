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
	wqgzById();
	$("#save_button").click(function(){
		var data ="id="+parent.rowid+"&qlbh="+$("#qlbh").html()+"&qlmc="+$("#qlmc").html()+"&qlzxzh="+$("#qlzxzh").html()+"&gydw="+$("#gydw").html()
		+"&xzqhdm="+$("#xzqhdm").html()+"&xzqhmc="+$("#xzqhmc").html()+"&lxmc="+$("#lxmc").html()+"&lxbm="+$("#lxbm").html()+"&kjzc="+$("#kjzc").html()+
		"&qlqc="+$("#qlqc").html()+"&qlkd="+$("#qlkd").html()+"&dkzdkj="+$("#dkzdkj").html()+"&jsdj="+$("#jsdj").val()+"&pddj="+$("#pddj").html()+"&xjgjnd="+$("#xjgjnd").html()
		+"&akjfl="+$("#akjfl").html()+"&sbjgxs="+$("#sbjgxs").html()+"&xmnf="+$("#xmnf").val()+"&xmtype="+$("#xmtype").html()+"&bhnr="+$("#bhnr").val()+"&bz="+$("#bz").val();
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
		$("#qlbh").html(msg.qlbh);
		$("#qlmc").html(msg.qlmc);
		$("#qlzxzh").html(msg.qlzxzh);
		$("#gydw").html(msg.gydw);
		$("#xzqhdm").html(msg.xzqhdm);
		$("#xzqhmc").html(msg.xzqhmc);
		$("#lxbm").html(msg.lxbm);
		$("#lxmc").html(msg.lxmc);
		$("#kjzc").html(msg.kjzc);
		$("#qlqc").html(msg.qlqc);
		$("#qlkd").html(msg.qlkd);
		$("#dkzdkj").html(msg.dkzdkj);
		$("#jsdj").val(msg.jsdj);
		$("#pddj").html(msg.pddj);
		$("#xjgjnd").html(msg.xjgjnd);
		$("#akjfl").html(msg.akjfl);
		$("#sbjgxs").html(msg.sbjgxs);
		$("#xmnf").val(msg.xmnf);
		$("#xmtype").html(msg.xmtype);
		$("#bhnr").val(msg.bhnr);
		$("#bz").val(msg.bz);
		}
	});
}		
</script>


<table style="width: 98%; margin-top: 15px;margin-left: 10px; background-color: #aacbf8; font-size: 12px"
			border="0" cellpadding="3" cellspacing="1">
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">桥梁编号：</td>
				<td style="background-color: #ffffff;width:18%" align="left">
					<span id="qlbh"></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">桥梁名称：</td>
				<td style="background-color: #ffffff;width:18%" align="left">
					<span id="qlmc"></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">桥梁中心桩号：</td>
				<td style="background-color: #ffffff;" align="left">
					<span id="qlzxzh"></span></td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">管养单位：</td>
				<td style="background-color: #ffffff;" align="left">
					<span id="gydw"></span>
					<input type="text" id="gydwbm" style="display:none"/></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">行政区划代码：</td>
				<td style="background-color: #ffffff;" align="left">
					<span id="xzqhdm"></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">行政区划名称：</td>
				<td style="background-color: #ffffff;" align="left">
					<span id="xzqhmc"></span></td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">路线名称：</td>
				<td style="background-color: #ffffff;" align="left">
					<span id="lxmc"></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">路线编码：</td>
				<td style="background-color: #ffffff;" align="left">
					<span id="lxbm"></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">跨径总长(米)：</td>
				<td style="background-color: #ffffff;" align="left">
					<span id="kjzc"></span></td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">桥梁全长(米)：</td>
				<td style="background-color: #ffffff;" align="left">
					<span id="qlqc"></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">桥梁全宽(米)：</td>
				<td style="background-color: #ffffff;" align="left">
					<span id="qlkd"></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">单孔最大跨径(米)：</td>
				<td style="background-color: #ffffff;" align="left">
					<span id="dkzdkj"></span></td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">技术等级：</td>
				<td style="background-color: #ffffff;" align="left">
					<select id="jsdj" style="width:155px">
							<option selected="selected"  value="一级公路">一级公路</option>
							<option value="二级公路">二级公路</option>
							<option value="三级公路">三级公路</option>
							<option value="四级公路">四级公路</option>
							<option value="等外公路">等外公路</option>
                    </select></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">评定等级：</td>
				<td style="background-color: #ffffff;" align="left">
					<span id="pddj"></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">修建/改建年度：</td>
				<td style="background-color: #ffffff;" align="left">
					<span id="xjgjnd"></span></td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">按跨径分类：</td>
				<td style="background-color: #ffffff;" align="left">
					<span id="akjfl"></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">上部结构形式：</td>
				<td style="background-color: #ffffff;" align="left">
					<span id="sbjgxs"></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">特殊地区：</td>
				<td style="background-color: #ffffff;" align="left">
					<span id="tsdq"></span>
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">项目年份：</td>
				<td style="background-color: #ffffff;" align="left">
					<select id="xmnf"  style="width:155px">
									<option selected value="2015年">2015年</option>
									<option value="2014年">2014年</option>
									<option value="2013年">2013年</option>
									<option value="2012年">2012年</option>
									<option value="2011年">2011年</option>
									<option value="2010年">2010年</option>
                              	</select></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">项目状态：</td>
				<td style="background-color: #ffffff;" align="left">
					<span id="xmtype"></span></td>
				<td colspan="2" style="background-color: #ffffff;" align="left"></td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">病害内容：</td>
				<td colspan="5" style="background-color: #ffffff;" align="left">
					<textarea id="bhnr" rows="2"  style="width:99%"></textarea>
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
					class="easyui-linkbutton" plain="true" iconCls="icon-save">保存</a> <a
					href="javascript:void(0)" id="qx_window"
					class="easyui-linkbutton" plain="true" iconCls="icon-cancel">取消</a></td>
			</tr>
			</table>
</body>
</html>