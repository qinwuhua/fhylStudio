
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
	        	return '<a href="#" onclick="download()">下载</a>    '+'<a href="#" onclick="download()">查看</a>    '+'<a href="#" onclick="download()">删除</a>    ';
	        }},
	        {field:'gydw',title:'文件名称',width:200,align:'center'},
	        {field:'xzqh',title:'文号',width:200,align:'center'},
	        {field:'lxbm',title:'上传人',width:200,align:'center'},
	        {field:'lxmc',title:'上传部门',width:200,align:'center'},
	        {field:'bz',title:'备注',width:200,align:'center'},
	    ]]    
	}); 
}

