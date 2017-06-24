function urlxmnf(id,flag){
	var myDate = new Date();
	var years=[];
	var first;
	years.push({text:'全部',value:''});
	if(flag=='01011201010101'||flag=='0101120101010101'||flag=='0101120101010102'||flag=='0101120101010103'||
	   flag=='0101120101010104'||flag=='0101120101010105'||flag=='0101120101010106'||flag=='01011201010102'||
	   flag=='010112010102'||flag=='010112010105'||flag=='010112020101'||
	   flag=='01011202010101'||flag=='01011202010102'||flag=='01011202010103'||
	   flag=='010112030101'||flag=='01011203010101'||flag=='01011203010102'||flag=='01011203010103'||
	   flag=='010112030103'||flag=='010112040101'||flag=='01011301010101'||flag=='01011301010102'||
	   flag=='010113010102'||flag=='010113010105'||flag=='01011302010101'||flag=='01011302010102'||
	   flag=='010113020102'||flag=='010113020105'||flag=='01011303010101'||flag=='01011303010102'||
	   flag=='010113030102'||flag=='010113030105'||flag=='01011304010101'||
	   flag=='01011304010102'||flag=='010113040102'||flag=='010113040105'||flag=='01011401010101'||
	   flag=='01011401010102'||flag=='010114010102'||flag=='010114010105'||flag=='01011402010101'||
	   flag=='01011402010102'||flag=='010114020102'||flag=='010114020105'||flag=='01011403010101'||
	   flag=='01011403010102'||flag=='010114030102'||flag=='010114030105'||
	   flag=='010114040101'||flag=='010114040102'||flag=='010114040103'||flag=='010114040104'||
	   flag=='010114040105'||flag=='010114040106'||flag=='010114040107'||
	   flag=='01011501010101'||flag=='01011501010102'||flag=='010115010102'||flag=='010115010105'
	){
		if(flag=='01011302010101'||flag=='01011302010102'||flag=='010113020102'||flag=='010113020105'){
			$("#astext").html('计划上报');
		}
		if(flag=='01011303010101'||flag=='01011303010102'||flag=='010113030102'||flag=='010113030105'){
			$("#astext").html('计划审核');
		}
		/*if(flag=='01011304010101'||flag=='01011304010102'||flag=='010113040102'||flag=='010113040105'){
			$("#astext").html('计划下达');
		}*/
		$("#bstext").html('十二五');
		for(var i=0;i<5;i++){
			if(i==0){
				first=myDate.getFullYear()-i;
				if(first>2015)
					first=2015;
				if(first<2010)
					first=2010;
			}
			years.push({text:(2010+5-i),value:(2010+5-i)});
		}
	}
	if(flag=='01011201020101'||flag=='0101120102010101'||flag=='0101120102010102'||
		flag=='0101120102010103'||flag=='0101120102010104'||flag=='0101120102010105'||
		flag=='0101120102010106'||flag=='01011201020102'||flag=='010112010202'||
		flag=='010112010205'||flag=='010112020201'||flag=='01011202020101'||
		flag=='01011202020102'||flag=='01011202020103'||flag=='010112030201'||
		flag=='01011203020101'||flag=='01011203020102'||flag=='01011203020103'||
		flag=='010112030203'||flag=='010112040201'||flag=='01011301020101'||
		flag=='01011301020102'||flag=='010113010202'||flag=='010113010206'||
		flag=='01011302020101'||flag=='01011302020102'||flag=='010113020202'||
		flag=='010113020206'||flag=='01011303020101'||flag=='01011303020102'||
		flag=='010113030202'||flag=='010113030206'||flag=='010113040105'||flag=='01011304020101'||
		flag=='01011304020102'||flag=='010113040202'||flag=='010113040206'||flag=='01011401020101'||
		flag=='01011401020102'||flag=='010114010202'||flag=='010114010206'||flag=='01011402020101'||
		flag=='01011402020102'||flag=='010114020202'||flag=='010114020206'||flag=='01011403020101'||
		flag=='01011403020102'||flag=='010114030202'||flag=='010114030206'||
		flag=='010114040201'||flag=='010114040202'||flag=='010114040203'||flag=='010114040204'||
		flag=='010114040205'||flag=='010114040206'||flag=='010114040207'||flag=='01011501020101'||
		flag=='01011501020102'||flag=='010115010202'||flag=='010115010206'
	){
		if(flag=='01011302020101'||flag=='01011302020102'||flag=='010113020202'||flag=='010113020206'){
			$("#astext").html('计划上报');
		}
		if(flag=='01011303020101'||flag=='01011303020102'||flag=='010113030202'||flag=='010113030206'){
			$("#astext").html('计划审核');
		}
		/*if(flag=='01011304020101'||flag=='01011304020102'||flag=='010113040202'||flag=='010113040206'){
			$("#astext").html('计划下达');
		}*/
		$("#bstext").html('十三五');
		for(var i=0;i<5;i++){
			if(i==0){
				first=myDate.getFullYear()-i;
				if(first>2020)
					first=2020;
				if(first<2016)
					first=2016;
			}
			years.push({text:(2015+5-i),value:(2015+5-i)});
		}
	}
	
	$('#'+id).combobox({
	    data:years,
	    valueField:'value',
	    textField:'text',
	    multiple:true,
	    formatter:function(row){
			var opts = $(this).combobox('options');
			return '<input id="id'+row.value+'" type="checkbox" class="combobox-checkbox">' + row[opts.textField];
		},
		onSelect:function(record){
			var opts = $(this).combobox('options');
			if(record[opts.valueField]==""){
				var values =new Array();
				var datas = $('#' +id).combobox("getData");
				$.each(datas,function(index,item){
					values.push(item.value);
					$('#id'+item.value).attr('checked', true);
				});
				$('#' +id).combobox("setValues",values);
			}else{
				$('#id'+record.value).attr('checked', true);
			}
		},
		onUnselect:function(record){
			var opts = $(this).combobox('options');
			var datas = $('#' +id).combobox("getData");
			var values = $('#' +id).combobox("getValues");
			$('#' +id).combobox("clear");
			if(record[opts.valueField]!=""){
				if(jQuery.inArray("",values)>=0){
					values.splice(jQuery.inArray("",values),1);
				}
				$.each(datas,function(index,item){
					if(jQuery.inArray(""+item.value,values)<0){
						$('#id'+item.value).attr('checked', false);
					}
				});
				$('#' +id).combobox("setValues",values);
			}else{
				$.each(datas,function(index,item){
					$('#id'+item.value).attr('checked', false);
				});
			}
		}
	});
	$('#'+id).combobox("setValue",first+'');
	$('#id'+first).attr('checked', true);
}


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
	//YMLib.UI.createWindow('yhdzx_xx','养护大中修项目计划详情',"/jxzhpt/page/jhgl/jhkxx/yhdzx.jsp",'yhdzx_xx',1000,500);
	YMLib.UI.createWindow('wqxx','养护大中修工程项目详情','yhdzxxx.jsp','wqxx',940,450);
	//window.open("yhdzxxx.jsp");
}
function zjdw(index){
	var data=$("#datagrid").datagrid('getRows')[index];
	obj1=data;
	YMLib.UI.createWindow('wqxx1','资金到位情况','yhdzxzjdw.jsp','wqxx1',900,500);
	//window.open("abgczjdw.jsp");
}
function zjdw__ck(index){
	var data=$("#datagrid").datagrid('getRows')[index];
	obj1=data;
	YMLib.UI.createWindow('wqxx1','资金到位情况','yhdzxzjdw__ck.jsp','wqxx1',900,500);
	//window.open("abgczjdw.jsp");
}
function closes(str){
	 parent.$('#'+str).window('destroy');
}
function addCgs(){
	YMLib.UI.createWindow('wqxx','资金到位添加','yhdzxzjdwtj.jsp','wqxx',700,350);
}
function editCgs(index){
	var data=$("#zjgrid").datagrid('getRows')[index];
	obj=data;
	YMLib.UI.createWindow('wqxx','资金到位编辑','yhdzxzjdwxg.jsp','wqxx',700,350);
}

//添加车购税
function tjyhdzxcgs(){
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
	var sbzt="0";var shzt="0";
	if($.cookie("unit2")=='_____36'){
		sbzt="1";
	}
	var data="gcglyhdzx.cgsdwzj="+0+
	"&gcglyhdzx.tbr="+$("#tj_tbr").val()+
	"&gcglyhdzx.tbsj="+$("#tj_tbsj").val()+
	"&gcglyhdzx.tbyf="+$("#tbyf").val()+
	"&gcglyhdzx.pfztz="+$("#pfztz").val()+
	"&gcglyhdzx.rys="+$("#rys").val()+
	"&gcglyhdzx.dk="+$("#dk").val()+
	"&gcglyhdzx.qt="+$("#qt").val()+
	"&gcglyhdzx.sbzt="+sbzt+
	"&gcglyhdzx.shzt="+shzt+
	"&gcglyhdzx.jhid="+parent.parent.obj1.XMBM;
	//alert(data);
	$.ajax({
		type:'post',
		url:'../../../../gcgl/insertYhdzxCgs.do',
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
function xgyhdzxcgs(){
	if($("#xg_cgsdwzj").val()==''){
		alert("请您填入本月资金");
		return;
	}
	var data="gcglyhdzx.cgsdwzj="+0+
	"&gcglyhdzx.tbr="+$("#tj_tbr").val()+
	"&gcglyhdzx.tbsj="+$("#tj_tbsj").val()+
	"&gcglyhdzx.jhid="+parent.obj.jhid+
	"&gcglyhdzx.id="+parent.obj.id+
	"&gcglyhdzx.tbyf="+$("#tbyf").val()+
	"&gcglyhdzx.pfztz="+$("#pfztz").val()+
	"&gcglyhdzx.rys="+$("#rys").val()+
	"&gcglyhdzx.dk="+$("#dk").val()+
	"&gcglyhdzx.qt="+$("#qt").val();
	//alert(data);
	$.ajax({
		type:'post',
		url:'../../../../gcgl/updateYhdzxCgs.do',
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
	var data="gcglyhdzx.id="+data1.id;
	if(confirm("确认删除吗？")){
		$.ajax({
			type:'post',
			url:'../../../../gcgl/deleteYhdzxCgs.do',
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


function showAllyh(){
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
	var xmnf=$("#ddlYear").combobox('getValues').join(",");
	if(xmnf.substr(0,1)==',')
		xmnf=xmnf.substr(1,xmnf.length);
	var bfyf=$("#ddlMonth").val();
	var lxmc=$("#lxmc").val();
	$('#datagrid').datagrid({    
	    url:'../../../../gcgl/selectYhdzxjhList1.do',
	    striped:true,
	    pagination:true,
	    rownumbers:true,
	    pageNumber:1,
	    pageSize:10,
	    height:$(window).height()-185,
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
	    	'gcglyhdzx.jsdj':$("#ddlPDDJ").combobox('getValue'),
	    	'gcglyhdzx.lxbm':$("#lxbm").val(),
//	    	'gcglyhdzx.xdsj':$("#xdnf").val(),
	    	'gcglyhdzx.xmmc':$("#xmmc").val(),
	    	'gcglyhdzx.lxmc':$("#lxmc").val(),
	    	'gcglyhdzx.gldj':$("#ddlGldj").combobox('getValue'),
	    	'gcglyhdzx.tsdq':$("#ddlTSDQ").combobox('getText'),
	    	'gcglyhdzx.ljbfzt':$("#ljbfzt").combobox('getValue')
		},
	    columns:[[
	         {field:'c',title:'操作',width:150,align:'center',formatter:function(value,row,index){
				return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dingwei('+index+')">定位</a>   '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="wqxiangxi('+index+')">详细</a>    '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="zjdw('+index+')">资金拨付</a>   ';
			}},
			 {field:'XMBM',title:'项目编码',width:100,align:'center'},
			 {field : 'XMMC',title : '项目名称',width : 180,align : 'center',formatter:function(value,row,index){
	  	        	if(row.SL!=1)
	  	        		return '<font color="red">'+row.XMMC+'</font>';
	  	        	else return  row.XMMC;	
	  	        }},
				{field:'XZQH',title:'行政区划',width:100,align:'center'},
//				{field:'GYDW',title:'管养单位',width:100,align:'center'},
				{field:'YLXBH',title:'路线编码',width:100,align:'center'},
				{field:'QDZH',title:'起点桩号',width:100,align:'center'},
				{field:'ZDZH',title:'止点桩号',width:100,align:'center'},
				{field:'LC',title:'里程',width:100,align:'center'},
//				{field:'JSDJ',title:'技术等级',width:100,align:'center'},
				{field:'JHKGSJ',title:'计划开工时间',width:100,align:'center'},
				{field:'JHWGSJ',title:'计划完工时间',width:100,align:'center'},
		        {field:'XDZJ',title:'已下达计划(万元)',width:120,align:'center'},
		        {field:'BFZJ',title:'已拨付资金(万元)',width:120,align:'center'}
//				{field:'GQ',title:'工期（月）',width:100,align:'center'},
//				{field:'NTZ',title:'总投资',width:100,align:'center'}
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
	var xmnf=$("#ddlYear").combobox('getValues').join(",");
	if(xmnf.substr(0,1)==',')
		xmnf=xmnf.substr(1,xmnf.length);
	var bfyf=$("#ddlMonth").val();
	var lxmc=$("#lxmc").val();
	$('#datagrid').datagrid({    
	    url:'../../../../gcgl/selectYhdzxjhList1.do',
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
	    	'gcglyhdzx.jsdj':$("#ddlPDDJ").combobox('getValue'),
	    	'gcglyhdzx.lxbm':$("#lxbm").val(),
//	    	'gcglyhdzx.xdsj':$("#xdnf").val(),
	    	'gcglyhdzx.xmmc':$("#xmmc").val(),
	    	'gcglyhdzx.lxmc':$("#lxmc").val(),
	    	'gcglyhdzx.gldj':$("#ddlGldj").combobox('getValue'),
	    	'gcglyhdzx.tsdq':$("#ddlTSDQ").combobox('getText'),
	    	'gcglyhdzx.ljbfzt':$("#ljbfzt").combobox('getValue')
		},
	    columns:[[
	         {field:'c',title:'操作',width:150,align:'center',formatter:function(value,row,index){
				return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dingwei('+index+')">定位</a>   '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="wqxiangxi('+index+')">详细</a>    '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="zjdw__ck('+index+')">资金拨付</a>   ';
			}},
			 {field:'XMBM',title:'项目编码',width:100,align:'center'},
			 {field : 'XMMC',title : '项目名称',width : 180,align : 'center',formatter:function(value,row,index){
	  	        	if(row.SL!=1)
	  	        		return '<font color="red">'+row.XMMC+'</font>';
	  	        	else return  row.XMMC;	
	  	        }},
				{field:'XZQH',title:'行政区划',width:100,align:'center'},
//				{field:'GYDW',title:'管养单位',width:100,align:'center'},
				{field:'YLXBH',title:'路线编码',width:100,align:'center'},
				{field:'QDZH',title:'起点桩号',width:100,align:'center'},
				{field:'ZDZH',title:'止点桩号',width:100,align:'center'},
				{field:'LC',title:'里程',width:100,align:'center'},
//				{field:'JSDJ',title:'技术等级',width:100,align:'center'},
				{field:'JHKGSJ',title:'计划开工时间',width:100,align:'center'},
				{field:'JHWGSJ',title:'计划完工时间',width:100,align:'center'},
//				{field:'GQ',title:'工期（月）',width:100,align:'center'},
//				{field:'NTZ',title:'总投资',width:100,align:'center'}
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
		url:'../../../../gcgl/selectYhdzxCgsList.do',
	    striped:true,
	    pagination:true,
	    rownumbers:true,
	    pageNumber:1,
	    pageSize:10,
	    height:315,
	    queryParams: {
	    	jhid: jhid,
	    	'gcglyhdzx.sbzt': sbzt
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
				{field:'rys',title:'燃油税(万元)',width:100,align:'center'},
				{field:'dk',title:'厅贷款(万元)',width:100,align:'center'},
				{field:'qt',title:'其他(万元)',width:100,align:'center'},
				{field:'tbyf',title:'填报月份 ',width:100,align:'center'},
				{field:'tbsj',title:'填报时间 ',width:120,align:'center'},
				{field:'tbr',title:'填报人 ',width:80,align:'center'},
//				{field:'cgsdwzj',title:'拨付车购税(万元)',width:100,align:'center'},
				{field:'cscyj',title:'审核意见',width:100,align:'center'}
	    ]]    
	}); 
}
function showAllZJ__ck(){
	var jhid=parent.obj1.XMBM;
	$('#zjgrid').datagrid({    
		url:'../../../../gcgl/selectYhdzxCgsList.do',
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
//				{field:'cgsdwzj',title:'拨付车购税(万元)',width:100,align:'center'},
				{field:'stz',title:'省投资(万元)',width:100,align:'center'},
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
		page : '../../upload.jsp?url='+"/jxzhpt/gcgl/uploadYhdzxFile.do"+'&flag='+'gljsjyhgl%2fyhdzx%2fyhdzxxx'+'&type='+str+'&jhid='+parent.obj1.id,
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
//		parent.window.location.href="../../../../gcgl/downYhdzxFile.do?type="+str+"&jhid="+parent.obj1.id;
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
		url:'../../../../gcgl/deleteYhdzxFile.do',
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
		url:'../../../../gcgl/selectYhdzxjhFile.do',
		data:data,
		dataType:'json',
		async:false,
		success:function(msg){
			if(msg.sgxkwj!=''){
				$("#xz_sgxkwj").text(msg.sgxkwj);
				$("#xz_sgxkwj").attr("style",'color: #2C7ED1;cursor:pointer;');
				$("#xz_sgxkwj").attr("href",'/jxzhpt/gcgl/downYhdzxFile.do?type=sgxkwj'+"&jhid="+parent.obj1.id);
			}
			if(msg.jgtcwj!=''){
				$("#xz_jgtcwj").text(msg.jgtcwj);
				$("#xz_jgtcwj").attr("style",'color: #2C7ED1;cursor:pointer;');
				$("#xz_jgtcwj").attr("href",'/jxzhpt/gcgl/downYhdzxFile.do?type=jgtcwj'+"&jhid="+parent.obj1.id);
			}
			if(msg.jgyswj!=''){
				$("#xz_jgyswj").text(msg.jgyswj);
				$("#xz_jgyswj").attr("style",'color: #2C7ED1;cursor:pointer;');
				$("#xz_jgyswj").attr("href",'/jxzhpt/gcgl/downYhdzxFile.do?type=jgyswj'+"&jhid="+parent.obj1.id);
			}
			}
	});	
}

function shezhi(){
	var data="gcglwqgz.jhid="+parent.obj1.XMBM+"&gcglwqgz.nf="+new Date().getFullYear()+"&gcglwqgz.id="+parent.obj1.XMBM+"&gcglwqgz.tablename=gcgl_yhdzx";
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