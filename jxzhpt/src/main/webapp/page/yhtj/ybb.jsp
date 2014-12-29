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
		//width:5000,
		fit:true,
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
				    {title:'分局(道班)名称',width:200,rowspan:2,align:'center'},
					{title:'清理塌方',width:300,colspan:2,align:'center'},
					{title:'回填路基缺口',width:300,align:'center'},
					{title:'路基翻浆处理',width:300,colspan:2,align:'center'},
					{title:'清理路边垃圾',width:300,align:'center'},
					{title:'整修路肩边坡',width:300,colspan:2,align:'center'},
					{title:'割草机割草',width:300,align:'center'},
					{title:'清理边沟',width:300,align:'center'},
					{title:'开挖标准水沟',width:300,align:'center'},
					{title:'边沟修复',width:300,colspan:2,align:'center'},
					{title:'路面清扫',width:300,colspan:2,align:'center'},
					{title:'修补油路坑槽',width:300,colspan:2,align:'center'},
					{title:'处理油路裂缝',width:300,colspan:2,align:'center'},
					{title:'修复水泥砼路面',width:300,align:'center'},
					{title:'水泥路面灌缝',width:300,colspan:2,align:'center'},
					{title:'桥梁维修',width:300,align:'center'},
					{title:'桥涵日常养护',width:300,colspan:2,align:'center'},
					{title:'增、修挡土墙',width:300,colspan:2,align:'center'},
					{title:'疏通泄水孔',width:300,align:'center'},
					{title:'清理伸缩缝',width:300,align:'center'},
					{title:'安装栏板',width:300,align:'center'},
					{title:'埋置示警桩',width:300,align:'center'},
					{title:'埋置公里桩/百米桩',width:300,align:'center'},
					{title:'花木灭虫',width:300,align:'center'},
					{title:'花木整枝',width:300,align:'center'},
					{title:'草坪除草',width:300,align:'center'},
					{title:'花木除草',width:300,align:'center'},
					{title:'路树灭虫',width:300,colspan:2,align:'center'},
					{title:'路树整枝',width:300,colspan:2,align:'center'}
				],[
					{title:'m³/m',width:300,colspan:2,align:'center'},
					{title:'m³',width:300,align:'center'},
					{title:'㎡/m',width:300,colspan:2,align:'center'},
					{title:'m³',width:300,align:'center'},
					{title:'㎡/m',width:300,colspan:2,align:'center'},
					{title:'㎡',width:300,align:'center'},
					{title:'m',width:300,align:'center'},
					{title:'m',width:300,align:'center'},
					{title:'m³/m',width:300,colspan:2,align:'center'},
					{title:'㎡/km',width:300,colspan:2,align:'center'},
					{title:'㎡/个',width:300,colspan:2,align:'center'},
					{title:'㎡/km',width:300,colspan:2,align:'center'},
					{title:'㎡',width:300,align:'center'},
					{title:'m/km',width:300,colspan:2,align:'center'},
					{title:'座',width:300,align:'center'},
					{title:'座/道',width:300,colspan:2,align:'center'},
					{title:'m³/m',width:300,colspan:2,align:'center'},
					{title:'个',width:300,align:'center'},
					{title:'m',width:300,align:'center'},
					{title:'m',width:300,align:'center'},
					{title:'m',width:300,align:'center'},
					{title:'个',width:300,align:'center'},
					{title:'㎡',width:300,align:'center'},
					{title:'㎡',width:300,align:'center'},
					{title:'㎡',width:300,align:'center'},
					{title:'㎡',width:300,align:'center'},
					{title:'棵/km',width:300,colspan:2,align:'center'},
					{title:'棵/km',width:300,colspan:2,align:'center'}
				]]
	});
});
</script>
<div style="width:100%;">
    <div  style="height:84px;" border="false">
	    <div id="righttop">
			<div id="p_top">当前位置>&nbsp;道班养护>&nbsp;公路养护小修保养月报表</div>
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
 							<option>全部</option>
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
    </div>
    <div style="height:500px;margin:5px;" oncontextmenu='return false' unselectable="on" style="-webkit-user-select:none;-moz-user-select:none;" onselectstart="return false">
    	<table id="jsgl_table" style="height:100%;" ></table>
    </div>
</div>
</body>
</html>