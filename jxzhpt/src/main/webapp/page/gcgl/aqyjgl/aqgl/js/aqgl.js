var obj1=new Object();
function aqgltj(){
	var weatherDlg = new J.dialog( {
		id : 'id2',
		title : '安全管理月报表添加',
		page : 'upload.jsp?url='+"/jxzhpt/gcgl/uploadAqybFile.do"+'&flag='+'aqyjgl%2faqgl%2faqgl',
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
function aqglxg(index){
	var data=$("#datagrid").datagrid('getRows')[index];
	obj1=data;
	var weatherDlg = new J.dialog( {
		id : 'id2',
		title : '安全管理月报表编辑',
		page : 'upload1.jsp?url='+"/jxzhpt/gcgl/uploadAqybFile1.do"+'&flag='+'aqyjgl%2faqgl%2faqgl',
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
	var gydw=$("#gydw").combobox("getValue");
	var wjmc=$("#wjmc").val();
	var ddlyear=+$("#ddlYear").val();
	var ddlmonth=$("#ddlMonth").val();
	var type=$("#type").val();
		$('#datagrid').datagrid({    
	    url:'../../../../gcgl/selectaqyblist.do',
	    striped:true,
	    pagination:true,
	    rownumbers:true,
	    pageNumber:1,
	    pageSize:10,
	    height:$(window).height()-$(window).height()*0.22,
	    width:$(window).width()-$(window).width()*0.019,
	    queryParams: {
	    	gydw: gydw,
	    	wjmc:wjmc,
	    	ddlyear: ddlyear,
	    	ddlmonth: ddlmonth,
	    	type:type,
	    	gydw1: $.cookie("unit2")
		},
	    columns:[[
	        {field:'c',title:'操作',width:120,align:'center',formatter:function(value,row,index){
	        	return '<a  style="text-decoration:none;color:#3399CC;" href="/jxzhpt/gcgl/downAqybbFile.do?id='+row.id+'" >下载</a>    '+'<a  style="text-decoration:none;color:#3399CC;" href="#" onclick="aqglxg('+index+')">编辑</a>    '+'<a  style="text-decoration:none;color:#3399CC;" href="#" onclick="deleteaqyb('+index+')">删除</a>    ';
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
function deleteaqyb(index){
	var data1=$("#datagrid").datagrid('getRows')[index];
	if(confirm("确认删除吗？")){
	var data="id="+data1.id;
	$.ajax({
		type:'post',
		url:'../../../../gcgl/deleteAqybb.do',
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
function aqmbgl(){
	YMLib.UI.createWindow('wqxx','模板下载','aqmbgl.jsp','wqxx',650,400);
}
function showmbAll(){
	$('#mbgrid').datagrid({    
	    url:'../../../../gcgl/selectmbgllist1.do',
	    striped:true,
	    pagination:true,
	    rownumbers:true,
	    pageNumber:1,
	    pageSize:10,
	    height:350,
	    width:$(window).width()-$(window).width()*0.019,
	    queryParams: {
	    	wjmc:"",
	    	sendingunits:$.cookie("unit"),
	    	ddlyear: "",
	    	ddlmonth: ""
	    },
	    columns:[[
	        {field:'c',title:'操作',width:60,align:'center',formatter:function(value,row,index){
	        	return '<a  style="text-decoration:none;color:#3399CC;" href="/jxzhpt/gcgl/downMbglFile.do?id='+row.id+'" >下载</a>    ';
	        }},
	        {field:'filename',title:'文件名称',width:200,align:'center'},
	        {field:'uploadpeople',title:'上传人',width:92,align:'center'},
	        {field:'uploadpath',title:'上传单位',width:150,align:'center'},
	        {field:'reportmonth',title:'上报月份',width:88,align:'center'},
	    ]]    
	}); 
}
