var obj=new Object();
function zhqkadd(){
	YMLib.UI.createWindow('zhqk_add','添加信息','zhqk_add.jsp','zhqk_add',970,450);
}
function closes(str){
	 parent.$('#'+str).window('destroy');
}
function zhqkxx(index){
	var data=$("#zhqk_table").datagrid('getRows')[index];
	obj=data;
	YMLib.UI.createWindow('zhqk_xx','详细信息','zhqk_xx.jsp','zhqk_xx',970,450);
}
function zhqkbj(index){
	var data=$("#zhqk_table").datagrid('getRows')[index];
	obj=data;
	YMLib.UI.createWindow('zhqk_bj','编辑信息','zhqk_bj.jsp','zhqk_bj',970,450);
}
function zhqksc(index){
	var data1=$("#zhqk_table").datagrid('getRows')[index];
	if(!confirm("您确认执行删除操作吗？")){
		return;
	}
	var data="zhqk.id="+data1.id;
	$.ajax({
		type:"post",
		url:"/jxzhpt/wjxt/deletezhqk.do",
		dataType:'json',
		data:data,
		success:function(msg){
			if(msg){
				alert("删除成功！");
				$("#zhqk_table").datagrid('reload');
				closes('zhqk_bj');
			}else{
				alert("删除失败！");
			}
		}
	});
}
//查所有
function showAll(){
		var gydw=$("#gydw1").combobox("getValue");
		if(gydw=='36')
			gydw='';
		var kssj=$('#kssj').datebox('getValue');
		var jssj=$('#jssj').datebox('getValue');
		$('#zhqk_table').datagrid({    
	    url:'/jxzhpt/wjxt/selectZhqkList.do',
	    striped:true,
	    pagination:true,
	    rownumbers:true,
	    pageNumber:1,
	    pageSize:10,
	    height:$(window).height()-$(window).height()*0.22,
	    width:$(window).width()-$(window).width()*0.019,
	    queryParams: {
	    	gydw:gydw,
	    	kssj:kssj,
	    	jssj:jssj
		},
		columns:[[
				    {field:'c',title:'操作',width:250,rowspan:2,align:'center',formatter:function(value,row,index){
				    		return '<a style="text-decoration:none;color:#3399CC; href="#" onclick="zhqkxx('+index+')">详细</a>   &nbsp;    '+'<a style="text-decoration:none;color:#3399CC; href="#" onclick="zhqkbj('+index+')">编辑</a>    &nbsp;   '+'<a style="text-decoration:none;color:#3399CC; href="#" onclick="zhqksc('+index+')">删除</a>    ';
				    	}
				    },
					{field:'gydwmc',title:'管养单位',width:500,rowspan:2,align:'center'},
					{field:'sbrq',title:'上报日期',width:300,rowspan:2,align:'center'},
				]]    
	}); 
}
