function xxtztj(){
	YMLib.UI.createWindow('wqxx','信息通知添加','xxtztj.jsp','wqxx',600,440);
}
function xxtzxg(){
	YMLib.UI.createWindow('wqxx','信息通知编辑','xxtzxg.jsp','wqxx',600,440);
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
	    width:1123,
	    columns:[[
	        {field:'c',title:'操作',width:120,align:'center',formatter:function(value,row,index){
	        	return '<a href="#" onclick="xxtzxg()">编辑</a>    '+'<a href="#" onclick="download()">删除</a>    ';
	        }},
	        {field:'xxmc',title:'信息名称',width:200,align:'center'},
	        {field:'xxnr',title:'信息内容',width:500,align:'center'},
	        {field:'fbr',title:'发布人',width:200,align:'center'},
	        {field:'fbsj',title:'时间',width:200,align:'center'}
	    ]]    
	}); 
}

