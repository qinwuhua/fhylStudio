var obj=new Object();
var obj1=new Object();
function thxm(index){
	var data="id="+$("#datagrid").datagrid('getRows')[index].XMBM+"&xmlx=lmgz";
	if(confirm("确定退回吗？")){
		$.ajax({
			data:data,
			type:'post',
			dataType:'json',
			url:'/jxzhpt/gcgl/thxmwgtj.do',
			success:function(msg){
				if(msg){
					alert("退回成功");
					$("#datagrid").datagrid('reload');
				}else{
					alert("退回失败");
				}
			}
		})
	}
}
function jgys(index){
	var data=$("#datagrid").datagrid('getRows')[index];
	obj1=data;
	YMLib.UI.createWindow('wqxx','交工验收信息','jgys.jsp','wqxx',650,420);
	}
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
					lxbm=lxbm+msg[i].ghlxbm;
					qdzh=qdzh+msg[i].ghqdzh;
					zdzh=zdzh+msg[i].ghzdzh;
				}else{
					lxbm=lxbm+msg[i].ghlxbm+"-";
					qdzh=qdzh+msg[i].ghqdzh+"-";
					zdzh=zdzh+msg[i].ghzdzh+"-";
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
	//window.open("wqgzxx.jsp");
}
function closes(str){
	 parent.$('#'+str).window('destroy');
}
function Showybxx(index){
	var data=$("#ybgrid").datagrid('getRows')[index];
	parent.obj=data;
	parent.YMLib.UI.createWindow('wqxx','路面改造月报详情','gcgzgjybxx.jsp','wqxx',900,450);
	//window.open("wqgzybxx.jsp");
}
function ybsb(index){
	var data=$("#datagrid").datagrid('getRows')[index];
	obj1=data;
	YMLib.UI.createWindow('wqxx1','路面改造月报列表','gcgzgjyb.jsp','wqxx1',1059,480);
	//window.open("wqgzyb.jsp");
}

function showAll(){
	var xmnf=$("#ddlYear").combobox('getValues').join(",");
	if(xmnf.substr(0,1)==',')
		xmnf=xmnf.substr(1,xmnf.length);
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
	var jgzt='1';
	var kgzt='1';
	var lxmc=$("#lxmc").val();
	var qlmc=$("#qlmc").val();
	$('#datagrid').datagrid({    
	    url:'../../../../gcgl/selectGcgzgjjhList1.do',
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
	    	jgzt: jgzt,
	    	lxmc:lxmc,
	    	qlmc:qlmc,
	    	ybzt:'',
	    	sfsj:7,
	    	xmnf:xmnf,
	    	'gcglgcgzgj.jsdj':$("#ddlPDDJ").combobox('getValue'),
	    	'gcglgcgzgj.lxbm':$("#lxbm").val(),
	    	'gcglgcgzgj.xmmc':$("#xmmc").val(),
	    	'gcglgcgzgj.lxmc':$("#lxmc").val(),
	    	'gcglgcgzgj.gldj':$("#ddlGldj").combobox('getValue'),
	    	'gcglgcgzgj.tsdq':$("#ddlTSDQ").combobox('getText'),
	    	'gcglgcgzgj.jgys':$("#jgys").combobox('getValue')
		},
	    columns:[[
	        {field:'c',title:'操作',width:320,align:'center',formatter:function(value,row,index){
	        	return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dingwei('+index+')">定位</a>    '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="wqxiangxi('+index+')">详细</a>    '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="ybsb('+index+')">月报信息</a>   '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="jgys('+index+')">交工验收</a>  '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="thxm('+index+')">退回</a>  ';
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
	var xmnf=$("#ddlYear").combobox('getValues').join(",");
	if(xmnf.substr(0,1)==',')
		xmnf=xmnf.substr(1,xmnf.length);
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
	var jgzt='1';
	var kgzt='1';
	var lxmc=$("#lxmc").val();
	var qlmc=$("#qlmc").val();
	$('#datagrid').datagrid({    
	    url:'../../../../gcgl/selectGcgzgjjhList1.do',
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
	    	jgzt: jgzt,
	    	lxmc:lxmc,
	    	qlmc:qlmc,
	    	ybzt:'',
	    	sfsj:7,
	    	xmnf:xmnf,
	    	'gcglgcgzgj.jsdj':$("#ddlPDDJ").combobox('getValue'),
	    	'gcglgcgzgj.lxbm':$("#lxbm").val(),
	    	'gcglgcgzgj.xmmc':$("#xmmc").val(),
	    	'gcglgcgzgj.lxmc':$("#lxmc").val(),
	    	'gcglgcgzgj.gldj':$("#ddlGldj").combobox('getValue'),
	    	'gcglgcgzgj.tsdq':$("#ddlTSDQ").combobox('getText'),
	    	'gcglgcgzgj.jgys':$("#jgys").combobox('getValue')
		},
	    columns:[[
	        {field:'c',title:'操作',width:320,align:'center',formatter:function(value,row,index){
	        	return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dingwei('+index+')">定位</a>    '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="wqxiangxi('+index+')">详细</a>    '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="ybsb('+index+')">月报信息</a>   ';
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

function showYBlist(){
	$('#ybgrid').datagrid({    
	    url:'../../../../gcgl/selectgcgzgjYbByJhid1.do?jhid='+parent.obj1.XMBM,
	    striped:true,
	    pagination:true,
	    rownumbers:true,
	    pageNumber:1,
	    pageSize:10,
	    height:325,
	    columns:[
	             [
	              	{field:'c',title:'操作',width:150,align:'center',rowspan:2,formatter:function(value,row,index){
	              		return '<a href="#" onclick="Showybxx('+index+')">详细</a>    ';
			        }},
			        {field:'sbyf',title:'上报月份',width:100,align:'center',rowspan:2},
					{field:'sbsj',title:'上报时间',width:100,align:'center',rowspan:2},
					{field:'bywcdc',title:'本月完成垫层（m³）',width:120,align:'center',rowspan:2},
					{field:'bywcjc',title:'本月完成基层（m³）',width:120,align:'center',rowspan:2},
					{field:'bywcmc',title:'本月完成面层（公里）',width:120,align:'center',rowspan:2},
					{field:'kgdl',title:'截至开工段落',width:100,align:'center',rowspan:2},
					{title:'本月完成投资（万元）',colspan:5},
					{title:'本月资金到位（万元）',colspan:5},
					{field:'qksm',title:'情况说明',width:150,align:'center',rowspan:2}
					],
					[
					{field:'wc_btz',title:'部投资',width:79,align:'center',rowspan:1},
						{field:'yhdk',title:'银行贷款',width:79,align:'center',rowspan:1},
						{field:'gz',title:'国债',width:79,align:'center',rowspan:1},
						{field:'sz',title:'省债',width:79,align:'center',rowspan:1},
						{field:'wc_qttz',title:'其他投资',width:79,align:'center',rowspan:1},
						{field:'zjdw_btz',title:'部投资',width:79,align:'center',rowspan:1},
						{field:'dwyhdk',title:'银行贷款',width:79,align:'center',rowspan:1},
						{field:'dwgz',title:'国债',width:79,align:'center',rowspan:1},
						{field:'dwsz',title:'省债',width:79,align:'center',rowspan:1},
						{field:'zjdw_qttz',title:'其他投资',width:79,align:'center',rowspan:1}
			    ]
	    ]
	});
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