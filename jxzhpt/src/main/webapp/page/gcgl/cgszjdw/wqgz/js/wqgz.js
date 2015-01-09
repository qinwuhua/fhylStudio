var obj=new Object();
function dingwei(){
	alert("在地图上定位");
}
function wqxiangxi(){
	YMLib.UI.createWindow('wqxx','危桥改造开工详情','wqgzxx.jsp','wqxx',700,450);
	//window.open("wqgzxx.jsp");
}
function zjdw(){
	YMLib.UI.createWindow('wqxx1','车购税资金到位情况','wqgzzjdw.jsp','wqxx1',800,500);
	//window.open("wqgzzjdw.jsp");
}
function closes(str){
	 parent.$('#'+str).window('destroy');
}
function addCgs(){
	YMLib.UI.createWindow('wqxx','车购税资金到位添加','wqgzzjdwtj.jsp','wqxx',500,220);
}
function editCgs(index){
	var data=$("#zjgrid").datagrid('getRows')[index];
	obj=data;
	YMLib.UI.createWindow('wqxx','车购税资金到位编辑','wqgzzjdwxg.jsp','wqxx',500,220);
}
//添加车购税
function tjwqgzcgs(){
	var myDate = new Date();
	var y = myDate.getFullYear();
	var m = myDate.getMonth()+1;       //获取当前月份(0-11,0代表1月)
	var d = myDate.getDate();
	tbsj = y+"-"+m+"-"+d;
	tbyf = y+"-"+m;
	var data="gcglwqgz.cgsdwzj="+$("#tj_cgsdwzj").val()+"&gcglwqgz.tbr="+"admin"+"&gcglwqgz.tbsj="+tbsj+"&gcglwqgz.tbyf="+tbyf
	+"&gcglwqgz.jhid="+"11";
	//alert(data);
	$.ajax({
		type:'post',
		url:'../../../../gcgl/insertWqgzCgs.do',
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
function xgwqgzcgs(){
	var data="gcglwqgz.cgsdwzj="+$("#xg_cgsdwzj").val()
	+"&gcglwqgz.jhid="+parent.obj.jhid+"&gcglwqgz.id="+parent.obj.id;
	alert(data);
//	$.ajax({
//		type:'post',
//		url:'../../../../gcgl/updateWqgzCgs.do',
//		data:data,
//		dataType:'json',
//		success:function(msg){
//			if(Boolean(msg)){
//				alert('保存成功！');
//				parent.$("#zjgrid").datagrid('reload');
//				closes('wqxx');
//			}else{
//				alert('该月车购税可能已存在，保存失败！');
//			}
//		}
//	});	
	
}

function showAll(){
	$('#datagrid').datagrid({    
	    url:'js/wqgz.json',
	    striped:true,
	    pagination:true,
	    rownumbers:true,
	    pageNumber:1,
	    pageSize:10,
	    height:440,
	    columns:[[
	        {field:'c',title:'操作',width:150,align:'center',formatter:function(value,row,index){
	        	return '定位    '+'<a href="#" onclick="wqxiangxi()">详细</a>    '+'<a href="#" onclick="zjdw()">资金到位</a>   ';
	        }},
	        {field:'gydw',title:'管养单位',width:130,align:'center'},
	        {field:'xzqh',title:'行政区划',width:100,align:'center'},
	        {field:'qlbm',title:'桥梁编码',width:100,align:'center'},
	        {field:'qlmc',title:'桥梁名称',width:100,align:'center'},
	        {field:'qlzxzh',title:'桥梁中心桩号',width:100,align:'center'},
	        {field:'qlqk',title:'桥梁全宽',width:60,align:'center'},
	        {field:'qlqc',title:'桥梁全长',width:60,align:'center'},
	        {field:'kjzc',title:'跨径总长',width:60,align:'center'},
	        {field:'jsdj',title:'技术等级',width:60,align:'center'},
	        {field:'gjnf',title:'改建/修建年度',width:100,align:'center'}
	    ]]    
	}); 
}

function showAllZJ(){
	$('#zjgrid').datagrid({    
	    url:'../../../../gcgl/selectWqgzCgsList.do?jhid=10',
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
