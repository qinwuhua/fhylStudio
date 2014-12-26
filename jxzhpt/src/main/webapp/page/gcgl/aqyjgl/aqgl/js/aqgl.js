function aqgltj(){
	YMLib.UI.createWindow('wqxx','安全管理月报表添加','aqgltj.jsp','wqxx',600,320);
}
function aqglxg(){
	YMLib.UI.createWindow('wqxx','安全管理月报表添加','aqglxg.jsp','wqxx',600,320);
}
function closes(str){
	 parent.$('#'+str).window('destroy');
}
function showAll(){
	$('#datagrid').datagrid({    
	    url:'js/aqgl.json',
	    striped:true,
	    pagination:true,
	    rownumbers:true,
	    pageNumber:1,
	    pageSize:10,
	    height:325,
	    columns:[[
	        {field:'c',title:'操作',width:120,align:'center',formatter:function(value,row,index){
	        	return '<a href="#" onclick="download()">下载</a>    '+'<a href="#" onclick="download()">查看</a>    '+'<a href="#" onclick="aqglxg()">编辑</a>    '+'<a href="#" onclick="download()">删除</a>    ';
	        }},
	        {field:'wjmc',title:'文件名称',width:200,align:'center'},
	        {field:'wh',title:'文号',width:200,align:'center'},
	        {field:'scr',title:'上传人',width:200,align:'center'},
	        {field:'scbm',title:'上传部门',width:200,align:'center'},
	        {field:'bz',title:'备注',width:200,align:'center'},
	    ]]    
	}); 
}

