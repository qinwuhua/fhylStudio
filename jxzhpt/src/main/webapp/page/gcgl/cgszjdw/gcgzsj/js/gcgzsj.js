var obj=new Object();
var obj1=new Object();
function dingwei(index){
	var data=$("#datagrid").datagrid('getRows')[index];
	$.ajax({
		type:'post',
		url:'/jxzhpt/qqgl/selectlxbyxmid.do',
		data:"lxsh.xmbm="+data.XMBM+"&lxsh.jdbs=2",
		dataType:'json',
		success:function(msg){
			var lxbm="";
			var qdzh="";
			var zdzh="";
			for(var i=0;i<msg.length;i++){
				if(i==msg.length-1){
					lxbm=lxbm+msg[i].lxbm;
					qdzh=qdzh+msg[i].qdzh;
					zdzh=zdzh+msg[i].zdzh;
				}else{
					lxbm=lxbm+msg[i].lxbm+"-";
					qdzh=qdzh+msg[i].qdzh+"-";
					zdzh=zdzh+msg[i].zdzh+"-";
				}
			}
			locationXm1(lxbm,qdzh,zdzh);
		},
		error : function(){
		 YMLib.Tools.Show('生成项目编码错误！error code = 404',3000);
	 }
});	
}
function wqxiangxi(index){
	var data=$("#datagrid").datagrid('getRows')[index];
	obj1=data;
	YMLib.Var.jhbm=data.id;
	//YMLib.UI.createWindow('wqxx','改建工程项目开工详情','gcgzsjxx.jsp','wqxx',740,450);
	YMLib.UI.createWindow('wqxx','改建工程项目详情','gcgzsjxx.jsp','wqxx',940,450);
	//window.open("gcgzsjxx.jsp");
}
function zjdw(index){
	var data=$("#datagrid").datagrid('getRows')[index];
	obj1=data;
	YMLib.UI.createWindow('wqxx1','车购税资金到位情况','gcgzsjzjdw.jsp','wqxx1',900,500);
	//window.open("gcgzsjzjdw.jsp");
}
function zjdw__ck(index){
	var data=$("#datagrid").datagrid('getRows')[index];
	obj1=data;
	YMLib.UI.createWindow('wqxx1','车购税资金到位情况','gcgzsjzjdw__ck.jsp','wqxx1',900,500);
	//window.open("gcgzsjzjdw.jsp");
}
function closes(str){
	 parent.$('#'+str).window('destroy');
}
function addCgs(){
	YMLib.UI.createWindow('wqxx','车购税资金到位添加','gcgzsjzjdwtj.jsp','wqxx',800,375);
}
function editCgs(index){
	var data=$("#zjgrid").datagrid('getRows')[index];
	obj=data;
	YMLib.UI.createWindow('wqxx','车购税资金到位编辑','gcgzsjzjdwxg.jsp','wqxx',800,375);
}

//添加车购税
function tjgcgzsjcgs(){
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
	var data="gcglgcgzsj.cgsdwzj="+$("#tj_cgsdwzj").val()+"&gcglgcgzsj.tbr="+$.cookie("truename")+"&gcglgcgzsj.tbsj="+$("#tj_tbsj").val()+"&gcglgcgzsj.tbyf="+$("#tbyf").val()+"&gcglgcgzsj.cscyj="+$("#tj_cscyj").val()+"&gcglgcgzsj.sz="+$("#sz").val()
	+"&gcglgcgzsj.gz="+$("#gz").val()+"&gcglgcgzsj.yhdk="+$("#yhdk").val()+"&gcglgcgzsj.jhid="+parent.parent.obj1.XMBM;
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
				parent.shezhi();
				closes('wqxx');
			}else{
				alert('该月车购税可能已存在，保存失败！');
			}
		}
	});	
	
}
//修改车购税
function xggcgzsjcgs(){
	if($("#xg_cgsdwzj").val()==''){
		alert("请您填入本月资金");
		return;
	}
	var data="gcglgcgzsj.cgsdwzj="+$("#xg_cgsdwzj").val()+"&gcglgcgzsj.tbsj="+$("#xg_tbsj").val()
	+"&gcglgcgzsj.jhid="+parent.obj.jhid+"&gcglgcgzsj.id="+parent.obj.id+"&gcglgcgzsj.tbyf="+$("#tbyf").val()+"&gcglgcgzsj.cscyj="+$("#xg_cscyj").val()+"&gcglgcgzsj.sz="+$("#sz").val()
	+"&gcglgcgzsj.gz="+$("#gz").val()+"&gcglgcgzsj.yhdk="+$("#yhdk").val();
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
					shezhi();
				}else{
					alert('删除失败！');
				}
			}
		});	
	}	
}

function showAll(){
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
	$('#datagrid').datagrid({    
	    url:'../../../../gcgl/selectGcgzsjjhList1.do',
	    striped:true,
	    pagination:true,
	    rownumbers:true,
	    pageNumber:1,
	    pageSize:10,
	    height:$(window).height()-195,
	    width:$(window).width()-$(window).width()*0.019,
	    queryParams: {
	    	gydw: xzqhstr,
	    	kgzt: kgzt,
	    	jgzt:jgzt,
	    	lxmc:lxmc,
	    	ybzt:'',
	    	sfsj:7,
	    	xmnf:xmnf,
	    	bfyf:bfyf,
	    	bfzt:$("#bfzt").val(),
	    	'gcglgcgzsj.jsdj':$("#ddlPDDJ").combobox('getValue'),
	    	'gcglgcgzsj.lxbm':$("#lxbm").val(),
//	    	'gcglgcgzsj.xdsj':$("#xdnf").val(),
	    	'gcglgcgzsj.xmmc':$("#xmmc").val(),
	    	'gcglgcgzsj.lxmc':$("#lxmc").val(),
	    	'gcglgcgzsj.gldj':$("#ddlGldj").combobox('getValue'),
	    	'gcglgcgzsj.tsdq':$("#ddlTSDQ").combobox('getText'),
	    	'gcglgcgzsj.ljbfzt':$("#ljbfzt").combobox('getValue')
		},
	    columns:[[
	         {field:'c',title:'操作',width:150,align:'center',formatter:function(value,row,index){
  				return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dingwei('+index+')">定位</a>     '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="wqxiangxi('+index+')">详细</a>    '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="zjdw('+index+')">资金拨付</a>   ';
  			}},
  			 {field : 'XMMC',title : '项目名称',width : 180,align : 'center',formatter:function(value,row,index){
  	        	if(row.SL!=1)
  	        		return '<font color="red">'+row.XMMC+'</font>';
  	        	else return  row.XMMC;	
  	        }},
			{field : 'XMBM',title : '项目编码',width : 120,align : 'center'},
			{field : 'XZQH',title : '行政区划',width : 180,align : 'center'},
			
			{field : 'QDZH',title : '起点桩号',width : 100,align : 'center'},
			{field : 'ZDZH',title : '止点桩号',width : 100,align : 'center'},
			{field:'KGSJ',title:'计划开工时间',width:150,align:'center'},
			{field:'WGSJ',title:'计划完工时间',width:150,align:'center'},
			{field:'GQ',title:'工期（月）',width:100,align:'center'},
	        {field:'XDZJ',title:'已下达计划(万元)',width:120,align:'center'},
	        {field:'BFZJ',title:'已拨付资金(万元)',width:120,align:'center'},
			{field:'GKPFWH',title:'工可批复文号',width:100,align:'center'},
			{field:'SJPFWH',title:'设计批复文号',width:100,align:'center'}
			]],
			view: detailview,
			detailFormatter:function(index,row){   
			return '<div style="padding:2px"><table id="table_lx' + index + '"></table></div>';   
			},
			onExpandRow: function(index,row){
			$('#table_lx'+index).datagrid({
				url:'/jxzhpt/qqgl/selectSjgzlxList.do',
				 queryParams: {
					 	jdbs:2,
				    	xmbm:row.XMBM
					},
				columns:[[
				    {field:'gydw',title:'管养单位',width:150,align:'center'},    
				    {field:'xzqh',title:'行政区划',width:150,align:'center'},
				    {field:'lxmc',title:'路线名称',width:120,align:'center'},
				    {field:'ghlxbh',title:'路线编码',width:100,align:'center'},
				    {field:'qdzh',title:'起点桩号',width:80,align:'center'},
				    {field:'zdzh',title:'止点桩号',width:80,align:'center'},
				    {field:'qdmc',title:'起点名称',width:100,align:'center'},
				    {field:'zdmc',title:'止点名称',width:100,align:'center'},
				    {field:'jsjsdj',title:'建设技术等级',width:80,align:'center'},
				    {field:'xjsdj',title:'现技术等级',width:80,align:'center'},
				    {field:'lc',title:'里程',width:60,align:'center'}
				]]
			});
		}   
	}); 
}
function showAll__ck(){
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

	var jgzt='0';
	var kgzt='';
	var xmnf=$("#ddlYear").val();
	var bfyf=$("#ddlMonth").val();
	var lxmc=$("#lxmc").val();
	$('#datagrid').datagrid({    
	    url:'../../../../gcgl/selectGcgzsjjhList1.do',
	    striped:true,
	    pagination:true,
	    rownumbers:true,
	    pageNumber:1,
	    pageSize:10,
	    height:$(window).height()-195,
	    width:$(window).width()-$(window).width()*0.019,
	    queryParams: {
	    	gydw: xzqhstr,
	    	kgzt: kgzt,
	    	jgzt:jgzt,
	    	lxmc:lxmc,
	    	ybzt:'',
	    	sfsj:7,
	    	xmnf:xmnf,
	    	bfyf:bfyf,
	    	bfzt:$("#bfzt").val()
		},
	    columns:[[
	         {field:'c',title:'操作',width:150,align:'center',formatter:function(value,row,index){
  				return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dingwei('+index+')">定位</a>     '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="wqxiangxi('+index+')">详细</a>    '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="zjdw__ck('+index+')">资金拨付</a>   ';
  			}},
  			 {field : 'XMMC',title : '项目名称',width : 180,align : 'center',formatter:function(value,row,index){
  	        	if(row.SL!=1)
  	        		return '<font color="red">'+row.XMMC+'</font>';
  	        	else return  row.XMMC;	
  	        }},
			{field : 'XMBM',title : '项目编码',width : 120,align : 'center'},
			{field : 'XZQH',title : '行政区划',width : 180,align : 'center'},
			{field : 'QDZH',title : '起点桩号',width : 100,align : 'center'},
			{field : 'ZDZH',title : '止点桩号',width : 100,align : 'center'},
			{field:'KGSJ',title:'计划开工时间',width:150,align:'center'},
			{field:'WGSJ',title:'计划完工时间',width:150,align:'center'},
			{field:'GQ',title:'工期（月）',width:100,align:'center'},
			{field:'GKPFWH',title:'工可批复文号',width:100,align:'center'},
			{field:'SJPFWH',title:'设计批复文号',width:100,align:'center'}
			]],
			view: detailview,
			detailFormatter:function(index,row){   
			return '<div style="padding:2px"><table id="table_lx' + index + '"></table></div>';   
			},
			onExpandRow: function(index,row){
			$('#table_lx'+index).datagrid({
				url:'/jxzhpt/qqgl/selectSjgzlxList.do',
				 queryParams: {
					 	jdbs:2,
				    	xmbm:row.XMBM
					},
				columns:[[
				    {field:'gydw',title:'管养单位',width:150,align:'center'},    
				    {field:'xzqh',title:'行政区划',width:150,align:'center'},
				    {field:'lxmc',title:'路线名称',width:120,align:'center'},
				    {field:'ghlxbh',title:'路线编码',width:100,align:'center'},
				    {field:'qdzh',title:'起点桩号',width:80,align:'center'},
				    {field:'zdzh',title:'止点桩号',width:80,align:'center'},
				    {field:'qdmc',title:'起点名称',width:100,align:'center'},
				    {field:'zdmc',title:'止点名称',width:100,align:'center'},
				    {field:'jsjsdj',title:'建设技术等级',width:80,align:'center'},
				    {field:'xjsdj',title:'现技术等级',width:80,align:'center'},
				    {field:'lc',title:'里程',width:60,align:'center'}
				]]
			});
		}   
	}); 
}


function showAllZJ(){
	var jhid=parent.obj1.XMBM;
	$('#zjgrid').datagrid({    
		url:'../../../../gcgl/selectGcgzsjCgsList.do',
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
				{field:'cgsdwzj',title:'拨付车购税(万元)',width:100,align:'center'},
				{field:'yhdk',title:'银行贷款(万元)',width:100,align:'center'},
				{field:'gz',title:'国债(万元)',width:100,align:'center'},
				{field:'sz',title:'省债(万元)',width:100,align:'center'},
				{field:'tbyf',title:'填报月份 ',width:100,align:'center'},
				{field:'tbsj',title:'填报时间 ',width:120,align:'center'},
				{field:'tbr',title:'填报人 ',width:80,align:'center'},
				{field:'cscyj',title:'财审处意见',width:100,align:'center'}
	    ]]    
	}); 
}

function showAllZJ__ck(){
	var jhid=parent.obj1.XMBM;
	$('#zjgrid').datagrid({    
		url:'../../../../gcgl/selectGcgzsjCgsList.do',
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
				{field:'yhdk',title:'银行贷款(万元)',width:100,align:'center'},
				{field:'gz',title:'国债(万元)',width:100,align:'center'},
				{field:'sz',title:'省债(万元)',width:100,align:'center'},
				{field:'cscyj',title:'财审处意见',width:100,align:'center'}
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
		page : '../../upload.jsp?url='+"/jxzhpt/gcgl/uploadGcgzsjFile.do"+'&flag='+'gljsjyhgl%2fgcgzsj%2fgcgzsjxx'+'&type='+str+'&jhid='+parent.obj1.id,
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
//	if($("#xz_"+str).text()=='下载附件'){
//		parent.window.location.href="../../../../gcgl/downGcgzsjFile.do?type="+str+"&jhid="+parent.obj1.id;
//	}
//	else return;
//}
function deleteFile(str){
	if($("#xz_"+str).text()=='暂无附件'){
		return;
	}
	if(confirm("确认删除吗？")){
	var data="jhid="+parent.obj1.id+"&type="+str;
	$.ajax({
		type:'post',
		url:'../../../../gcgl/deleteGcgzsjFile.do',
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
		url:'../../../../gcgl/selectGcgzsjjhFile.do',
		data:data,
		dataType:'json',
		async:false,
		success:function(msg){
			if(msg.sgxkwj!=''){
				$("#xz_sgxkwj").text(msg.sgxkwj);
				$("#xz_sgxkwj").attr("style",'color: #2C7ED1;cursor:pointer;');
				$("#xz_sgxkwj").attr("href",'/jxzhpt/gcgl/downGcgzsjFile.do?type=sgxkwj'+"&jhid="+parent.obj1.id);
			}
			if(msg.jgtcwj!=''){
				$("#xz_jgtcwj").text(msg.jgtcwj);
				$("#xz_jgtcwj").attr("style",'color: #2C7ED1;cursor:pointer;');
				$("#xz_jgtcwj").attr("href",'/jxzhpt/gcgl/downGcgzsjFile.do?type=jgtcwj'+"&jhid="+parent.obj1.id);
			}
			if(msg.jgyswj!=''){
				$("#xz_jgyswj").text(msg.jgyswj);
				$("#xz_jgyswj").attr("style",'color: #2C7ED1;cursor:pointer;');
				$("#xz_jgyswj").attr("href",'/jxzhpt/gcgl/downGcgzsjFile.do?type=jgyswj'+"&jhid="+parent.obj1.id);
			}
			}
	});	
}


function shezhi(){
	var data="gcglwqgz.jhid="+parent.obj1.XMBM+"&gcglwqgz.nf="+new Date().getFullYear()+"&gcglwqgz.id="+parent.obj1.XMBM+"&gcglwqgz.tablename=gcgl_gcgzsj";
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