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
<script type="text/javascript" src="${pageContext.request.contextPath }/widget/newlhgdialog/lhgcore.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/widget/newlhgdialog/lhgdialog.min.js"></script>
<script type="text/javascript" src="./js/lkpd.js"></script>
</head>
<body style="margin:0 0 0 0;overflow: hidden;">
<script type="text/javascript">
function openJsUpdate(_id){
	$("#tt").tabs("add",{
		 title:"公路技术状况统计表",
		 href :"mxb_add.jsp",
		 fit:true,
		 iconCls:'icon-file',
		 closable:true,
		 selected:true
	});
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
		fitColumns : true,
		loadMsg : '正在加载请稍候...',
		url:'../../xtgl/selectJsList.do',
		queryParams : {
			'param.name' : $('#jsgl_name').val(),
			'param.descr' : $("#jsgl_descr").val()
		},
		striped : true,
		singleSelect : false,
		columns : [[
		{
			field : 'bj',
			title : '操作',
			width : 90,
			align : 'center',
			formatter : function(value,rec,index){
				return '<input onclick=openJsUpdate("'+rec.id+'") style="width:60px;border:1px #8db2e3 solid;" type=button value=详细 />'+
				'<input onclick=openJsUpdate("'+rec.id+'") style="width:60px;border:1px #8db2e3 solid;" type=button value=删除 />';
			}
		},{
			field : 'rolename',
			title : '年份',
			width : 300,
			align : 'center',
			formatter : function(value,rec,index){
				return '2013';
			}
		},{
			field : 'description',
			title : '填报单位',
			width : 300,
			align : 'center',
			formatter : function(value,rec,index){
				return '江西省公路管理局';
			}
		}
		]]
	});
});
$(function(){
	var year=new Date().getFullYear();
	for(var i=year;i>=2000;i--){
		$("#unit").append("<option value="+'i'+">"+i+"年</option>");
	}
});

</script>
<div style="width:100%;">
    <div  style="height:84px;" border="false">
	    <div id="righttop">
			<div id="p_top">当前位置>&nbsp;路况评定>&nbsp;路况评定明细</div>
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
 						</select>
 						<a id="yhgl_btn_search" href="javascript:void(0)" class="easyui-linkbutton" plain="true" iconCls="icon-search">查　询</a>
	 					<a id="yhgl_btn_add" href="javascript:void(0)"  onclick="insertData('mxb');"   class="easyui-linkbutton" plain="true" iconCls="icon-add">导入数据</a>
 					</p>
 				</div>
 			</fieldset>
        </div>
    </div>
    <div id="tt" border="false" class="easyui-tabs"  style="height:500px;">
	    <div title="明细列表" oncontextmenu='return false' unselectable="on" style="-webkit-user-select:none;-moz-user-select:none;" onselectstart="return false">
	    	<table id="jsgl_table" style="height:100%;" ></table>
	    </div>
    </div>
</div>
</body>
</html>