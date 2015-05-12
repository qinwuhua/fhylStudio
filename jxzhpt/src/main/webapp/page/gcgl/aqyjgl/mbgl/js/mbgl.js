function mbgltj(){
	var weatherDlg = new J.dialog( {
		id : 'id2',
		title : '模板管理添加',
		page : 'upload.jsp?url='+"/jxzhpt/gcgl/uploadMbglFile.do"+'&flag='+'aqyjgl%2fmbgl%2fmbgl',
		width : 570,
		height : 440,
		top : 0,
		rang : true,
		resize : false,
		cover : true
	});
	weatherDlg.ShowDialog();
	return false;
}
function closes(str){
	 parent.$('#'+str).window('destroy');
}
function showAll(){
	var wjmc=$("#wjmc").val();
	var ddlyear=+$("#ddlYear").val();
	var ddlmonth=$("#ddlMonth").val();
	
	$('#datagrid').datagrid({    
	    url:'../../../../gcgl/selectmbgllist.do',
	    striped:true,
	    pagination:true,
	    rownumbers:true,
	    pageNumber:1,
	    pageSize:10,
	    height:$(window).height()-$(window).height()*0.22,
	    width:$(window).width()-$(window).width()*0.019,
	    queryParams: {
	    	wjmc:wjmc,
	    	ddlyear: ddlyear,
	    	ddlmonth: ddlmonth
	    },
	    columns:[[
	        {field:'c',title:'操作',width:120,align:'center',formatter:function(value,row,index){
	        	return '<a  style="text-decoration:none;color:#3399CC;" href="/jxzhpt/gcgl/downMbglFile.do?id='+row.id+'" >下载</a>    '+'<a  style="text-decoration:none;color:#3399CC;" href="#" onclick="deletembgl('+index+')">删除</a>    ';
	        }},
	        {field:'filename',title:'文件名称',width:200,align:'center'},
	        {field:'wenhao',title:'文号',width:150,align:'center'},
	        {field:'uploadpeople',title:'上传人',width:100,align:'center'},
	        {field:'uploadpath',title:'上传单位',width:150,align:'center'},
	        {field:'reportmonth',title:'上报月份',width:93,align:'center'},
	        {field:'remark',title:'备注',width:200,align:'center'}
	    ]]    
	}); 
}
function deletembgl(index){
	var data1=$("#datagrid").datagrid('getRows')[index];
	if(confirm("确认删除吗？")){
	var data="id="+data1.id;
	$.ajax({
		type:'post',
		url:'../../../../gcgl/deleteMbgl.do',
		data:data,
		dataType:'json',
		success:function(msg){
			if(Boolean(msg)){
				alert('删除成功！');
				$("#datagrid").datagrid('reload');
			}else{
				alert('删除失败！');
			}
		}
	});	
	}
}