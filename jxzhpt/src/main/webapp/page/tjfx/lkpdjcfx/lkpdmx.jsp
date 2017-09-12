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
<script type="text/javascript">
$(function(){
	var tbnf;
	$('#lkpdbb').combobox({		
		url :"/jxzhpt/tjfx/getPdnf.do",
		valueField : "id",
		textField : "text",
		panelHeight:170,
		onLoadSuccess: function () { //加载完成后,设置选中第一项  
			var data = $('#lkpdbb').combobox('getData');  
            	 if (data.length > 0) {
                 	$('#lkpdbb').combobox('select', data[0].id);
                 	$('#roadcode').combotree({		
                		url :"/jxzhpt/tjfx/getLxldCombo.do?lkmxb.tbnf="+data[0].id,
                		panelHeight:170,
                        multiple:true,
                        checkBox:true
                    });
          		}   
         },
         onChange: function (n,o) {
        	 $('#roadcode').combotree({		
        			url :"/jxzhpt/tjfx/getLxldCombo.do?lkmxb.tbnf="+n,
        			panelHeight:170,
        	        multiple:true,
        	        checkBox:true
        	    });
         }
		
    });
	
	loadBmbm3("jsdj","技术等级");
	loadBmbm3("lmlx","路面类型");
	loadBmbm3("jcfx","方向");
	loadBmbm3("mqi","MQI等级");
	loadGrid();
});

function loadLd(){
	var tbnf=$('#lkpdbb').combobox("getValue");
	$('#roadcode').combotree({		
		url :"/jxzhpt/tjfx/getLxldCombo.do?lkmxb.tbnf="+tbnf,
		panelHeight:170,
        multiple:true,
        checkBox:true
    });
}

function loadGrid(){
	var jsdj=$('#jsdj').combobox("getValues").join(",");
	if(jsdj.substr(0,1)==',')
		jsdj=jsdj.substr(1,jsdj.length);
	var lmlx=$('#lmlx').combobox("getValues").join(",");
	if(lmlx.substr(0,1)==',')
		lmlx=lmlx.substr(1,lmlx.length);
	var jcfx=$('#jcfx').combobox("getValues").join(",");
	if(jcfx.substr(0,1)==',')
		jcfx=jcfx.substr(1,jcfx.length);
	var mqi=$('#mqi').combobox("getValues").join(",");
	if(mqi.substr(0,1)==',')
		mqi=mqi.substr(1,mqi.length);
	
	$("#grid").datagrid({  
		    border:true,
			pagination:true,
			rownumbers:true,
		    pageNumber:1,
		    pageSize:10,
		    fitColumns:true,
		    height:$(window).height()-150,
			width:$(window).width()-10,
			url:'/jxzhpt/tjfx/queryLkpdmx.do',
			queryParams : {
				 	'lkmxb.jsdj':jsdj,
				 	'lkmxb.lmlx':lmlx,
				 	'lkmxb.jcfx':jcfx,
				 	'lkmxb.lxbh':$('#roadcode').combotree("getValues").join(","),
				 	'lkmxb.mqi':mqi,
				 	'lkmxb.tbnf':$('#lkpdbb').combobox("getValue"),
				},
	    columns:[
	      [
			{field:'lxbh',title:'路线编码',width:80,align:'center',rowspan:2},
	        {field:'zh',title:'桩号',width:160,align:'center',rowspan:2},
	        {field:'cd',title:'长度',width:120,align:'center',rowspan:2},
	        {field:'ylxbm',title:'原路线编码',width:80,align:'center',rowspan:2},
	        {field:'yzh',title:'原桩号',width:160,align:'center',rowspan:2},
	        {field:'jcfx',title:'检查方向',width:120,align:'center',rowspan:2},
	        {field:'jsdj',title:'技术等级',width:120,align:'center',rowspan:2},
	        {field:'lmlx',title:'路面类型',width:120,align:'center',rowspan:2},
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
							<tr  height="28">
							 <td align="right">路况评定版本：</td>
							 <td>
							 <select class="easyui-combobox" id="lkpdbb" panelHeight="auto" style="width: 80px;"></select>
							 </td>
							  <td align="right">管辖路段：</td>
							 <td><select class="easyui-combobox" id="roadcode" panelHeight="auto" style="width: 180px;"></select></td>
							 
							  <td align="right">技术等级：</td>
							  <td><select id="jsdj" style="width:80px"class="easyui-combobox"></select></td>
							  </tr>
							  <tr height="28">
							  <td align="right">路面类型：</td>
							  <td><select id="lmlx" style="width:180px" class="easyui-combobox"></select></td>
							   <td align="right">方向：</td>
							  <td><select id="jcfx" style="width:80px"class="easyui-combobox"></select></td>
							  <td align="right">MQI等级：</td>
							  <td><select id="mqi" style="width:80px"class="easyui-combobox"></select></td>
							  </tr>
							  <tr >
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
