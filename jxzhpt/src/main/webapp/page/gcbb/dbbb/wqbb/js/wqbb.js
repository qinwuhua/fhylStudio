
function closes(str){
	 parent.$('#'+str).window('destroy');
}
function showAlljc(){
	$('#datagrid').datagrid({    
	    url:'js/aqgl.json',
	    striped:true,
	    pagination:true,
	    rownumbers:true,
	    pageNumber:1,
	    pageSize:10,
	    height:440,

	    columns:[[
	        {field:'gydw',title:'管养单位',width:100,align:'center'},
	        {field:'xzqhdm',title:'行政区划代码',width:100,align:'center'},
	        {field:'xzqhmc',title:'行政区划名称',width:100,align:'center'},
	        {field:'lxbm',title:'路线编码',width:100,align:'center'},
	        {field:'lxmc',title:'路线名称',width:100,align:'center'},
	        {field:'qlbm',title:'桥梁编码',width:100,align:'center'},
	        {field:'qlmc',title:'桥梁名称',width:100,align:'center'},
	        {field:'qlzxzh',title:'桥梁中心桩号',width:100,align:'center'},
	        {field:'xjnd',title:'修建/改建年度',width:100,align:'center'},
	        {field:'qlqc',title:'桥梁全长',width:100,align:'center'},
	        {field:'qlqk',title:'桥梁全宽',width:100,align:'center'},
	        {field:'kjzc',title:'跨径总长',width:100,align:'center'},
	        {field:'dkzdkj',title:'单孔最大跨径',width:100,align:'center'},
	        {field:'kjfl',title:'按跨径分类',width:100,align:'center'},
	        {field:'sbjgxs',title:'上部结构形式',width:100,align:'center'},
	        {field:'pddj',title:'评定等级',width:100,align:'center'},
	        {field:'bhnr',title:'病害内容',width:200,align:'center'},
	        {field:'bz',title:'备注',width:100,align:'center'},
	        
	    ]]    
	}); 
}
function showAlljh(){
	$('#datagrid').datagrid({    
	    url:'js/aqgl.json',
	    striped:true,
	    pagination:true,
	    rownumbers:true,
	    pageNumber:1,
	    pageSize:10,
	    height:440,

	    columns:[[
	        {field:'gydw',title:'管养单位',width:100,align:'center'},
	        {field:'xzqhdm',title:'行政区划代码',width:100,align:'center'},
	        {field:'xzqhmc',title:'行政区划名称',width:100,align:'center'},
	        {field:'lxbm',title:'路线编码',width:100,align:'center'},
	        {field:'lxmc',title:'路线名称',width:100,align:'center'},
	        {field:'qlbm',title:'桥梁编码',width:100,align:'center'},
	        {field:'qlmc',title:'桥梁名称',width:100,align:'center'},
	        {field:'qlzxzh',title:'桥梁中心桩号',width:100,align:'center'},
	        {field:'xjnd',title:'设计单位',width:100,align:'center'},
	        {field:'qlqc',title:'设计批复单位',width:100,align:'center'},
	        {field:'qlqk',title:'批复文号',width:100,align:'center'},
	        {field:'kjzc',title:'批复总投资（万元）',width:150,align:'center'},
	        {field:'dkzdkj',title:'计划使用部补助金额（万元）',width:170,align:'center'},
	        {field:'kjfl',title:'计划使用地方自筹资金（万元）',width:170,align:'center'},
	        {field:'sbjgxs',title:'是否申请按比例补助',width:150,align:'center'},
	        {field:'pddj',title:'按比例补助申请文号',width:150,align:'center'},
	        {field:'jsxz',title:'建设性质',width:100,align:'center'},
	        {field:'bhnr',title:'建设内容',width:200,align:'center'},
	        {field:'bz',title:'备注',width:100,align:'center'},
	        
	    ]]    
	}); 
}
function showAllsc(){
	$('#datagrid').datagrid({    
	    url:'js/aqgl.json',
	    striped:true,
	    pagination:true,
	    rownumbers:true,
	    pageNumber:1,
	    pageSize:10,
	    height:440,

	    columns:[[
	        {field:'qlbm',title:'桥梁编码',width:100,align:'center'},
	        {field:'qlmc',title:'桥梁名称',width:100,align:'center'},
	        {field:'qlzxzh',title:'桥梁中心桩号',width:100,align:'center'},
	        {field:'qlqc',title:'桥梁全长',width:100,align:'center'},
	        {field:'qlqk',title:'桥梁全宽',width:100,align:'center'},
	        {field:'kjzc',title:'方案评估单位',width:100,align:'center'},
	        {field:'dkzdkj',title:'方案审查单位',width:100,align:'center'},
	        {field:'kjfl',title:'方案审批时间',width:100,align:'center'},
	        {field:'sbjgxs',title:'审批文号',width:100,align:'center'},
	        {field:'pddj',title:'投资估算（万元）',width:150,align:'center'},
	        {field:'jsxz',title:'建设性质',width:100,align:'center'},
	        {field:'jsnr',title:'建设内容',width:200,align:'center'},
	        {field:'bz',title:'备注',width:100,align:'center'},
	        
	    ]]    
	}); 
}