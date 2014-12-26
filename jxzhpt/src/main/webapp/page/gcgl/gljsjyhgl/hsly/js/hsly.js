function dingwei(){
	alert("在地图上定位");
}
function wqxiangxi(){
	YMLib.UI.createWindow('wqxx','红色旅游开工详情','hslyxx.jsp','wqxx',740,450);
	//window.open("hslyxx.jsp");
}
function closes(str){
	 parent.$('#'+str).window('destroy');
}
function sfkaigong(){
	if(confirm("确认开工吗？"))
		return;
}
function ybsb(){
	YMLib.UI.createWindow('wqxx','红色旅游月报上报','hslyyb.jsp','wqxx',1059,450);
	//window.open("hslyyb.jsp");
}
function AddInfo(){
	YMLib.UI.createWindow('wqxx','红色旅游月报添加','hslyybtj.jsp','wqxx',900,400);
	//window.open("hslyybtj.jsp");
}
function Showybxx(){
	YMLib.UI.createWindow('wqxx','红色旅游月报详情','hslyybxx.jsp','wqxx',700,430);
	//window.open("hslyybxx.jsp");
}
function Edityb(){
	YMLib.UI.createWindow('wqxx','红色旅游月报编辑','hslyybxg.jsp','wqxx',900,400);
	//window.open("hslyybxg.jsp");
}
function Delyb(){
	if(confirm("确认删除吗？"))
		return;
}

function showAll(){
	$('#datagrid').datagrid({    
	    url:'js/sh.json',
	    striped:true,
	    pagination:true,
	    rownumbers:true,
	    pageNumber:1,
	    pageSize:10,
	    height:325,
	    columns:[[
	        {field:'c',title:'操作',width:250,align:'center',formatter:function(value,row,index){
	        	return '定位    '+'<a href="#" onclick="wqxiangxi()">详细</a>    '+'开工    '+'删除    '+'<a href="#" onclick="ybsb()">月报上报</a>   '+'完工   '+'未完工   ';
	        }},
	        {field:'c1',title:'是否全线开工',width:80,align:'center',formatter:function(value,row,index){
	        	return '<a href="#" onclick="Showybxx()">否</a>    ';
	        }},
	        {field:'xzqh',title:'行政区划',width:120,align:'center'},
	        {field:'jhnf',title:'计划年份',width:120,align:'center'},
	        {field:'xmmc',title:'项目名称',width:100,align:'center'},
	        {field:'jsxz',title:'建设性质',width:80,align:'center'},
	        {field:'ztz',title:'总投资',width:80,align:'center'},
	        {field:'kgn',title:'开工年',width:90,align:'center'},
	        {field:'wgn',title:'完工年',width:90,align:'center'},
	    ]]    
	}); 
}

function showYBlist(){
	$('#ybgrid').datagrid({    
	    url:'js/shyb.json',
	    striped:true,
	    pagination:true,
	    rownumbers:true,
	    pageNumber:1,
	    pageSize:10,
	    height:325,
	    columns:[
	             [
	              	{field:'c',title:'操作',width:200,align:'center',rowspan:2,formatter:function(value,row,index){
			        	return '<a href="#" onclick="Showybxx()">详细</a>    '+'<a href="#" onclick="Edityb()">编辑</a>   '+'删除   ';
			        }},
			        {field:'sbyf',title:'上报月份',width:130,align:'center',rowspan:2},
			        {field:'sbsj',title:'上报时间',width:130,align:'center',rowspan:2},
			        {field:'bywcdc',title:'本月完成垫层（m³）',width:130,align:'center',rowspan:2},
			        {field:'bywcjc',title:'本月完成基层（m³）',width:130,align:'center',rowspan:2},
			        {field:'bywcmc',title:'本月完成面层（公里）',width:130,align:'center',rowspan:2},
			        {field:'bfzj',title:'拨付资金（万元）',width:130,align:'center',rowspan:2},
			        {field:'jzkgdl',title:'截至开工段落',width:100,align:'center',rowspan:2},
			        {field:'qksm',title:'情况说明',width:130,align:'center',rowspan:2}
	             ]
	    ]
	});
}