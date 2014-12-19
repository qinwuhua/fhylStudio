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
function checkNameVal(procode){
	$.ajax({
		 type : "POST",
		 url : "../../xtgl/checkname.do",
		 dataType : 'json',
		 data : "master.name=" + procode,
		 success : function(msg){
			 if(msg.length>0){
				 YMLib.Tools.Show('用户名称重复请重新填写！',3000);
				 flag = false;
			 }else{
				 var param = $("#yhgl_form").serialize();
					$.ajax({
						 type : "POST",
						 url : "../../xtgl/insertYh.do",
						 dataType : 'json',
						 data : param,
						 success : function(msg){
							 if(msg){
								 alert('保存成功！');
								 parent.$("#yhgl_table").datagrid('reload');
								 parent.$("#yhgl_add_win").window('destroy');
								 
							 }else{
								 YMLib.Tools.Show('保存失败！',3000);
							 }
						 },
						 error : function(){
							 YMLib.Tools.Show('服务器请求无响应！error code = 404',3000);
						 }
					});
					delete param;
			 }
		 },
		 error : function(){
			 YMLib.Tools.Show('服务器请求无响应！error code = 404',3000);
		 }
		});
}

function selQxList(){
	$.ajax({
		type : "POST",
		url : "../../xtgl/selQxList.do",
		dataType : 'json',
		success : function(msg){
			for (var i=0;i<msg.length;i++){
				$("#role").append("<option value='"+msg[i].ID+"'>"+msg[i].NAME+"</option>");
			}
		}
	});
}
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
	loadUnit("unit",$.cookie("unit"));
	selQxList();
	$("#yhgl_btn_Save").click(function(){
		save();
	});
	$("#yhgl_btn_Cancel").click(function(){
		parent.$("#yhgl_add_win").window('destroy');
	});
});
</script>
<div style="display: none">
        <object classid="clsid:B6BE32E6-5B1B-4A44-BA6C-FB24016CF9A7" id="IAWebClient" name="IAWebClient"
            style="left: 0px; top: 0px" width="50" height="50">
        </object>
    </div>
<div id="yhgl_layout" class="easyui-layout" fit="true">
	<div region="center" border="false" style="padding:0px;border-bottom-width:1px;">
	<form id="yhgl_form" style="overflow-x:hidden">
		<table id="yhgl_form_table" cellspacing="0"  class="table_grid">
			<tr>
				<td class="table_right" align="right" align="right">
					用户名：
				</td>
				<td>
					<input  type="text" id="truename" name="master.truename"  class="easyui-validatebox width_180px" required="true"   />
				</td>
			</tr>
			<tr>
				<td class="table_right" align="right">
					单位负责人：
				</td>
				<td style="text-align: left">
					<input id="name" name="master.name" class="easyui-validatebox width_180px" required="true" validType="Chinese"  type="text" maxlength="20" />
				</td>
			</tr>
			<tr>
				<td class="table_right" align="right">
					性别：
				</td>
				<td align="left">
					<input id="_xb1" type="radio" name="master.sex" value="男" checked="checked" style="width:50px;"/><label for="_xb1">男</label>
					<input id="_xb2" type="radio" name="master.sex" value="女" style="width:50px;"/><label for="_xb2">女</label>
				</td>
			</tr>
			<tr>
				<td class="table_right" align="right">
					电话：
				</td>
				<td>
					<input id="tel" name="master.tel"  class="easyui-validatebox width_180px"  validType="numberInt"  type="text" maxlength="15"/>
				</td>
			</tr>
			<tr>
				<td class="table_right" align="right">
					角色：
				</td>
				<td>
					<select id="role"  name="master.role" class="width_180px" >
					</select>
				</td>
			</tr>
			<tr>
				<td class="table_right" align="right">
					所属单位：
				</td>
				<td>
					<input id="unit" name="master.unit" class="easyui-combotree" style="width:180px;" required="true">
				</td>
			</tr>
			<tr>
				<td style="text-align: center;color: red;" colspan="2">
					初始密码为：000000<input type ="hidden" name="master.password" value="000000"><input type ="hidden" name="master.zt" value="启用">
					<input type ="hidden" name="master.gmgid" id="gmgid">
					<input type="hidden" name="master.czr" id="czr" />
					<input type="hidden" name="master.czsj" id="czsj" />
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