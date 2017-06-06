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
	//YMLib.UI.createWindow('gclmgj_xx','路面改造项目计划详情',"/jxzhpt/page/jhgl/jhkxx/gclmgj.jsp",'gclmgj_xx',1000,500);
	YMLib.UI.createWindow('wqxx','路面改造工程项目详情','gcgzgjxx.jsp','wqxx',940,450);
	//window.open("gcgzgjxx.jsp");
}
function zjdw(index){
	var data=$("#datagrid").datagrid('getRows')[index];
	obj1=data;
	YMLib.UI.createWindow('wqxx1','资金到位情况','gcgzgjzjdw.jsp','wqxx1',900,500);
	//window.open("gcgzgjzjdw.jsp");
}
function zjdw__ck(index){
	var data=$("#datagrid").datagrid('getRows')[index];
	obj1=data;
	YMLib.UI.createWindow('wqxx1','资金到位情况','gcgzgjzjdw__ck.jsp','wqxx1',900,500);
	//window.open("gcgzgjzjdw.jsp");
}
function closes(str){
	 parent.$('#'+str).window('destroy');
}
function addCgs(){
	YMLib.UI.createWindow('wqxx','资金到位添加','/jxzhpt/page/gcgl/cgszjdw/gcgzsj/gcgzsjzjdwtj.jsp','wqxx',800,375);
}
function editCgs(index){
	var data=$("#zjgrid").datagrid('getRows')[index];
	obj=data;
	YMLib.UI.createWindow('wqxx','资金到位编辑','/jxzhpt/page/gcgl/cgszjdw/gcgzsj/gcgzsjzjdwxg.jsp','wqxx',800,375);
}

//添加车购税
function tjgcgzgjcgs(){
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
	var data="gcglgcgzgj.cgsdwzj="+$("#tj_cgsdwzj").val()+"&gcglgcgzgj.tbr="+$.cookie("truename")+"&gcglgcgzgj.tbsj="+$("#tj_tbsj").val()+"&gcglgcgzgj.tbyf="+$("#tbyf").val()+"&gcglgcgzgj.cscyj="+$("#tj_cscyj").val()
	+"&gcglgcgzgj.sz="+$("#sz").val()+"&gcglgcgzgj.gz="+$("#gz").val()+"&gcglgcgzgj.yhdk="+$("#yhdk").val()+"&gcglgcgzgj.jhid="+parent.parent.obj1.XMBM;
	//alert(data);
	$.ajax({
		type:'post',
		url:'../../../../gcgl/insertGcgzgjCgs.do',
		data:data,
		dataType:'json',
		success:function(msg){
			if(Boolean(msg)){
				alert('保存成功！');
				parent.$("#zjgrid").datagrid('reload');
				 parent.shezhi();
				closes('wqxx');
			}else{
				alert('该月资金可能已存在，保存失败！');
			}
		}
	});	
	
}
//修改车购税
function xggcgzgjcgs(){
	if($("#xg_cgsdwzj").val()==''){
		alert("请您填入本月资金");
		return;
	}
	var data="gcglgcgzgj.cgsdwzj="+$("#xg_cgsdwzj").val()+"&gcglgcgzgj.tbsj="+$("#xg_tbsj").val()
	+"&gcglgcgzgj.jhid="+parent.obj.jhid+"&gcglgcgzgj.id="+parent.obj.id+"&gcglgcgzgj.tbyf="+$("#tbyf").val()+"&gcglgcgzgj.cscyj="+$("#xg_cscyj").val()+"&gcglgcgzgj.sz="+$("#sz").val()+"&gcglgcgzgj.gz="+$("#gz").val()+"&gcglgcgzgj.yhdk="+$("#yhdk").val();
	//alert(data);
	$.ajax({
		type:'post',
		url:'../../../../gcgl/updateGcgzgjCgs.do',
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
	var data="gcglgcgzgj.id="+data1.id;
	if(confirm("确认删除吗？")){
		$.ajax({
			type:'post',
			url:'../../../../gcgl/deleteGcgzgjCgs.do',
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
	var lxmc=$("#lxmc").val();
	var xmnf=$("#ddlYear").combobox('getValues').join(",");
	if(xmnf.substr(0,1)==',')
		xmnf=xmnf.substr(1,xmnf.length);
	var bfyf=$("#ddlMonth").val();
	$('#datagrid').datagrid({    
	    url:'../../../../gcgl/selectGcgzgjjhList2.do',
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
	    	'gcglgcgzgj.jsdj':$("#ddlPDDJ").combobox('getValue'),
	    	'gcglgcgzgj.gldj':$("#ddlGldj").combobox('getValue'),
//	    	'gcglgcgzgj.xdsj':$("#xdnf").val(),
	    	'gcglgcgzgj.lxbm':$("#lxbm").val(),
	    	'gcglgcgzgj.xmmc':$("#xmmc").val(),
	    	'gcglgcgzgj.lxmc':$("#lxmc").val(),
	    	'gcglgcgzgj.tsdq':$("#ddlTSDQ").combobox('getText'),
	    	'gcglgcgzgj.ljbfzt':$("#ljbfzt").combobox('getValue')
		},
	    columns:[[
	        {field:'c',title:'操作',width:320,align:'center',formatter:function(value,row,index){
  				return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dingwei('+index+')">定位</a>       '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="wqxiangxi('+index+')">详细</a>    '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="zjdw('+index+')">资金拨付</a>   ';
  			}},
  			 {field : 'XMMC',title : '项目名称',width : 180,align : 'center',formatter:function(value,row,index){
 	        	if(row.SL!=1)
 	        		return '<font color="red">'+row.XMMC+'</font>';
 	        	else return  row.XMMC;	
 	        }},
		    {field : 'XMBM',title : '项目编码',width : 120,align : 'center'},
		    {field : 'XZQH',title : '行政区划',width : 180,align : 'center'},
		    {field : 'GHLXBH',title : '路线编码',width : 120,align : 'center'},
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
	var jgzt='';
	var kgzt='';
	var lxmc=$("#lxmc").val();
	var xmnf=$("#ddlYear").combobox('getValues').join(",");
	if(xmnf.substr(0,1)==',')
		xmnf=xmnf.substr(1,xmnf.length);
	var bfyf=$("#ddlMonth").val();
	$('#datagrid').datagrid({    
	    url:'../../../../gcgl/selectGcgzgjjhList2.do',
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
	    	'gcglgcgzgj.jsdj':$("#ddlPDDJ").combobox('getValue'),
	    	'gcglgcgzgj.gldj':$("#ddlGldj").combobox('getValue'),
//	    	'gcglgcgzgj.xdsj':$("#xdnf").val(),
	    	'gcglgcgzgj.lxbm':$("#lxbm").val(),
	    	'gcglgcgzgj.xmmc':$("#xmmc").val(),
	    	'gcglgcgzgj.lxmc':$("#lxmc").val(),
	    	'gcglgcgzgj.tsdq':$("#ddlTSDQ").combobox('getText'),
	    	'gcglgcgzgj.ljbfzt':$("#ljbfzt").combobox('getValue')
		},
	    columns:[[
	        {field:'c',title:'操作',width:320,align:'center',formatter:function(value,row,index){
  				return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dingwei('+index+')">定位</a>       '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="wqxiangxi('+index+')">详细</a>    '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="zjdw__ck('+index+')">资金拨付</a>   ';
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
	var sbzt="";
	if($.cookie("unit2")=='_____36'){
		sbzt="1";
	}
	$('#zjgrid').datagrid({    
		url:'../../../../gcgl/selectGcgzgjCgsList.do',
	    striped:true,
	    pagination:true,
	    rownumbers:true,
	    pageNumber:1,
	    pageSize:10,
	    height:315,
	    queryParams: {
	    	jhid: jhid,
	    	'gcglgcgzgj.sbzt': sbzt
		},
	    columns:[[
				{field:'c',title:'操作',width:230,align:'center',formatter:function(value,row,index){
	        		if($.cookie("unit2")=='_____36'){
	        			if(row.shzt==0){
			        		return '<a href="#" onclick="editCgs('+index+')" style="color:#3399CC;">编辑</a>    '+'删除    '+'已上报    '+'<a href="javascript:zjbf_sh('+"'"+jhid+"','"+row.id+"'"+')" style="color:#3399CC;">未审核</a>    '+'<a href="javascript:zjbf_th('+"'"+jhid+"','"+row.id+"'"+')" style="color:#3399CC;">退回下级</a>    ';
	        			}else{
	        				return '编辑    '+'删除   '+'已上报    '+'已审核    '+'<a href="javascript:zjbf_thwsh('+"'"+jhid+"','"+row.id+"'"+')" style="color:#3399CC;">退回未审核</a>    ';
	        			}
	        		}else{
	        			if(row.sbzt==0){
	        				if(row.thyy==''||row.thyy==null)
			        		return '<a href="#" onclick="editCgs('+index+')" style="color:#3399CC;">编辑</a>    '+'<a href="#" onclick="delCgs('+index+')" style="color:#3399CC;">删除</a>   '+'<a href="javascript:zjbf_sb('+"'"+jhid+"','"+row.id+"'"+')" style="color:#3399CC;">未上报</a>    '+'未审核    '+'退回    ';
	        				else return '<a href="#" onclick="editCgs('+index+')" style="color:#3399CC;">编辑</a>    '+'<a href="#" onclick="delCgs('+index+')" style="color:#3399CC;">删除</a>   '+'<a href="javascript:zjbf_sb('+"'"+jhid+"','"+row.id+"'"+')" style="color:#3399CC;">未上报</a>    '+'未审核    '+'退回    '+'<a href="javascript:showStr('+"'"+row.thyy+"'"+')"  style="color:#3399CC;">退回原因</a>    ';

	        			}else{
	        				if(row.shzt==0){
	        					return '编辑    '+'删除   '+'已上报    '+'未审核    '+'退回    ';
	    	        		}else{
	    	        			return '编辑    '+'删除   '+'已上报    '+'已审核    '+'退回    ';	    	        		}
	        			}
	        		}
	        		
					
				}},
				{field:'pfztz',title:'总投资(万元)',width:100,align:'center'},
				{field:'cgsdwzj',title:'车购税(万元)',width:100,align:'center'},
				{field:'gz',title:'国债(万元)',width:100,align:'center'},
				{field:'sz',title:'省债(万元)',width:100,align:'center'},
				{field:'zq',title:'债券(万元)',width:100,align:'center'},
				{field:'dk',title:'厅贷款(万元)',width:100,align:'center'},
				{field:'jl',title:'奖励(万元)',width:100,align:'center'},
				{field:'qt',title:'其他(万元)',width:100,align:'center'},
				{field:'dfzc',title:'地方自筹(万元)',width:100,align:'center'},
				{field:'yhdk',title:'银行贷款(万元)',width:100,align:'center'},
				{field:'tbyf',title:'填报月份 ',width:100,align:'center'},
				{field:'tbsj',title:'填报时间 ',width:120,align:'center'},
				{field:'tbr',title:'填报人 ',width:80,align:'center'},
				{field:'cscyj',title:'审核意见',width:100,align:'center'}
	    ]]    
	}); 
}

function showAllZJ__ck(){
	var jhid=parent.obj1.XMBM;
	$('#zjgrid').datagrid({    
		url:'../../../../gcgl/selectGcgzgjCgsList.do',
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
			{field:'cgsdwzj',title:'拨付车购税(万元)',width:100,align:'center'},
			{field:'yhdk',title:'银行贷款(万元)',width:100,align:'center'},
			{field:'gz',title:'国债(万元)',width:100,align:'center'},
			{field:'sz',title:'省债(万元)',width:100,align:'center'},
			{field:'tbyf',title:'填报月份 ',width:100,align:'center'},
			{field:'tbsj',title:'填报时间 ',width:120,align:'center'},
			{field:'tbr',title:'填报人 ',width:80,align:'center'},
			{field:'cscyj',title:'审核意见',width:100,align:'center'}
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
		page : '../../upload.jsp?url='+"/jxzhpt/gcgl/uploadGcgzgjFile.do"+'&flag='+'gljsjyhgl%2fgcgzgj%2fgcgzgjxx'+'&type='+str+'&jhid='+parent.obj1.id,
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
//		parent.window.location.href="../../../../gcgl/downGcgzgjFile.do?type="+str+"&jhid="+parent.obj1.id;
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
		url:'../../../../gcgl/deleteGcgzgjFile.do',
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
		url:'../../../../gcgl/selectGcgzgjjhFile.do',
		data:data,
		dataType:'json',
		async:false,
		success:function(msg){
				if(msg.sgxkwj!=''){
					$("#xz_sgxkwj").text(msg.sgxkwj);
					$("#xz_sgxkwj").attr("style",'color: #2C7ED1;cursor:pointer;');
					$("#xz_sgxkwj").attr("href",'/jxzhpt/gcgl/downGcgzgjFile.do?type=sgxkwj'+"&jhid="+parent.obj1.id);
				}
				if(msg.jgtcwj!=''){
					$("#xz_jgtcwj").text(msg.jgtcwj);
					$("#xz_jgtcwj").attr("style",'color: #2C7ED1;cursor:pointer;');
					$("#xz_jgtcwj").attr("href",'/jxzhpt/gcgl/downGcgzgjFile.do?type=jgtcwj'+"&jhid="+parent.obj1.id);
				}
				if(msg.jgyswj!=''){
					$("#xz_jgyswj").text(msg.jgyswj);
					$("#xz_jgyswj").attr("style",'color: #2C7ED1;cursor:pointer;');
					$("#xz_jgyswj").attr("href",'/jxzhpt/gcgl/downGcgzgjFile.do?type=jgyswj'+"&jhid="+parent.obj1.id);
				}
			}
	});	
}

function shezhi(){
	var data="gcglwqgz.jhid="+parent.obj1.XMBM+"&gcglwqgz.nf="+new Date().getFullYear()+"&gcglwqgz.id="+parent.obj1.XMBM+"&gcglwqgz.tablename=gcgl_gcgzgj";
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