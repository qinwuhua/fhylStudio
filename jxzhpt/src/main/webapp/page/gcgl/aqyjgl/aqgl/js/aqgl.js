function aqgltj(){
	var weatherDlg = new J.dialog( {
		id : 'id2',
		title : '安全管理月报表添加',
		page : 'upload.jsp?url='+"/jxzhpt/gcgl/uploadAqybFile.do"+'&flag='+'aqyjgl%2faqgl%2faqgl',
		width : 550,
		height : 440,
		top : 0,
		rang : true,
		resize : false,
		cover : true
	});
	weatherDlg.ShowDialog();
	return false;
}
function aqglxg(){
	YMLib.UI.createWindow('wqxx','安全管理月报表添加','aqglxg.jsp','wqxx',600,320);
}
function closes(str){
	 parent.$('#'+str).window('destroy');
}

//
function tjaqyb(){

//	var data=$("#aqybform").serialize();
//	alert(data);
	$.ajax({
		type:'post',
		url:'../../../../gcgl/addAqyb.do',
//		data:data,
		target:'#ifm',
		dataType:'xml',
		success:function(msg){
			if(Boolean(msg)){
				alert('保存成功！');
				parent.$("#ybgrid").datagrid('reload');
				closes('wqxx');
			}else{
				alert('保存失败！');
			}
		}
	});	
}

function showAll(){
	$('#datagrid').datagrid({    
	    url:'js/aqgl.json',
	    striped:true,
	    pagination:true,
	    rownumbers:true,
	    pageNumber:1,
	    pageSize:10,
	    height:440,
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

