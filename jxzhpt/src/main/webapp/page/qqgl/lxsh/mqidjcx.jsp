<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MQI等级详细信息</title>
<link rel="stylesheet" type="text/css" href="/jxzhpt/css/Top.css" />
<link rel="stylesheet" type="text/css" href="/jxzhpt/css/style.css" />
<link rel="stylesheet" type="text/css" href="/jxzhpt/easyui/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="/jxzhpt/easyui/themes/icon.css" />
<script type="text/javascript" src="/jxzhpt/easyui/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="/jxzhpt/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="/jxzhpt/easyui/datagrid-detailview.js"></script>
<script type="text/javascript" src="/jxzhpt/easyui/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="/jxzhpt/js/util/jquery.cookie.js"></script>
<script type="text/javascript" src="/jxzhpt/js/YMLib.js"></script>
<script type="text/javascript">
		$(function(){
			var data=parent.YMLib.Var.Obj;
			var lxbh = data.ghlxbm;
			var qdzh = data.ghqdzh;
			var zdzh = data.ghzdzh;
			var flag = parent.YMLib.Var.sq;			
			$('#grid').datagrid({
			    border:true,
				rownumbers:true,
			    height:$(window).height(),
				width:$(window).width(),
				url:'/jxzhpt/tjfx/queryMqidjxx.do',
				queryParams: {
					'lkmxb.flag':flag,
					'lkmxb.lxbh':lxbh,
					'lkmxb.qdzh':qdzh,
					'lkmxb.zdzh':zdzh
				},
				columns:[[
					{field:'lxbh',title:'规划路线编码',width:80,align:'center',rowspan:2},
			        {field:'lxmc',title:'规划路线名称',width:100,align:'center',rowspan:2},
			        {field:'qdzh',title:'规划起点桩号',width:100,align:'center',rowspan:2},
			        {field:'zdzh',title:'规划止点桩号',width:100,align:'center',rowspan:2},
					{field:'ylxbm',title:'原路线编码',width:80,align:'center',rowspan:2},
			        {field:'yqdzh',title:'原起点桩号',width:100,align:'center',rowspan:2},
			        {field:'yzdzh',title:'原止点桩号',width:100,align:'center',rowspan:2},
			        {field:'cd',title:'长度',width:80,align:'center',rowspan:2},
			        {field:'jcfx',title:'检查方向',width:100,align:'center',rowspan:2},
			        {field:'jsdj',title:'技术等级',width:100,align:'center',rowspan:2},
			        {field:'lmlx',title:'路面类型',width:100,align:'center',rowspan:2},
			        {field:'mqi',title:'MQI',width:80,align:'center',rowspan:2},
			        {field:'mqidj',title:'MQI等级',width:100,align:'center',rowspan:2},
			        {field:'pqi',title:'路面PQI',width:80,align:'center',rowspan:2},
			        {field:'pqidj',title:'PQI等级',width:100,align:'center',rowspan:2},
			        {title:'路面分项指标',colspan:5},
			        {field:'sci',title:'路基SCI',width:80,align:'center',rowspan:2},
			        {field:'bci',title:'桥隧构造物BCI',width:80,align:'center',rowspan:2},
			        {field:'tci',title:'沿线设施TCI',width:80,align:'center',rowspan:2},
		         ],
				[	
				    {field:'pci',title:'PCI',width:80,align:'center',rowspan:1},
			        {field:'rqi',title:'RQI',width:80,align:'center',rowspan:1},
			        {field:'rdi',title:'RDI',width:80,align:'center',rowspan:1},
			        {field:'sri',title:'SRI',width:80,align:'center',rowspan:1},
			        {field:'pssi',title:'PSSI',width:80,align:'center',rowspan:1}
			    ]]
			});
		});		
	</script>
</head>
<body style="overflow: auto;">
	<table id="grid" height="99%" width="99%" border="0" style="margin-top:1px;margin-left:1px;overflow: auto;" cellspacing="0" cellpadding="0"></table>
</body>
</html>
    