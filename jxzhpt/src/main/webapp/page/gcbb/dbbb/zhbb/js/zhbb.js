
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
	    height:325,

	    columns:[[
	        {field:'xzqhdm',title:'行政区划代码',width:100,align:'center'},
	        {field:'xzqhmc',title:'行政区划名称',width:100,align:'center'},
	        {field:'lxbm',title:'路线编码',width:100,align:'center'},
	        {field:'lxmc',title:'路线名称',width:100,align:'center'},
	        {field:'qlbm',title:'起点桩号',width:100,align:'center'},
	        {field:'qlmc',title:'止点桩号',width:100,align:'center'},
	        {field:'qlzxzh',title:'总里程',width:100,align:'center'},
	        {field:'xjnd',title:'隐患里程',width:100,align:'center'},
	        {field:'qlqc',title:'修建/改建年度',width:100,align:'center'},
	        {field:'qlqk',title:'隐患内容',width:100,align:'center'},
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
	    height:325,

	    columns:[[
			{field:'xzqhdm',title:'行政区划代码',width:100,align:'center'},
			{field:'xzqhmc',title:'行政区划名称',width:100,align:'center'},
			{field:'lxbm',title:'路线编码',width:100,align:'center'},
			{field:'lxmc',title:'路线名称',width:100,align:'center'},
			{field:'qlbm',title:'起点桩号',width:100,align:'center'},
			{field:'qlmc',title:'止点桩号',width:100,align:'center'},
			{field:'qlzxzh',title:'总里程',width:100,align:'center'},
			{field:'xjnd',title:'隐患里程',width:100,align:'center'},
	        {field:'sjdw',title:'设计单位',width:100,align:'center'},
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
	    height:325,

	    columns:[[
	         {field:'xzqhdm',title:'行政区划代码',width:100,align:'center'},
	        {field:'xzqhmc',title:'行政区划名称',width:100,align:'center'},
	        {field:'lxbm',title:'路线编码',width:100,align:'center'},
	        {field:'lxmc',title:'路线名称',width:100,align:'center'},
	        {field:'qlbm',title:'起点桩号',width:100,align:'center'},
	        {field:'qlmc',title:'止点桩号',width:100,align:'center'},
	        {field:'qlzxzh',title:'总里程',width:100,align:'center'},
	        {field:'xjnd',title:'隐患里程',width:100,align:'center'},
	        {field:'qlqc',title:'修建/改建年度',width:100,align:'center'},
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