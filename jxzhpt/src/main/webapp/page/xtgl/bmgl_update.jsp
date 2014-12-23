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
function init(){
	$.ajax({
		type : "POST",
		url : "../../xtgl/selectDwById.do",
		dataType : 'json',
		data : 'unit.id='+parent.YMLib.Var.ID,
		success : function(msg){
			if(msg){
				$("#id").val(msg[0].id);
				$("#parent").val(msg[0].parent);
				$("#name").val(msg[0].name);
				$("#jgdm").val(msg[0].jgdm);
				$("#dist").val(msg[0].dist);
				$("#jglx").val(msg[0].jglx);
				$("#zxkjbzlb").val(msg[0].zxkjbzlb);
				$("#zxkjzzlb").val(msg[0].zxkjzzlb);
				$("#djzclx").val(msg[0].djzclx);
				$("#sfzy").val(msg[0].sfzy);
				$("#dwfzr").val(msg[0].dwfzr);
				$("#lxdh").val(msg[0].lxdh);
				$("#sfgl").val(msg[0].sfgl);
			}else{
				YMLib.Tools.Show('保存失败！',3000);
			}
		}
	});
}
function saveDwgl(){
	if(!$("#dwgl_form #dwgl_form_table").form('validate')){
		return;
	}
	if(parent.YMLib.Var.ID.length==8){
		if($("#name").val()==""||$("#jgdm").val()==""||$("#jglx").val()==""||$("#zxkjbzlb").val()==""||$("#djzclx").val()==""||$("#sfzy").val()==""||$("#dwfzr").val()==""||$("#lxdh").val()==""||$("#sfgl").val()==""){
			alert("请检查必填项！");
			return;
		}
	}else{
		if($("#name").val().replace(/(^\s*)|(\s*$)/g,"")==""){
			alert("单位名称不能为空！");
			return;
		}
	}
	if(!/((\d{11})|^((\d{7,8})|(\d{4}|\d{3})-(\d{7,8})|(\d{4}|\d{3})-(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1})|(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1}))$)/.test($("#lxdh").val())){
		alert("联系电话的格式不正确！");
		return false;
	}
	param = $("#dwgl_form").serialize();
	$.ajax({
		type : "POST",
		url : "../../xtgl/updateDw.do",
		dataType : 'json',
		data : param,
		success : function(msg){
			if(msg){
				alert('保存成功！');
				parent.startSearch();
				parent.$("#dwgl_add_win").window('destroy');
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

$(function(){
	loadBmbm("djzclx","登记注册类型");
	if(parent.YMLib.Var.ID.length!=8){
		$(".btx_ts").remove();
	}
	$("#dwgl_btn_Save").click(function(){
		saveDwgl();
	});
	$("#dwgl_btn_Cancel").click(function(){
		parent.$("#dwgl_add_win").window('destroy');
	});
	setTimeout("init()",500);
});
</script>
<div id="dwgl_layout" class="easyui-layout" fit="true">
	<div region="center" border="false" style="padding:0px;border-bottom-width:1px;">
	<form id="dwgl_form" style="overflow-x:hidden">
		<table id="dwgl_form_table" cellspacing="0" class="table_grid">
			<tr>
				<td class="table_right" align="right">
					部门编号：
				</td>
				<td>
					<input id="id" name="unit.id" type="text" style="width:160px;"/>
				</td>
			</tr>
			<tr>
				<td class="table_right" align="right">
					部门名称：
				</td>
				<td>
					<input id="name" name="unit.name" type="text" style="width:160px;"/>
				</td>
			</tr>
			
			<tr>
				<td class="table_right" align="right">
					描述：
				</td>
				<td>
					<textarea id="desr" name="unit.desr" style="width: 160px;height:50px;"></textarea>
				</td>
			</tr>
		</table>
		</form>
	</div>
	<div region="south" border="false" style="text-align:right;height:30px;">
		<a id="dwgl_btn_Save" iconCls="icon-save" href="javascript:void(0)"  class="easyui-linkbutton" style="margin:2px 3px 0px 0px;" plain="true" >保　存</a>
		<a id="dwgl_btn_Cancel" iconCls="icon-cancel" href="javascript:void(0)" class="easyui-linkbutton" style="margin:2px 3px 0px 0px;" plain="true">取　消</a>
	</div>
</div>
</body>
</html>