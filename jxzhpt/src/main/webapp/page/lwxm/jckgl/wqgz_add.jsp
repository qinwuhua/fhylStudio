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
	
	$("#save_button").click(function(){
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
  			/*dist:$.cookie("dist"),*/
  			qlbh:function() {
  				var d = $("#qlbh").val();
  				return d;
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
				$("#qlmc").val(item.qlmc);
				$("#qlzxzh").val(parseFloat(item.qlzxzh));
				$("#gydw").val(item.gydw);
				$("#xzqhdm").val(item.xzqhdm);
				$("#xzqhmc").val(item.xzqhmc);
				$("#lxmc").val(item.lxmc);
				$("#lxbm").val(item.lxbm);
				$("#kjzc").val(item.kjzc);
				$("#qlqc").val(item.qlqc);
				$("#qlkd").val(item.qlkd);
				$("#dkzdkj").val(item.dkzdkj);
/* 				$("#jsdj").val(item.jsdj); */
				$("#pddj").val(item.pddj);
				$("#xjgjnd").val(item.xjgjnd);
				$("#akjfl").val(item.akjfl);
				$("#sbjgxs").val(item.sbjgxs);
				$("#bhnr").val(item.bhnr);
				$("#bz").val(item.bz);
			});
}
function saveWqgz(){
	var data ="qlbh="+$("#qlbh").val()+"&qlmc="+$("#qlmc").val()+"&qlzxzh="+$("#qlzxzh").val()+"&gydwbm="+$("#gydwbm").val()+"&gydw="+$("#gydw").val()
	+"&xzqhdm="+$("#xzqhdm").val()+"&xzqhmc="+$("#xzqhmc").val()+"&lxmc="+$("#lxmc").val()+"&lxbm="+$("#lxbm").val()+"&kjzc="+$("#kjzc").val()+
	"&qlqc="+$("#qlqc").val()+"&qlkd="+$("#qlkd").val()+"&dkzdkj="+$("#dkzdkj").val()+"&jsdj="+$("#jsdj").val()+"&pddj="+$("#pddj").val()+"&xjgjnd="+$("#xjgjnd").val()
	+"&akjfl="+$("#akjfl").val()+"&sbjgxs="+$("#sbjgxs").val()+"&xmnf="+$("#xmnf").val()+"&xmtype="+$("#xmtype").val()+"&bhnr="+$("#bhnr").val()+"&bz="+$("#bz").val()+
	"&tbbmbm="+$.cookie("unit");
	alert(data);
	$.ajax({
		type:'post',
		url:'/jxzhpt/xmjck/insertWqgz.do',
        data:data,
		dataType:'json',
		success:function(msg){
			if(Boolean(msg)){
				parent.$("#grid").datagrid('reload');
				alert("保存成功！");
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
					<input  id="gydw" style="width: 156px" />
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
					<select id="jsdj" style="width:160px">
							<option selected="selected"  value="一级公路">一级公路</option>
							<option value="二级公路">二级公路</option>
							<option value="三级公路">三级公路</option>
							<option value="四级公路">四级公路</option>
							<option value="等外公路">等外公路</option>
                    </select></td>
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
					<select id="xmnf"  style="width:160px">
									<option selected="selected"  value="2014年">2014年</option>
									<option value="2013年">2013年</option>
									<option value="2012年">2012年</option>
									<option value="2011年">2011年</option>
									<option value="2010年">2010年</option>
                              	</select></td>
				<td style="background-color: #ffffff; height: 20px;" align="right">项目状态：</td>
				<td style="background-color: #ffffff; height: 20px;width:15%" align="left">
					<select id="xmtype" style="width:160px">
									<option selected="selected"  value="未上报">未上报</option>
									<option value="已上报">已上报</option>
									<option value="未审核">已入库</option>
									<option value="已审核">已下达</option>
                              	</select></td>
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