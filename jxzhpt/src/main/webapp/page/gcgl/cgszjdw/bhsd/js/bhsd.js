var obj=new Object();
var obj1=new Object();
function dingwei(index){
	var data=$("#datagrid").datagrid('getRows')[index];
	locationQl(data.qlbh,data.qlzxzh);
}
function wqxiangxi(index){
	var data=$("#datagrid").datagrid('getRows')[index];
	obj1=data;
	YMLib.Var.jhbm=data.id;
	YMLib.UI.createWindow('wq_xx','病害隧道',"/jxzhpt/page/jhgl/jhkxx/bhsd.jsp",'wq_xx',1000,500);
	//window.open("wqgzxx.jsp");
}
function wqxiangxi1(index){
	var data=$("#datagrid").datagrid('getRows')[index];
	obj1=data;
	YMLib.UI.createWindow('wq_xx','危桥改造',"wqgzsj_ck.jsp",'wq_xx',1000,500);
	//YMLib.UI.createWindow('wqxx','危桥改造开工详情','wqgzxx.jsp','wqxx',740,450);
	//window.open("wqgzxx.jsp");
}
function zjdw(index){
	var data=$("#datagrid").datagrid('getRows')[index];
	obj1=data;
	YMLib.UI.createWindow('bhxx1','车购税资金到位情况','bhsdzjdw.jsp','bhxx1',900,500);
	//window.open("wqgzzjdw.jsp");
}
function zjdw__ck(index){
	var data=$("#datagrid").datagrid('getRows')[index];
	obj1=data;
	YMLib.UI.createWindow('wqxx1','车购税资金到位情况','wqgzzjdw__ck.jsp','wqxx1',900,500);
	//window.open("wqgzzjdw.jsp");
}
function closes(str){
	 parent.$('#'+str).window('destroy');
}
function addCgs(){
	YMLib.UI.createWindow('wqxx','车购税资金到位添加','bhsdzjdwtj.jsp','wqxx',700,250);
}
function editCgs(index){
	var data=$("#zjgrid").datagrid('getRows')[index];
	obj=data;
	YMLib.UI.createWindow('wqxx','车购税资金到位编辑','wqgzzjdwxg.jsp','wqxx',700,250);
}
//添加车购税
function tjwqgzcgs(){
	var myDate = new Date();
	var y = myDate.getFullYear();
	var m = myDate.getMonth()+1;       //获取当前月份(0-11,0代表1月)
	var d = myDate.getDate();
	tbsj = y+"-"+m+"-"+d;
	tbyf = y+"-"+m;
	if($("#tj_cgsdwzj").val()==''){
		alert("请您填入本月资金");
		return;
	}
	var data="gcglbhsd.cgsdwzj="+$("#tj_cgsdwzj").val()+"&gcglbhsd.tbr="+$.cookie("truename")+"&gcglbhsd.tbsj="+tbsj+"&gcglbhsd.tbyf="+$("#tj_tbyf").val()+"&gcglbhsd.cscyj="+$("#tj_cscyj").val()+"&gcglbhsd.stz="+$("#tj_stz").val()
	+"&gcglbhsd.jhid="+parent.parent.obj1.jhid;
	//alert(data);
	$.ajax({
		type:'post',
		url:'../../../../gcgl/insertBhsdCgs.do',
		data:data,
		dataType:'json',
		success:function(msg){
			if(Boolean(msg)){
				alert('保存成功！');
				parent.$("#zjgrid").datagrid('reload');
				parent.shezhi();
				closes('wqxx');
			}else{
				alert('该月车购税可能已存在，保存失败！');
			}
		}
	});	
	
}
//修改车购税
function xgwqgzcgs(){
	if($("#xg_cgsdwzj").val()==''){
		alert("请您填入本月资金");
		return;
	}
	var data="gcglbhsd.cgsdwzj="+$("#xg_cgsdwzj").val()
	+"&gcglbhsd.jhid="+parent.obj.jhid+"&gcglbhsd.id="+parent.obj.id+"&gcglbhsd.tbyf="+$("#xg_tbyf").val()+"&gcglbhsd.cscyj="+$("#xg_cscyj").val()+"&gcglbhsd.stz="+$("#xg_stz").val();
	//alert(data);
	$.ajax({
		type:'post',
		url:'../../../../gcgl/updateBhsdCgs.do',
		data:data,
		dataType:'json',
		success:function(msg){
			if(Boolean(msg)){
				alert('保存成功！');
				parent.$("#zjgrid").datagrid('reload');
				parent.shezhi();
				closes('wqxx');
			}else{
				alert('保存失败！');
			}
		}
	});	
	
}
function delCgs(index){
	var data1=$("#zjgrid").datagrid('getRows')[index];
	var data="gcglbhsd.id="+data1.id;
	if(confirm("确认删除吗？")){
		$.ajax({
			type:'post',
			url:'../../../../gcgl/deletewqgzCgs.do',
			data:data,
			dataType:'json',
			success:function(msg){
				if(Boolean(msg)){
					alert('删除成功！');
					$("#zjgrid").datagrid('reload');
					shezhi();
				}else{
					alert('删除失败！');
				}
			}
		});	
	}	
}
function showAll(){
	var gydw=$("#gydw").combotree("getValues");
	if(gydw.length==0){
		if($.cookie("unit2")=='_____36')
			gydwstr=36;
		else gydwstr= $.cookie("unit2");
	}else if(gydw.length==1){
		if(gydw[0].substr(gydw[0].length-2,gydw[0].length)=="00") gydw[0]=gydw[0].substr(0,gydw[0].length-2);
		if(gydw[0].substr(gydw[0].length-2,gydw[0].length)=="00") gydw[0]=gydw[0].substr(0,gydw[0].length-2);
		gydwstr=gydw[0] ;
	}else{
		gydwstr= gydw.join(',');
	}
	var xzqhdm=$("#xzqh").combotree("getValues");
	if(xzqhdm.length==0){
		xzqhstr= $.cookie("dist2");
		
	}else if(xzqhdm.length==1){
		if(xzqhdm[0].substr(xzqhdm[0].length-2,xzqhdm[0].length)=="00") xzqhdm[0]=xzqhdm[0].substr(0,xzqhdm[0].length-2);
		if(xzqhdm[0].substr(xzqhdm[0].length-2,xzqhdm[0].length)=="00") xzqhdm[0]=xzqhdm[0].substr(0,xzqhdm[0].length-2);
		xzqhstr=xzqhdm[0] ;
	}else{
		xzqhstr= xzqhdm.join(',');
	}
	var jgzt='';
	var kgzt='';
	var xmnf=$("#ddlYear").val();
	var bfyf=$("#ddlMonth").val();
	var lxmc=$("#lxmc").val();
	var sdmc=$("#sdmc").val();
	$('#datagrid').datagrid({    
	    url:'../../../../gcgl/selectBhsdjhList1.do',
	    striped:true,
	    pagination:true,
	    rownumbers:true,
	    pageNumber:1,
	    pageSize:10,
	    height:$(window).height()-195,
	    width:$(window).width()-$(window).width()*0.019,
	    queryParams: {
	    	gydw: gydwstr,
	    	kgzt: kgzt,
	    	jgzt:jgzt,
	    	lxmc:lxmc,
	    	sdmc:sdmc,
	    	'gcglbhsd.sddm':$('#sddm').val(),
	    	ybzt:'',
	    	sfsj:7,
	    	xmnf:xmnf,
	    	bfyf:bfyf,
	    	bfzt:$("#bfzt").val(),
	    	sfylrbwqk:'是',
	    	gydwtj:"and 1=1",
	    	'gcglbhsd.xzqhdm':xzqhstr,
//	    	'gcglbhsd.xdsj':$("#xdnf").val(),
	    	'gcglbhsd.gldj':$("#ddlGldj").combobox('getValue'),
//	    	'gcglbhsd.tsdq':$("#ddlTSDQ").combobox('getText'),
	    	'gcglbhsd.ljbfzt':$("#ljbfzt").combobox('getValue')
		},
	    columns:[[
	        {field:'c',title:'操作',width:150,align:'center',formatter:function(value,row,index){
	        	return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dingwei('+index+')">定位</a>   '
	        	+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="wqxiangxi('+index+')">详细</a>    '
	        	+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="zjdw('+index+')">资金拨付</a>   ';
	        }},
	        {field:'gydw',title:'管养单位',width:150,align:'center'},
	        {field:'xzqhmc',title:'行政区划',width:120,align:'center'},
	        {field:'sddm',title:'隧道代码',width:120,align:'center'},
	        {field:'sdmc',title:'隧道名称',width:120,align:'center'},
	        {field:'sdzxzh',title:'隧道中心桩号',width:100,align:'center'},
	        {field:'sdcd',title:'隧道长度',width:80,align:'center'},
	        {field:'sdkd',title:'隧道宽度',width:80,align:'center'},
	        {field:'sdgd',title:'隧道高度',width:60,align:'center'},
	        {field:'jsdj',title:'技术等级',width:60,align:'center'},
	        {field:'xjgjnd',title:'改建/修建年度',width:100,align:'center'}
	    ]]    
	}); 
}
function showAll__ck(){
	var gydw=$("#gydw").combotree("getValues");
	if(gydw.length==0){
		if($.cookie("unit2")=='_____36')
			gydwstr=36;
		else gydwstr= $.cookie("unit2");
	}else if(gydw.length==1){
		if(gydw[0].substr(gydw[0].length-2,gydw[0].length)=="00") gydw[0]=gydw[0].substr(0,gydw[0].length-2);
		if(gydw[0].substr(gydw[0].length-2,gydw[0].length)=="00") gydw[0]=gydw[0].substr(0,gydw[0].length-2);
		gydwstr=gydw[0] ;
	}else{
		gydwstr= gydw.join(',');
	}

	var jgzt='0';
	var kgzt='';
	var xmnf=$("#ddlYear").val();
	var bfyf=$("#ddlMonth").val();
	var lxmc=$("#lxmc").val();
	var qlmc=$("#qlmc").val();
	$('#datagrid').datagrid({    
	    url:'../../../../gcgl/selectWqgzjhList1.do',
	    striped:true,
	    pagination:true,
	    rownumbers:true,
	    pageNumber:1,
	    pageSize:10,
	    height:$(window).height()-195,
	    width:$(window).width()-$(window).width()*0.019,
	    queryParams: {
	    	gydw: gydwstr,
	    	kgzt: kgzt,
	    	jgzt:jgzt,
	    	lxmc:lxmc,
	    	qlmc:qlmc,
	    	'gcglbhsd.qlbh':$('#qlbm').val(),
	    	ybzt:'',
	    	sfsj:7,
	    	xmnf:xmnf,
	    	bfyf:bfyf,
	    	bfzt:$("#bfzt").val(),
	    	sfylrbwqk:'是',
	    	gydwtj:"and 1=1"
		},
	    columns:[[
	        {field:'c',title:'操作',width:150,align:'center',formatter:function(value,row,index){
	        	return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dingwei('+index+')">定位</a>   '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="wqxiangxi('+index+')">详细</a>    '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="zjdw__ck('+index+')">资金拨付</a>   ';
	        }},
	        {field:'gydw',title:'管养单位',width:150,align:'center'},
	        {field:'xzqhmc',title:'行政区划',width:120,align:'center'},
	        {field:'qlbh',title:'桥梁编码',width:120,align:'center'},
	        {field:'qlmc',title:'桥梁名称',width:120,align:'center'},
	        {field:'qlzxzh',title:'桥梁中心桩号',width:100,align:'center'},
	        {field:'qlkd',title:'桥梁全宽',width:80,align:'center'},
	        {field:'qlqc',title:'桥梁全长',width:80,align:'center'},
	        {field:'kjzc',title:'跨径总长',width:60,align:'center'},
	        {field:'jsdj',title:'技术等级',width:60,align:'center'},
	        {field:'xjgjnd',title:'改建/修建年度',width:100,align:'center'}
	    ]]    
	}); 
}
function showAll1(){
	var gydw=$("#gydw").combotree("getValues");
	if(gydw.length==0){
		if($.cookie("unit2")=='_____36')
			gydwstr=36;
		else gydwstr= $.cookie("unit2");
	}else if(gydw.length==1){
		if(gydw[0].substr(gydw[0].length-2,gydw[0].length)=="00") gydw[0]=gydw[0].substr(0,gydw[0].length-2);
		if(gydw[0].substr(gydw[0].length-2,gydw[0].length)=="00") gydw[0]=gydw[0].substr(0,gydw[0].length-2);
		gydwstr=gydw[0] ;
	}else{
		gydwstr= gydw.join(',');
	}
	var xzqhdm=$("#xzqh").combotree("getValues");
	if(xzqhdm.length==0){
		xzqhstr= $.cookie("dist2");
		
	}else if(xzqhdm.length==1){
		if(xzqhdm[0].substr(xzqhdm[0].length-2,xzqhdm[0].length)=="00") xzqhdm[0]=xzqhdm[0].substr(0,xzqhdm[0].length-2);
		if(xzqhdm[0].substr(xzqhdm[0].length-2,xzqhdm[0].length)=="00") xzqhdm[0]=xzqhdm[0].substr(0,xzqhdm[0].length-2);
		xzqhstr=xzqhdm[0] ;
	}else{
		xzqhstr= xzqhdm.join(',');
	}
	var jgzt='';
	var kgzt='';
	var xmnf=$("#ddlYear").val();
	var bfyf=$("#ddlMonth").val();
	var lxmc=$("#lxmc").val();
	var qlmc=$("#qlmc").val();
	$('#datagrid').datagrid({    
	    url:'../../../../gcgl/selectWqgzjhList1.do',
	    striped:true,
	    pagination:true,
	    rownumbers:true,
	    pageNumber:1,
	    pageSize:10,
	    height:$(window).height()-195,
	    width:$(window).width()-$(window).width()*0.019,
	    queryParams: {
	    	gydw: gydwstr,
	    	kgzt: kgzt,
	    	jgzt:jgzt,
	    	lxmc:lxmc,
	    	qlmc:qlmc,
	    	'gcglbhsd.qlbh':$('#qlbm').val(),
	    	ybzt:'',
	    	sfsj:7,
	    	xmnf:xmnf,
	    	bfyf:bfyf,
	    	bfzt:$("#bfzt").val(),
	    	sfylrbwqk:$("#sfylrbwqk").combobox('getValue'),
	    	gydwtj:"and gydwbm like '1%'",
	    	'gcglbhsd.xzqh':xzqhstr,
	    	'gcglbhsd.xdsj':$("#xdnf").val(),
	    	'gcglbhsd.gldj':$("#ddlGldj").combobox('getValue'),
	    	'gcglbhsd.tsdq':$("#ddlTSDQ").combobox('getText'),
	    	'gcglbhsd.ljbfzt':$("#ljbfzt").combobox('getValue')
		},
	    columns:[[
	        {field:'c',title:'操作',width:150,align:'center',formatter:function(value,row,index){
	        	return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dingwei('+index+')">定位</a>   '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="wqxiangxi1('+index+')">详细</a>    '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="zjdw('+index+')">资金拨付</a>   ';
	        }},
	        {field:'gydw',title:'管养（监管）单位',width:150,align:'center'},
	        {field:'xzqhmc',title:'行政区划',width:120,align:'center'},
	        {field:'qlbh',title:'桥梁编码',width:120,align:'center'},
	        {field:'qlmc',title:'桥梁名称',width:120,align:'center'},
	        {field:'qlzxzh',title:'桥梁中心桩号',width:100,align:'center'},
	        {field:'qlkd',title:'桥梁全宽',width:80,align:'center'},
	        {field:'qlqc',title:'桥梁全长',width:80,align:'center'},
	        {field:'kjzc',title:'跨径总长',width:60,align:'center'},
	        {field:'jsdj',title:'技术等级',width:60,align:'center'},
	        {field:'xjgjnd',title:'改建/修建年度',width:100,align:'center'}
	    ]]    
	}); 
}
function showAll1__ck(){
	var gydw=$("#gydw").combotree("getValues");
	if(gydw.length==0){
		if($.cookie("unit2")=='_____36')
			gydwstr=36;
		else gydwstr= $.cookie("unit2");
	}else if(gydw.length==1){
		if(gydw[0].substr(gydw[0].length-2,gydw[0].length)=="00") gydw[0]=gydw[0].substr(0,gydw[0].length-2);
		if(gydw[0].substr(gydw[0].length-2,gydw[0].length)=="00") gydw[0]=gydw[0].substr(0,gydw[0].length-2);
		gydwstr=gydw[0] ;
	}else{
		gydwstr= gydw.join(',');
	}

	var jgzt='0';
	var kgzt='';
	var xmnf=$("#ddlYear").val();
	var bfyf=$("#ddlMonth").val();
	var lxmc=$("#lxmc").val();
	var qlmc=$("#qlmc").val();
	$('#datagrid').datagrid({    
	    url:'../../../../gcgl/selectWqgzjhList1.do',
	    striped:true,
	    pagination:true,
	    rownumbers:true,
	    pageNumber:1,
	    pageSize:10,
	    height:$(window).height()-160,
	    width:$(window).width()-$(window).width()*0.019,
	    queryParams: {
	    	gydw: gydwstr,
	    	kgzt: kgzt,
	    	jgzt:jgzt,
	    	lxmc:lxmc,
	    	qlmc:qlmc,
	    	'gcglbhsd.qlbh':$('#qlbm').val(),
	    	ybzt:'',
	    	sfsj:7,
	    	xmnf:xmnf,
	    	bfyf:bfyf,
	    	bfzt:$("#bfzt").val(),
	    	sfylrbwqk:$("#sfylrbwqk").combobox('getValue'),
	    	gydwtj:"and gydwbm like '1%'"
		},
	    columns:[[
	        {field:'c',title:'操作',width:150,align:'center',formatter:function(value,row,index){
	        	return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dingwei('+index+')">定位</a>   '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="wqxiangxi1('+index+')">详细</a>    '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="zjdw__ck('+index+')">资金拨付</a>   ';
	        }},
	        {field:'gydw',title:'管养（监管）单位',width:150,align:'center'},
	        {field:'xzqhmc',title:'行政区划',width:120,align:'center'},
	        {field:'qlbh',title:'桥梁编码',width:120,align:'center'},
	        {field:'qlmc',title:'桥梁名称',width:120,align:'center'},
	        {field:'qlzxzh',title:'桥梁中心桩号',width:100,align:'center'},
	        {field:'qlkd',title:'桥梁全宽',width:80,align:'center'},
	        {field:'qlqc',title:'桥梁全长',width:80,align:'center'},
	        {field:'kjzc',title:'跨径总长',width:60,align:'center'},
	        {field:'jsdj',title:'技术等级',width:60,align:'center'},
	        {field:'xjgjnd',title:'改建/修建年度',width:100,align:'center'}
	    ]]    
	}); 
}

function showAllZJ(){
	var jhid=parent.obj1.jhid;
	$('#zjgrid').datagrid({    
	    url:'../../../../gcgl/selectBhsdCgsList.do',
	    striped:true,
	    pagination:true,
	    rownumbers:true,
	    pageNumber:1,
	    pageSize:10,
	    height:315,
	    queryParams: {
	    	jhid: jhid
		},
	    columns:[[
	        {field:'c',title:'操作',width:150,align:'center',formatter:function(value,row,index){
	        	if(row.sbsj==""||row.sbyf>row.tbyf){
	        		return '<a href="#" onclick="editCgs('+index+')">编辑</a>    '+'<a href="#" onclick="delCgs('+index+')">删除</a>   ';
	        	}
	        	else return '编辑   '+'删除';
	        }},
	        {field:'tbyf',title:'填报月份 ',width:100,align:'center'},
			{field:'tbsj',title:'填报时间 ',width:120,align:'center'},
			{field:'tbr',title:'填报人 ',width:80,align:'center'},
			{field:'cgsdwzj',title:'拨付车购税(万元)',width:100,align:'center'},
			{field:'stz',title:'省投资(万元)',width:100,align:'center'},
			{field:'cscyj',title:'财审处意见',width:100,align:'center'}
	    ]]    
	}); 
}
function showAllZJ__ck(){
	var jhid=parent.obj1.jhid;
	$('#zjgrid').datagrid({    
	    url:'../../../../gcgl/selectBhsdCgsList.do',
	    striped:true,
	    pagination:true,
	    rownumbers:true,
	    pageNumber:1,
	    pageSize:10,
	    height:315,
	    queryParams: {
	    	jhid: jhid
		},
	    columns:[[
	        
	        {field:'tbyf',title:'填报月份 ',width:100,align:'center'},
			{field:'tbsj',title:'填报时间 ',width:120,align:'center'},
			{field:'tbr',title:'填报人 ',width:80,align:'center'},
			{field:'cgsdwzj',title:'拨付车购税(万元)',width:100,align:'center'},
			{field:'stz',title:'省投资(万元)',width:100,align:'center'},
			{field:'cscyj',title:'财审处意见',width:100,align:'center'}
	    ]]    
	}); 
}

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
		page : '../../upload.jsp?url='+"/jxzhpt/gcgl/uploadWqgzFile.do"+'&flag='+'gljsjyhgl%2fwqgz%2fwqgzxx'+'&type='+str+'&jhid='+parent.obj1.jhid,
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

//function downFile(str){
//	if($("#xz_"+str).text()!='暂无附件'){
//		parent.window.location.href="www.baidu.com";
//		//parent.window.location.href="../../../../gcgl/downWqgzFile.do?type="+str+"&jhid="+parent.obj1.jhid;
//	}
//	else return;
//}
function deleteFile(str){
	if($("#xz_"+str).text()=='暂无附件'){
		return;
	}
	if(confirm("确认删除吗？")){
	var data="jhid="+parent.obj1.jhid+"&type="+str;
	$.ajax({
		type:'post',
		url:'../../../../gcgl/deleteWqgzFile.do',
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
function jiazaifujian(data1){
	//alert(data1);
	var data=data1;

	$.ajax({
		type:'post',
		url:'../../../../gcgl/selectWqgzjhFile.do',
		data:data,
		dataType:'json',
		async:false,
		success:function(msg){
				if(msg.sgxkwj!=''){
					$("#xz_sgxkwj").text(msg.sgxkwj);
					$("#xz_sgxkwj").attr("style",'color: #2C7ED1;cursor:pointer;');
					$("#xz_sgxkwj").attr("href",'/jxzhpt/gcgl/downWqgzFile.do?type=sgxkwj'+"&jhid="+parent.obj1.jhid);
				}
				if(msg.jgtcwj!=''){
					$("#xz_jgtcwj").text(msg.jgtcwj);
					$("#xz_jgtcwj").attr("style",'color: #2C7ED1;cursor:pointer;');
					$("#xz_jgtcwj").attr("href",'/jxzhpt/gcgl/downWqgzFile.do?type=jgtcwj'+"&jhid="+parent.obj1.jhid);
				}
				if(msg.jgyswj!=''){
					$("#xz_jgyswj").text(msg.jgyswj);
					$("#xz_jgyswj").attr("style",'color: #2C7ED1;cursor:pointer;');
					$("#xz_jgyswj").attr("href",'/jxzhpt/gcgl/downWqgzFile.do?type=jgyswj'+"&jhid="+parent.obj1.jhid);
				}
			}
	});	
}

function shezhi(){
	var data="gcglbhsd.jhid="+parent.obj1.jhid+"&gcglbhsd.nf="+new Date().getFullYear()+"&gcglbhsd.id="+parent.obj1.id+"&gcglbhsd.tablename=gcgl_wqgz";
	$.ajax({
		type:'post',
		url:'../../../../gcgl/selectWqgzbzzj.do',
		data:data,
		dataType:'json',
		success:function(msg){
			if(msg.zbfzj=='')
				$("#zbfzj").text('0');
			else
				$("#zbfzj").text(msg.zbfzj);
			if(msg.nbfzj=='')
				$("#nbfzj").text('0');
			else
				$("#nbfzj").text(msg.nbfzj);
			if(msg.nxdzj=='')
				$("#nxdzj").text('0');
			else
				$("#nxdzj").text(msg.nxdzj);
			if(msg.zxdzj=='')
				$("#jhxdzj").text('0');
			else
				$("#jhxdzj").text(msg.zxdzj);
		}
	});	
}