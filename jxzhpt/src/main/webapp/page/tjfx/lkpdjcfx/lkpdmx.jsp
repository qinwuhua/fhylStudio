<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>路况评定明细</title>

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/Top.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/icon.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jscharts.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jscharts.plug.mb.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/widget/anyChart/js/AnyChart.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YMLib.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/util/jquery.cookie.js"></script>
<script type="text/javascript">
$(function(){
	$('#roadcode').combotree({		
		url :"/jxzhpt/tjfx/getLxldCombo.do",
		panelHeight:170,
        multiple:true,
        checkBox:true,        
    });
	
	loadBmbm2("jsdj","技术等级");
	loadBmbm2("lmlx","路面类型");
	loadBmbm2("jcfx","方向");
	loadGrid();
});

function loadGrid(){
	$("#grid").datagrid({  
		    border:true,
			pagination:true,
			rownumbers:true,
		    pageNumber:1,
		    pageSize:10,
		    fitColumns:true,
		    height:$(window).height()-100,
			width:$(window).width()-10,
			url:'/jxzhpt/tjfx/queryLkpdmx.do',
			queryParams : {
				 	'lkmxb.jsdj':$('#jsdj').combobox("getValue"),
				 	'lkmxb.lmlx':$('#lmlx').combobox("getValue"),
				 	'lkmxb.jcfx':$('#jcfx').combobox("getValue"),
				 	'lkmxb.lxbh':$('#roadcode').combotree("getValues").join(",")
				},
	    columns:[
	      [
			{field:'lxbh',title:'路线编码',width:80,align:'center',rowspan:2},
	        {field:'zh',title:'桩号',width:160,align:'center',rowspan:2},
	        {field:'cd',title:'长度',width:120,align:'center',rowspan:2},
	        {field:'mqi',title:'MQI',width:120,align:'center',rowspan:2},
	        {field:'pqi',title:'路面PQI',width:120,align:'center',rowspan:2},
	        {title:'路面分项指标',colspan:5},
	        {field:'sci',title:'路基SCI',width:140,align:'center',rowspan:2},
	        {field:'bci',title:'桥隧构造物BCI',width:140,align:'center',rowspan:2},
	        {field:'tci',title:'沿线设施TCI',width:140,align:'center',rowspan:2},
         ],
		[	
		    {field:'pci',title:'PCI',width:140,align:'center',rowspan:1},
	        {field:'rqi',title:'RQI',width:140,align:'center',rowspan:1},
	        {field:'rdi',title:'RDI',width:140,align:'center',rowspan:1},
	        {field:'sri',title:'SRI',width:140,align:'center',rowspan:1},
	        {field:'pssi',title:'PSSI',width:140,align:'center',rowspan:1},
	    ]  
	]		
	});  
	
}

</script>
<style type="text/css">
TD {
font-size: 12px;margin:0px;padding:0px;
}
a{
text-decoration:none;
}
.abgc_td td{padding-right:6px;}
</style>
</head>
<body>
		<div id="righttop">
		<div id="p_top">统计分析>&nbsp;路况评定决策分析>&nbsp;路况评定明细</div>
		</div>

	<table align="left" width="99%" cellpadding="0" cellspacing="0" border="0">
		<tr><td>
		
		</td></tr>
		<tr>
			<td align="left" style="padding-left:10px;padding-top: 10px;">
			<fieldset style="width:100%;text-align:left;vertical-align:middle;border:1px solid #cde0f3;">
				<legend style="padding: 0 0 0 0; font-weight: bold; color: Gray; font-size: 12px;">
				</legend>
				<div>
						<table style=" margin:7px; vertical-align:middle;" cellspacing="0" class="abgc_td" >
							<tr  height="32">
							  <td>管辖路段：</td>
							 <td><select class="easyui-combobox" id="roadcode" panelHeight="auto" style="width: 220px;"></select></td>
							  <td>路况评定版本：</td>
							 <td><select id="lkpdbb" style="width:70px"></select></td>
							  <td>技术等级：</td>
							  <td><select id="jsdj" style="width:70px"class="easyui-combobox"></select></td>
							  <td>路面类型：</td>
							  <td><select id="lmlx" style="width:105px" class="easyui-combobox"></select></td>
							   <td>方向：</td>
							  <td><select id="jcfx" style="width:70px"class="easyui-combobox"></select></td>
							  
							   <td colspan="10">
							 	<img name="btnSelect" id="btnSelect" onmouseover="this.src='../../../images/Button/Serch02.gif'" alt="查询" onmouseout="this.src='../../../images/Button/Serch01.gif'" src="../../../images/Button/Serch01.gif"  onclick="loadGrid();"style="border-width:0px;cursor: hand;" />
							  </td>
							</tr>
							</table>
						</div>
					</fieldset>
					</td>
					</tr>
		</table>
		<div id="grid" width="100%" ></div>
</body>
</html>
