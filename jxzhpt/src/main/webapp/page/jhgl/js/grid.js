//工程路面升级
function gclmsjxm(){
	$('#grdab').datagrid({    
	    url:'../js/gclmsjxm.json',
	    striped:true,
	    pagination:true,
	    rownumbers:true,
	    pageNumber:1,
	    pageSize:10,
	    height:325,
	    columns:[[
	        {field:'c',title:'操作',width:150,align:'center',formatter:function(value,row,index){
	        	return '定位    '+'详细    '+'编辑    '+'删除';
	        }},
	        {field:'c4',title:'计划状态',width:80,align:'center',formatter:function(value,row,index){
	        	return '计划状态';
	        }},
	        {field:'c5',title:'资金追加',width:80,align:'center',formatter:function(value,row,index){
	        	return '资金追加';
	        }},
	        {field:'sbnf',title:'上报年份',width:80,align:'center'},
	        {field:'jhkgsj',title:'计划开工时间',width:100,align:'center'},
	        {field:'jhwgsj',title:'计划完工时间',width:100,align:'center'},
	        {field:'gydw',title:'管养单位',width:150,align:'center'},
	        {field:'xzqhmc',title:'行政区划名称',width:100,align:'center'},
	        {field:'lxbm',title:'路线编码',width:80,align:'center'},
	        {field:'lxmc',title:'路线名称',width:80,align:'center'},
	        {field:'qdzh',title:'起点桩号',width:60,align:'center'},
	        {field:'zdzh',title:'止点桩号',width:60,align:'center'},
	        {field:'xmlc',title:'项目里程',width:60,align:'center'},
	        {field:'pfztz',title:'批复总投资',width:80,align:'center'}
	    ]]    
	}); 
}
//工程路面改建
function gclmgjxm(){
	$('#grid').datagrid({    
	    url:'../js/gclmgjxm.json',
	    pagination:true,
	    rownumbers:true,
	    pageNumber:1,
	    pageSize:10,
	    height:325,
	    columns:[[
	        {field:'c',title:'操作',width:150,align:'center',formatter:function(value,row,index){
	        	return '定位    '+'详细    '+'编辑    '+'删除';
	        }},
	        {field:'c4',title:'计划状态',width:80,align:'center',formatter:function(value,row,index){
	        	return '计划状态';
	        }},
	        {field:'c5',title:'资金追加',width:80,align:'center',formatter:function(value,row,index){
	        	return '资金追加';
	        }},
	        {field:'sbnf',title:'上报年份',width:80,align:'center'},
	        {field:'jhkgsj',title:'计划开工时间',width:100,align:'center'},
	        {field:'jhwgsj',title:'计划完工时间',width:100,align:'center'},
	        {field:'gydw',title:'管养单位',width:150,align:'center'},
	        {field:'xzqhmc',title:'行政区划名称',width:100,align:'center'},
	        {field:'lxbm',title:'路线编码',width:80,align:'center'},
	        {field:'lxmc',title:'路线名称',width:80,align:'center'},
	        {field:'qdzh',title:'起点桩号',width:60,align:'center'},
	        {field:'zdzh',title:'止点桩号',width:60,align:'center'},
	        {field:'yhlc',title:'隐患里程',width:60,align:'center'},
	        {field:'pfztz',title:'批复总投资',width:80,align:'center'}
	    ]]    
	});
}
//养护大中修
function yhdzxxm(){
	$('#grid').datagrid({    
	    url:'',
	    pagination:true,
	    rownumbers:true,
	    pageNumber:1,
	    pageSize:10,
	    height:325,
	    columns:[[
	        {field:'c',title:'操作',width:75,align:'center',formatter:function(value,row,index){
	        	return '定位    '+'详细 ';
	        }},
	        {field:'lxbm',title:'路线编码',width:80,align:'center'},
	        {field:'lxmc',title:'路线名称',width:80,align:'center'},
	        {field:'gydw',title:'管养单位',width:150,align:'center'},
	        {field:'xzqhmc',title:'行政区划名称',width:100,align:'center'},
	        {field:'qdzh',title:'起点桩号',width:60,align:'center'},
	        {field:'zdzh',title:'止点桩号',width:60,align:'center'},
	        {field:'lc',title:'里程',width:60,align:'center'},
	        {field:'hdlc',title:'核对里程',width:80,align:'center'},
	        {field:'jsdj',title:'技术等级',width:80,align:'center'},
	        {field:'ylmkd',title:'原路面宽度',width:80,align:'center'},
	        {field:'ylmlx',title:'原路面类型',width:80,align:'center'},
	        {field:'gcfl',title:'工程分类',width:80,align:'center'},
	        {field:'ztz',title:'总投资',width:80,align:'center'},
	        {field:'zbzzj',title:'总补助资金',width:100,align:'center'}
	    ]]    
	});
}
//水毁项目
function shxm(){
	$('#grid').datagrid({    
	    url:'../js/gclmgjxm.json',
	    pagination:true,
	    rownumbers:true,
	    pageNumber:1,
	    pageSize:10,
	    height:325,
	    columns:[[
	        {field:'c',title:'操作',width:150,align:'center',formatter:function(value,row,index){
	        	return '定位    '+'详细    '+'编辑    '+'删除';
	        }},
	        {field:'c4',title:'计划状态',width:80,align:'center',formatter:function(value,row,index){
	        	return '计划状态';
	        }},
	        {field:'c5',title:'资金追加',width:80,align:'center',formatter:function(value,row,index){
	        	return '资金追加';
	        }},
	        {field:'sbnf',title:'上报年份',width:80,align:'center'},
	        {field:'jhkgsj',title:'计划开工时间',width:100,align:'center'},
	        {field:'jhwgsj',title:'计划完工时间',width:100,align:'center'},
	        {field:'gydw',title:'管养单位',width:150,align:'center'},
	        {field:'xzqhmc',title:'行政区划名称',width:100,align:'center'},
	        {field:'lxbm',title:'路线编码',width:80,align:'center'},
	        {field:'lxmc',title:'路线名称',width:80,align:'center'},
	        {field:'qdzh',title:'起点桩号',width:60,align:'center'},
	        {field:'zdzh',title:'止点桩号',width:60,align:'center'},
	        {field:'yhlc',title:'隐患里程',width:60,align:'center'},
	        {field:'pfztz',title:'批复总投资',width:80,align:'center'}
	    ]]    
	});
}
//危桥项目
function wqxm(){
	$('#grid').datagrid({    
	    url:'',
	    pagination:true,
	    rownumbers:true,
	    pageNumber:1,
	    pageSize:10,
	    height:325,
	    columns:[[
	        {field:'c',title:'操作',width:150,align:'center',formatter:function(value,row,index){
	        	return '定位    '+'详细    '+'编辑    '+'删除';
	        }},
	        {field:'c4',title:'计划状态',width:80,align:'center',formatter:function(value,row,index){
	        	return '计划状态';
	        }},
	        {field:'c5',title:'资金追加',width:80,align:'center',formatter:function(value,row,index){
	        	return '资金追加';
	        }},
	        {field:'sbnf',title:'上报年份',width:80,align:'center'},
	        {field:'jhkgsj',title:'计划开工时间',width:100,align:'center'},
	        {field:'jhwgsj',title:'计划完工时间',width:100,align:'center'},
	        {field:'gydw',title:'管养单位',width:150,align:'center'},
	        {field:'xzqhmc',title:'行政区划名称',width:100,align:'center'},
	        {field:'lxbm',title:'路线编码',width:80,align:'center'},
	        {field:'lxmc',title:'路线名称',width:80,align:'center'},
	        {field:'qlbm',title:'桥梁编码',width:60,align:'center'},
	        {field:'qlmc',title:'桥梁名称',width:60,align:'center'},
	        {field:'pfztz',title:'批复总投资',width:80,align:'center'}
	    ]]    
	});
}
//安保工程项目
function abgcxm(){
	$('#grid').datagrid({    
	    url:'../js/gclmgjxm.json',
	    pagination:true,
	    rownumbers:true,
	    pageNumber:1,
	    pageSize:10,
	    height:325,
	    columns:[[
	        {field:'c',title:'操作',width:150,align:'center',formatter:function(value,row,index){
	        	return '定位    '+'详细    '+'编辑    '+'删除';
	        }},
	        {field:'c4',title:'计划状态',width:80,align:'center',formatter:function(value,row,index){
	        	return '计划状态';
	        }},
	        {field:'c5',title:'资金追加',width:80,align:'center',formatter:function(value,row,index){
	        	return '资金追加';
	        }},
	        {field:'sbnf',title:'上报年份',width:80,align:'center'},
	        {field:'jhkgsj',title:'计划开工时间',width:100,align:'center'},
	        {field:'jhwgsj',title:'计划完工时间',width:100,align:'center'},
	        {field:'gydw',title:'管养单位',width:150,align:'center'},
	        {field:'xzqhmc',title:'行政区划名称',width:100,align:'center'},
	        {field:'lxbm',title:'路线编码',width:80,align:'center'},
	        {field:'lxmc',title:'路线名称',width:80,align:'center'},
	        {field:'qdzh',title:'起点桩号',width:60,align:'center'},
	        {field:'zdzh',title:'止点桩号',width:60,align:'center'},
	        {field:'yhlc',title:'隐患里程',width:60,align:'center'},
	        {field:'pfztz',title:'批复总投资',width:80,align:'center'}
	    ]]    
	});
}
//灾害防治项目
function zhfzxm(){
	$('#grid').datagrid({    
	    url:'../js/gclmgjxm.json',
	    pagination:true,
	    rownumbers:true,
	    pageNumber:1,
	    pageSize:10,
	    height:325,
	    columns:[[
	        {field:'c',title:'操作',width:150,align:'center',formatter:function(value,row,index){
	        	return '定位    '+'详细    '+'编辑    '+'删除';
	        }},
	        {field:'c4',title:'计划状态',width:80,align:'center',formatter:function(value,row,index){
	        	return '计划状态';
	        }},
	        {field:'c5',title:'资金追加',width:80,align:'center',formatter:function(value,row,index){
	        	return '资金追加';
	        }},
	        {field:'sbnf',title:'上报年份',width:80,align:'center'},
	        {field:'jhkgsj',title:'计划开工时间',width:100,align:'center'},
	        {field:'jhwgsj',title:'计划完工时间',width:100,align:'center'},
	        {field:'gydw',title:'管养单位',width:150,align:'center'},
	        {field:'xzqhmc',title:'行政区划名称',width:100,align:'center'},
	        {field:'lxbm',title:'路线编码',width:80,align:'center'},
	        {field:'lxmc',title:'路线名称',width:80,align:'center'},
	        {field:'qdzh',title:'起点桩号',width:60,align:'center'},
	        {field:'zdzh',title:'止点桩号',width:60,align:'center'},
	        {field:'jsgm',title:'建设规模',width:60,align:'center'},
	        {field:'pfztz',title:'批复总投资',width:80,align:'center'}
	    ]]    
	});
}

function gridBind(grid){
	$('#grid').datagrid({    
	    url:'../js/gclmgjxm.json',
	    pagination:true,
	    rownumbers:true,
	    pageNumber:1,
	    pageSize:10,
	    height:325,
	    columns:[[
	    ]]
	});
}