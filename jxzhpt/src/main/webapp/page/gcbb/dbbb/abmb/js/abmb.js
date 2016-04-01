var gydw;
function closes(str){
	 parent.$('#'+str).window('destroy');
}
function showAlljz(){
	$('#datagrid').datagrid({    
		url:'/jxzhpt/dbbb/selectAbjz.do',
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
		 	'xmnf':$("#xmnf").combobox('getValues').join(","),
		},
	    striped:true,
	    pagination:true,
	    rownumbers:true,
	    pageNumber:1,
	    pageSize:10,
	    height:$(window).height()-140,
		width:$(window).width()-25,
	    columns:[[
	        {field:'xzqhdm',title:'行政区划代码',width:100,align:'center'},
	        {field:'xzqhmc',title:'行政区划名称',width:100,align:'center'},
	        {field:'lxbm',title:'路线编码',width:100,align:'center'},
	        {field:'lxmc',title:'路线名称',width:100,align:'center'},
	        {field:'scqdzh',title:'起点桩号',width:100,align:'center'},
	        {field:'sczdzh',title:'止点桩号',width:100,align:'center'},
	        {field:'sbsj',title:'上报时间',width:100,align:'center'},
	        {field:'yjwgsj',title:'预计竣工时间',width:100,align:'center'},
	        {field:'wc_btz',title:'完成中央投资(万元)',width:170,align:'center'},
	        {field:'wc_qttz',title:'完成地方自筹(万元)',width:170,align:'center'},
	        {field:'sjwgsj',title:'工程竣工时间',width:100,align:'center'},
	        {field:'bz',title:'备注',width:100,align:'center'},
	    ]]    
	}); 
}
function exportExcel_abjz(){
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
	 	'&xmnf='+$('#xmnf').combobox('getValues').join(",");
	$.post('/jxzhpt/gcbb/exportbbsj_set.do',{gydw:gydwstr},function(){
		window.location.href='/jxzhpt/dbbb/exportExcel_abjz.do?'+param;
	 });
}

function showAllkg(){
	$('#datagrid').datagrid({    
		url:'/jxzhpt/dbbb/selectAbkg.do',
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
		 	'xmnf':$("#xmnf").combobox('getValues').join(","),
		},
	    striped:true,
	    pagination:true,
	    rownumbers:true,
	    pageNumber:1,
	    pageSize:10,
	    height:$(window).height()-140,
		width:$(window).width()-25,

	    columns:[[
	        {field:'gydw',title:'管养单位',width:150,align:'center'},
			{field:'xzqhdm',title:'行政区划代码',width:100,align:'center'},
			{field:'xzqhmc',title:'行政区划名称',width:100,align:'center'},
			{field:'lxbm',title:'路线编码',width:100,align:'center'},
			{field:'lxmc',title:'路线名称',width:100,align:'center'},
			{field:'scqdzh',title:'起点桩号',width:100,align:'center'},
			{field:'sczdzh',title:'止点桩号',width:100,align:'center'},
			{field:'sczlc',title:'起止里程',width:100,align:'center'},
			{field:'scyhlc',title:'隐患里程',width:100,align:'center'},
	        {field:'xdsj',title:'计划下达时间',width:100,align:'center'},
	        {field:'jhkgsj',title:'计划开工时间',width:100,align:'center'},
	        {field:'jhwgsj',title:'计划完工时间',width:100,align:'center'},
	        {field:'sjkgsj',title:'实际开工时间',width:100,align:'center'},
	        {field:'sgdw',title:'施工单位',width:100,align:'center'},
	        {field:'jldw',title:'监理单位',width:100,align:'center'},
	        {field:'htje',title:'合同金额',width:100,align:'center'}
	    ]]    
	}); 
}
function exportExcel_abkg(){
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
	 	'&xmnf='+$('#xmnf').combobox('getValues').join(",");
	$.post('/jxzhpt/gcbb/exportbbsj_set.do',{gydw:gydwstr},function(){
		window.location.href='/jxzhpt/dbbb/exportExcel_abkg.do?'+param;
	 });
}

function showAllkn(){
	$('#datagrid').datagrid({    
	    url:'js/aqgl.json',
	    striped:true,
	    pagination:true,
	    rownumbers:true,
	    pageNumber:1,
	    pageSize:10,
	    height:325,

	    columns:[[
	        {field:'lxbm',title:'路线编码',width:100,align:'center'},
	        {field:'lxmc',title:'路线名称',width:100,align:'center'},
	        {field:'qlbm',title:'起点桩号',width:100,align:'center'},
	        {field:'qlmc',title:'止点桩号',width:100,align:'center'},
	        {field:'sbsj',title:'完成中央资金（万元）',width:170,align:'center'},
	        {field:'yjjgsj',title:'完成中央资金比例（%）',width:170,align:'center'},
	        {field:'wczytz',title:'完成地方自筹资金（万元）',width:170,align:'center'},
	        {field:'wcdfzc',title:'完成地方自筹（万元）',width:170,align:'center'},
	        {field:'gcjgsj',title:'完成地方自筹资金比例（%）',width:170,align:'center'},
	        {field:'czyhgmbl',title:'处置隐患规模比例（%）',width:170,align:'center'},
	        {field:'yjsj',title:'工程预计完成日期',width:120,align:'center'},
	        {field:'bz',title:'未完成原因',width:100,align:'center'},
	    ]]    
	}); 
}
function showAllwc(){
	$('#datagrid').datagrid({    
	    url:'js/aqgl.json',
	    striped:true,
	    pagination:true,
	    rownumbers:true,
	    pageNumber:1,
	    pageSize:10,
	    height:325,

	    columns:[[
	        {field:'lxbm',title:'路线编码',width:100,align:'center'},
	        {field:'lxmc',title:'路线名称',width:100,align:'center'},
	        {field:'qlbm',title:'起点桩号',width:100,align:'center'},
	        {field:'qlmc',title:'止点桩号',width:100,align:'center'},
	        {field:'qlzxzh',title:'完成中央资金金额（万元）',width:170,align:'center'},
	        {field:'sbsj',title:'完成地方自筹资金（万元）',width:170,align:'center'},
	        {field:'yjjgsj',title:'处置隐患规模比例（%）',width:170,align:'center'},
	        {field:'wczytz',title:'工程竣工时间',width:165,align:'center'},
	    ]]    
	}); 
}