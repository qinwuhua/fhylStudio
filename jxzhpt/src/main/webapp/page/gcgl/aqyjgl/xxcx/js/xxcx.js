function xxcxxx(){
	YMLib.UI.createWindow('wqxx','信息通知详情','xxcxxx.jsp','wqxx',600,390);
}
function closes(str){
	 parent.$('#'+str).window('destroy');
}
function showAll(){
	$('#datagrid').datagrid({    
	    url:'js/abgc.json',
	    striped:true,
	    pagination:true,
	    rownumbers:true,
	    pageNumber:1,
	    pageSize:10,
	    height:325,
	    columns:[[
	        {field:'c',title:'操作',width:120,align:'center',formatter:function(value,row,index){
	        	return '<a href="#" onclick="xxcxxx()">查看</a>    '+'<a href="#" onclick="download()">删除</a>    ';
	        }},
	        {field:'xxmc',title:'信息名称',width:200,align:'center'},
	        {field:'xxnr',title:'信息内容',width:400,align:'center'},
	        {field:'fbr',title:'发布人',width:200,align:'center'},
	        {field:'fbsj',title:'时间',width:200,align:'center'}
	    ]]    
	}); 
}

