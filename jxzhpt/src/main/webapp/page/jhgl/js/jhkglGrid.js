//工程路面升级
function gclmsjxm(){
	var grid={id:'grdab',url:'../js/gclmsjxm.json',striped:true,pagination:true,
		rownumbers:false,pageNumber:1,pageSize:10,height:325,
		columns:[[
		    {field:'ck',checkbox:true},
			{field:'c',title:'操作',width:150,align:'center',formatter:function(value,row,index){
				return '定位    '+'<a href="javascript:openDialog('+"'gclmsj_xx','工程改造路面升级项目计划详情'"+')" style="text-decoration:none;">详细</a>    '+'编辑    '+'删除';
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
	};
	gridBind(grid);
}
//上报模块——工程路面升级
function gclmsjxm_sb(){
	var grid={id:'grdab',url:'../js/gclmsjxm.json',striped:true,pagination:true,
		rownumbers:false,pageNumber:1,pageSize:10,height:325,
		columns:[[
		    {field:'ck',checkbox:true},
			{field:'c',title:'操作',width:150,align:'center',formatter:function(value,row,index){
				return '定位    '+'<a href="javascript:openDialog('+"'gclmsj_xx','工程改造路面升级项目计划详情'"+')" style="text-decoration:none;">详细</a>    '+'编辑';
			}},
			{field:'c4',title:'上报状态',width:80,align:'center',formatter:function(value,row,index){
				return '已状态';
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
	};
	gridBind(grid);
}
//审核模块——工程路面升级
function gclmsjxm_sh(){
	var grid={id:'grdab',url:'../js/gclmsjxm.json',striped:true,pagination:true,
		rownumbers:false,pageNumber:1,pageSize:10,height:325,
		columns:[[
		    {field:'ck',checkbox:true},
			{field:'c',title:'操作',width:150,align:'center',formatter:function(value,row,index){
				return '定位    '+'<a href="javascript:openDialog('+"'gclmsj_xx','工程改造路面升级项目计划详情'"+')" style="text-decoration:none;">详细</a>    '+'编辑';
			}},
			{field:'c1',title:'审批状态',width:80,align:'center',formatter:function(value,row,index){
				return '已审批';
			}},
			{field:'c4',title:'最近年份历史修建记录',width:80,align:'center',formatter:function(value,row,index){
				return '有';
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
	};
	gridBind(grid);
}
//工程路面改建
function gclmgjxm(){
	var grid = {id : 'grid',url : '../js/gclmgjxm.json',pagination : true,rownumbers:false,
		pageNumber : 1,pageSize : 10,height : 325,
		columns:[[
		    {field:'ck',checkbox:true},
		    {field : 'c',title : '操作',width : 150,align : 'center',
		    	formatter : function(value, row, index) {
		    		return '<a>定位<a>    ' + '详细    ' + '编辑    ' + '删除';
		    	}
		    },
		    {field : 'c4',title : '计划状态',width : 80,align : 'center',
				formatter : function(value, row, index) {
					return '计划状态';
				}
		    },
		    {field : 'c5',title : '资金追加',width : 80,align : 'center',
				formatter : function(value, row, index) {
					return '资金追加';
				}
		    },
		    {field : 'sbnf',title : '上报年份',width : 80,align : 'center'},
		    {field : 'jhkgsj',title : '计划开工时间',width : 100,align : 'center'},
		    {field : 'jhwgsj',title : '计划完工时间',width : 100,align : 'center'},
		    {field : 'gydw',title : '管养单位',width : 150,align : 'center'},
		    {field : 'xzqhmc',title : '行政区划名称',width : 100,align : 'center'},
		    {field : 'lxbm',title : '路线编码',width : 80,align : 'center'},
		    {field : 'lxmc',title : '路线名称',width : 80,align : 'center'},
		    {field : 'qdzh',title : '起点桩号',width : 60,align : 'center'},
		    {field : 'zdzh',title : '止点桩号',width : 60,align : 'center'},
		    {field : 'yhlc',title : '隐患里程',width : 60,align : 'center'},
		    {field:'pfztz',title:'批复总投资',width:80,align:'center'}
		]]
	};
	gridBind(grid);
}
//计划上报——工程路面改建
function gclmgjxm_sb(){
	var grid = {id : 'grid',url : '../js/gclmgjxm.json',pagination : true,rownumbers:false,
		pageNumber : 1,pageSize : 10,height : 325,
		columns:[[
		    {field:'ck',checkbox:true},
		    {field : 'c',title : '操作',width : 150,align : 'center',
		    	formatter : function(value, row, index) {
		    		return '<a>定位<a>    ' + '详细    ' + '编辑';
		    	}
		    },
		    {field : 'sbzt',title : '上报状态',width : 80,align : 'center',
				formatter : function(value, row, index) {
					return '已上报';
				}
		    },
		    {field : 'sbnf',title : '上报年份',width : 80,align : 'center'},
		    {field : 'jhkgsj',title : '计划开工时间',width : 100,align : 'center'},
		    {field : 'jhwgsj',title : '计划完工时间',width : 100,align : 'center'},
		    {field : 'gydw',title : '管养单位',width : 150,align : 'center'},
		    {field : 'xzqhmc',title : '行政区划名称',width : 100,align : 'center'},
		    {field : 'lxbm',title : '路线编码',width : 80,align : 'center'},
		    {field : 'lxmc',title : '路线名称',width : 80,align : 'center'},
		    {field : 'qdzh',title : '起点桩号',width : 60,align : 'center'},
		    {field : 'zdzh',title : '止点桩号',width : 60,align : 'center'},
		    {field : 'yhlc',title : '隐患里程',width : 60,align : 'center'},
		    {field:'pfztz',title:'批复总投资',width:80,align:'center'}
		]]
	};
	gridBind(grid);
}
//计划审核——工程路面改建
function gclmgjxm_sh(){
	var grid = {id : 'grid',url : '../js/gclmgjxm.json',pagination : true,rownumbers:false,
		pageNumber : 1,pageSize : 10,height : 325,
		columns:[[
		    {field:'ck',checkbox:true},
		    {field : 'c',title : '操作',width : 150,align : 'center',
		    	formatter : function(value, row, index) {
		    		return '<a>定位<a>    ' + '详细    ' + '编辑';
		    	}
		    },
		    {field : 'c4',title : '审批状态',width : 80,align : 'center',
				formatter : function(value, row, index) {
					return '已审批';
				}
		    },
		    {field : 'c5',title : '最近年份历史修建记录',width : 80,align : 'center',
				formatter : function(value, row, index) {
					return '有';
				}
		    },
		    {field : 'sbnf',title : '上报年份',width : 80,align : 'center'},
		    {field : 'jhkgsj',title : '计划开工时间',width : 100,align : 'center'},
		    {field : 'jhwgsj',title : '计划完工时间',width : 100,align : 'center'},
		    {field : 'gydw',title : '管养单位',width : 150,align : 'center'},
		    {field : 'xzqhmc',title : '行政区划名称',width : 100,align : 'center'},
		    {field : 'lxbm',title : '路线编码',width : 80,align : 'center'},
		    {field : 'lxmc',title : '路线名称',width : 80,align : 'center'},
		    {field : 'qdzh',title : '起点桩号',width : 60,align : 'center'},
		    {field : 'zdzh',title : '止点桩号',width : 60,align : 'center'},
		    {field : 'yhlc',title : '隐患里程',width : 60,align : 'center'},
		    {field:'pfztz',title:'批复总投资',width:80,align:'center'}
		]]
	};
	gridBind(grid);
}
//养护大中修
function yhdzxxm(){
	var grid={id:'grid',url:'',pagination:true,rownumbers:false,
		pageNumber:1,pageSize:10,height:325,
		columns:[[
		          {field:'ck',checkbox:true},
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
	};
	gridBind(grid);
}
//水毁项目
function shxm(){
	var grid={id:'grid',url:'../js/gclmgjxm.json',pagination:true,rownumbers:false,
	    pageNumber:1,pageSize:10,height:325,
	    columns:[[
	        {field:'ck',checkbox:true},
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
	};
	gridBind(grid);
}
//计划库上报——水毁项目
function shxm_sb(){
	var grid={id:'grid',url:'../js/gclmgjxm.json',pagination:true,rownumbers:false,
	    pageNumber:1,pageSize:10,height:325,
	    columns:[[
	        {field:'ck',checkbox:true},
	        {field:'c',title:'操作',width:150,align:'center',formatter:function(value,row,index){
	        	return '定位    '+'详细    '+'编辑';
	        }},
	        {field:'sbzt',title:'上报状态',width:80,align:'center',formatter:function(value,row,index){
	        	return '已上报';
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
	};
	gridBind(grid);
}
//计划库审核——水毁项目
function shxm_sh(){
	var grid={id:'grid',url:'../js/gclmgjxm.json',pagination:true,rownumbers:false,
	    pageNumber:1,pageSize:10,height:325,
	    columns:[[
	        {field:'ck',checkbox:true},
	        {field:'c',title:'操作',width:150,align:'center',formatter:function(value,row,index){
	        	return '定位    '+'详细    '+'编辑';
	        }},
	        {field:'sbzt',title:'审批状态',width:80,align:'center',formatter:function(value,row,index){
	        	return '已审批';
	        }},
	        {field:'sbzt',title:'最近年份历史修改记录',width:80,align:'center',formatter:function(value,row,index){
	        	return '有';
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
	};
	gridBind(grid);
}
//危桥项目
function wqxm(){
	var grid={id:'grid',url:'',pagination:true,rownumbers:false,
		    pageNumber:1,pageSize:10,height:325,
		    columns:[[
		        {field:'ck',checkbox:true},
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
	};
	gridBind(grid);
}
//计划库上报——危桥上报
function wqxm_sb(){
	var grid={id:'grid',url:'',pagination:true,rownumbers:false,
		    pageNumber:1,pageSize:10,height:325,
		    columns:[[
		        {field:'ck',checkbox:true},
		        {field:'c',title:'操作',width:150,align:'center',formatter:function(value,row,index){
		        	return '定位    '+'详细    '+'编辑';
		        }},
		        {field:'sbzt',title:'上报状态',width:80,align:'center',formatter:function(value,row,index){
		        	return '已完工';
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
	};
	gridBind(grid);
}
//计划库审核——危桥改造
function wqxm_sh(){
	var grid={id:'grid',url:'',pagination:true,rownumbers:false,
		    pageNumber:1,pageSize:10,height:325,
		    columns:[[
		        {field:'ck',checkbox:true},
		        {field:'c',title:'操作',width:150,align:'center',formatter:function(value,row,index){
		        	return '定位    '+'详细    '+'编辑';
		        }},
		        {field:'sbzt',title:'审批状态',width:80,align:'center',formatter:function(value,row,index){
		        	return '已审批';
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
	};
	gridBind(grid);
}
//安保工程项目
function abgcxm(){
	var grid={id:'grid',url:'../js/gclmgjxm.json',pagination:true,rownumbers:false,
	    pageNumber:1,pageSize:10,height:325,
	    columns:[[
	        {field:'ck',checkbox:true},
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
	};
	gridBind(grid);
}
//计划库上报——安保工程
function abgcxm_sb(){
	var grid={id:'grid',url:'../js/gclmgjxm.json',pagination:true,rownumbers:false,
	    pageNumber:1,pageSize:10,height:325,
	    columns:[[
	        {field:'ck',checkbox:true},
	        {field:'c',title:'操作',width:150,align:'center',formatter:function(value,row,index){
	        	return '定位    '+'详细    '+'编辑';
	        }},
	        {field:'c4',title:'上报状态',width:80,align:'center',formatter:function(value,row,index){
	        	return '计划状态';
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
	};
	gridBind(grid);
}
//计划库上报——安保工程
function abgcxm_sh(){
	var grid={id:'grid',url:'../js/gclmgjxm.json',pagination:true,rownumbers:false,
	    pageNumber:1,pageSize:10,height:325,
	    columns:[[
	        {field:'ck',checkbox:true},
	        {field:'c',title:'操作',width:150,align:'center',formatter:function(value,row,index){
	        	return '定位    '+'详细    '+'编辑';
	        }},
	        {field:'c4',title:'审批状态',width:80,align:'center',formatter:function(value,row,index){
	        	return '已审批';
	        }},
	        {field:'sbnf',title:'最近年份历史修建记录',width:80,align:'center'},
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
	};
	gridBind(grid);
}
//灾害防治项目
function zhfzxm(){
	var grid={id:'grid',url:'../js/gclmgjxm.json',pagination:true,rownumbers:false,
		pageNumber:1,pageSize:10,height:325,
	    columns:[[
	        {field:'ck',checkbox:true},
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
	};
	gridBind(grid);
}
//计划库上报——灾害防治
function zhfzxm_sb(){
	var grid={id:'grid',url:'../js/gclmgjxm.json',pagination:true,rownumbers:false,
		pageNumber:1,pageSize:10,height:325,
	    columns:[[
	        {field:'ck',checkbox:true},
	        {field:'c',title:'操作',width:150,align:'center',formatter:function(value,row,index){
	        	return '定位    '+'详细    '+'编辑';
	        }},
	        {field:'c4',title:'上报状态',width:80,align:'center',formatter:function(value,row,index){
	        	return '已上报';
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
	};
	gridBind(grid);
}
//计划库审核——灾害防治
function zhfzxm_sh(){
	var grid={id:'grid',url:'../js/gclmgjxm.json',pagination:true,rownumbers:false,
		pageNumber:1,pageSize:10,height:325,
	    columns:[[
	        {field:'ck',checkbox:true},
	        {field:'c',title:'操作',width:150,align:'center',formatter:function(value,row,index){
	        	return '定位    '+'详细    '+'编辑';
	        }},
	        {field:'c4',title:'审批状态',width:80,align:'center',formatter:function(value,row,index){
	        	return '已审批';
	        }},
	        {field:'c4',title:'最近年份历史修建记录',width:80,align:'center',formatter:function(value,row,index){
	        	return '有';
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
	};
	gridBind(grid);
}
//红色旅游公路项目
function hslyglxm(){
	var grid={id:'grid',url:'',pagination:true,rownumbers:false,
		pageNumber:1,pageSize:10,height:325,
	    columns:[[
	        {field:'ck',checkbox:true},
	        {field:'c',title:'操作',width:150,align:'center',formatter:function(value,row,index){
	        	return '详细    '+'编辑    '+'删除';
	        }},
	        {field:'c5',title:'资金追加',width:80,align:'center',formatter:function(value,row,index){
	        	return '资金追加';
	        }},
	        {field:'c4',title:'计划年份',width:80,align:'center',formatter:function(value,row,index){
	        	return '计划年份';
	        }},
	        {field:'xmmc',title:'项目名称',width:100,align:'center'},
	        {field:'xzqhmc',title:'行政区划名称',width:100,align:'center'},
	        {field:'jsxz',title:'建设性质',width:100,align:'center'},
	        {field:'ztz',title:'总投资',width:82,align:'center'},
	        {field:'kgn',title:'开工年',width:80,align:'center'},
	        {field:'wgn',title:'完工年',width:80,align:'center'},
	    ]]
	};
	gridBind(grid);
}
//战备公路项目
function zbglxm(){
	var grid={id:'grid',url:'',pagination:true,rownumbers:false,
		pageNumber:1,pageSize:10,height:325,
	    columns:[[
	        {field:'ck',checkbox:true},
	        {field:'c',title:'操作',width:150,align:'center',formatter:function(value,row,index){
	        	return '详细    '+'编辑    '+'删除';
	        }},
	        {field:'c5',title:'资金追加',width:80,align:'center',formatter:function(value,row,index){
	        	return '资金追加';
	        }},
	        {field:'xmmc',title:'项目名称',width:100,align:'center'},
	        {field:'xzqhmc',title:'行政区划名称',width:100,align:'center'},
	        {field:'xzdj',title:'行政等级',width:100,align:'center'},
	        {field:'lxbm',title:'路线编码',width:80,align:'center'},
	        {field:'jsxz',title:'建设性质',width:100,align:'center'},
	        {field:'lmkd',title:'路面宽度',width:100,align:'center'},
	        {field:'jsfa',title:'技术方案',width:82,align:'center'},
	        {field:'jhnf',title:'计划年份',width:82,align:'center'},
	        {field:'ztz',title:'总投资',width:82,align:'center'},
	    ]]
	};
	gridBind(grid);
}
/**
 * dataGrid绑定数据方法
 * @param grid 为dataGrid配置的JSON对象
 * id：table的id
 * url：数据路径
 * striped：斑马线效果
 * pagination：是否显示分页工具栏
 * rownumbers：是否显示行号
 * pageNumber：初始化页码
 * pageSize：初始化页面大小
 * height:初始化高度
 * columns：数据
 */
function gridBind(grid){
	$('#'+grid.id).datagrid({
	    url:grid.url,
	    striped:grid.striped,
	    pagination:grid.pagination,
	    rownumbers:grid.rownumbers,
	    pageNumber:grid.pageNumber,
	    pageSize:grid.pageSize,
	    height:grid.height,
	    columns:grid.columns
	});
}