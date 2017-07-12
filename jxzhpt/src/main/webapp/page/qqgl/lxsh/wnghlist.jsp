<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>五年规划list</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/Top.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/icon.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/datagrid-detailview.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/util/jquery.cookie.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YMLib.js"></script>
	<script type="text/javascript">
		$(function(){
			$('#grid').datagrid({
				url:'/jxzhpt/qqgl/qqglGpsroad.do',
				queryParams: {xmmc: parent.YMLib.Var.xmmc,
					xzqh: parent.YMLib.Var.xzqh,
					xmlx: parent.YMLib.Var.xmlx},
				height:$(window).height()-1,
				striped:true,
				fitColumns:true,
				columns:[[
				            {field:'allSel',title:'全选',width:60,align:'center',checkbox:'true'},
				            {field : 'xmmc',title :'项目名称',width : 300,align : 'center'},
						    {field : 'gydw',title :'管养单位',width : 150,align : 'center'},
						    {field : 'xzqh',title :'行政区划',width : 180,align : 'center'},
						    {field : 'ghlxbm',title :'规划路线编码',width : 180,align : 'center'},
						    {field : 'ghqdzh',title :'规划起点桩号',width : 100,align : 'center'},
						    {field : 'ghzdzh',title :'规划止点桩号',width : 100,align : 'center'},
						    {field:'qdmc',title:'起点名称',width:150,align:'center'},
						    {field:'zdmc',title:'止点名称',width:150,align:'center'},
						    {field : 'jszlc',title : '里程',width : 100,align : 'center'},
						    {field:'xjsdj',title:'现技术等级',width:100,align:'center'},
						    {field:'jsjsdj',title:'建设技术等级',width:200,align:'center'},
						    {field : 'tz',title : '投资',width : 120,align : 'center'},
						    {field : 'bzys',title : '补助测算',width : 120,align : 'center'},
						    {field : 'dfzc',title : '地方自筹',width : 150,align : 'center'},
						    {field : 'tsdq',title : '特殊地区',width : 500,align : 'center'}
						]]
			});
		});
		
		function selXm(){
			var rows=$('#grid').datagrid('getSelections');
			if(rows.length==0) {
				alert("请选择要立项的项目！");
				return;
			}
			var id;
			if(parent.$("#xmbms").val()!=""){
			    id=parent.$("#xmbms").val()+","+rows[0].id;
			}else{
				id=rows[0].id;
			}
			for(var i=1;i<rows.length;i++){
				id+=","+rows[i].id ;
			}
			parent.$("#xmbms").val(id);
// 			alert(id);
		    parent.$("#wnghxm").show();
			parent.$('#grid_wngh').datagrid({
				url:'/jxzhpt/qqgl/qqglGpsroad.do',
				queryParams: {xmbm: id,xmlx: parent.YMLib.Var.xmlx},
				striped:true,
				fitColumns:true,
				columns:[[
							
				            {field : 'xmmc',title :'项目名称',width : 300,align : 'center'},
						    {field : 'gydw',title :'管养单位',width : 150,align : 'center'},
						    {field : 'xzqh',title :'行政区划',width : 180,align : 'center'},
						    {field : 'ghlxbm',title :'规划路线编码',width : 180,align : 'center'},
						    {field : 'ghqdzh',title :'规划起点桩号',width : 100,align : 'center'},
						    {field : 'ghzdzh',title :'规划止点桩号',width : 100,align : 'center'},
						    {field:'qdmc',title:'起点名称',width:150,align:'center'},
						    {field:'zdmc',title:'止点名称',width:150,align:'center'},
						    {field : 'jszlc',title : '里程',width : 100,align : 'center'},
						    {field:'c',title:'操作',width:190,align:'center',formatter:function(value,row,index){
								var re= '<a style="text-decoration:none;color:#3399CC;"  onclick="delXm('+index+')">删除</a>';
								return re;
						    }}
						]]
			}); 
			parent.$('#wnghlist').window('destroy');
		}
	</script>
</head>
<body style="overflow: auto;">
     <div style="margin-top:2px;margin-left:5px;height: 30px;">
     <input onclick="selXm();" value="确认" type="submit" style="width: 60px;height: 25px;"/>
     </div>
	<table id="grid" height="99%" width="99%" border="0" style="margin-top:2px;margin-left:1px;overflow :auto;position:relative; width:1600px; " cellspacing="0" cellpadding="0"></table>
</body>
</html>
