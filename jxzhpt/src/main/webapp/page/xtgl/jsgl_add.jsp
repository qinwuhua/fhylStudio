<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>角色添加</title>
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
	if(!$("#jsgl_form #jsgl_form_table").form('validate')){
		return;
	}
	if($("#name").val()==""){
		alert("请输入角色名称！");
		return false;
	}
	if($("#qx").combotree("getValues")==""){
		alert("请选择角色权限！");
		return false;
	}
	
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
		 }
	});
	delete param;
}
$(function(){
	loadQx("qx");
	$("#jsgl_btn_Save").click(function(){
		save();
	});
	$("#jsgl_btn_Cancel").click(function(){
		$("#jsgl_add_win").window('destroy');
	});
});

function loadQx(_id){
	$('#'+id).combotree({
		checkbox: false,
		multiple:true,
		url: '../../xtgl/selAllQx.do?yhdw=01',
		onBeforeExpand:function(node,param){
			$('#'+id).combotree("tree").tree('options').url = "../../xtgl/selAllQx2.do?yhdw="+node.id;
		},
		onSelect:function(node){}
	});
}
</script>
<div id="jsgl_layout" class="easyui-layout" fit="true">
	<div region="center" border="false" style="padding:0px;border-bottom-width:1px;">
	<form id="jsgl_form" style="overflow-x:hidden">
		<table id="jsgl_form_table" cellspacing="0"  class="table_grid">
			<tr height="30px">
				<td width="80px" align="right">
					角色名称：
				</td>
				<td>
					<input style="width:248px;" type="text" id="name" name="param.name"/>
				</td>
			</tr>
			<tr>
				<td width="80px" align="right">
					权限分配：
				</td>
				<td>
				<input id="qx"  type="text" name="param.qx"/>
				<!-- 
					<table border="0" cellspacing="0" style="height: 26px;border:1px solid #C1DAD7;border-right: 0px;border-bottom: 0px;" id="resource">
						<tr><td rowspan="28">计划管理子系统</td><td>电子地图</td><td>电子地图</td></tr>
						
						<tr><td rowspan="3">路网项目</td><td>危桥改造项目</td></tr>
						<tr><td>安保工程项目</td></tr>
						<tr><td>灾害防治项目</td></tr>
						
						<tr><td rowspan="9">计划管理</td><td>工程改造路面升级项目</td></tr>
						<tr><td>工程改造路面改建项目</td></tr>
						<tr><td>养护大中修项目</td></tr>
						<tr><td>水毁项目</td></tr>
						<tr><td>危桥改造项目</td></tr>
						<tr><td>安保工程项目</td></tr>
						<tr><td>灾害防治项目</td></tr>
						<tr><td>红色旅游公路项目</td></tr>
						<tr><td>战备公路项目</td></tr>
						
						<tr><td rowspan="12">工程管理</td><td>危桥改造施工</td></tr>
						<tr><td>安保工程施工</td></tr>
						<tr><td>灾害防治施工</td></tr>
						<tr><td>养护大中修施工</td></tr>
						<tr><td>水毁施工</td></tr>
						<tr><td>工程改造路面改建施工</td></tr>
						<tr><td>工程改造路面升级项目施工</td></tr>
						<tr><td>红色旅游施工</td></tr>
						<tr><td>安全管理月报表</td></tr>
						<tr><td>模板管理</td></tr>
						<tr><td>信息通知</td></tr>
						<tr><td>信息通知数据查询</td></tr>
						
						<tr><td>工程报表</td><td>工程报表</td></tr>
						<tr><td>数据查询</td><td>数据查询</td></tr>
						<tr><td>统计分析</td><td>统计分析</td></tr>
						<tr><td>地理信息子系统</td><td>地理信息子系统</td><td>地理信息子系统</td></tr>
						<tr><td>外接数据子系统</td><td>外接数据子系统</td><td>外接数据子系统</td></tr>
						
						<tr><td rowspan="5">系统管理子系统</td><td rowspan="5">系统管理</td><td>角色分配管理</td></tr>
						<tr><td>行政区划管理</td></tr>
						<tr><td>部门信息管理</td></tr>
						<tr><td>特殊地区</td></tr>
						<tr><td>用户信息管理</td></tr>
					</table>
					 -->
				</td>
			</tr>
			<tr>
				<td width="80px" align="right">
					角色描述：
				</td>
				<td>
					<input id="descr" class="easyui-validatebox" required="true" validType="notNULL" name="param.descr" type="text" style="width:248px;" maxlength="60"/>
					<input type="hidden" name="param.czsj" id="czsj" />
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