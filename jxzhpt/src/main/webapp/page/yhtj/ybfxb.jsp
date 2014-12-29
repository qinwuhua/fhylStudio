<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>角色分配管理</title>
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
function openJsUpdate(_id){
	$("#jsgl_table").datagrid('unselectAll');
	YMLib.Var.ID = _id;
	YMLib.UI.createWindow('jsgl_update_win','编辑角色','./jsgl_update.jsp','xmgl_03',630,330);
}
function deleteJs(_id){
	$.messager.confirm('确认', '是否确认删除所选数据？', function(r){
		if (r){
			$.ajax({
				 type : "POST",
				 url : "../../xtgl/deleteJsById.do",
				 dataType : 'json',
				 data : 'param.id=' +_id,
				 success : function(msg){
					 if(msg){
						 YMLib.Tools.Show('删除成功！',3000);
						 $("#jsgl_table").datagrid('reload');
					 }else{
						 YMLib.Tools.Show('删除失败,请确认没有用户属于此角色',3000);
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
		border : true,
		fit : true,
		//fitColumns : true,
		loadMsg : '正在加载请稍候...',
		url:'../../xtgl/selectJsList.do',
		queryParams : {
			'param.name' : $('#jsgl_name').val(),
			'param.descr' : $("#jsgl_descr").val()
		},
		striped : true,
		singleSelect : false,
		columns:[[
		    {title:'分局',width:200,rowspan:3,align:'center'},
			{title:'实际评定养护里程Km',width:300,rowspan:3,align:'center'},
			{title:'本 月 路 况',width:600,colspan:6,align:'center'},
			{title:'其 中',width:400,colspan:4,align:'center'}
		],[
			{title:'优良路率 %',colspan:3,width:300,align:'center'},
			{title:'MQI',colspan:3,width:300,align:'center'},
			{title:'油 路',colspan:2,width:200,align:'center'},
			{title:'水 泥 路',colspan:2,width:200,align:'center'}
		],[
			{title:'上月优良路率%',width:100,align:'center'},
			{title:'本月优良路率%',width:100,align:'center'},
			{title:'优良路率比上月↑↓',width:100,align:'center'},
			{title:'上月MQI',width:100,align:'center'},
			{title:'本月MQI',width:100,align:'center'},
			{title:'MQI比上月↑↓',width:100,align:'center'},
			{title:'上月优良路率%',width:100,align:'center'},
			{title:'本月优良路率%',width:100,align:'center'},
			{title:'上月优良路率%',width:100,align:'center'},
			{title:'本月优良路率%',width:100,align:'center'}
		]]
	});
});
</script>
<div style="width:100%;">
    <div  style="height:104px;" border="false">
	    <div id="righttop">
			<div id="p_top">当前位置>&nbsp;道班养护>&nbsp;公路管理月报分析表</div>
		</div>
		<div  style="padding-left: 10px; padding-right: 10px;">
			<fieldset style="width:99%; text-align: left; vertical-align: middle;">
 				<legend style="padding: 3px 0 3px 0; font-weight: bold; color: Gray; font-size: 12px;">
 					
 				</legend>
 				<div>
 					<p style="margin: 5px;">
 						<span>年份：</span>
 						<select id="unit" style="width:150px;">
 							<option>全部</option>
	 						<option>2014</option>
	 						<option>2013</option>
	 						<option>2012</option>
	 						<option>2011</option>
	 						<option>2010</option>
 						</select>
 						<span>月份：</span>
 						<select id="unit" style="width:150px;">
	 						<option>12</option>
	 						<option>11</option>
	 						<option>10</option>
	 						<option>9</option>
	 						<option>8</option>
 						</select>
 						<a id="yhgl_btn_search" href="javascript:void(0)" class="easyui-linkbutton" plain="true" iconCls="icon-search">查　询</a>
	 					<a id="yhgl_btn_add" href="javascript:void(0)" class="easyui-linkbutton" plain="true" iconCls="icon-add">导出Excel</a>
 					</p>
 				</div>
 			</fieldset>
        </div>
        <div><font style="font-size: 12px;">2014年 12 月份公路管理局月报分析</font></div>
    </div>
    <div style="height:500px;margin:5px;" oncontextmenu='return false' unselectable="on" style="-webkit-user-select:none;-moz-user-select:none;" onselectstart="return false">
    	<table id="jsgl_table" style="height:100%;" ></table>
    </div>
</div>
</body>
</html>