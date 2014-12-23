function dingwei(){
	alert("在地图上定位");
}
function wqxiangxi(){
	YMLib.UI.createWindow('wqxx','红色旅游开工详情','hslyxx.jsp','wqxx',700,450);
	//window.open("hslyxx.jsp");
}
function zjdw(){
	YMLib.UI.createWindow('wqxx','车购税资金到位情况','hslyzjdw.jsp','wqxx',800,450);
	//window.open("shzjdw.jsp");
}
function closes(str){
	 parent.$('#'+str).window('destroy');
}
function addCgs(){
	YMLib.UI.createWindow('wqxx','车购税资金到位添加','hslyzjdwtj.jsp','wqxx',700,240);
}
function editCgs(){
	YMLib.UI.createWindow('wqxx','车购税资金到位添加','hslyzjdwxg.jsp','wqxx',700,240);
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
	        {field:'c',title:'操作',width:150,align:'center',formatter:function(value,row,index){
	  	  	     return '<a href="#" onclick="wqxiangxi()">详细</a>    '+'<a href="#" onclick="zjdw()">资金到位</a>   ';
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

function showAllZJ(){
	$('#zjgrid').datagrid({    
	    url:'js/wqgz1.json',
	    striped:true,
	    pagination:true,
	    rownumbers:true,
	    pageNumber:1,
	    pageSize:10,
	    height:325,
	    columns:[[
	        {field:'c',title:'操作',width:150,align:'center',formatter:function(value,row,index){
	        	return '<a href="#" onclick="editCgs()">编辑</a>    '+'<a href="#" >删除</a>   ';
	        }},
	        {field:'tbyf',title:'填报月份 ',width:140,align:'center'},
	        {field:'tbsj',title:'填报时间 ',width:140,align:'center'},
	        {field:'tbr',title:'填报人 ',width:140,align:'center'},
	        {field:'cgsdwzj',title:'车购税到位资金(万元)',width:150,align:'center'}
	    ]]    
	}); 
}