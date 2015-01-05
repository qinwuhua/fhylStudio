<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<link rel="stylesheet" type="text/css" href="../../css/Top.css" />
<link rel="stylesheet" type="text/css" href="../../css/style.css" />
<link rel="stylesheet" type="text/css" href="../../easyui/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="../../easyui/themes/icon.css" />
<script type="text/javascript" src="../../easyui/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="../../easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../../easyui/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="../../js/YMLib.js"></script>
<script type="text/javascript" src="../../js/util/jquery.cookie.js"></script>
</head>
<body>
<script type="text/javascript">
function save(){
	if(!$("#yhgl_form #yhgl_form_table").form('validate')){
		return;
	}
	if($("#truename").val().replace(/(^\s*)|(\s*$)/g,"")==""){
		alert("请输入用户名！");
		return false;
	}
	if($("#name").val()==""){
		alert("请输入单位负责人！");
		return false;
	}
	if(!/((\d{11})|^((\d{7,8})|(\d{4}|\d{3})-(\d{7,8})|(\d{4}|\d{3})-(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1})|(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1}))$)/.test($("#tel").val())){
		alert("联系电话的格式不正确！");
		return false;
	}
    checkNameVal($("#truename").val());
}
$(function(){

	$("#yhgl_btn_Save").click(function(){
		save();
	});
	$("#yhgl_btn_Cancel").click(function(){
		parent.$("#jsgl_add_win").window('destroy');
	});
});
</script>
<div id="yhgl_layout" class="easyui-layout" fit="true">
	<div region="center" border="false" style="padding:0px;">
	<form id="yhgl_form" style="overflow-x:hidden">
		<table id="yhgl_form_table" cellspacing="0"  class="table_grid">
			<tr>
				<td align="right">
					特殊地区：
				</td>
				<td>
					<input type="text" id="name" name="param.name" style="width:298px;"/>
				</td>
			</tr>
			<tr>
				<td align="right">
					 包含行政区划：
				</td>
				<td>
					<input  type="text" id="xzqhdm" name="param.xzqhdm" style="width:300px;"/>
				</td>
			</tr>
			<tr>
				<td  align="right">
					 备注：
				</td>
				<td>
					<textarea  type="text" id="bz" name="param.bz" style="width:300px;height:50px;"></textarea>
				</td>
			</tr>
		</table>
	</form>
	</div>
	<div region="south" border="false" style="text-align:right;height:30px;line-height:30px;">
		<a id="yhgl_btn_Save" iconCls="icon-save" href="javascript:void(0)"  class="easyui-linkbutton" style="margin:2px 3px 0px 0px;" plain="true" >保　存</a>
		<a id="yhgl_btn_Cancel" iconCls="icon-cancel" href="javascript:void(0)" class="easyui-linkbutton" style="margin:2px 3px 0px 0px;" plain="true">取　消</a>
	</div>
</div>
</body>
</html>