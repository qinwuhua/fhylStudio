<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="../../css/Top.css" />
<link rel="stylesheet" type="text/css" href="../../css/style.css" />
<link rel="stylesheet" type="text/css" href="../../easyui/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="../../easyui/themes/icon.css" />
<script type="text/javascript" src="../../easyui/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="../../easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../../easyui/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="../../js/YMLib.js"></script>
<script type="text/javascript" src="../../js/util/jquery.cookie.js"></script>
<title>角色添加</title>
</head>
<body>
<script type="text/javascript">
	function tjwqbzbz(){
		var jsdj1=$("#jsdj").combobox('getText');
		var data="wqbzbz.qllx="+$("#qllx").combobox('getValue')+"&wqbzbz.jsxz="+$("#jsxz").combobox('getValue')
		+"&wqbzbz.jsdj="+$("#jsdj").combobox('getValues')+"&wqbzbz.bzjb="+$("#bzjb").combobox('getValue')+"&wqbzbz.jsdj1="+jsdj1
		+"&wqbzbz.zdkd="+$("#zdkd").val()+"&wqbzbz.bzje="+$("#bzje").val()+"&wqbzbz.id="+parent.obj.id;
		$.ajax({
			data:data,
			type:'post',
			datatype:'json',
			url:'/jxzhpt/qqgl/xgwqbzbz.do',
			success:function(msg){
				if(msg){
					alert("保存成功！");
					parent.loadTable();
					parent.$('#lxxx').window('destroy');
				}else{
					alert("保存失败！");
				}
			}
		});  
	}
	$(function(){
		var data=parent.obj;
		$("#qllx").combobox('setValue',data.qllx);
		$("#jsxz").combobox('setValue',data.jsxz);
		$("#jsdj").combobox('setValues',data.jsdj);
		$("#zdkd").val(data.zdkd);
		$("#bzje").val(data.bzje);
		$("#bzjb").combobox('setValue',data.bzjb);
	})
</script>
<div id="dwgl_layout" class="easyui-layout" fit="true">
	<div region="center" border="false" style="padding:0px;border-bottom-width:1px;">
	<form id="dwgl_form" style="overflow-x:hidden">
		<table id="dwgl_form_table" cellspacing="0" class="table_grid">
			<tr>
				<td class="table_right" align="right">
					桥梁类型：
				</td>
				<td>
					<select id="qllx" class="easyui-combobox" data-options="panelHeight:'90'" style="width: 156px">
						<option value="特大桥"selected>特大桥</option>
						<option value="大桥">大桥</option>
						<option value="中桥">中桥</option>
						<option value="小桥">小桥</option>
					</select>
				</td>
			</tr>
			<tr>
				<td class="table_right" align="right">
					建设性质：
				</td>
				<td>
					<select id="jsxz" class="easyui-combobox" data-options="panelHeight:'50'" style="width: 156px">
						<option value="加固改造"selected>加固改造</option>
						<option value="拆除重建">拆除重建</option>
					</select>
				</td>
			</tr>
			
			<tr>
				<td class="table_right" align="right">
					技术等级：
				</td>
				<td>
					<select id="jsdj" class="easyui-combobox" data-options="panelHeight:'120'" style="width: 156px" multiple='true' >
						<option value="G"selected>国道</option>
						<option value="S">省道</option>
						<option value="X">县道</option>
						<option value="Y">乡道</option>
						<option value="C">村道</option>
						<option value="Z">专道</option>
					</select>
				</td>
			</tr>
			<tr>
				<td class="table_right" align="right">
					最大宽度：
				</td>
				<td>
					<input type="text" id="zdkd" >
				</td>
			</tr>
			<tr>
				<td class="table_right" align="right">
					补助金额：
				</td>
				<td>
					<input type="text" id="bzje" >
				</td>
			</tr>
			<tr>
				<td class="table_right" align="right">
					补助级别：
				</td>
				<td>
					<select id="bzjb" class="easyui-combobox" data-options="panelHeight:'50'" style="width: 156px" >
						<option value="省级"selected>省级</option>
						<option value="市级">市级</option>
					</select>
				</td>
			</tr>
		</table>
		</form>
	</div>
	<div region="south" border="false" style="text-align:right;height:30px;">
		<a id="dwgl_btn_Save" iconCls="icon-save" href="javascript:void(0)"  class="easyui-linkbutton" style="margin:2px 3px 0px 0px;" plain="true"  onclick="tjwqbzbz()">保　存</a>
		<a id="dwgl_btn_Cancel" iconCls="icon-cancel" href="javascript:void(0)" class="easyui-linkbutton" style="margin:2px 3px 0px 0px;" plain="true" onclick="parent.$('#lxxx').window('destroy');">取　消</a>
	</div>
</div>
</body>
</html>