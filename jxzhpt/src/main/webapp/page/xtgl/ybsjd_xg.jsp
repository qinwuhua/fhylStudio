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
		var data="wqbzbz.id="+parent.obj.id+"&wqbzbz.nf="+$("#nf").combobox('getValue')
		+"&wqbzbz.yf="+$("#yf").combobox('getValue')+"&wqbzbz.jzsj="+$("#jzsj").val();
		$.ajax({
			data:data,
			type:'post',
			datatype:'json',
			url:'/jxzhpt/qqgl/xgybsjd.do',
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
		$("#xmlx").html(parent.obj.xmlx);
		$("#jzsj").val(parent.obj.jzsj);
		xmnf('nf');
		yf('yf');
	});
	function xmnf(id){
		var myDate = new Date();
		var years=[];
		for(var i=0;i<=10;i++){
			years.push({text:(myDate.getFullYear()+5-i),value:(myDate.getFullYear()+5-i)});
		}
		$('#'+id).combobox({
		    data:years,
		    valueField:'value',
		    textField:'text'
		});
		$('#'+id).combobox("setValue",parent.obj.nf);
	}
	function yf(id){
		var years=[];
		for(var i=0;i<=12;i++){
			years.push({text:i,value:i});
		}
		$('#'+id).combobox({
		    data:years,
		    valueField:'value',
		    textField:'text'
		});
		$('#'+id).combobox("setValue",parent.obj.yf);
	}
</script>
<div id="dwgl_layout" class="easyui-layout" fit="true">
	<div region="center" border="false" style="padding:0px;border-bottom-width:1px;">
	<form id="dwgl_form" style="overflow-x:hidden">
		<table id="dwgl_form_table" cellspacing="0" class="table_grid">
			<tr>
				<td class="table_right" align="right">
					项目类型：
				</td>
				<td>
					<span id='xmlx'></span>
				</td>
			</tr>
			<tr>
				<td class="table_right" align="right">
					年份：
				</td>
				<td>
					<select id='nf' class="easyui-combobox" style="width: 156px">
    				</select>
				</td>
			</tr>
			
			<tr>
				<td class="table_right" align="right">
					月份：
				</td>
				<td>
					<select id="yf" class="easyui-combobox" data-options="panelHeight:'150'"  style="width: 156px" >

					</select>
				</td>
			</tr>
			<tr>
				<td class="table_right" align="right">
					截止时间：
				</td>
				<td>
					<input type="text" id="jzsj" >
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