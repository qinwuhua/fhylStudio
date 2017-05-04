var gydw;
function closes(str){
	 parent.$('#'+str).window('destroy');
}
function showAlljc(){
	$('#datagrid').datagrid({    
	    url:'/jxzhpt/dbbb/selectWqjc.do',
	    queryParams : {
		 	'sbthcd':function(){
		 		if($.cookie("unit2")=='______36') return 7;
		 		else return $.cookie("unit2").length;
		 	},
		 	gydw: function(){
		 		gydw=$("#gydw").combotree("getValues");
				if(gydw.length==0){
					if($.cookie("truename")=='省局综规处')
						//if($.cookie("unit2")=='_____36' || $.cookie("unit2")=='21101360000' )
							gydwstr='2____36';
						else if($.cookie("truename")=='省局县乡处')
							gydwstr='1____36';
					else gydwstr= $.cookie("unit2");
				}else if(gydw.length==1){
					if(gydw[0].substr(gydw[0].length-2,gydw[0].length)=="00") gydw[0]=gydw[0].substr(0,gydw[0].length-2);
		 		if(gydw[0].substr(gydw[0].length-2,gydw[0].length)=="00") gydw[0]=gydw[0].substr(0,gydw[0].length-2);
					gydwstr=gydw[0] ;
				}else{
					gydwstr= gydw.join(',');
				}
	    		return gydwstr;
	    	},
		 	'xmnf':$('#xmnf').combobox('getValue')
		},
	    striped:true,
	    pagination:true,
	    rownumbers:true,
	    pageNumber:1,
	    pageSize:10,
	    height:$(window).height()-150,
		width:$(window).width()-25,

	    columns:[[
	        {field:'gydw',title:'管养单位',width:100,align:'center'},
	        {field:'xzqhdm',title:'行政区划代码',width:100,align:'center'},
	        {field:'xzqhmc',title:'行政区划名称',width:100,align:'center'},
	        {field:'xlxbm',title:'新路线编码',width:100,align:'center'},
	        {field:'xqlbm',title:'新桥梁编码',width:100,align:'center'},
	        {field:'xzxzh',title:'新中心桩号',width:100,align:'center'},
	        {field:'ptx',title:'经度',width:100,align:'center'},
	        {field:'pty',title:'纬度',width:100,align:'center'},
	        {field:'lxbm',title:'路线编码',width:100,align:'center'},
	        {field:'lxmc',title:'路线名称',width:100,align:'center'},
	        {field:'qlbh',title:'桥梁编码',width:100,align:'center'},
	        {field:'qlmc',title:'桥梁名称',width:100,align:'center'},
	        {field:'qlzxzh',title:'桥梁中心桩号',width:100,align:'center'},
	        {field:'xjgjnd',title:'修建/改建年度',width:100,align:'center'},
	        {field:'qlqc',title:'桥梁全长',width:100,align:'center'},
	        {field:'qlkd',title:'桥梁全宽',width:100,align:'center'},
	        {field:'kjzc',title:'跨径总长',width:100,align:'center'},
	        {field:'dkzdkj',title:'单孔最大跨径',width:100,align:'center'},
	        {field:'akjfl',title:'按跨径分类',width:100,align:'center'},
	        {field:'sbjgxs',title:'上部结构形式',width:100,align:'center'},
	        {field:'pddj',title:'评定等级',width:100,align:'center'},
	        {field:'bhnr',title:'病害内容',width:200,align:'center'},
	        {field:'bz',title:'备注',width:100,align:'center'},
	    ]]    
	}); 
}
function exportExcel_wqjc(){
	var sbthcd;
 		if($.cookie("unit2")=='______36') sbthcd=7;
 		else  sbthcd=$.cookie("unit2").length;
 		gydw=$("#gydw").combotree("getValues");
		if(gydw.length==0){
			if($.cookie("truename")=='省局综规处')
				//if($.cookie("unit2")=='_____36' || $.cookie("unit2")=='21101360000' )
					gydwstr='2____36';
				else if($.cookie("truename")=='省局县乡处')
					gydwstr='1____36';
			else gydwstr= $.cookie("unit2");
		}else if(gydw.length==1){
			if(gydw[0].substr(gydw[0].length-2,gydw[0].length)=="00") gydw[0]=gydw[0].substr(0,gydw[0].length-2);
 		if(gydw[0].substr(gydw[0].length-2,gydw[0].length)=="00") gydw[0]=gydw[0].substr(0,gydw[0].length-2);
			gydwstr=gydw[0] ;
		}else{
			gydwstr= gydw.join(',');
		}
	var param='sbthcd='+sbthcd+
 	'&xmnf='+$('#xmnf').combobox('getValue');
	$.post('/jxzhpt/gcbb/exportbbsj_set.do',{gydw:gydwstr},function(){
		window.location.href='/jxzhpt/dbbb/exportExcel_wqjc.do?'+param;
	 });
}
function showAllsc(){
	$('#datagrid').datagrid({    
		url:'/jxzhpt/dbbb/selectWqsc.do',
		queryParams : {
		 	'sbthcd':function(){
		 		if($.cookie("unit2")=='______36') return 7;
		 		else return $.cookie("unit2").length;
		 	},
		 	gydw: function(){
		 		gydw=$("#gydw").combotree("getValues");
				if(gydw.length==0){
					if($.cookie("truename")=='省局综规处')
						//if($.cookie("unit2")=='_____36' || $.cookie("unit2")=='21101360000' )
							gydwstr='2____36';
						else if($.cookie("truename")=='省局县乡处')
							gydwstr='1____36';
					else gydwstr= $.cookie("unit2");
				}else if(gydw.length==1){
					if(gydw[0].substr(gydw[0].length-2,gydw[0].length)=="00") gydw[0]=gydw[0].substr(0,gydw[0].length-2);
		 		if(gydw[0].substr(gydw[0].length-2,gydw[0].length)=="00") gydw[0]=gydw[0].substr(0,gydw[0].length-2);
					gydwstr=gydw[0] ;
				}else{
					gydwstr= gydw.join(',');
				}
	    		return gydwstr;
	    	},
		 	'xmnf':$('#xmnf').combobox('getValue')
		},
	    striped:true,
	    pagination:true,
	    rownumbers:true,
	    pageNumber:1,
	    pageSize:10,
	    height:$(window).height()-150,
		width:$(window).width()-25,
	    columns:[[
	        {field:'qlbh',title:'桥梁编码',width:100,align:'center'},
	        {field:'qlmc',title:'桥梁名称',width:100,align:'center'},
	        {field:'qlzxzh',title:'桥梁中心桩号',width:100,align:'center'},
	        {field:'qlqc',title:'桥梁全长',width:100,align:'center'},
	        {field:'qlkd',title:'桥梁全宽',width:100,align:'center'},
	        {field:'fapgdw',title:'方案评估单位',width:100,align:'center'},
	        {field:'fascdw',title:'方案审查单位',width:100,align:'center'},
	        {field:'faspsj',title:'方案审批时间',width:100,align:'center'},
	        {field:'spwh',title:'审批文号',width:100,align:'center'},
	        {field:'tzgs',title:'投资估算（万元）',width:150,align:'center'},
	        {field:'jsxz',title:'建设性质',width:100,align:'center'},
	        {field:'jsnr',title:'建设内容',width:200,align:'center'},
	        {field:'bz',title:'备注',width:100,align:'center'}
	    ]]    
	}); 
}
function exportExcel_wqsc(){
	var sbthcd;
 		if($.cookie("unit2")=='______36') sbthcd=7;
 		else  sbthcd=$.cookie("unit2").length;
 		gydw=$("#gydw").combotree("getValues");
		if(gydw.length==0){
			if($.cookie("truename")=='省局综规处')
				//if($.cookie("unit2")=='_____36' || $.cookie("unit2")=='21101360000' )
					gydwstr='2____36';
				else if($.cookie("truename")=='省局县乡处')
					gydwstr='1____36';
			else gydwstr= $.cookie("unit2");
		}else if(gydw.length==1){
			if(gydw[0].substr(gydw[0].length-2,gydw[0].length)=="00") gydw[0]=gydw[0].substr(0,gydw[0].length-2);
 		if(gydw[0].substr(gydw[0].length-2,gydw[0].length)=="00") gydw[0]=gydw[0].substr(0,gydw[0].length-2);
			gydwstr=gydw[0] ;
		}else{
			gydwstr= gydw.join(',');
		}
	var param='sbthcd='+sbthcd+
 	'&xmnf='+$('#xmnf').combobox('getValue');
	$.post('/jxzhpt/gcbb/exportbbsj_set.do',{gydw:gydwstr},function(){
		window.location.href='/jxzhpt/dbbb/exportExcel_wqsc.do?'+param;
	 });
}
function showAlljh(){
	$('#datagrid').datagrid({    
		url:'/jxzhpt/dbbb/selectWqjh.do',
		queryParams : {
		 	'sbthcd':function(){
		 		if($.cookie("unit2")=='______36') return 7;
		 		else return $.cookie("unit2").length;
		 	},
		 	gydw: function(){
		 		gydw=$("#gydw").combotree("getValues");
				if(gydw.length==0){
					if($.cookie("truename")=='省局综规处')
						//if($.cookie("unit2")=='_____36' || $.cookie("unit2")=='21101360000' )
							gydwstr='2____36';
						else if($.cookie("truename")=='省局县乡处')
							gydwstr='1____36';
					else gydwstr= $.cookie("unit2");
				}else if(gydw.length==1){
					if(gydw[0].substr(gydw[0].length-2,gydw[0].length)=="00") gydw[0]=gydw[0].substr(0,gydw[0].length-2);
		 		if(gydw[0].substr(gydw[0].length-2,gydw[0].length)=="00") gydw[0]=gydw[0].substr(0,gydw[0].length-2);
					gydwstr=gydw[0] ;
				}else{
					gydwstr= gydw.join(',');
				}
	    		return gydwstr;
	    	},
		 	'xmnf':$('#xmnf').combobox('getValue')
		},
	    striped:true,
	    pagination:true,
	    rownumbers:true,
	    pageNumber:1,
	    pageSize:10,
	    height:$(window).height()-150,
		width:$(window).width()-25,

	    columns:[[
	        {field:'gydw',title:'管养单位',width:100,align:'center'},
	        {field:'xzqhdm',title:'行政区划代码',width:100,align:'center'},
	        {field:'xzqhmc',title:'行政区划名称',width:100,align:'center'},
	        {field:'lxbm',title:'路线编码',width:100,align:'center'},
	        {field:'lxmc',title:'路线名称',width:100,align:'center'},
	        {field:'qlbh',title:'桥梁编码',width:100,align:'center'},
	        {field:'qlmc',title:'桥梁名称',width:100,align:'center'},
	        {field:'qlzxzh',title:'桥梁中心桩号',width:100,align:'center'},
	        {field:'xjgjnd',title:'修建/改建年度',width:100,align:'center'},
	        {field:'sjdw',title:'设计单位',width:100,align:'center'},
	        {field:'sjpfdw',title:'设计批复单位',width:100,align:'center'},
	        {field:'pfwh',title:'批复文号',width:100,align:'center'},
	        {field:'pfztz',title:'批复总投资（万元）',width:150,align:'center'},
	        {field:'jhsybzje',title:'计划使用部补助金额（万元）',width:170,align:'center'},
	        {field:'jhsydfzcje',title:'计划使用地方自筹资金（万元）',width:170,align:'center'},
	        {field:'sfsqablbz',title:'是否申请按比例补助',width:150,align:'center'},
	        {field:'ablbzsqwh',title:'按比例补助申请文号',width:150,align:'center'}
	    ]]    
	}); 
}
function exportExcel_wqjh(){
	var sbthcd;
 		if($.cookie("unit2")=='______36') sbthcd=7;
 		else  sbthcd=$.cookie("unit2").length;
 		gydw=$("#gydw").combotree("getValues");
		if(gydw.length==0){
			if($.cookie("truename")=='省局综规处')
				//if($.cookie("unit2")=='_____36' || $.cookie("unit2")=='21101360000' )
					gydwstr='2____36';
				else if($.cookie("truename")=='省局县乡处')
					gydwstr='1____36';
			else gydwstr= $.cookie("unit2");
		}else if(gydw.length==1){
			if(gydw[0].substr(gydw[0].length-2,gydw[0].length)=="00") gydw[0]=gydw[0].substr(0,gydw[0].length-2);
 		if(gydw[0].substr(gydw[0].length-2,gydw[0].length)=="00") gydw[0]=gydw[0].substr(0,gydw[0].length-2);
			gydwstr=gydw[0] ;
		}else{
			gydwstr= gydw.join(',');
		}
	var param='sbthcd='+sbthcd+
 	'&xmnf='+$('#xmnf').combobox('getValue');
	$.post('/jxzhpt/gcbb/exportbbsj_set.do',{gydw:gydwstr},function(){
		window.location.href='/jxzhpt/dbbb/exportExcel_wqjh.do?'+param;
	 });
}
