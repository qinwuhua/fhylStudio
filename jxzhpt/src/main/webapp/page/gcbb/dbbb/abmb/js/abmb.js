var gydw;
function closes(str){
	 parent.$('#'+str).window('destroy');
}
function showAlljz(){
	$('#datagrid').datagrid({    
	    url:'js/aqgl.json',
	    striped:true,
	    pagination:true,
	    rownumbers:true,
	    pageNumber:1,
	    pageSize:10,
	    height:325,

	    columns:[[
	        {field:'xzqhdm',title:'行政区划代码',width:100,align:'center'},
	        {field:'xzqhmc',title:'行政区划名称',width:100,align:'center'},
	        {field:'lxbm',title:'路线编码',width:100,align:'center'},
	        {field:'lxmc',title:'路线名称',width:100,align:'center'},
	        {field:'qlbm',title:'起点桩号',width:100,align:'center'},
	        {field:'qlmc',title:'止点桩号',width:100,align:'center'},
	        {field:'sbsj',title:'上报时间',width:100,align:'center'},
	        {field:'yjjgsj',title:'预计竣工时间',width:100,align:'center'},
	        {field:'wczytz',title:'完成中央投资(万元)',width:170,align:'center'},
	        {field:'wcdfzc',title:'完成地方自筹(万元)',width:170,align:'center'},
	        {field:'gcjgsj',title:'工程竣工时间',width:100,align:'center'},
	        {field:'bz',title:'备注',width:100,align:'center'},
	    ]]    
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
		 		gydw=$('#gydw').combobox("getValue");
		 		if(gydw=='36') gydw='';
	    		if(gydw.substr(gydw.length-2,2)=='00'){
	    			gydw=gydw.substr(0,gydw.length-2);
	    			if(gydw.substr(gydw.length-2,2)=='00'){
	    				gydw=gydw.substr(0,gydw.length-2);
	    			}
	    		}
	    		return gydw;
	    	},
		 	'xmnf':$("#xmnf").val(),
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
 		gydw=$('#gydw').combobox("getValue");
 		if(gydw=='36') gydw='';
		if(gydw.substr(gydw.length-2,2)=='00'){
			gydw=gydw.substr(0,gydw.length-2);
			if(gydw.substr(gydw.length-2,2)=='00'){
				gydw=gydw.substr(0,gydw.length-2);
			}
		}
	var param='sbthcd='+sbthcd+'&gydw='+gydw+
 	'&xmnf='+$('#xmnf').val();
	window.location.href="/jxzhpt/dbbb/exportExcel_abkg.do?"+param;
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