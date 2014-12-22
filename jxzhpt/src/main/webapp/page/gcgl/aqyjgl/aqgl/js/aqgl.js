function dingwei(){
	alert("在地图上定位");
}
function wqxiangxi(){
	window.open("abgcxx.jsp");
}
function sfkaigong(){
	if(confirm("确认开工吗？"))
		return;
}
function ybsb(){
	window.open("abgcyb.jsp");
}
function AddInfo(){
	window.open("abgcybtj.jsp");
}
function Showybxx(){
	window.open("abgcybxx.jsp");
}
function Edityb(){
	window.open("abgcybxg.jsp");
}
function Delyb(){
	if(confirm("确认删除吗？"))
		return;
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
	        	return '<a href="#" onclick="download()">下载</a>    ';
	        }},
	        {field:'gydw',title:'上传单位',width:250,align:'center'},
	        {field:'xzqh',title:'文件名称',width:250,align:'center'},
	        {field:'lxbm',title:'上传时间',width:250,align:'center'},
	        {field:'lxmc',title:'上传人',width:250,align:'center'},
	    ]]    
	}); 
}

