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
<body style="margin:0 0 0 0;overflow: hidden;">
<script type="text/javascript">
$(function(){
	$("#jsgl_table").datagrid({
		border:true,
		fit : true,
		fitColumns : true,
		loadMsg : '正在加载请稍候...',
		url:'../../xtgl/selectExistQlProgramList.do',
		queryParams : {
			'param.sourceid' : parent.YMLib.Var.bm
		},
		striped : true,
		singleSelect : false,
		columns : [[
		{
			field : 'mx',
			title : '明细',
			width : 80,
			align : 'center',
			formatter : function(value,rec,index){
				return '<input onclick="onclickXx('+"'"+rec.id+"'"+')" style="width:60px;border:1px #8db2e3 solid;" type="button" value="查看明细"/>';
			}
		},{
			field : 'rolename',
			title : '项目名称',
			width : 100,
			align : 'center'
		},{
			field : 'source',
			title : '桥梁中心桩号',
			width : 100,
			align : 'center'
		},{
			field : 'name',
			title : '所属单位',
			width : 200,
			align : 'center'
		},{
			field : 'desr',
			title : '年份',
			width : 50,
			align : 'center'
		}]]
	});
});
function onclickXx(id){
	url="/jxzhpt/page/jhgl/jhkxx/wqgz.jsp";
	parent.YMLib.Var.jhbm=id;
	parent.YMLib.Var.bz="xx";
	parent.YMLib.UI.createWindow('xmxx_xx','项目信息',url,'xmxx',1000,500);
}
</script>
<div style="width:100%;">
    <div style="height:500px;" oncontextmenu='return false' unselectable="on" style="-webkit-user-select:none;-moz-user-select:none;" onselectstart="return false">
    	<table id="jsgl_table" style="height:100%;" ></table>
    </div>
</div>
</body>
</html>