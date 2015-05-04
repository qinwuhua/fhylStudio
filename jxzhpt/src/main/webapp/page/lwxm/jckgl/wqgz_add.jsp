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
<link rel="stylesheet" type="text/css" href="../../../js/autocomplete/jquery.autocomplete.css" />
<script type="text/javascript" src="../../../easyui/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="../../../easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../../../easyui/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="../../../js/autocomplete/jquery.autocomplete.js" ></script>
<script type="text/javascript" src="../../../js/util/jquery.cookie.js"></script>
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
	xmnf1("xmnf");
	$("#save_button").click(function(){
		if($("#qlbh").val()=="" && $("#qlbh").val()==null){
			alert("请填写桥梁编码！");
			$("#qlbh").focus();
			return false;
		}
			var datas="qlbh="+$("#qlbh").val()+"&lxbm="+$("#lxbm").val()+"&qlzxzh="+$("#qlzxzh").val();
			$.ajax({
				type:'post',
				url:'/jxzhpt/xmjck/onceWqgz.do',
				dataType:'json',
		        data:datas,
				success:function(msg){
					if(Boolean(msg)){
						saveWqgz();
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
	var url = "/jxzhpt/xmjck/wqgzGpsroad.do";
	$("#qlbh").autocomplete(url, {
		multiple : false,
		minChars :2,
		multipleSeparator : ' ',
		mustMatch: true,
  		cacheLength : 0,
  		delay : 200,
  		max : 50,
  		extraParams : {
  			qlbh:function() {
  				var d = $("#qlbh").val();
  				return d;
  			},
  			gydwbm:function() {
  				var d = $.cookie("unit2");
  				if(d=='______36') return "";
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
  						value : row.qlbh.replace(/(\s*$)/g,""),
  						result : row.qlbh.replace(/(\s*$)/g,"")
  					};
  				});
  			return aa;
  		},
  		formatItem : function(row, i, max) {
  			return row.qlbh.replace(/(\s*$)/g,"")+"("+row.qlzxzh+")"+"<br/>"+row.qlmc.replace(/(\s*$)/g,"");
  		}
  	}).result(
			function(e, item) {
				if(item==undefined) return ;
				$("#qlmc,#qlzxzh,#gydw,#xzqhdm,#xzqhmc,#lxmc,#lxbm,#kjzc,#qlqc,#qlkd,#dkzdkj,#pddj,#xjgjnd,#akjfl,#sbjgxs,#bhnr,#bz").attr("value",'');
				$("#qlmc").html(item.qlmc);
				$("#qlzxzh").html(parseFloat(item.qlzxzh));
				$("#gydw").html(item.gydw);
				$("#xzqhdm").html(item.xzqhdm);
				$("#xzqhmc").html(item.xzqhmc);
				$("#lxmc").html(item.lxmc);
				$("#lxbm").html(item.lxbm);
				$("#kjzc").html(item.kjzc);
				$("#qlqc").html(item.qlqc);
				$("#qlkd").html(item.qlkd);
				$("#dkzdkj").html(item.dkzdkj);
				$.ajax({
					type : 'post',
					url : '/jxzhpt/xmjck/selJsdj.do',
					data :"lxbm="+item.lxbm+"&qlzxzh="+item.qlzxzh,
					dataType:'json',
					success : function(msg) {
					$("#jsdj").html(msg.jsdj);
					}
				});
				$("#pddj").html(item.pddj);
				$("#xjgjnd").html(item.xjgjnd);
				$("#akjfl").html(item.akjfl);
				$("#sbjgxs").html(item.sbjgxs);
				$("#xmtype").html('待上报');
				$("#bhnr").val(item.bhnr);
				$("#bz").val(item.bz);
			});
}
function saveWqgz(){
	var sbthcd=$.cookie("unit2").length;
	if($.cookie("unit2")=="______36"){
		sbthcd=7;
	}
	var data ="qlbh="+$("#qlbh").val()+"&qlmc="+$("#qlmc").html()+"&qlzxzh="+$("#qlzxzh").html()+"&gydwbm="+$("#gydwbm").val()+"&gydw="+$("#gydw").html()
	+"&xzqhdm="+$("#xzqhdm").html()+"&xzqhmc="+$("#xzqhmc").html()+"&lxmc="+$("#lxmc").html()+"&lxbm="+$("#lxbm").html()+"&kjzc="+$("#kjzc").html()+
	"&qlqc="+$("#qlqc").html()+"&qlkd="+$("#qlkd").html()+"&dkzdkj="+$("#dkzdkj").html()+"&jsdj="+$("#jsdj").html()+"&pddj="+$("#pddj").html()+"&xjgjnd="+$("#xjgjnd").html()
	+"&akjfl="+$("#akjfl").html()+"&sbjgxs="+$("#sbjgxs").html()+"&xmnf="+$("#xmnf").combobox("getValue")+"&xmtype="+$("#xmtype").html()+"&bhnr="+$("#bhnr").val()+"&bz="+$("#bz").val()+
	"&tbbmbm="+$.cookie("unit")+"&sbthcd="+sbthcd;
	$.ajax({
		type:'post',
		url:'/jxzhpt/xmjck/insertWqgz.do',
        data:data,
		dataType:'json',
		success:function(msg){
			if(Boolean(msg)){
				parent.jckglWqgz();
				alert("保存成功！");
				parent.jckglWqgz();
				parent.$('#jck_add').window('destroy');
			}else{
				alert('保存失败！');
			}
		}
	});
}

</script>

<table style="width: 98%; margin-top: 15px;margin-left: 10px; background-color: #aacbf8; font-size: 12px"
			border="0" cellpadding="3" cellspacing="1">
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">桥梁编号：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input type="text" name="qlbh"id="qlbh" style="width: 150px" /></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">桥梁名称：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<span id="qlmc"></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">桥梁中心桩号：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="qlzxzh"></span></td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">管养单位：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="gydw"></span>
					<input type="text" id="gydwbm" style="display:none"/></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">行政区划代码：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="xzqhdm"></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">行政区划名称：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="xzqhmc"></span></td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">路线名称：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="lxmc"></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">路线编码：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="lxbm"></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">跨径总长(米)：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="kjzc"></span></td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">桥梁全长(米)：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="qlqc"></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">桥梁全宽(米)：</td>
				<td style="background-color: #ffffff; height: 20px;width:15%" align="left">
					<span id="qlkd"></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">单孔最大跨径(米)：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="dkzdkj"></span></td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">技术等级：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="jsdj"></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">评定等级：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="pddj"></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">修建/改建年度：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="xjgjnd"></span></td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">按跨径分类：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="akjfl"></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">上部结构形式：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="sbjgxs"></span></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">特殊地区：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="tsdq"></span>
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">项目年份：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<select id="xmnf"  style="width:155px" class="easyui-combobox" data-options="panelHeight:'100'">
                              	</select></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">项目状态：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<span id="xmtype"></span></td>
				<td colspan="2" style="background-color: #ffffff; height: 20px;width:15%" align="left"></td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">病害内容：</td>
				<td colspan="5" style="background-color: #ffffff; height: 20px;" align="left">
					<textarea id="bhnr" rows="2"  style="width:99%"></textarea>
				</td>
			</tr>
			<tr>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">备&nbsp;&nbsp;注：</td>
				<td colspan="5" style="background-color: #ffffff; height: 20px;" align="left">
					<textarea id="bz" rows="2" style="width:99%"></textarea>
				</td>
			</tr>
			<tr style="height: 35px;">
				<td colspan="6" style="background-color: #ffffff; height: 35px;"
					align="center"><a href="javascript:void(0)" id="save_button"
					class="easyui-linkbutton" plain="true" iconCls="icon-save">保存</a> <a
					href="javascript:void(0)" id="qx_window"
					class="easyui-linkbutton" plain="true" iconCls="icon-cancel">取消</a></td>
			</tr>
			</table>
</body>
</html>