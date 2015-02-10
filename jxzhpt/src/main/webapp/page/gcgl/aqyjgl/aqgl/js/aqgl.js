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


function showAll(){
	var gydw=$("#gydw").combobox("getValue");
	if(gydw=='36')
		gydw='';
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
	    height:440,
	    queryParams: {
	    	gydw: gydw,
	    	wjmc:wjmc,
	    	ddlyear: ddlyear,
	    	ddlmonth: ddlmonth,
	    	type:type,
	    	gydw1: $.cookie("unit2"),
		},
	    columns:[[
	        {field:'c',title:'操作',width:120,align:'center',formatter:function(value,row,index){
	        	return '<a href="#" onclick="download()">下载</a>    '+'<a href="#" onclick="aqglxg()">编辑</a>    '+'<a href="#" onclick="download()">删除</a>    ';
	        }},
	        {field:'filename',title:'文件名称',width:200,align:'center'},
	        {field:'wenhao',title:'文号',width:200,align:'center'},
	        {field:'uploadpeople',title:'上传人',width:100,align:'center'},
	        {field:'uploadpath',title:'上传单位',width:200,align:'center'},
	        {field:'reportmonth',title:'上报月份',width:100,align:'center'},
	        {field:'remark',title:'备注',width:200,align:'center'}
	    ]]    
	}); 
}

