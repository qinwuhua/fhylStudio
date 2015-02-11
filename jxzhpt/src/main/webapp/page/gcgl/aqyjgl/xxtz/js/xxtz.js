var obj1=new Object();
function xxtztj(){
	var weatherDlg = new J.dialog( {
		id : 'id2',
		title : '信息通知添加',
		page : 'upload.jsp?url='+"/jxzhpt/gcgl/uploadTzFile.do"+'&flag='+'aqyjgl%2fxxtz%2fxxtz'+'&id='+new Date().getTime(),
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
function xxtzxg(index){
	var data=$("#datagrid").datagrid('getRows')[index];
	obj1=data;
	var weatherDlg = new J.dialog( {
		id : 'id2',
		title : '信息通知编辑',
		page : 'upload1.jsp?url='+"/jxzhpt/gcgl/uploadTzFile.do"+'&flag='+'aqyjgl%2fxxtz%2fxxtz'+'&id='+data.id,
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
function deletetz(index){
	var data1=$("#datagrid").datagrid('getRows')[index];
	var data="gcgltz.id="+data1.id;
	if(confirm("确认删除吗？")){
		$.ajax({
			type:'post',
			url:'../../../../gcgl/deleteTzByid.do',
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
function deletetz1(index){
	var data1=$("#datagrid").datagrid('getRows')[index];
	var data="gcgltz.id="+data1.id;
	if(confirm("确认删除吗？")){
		$.ajax({
			type:'post',
			url:'../../../../gcgl/deleteTzByid1.do',
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

function closes(str){
	 parent.$('#'+str).window('destroy');
}
function showAll(){
	var gydw=$.cookie("unit");
	var kssj=$("#kssj").datebox('getValue');
	var jssj=$("#jssj").datebox('getValue');
	//alert(kssj+"---"+jssj+"---"+gydw);
	$('#datagrid').datagrid({    
	    url:'../../../../gcgl/selectxxtzlist.do',
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
	    	jssj:jssj
		},
	    columns:[[
	        {field:'c',title:'操作',width:120,align:'center',formatter:function(value,row,index){
	        	if(row.fszt=='未发送')
	        	return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="xxtzxg('+index+')">编辑</a>        '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="deletetz1('+index+')">删除</a>        '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="fstz('+index+')">未发送</a>    ';
	        	else	 return '编辑        '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="deletetz('+index+')">删除</a>        '+'已发送    ';

	        }},
	        {field:'title',title:'信息名称',width:200,align:'center'},
	        {field:'contens',title:'信息内容',width:500,align:'center'},
	        {field:'reportper',title:'发布人',width:100,align:'center'},
	        {field:'reporttime',title:'时间',width:94,align:'center'}
	    ]]    
	}); 
}
function fstz(index){
	if(!confirm("确认发送吗？")){
		return;
	}
	var data1=$("#datagrid").datagrid('getRows')[index];
	var data= "gcgltz.tjdepartmentcode="+data1.tjdepartmentcode+"&gcgltz.title="+data1.title+"&gcgltz.contens="+data1.contens+"&gcgltz.reportperuid="+data1.reportperuid
	+"&gcgltz.id="+data1.id+"&gcgltz.reportper="+data1.reportper+"&gcgltz.fsdwmc="+data1.fsdwmc+"&gcgltz.reporttime="+data1.reporttime;
	//alert(data);
	$.ajax({
			type:'post',
			url:'../../../../gcgl/insertTzck.do',
			data:data,
			dataType:'json',
			async:false,
			success:function(msg){
				if(Boolean(msg)){
					alert('保存成功！');
					$("#datagrid").datagrid('reload');
				}else{
					alert('保存失败！');
				}
			}
		});	
}
