var obj=new Object();
function dingwei(){
	alert("在地图上定位");
}
function wqxiangxi(){
	YMLib.UI.createWindow('wqxx','工程改造路面升级开工详情','gcgzsjxx.jsp','wqxx',700,450);
	//window.open("gcgzsjxx.jsp");
}
function zjdw(){
	YMLib.UI.createWindow('wqxx1','车购税资金到位情况','gcgzsjzjdw.jsp','wqxx1',800,500);
	//window.open("gcgzsjzjdw.jsp");
}
function closes(str){
	 parent.$('#'+str).window('destroy');
}
function addCgs(){
	YMLib.UI.createWindow('wqxx','车购税资金到位添加','gcgzsjzjdwtj.jsp','wqxx',500,220);
}
function editCgs(index){
	var data=$("#zjgrid").datagrid('getRows')[index];
	obj=data;
	YMLib.UI.createWindow('wqxx','车购税资金到位编辑','gcgzsjzjdwxg.jsp','wqxx',500,220);
}

//添加车购税
function tjgcgzsjcgs(){
	var myDate = new Date();
	var y = myDate.getFullYear();
	var m = myDate.getMonth()+1;       //获取当前月份(0-11,0代表1月)
	var d = myDate.getDate();
	tbsj = y+"-"+m+"-"+d;
	tbyf = y+"-"+m;
	var data="gcglgcgzsj.cgsdwzj="+$("#tj_cgsdwzj").val()+"&gcglgcgzsj.tbr="+$.cookie("truename")+"&gcglgcgzsj.tbsj="+tbsj+"&gcglgcgzsj.tbyf="+tbyf
	+"&gcglgcgzsj.jhid="+"10";
	//alert(data);
	$.ajax({
		type:'post',
		url:'../../../../gcgl/insertGcgzsjCgs.do',
		data:data,
		dataType:'json',
		success:function(msg){
			if(Boolean(msg)){
				alert('保存成功！');
				parent.$("#zjgrid").datagrid('reload');
				closes('wqxx');
			}else{
				alert('该月车购税可能已存在，保存失败！');
			}
		}
	});	
	
}
//修改车购税
function xggcgzsjcgs(){
	var data="gcglgcgzsj.cgsdwzj="+$("#xg_cgsdwzj").val()
	+"&gcglgcgzsj.jhid="+parent.obj.jhid+"&gcglgcgzsj.id="+parent.obj.id;
	//alert(data);
	$.ajax({
		type:'post',
		url:'../../../../gcgl/updateGcgzsjCgs.do',
		data:data,
		dataType:'json',
		success:function(msg){
			if(Boolean(msg)){
				alert('保存成功！');
				parent.$("#zjgrid").datagrid('reload');
				closes('wqxx');
			}else{
				alert('保存失败！');
			}
		}
	});	
	
}
function delCgs(index){
	var data1=$("#zjgrid").datagrid('getRows')[index];
	var data="gcglgcgzsj.id="+data1.id;
	if(confirm("确认删除吗？")){
		$.ajax({
			type:'post',
			url:'../../../../gcgl/deleteGcgzsjCgs.do',
			data:data,
			dataType:'json',
			success:function(msg){
				if(Boolean(msg)){
					alert('删除成功！');
					$("#zjgrid").datagrid('reload');
				}else{
					alert('删除失败！');
				}
			}
		});	
	}	
}

function showAll(){
	$('#datagrid').datagrid({    
	    url:'js/sh.json',
	    striped:true,
	    pagination:true,
	    rownumbers:true,
	    pageNumber:1,
	    pageSize:10,
	    height:440,
	    columns:[[
	         {field:'c',title:'操作',width:150,align:'center',formatter:function(value,row,index){
	  	        return '定位    '+'<a href="#" onclick="wqxiangxi()">详细</a>    '+'<a href="#" onclick="zjdw()">资金拨付</a>   ';
	  	     }},
	        {field:'gydw',title:'管养单位',width:130,align:'center'},
	        {field:'xzqh',title:'行政区划',width:120,align:'center'},
	        {field:'lxbm',title:'路线编码',width:120,align:'center'},
	        {field:'lxmc',title:'路线名称',width:100,align:'center'},
	        {field:'qdzh',title:'起点桩号',width:60,align:'center'},
	        {field:'zdzh',title:'止点桩号',width:60,align:'center'},
	        {field:'zlc',title:'总里程',width:80,align:'center'},
	        {field:'yhlc',title:'隐患里程',width:80,align:'center'},
	        {field:'jsdj',title:'技术等级',width:100,align:'center'},
	    ]]    
	}); 
}

function showAllZJ(){
	$('#zjgrid').datagrid({    
		url:'../../../../gcgl/selectGcgzsjCgsList.do?jhid=10',
	    striped:true,
	    pagination:true,
	    rownumbers:true,
	    pageNumber:1,
	    pageSize:10,
	    height:315,
	    columns:[[
				{field:'c',title:'操作',width:150,align:'center',formatter:function(value,row,index){
					if(row.sbsj==""||row.sbyf>row.tbyf){
						return '<a href="#" onclick="editCgs('+index+')">编辑</a>    '+'<a href="#" onclick="delCgs('+index+')">删除</a>   ';
					}
					else return "月报已上报，不可操作";
				}},
				{field:'tbyf',title:'填报月份 ',width:140,align:'center'},
				{field:'tbsj',title:'填报时间 ',width:140,align:'center'},
				{field:'tbr',title:'填报人 ',width:140,align:'center'},
				{field:'cgsdwzj',title:'车购税到位资金(万元)',width:150,align:'center'}
	    ]]    
	}); 
}
