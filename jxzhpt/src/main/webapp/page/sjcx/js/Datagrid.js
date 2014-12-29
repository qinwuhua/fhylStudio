//基础库管理
function jckglWqgz(){
	$("#grid").datagrid({    
		 url:"../js/lwxm1.json",
		    striped:true,
		    pagination:true,
		    rownumbers:true,
		    pageNumber:1,
		    pageSize:10,
		    height:325,
		    width:1100,
	    columns:[[    
			{field:'allSel',title:'全选',width:60,align:'center',checkbox:'true'},         
			{field:'cz',title:'操作',width:100,align:'center',formatter:function(value,row,index){
				return '<a href="javascript:()" style="text-decoration:none;color:#3399CC; ">定位</a>  '+
				'<a href="javascript:ckJck('+"'wqgz_ck.jsp','900','500'"+')" style="text-decoration:none;color:#3399CC; ">详细</a>';
			}},  
	        {field:'shzt',title:'审核状态',width:80,align:'center'}, 
	        {field:'gydw',title:'管养单位',width:160,align:'center'},
	        {field:'xzqh',title:'行政区划',width:120,align:'center'},
	        {field:'qlbh',title:'桥梁编号',width:120,align:'center'},
	        {field:'qlmc',title:'桥梁名称',width:120,align:'center'},
	        {field:'qlzxzh',title:'桥梁中心桩号',width:120,align:'center'},
	        {field:'lxbh',title:'路线编号',width:120,align:'center'},
	        {field:'lxmc',title:'路线名称',width:120,align:'center'},
	        {field:'qlpddj',title:'桥梁评定等级',width:140,align:'center'},
	        {field:'xjnd',title:'修建/改建年度',width:140,align:'center'},
	        {field:'xmnf',title:'项目年份',width:140,align:'center'},
	    ]]    
	});  
}
function jckglAbgc(){
	$("#grid").datagrid({    
		 url:"../js/lwxm2.json",
		    striped:true,
		    pagination:true,
		    rownumbers:true,
		    pageNumber:1,
		    pageSize:10,
		    height:325,
		    width:1100,
	    columns:[[    
			{field:'allSel',title:'全选',width:60,align:'center',checkbox:'true'},         
			{field:'cz',title:'操作',width:100,align:'center',formatter:function(value,row,index){
				return '<a href="javascript:()" style="text-decoration:none;color:#3399CC; ">定位</a>  '+
				'<a href="javascript:ckJck('+"'abgc_ck.jsp','900','500'"+')" style="text-decoration:none;color:#3399CC; ">详细</a>';
			}},    
	        {field:'shzt',title:'审核状态',width:80,align:'center'}, 
	        {field:'gydw',title:'管养单位',width:160,align:'center'},
	        {field:'xzqh',title:'行政区划',width:120,align:'center'},
	        {field:'lxbh',title:'路线编号',width:120,align:'center'},
	        {field:'lxmc',title:'路线名称',width:120,align:'center'},
	        {field:'qdzh',title:'起点桩号',width:140,align:'center'},
	        {field:'zdzh',title:'止点桩号',width:140,align:'center'},
	        {field:'qzlc',title:'起止里程',width:140,align:'center'},
	        {field:'zlc',title:'总里程',width:140,align:'center'},
	        {field:'yhlc',title:'隐患里程',width:140,align:'center'},
	        {field:'xjnd',title:'改建/修建年度',width:140,align:'center'},
	        {field:'xmnf',title:'项目年份',width:140,align:'center'}
	    ]]    
	});  
}
function jckglZhfz(){
	$("#grid").datagrid({    
		 url:"../js/lwxm3.json",
		    striped:true,
		    pagination:true,
		    rownumbers:true,
		    pageNumber:1,
		    pageSize:10,
		    height:325,
		    width:1100,
	    columns:[[    
			{field:'allSel',title:'全选',width:60,align:'center',checkbox:'true'},         
			{field:'cz',title:'操作',width:100,align:'center',formatter:function(value,row,index){
				return '<a href="javascript:()" style="text-decoration:none;color:#3399CC; ">定位</a>  '+
				'<a href="javascript:ckJck('+"'zhfz_ck.jsp','900','500'"+')" style="text-decoration:none;color:#3399CC; ">详细</a>';
			}},  
	        {field:'shzt',title:'审核状态',width:80,align:'center'}, 
	        {field:'gydw',title:'管养单位',width:160,align:'center'},
	        {field:'xzqh',title:'行政区划',width:120,align:'center'},
	        {field:'lxbh',title:'路线编号',width:120,align:'center'},
	        {field:'lxmc',title:'路线名称',width:120,align:'center'},
	        {field:'qdzh',title:'起点桩号',width:140,align:'center'},
	        {field:'zdzh',title:'止点桩号',width:140,align:'center'},
	        {field:'zlc',title:'总里程',width:140,align:'center'},
	        {field:'yhlc',title:'隐患里程',width:140,align:'center'},
	        {field:'xjnd',title:'改建/修建年度',width:140,align:'center'},
	        {field:'xmnf',title:'项目年份',width:140,align:'center'}
	    ]]    
	});  
}

//审查库管理
function sckglWqgz(){
	$("#grid").datagrid({    
		 url:"../js/sckgl1.json",
		    striped:true,
		    pagination:true,
		    rownumbers:true,
		    pageNumber:1,
		    pageSize:10,
		    height:325,
		    width:1100,
	    columns:[[    
			{field:'allSel',title:'全选',width:60,align:'center',checkbox:'true'},         
			{field:'cz',title:'操作',width:100,align:'center',formatter:function(value,row,index){
				return '<a href="javascript:()" style="text-decoration:none;color:#3399CC; ">定位</a>  '+
				'<a href="javascript:ckSck('+"'wqgz_ck.jsp','900','500'"+')" style="text-decoration:none;color:#3399CC; ">详细</a>';
			}},
	        {field:'sbzt',title:'上报状态',width:80,align:'center'}, 
	        {field:'gydw',title:'管养单位',width:160,align:'center'},
	        {field:'xzqh',title:'行政区划',width:120,align:'center'},
	        {field:'qlbh',title:'桥梁编号',width:120,align:'center'},
	        {field:'qlmc',title:'桥梁名称',width:120,align:'center'},
	        {field:'qlzxzh',title:'桥梁中心桩号',width:120,align:'center'},
	        {field:'lxbh',title:'路线编号',width:120,align:'center'},
	        {field:'lxmc',title:'路线名称',width:120,align:'center'},
	        {field:'qlpddj',title:'桥梁评定等级',width:140,align:'center'},
	        {field:'jsxz',title:'建设性质',width:140,align:'center'},
	    ]]    
	});  
}
function sckglAbgc(){
	$("#grid").datagrid({    
		 url:"../js/sckgl2.json",
		    striped:true,
		    pagination:true,
		    rownumbers:true,
		    pageNumber:1,
		    pageSize:10,
		    height:325,
		    width:1100,
		    columns:[[    
		  			{field:'allSel',title:'全选',width:60,align:'center',checkbox:'true'},         
		  			{field:'cz',title:'操作',width:100,align:'center',formatter:function(value,row,index){
						return '<a href="javascript:()" style="text-decoration:none;color:#3399CC; ">定位</a>  '+
						'<a href="javascript:ckSck('+"'abgc_ck.jsp','900','500'"+')" style="text-decoration:none;color:#3399CC; ">详细</a>';
					}},    
		  	        {field:'sbzt',title:'上报状态',width:80,align:'center'}, 
		  	        {field:'gydw',title:'管养单位',width:160,align:'center'},
		  	        {field:'xzqh',title:'行政区划',width:120,align:'center'},
		  	        {field:'lxbh',title:'路线编号',width:120,align:'center'},
		  	        {field:'lxmc',title:'路线名称',width:120,align:'center'},
		  	        {field:'qdzh',title:'起点桩号',width:140,align:'center'},
		  	        {field:'zdzh',title:'止点桩号',width:140,align:'center'},
		  	        {field:'qzlc',title:'起止里程',width:140,align:'center'},
		  	        {field:'zlc',title:'总里程',width:140,align:'center'},
		  	        {field:'yhlc',title:'隐患里程',width:140,align:'center'},
		  	        {field:'jsxz',title:'建设性质',width:140,align:'center'},
		  	    ]]    
		  	});  
}
function sckglZhfz(){
	$("#grid").datagrid({    
		 url:"../js/sckgl3.json",
		    striped:true,
		    pagination:true,
		    rownumbers:true,
		    pageNumber:1,
		    pageSize:10,
		    height:325,
		    width:1100,
	    columns:[[    
			{field:'allSel',title:'全选',width:60,align:'center',checkbox:'true'},         
			{field:'cz',title:'操作',width:100,align:'center',formatter:function(value,row,index){
				return '<a href="javascript:()" style="text-decoration:none;color:#3399CC; ">定位</a>  '+
				'<a href="javascript:ckSck('+"'zhfz_ck.jsp','900','500'"+')" style="text-decoration:none;color:#3399CC; ">详细</a>';
			}},    
	        {field:'sbzt',title:'上报状态',width:80,align:'center'}, 
	        {field:'gydw',title:'管养单位',width:160,align:'center'},
	        {field:'xzqh',title:'行政区划',width:120,align:'center'},
	        {field:'lxbh',title:'路线编号',width:120,align:'center'},
	        {field:'lxmc',title:'路线名称',width:120,align:'center'},
	        {field:'qdzh',title:'起点桩号',width:140,align:'center'},
	        {field:'zdzh',title:'止点桩号',width:140,align:'center'},
	        {field:'zlc',title:'总里程',width:140,align:'center'},
	        {field:'yhlc',title:'隐患里程',width:140,align:'center'},
	        {field:'lxjsdj',title:'路线技术等级',width:140,align:'center'},
	        {field:'jsxz',title:'建设性质',width:140,align:'center'}
	    ]]    
	});  
}

//工程路面升级
function gclmsjxm(){
	var grid={id:'grdab',url:'../js/gclmsjxm.json',striped:true,pagination:true,
		rownumbers:false,pageNumber:1,pageSize:10,height:325,
		columns:[[
		    {field:'ck',checkbox:true},
			{field:'c',title:'操作',width:100,align:'center',formatter:function(value,row,index){
				return '<a href="javascript:()" style="text-decoration:none;color:#3399CC; ">定位</a>  '+
							'<a href="javascript:openDialog('+"'gclmsj_xx','工程改造路面升级项目计划详情'"+')" style="text-decoration:none;color:#3399CC; ">详细</a>';
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

//工程路面改建
function gclmgjxm(){
	var grid = {id : 'grid',url : '../js/gclmgjxm.json',pagination : true,rownumbers:false,
		pageNumber : 1,pageSize : 10,height : 325,
		columns:[[
		    {field:'ck',checkbox:true},
		    {field : 'c',title : '操作',width : 100,align : 'center',
		    	formatter : function(value, row, index) {
		    		return '<a href="javascript:()" style="text-decoration:none;color:#3399CC; ">定位</a>  '+ 
		    					'<a href="javascript:openDialog('+"'gclmgj_xx','工程改造路面改建项目计划详情'"+')" style="text-decoration:none;color:#3399CC; ">详细</a>';
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

//养护大中修
function yhdzxxm(){
	var grid={id:'grid',url:'../js/yhdzx.json',pagination:true,rownumbers:false,
		pageNumber:1,pageSize:10,height:325,
		columns:[[
		          {field:'ck',checkbox:true},
		          {field:'c',title:'操作',width:100,align:'center',formatter:function(value,row,index){
		        	  return '<a href="javascript:()" style="text-decoration:none;color:#3399CC; ">定位</a>  '+
		        	  			  '<a href="javascript:openDialog('+"'yhdzx_xx','养护大中修项目计划详情'"+')" style="text-decoration:none;color:#3399CC; ">详细</a>';
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
	        {field:'c',title:'操作',width:100,align:'center',formatter:function(value,row,index){
	        	return '<a href="javascript:()" style="text-decoration:none;color:#3399CC; ">定位</a>  '+
	        				'<a href="javascript:openDialog('+"'shxm_xx','水毁项目计划详情'"+')" style="text-decoration:none;color:#3399CC; ">详细</a>';
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

//危桥项目
function wqxm(){
	var grid={id:'grid',url:'../js/wqxm.json',pagination:true,rownumbers:false,
		    pageNumber:1,pageSize:10,height:325,
		    columns:[[
		        {field:'ck',checkbox:true},
		        {field:'c',title:'操作',width:100,align:'center',formatter:function(value,row,index){
		        	return '<a href="javascript:()" style="text-decoration:none;color:#3399CC; ">定位</a>  '+
		        				'<a href="javascript:openDialog('+"'wqgz_xx','危桥改造项目计划详情'"+')" style="text-decoration:none;color:#3399CC; ">详细</a>';
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

//安保工程项目
function abgcxm(){
	var grid={id:'grid',url:'../js/gclmgjxm.json',pagination:true,rownumbers:false,
	    pageNumber:1,pageSize:10,height:325,
	    columns:[[
	        {field:'ck',checkbox:true},
	        {field:'c',title:'操作',width:100,align:'center',formatter:function(value,row,index){
	        	return '<a href="javascript:()" style="text-decoration:none;color:#3399CC; ">定位</a>  '+
	        				'<a href="javascript:openDialog('+"'abgc_xx','安保工程项目计划详情'"+')" style="text-decoration:none;color:#3399CC; ">详细</a>';
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
//灾害防治项目
function zhfzxm(){
	var grid={id:'grid',url:'../js/gclmgjxm.json',pagination:true,rownumbers:false,
		pageNumber:1,pageSize:10,height:325,
	    columns:[[
	        {field:'ck',checkbox:true},
	        {field:'c',title:'操作',width:100,align:'center',formatter:function(value,row,index){
	        	return '<a href="javascript:()" style="text-decoration:none;color:#3399CC; ">定位</a>  '+
	        				'<a href="javascript:openDialog('+"'zhfz_xx','灾害防治项目计划详情'"+')" style="text-decoration:none;color:#3399CC; ">详细</a>';
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

//红色旅游公路项目
function hslyglxm(){
	var grid={id:'grid',url:'../js/hslygl.json',pagination:true,rownumbers:false,
		pageNumber:1,pageSize:10,height:325,
	    columns:[[
	        {field:'ck',checkbox:true},
	        {field:'c',title:'操作',width:100,align:'center',formatter:function(value,row,index){
	        	return '<a href="javascript:()" style="text-decoration:none;color:#3399CC; ">定位</a>  '+
	        				'<a href="javascript:openDialog('+"'hslygl_xx','红色旅游公路项目计划详情'"+')" style="text-decoration:none;color:#3399CC; ">详细</a>';
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
	var grid={id:'grid',url:'../js/zbgl.json',pagination:true,rownumbers:false,
		pageNumber:1,pageSize:10,height:325,
	    columns:[[
	        {field:'ck',checkbox:true},
	        {field:'c',title:'操作',width:100,align:'center',formatter:function(value,row,index){
	        	var result='<a href="javascript:()" style="text-decoration:none;color:#3399CC; ">定位</a>  '+
	        						'<a href="javascript:openDialog('+"'zbgl_xx','战备公路项目计划详情'"+')" style="text-decoration:none;color:#3399CC; ">详细</a>    ';
	        	return result;
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