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
var obj;
function openJsUpdate(_id){
	var str=new Date().getTime();
	obj= $("#tt").tabs("add",{
		id:_id+str,
		 title:"公路技术状况评定明细表",
		 href :"mxb_xx.jsp",
		 fit:true,
		 iconCls:'icon-file',
		 closable:true,
		 selected:true
	});
}
function Deletemxb(_id){
	var data="lkmxb.id="+_id;
	if(!confirm("确认删除吗？")){
		return;
	}
	$.ajax({
		type:'post',
		url:'/jxzhpt/wjxt/deletemxb.do',
		data:data,
		dataType:'json',
		success:function(msg){
			if(Boolean(msg)){
				alert('删除成功！');
				$("#jsgl_table").datagrid('reload');
			}else{
				alert('删除失败！');
			}
		}
	});	
}
$(function(){
	var year=new Date().getFullYear();
	for(var i=year;i>=2000;i--){
		$("#unit").append("<option>"+i+"年</option>");
	}
	showMxbAll();
});
function showMxbAll(){
	$("#jsgl_table").datagrid({
		border : true,
		fit : true,
		fitColumns : true,
		loadMsg : '正在加载请稍候...',
		url:'../../wjxt/selectMxbList.do',
		queryParams : {
			'lkmxb.tbnf' : $('#unit').val()
		},
		striped : true,
		singleSelect : false,
		columns : [[
		{
			field : 'bj',
			title : '操作',
			width : 200,
			align : 'center',
			formatter : function(value,rec,index){
				return '<input onclick=download("'+rec.id+'") style="width:60px;border:1px #8db2e3 solid;" type=button value=下载 />'+"&nbsp;&nbsp;&nbsp;"+
				'<input onclick=openJsUpdate("'+rec.id+'") style="width:60px;border:1px #8db2e3 solid;" type=button value=详细 />'+"&nbsp;&nbsp;&nbsp;"+
				'<input onclick=Deletemxb("'+rec.id+'") style="width:60px;border:1px #8db2e3 solid;" type=button value=删除 />';
			}
		},
		{field : 'tbnf',title : '年份',width : 200,align : 'center'},
		{field : 'tbdw',title : '填报单位',width : 300,align : 'center'}
		]]
	});
}
function download(id){
	window.location.href="/jxzhpt/wjxt/downLkpdmxbFile.do?id="+id
}
function dcmb(){
	window.location.href="/jxzhpt/xtgl/getModule_jhfeiLw.do?moduleName=gljszkpdmxb";
}
</script>
<div style="width:100%;">
    <div  style="height:84px;" border="false" >
	    <div id="righttop" >
			<div id="p_top">当前位置>&nbsp;路况评定>&nbsp;公路技术状况评定明细表</div>
		</div>
		<div  style="padding-left: 10px; padding-right: 10px;padding-top: 4px;padding-bottom: 4px;">
			<fieldset style="width:99%; text-align: left; vertical-align: middle; border:1px solid #cde0f3;">
 				<legend style="padding: 3px 0 3px 0; font-weight: bold; color: Gray; font-size: 12px;">
 					
 				</legend>
 				<div>
 					<p style="margin: 5px; ">
 						<span>年份：</span>
 						<select id="unit" style="width:150px;">
 							<option value="">全部</option>
 						</select>
 						<a id="yhgl_btn_search" href="javascript:void(0)" class="easyui-linkbutton" plain="true" iconCls="icon-search" onclick="showMxbAll()">查　询</a>&nbsp;
	 					<a id="yhgl_btn_add" href="javascript:void(0);" class="easyui-linkbutton" plain="true" iconCls="icon-add"  onclick="insertData('mxb')">导入数据</a>
	 					<a id="yhgl_btn_add" href="javascript:void(0);" class="easyui-linkbutton" plain="true" iconCls="icon-remove"  onclick="dcmb()">导出模板</a>
 					</p>
 				</div>
 			</fieldset>
        </div>
    </div>
    <div id="tt" border="false" class="easyui-tabs"  style="height:430px;">
    <script type="text/javascript">
                	$("#tt").attr('style','height:'+($(window).height()-90)+'px');
     </script>
	    <div title="明细列表" oncontextmenu='return false' unselectable="on" style="-webkit-user-select:none;-moz-user-select:none;" onselectstart="return false">
	    	<table id="jsgl_table" style="height:100%;" ></table>
	    </div>
    </div>
</div>
</body>
</html>