//基础库管理
var gydwstr;
var xzqhstr;
	function jckglWqgz(){
		var gydw=$("#gydw").combotree("getValues");
 		if(gydw.length==0||gydw.length==1){
 			gydwstr= $.cookie("unit2");
 		}else{
 			gydwstr= gydw.join(',');
 		}
		var xzqhdm=$("#xzqhmc").combotree("getValues");
 		if(xzqhdm.length==0||xzqhdm.length==1){
 			xzqhstr= $.cookie("dist2");
 		}else{
 			xzqhstr= xzqhdm.join(',');
 		}
		$("#grid").datagrid({    
			 url:'/jxzhpt/xmjck/selectWqgz.do',
			 queryParams : {
				 	'sbthcd':function(){
				 		if($.cookie("unit2")=='______36') return 7;
				 		else return $.cookie("unit2").length;
				 	},
				 	'gydw': gydwstr,
				 	'xzqhdm':xzqhstr,
				 	'lxmc' : $('#lxmc').val(),
				 	'qlmc':$("#qlmc").val(),
				 	'xmnf':$("#xmnf").combobox("getValue"),
				 	'sbzt':$('#sbzt').combobox("getValue"),
				 	'jsdj':$("#jsdj").combobox("getValue"),
				 	'akjfl':$("#akjfl").combobox("getValue"),
				 	'lxbm':$("#lxbm").val(),
				 	'qlbh':$("#qlbh").val()
				},
			    striped:true,
			    pagination:true,
			    rownumbers:true,
			    pageNumber:1,
			    pageSize:10,
			    height:$(window).height()-180,
				width:$(window).width()-10,
		    columns:[[    
				{field:'allSel',title:'全选',width:60,align:'center',checkbox:'true'},         
				{field:'cz',title:'操作',width:130,align:'center',formatter:function(value,row,index){
						return '<a href=javascript:locationXm("'+row.qlbh+'","'+row.akjfl+'")  style="text-decoration:none;color:#3399CC; ">定位</a>  '+
						'<a href=javascript:ckJckwqgz("'+row.id+'") style="text-decoration:none;color:#3399CC; ">详细</a>  ';
				}},    
				{field:'sbzt2',title:'上报状态',width:80,align:'center'},
					{field:'shzt',title:'审核状态',width:80,align:'center'},
				 	{field:'gydw',title:'管养单位',width:160,align:'center'},
			        {field:'xzqhmc',title:'行政区划',width:120,align:'center'},
			        {field:'qlbh',title:'桥梁编号',width:120,align:'center'},
			        {field:'qlmc',title:'桥梁名称',width:120,align:'center'},
			        {field:'qlzxzh',title:'桥梁中心桩号',width:120,align:'center'},
			        {field:'lxbm',title:'路线编码',width:120,align:'center'},
			        {field:'lxmc',title:'路线名称',width:120,align:'center'},
			        {field:'pddj',title:'桥梁评定等级',width:140,align:'center'},
			        {field:'xjgjnd',title:'修建/改建年度',width:140,align:'center'},
			        {field:'xmnf',title:'项目年份',width:140,align:'center'}
		    ]]    
		});  
		var sbthcd;
	 	if($.cookie("unit2")=='______36'){
	 			sbthcd=7;
	 		}else  sbthcd=$.cookie("unit2").length;
	 	var data="sbthcd="+sbthcd+"&gydw="+gydwstr+"&xzqhdm="+xzqhstr+"&lxmc="+$('#lxmc').val()+"&qlmc="+$("#qlmc").val()+
	 	"&xmnf="+$("#xmnf").combobox("getValue")+"&sbzt="+$('#sbzt').combobox("getValue")+
	 	"&jsdj="+$("#jsdj").combobox("getValue")+"&akjfl="+$("#akjfl").combobox("getValue")+"&lxbm="+$("#lxbm").val()+"&qlbh="+$("#qlbh").val();
	$.ajax({
		 type : "POST",
		 url : "/jxzhpt/xmjck/selectWqgzCount.do",
		 dataType : 'json',
		 data : data,
		 success : function(msg){
			 $("#wqgz1").html(msg);
		 },
	});
	}

	function jckglAbgc(){
		alert($("#gydw").combotree("getValues"));
		var gydw=$("#gydw").combotree("getValues");
 		if(gydw.length==0||gydw.length==1){
 			gydwstr= $.cookie("unit2");
 		}else{
 			gydwstr= gydw.join(',');
 		}
		var xzqhdm=$("#xzqhmc").combotree("getValues");
 		if(xzqhdm.length==0||xzqhdm.length==1){
 			xzqhstr= $.cookie("dist2");
 		}else{
 			xzqhstr= xzqhdm.join(',');
 		}
		$("#grid").datagrid({    
			 url:'/jxzhpt/xmjck/selectAbgc.do',
			 queryParams : {
				 	'sbthcd':function(){
				 		if($.cookie("unit2")=='______36') return 7;
				 		else return $.cookie("unit2").length;
				 	},
				 	'gydw': gydwstr,
				 	'xzqhdm':xzqhstr,
				 	'lxmc' : $('#lxmc').val(),
				 	'xmnf':$("#xmnf").combobox("getValue"),
				 	'sbzt':$('#sbzt').combobox("getValue"),
				 	'lxjsdj':$("#lxjsdj").combobox("getValue"),
				 	'lxbm':$("#lxbm").val(),
				 	'bz':$("#bz").combobox("getValue"),
				},
				striped:true,
				pagination:true,
				rownumbers:true,
			    pageNumber:1,
			    pageSize:10,
			    height:$(window).height()-180,
				width:$(window).width()-10,
		    columns:[[    
				{field:'allSel',title:'全选',width:60,align:'center',checkbox:'true'},         
				{field:'cz',title:'操作',width:130,align:'center',formatter:function(value,row,index){

						return '<a href=javascript:locationXm("'+row.lxbm+'") style="text-decoration:none;color:#3399CC; ">定位</a>  '+
						'<a href=javascript:ckJckabgc("'+row.id+'") style="text-decoration:none;color:#3399CC; ">详细</a>  ';

				}},    
				{field:'sbzt2',title:'上报状态',width:80,align:'center'},
				{field:'shzt',title:'审核状态',width:80,align:'center'},
		        {field:'gydw',title:'管养单位',width:160,align:'center'},
		        {field:'xzqhmc',title:'行政区划',width:120,align:'center'},
		        {field:'lxbm',title:'路线编号',width:120,align:'center'},
		        {field:'lxmc',title:'路线名称',width:120,align:'center'},
		        {field:'qdzh',title:'起点桩号',width:140,align:'center'},
		        {field:'zdzh',title:'止点桩号',width:140,align:'center'},
		        {field:'qzlc',title:'起止里程',width:140,align:'center'},
		        {field:'qzlc',title:'总里程',width:140,align:'center'},
		        {field:'yhlc',title:'隐患里程',width:140,align:'center'},
		        {field:'gjxjnd',title:'改建/修建年度',width:140,align:'center'},
		        {field:'xmnf',title:'项目年份',width:140,align:'center'}
		    ]]    
		});  
		var sbthcd;

	 	if($.cookie("unit2")=='______36'){
	 			sbthcd=7;
	 		}else  sbthcd=$.cookie("unit2").length;
	 	var data="sbthcd="+sbthcd+"&gydw="+gydwstr+"&xzqhdm="+xzqhstr+"&lxmc="+$('#lxmc').val()+"&xmnf="+
	 	$("#xmnf").combobox("getValue")+"&sbzt="+$("#sbzt").combobox("getValue")+
	 	"&lxjsdj="+$("#lxjsdj").combobox("getValue")+"&lxbm="+$("#lxbm").val()+"&bz="+$("#bz").combobox("getValue");
	$.ajax({
		 type : "POST",
		 url : "/jxzhpt/xmjck/selAbgcCount.do",
		 dataType : 'json',
		 data : data,
		 success : function(msg){
			 $("#abgc1").html(msg.sbthcd);
			 if(msg.qzlc!=null && msg.qzlc!=""){
				 $("#abgc2").html(msg.qzlc);
			 }else $("#abgc2").html("0");
			 if(msg.yhlc!=null && msg.yhlc!=""){
				 $("#abgc3").html(msg.yhlc);
			 }else $("#abgc3").html("0");
		 },
	});
	}

	function jckglZhfz(){
		var gydw=$("#gydw").combotree("getValues");
 		if(gydw.length==0||gydw.length==1){
 			gydwstr= $.cookie("unit2");
 		}else{
 			gydwstr= gydw.join(',');
 		}
		var xzqhdm=$("#xzqhmc").combotree("getValues");
 		if(xzqhdm.length==0||xzqhdm.length==1){
 			xzqhstr= $.cookie("dist2");
 		}else{
 			xzqhstr= xzqhdm.join(',');
 		}
		$("#grid").datagrid({    
			 url:'/jxzhpt/xmjck/selectZhfz.do',
			 queryParams : {
				 	'sbthcd':function(){
				 		if($.cookie("unit2")=='______36') return 7;
				 		else return $.cookie("unit2").length;
				 	},
				 	'gydw': gydwstr,
				 	'xzqhdm':xzqhstr,
				 	'lxmc' : $('#lxmc').val(),
				 	'xmnf':$("#xmnf").combobox("getValue"),
				 	'sbzt':$('#sbzt').combobox("getValue"),
				 	'lxjsdj':$("#lxjsdj").combobox("getValue"),
				 	'bz':$("#bz").combobox("getValue"),
				 	'lxbm':$("#lxbm").val(),
				},
			    striped:true,
			    pagination:true,
			    rownumbers:true,
			    pageNumber:1,
			    pageSize:10,
			    height:$(window).height()-180,
				width:$(window).width()-10,
		    columns:[[    
				{field:'allSel',title:'全选',width:60,align:'center',checkbox:'true'},         
				{field:'cz',title:'操作',width:130,align:'center',formatter:function(value,row,index){
						return '<a href=javascript:locationXm("'+row.lxbm+'") style="text-decoration:none;color:#3399CC; ">定位</a>  '+
						'<a href=javascript:ckJckzhfz("'+row.id+'") style="text-decoration:none;color:#3399CC; ">详细</a>  ';
				}},    
				{field:'sbzt2',title:'上报状态',width:80,align:'center'},
				{field:'shzt',title:'审核状态',width:80,align:'center'},
		        {field:'gydw',title:'管养单位',width:160,align:'center'},
		        {field:'xzqhmc',title:'行政区划',width:120,align:'center'},
		        {field:'lxbm',title:'路线编号',width:120,align:'center'},
		        {field:'lxmc',title:'路线名称',width:120,align:'center'},
		        {field:'qdzh',title:'起点桩号',width:140,align:'center'},
		        {field:'zdzh',title:'止点桩号',width:140,align:'center'},
		        {field:'qzlc',title:'起止里程',width:140,align:'center'},
		        {field:'qzlc',title:'总里程',width:140,align:'center'},
		        {field:'yhlc',title:'隐患里程',width:140,align:'center'},
		        {field:'gjxjnd',title:'改建/修建年度',width:140,align:'center'},
		        {field:'xmnf',title:'项目年份',width:140,align:'center'}
		    ]]    
		});  
		var sbthcd;
	 	if($.cookie("unit2")=='______36'){
	 			sbthcd=7;
	 		}else  sbthcd=$.cookie("unit2").length;
	 	var data="sbthcd="+sbthcd+"&gydw="+gydwstr+"&xzqhdm="+xzqhstr+"&lxmc="+$('#lxmc').val()+"&xmnf="+
	 	$("#xmnf").combobox("getValue")+"&sbzt="+$("#sbzt").combobox("getValue")+
	 	"&lxjsdj="+$("#lxjsdj").combobox("getValue")+"&lxbm="+$("#lxbm").val()+"&bz="+$("#bz").combobox("getValue");
	$.ajax({
		 type : "POST",
		 url : "/jxzhpt/xmjck/selZhfzCount.do",
		 dataType : 'json',
		 data : data,
		 success : function(msg){
			 $("#abgc1").html(msg.sbthcd);
			 if(msg.qzlc!=null && msg.qzlc!=""){
				 $("#abgc2").html(msg.qzlc);
			 }else $("#abgc2").html("0");
			 if(msg.yhlc!=null && msg.yhlc!=""){
				 $("#abgc3").html(msg.yhlc);
			 }else $("#abgc3").html("0");
		 },
	});
	}
	

//审查库管理
function sckglWqgz(){
	var gydw=$("#gydw").combotree("getValues");
	if(gydw.length==0||gydw.length==1){
		gydwstr= $.cookie("unit2");
	}else{
		gydwstr= gydw.join(',');
	}
var xzqhdm=$("#xzqhmc").combotree("getValues");
	if(xzqhdm.length==0||xzqhdm.length==1){
		xzqhstr= $.cookie("dist2");
	}else{
		xzqhstr= xzqhdm.join(',');
	}
	$("#grid").datagrid({    
		 url:'/jxzhpt/xmsck/selectSckwqgz.do',
		 queryParams : {
			 	'sck_sbthcd':function(){
			 		if($.cookie("unit2")=='______36') return 7;
			 		else return $.cookie("unit2").length;
			 	},
			 	'gydw': gydwstr,
			 	'xzqhdm':xzqhstr,
			 	'lxmc' : $('#lxmc').val(),
			 	'qlmc':$("#qlmc").val(),
			 	'xmnf':$("#xmnf").combobox("getValue"),
			 	'sbzt':$('#sbzt').combobox("getValue"),
			 	'jsdj':$("#jsdj").combobox("getValue"),
			 	'akjfl':$("#akjfl").combobox("getValue"),
			 	'bzls':$("#bzls").combobox("getValue"),
			 	'lxbm': $('#lxbm').val(),
			 	'qlbh':$("#qlbh").val()
			},
		    striped:true,
		    pagination:true,
		    rownumbers:true,
		    pageNumber:1,
		    pageSize:10,
		    height:$(window).height()-185,
			width:$(window).width()-15,
	    columns:[[    
			{field:'allSel',title:'全选',width:60,align:'center',checkbox:'true'},         
			{field:'cz',title:'操作',width:130,align:'center',formatter:function(value,row,index){
					return '<a href=javascript:locationXm("'+row.qlbh+'","'+row.akjfl+'") style="text-decoration:none;color:#3399CC; ">定位</a>  '+
					'<a href=javascript:ckSckwqgz("'+row.sckid+'") style="text-decoration:none;color:#3399CC; ">详细</a>  ';
			}},    
			{field:'sck_sbzt2',title:'上报状态',width:80,align:'center'},
				{field:'sck_shzt',title:'审核状态',width:80,align:'center'},
				{field:'bzls',title:'补助历史',width:60,align:'center'},
			 	{field:'gydw',title:'管养单位',width:160,align:'center'},
		        {field:'xzqhmc',title:'行政区划',width:120,align:'center'},
		        {field:'qlbh',title:'桥梁编号',width:120,align:'center'},
		        {field:'qlmc',title:'桥梁名称',width:120,align:'center'},
		        {field:'qlzxzh',title:'桥梁中心桩号',width:120,align:'center'},
		        {field:'lxbm',title:'路线编码',width:120,align:'center'},
		        {field:'lxmc',title:'路线名称',width:120,align:'center'},
		        {field:'pddj',title:'桥梁评定等级',width:140,align:'center'},
		        {field:'xjgjnd',title:'修建/改建年度',width:140,align:'center'},
		        {field:'xmnf',title:'项目年份',width:140,align:'center'},
		        {field:'jsxz',title:'建设性质',width:140,align:'center'}
	    ]]    
	});  
	var sbthcd;
 	if($.cookie("unit2")=='______36'){
 			sbthcd=7;
 		}else  sbthcd=$.cookie("unit2").length;
 	var data="sck_sbthcd="+sbthcd+"&gydw="+gydwstr+"&xzqhdm="+xzqhstr+"&lxmc="+$('#lxmc').val()+"&qlmc="+$("#qlmc").val()+
 	"&xmnf="+$("#xmnf").combobox("getValue")+"&sbzt="+$('#sbzt').combobox("getValue")+
 	"&jsdj="+$("#jsdj").combobox("getValue")+"&akjfl="+$("#akjfl").combobox("getValue")+"&bzls="+$("#bzls").combobox("getValue")+
 	"&lxbm="+$("#lxbm").val()+"&qlbh="+$("#qlbh").val();
 	$.ajax({
	 type : "POST",
	 url : "/jxzhpt/xmsck/selectWqgzCount.do",
	 dataType : 'json',
	 data : data,
	 success : function(msg){
		 $("#wqgz1").html(msg);
	 },
});
}

function sckglAbgc(){
	var gydw=$("#gydw").combotree("getValues");
	if(gydw.length==0||gydw.length==1){
		gydwstr= $.cookie("unit2");
	}else{
		gydwstr= gydw.join(',');
	}
var xzqhdm=$("#xzqhmc").combotree("getValues");
	if(xzqhdm.length==0||xzqhdm.length==1){
		xzqhstr= $.cookie("dist2");
	}else{
		xzqhstr= xzqhdm.join(',');
	}
	$("#grid").datagrid({    
		 url:'/jxzhpt/xmsck/selectSckabgc.do',
		 queryParams : {
			 	'sck_sbthcd':function(){
			 		if($.cookie("unit2")=='______36') return 7;
			 		else return $.cookie("unit2").length;
			 	},
			 	'gydw': gydwstr,
			 	'xzqhdm':xzqhstr,
			 	'lxmc' : $('#lxmc').val(),
			 	'xmnf':$("#xmnf").combobox("getValue"),
			 	'sbzt':$('#sbzt').combobox("getValue"),
			 	'lxjsdj':$("#lxjsdj").combobox("getValue"),
			 	'lxbm':$("#lxbm").val(),
			 	'bzls':$("#bzls").combobox("getValue"),
			 	'bz':$("#bz").combobox("getValue"),
			},
		    striped:true,
		    pagination:true,
		    rownumbers:true,
		    pageNumber:1,
		    pageSize:10,
		    height:$(window).height()-185,
			width:$(window).width()-15,
	    columns:[[    
			{field:'allSel',title:'全选',width:60,align:'center',checkbox:'true'},         
			{field:'cz',title:'操作',width:130,align:'center',formatter:function(value,row,index){
					return '<a href=javascript:locationXm("'+row.lxbm+'")  style="text-decoration:none;color:#3399CC; ">定位</a>  '+
					'<a href=javascript:ckSckabgc("'+row.sckid+'") style="text-decoration:none;color:#3399CC; ">详细</a>  ';
			}},    
			{field:'sck_sbzt2',title:'上报状态',width:80,align:'center'},			
			{field:'sck_shzt',title:'审核状态',width:80,align:'center'},
			{field:'bzls',title:'补助历史',width:60,align:'center'},
	        {field:'gydw',title:'管养单位',width:160,align:'center'},
	        {field:'xzqhmc',title:'行政区划',width:120,align:'center'},
	        {field:'lxbm',title:'路线编号',width:120,align:'center'},
	        {field:'lxmc',title:'路线名称',width:120,align:'center'},
	        {field:'scqdzh',title:'起点桩号',width:140,align:'center'},
	        {field:'sczdzh',title:'止点桩号',width:140,align:'center'},
	        {field:'sczlc',title:'起止里程',width:140,align:'center'},
	        {field:'sczlc',title:'总里程',width:140,align:'center'},
	        {field:'scyhlc',title:'隐患里程',width:140,align:'center'},
	        {field:'gjxjnd',title:'改建/修建年度',width:140,align:'center'},
	        {field:'xmnf',title:'项目年份',width:140,align:'center'},
	        {field:'jsxz',title:'建设性质',width:140,align:'center'}
	    ]]    
	});  
	var sck_sbthcd;
 	if($.cookie("unit2")=='______36'){
 			sck_sbthcd=7;
 		}else  sck_sbthcd=$.cookie("unit2").length;
 	var data="sck_sbthcd="+sck_sbthcd+"&gydw="+gydwstr+"&xzqhdm="+xzqhstr+"&lxmc="+$('#lxmc').val()+
 	"&xmnf="+$("#xmnf").combobox("getValue")+"&sbzt="+$("#sbzt").combobox("getValue")+
 	"&lxjsdj="+$("#lxjsdj").combobox("getValue")+"&lxbm="+$("#lxbm").val()+"&bzls="+$("#bzls").combobox("getValue")+
 	"&bz="+$("#bz").combobox("getValue");
 	$.ajax({
	 type : "POST",
	 url : "/jxzhpt/xmsck/selSckAbgcCount.do",
	 dataType : 'json',
	 data : data,
	 success : function(msg){
		 $("#abgc1").html(msg.sck_sbthcd);
		 if(msg.sczlc!=null && msg.sczlc!=""){
			 $("#abgc2").html(msg.sczlc);
		 }else $("#abgc2").html("0");
		 if(msg.scyhlc!=null && msg.scyhlc!=""){
			 $("#abgc3").html(msg.scyhlc);
		 }else $("#abgc3").html("0");
	 },
});
}
function sckglZhfz(){
	var gydw=$("#gydw").combotree("getValues");
	if(gydw.length==0||gydw.length==1){
		gydwstr= $.cookie("unit2");
	}else{
		gydwstr= gydw.join(',');
	}
var xzqhdm=$("#xzqhmc").combotree("getValues");
	if(xzqhdm.length==0||xzqhdm.length==1){
		xzqhstr= $.cookie("dist2");
	}else{
		xzqhstr= xzqhdm.join(',');
	}
	$("#grid").datagrid({    
		 url:'/jxzhpt/xmsck/selectSckzhfz.do',
		 queryParams : {
			 	'sck_sbthcd':function(){
			 		if($.cookie("unit2")=='______36') return 7;
			 		else return $.cookie("unit2").length;
			 	},
			 	'gydw': gydwstr,
			 	'xzqhdm':xzqhstr,
			 	'lxmc' : $('#lxmc').val(),
			 	'xmnf':$("#xmnf").combobox("getValue"),
			 	'sbzt':$('#sbzt').combobox("getValue"),
			 	'lxjsdj':$("#lxjsdj").combobox("getValue"),
			 	'lxbm':$("#lxbm").val(),
			 	'bzls':$("#bzls").combobox("getValue"),
			 	'bz':$("#bz").combobox("getValue"),
			},
		    striped:true,
		    pagination:true,
		    rownumbers:true,
		    pageNumber:1,
		    pageSize:10,
		    height:$(window).height()-185,
			width:$(window).width()-15,
	    columns:[[    
			{field:'allSel',title:'全选',width:60,align:'center',checkbox:'true'},         
			{field:'cz',title:'操作',width:130,align:'center',formatter:function(value,row,index){
					return '<a href=javascript:locationXm("'+row.lxbm+'")  style="text-decoration:none;color:#3399CC; ">定位</a>  '+
					'<a href=javascript:ckSckzhfz("'+row.sckid+'") style="text-decoration:none;color:#3399CC; ">详细</a>  ';
			}},    
			{field:'sck_sbzt2',title:'上报状态',width:80,align:'center'},
			{field:'sck_shzt',title:'审核状态',width:80,align:'center'},
			{field:'bzls',title:'补助历史',width:60,align:'center'},
	        {field:'gydw',title:'管养单位',width:160,align:'center'},
	        {field:'xzqhmc',title:'行政区划',width:120,align:'center'},
	        {field:'lxbm',title:'路线编号',width:120,align:'center'},
	        {field:'lxmc',title:'路线名称',width:120,align:'center'},
	        {field:'scqdzh',title:'起点桩号',width:140,align:'center'},
	        {field:'sczdzh',title:'止点桩号',width:140,align:'center'},
	        {field:'sczlc',title:'起止里程',width:140,align:'center'},
	        {field:'sczlc',title:'总里程',width:140,align:'center'},
	        {field:'scyhlc',title:'隐患里程',width:140,align:'center'},
	        {field:'gjxjnd',title:'改建/修建年度',width:140,align:'center'},
	        {field:'xmnf',title:'项目年份',width:140,align:'center'},
	        {field:'jsxz',title:'建设性质',width:140,align:'center'}
	    ]]    
	});  
	var sck_sbthcd;
 	if($.cookie("unit2")=='______36'){
 			sck_sbthcd=7;
 		}else  sck_sbthcd=$.cookie("unit2").length;
 	var data="sck_sbthcd="+sck_sbthcd+"&gydw="+gydwstr+"&xzqhdm="+xzqhstr+"&lxmc="+$('#lxmc').val()+
 	"&xmnf="+$("#xmnf").combobox("getValue")+"&sbzt="+$("#sbzt").combobox("getValue")+
 	"&lxjsdj="+$("#lxjsdj").combobox("getValue")+"&lxbm="+$("#lxbm").val()+"&bzls="+$("#bzls").combobox("getValue")+
 	"&bz="+$("#bz").combobox("getValue");
 	$.ajax({
	 type : "POST",
	 url : "/jxzhpt/xmsck/selSckZhfzCount.do",
	 dataType : 'json',
	 data : data,
	 success : function(msg){
		 $("#abgc1").html(msg.sck_sbthcd);
		 if(msg.sczlc!=null && msg.sczlc!=""){
			 $("#abgc2").html(msg.sczlc);
		 }else $("#abgc2").html("0");
		 if(msg.scyhlc!=null && msg.scyhlc!=""){
			 $("#abgc3").html(msg.scyhlc);
		 }else $("#abgc3").html("0");
	 },
});
}