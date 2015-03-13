var obj=new Object();
function zdxxadd(){
	YMLib.UI.createWindow('zdxx_add','添加信息','jtzdxxb_add.jsp','zdxx_add',970,370);
}
function closes(str){
	 parent.$('#'+str).window('destroy');
}
function zdxxxx(index){
	var data=$("#zdxx_table").datagrid('getRows')[index];
	obj=data;
	YMLib.UI.createWindow('zdxx_xx','详细信息','jtzdxxb_xx.jsp','zdxx_xx',970,370);
}
function zdxxbj(index){
	var data=$("#zdxx_table").datagrid('getRows')[index];
	obj=data;
	YMLib.UI.createWindow('zdxx_bj','编辑信息','jtzdxxb_bj.jsp','zdxx_bj',970,370);
}
function zdxxsc(index){
	var data1=$("#zdxx_table").datagrid('getRows')[index];
	if(!confirm("您确认执行删除操作吗？")){
		return;
	}
	var data="zdxx.id="+data1.id;
	$.ajax({
		type:"post",
		url:"/jxzhpt/wjxt/deletezdxx.do",
		dataType:'json',
		data:data,
		success:function(msg){
			if(msg){
				alert("删除成功！");
				$("#zdxx_table").datagrid('reload');
			}else{
				alert("删除失败！");
			}
		}
	});
}

//查所有
function showAll(){
		var gydw=$("#gydw").combobox("getValue");
		if(gydw=='36')
			gydw='';
		var nf=$("#ddlYear").val();
		var yf=$("#ddlMonth").val();
		var tiaojian=nf+"-"+yf;
		$('#zdxx_table').datagrid({    
	    url:'/jxzhpt/wjxt/selectZdxxList.do',
	    striped:true,
	    pagination:true,
	    rownumbers:true,
	    pageNumber:1,
	    pageSize:10,
	    height:$(window).height()-$(window).height()*0.22,
	    width:$(window).width()-$(window).width()*0.019,
	    queryParams: {
	    	gydw:gydw,
	    	tiaojian:tiaojian
		},
		columns:[[
				    {field:'c',title:'操作',width:150,rowspan:2,align:'center',formatter:function(value,row,index){
				    		return '<a style="text-decoration:none;color:#3399CC; href="#" onclick="zdxxxx('+index+')">详细</a>   &nbsp;    '+'<a style="text-decoration:none;color:#3399CC; href="#" onclick="zdxxbj('+index+')">编辑</a>    &nbsp;   '+'<a style="text-decoration:none;color:#3399CC; href="#" onclick="zdxxsc('+index+')">删除</a>    ';
				    	}
				    },
					{field:'lxbm',title:'路线编码',width:100,align:'center'},
					{field:'lxmc',title:'路段名称',width:100,align:'center'},
					{field:'gydwmc',title:'管养单位',width:100,align:'center'},
					{field:'zdsj',title:'阻断时间',width:100,align:'center'},
					{field:'qdzh',title:'起点桩号',width:100,align:'center'},
					{field:'zdzh',title:'止点桩号 ',width:100,align:'center'},
					{field:'zhlb',title:'灾害类别',width:100,align:'center'},
					{field:'qtcs',title:'抢通措施',width:100,align:'center'},
					{field:'sfhf',title:'是否恢复',width:100,align:'center'},
					{field:'yjhfsj',title:'预计恢复时间',width:100,align:'center'},
					{field:'tbsj',title:'填报时间',width:100,align:'center'},
					{field:'tbdwmc',title:'填报单位',width:100,align:'center'},
					{field:'tjr',title:'统计人',width:100,align:'center'},
					{field:'shry',title:'审核人',width:100,align:'center'}
				]]    
	}); 
}
function exportZdxx(){
	var gydw=$("#gydw").combobox("getValue");
	if(gydw=='36')
		gydw='';
	var nf=$("#ddlYear").val();
	var yf=$("#ddlMonth").val();
	var tiaojian=nf+"-"+yf;
	var data="gydw="+gydw+"&tiaojian="+tiaojian;
	window.location.href="/jxzhpt/wjxt/exportExcel_zdxx.do?"+data;
}