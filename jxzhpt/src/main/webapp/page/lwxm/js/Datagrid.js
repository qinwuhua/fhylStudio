//基础库管理
	function jckglWqgz(){
		$("#grid").datagrid({    
			 url:'/jxzhpt/xmjck/selectWqgz.do',
			 queryParams : {
				 	'sbthcd':function(){
				 		if($.cookie("unit2").length==2) return 7;
				 		else return $.cookie("unit2").length;
				 	},
				 	'gydw':function(){
				 		if("36"==$('#gydw').combobox("getValue")){
				 			return "";
				 		}else return $.cookie("unit2");
				 	},
				 	'xzqhmc':$("#xzqhmc").val(),
				 	'lxmc' : $('#lxmc').val(),
				 	'qlmc':$("#qlmc").val(),
				 	'xmnf':$("#xmnf").val(),
				 	'xmtype':$("#xmtype").val(),
				 	'sbzt':function(){
				 		var gydw=$('#gydw').combobox("getValue");
				 		if(gydw=="11101360000" || gydw=='21101360000' || gydw=='36'){
				 			return "";
				 		}else return $('#sbzt').val();
				 	},
				 	'jsdj':$("#jsdj").val(),
				 	'akjfl':$("#akjfl").val()
				},
			    striped:true,
			    pagination:true,
			    rownumbers:true,
			    pageNumber:1,
			    pageSize:10,
			    height:$(window).height()-$(window).height()*0.25,
			    width:$(window).width(),
		    columns:[[    
				{field:'allSel',title:'全选',width:60,align:'center',checkbox:'true'},         
				{field:'cz',title:'操作',width:130,align:'center',formatter:function(value,row,index){
					if(row.sbzt2=="未上报" && row.sbthcd!=7){
						return '<a href="javascript:()" style="text-decoration:none;color:#3399CC; ">定位</a>  '+
						'<a href=javascript:ckJckwqgz("'+row.id+'") style="text-decoration:none;color:#3399CC; ">详细</a>  '+
						'<a href=javascript:xgJckwqgz("'+row.id+'") style="text-decoration:none;color:#3399CC; ">编辑</a>  '+
						'<a href=javascript:delJckwqgz() style="text-decoration:none;color:#3399CC; ">删除</a>';
					}else{
						return '<a href="javascript:()" style="text-decoration:none;color:#3399CC; ">定位</a>  '+
						'<a href=javascript:ckJckwqgz("'+row.id+'") style="text-decoration:none;color:#3399CC; ">详细</a>  '+
						'<span style="color:grey;">编辑</span>  '+
						'<span style="color:grey;">删除</span>';
					}
				}},    
				{field:'sbzt',title:'上报状态',width:80,align:'center',formatter:function(value,row,index){
					if(row.sbzt2=="未上报" && row.sbthcd!=7){
						return '<a href=javascript:shangB() style="text-decoration:none;color:#3399CC; ">未上报</a>  ';
						}else{
						return '<span style="color:grey;">已上报</span>';
					}
				}},
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
	}

	function jckglAbgc(){
		$("#grid").datagrid({    
			 url:'/jxzhpt/xmjck/selectAbgc.do',
			 queryParams : {
				 	'sbthcd':function(){
				 		if($.cookie("unit2").length==2) return 7;
				 		else return $.cookie("unit2").length;
				 	},
				 	'gydw':function(){
				 		if("36"==$('#gydw').combobox("getValue")){
				 			return "";
				 		}else return $.cookie("unit2");
				 	},
				 	'xzqhmc':function(){
				 		if("360000"==$('#xzqhmc').combobox("getValue")){
				 			return "";
				 		}else return $('#xzqhmc').combobox("getValue");
				 	},
				 	'lxmc' : $('#lxmc').val(),
				 	'xmnf':$("#xmnf").val(),
				 	'xmtype':$("#xmtype").val(),
				 	'sbzt':function(){
				 		var gydw=$('#gydw').combobox("getValue");
				 		if(gydw=="11101360000" || gydw=='21101360000' || gydw=='36'){
				 			return "";
				 		}else return $('#sbzt').val();
				 	},
				 	'lxjsdj':$("#lxjsdj").val(),
				 	'lxbm':$("#lxbm").val()
				},
				striped:true,
				pagination:true,
				rownumbers:true,
			    pageNumber:1,
			    pageSize:10,
			    height:$(window).height()-$(window).height()*0.25,
			    width:$(window).width(),
		    columns:[[    
				{field:'allSel',title:'全选',width:60,align:'center',checkbox:'true'},         
				{field:'cz',title:'操作',width:130,align:'center',formatter:function(value,row,index){
					if(row.sbzt2=="未上报" && row.sbthcd!=7){
						return '<a href="javascript:()" style="text-decoration:none;color:#3399CC; ">定位</a>  '+
						'<a href=javascript:ckJckabgc("'+row.id+'") style="text-decoration:none;color:#3399CC; ">详细</a>  '+
						'<a href=javascript:xgJckabgc("'+row.id+'") style="text-decoration:none;color:#3399CC; ">编辑</a>  '+
						'<a href=javascript:delJckabgc() style="text-decoration:none;color:#3399CC; ">删除</a>';
					}else{
						return '<a href="javascript:()" style="text-decoration:none;color:#3399CC; ">定位</a>  '+
						'<a href=javascript:ckJckabgc("'+row.id+'") style="text-decoration:none;color:#3399CC; ">详细</a>  '+
						'<span style="color:grey;">编辑</span>  '+
						'<span style="color:grey;">删除</span>';
					}
				}},    
				{field:'sbzt',title:'上报状态',width:80,align:'center',formatter:function(value,row,index){
					if(row.sbzt2=="未上报" && row.sbthcd!=7){
					return '<a href=javascript:shangB() style="text-decoration:none;color:#3399CC; ">未上报</a>  ';
					}else{
						return '<span style="color:grey;">已上报</span>';
					}
				}},
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
	}

	function jckglZhfz(){
		$("#grid").datagrid({    
			 url:'/jxzhpt/xmjck/selectZhfz.do',
			 queryParams : {
				 	'sbthcd':function(){
				 		if($.cookie("unit2").length==2) return 7;
				 		else return $.cookie("unit2").length;
				 	},
				 	'gydw':function(){
				 		if("36"==$('#gydw').combobox("getValue")){
				 			return "";
				 		}else return $.cookie("unit2");
				 	},
				 	'xzqhmc':function(){
				 		if("360000"==$('#xzqhmc').combobox("getValue")){
				 			return "";
				 		}else return $('#xzqhmc').combobox("getValue");
				 	},
				 	'lxmc' : $('#lxmc').val(),
				 	'xmnf':$("#xmnf").val(),
				 	'xmtype':$("#xmtype").val(),
				 	'sbzt':function(){
				 		var gydw=$('#gydw').combobox("getValue");
				 		if(gydw=="11101360000" || gydw=='21101360000' || gydw=='36'){
				 			return "";
				 		}else return $('#sbzt').val();
				 	},
				 	'lxjsdj':$("#lxjsdj").val(),
				 	'lxbm':$("#lxbm").val()
				},
			    striped:true,
			    pagination:true,
			    rownumbers:true,
			    pageNumber:1,
			    pageSize:10,
			    height:$(window).height()-$(window).height()*0.25,
			    width:$(window).width(),
		    columns:[[    
				{field:'allSel',title:'全选',width:60,align:'center',checkbox:'true'},         
				{field:'cz',title:'操作',width:130,align:'center',formatter:function(value,row,index){
					if(row.sbzt2=="未上报" && row.sbthcd!=7){
						return '<a href="javascript:()" style="text-decoration:none;color:#3399CC; ">定位</a>  '+
						'<a href=javascript:ckJckzhfz("'+row.id+'") style="text-decoration:none;color:#3399CC; ">详细</a>  '+
						'<a href=javascript:xgJckzhfz("'+row.id+'") style="text-decoration:none;color:#3399CC; ">编辑</a>  '+
						'<a href=javascript:delJckzhfz() style="text-decoration:none;color:#3399CC; ">删除</a>';
					}else{
						return '<a href="javascript:()" style="text-decoration:none;color:#3399CC; ">定位</a>  '+
						'<a href=javascript:ckJckzhfz("'+row.id+'") style="text-decoration:none;color:#3399CC; ">详细</a>  '+
						'<span style="color:grey;">编辑</span>  '+
						'<span style="color:grey;">删除</span>';
					}
				}},    
				{field:'sbzt',title:'上报状态',width:80,align:'center',formatter:function(value,row,index){
					if(row.sbzt2=="未上报" && row.sbthcd!=7){
						return '<a href=javascript:shangB() style="text-decoration:none;color:#3399CC; ">未上报</a>  ';
						}else{
						return '<span style="color:grey;">已上报</span>';
					}
				}},
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
	}
	
//基础库审核
function jckshWqgz(){
	$("#grid").datagrid({    
		 url:'/jxzhpt/xmjck/selectJckShwqgz.do',
		 queryParams : {
			 'sbthcd':function(){
			 		if($.cookie("unit2").length==2) return 7;
			 		else return $.cookie("unit2").length;
			 	},
			 	'gydw':function(){
			 		if("36"==$('#gydw').combobox("getValue")){
			 			return "";
			 		}else return $.cookie("unit2");
			 	},
			 	'xzqhmc':function(){
			 		if("360000"==$('#xzqhmc').combobox("getValue")){
			 			return "";
			 		}else return $('#xzqhmc').combobox("getValue");
			 	},
			 	'lxmc' : $('#lxmc').val(),
			 	'qlmc':$("#qlmc").val(),
			 	'xmnf':$("#xmnf").val(),
			 	'xmtype':$("#xmtype").val(),
			 	'shzt':$("#shzt").val(),
			 	'jsdj':$("#jsdj").val(),
			 	'akjfl':$("#akjfl").val()
			},
		    striped:true,
		    pagination:true,
		    rownumbers:true,
		    pageNumber:1,
		    pageSize:10,
		    height:325,
		    width:1100,
	    columns:[[    
			{field:'allSel',title:'全选',width:60,align:'center',checkbox:'true'},         
			{field:'cz',title:'操作',width:130,align:'center',formatter:function(value,row,index){
					return '<a href="javascript:()" style="text-decoration:none;color:#3399CC; ">定位</a>  '+
					'<a href=javascript:ckJckwqgz("'+row.id+'") style="text-decoration:none;color:#3399CC; ">详细</a>  ';
			}},    
			{field:'shzt',title:'审核状态',width:80,align:'center',formatter:function(value,row,index){
				if(row.shzt=="未审核"){
				return '<a href=javascript:xgShzt() style="text-decoration:none;color:#3399CC; ">未审核</a>  ';
				}else{
					return '<span style="color:grey;">已审核</span>';
				}
			}},
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
}
function jckshAbgc(){
	$("#grid").datagrid({    
		 url:'/jxzhpt/xmjck/selectAbgcSh.do',
		 queryParams : {
			 'sbthcd':function(){
			 		if($.cookie("unit2").length==2) return 7;
			 		else return $.cookie("unit2").length;
			 	},
			 	'gydw':function(){
			 		if("36"==$('#gydw').combobox("getValue")){
			 			return "";
			 		}else return $.cookie("unit2");
			 	},
			 	'xzqhmc':function(){
			 		if("360000"==$('#xzqhmc').combobox("getValue")){
			 			return "";
			 		}else return $('#xzqhmc').combobox("getValue");
			 	},
			 	'lxmc' : $('#lxmc').val(),
			 	'xmnf':$("#xmnf").val(),
			 	'xmtype':$("#xmtype").val(),
			 	'shzt':$("#shzt").val(),
			 	'lxjsdj':$("#lxjsdj").val(),
			 	'lxbm':$("#lxbm").val()
			},
		    striped:true,
		    pagination:true,
		    rownumbers:true,
		    pageNumber:1,
		    pageSize:10,
		    height:325,
		    width:1100,
	    columns:[[    
			{field:'allSel',title:'全选',width:60,align:'center',checkbox:'true'},         
			{field:'cz',title:'操作',width:130,align:'center',formatter:function(value,row,index){
				if(row.shzt=="未审核"){
					return '<a href="javascript:()" style="text-decoration:none;color:#3399CC; ">定位</a>  '+
					'<a href=javascript:ckJckabgc("'+row.id+'") style="text-decoration:none;color:#3399CC; ">详细</a>  ';
				}else{
					return '<a href="javascript:()" style="text-decoration:none;color:#3399CC; ">定位</a>  '+
					'<a href=javascript:ckJckabgc("'+row.id+'") style="text-decoration:none;color:#3399CC; ">详细</a>  ';
				}
			}},    
			{field:'shzt',title:'审核状态',width:80,align:'center',formatter:function(value,row,index){
				if(row.shzt=="未审核"){
				return '<a href=javascript:xgShzt() style="text-decoration:none;color:#3399CC; ">未审核</a>  ';
				}else{
					return '<span style="color:grey;">已审核</span>';
				}
			}},
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
}
function jckshZhfz(){
	$("#grid").datagrid({    
		 url:'/jxzhpt/xmjck/selectZhfzSh.do',
		 queryParams : {
			 'sbthcd':function(){
			 		if($.cookie("unit2").length==2) return 7;
			 		else return $.cookie("unit2").length;
			 	},
			 	'gydw':function(){
			 		if("36"==$('#gydw').combobox("getValue")){
			 			return "";
			 		}else return $.cookie("unit2");
			 	},
			 	'xzqhmc':function(){
			 		if("360000"==$('#xzqhmc').combobox("getValue")){
			 			return "";
			 		}else return $('#xzqhmc').combobox("getValue");
			 	},
			 	'lxmc' : $('#lxmc').val(),
			 	'xmnf':$("#xmnf").val(),
			 	'xmtype':$("#xmtype").val(),
			 	'shzt':$("#shzt").val(),
			 	'lxjsdj':$("#lxjsdj").val(),
			 	'lxbm':$("#lxbm").val()
			},
		    striped:true,
		    pagination:true,
		    rownumbers:true,
		    pageNumber:1,
		    pageSize:10,
		    height:325,
		    width:1100,
	    columns:[[    
			{field:'allSel',title:'全选',width:60,align:'center',checkbox:'true'},         
			{field:'cz',title:'操作',width:130,align:'center',formatter:function(value,row,index){
				if(row.shzt=="未审核"){
					return '<a href="javascript:()" style="text-decoration:none;color:#3399CC; ">定位</a>  '+
					'<a href=javascript:ckJckzhfz("'+row.id+'") style="text-decoration:none;color:#3399CC; ">详细</a>  ';
				}else{
					return '<a href="javascript:()" style="text-decoration:none;color:#3399CC; ">定位</a>  '+
					'<a href=javascript:ckJckzhfz("'+row.id+'") style="text-decoration:none;color:#3399CC; ">详细</a>  ';
				}
			}},    
			{field:'shzt',title:'审核状态',width:80,align:'center',formatter:function(value,row,index){
				if(row.shzt=="未审核"){
				return '<a href=javascript:xgShzt() style="text-decoration:none;color:#3399CC; ">未审核</a>  ';
				}else{
					return '<span style="color:grey;">已审核</span>';
				}
			}},
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
}

//审查库管理
function sckglWqgz(){
	$("#grid").datagrid({    
		 url:'/jxzhpt/xmsck/selectSckwqgz.do',
		 queryParams : {
			 	'sck_sbthcd':function(){
			 		if($.cookie("unit2").length==2) return 7;
			 		else return $.cookie("unit2").length;
			 	},
			 	'gydw':function(){
			 		if( "36"==$('#gydw').combobox("getValue")){
			 			return "";
			 		}else return $.cookie("unit2");
			 	},
			 	'xzqhmc':function(){
			 		if("360000"==$('#xzqhmc').combobox("getValue")){
			 			return "";
			 		}else return $('#xzqhmc').combobox("getValue");
			 	},
			 	'lxmc' : $('#lxmc').val(),
			 	'qlmc':$("#qlmc").val(),
			 	'xmnf':$("#xmnf").val(),
			 	'xmtype':$("#xmtype").val(),
			 	'sbzt':function(){
			 		var gydw=$('#gydw').combobox("getValue");
			 		if(gydw=="11101360000" || gydw=='21101360000' || gydw=='36'){
			 			return "";
			 		}else return $('#sbzt').val();
			 	},
			 	'jsdj':$("#jsdj").val(),
			 	'akjfl':$("#akjfl").val()
			},
		    striped:true,
		    pagination:true,
		    rownumbers:true,
		    pageNumber:1,
		    pageSize:10,
		    height:325,
		    width:1100,
	    columns:[[    
			{field:'allSel',title:'全选',width:60,align:'center',checkbox:'true'},         
			{field:'cz',title:'操作',width:130,align:'center',formatter:function(value,row,index){
				if(row.sck_sbzt2=="未上报" && row.sck_sbthcd!=7 && row.sck_sbthcd==$.cookie("unit2").length){
					return '<a href="javascript:()" style="text-decoration:none;color:#3399CC; ">定位</a>  '+
					'<a href=javascript:ckSckwqgz("'+row.sckid+'") style="text-decoration:none;color:#3399CC; ">详细</a>  '+
					'<a href=javascript:xgSckwqgz("'+row.sckid+'") style="text-decoration:none;color:#3399CC; ">编辑</a>  '+
					'<a href=javascript:delSckwqgz() style="text-decoration:none;color:#3399CC; ">删除</a>';
				}else{
					return '<a href="javascript:()" style="text-decoration:none;color:#3399CC; ">定位</a>  '+
					'<a href=javascript:ckSckwqgz("'+row.sckid+'") style="text-decoration:none;color:#3399CC; ">详细</a>  '+
					'<span style="color:grey;">编辑</span>  '+
					'<span style="color:grey;">删除</span>';
				}
			}},    
			{field:'sck_sbzt',title:'上报状态',width:80,align:'center',formatter:function(value,row,index){
				if(row.sck_sbzt2=="未上报" && row.sck_sbthcd!=7 && row.sck_sbthcd==$.cookie("unit2").length){
					return '<a href=javascript:shangB() style="text-decoration:none;color:#3399CC; ">未上报</a>  ';
					}else{
					return '<span style="color:grey;">已上报</span>';
				}
			}},
				{field:'sck_shzt',title:'审核状态',width:80,align:'center'},
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
}

function sckglAbgc(){
	$("#grid").datagrid({    
		 url:'/jxzhpt/xmsck/selectSckabgc.do',
		 queryParams : {
			 	'sck_sbthcd':function(){
			 		if($.cookie("unit2").length==2) return 7;
			 		else return $.cookie("unit2").length;
			 	},
			 	'gydw':function(){
			 		if("36"==$('#gydw').combobox("getValue")){
			 			return "";
			 		}else return $.cookie("unit2");
			 	},
			 	'xzqhmc':function(){
			 		if("360000"==$('#xzqhmc').combobox("getValue")){
			 			return "";
			 		}else return $('#xzqhmc').combobox("getValue");
			 	},
			 	'lxmc' : $('#lxmc').val(),
			 	'xmnf':$("#xmnf").val(),
			 	'xmtype':$("#xmtype").val(),
			 	'sbzt':function(){
			 		var gydw=$('#gydw').combobox("getValue");
			 		if(gydw=="11101360000" || gydw=='21101360000' || gydw=='36'){
			 			return "";
			 		}else return $('#sbzt').val();
			 	},
			 	'lxjsdj':$("#lxjsdj").val(),
			 	'lxbm':$("#lxbm").val()
			},
		    striped:true,
		    pagination:true,
		    rownumbers:true,
		    pageNumber:1,
		    pageSize:10,
		    height:325,
		    width:1100,
	    columns:[[    
			{field:'allSel',title:'全选',width:60,align:'center',checkbox:'true'},         
			{field:'cz',title:'操作',width:130,align:'center',formatter:function(value,row,index){
				if(row.sck_sbzt2=="未上报" && row.sck_sbthcd!=7 && row.sck_sbthcd==$.cookie("unit2").length){
					return '<a href="javascript:()" style="text-decoration:none;color:#3399CC; ">定位</a>  '+
					'<a href=javascript:ckSckabgc("'+row.sckid+'") style="text-decoration:none;color:#3399CC; ">详细</a>  '+
					'<a href=javascript:xgSckabgc("'+row.sckid+'") style="text-decoration:none;color:#3399CC; ">编辑</a>  '+
					'<a href=javascript:delSckabgc() style="text-decoration:none;color:#3399CC; ">删除</a>';
				}else{
					return '<a href="javascript:()" style="text-decoration:none;color:#3399CC; ">定位</a>  '+
					'<a href=javascript:ckSckabgc("'+row.sckid+'") style="text-decoration:none;color:#3399CC; ">详细</a>  '+
					'<span style="color:grey;">编辑</span>  '+
					'<span style="color:grey;">删除</span>';
				}
			}},    
			{field:'sck_sbzt',title:'上报状态',width:80,align:'center',formatter:function(value,row,index){
				if(row.sck_sbzt2=="未上报" && row.sck_sbthcd!=7 && row.sck_sbthcd==$.cookie("unit2").length){
					return '<a href=javascript:shangB() style="text-decoration:none;color:#3399CC; ">未上报</a>  ';
					}else{
					return '<span style="color:grey;">已上报</span>';
				}
			}},
			{field:'sck_shzt',title:'审核状态',width:80,align:'center'},
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
	        {field:'xmnf',title:'项目年份',width:140,align:'center'},
	        {field:'jsxz',title:'建设性质',width:140,align:'center'}
	    ]]    
	});  
}
function sckglZhfz(){
	$("#grid").datagrid({    
		 url:'/jxzhpt/xmsck/selectSckzhfz.do',
		 queryParams : {
			 	'sck_sbthcd':function(){
			 		if($.cookie("unit2").length==2) return 7;
			 		else return $.cookie("unit2").length;
			 	},
			 	'gydw':function(){
			 		if("36"==$('#gydw').combobox("getValue")){
			 			return "";
			 		}else return $.cookie("unit2");
			 	},
			 	'xzqhmc':function(){
			 		if("360000"==$('#xzqhmc').combobox("getValue")){
			 			return "";
			 		}else return $('#xzqhmc').combobox("getValue");
			 	},
			 	'lxmc' : $('#lxmc').val(),
			 	'xmnf':$("#xmnf").val(),
			 	'xmtype':$("#xmtype").val(),
			 	'sbzt':function(){
			 		var gydw=$('#gydw').combobox("getValue");
			 		if(gydw=="11101360000" || gydw=='21101360000' || gydw=='36'){
			 			return "";
			 		}else return $('#sbzt').val();
			 	},
			 	'lxjsdj':$("#lxjsdj").val(),
			 	'lxbm':$("#lxbm").val()
			},
		    striped:true,
		    pagination:true,
		    rownumbers:true,
		    pageNumber:1,
		    pageSize:10,
		    height:325,
		    width:1100,
	    columns:[[    
			{field:'allSel',title:'全选',width:60,align:'center',checkbox:'true'},         
			{field:'cz',title:'操作',width:130,align:'center',formatter:function(value,row,index){
				if(row.sck_sbzt2=="未上报" && row.sck_sbthcd!=7 && row.sck_sbthcd==$.cookie("unit2").length){
					return '<a href="javascript:()" style="text-decoration:none;color:#3399CC; ">定位</a>  '+
					'<a href=javascript:ckSckzhfz("'+row.sckid+'") style="text-decoration:none;color:#3399CC; ">详细</a>  '+
					'<a href=javascript:xgSckzhfz("'+row.sckid+'") style="text-decoration:none;color:#3399CC; ">编辑</a>  '+
					'<a href=javascript:delSckzhfz() style="text-decoration:none;color:#3399CC; ">删除</a>';
				}else{
					return '<a href="javascript:()" style="text-decoration:none;color:#3399CC; ">定位</a>  '+
					'<a href=javascript:ckSckzhfz("'+row.sckid+'") style="text-decoration:none;color:#3399CC; ">详细</a>  '+
					'<span style="color:grey;">编辑</span>  '+
					'<span style="color:grey;">删除</span>';
				}
			}},    
			{field:'sck_sbzt',title:'上报状态',width:80,align:'center',formatter:function(value,row,index){
				if(row.sck_sbzt2=="未上报" && row.sck_sbthcd!=7 && row.sck_sbthcd==$.cookie("unit2").length){
					return '<a href=javascript:shangB() style="text-decoration:none;color:#3399CC; ">未上报</a>  ';
					}else{
					return '<span style="color:grey;">已上报</span>';
				}
			}},
			{field:'sck_shzt',title:'审核状态',width:80,align:'center'},
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
	        {field:'xmnf',title:'项目年份',width:140,align:'center'},
	        {field:'jsxz',title:'建设性质',width:140,align:'center'}
	    ]]    
	});  
}
//审查库审核
function sckshWqgz(){
	$("#grid").datagrid({    
		 url:'/jxzhpt/xmsck/selectSckShwqgz.do',
		 queryParams : {
			 'sck_sbthcd':function(){
			 		if($.cookie("unit2").length==2) return 7;
			 		else return $.cookie("unit2").length;
			 	},
			 	'gydw':function(){
			 		if("36"==$('#gydw').combobox("getValue")){
			 			return "";
			 		}else return $.cookie("unit2");
			 	},
			 	'xzqhmc':function(){
			 		if("360000"==$('#xzqhmc').combobox("getValue")){
			 			return "";
			 		}else return $('#xzqhmc').combobox("getValue");
			 	},
			 	'lxmc' : $('#lxmc').val(),
			 	'qlmc':$("#qlmc").val(),
			 	'xmnf':$("#xmnf").val(),
			 	'xmtype':$("#xmtype").val(),
			 	'shzt':$("#shzt").val(),
			 	'jsdj':$("#jsdj").val(),
			 	'akjfl':$("#akjfl").val()
			},
		    striped:true,
		    pagination:true,
		    rownumbers:true,
		    pageNumber:1,
		    pageSize:10,
		    height:325,
		    width:1100,
	    columns:[[    
			{field:'allSel',title:'全选',width:60,align:'center',checkbox:'true'},         
			{field:'cz',title:'操作',width:130,align:'center',formatter:function(value,row,index){
				if(row.sck_shzt=="未审核"){
					return '<a href="javascript:()" style="text-decoration:none;color:#3399CC; ">定位</a>  '+
					'<a href=javascript:ckSckwqgz("'+row.sckid+'") style="text-decoration:none;color:#3399CC; ">详细</a>  ';
				}else{
					return '<a href="javascript:()" style="text-decoration:none;color:#3399CC; ">定位</a>  '+
					'<a href=javascript:ckSckwqgz("'+row.sckid+'") style="text-decoration:none;color:#3399CC; ">详细</a>  ';
				}
			}},    
			{field:'sck_shzt',title:'审核状态',width:80,align:'center',formatter:function(value,row,index){
				if(row.sck_shzt=="未审核"){
				return '<a href=javascript:xgShzt() style="text-decoration:none;color:#3399CC; ">未审核</a>  ';
				}else{
					return '<span style="color:grey;">已审核</span>';
				}
			}},
				{field:'lrjh',title:'列入计划状态',width:100,align:'center'},
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
}
function sckshAbgc(){
	$("#grid").datagrid({    
		 url:'/jxzhpt/xmsck/selectSckShabgc.do',
		 queryParams : {
			 'sck_sbthcd':function(){
			 		if($.cookie("unit2").length==2) return 7;
			 		else return $.cookie("unit2").length;
			 	},
			 	'gydw':function(){
			 		if("36"==$('#gydw').combobox("getValue")){
			 			return "";
			 		}else return $.cookie("unit2");
			 	},
			 	'xzqhmc':function(){
			 		if("360000"==$('#xzqhmc').combobox("getValue")){
			 			return "";
			 		}else return $('#xzqhmc').combobox("getValue");
			 	},
			 	'lxmc' : $('#lxmc').val(),
			 	'xmnf':$("#xmnf").val(),
			 	'xmtype':$("#xmtype").val(),
			 	'shzt':$("#shzt").val(),
			 	'lxjsdj':$("#lxjsdj").val(),
			 	'lxbm':$("#lxbm").val()
			},
		    striped:true,
		    pagination:true,
		    rownumbers:true,
		    pageNumber:1,
		    pageSize:10,
		    height:325,
		    width:1100,
	    columns:[[    
			{field:'allSel',title:'全选',width:60,align:'center',checkbox:'true'},         
			{field:'cz',title:'操作',width:130,align:'center',formatter:function(value,row,index){
					return '<a href="javascript:()" style="text-decoration:none;color:#3399CC; ">定位</a>  '+
					'<a href=javascript:ckSckabgc("'+row.sckid+'") style="text-decoration:none;color:#3399CC; ">详细</a>  ';
			}},    
			{field:'sck_shzt',title:'审核状态',width:80,align:'center',formatter:function(value,row,index){
				if(row.sck_shzt=="未审核"){
				return '<a href=javascript:xgShzt() style="text-decoration:none;color:#3399CC; ">未审核</a>  ';
				}else{
					return '<span style="color:grey;">已审核</span>';
				}
			}},
			{field:'lrjh',title:'列入计划状态',width:100,align:'center'},
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
	        {field:'xmnf',title:'项目年份',width:140,align:'center'},
	        {field:'jsxz',title:'建设性质',width:140,align:'center'}
	    ]]    
	});  
}
function sckshZhfz(){
	$("#grid").datagrid({    
		 url:'/jxzhpt/xmsck/selectSckShzhfz.do',
		 queryParams : {
			 'sck_sbthcd':function(){
			 		if($.cookie("unit2").length==2) return 7;
			 		else return $.cookie("unit2").length;
			 	},
			 	'gydw':function(){
			 		if("36"==$('#gydw').combobox("getValue")){
			 			return "";
			 		}else return $.cookie("unit2");
			 	},
			 	'xzqhmc':function(){
			 		if("360000"==$('#xzqhmc').combobox("getValue")){
			 			return "";
			 		}else return $('#xzqhmc').combobox("getValue");
			 	},
			 	'lxmc' : $('#lxmc').val(),
			 	'xmnf':$("#xmnf").val(),
			 	'xmtype':$("#xmtype").val(),
			 	'shzt':$("#shzt").val(),
			 	'lxjsdj':$("#lxjsdj").val(),
			 	'lxbm':$("#lxbm").val()
			},
		    striped:true,
		    pagination:true,
		    rownumbers:true,
		    pageNumber:1,
		    pageSize:10,
		    height:325,
		    width:1100,
	    columns:[[    
			{field:'allSel',title:'全选',width:60,align:'center',checkbox:'true'},         
			{field:'cz',title:'操作',width:130,align:'center',formatter:function(value,row,index){
					return '<a href="javascript:()" style="text-decoration:none;color:#3399CC; ">定位</a>  '+
					'<a href=javascript:ckSckzhfz("'+row.sckid+'") style="text-decoration:none;color:#3399CC; ">详细</a>  ';
			}},    
			{field:'sck_shzt',title:'审核状态',width:80,align:'center',formatter:function(value,row,index){
				if(row.sck_shzt=="未审核"){
				return '<a href=javascript:xgShzt() style="text-decoration:none;color:#3399CC; ">未审核</a>  ';
				}else{
					return '<span style="color:grey;">已审核</span>';
				}
			}},
			{field:'lrjh',title:'列入计划状态',width:100,align:'center'},
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
	        {field:'xmnf',title:'项目年份',width:140,align:'center'},
	        {field:'jsxz',title:'建设性质',width:140,align:'center'}
	    ]]    
	});  
}
