<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
<title>角色添加</title>
</head>
<body>
<script type="text/javascript">
function saveDwgl(){
	if(!$("#dwgl_form #dwgl_form_table").form('validate')){
		return;
	}
	
	if(parent.YMLib.Var.ID.length==6){
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
		url : "../../xtgl/insertDw.do",
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
	if(parent.YMLib.Var.ID.length!=6){
		$(".btx_ts").remove();
	}
	
	$("#id").val(parent.YMLib.Var.ID);
	$("#dist").val(parent.YMLib.Var.dist);
	loadBmbm("djzclx","登记注册类型");
	$("#dwgl_btn_Save").click(function(){
		saveDwgl();
	});
	$("#dwgl_btn_Cancel").click(function(){
		parent.$("#dwgl_add_win").window('destroy');
	});
});
</script>
<div id="dwgl_layout" class="easyui-layout" fit="true">
	<div region="center" border="false" style="padding:0px;border-bottom-width:1px;">
	<form id="dwgl_form" style="overflow-x:hidden">
		<table id="dwgl_form_table" cellspacing="0" class="table_grid">
			<tr>
				<td class="table_right" align="right">
					单位名称：
				</td>
				<td>
					<input id="name" name="unit.name" type="text" style="width:160px;"  /><span style="color:red;">(*)</span>
					<input id="dist" name="unit.dist" type="hidden"/>
					<input id="id" name="unit.id" type="hidden"/>
				</td>
			</tr>
			<tr>
				<td class="table_right" align="right">
					组织机构代码：
				</td>
				<td>
					<input id="jgdm" name="unit.jgdm" type="text" style="width:160px;"  /><span class="btx_ts" style="color:red;">(*)</span>
				</td>
			</tr>
			<tr>
				<td class="table_right" align="right">
					机构类型：
				</td>
				<td>
					<select id="jglx" name="unit.jglx" style="width: 162px;" >
					<option value="">请选择</option>
					<option value="1.企业">1.企业</option>
					<option value="2.事业单位">2.事业单位</option>
					<option value="9.其它组织机构">9.其它组织机构</option>
					</select><span class="btx_ts" style="color:red;">(*)</span>
				</td>
			</tr>
			<tr>
				<td class="table_right" align="right">
					执行会计标准类别：
				</td>
				<td>
					<select id="zxkjbzlb"  name="unit.zxkjbzlb" style="width: 162px;" >
					<option value="">请选择</option>
					<option value="1.企业会计制度">1.企业会计制度</option>
					<option value="2.事业单位会计制度">2.事业单位会计制度</option>
					<option value="9.其它">9.其它</option>
					</select><span class="btx_ts" style="color:red;">(*)</span>
				</td>
			</tr>
			<tr>
				<td class="table_right" align="right">
					执行会计准则类别：
				</td>
				<td>
					<select id="zxkjzzlb"  name="unit.zxkjzzlb" style="width: 162px;" >
					<option value="">请选择</option>
					<option value="1.2006年《企业会计准则》">1.2006年《企业会计准则》</option>
					<option value="2.2001年《企业会计准则》">2.2001年《企业会计准则》</option>
					<option value="3.小企业会计准则">3.小企业会计准则</option>
					</select>
				</td>
			</tr>
			<tr>
				<td class="table_right" align="right">
					登记注册类型：
				</td>
				<td>
					<select id="djzclx" name="unit.djzclx"  style="width: 162px;;">
					</select><span class="btx_ts" style="color:red;">(*)</span>
				</td>
			</tr>
			<tr>
				<td class="table_right" align="right">
					是否主营：
				</td>
				<td>
					<select id="sfzy"  name="unit.sfzy" style="width: 162px;" >
					<option value="">请选择</option>
					<option value="1.是">1.是</option>
					<option value="2.否">2.否</option>
					</select><span class="btx_ts" style="color:red;">(*)</span>
				</td>
			</tr>
			<tr>
				<td class="table_right" align="right">
					单位负责人：
				</td>
				<td>
					<input id="dwfzr" name="unit.dwfzr" type="text" style="width: 160px;"/><span class="btx_ts" style="color:red;">(*)</span>
				</td>
			</tr>
			<tr>
				<td class="table_right" align="right">
					联系电话：
				</td>
				<td>
					<input id="lxdh" name="unit.lxdh" type="text" style="width: 160px;"/><span class="btx_ts" style="color:red;">(*)</span>
				</td>
			</tr>
			<tr>
				<td class="table_right" align="right">
					收费公路：
				</td>
				<td>
					<select id="sfgl"  name="unit.sfgl" style="width: 162px;" >
					<option value="">请选择</option>
					<option value="1.还贷性">1.还贷性</option>
					<option value="2.经营性">2.经营性</option>
					<option value="3.还贷和经营性">3.还贷和经营性</option>
					</select><span class="btx_ts" style="color:red;">(*)</span>
				</td>
			</tr>
		</table>
		</form>
	</div>
	<div region="south" border="false" style="text-align:right;height:30px;line-height:30px;">
		<a id="dwgl_btn_Save" iconCls="icon-save" href="javascript:void(0)"  class="easyui-linkbutton" style="margin:2px 3px 0px 0px;" plain="true" >保　存</a>
		　<a id="dwgl_btn_Cancel" iconCls="icon-cancel" href="javascript:void(0)" class="easyui-linkbutton" style="margin:2px 3px 0px 0px;" plain="true">取　消</a>
	</div>
</div>
</body>
</html>