<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>角色添加</title>
<link rel="stylesheet" type="text/css" href="../../css/Top.css" />
<link rel="stylesheet" type="text/css" href="../../css/style.css" />
<link rel="stylesheet" type="text/css" href="../../css/button.css" />
<link rel="stylesheet" type="text/css" href="../../easyui/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="../../easyui/themes/icon.css" />
<script type="text/javascript" src="../../easyui/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="../../easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../../easyui/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="../../js/YMLib.js"></script>
<script type="text/javascript" src="../../js/util/jquery.cookie.js"></script>
</head>
<body>
<script type="text/javascript">
flag = false;
/* function checkProCode(procode){
	$.ajax({
		 type : "POST",
		 url : "jsgl/checkname.do",
		 dataType : 'json',
		 data : "name=" + procode,
		 success : function(msg){
			 if(msg){
				 YMLib.Tools.Show('角色名称重复请重新填写！',3000);
				 flag = false;
				 $("#name").val('');
			 }else{
				 flag = true;
			 }
		 },
		 error : function(){
			 YMLib.Tools.Show('服务器请求无响应！error code = 404',3000);
		 }
		});
} */
$(function(){
	$("#jsgl_btn_Save").click(function(){
		if(!$("#jsgl_form #jsgl_form_table").form('validate')){
			return;
		}
		if($("#name").val()==""){
			alert("请输入角色名称！");
			return false;
		}
		if($("#descr").val()==""){
			alert("请输入角色描述！");
			return false;
		}
		var checkboxs = document.getElementsByName("checkbox"); 
		var s="";
		for (var i=0; i<checkboxs.length; i++){
			if (checkboxs[i].checked==true){
				s=s+checkboxs[i].value+";";
			}
		}
		if(s==""){
			alert("请选择资源！");
			return false;
		}
		$("#resourceid").val(s);
		param=$("#jsgl_form").serialize();
		$.ajax({
			 type : "POST",
			 url : "../../xtgl/insertJs.do",
			 dataType : 'json',
			 data : param,
			 success : function(msg){
				 if(msg){
					 alert('保存成功！');
					 parent.$("#jsgl_table").datagrid('reload');
					 parent.$("#jsgl_add_win").window('destroy');
				 }else{
					 YMLib.Tools.Show('保存失败！',3000);
				 }
			 },
			 error : function(){
				 YMLib.Tools.Show('服务器请求无响应！error code = 404',3000);
			 }
			});
		delete param;
	});
	$("#jsgl_btn_Cancel").click(function(){
		$("#jsgl_add_win").window('destroy');
	});
});
</script>
<div id="jsgl_layout" class="easyui-layout" fit="true">
	<div region="center" border="false" style="padding:0px;border-bottom-width:1px;">
	<form id="jsgl_form" style="overflow-x:hidden">
		<table id="jsgl_form_table" cellspacing="0"  class="table_grid">
			<tr>
				<td>
					角色名称：
				</td>
				<td>
					<input style="width:248px;" class="easyui-validatebox" required="true" validType="notNULL" type="text" id="name" name="param.name"  maxlength="40"/>
				</td>
			</tr>
			<tr>
				<td>
					角色描述：
				</td>
				<td>
					<input id="descr" class="easyui-validatebox" required="true" validType="notNULL" name="param.descr" type="text" style="width:248px;" maxlength="60"/>
					<input type="hidden" name="param.source" id="resourceid" />
					<input type="hidden" name="param.czr" id="czt" />
					<input type="hidden" name="param.czsj" id="czsj" />
				</td>
			</tr>
			<tr>
				<td>
					资源管理：
				</td>
				<td>
					<table border="0" cellspacing="0" style="height: 26px;border:1px solid #C1DAD7;border-right: 0px;border-bottom: 0px;" id="resource">
						<tr><td><input name="checkbox" style="text-align: right; 
						vertical-align: text-top;width:50px;" type="checkbox" value="01" checked="checked" disabled="disabled" id="a1a1"/><label for="a1a1">电子地图</label></td>
						<td><input name="checkbox"  style="text-align: right; 
						vertical-align: text-top;width:50px;" type="checkbox" value="02" id="a1a2"/><label for="a1a2">项目管理</label></td></tr>
						
						<tr><td><input name="checkbox"  style="text-align: right; 
						vertical-align: text-top;width:50px;" type="checkbox" value="0201" id="a1a3"/><label for="a1a3">项目库管理</label></td>
						<td><input name="checkbox"  style="text-align: right; 
						vertical-align: text-top;width:50px;" type="checkbox" value="0202" id="a1a4"/><label for="a1a4">数据校核</label></td></tr>
						
						<tr><td><input name="checkbox"  style="text-align: right; 
						vertical-align: text-top;width:50px;" type="checkbox" value="0203" id="a1a5"/><label for="a1a5">导出报部</label></td>
						<td><input name="checkbox"  style="text-align: right; 
						vertical-align: text-top;width:50px;" type="checkbox" value="0204" id="a1a6"/><label for="a1a5">年度归档</label></td>
						</tr>
						
						<tr><td><input name="checkbox"  style="text-align: right; 
						vertical-align: text-top;width:50px;" type="checkbox" value="0205" id="a1a7"/><label for="a1a6">查看档案</label></td>
						<td><input name="checkbox"  style="text-align: right; 
						vertical-align: text-top;width:50px;" type="checkbox" value="03" id="a1a8"/><label for="a1a7">数据查询</label></td>
						</tr>
						
						<tr><td><input name="checkbox"  style="text-align: right; 
						vertical-align: text-top;width:50px;" type="checkbox" value="04" id="a1a9"/><label for="a1a8">统计报表</label></td>
						<td><input name="checkbox"  style="text-align: right; 
						vertical-align: text-top;width:50px;" type="checkbox" value="05" id="a1a10"/><label for="a1a9">系统管理</label></td>
						</tr>
						
						<tr><td><input name="checkbox"  style="text-align: right; 
						vertical-align: text-top;width:50px;" type="checkbox" value="0501" id="a1a11"/><label for="a1a10">用户管理</label></td>
						<td><input name="checkbox"  style="text-align: right; 
						vertical-align: text-top;width:50px;" type="checkbox" value="0502" id="a1a12"/><label for="a1a11">单位管理</label></td>
						</tr>
						
						<tr><td><input name="checkbox"  style="text-align: right; 
						vertical-align: text-top;width:50px;" type="checkbox" value="0503" id="a1a13"/><label for="a1a12">角色管理</label></td>
						<td><input name="checkbox"  style="text-align: right; 
						vertical-align: text-top;width:50px;" type="checkbox" value="0504" id="a1a14"/><label for="a1a13">编目编码</label></td>
						</tr>
						
						
					</table>
				</td>
			</tr>
		</table>
</form>
	</div>
	<div region="south" border="false" style="text-align:right;height:30px;line-height:30px;">
		<a id="jsgl_btn_Save" iconCls="icon-save" href="javascript:void(0)"  class="easyui-linkbutton" style="margin:2px 3px 0px 0px;" plain="true" >保　存</a>
		　<a id="jsgl_btn_Cancel" iconCls="icon-cancel" href="javascript:void(0)" class="easyui-linkbutton" style="margin:2px 3px 0px 0px;" plain="true">取　消</a>
	</div>
</div>
</body>
</html>