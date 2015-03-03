var obj1=new Object();
function xxcxxx1(index){
	var data=$("#datagrid").datagrid('getRows')[index];
	obj1=data;
	var data1="id="+data.id;
	$.ajax({
		type:'post',
		url:'/jxzhpt/gcgl/xgTzzt.do',
		data:data1,
		dataType:'json',
		success:function(msg){
			 $("#datagrid").datagrid('reload');
		}
	});	
	YMLib.UI.createWindow('wqxx','信息通知详情','xxcxxx.jsp','wqxx',600,390);
}
function xxcxxx(index){
	var data=$("#datagrid").datagrid('getRows')[index];
	obj1=data;
	YMLib.UI.createWindow('wqxx','信息通知详情','xxcxxx.jsp','wqxx',600,390);
}
function closes(str){
	 parent.$('#'+str).window('destroy');
	
}
function showAll(){
	var gydw=$.cookie("unit");
	var kssj=$("#kssj").datebox('getValue');
	var jssj=$("#jssj").datebox('getValue');
	var ckzt=$("#ckzt").val();
	$('#datagrid').datagrid({    
	    url:'../../../../gcgl/selectxxtzcxlist.do',
	    striped:true,
	    pagination:true,
	    rownumbers:true,
	    pageNumber:1,
	    pageSize:10,
	    height:$(window).height()-$(window).height()*0.22,
	    width:$(window).width()-$(window).width()*0.019,
	    queryParams: {
	    	gydw: gydw,
	    	kssj:kssj,
	    	jssj:jssj,
	    	ckzt:ckzt
		},
	    columns:[[
	        {field:'c',title:'操作',width:120,align:'center',formatter:function(value,row,index){
	        	if(row.ckzt=='未查看')
	        	return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="xxcxxx1('+index+')">未查看</a>&nbsp;&nbsp;        '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="deleteTzck('+index+')">删除</a>    ';
	        	else 	return '<a style="text-decoration:none;color:#6E6E6E;" href="#" onclick="xxcxxx('+index+')">已查看</a>&nbsp;&nbsp;        '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="deleteTzck1('+index+')">删除</a>    ';

	        }},
	        {field:'title',title:'信息名称',width:200,align:'center'},
	        {field:'contens',title:'信息内容',width:500,align:'center'},
	        {field:'reportper',title:'发布人',width:100,align:'center'},
	        {field:'reporttime',title:'时间',width:95,align:'center'}
	    ]]    
	}); 
}
function deleteTzck(index){
	var data1=$("#datagrid").datagrid('getRows')[index];
	var data="gcgltz.id="+data1.id;
	if(confirm("该通知尚未查看，您确认删除吗？")){
		$.ajax({
			type:'post',
			url:'../../../../gcgl/deleteTzckByid.do',
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
function deleteTzck1(index){
	var data1=$("#datagrid").datagrid('getRows')[index];
	var data="gcgltz.id="+data1.id;
	if(confirm("确认删除吗？")){
		$.ajax({
			type:'post',
			url:'../../../../gcgl/deleteTzckByid.do',
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
