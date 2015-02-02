var obj=new Object();
var obj1=new Object();
function dingwei(){
	alert("在地图上定位");
}
function wqxiangxi(index){
	var data=$("#datagrid").datagrid('getRows')[index];
	obj1=data;
	YMLib.UI.createWindow('wqxx','灾害防治开工详情','zhfzxx.jsp','wqxx',700,450);
	//window.open("zhfzxx.jsp");
}
function zjdw(index){
	var data=$("#datagrid").datagrid('getRows')[index];
	obj1=data;
	YMLib.UI.createWindow('wqxx1','车购税资金到位情况','zhfzzjdw.jsp','wqxx1',800,500);
	//window.open("abgczjdw.jsp");
}
function closes(str){
	 parent.$('#'+str).window('destroy');
}
function addCgs(){
	YMLib.UI.createWindow('wqxx','车购税资金到位添加','zhfzzjdwtj.jsp','wqxx',500,220);
}
function editCgs(index){
	var data=$("#zjgrid").datagrid('getRows')[index];
	obj=data;
	YMLib.UI.createWindow('wqxx','车购税资金到位编辑','zhfzzjdwxg.jsp','wqxx',500,220);
}

//添加车购税
function tjzhfzcgs(){
	var myDate = new Date();
	var y = myDate.getFullYear();
	var m = myDate.getMonth()+1;       //获取当前月份(0-11,0代表1月)
	var d = myDate.getDate();
	tbsj = y+"-"+m+"-"+d;
	tbyf = y+"-"+m;
	var data="gcglzhfz.cgsdwzj="+$("#tj_cgsdwzj").val()+"&gcglzhfz.tbr="+$.cookie("truename")+"&gcglzhfz.tbsj="+tbsj+"&gcglzhfz.tbyf="+$("#tj_tbyf").val()
	+"&gcglzhfz.jhid="+parent.parent.obj1.jhid;
	//alert(data);
	$.ajax({
		type:'post',
		url:'../../../../gcgl/insertZhfzCgs.do',
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
function xgzhfzcgs(){
	var data="gcglzhfz.cgsdwzj="+$("#xg_cgsdwzj").val()
	+"&gcglzhfz.jhid="+parent.obj.jhid+"&gcglzhfz.id="+parent.obj.id+"&gcglzhfz.tbyf="+$("#xg_tbyf").val();
	//alert(data);
	$.ajax({
		type:'post',
		url:'../../../../gcgl/updateZhfzCgs.do',
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
	var data="gcglzhfz.id="+data1.id;
	if(confirm("确认删除吗？")){
		$.ajax({
			type:'post',
			url:'../../../../gcgl/deleteZhfzCgs.do',
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
	var gydw=$("#gydw").combobox("getValue");
	if(gydw=='36')
		gydw='';
	var jgzt='0';
	var kgzt='1';
	var lxmc=$("#lxmc").val();
	$('#datagrid').datagrid({    
	    url:'../../../../gcgl/selectZhfzjhList.do',
	    striped:true,
	    pagination:true,
	    rownumbers:true,
	    pageNumber:1,
	    pageSize:10,
	    height:440,
	    queryParams: {
	    	gydw: gydw,
	    	kgzt: kgzt,
	    	jgzt:jgzt,
	    	lxmc:lxmc,
		},
	    columns:[[
			{field:'c',title:'操作',width:150,align:'center',formatter:function(value,row,index){
				return '定位    '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="wqxiangxi('+index+')">详细</a>    '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="zjdw('+index+')">资金拨付</a>   ';
			}},
			{field:'gydw',title:'管养单位',width:150,align:'center'},
	        {field:'xzqh',title:'行政区划',width:120,align:'center'},
	        {field:'lxbm',title:'路线编码',width:120,align:'center'},
	        {field:'lxmc',title:'路线名称',width:120,align:'center'},
	        {field:'qdzh',title:'起点桩号',width:100,align:'center'},
	        {field:'zdzh',title:'止点桩号',width:80,align:'center'},
	        {field:'qzlc',title:'总里程',width:80,align:'center'},
	        {field:'yhlc',title:'隐患里程',width:60,align:'center'},
	        {field:'lxjsdj',title:'路线技术等级',width:100,align:'center'},
	    ]]    
	}); 
}

function showAllZJ(){
	var jhid=parent.obj1.jhid;
	$('#zjgrid').datagrid({    
		url:'../../../../gcgl/selectZhfzCgsList.do',
	    striped:true,
	    pagination:true,
	    rownumbers:true,
	    pageNumber:1,
	    pageSize:10,
	    height:315,
	    queryParams: {
	    	jhid: jhid,
		},
	    columns:[[
				{field:'c',title:'操作',width:150,align:'center',formatter:function(value,row,index){
					if(row.sbsj==""||row.sbyf>row.tbyf){
		        		return '<a href="#" onclick="editCgs('+index+')">编辑</a>    '+'<a href="#" onclick="delCgs('+index+')">删除</a>   ';
		        	}
		        	else return '编辑   '+'删除';
				}},
				{field:'tbyf',title:'填报月份 ',width:140,align:'center'},
				{field:'tbsj',title:'填报时间 ',width:140,align:'center'},
				{field:'tbr',title:'填报人 ',width:140,align:'center'},
				{field:'cgsdwzj',title:'车购税到位资金(万元)',width:150,align:'center'}
	    ]]    
	}); 
}
//
function uploadFile(str){
	//alert(str);
	var title='';
	if(str=='sgxkwj')
		title='请选择施工许可文件';
	if(str=='jgtcwj')
		title='请选择交工通车文件';
	if(str=='jgyswj')
		title='请选择完工验收文件';
	var weatherDlg = new J.dialog( {
		id : 'id1',
		title : title,
		page : '../../upload.jsp?url='+"/jxzhpt/gcgl/uploadZhfzFile.do"+'&flag='+'cgszjdw%2fzhfz%2fzhfzxx'+'&type='+str+'&jhid='+parent.obj1.jhid,
		width : 450,
		height : 400,
		top : 0,
		rang : true,
		resize : false,
		cover : true
	});
	weatherDlg.ShowDialog();
	return false;
}

function downFile(str){
	if($("#xz_"+str).text()=='下载附件'){
		parent.window.location.href="../../../../gcgl/downZhfzFile.do?type="+str+"&jhid="+parent.obj1.jhid;
	}
	else return;
}
function deleteFile(str){
	if(confirm("确认删除吗？")){
	var data="jhid="+parent.obj1.jhid+"&type="+str;
	$.ajax({
		type:'post',
		url:'../../../../gcgl/deleteZhfzFile.do',
		data:data,
		dataType:'json',
		success:function(msg){
			if(Boolean(msg)){
				alert('删除成功！');
				location.reload();
			}else{
				alert('删除失败！');
			}
		}
	});	
	}
}
function jiazai(ooo){
//	alert(ooo);
	var data=ooo;

	$.ajax({
		type:'post',
		url:'../../../../gcgl/selectZhfzjhFile.do',
		data:data,
		dataType:'json',
		async:false,
		success:function(msg){
				if(msg.sgxkwj!=''){
					$("#xz_sgxkwj").text("下载附件");
				}
				if(msg.jgtcwj!=''){
					$("#xz_jgtcwj").text("下载附件");
				}
				if(msg.jgyswj!=''){
					$("#xz_jgyswj").text("下载附件");
				}
			}
	});	
}