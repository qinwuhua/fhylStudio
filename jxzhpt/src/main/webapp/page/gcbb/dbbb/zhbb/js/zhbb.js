
function closes(str){
	 parent.$('#'+str).window('destroy');
}
function showAlljc(){
	$('#datagrid').datagrid({    
		url:'/jxzhpt/dbbb/selectZhjc.do',
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
			         {field:'gydw',title:'管养单位',width:150,align:'center'},
			        {field:'xzqhdm',title:'行政区划代码',width:110,align:'center'},
			        {field:'xzqhmc',title:'行政区划名称',width:110,align:'center'},
			        {field:'lxbm',title:'路线编码',width:110,align:'center'},
			        {field:'lxmc',title:'路线名称',width:110,align:'center'},
			        {field:'qdzh',title:'起点桩号',width:110,align:'center'},
			        {field:'zdzh',title:'止点桩号',width:110,align:'center'},
			        {field:'qzlc',title:'总里程',width:110,align:'center'},
			        {field:'yhlc',title:'隐患里程',width:110,align:'center'},
			        {field:'gjxjnd',title:'修建/改建年度',width:110,align:'center'},
			        {field:'yhnr',title:'隐患内容',width:110,align:'center'},
			        {field:'bz',title:'备注',width:110,align:'center'},
			    ]]    
	}); 
}
function exportExcel_zhjc(){
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
		window.location.href='/jxzhpt/dbbb/exportExcel_zhjc.do?'+param;
	 });
}

function showAllsc(){
	$('#datagrid').datagrid({    
		url:'/jxzhpt/dbbb/selectZhsc.do',
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
	              {field:'gydw',title:'管养单位',width:150,align:'center'},
	  	        {field:'xzqhdm',title:'行政区划代码',width:110,align:'center'},
	  	        {field:'xzqhmc',title:'行政区划名称',width:110,align:'center'},
	  	        {field:'lxbm',title:'路线编码',width:110,align:'center'},
	  	        {field:'lxmc',title:'路线名称',width:110,align:'center'},
	  	        {field:'scqdzh',title:'起点桩号',width:110,align:'center'},
	  	        {field:'sczdzh',title:'止点桩号',width:110,align:'center'},
	  	        {field:'sczlc',title:'总里程',width:110,align:'center'},
	  	        {field:'scyhlc',title:'隐患里程',width:110,align:'center'},
	  	        {field:'gjxjnd',title:'修建/改建年度',width:110,align:'center'},
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
function exportExcel_zhsc(){
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
		window.location.href='/jxzhpt/dbbb/exportExcel_zhsc.do?'+param;
	 });
}

function showAlljh(){
	$('#datagrid').datagrid({    
		url:'/jxzhpt/dbbb/selectZhjh.do',
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
	        {field:'gydw',title:'管养单位',width:110,align:'center'},
			{field:'xzqhdm',title:'行政区划代码',width:110,align:'center'},
			{field:'xzqhmc',title:'行政区划名称',width:110,align:'center'},
			{field:'lxbm',title:'路线编码',width:110,align:'center'},
			{field:'lxmc',title:'路线名称',width:110,align:'center'},
			{field:'scqdzh',title:'起点桩号',width:110,align:'center'},
			{field:'sczdzh',title:'止点桩号',width:110,align:'center'},
			{field:'sczlc',title:'总里程',width:110,align:'center'},
			{field:'scyhlc',title:'隐患里程',width:110,align:'center'},
			{field:'gjxjnd',title:'改建/修建年度',width:110,align:'center'},
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
function exportExcel_zhjh(){
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
		window.location.href='/jxzhpt/dbbb/exportExcel_zhjh.do?'+param;
	 });
}