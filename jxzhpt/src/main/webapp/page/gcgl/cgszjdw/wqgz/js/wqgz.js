function dingwei(){
	alert("在地图上定位");
}
function wqxiangxi(){
	window.open("wqgzxx.jsp");
}

function zjdw(){
	window.open("wqgzzjdw.jsp");
}
function addCgs(){
	window.open("wqgzzjdwtj.jsp");
}
function editCgs(){
	window.open("wqgzzjdwxg.jsp");
}

function showAll(){
	$('#datagrid').datagrid({    
	    url:'js/wqgz.json',
	    striped:true,
	    pagination:true,
	    rownumbers:true,
	    pageNumber:1,
	    pageSize:10,
	    height:325,
	    columns:[[
	        {field:'c',title:'操作',width:150,align:'center',formatter:function(value,row,index){
	        	return '定位    '+'<a href="#" onclick="Showybxx()">详细</a>    '+'<a href="#" onclick="zjdw()">资金到位</a>   ';
	        }},
	        {field:'gydw',title:'管养单位',width:130,align:'center'},
	        {field:'xzqh',title:'行政区划',width:100,align:'center'},
	        {field:'qlbm',title:'桥梁编码',width:100,align:'center'},
	        {field:'qlmc',title:'桥梁名称',width:100,align:'center'},
	        {field:'qlzxzh',title:'桥梁中心桩号',width:100,align:'center'},
	        {field:'qlqk',title:'桥梁全宽',width:60,align:'center'},
	        {field:'qlqc',title:'桥梁全长',width:60,align:'center'},
	        {field:'kjzc',title:'跨径总长',width:60,align:'center'},
	        {field:'jsdj',title:'技术等级',width:60,align:'center'},
	        {field:'gjnf',title:'改建/修建年度',width:100,align:'center'}
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
