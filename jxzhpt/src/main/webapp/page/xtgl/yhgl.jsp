<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户信息管理</title>
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
<body style="margin:0 0 0 0;overflow: hidden;">
<script type="text/javascript">
function openYhUpdate(_index){
	//yhxx = lxData[_index];
	YMLib.UI.createWindow('yhgl_update_win','编辑用户','./yhgl_update.jsp','xmgl_03',470,370);
}
function deleteYh(_id){
	$.messager.confirm('确认', '是否确认删除所选数据？', function(r){
		if (r){
			$.ajax({
				 type : "POST",
				 url : "../../xtgl/deleteYh.do",
				 dataType : 'json',
				 data : 'yhm=' +_id,
				 success : function(msg){
					 if(msg){
						 YMLib.Tools.Show('删除成功！',3000);
						 $("#yhgl_table").datagrid('reload');
					 }else{
						 YMLib.Tools.Show('删除失败',3000);
					 }
				 },
				 error : function(){
					 YMLib.Tools.Show('服务器请求无响应！error code = 404',3000);
				 }
			});
		}
	});
}

$(function(){
	$("#jsgl_table").datagrid({
		border:false,
		//height:500,
		//width:1000,
		fit:true,
		pagination:true,
	    rownumbers:true,
	    pageNumber:1,
	    pageSize:10,
	    fitColumns:true,
		loadMsg:'正在加载请稍候...',
		url:'../../xtgl/selectYhList.do',
		striped:true,
		singleSelect:false,
		columns:[[
		{
			field : 'bj',
			title : '编辑',
			width : 150,
			align : 'center',
			formatter : function(value,rec,index){
				return '<input onclick=openYhUpdate("'+rec.id+'") style="width:60px;border:1px #8db2e3 solid;" type=button value=编辑 />'+
				'<input onclick=deleteYh("'+rec.id+'") style="width:60px;border:1px #8db2e3 solid;" type=button value=删除 />';
			}
		},{
			field : 'unit',
			title : '所属单位',
			width : 100,
			align : 'center'
		},{
			field : 'truename',
			title : '用户名',
			width : 100,
			align : 'center'
		},{
			field : 'name',
			title : '真实姓名',
			width : 100,
			align : 'center'
		},{
			field : 'sex',
			title : '性别',
			width : 100,
			align : 'center'
		},{
			field : 'idcard',
			title : '身份证号',
			width : 100,
			align : 'center'
		},{
			field : 'tel',
			title : '电话',
			width : 100,
			align : 'center'
		},{
			field : 'phone',
			title : '手机',
			width : 100,
			align : 'center'
		},{
			field : 'roleid',
			title : '角色',
			width : 100,
			align : 'center'
		}
		]]
	});
	
	$("#yhgl_btn_add").click(function(){
		YMLib.UI.createWindow('yhgl_add_win','添加用户','./yhgl_add.jsp','app_add',470,370);
	});
	$("#yhgl_btn_search").click(function(){
		startSearch();
	});
});
</script>
<div style="width:100%;">
    <div  style="height:96px;" border="false">
	    <div id="righttop">
			<div id="p_top">当前位置>&nbsp;系统管理>&nbsp;用户信息管理</div>
		</div>
		<div  style="padding-left: 10px; padding-right: 10px;">
			<fieldset style="width:99%; text-align: left; vertical-align: middle;">
 				<legend style="padding: 3px 0 3px 0; font-weight: bold; color: Gray; font-size: 12px;">
 					
 				</legend>
 				<div>
 					<p style="margin: 5px;">
 						<span>所属单位：</span>
 						<select id="unit" style="width:227px;"></select>
 						<span>&nbsp;用户名：</span>
 						<input id="yhgl_name" type="text"/>
 						<a id="yhgl_btn_search" href="javascript:void(0)" class="easyui-linkbutton" plain="true" iconCls="icon-search">查　询</a>
	 					<a id="yhgl_btn_add" href="javascript:void(0)" class="easyui-linkbutton" plain="true" iconCls="icon-add">添　加</a>
 					</p>
 				</div>
 			</fieldset>
        </div>
    </div>
    <div style="height:350px;">
    	<table id="jsgl_table" width="100%"></table>
    </div>
</div>
</body>
</html>