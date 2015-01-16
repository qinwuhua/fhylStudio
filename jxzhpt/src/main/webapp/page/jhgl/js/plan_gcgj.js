var gridObj;//列表对象
var oldIndex=-1;//之前选中的
var selRow=new Array();//已选择的行号

function sbnf(id){
	$('#'+id).combobox({    
	    url:'../../../jhgl/queryGcgjNfs.do',
	    valueField:'text',    
	    textField:'text'   
	}); 
}

/**
 * 工程路面改建列表信息
 * @param jh 计划库条件
 * @param lx 路线条件
 */
function gclmgjxm(jh,lx){
	selectRow={};//每次查询清空选择数据
	var params={"jh.sbzt":jh.sbzt,"jh.spzt":jh.spzt,"jh.sbnf":jh.sbnf,"jh.jhkgsj":jh.jhkgsj,
			"jh.jhwgsj":jh.jhwgsj,"jh.pfztz":jh.pfztz,
			"lx.gydw":lx.gydw,"lx.gydwdm":lx.gydwdm,"lx.xzqhmc":lx.xzqhmc,"lx.xzqhdm":lx.xzqhdm,"lx.lxmc":lx.lxmc};
	var grid = {id : 'grid',url : '../../../jhgl/queryGcgjList.do',queryParams:params,pagination : true,rownumbers:false,
		pageNumber : 1,pageSize : 10,height : 325,width:1070,
		columns:[[
		    {field:'ck',checkbox:true},
		    {field : 'c',title : '操作',width : 150,align : 'center',
		    	formatter : function(value, row, index) {
		    		var result='<a>定位<a>    ';
		    		result+='<a href="javascript:openDialog('+"'gclmgj_xx','工程改造路面改建项目计划详情','../jhkxx/gclmgj.jsp'"+')" style="text-decoration:none;">详细</a>    ';
		    		result+='编辑    ' + '删除';
		    		return result;
		    	}
		    },
		    {field : 'c4',title : '计划状态',width : 80,align : 'center',
				formatter : function(value, row, index) {
					var result="";
					if(row.sbzt=="0"){
						result="未上报";
					}
					else if(row.sbzt=="1" && row.spzt=="0"){
						result="上报待审批";
					}
					else if(row.sbzt=="1" && row.spzt=="1"){
						result="已审批";
					}
					return result;
				}
		    },
		    {field : 'c5',title : '资金追加',width : 80,align : 'center',
				formatter : function(value, row, index) {
					return '<a>资金追加</a>';
				}
		    },
		    {field : 'sbnf',title : '上报年份',width : 80,align : 'center'},
		    {field : 'jhkgsj',title : '计划开工时间',width : 100,align : 'center'},
		    {field : 'jhwgsj',title : '计划完工时间',width : 100,align : 'center'},
		    {field : 'gydw',title : '管养单位',width : 150,align : 'center',
		    	formatter : function(value, row, index) {
		    		return row.plan_lx_gcgjs[0].gydw;
		    	}
		    },
		    {field:'xzqhmc',title : '行政区划名称',width : 100,align : 'center',
		    	formatter : function(value, row, index) {
		    		return row.plan_lx_gcgjs[0].xzqhmc;
		    	}
		    },
		    {field : 'lxbm',title : '路线编码',width : 80,align : 'center',
		    	formatter : function(value, row, index) {
		    		return row.plan_lx_gcgjs[0].lxbm;
		    	}
		    },
		    {field : 'lxmc',title : '路线名称',width : 80,align : 'center',
		    	formatter : function(value, row, index) {
		    		return row.plan_lx_gcgjs[0].lxmc;
		    	}
		    },
		    {field : 'qdzh',title : '起点桩号',width : 60,align : 'center',
		    	formatter : function(value, row, index) {
		    		return row.plan_lx_gcgjs[0].qdzh;
		    	}
		    },
		    {field : 'zdzh',title : '止点桩号',width : 60,align : 'center',
		    	formatter : function(value, row, index) {
		    		return row.plan_lx_gcgjs[0].zdzh;
		    	}
		    },
		    {field : 'yhlc',title : '隐患里程',width : 60,align : 'center',
		    	formatter : function(value, row, index) {
		    		return row.plan_lx_gcgjs[0].yhlc;
		    	}
		    },
		    {field:'pfztz',title:'批复总投资(万元)',width:80,align:'center'}
		]],
		onClickRow:function(rowIndex,rowDate){
			if(oldIndex!=-1){
				gridObj.datagrid("unselectRow",oldIndex);
			}
			selRow.push(rowIndex);
			gridObj.datagrid("selectRow",rowIndex);
			oldIndex=rowIndex;
		}
	};
	gridBind(grid);
}

function gclmgjxm_sb(jh,lx){
	var params={"jh.sbzt":jh.sbzt,"jh.spzt":jh.spzt,"jh.sbnf":jh.sbnf,"jh.jhkgsj":jh.jhkgsj,
			"jh.jhwgsj":jh.jhwgsj,"jh.pfztz":jh.pfztz,
			"lx.gydw":lx.gydw,"lx.gydwdm":lx.gydwdm,"lx.xzqhmc":lx.xzqhmc,"lx.xzqhdm":lx.xzqhdm,"lx.lxmc":lx.lxmc};
	var grid = {id : 'grid',url : '../../../jhgl/queryGcgjList.do',pagination : true,rownumbers:false,
		pageNumber : 1,pageSize : 10,height : 325,width:1070,queryParams:params,
		columns:[[
		    {field:'ck',checkbox:true},
		    {field : 'c',title : '操作',width : 150,align : 'center',
		    	formatter : function(value, row, index) {
		    		var result="";
		    		result+="<a>定位<a>    ";
		    		result+='<a href="javascript:openDialog('+"'gclmgj_sb','工程改造路面改建项目计划详情','../jhkxx/gclmgj.jsp'"+')" style="text-decoration:none;">详细</a>        ';
		    		result+="<a>编辑</a>"
		    		return result;
		    	}
		    },
		    {field : 'sbzt',title : '上报状态',width : 80,align : 'center',
				formatter : function(value, row, index) {
					var result="";
					if(row.sbzt=="0"){
						result="<a>上报</a>"
					}
					else if(row.sbzt=="1"){
						result="已上报";
					}
					return result;
				}
		    },
		    {field : 'sbnf',title : '上报年份',width : 80,align : 'center'},
		    {field : 'jhkgsj',title : '计划开工时间',width : 100,align : 'center'},
		    {field : 'jhwgsj',title : '计划完工时间',width : 100,align : 'center'},
		    {field : 'gydw',title : '管养单位',width : 150,align : 'center',
		    	formatter : function(value, row, index) {
		    		return row.plan_lx_gcgjs[0].gydw;
		    	}
		    },
		    {field:'xzqhmc',title : '行政区划名称',width : 100,align : 'center',
		    	formatter : function(value, row, index) {
		    		return row.plan_lx_gcgjs[0].xzqhmc;
		    	}
		    },
		    {field : 'lxbm',title : '路线编码',width : 80,align : 'center',
		    	formatter : function(value, row, index) {
		    		return row.plan_lx_gcgjs[0].lxbm;
		    	}
		    },
		    {field : 'lxmc',title : '路线名称',width : 80,align : 'center',
		    	formatter : function(value, row, index) {
		    		return row.plan_lx_gcgjs[0].lxmc;
		    	}
		    },
		    {field : 'qdzh',title : '起点桩号',width : 60,align : 'center',
		    	formatter : function(value, row, index) {
		    		return row.plan_lx_gcgjs[0].qdzh;
		    	}
		    },
		    {field : 'zdzh',title : '止点桩号',width : 60,align : 'center',
		    	formatter : function(value, row, index) {
		    		return row.plan_lx_gcgjs[0].zdzh;
		    	}
		    },
		    {field : 'yhlc',title : '隐患里程',width : 60,align : 'center',
		    	formatter : function(value, row, index) {
		    		return row.plan_lx_gcgjs[0].yhlc;
		    	}
		    },
		    {field:'pfztz',title:'批复总投资',width:80,align:'center'}
		]],
		onClickRow:function(rowIndex,rowDate){
			if(oldIndex!=-1){
				gridObj.datagrid("unselectRow",oldIndex);
			}
			selRow.push(rowIndex);
			gridObj.datagrid("selectRow",rowIndex);
			oldIndex=rowIndex;
		}
	};
	gridBind(grid);
}

function gclmgjxm_sh(jh,lx){
	var params={"jh.sbzt":jh.sbzt,"jh.spzt":jh.spzt,"jh.sbnf":jh.sbnf,"jh.jhkgsj":jh.jhkgsj,
			"jh.jhwgsj":jh.jhwgsj,"jh.pfztz":jh.pfztz,
			"lx.gydw":lx.gydw,"lx.gydwdm":lx.gydwdm,"lx.xzqhmc":lx.xzqhmc,"lx.xzqhdm":lx.xzqhdm,"lx.lxmc":lx.lxmc};
	var grid = {id : 'grid',url : '../../../jhgl/queryGcgjList.do',pagination : true,rownumbers:false,
		pageNumber : 1,pageSize : 10,height : 325,width:1070,queryParams:params,
		columns:[[
		    {field:'ck',checkbox:true},
		    {field : 'c',title : '操作',width : 150,align : 'center',
		    	formatter : function(value, row, index) {
		    		return '<a>定位<a>    ' + '<a href="javascript:openDialog('+"'gclmgj_sh','工程改造路面改建项目计划详情','../jhkxx/gclmgj.jsp'"+')" style="text-decoration:none;">详细</a>    ' + '编辑';
		    	}
		    },
		    {field : 'c4',title : '审批状态',width : 80,align : 'center',
				formatter : function(value, row, index) {
					var result;
					if(row.spzt=='0'){
						result="<a>审批</a>"
					}
					else if(row.spzt=="1"){
						result="已审批";
					}
					return result;
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
		    {field : 'gydw',title : '管养单位',width : 150,align : 'center',
		    	formatter : function(value, row, index) {
		    		return row.plan_lx_gcgjs[0].gydw;
		    	}
		    },
		    {field:'xzqhmc',title : '行政区划名称',width : 100,align : 'center',
		    	formatter : function(value, row, index) {
		    		return row.plan_lx_gcgjs[0].xzqhmc;
		    	}
		    },
		    {field : 'lxbm',title : '路线编码',width : 80,align : 'center',
		    	formatter : function(value, row, index) {
		    		return row.plan_lx_gcgjs[0].lxbm;
		    	}
		    },
		    {field : 'lxmc',title : '路线名称',width : 80,align : 'center',
		    	formatter : function(value, row, index) {
		    		return row.plan_lx_gcgjs[0].lxmc;
		    	}
		    },
		    {field : 'qdzh',title : '起点桩号',width : 60,align : 'center',
		    	formatter : function(value, row, index) {
		    		return row.plan_lx_gcgjs[0].qdzh;
		    	}
		    },
		    {field : 'zdzh',title : '止点桩号',width : 60,align : 'center',
		    	formatter : function(value, row, index) {
		    		return row.plan_lx_gcgjs[0].zdzh;
		    	}
		    },
		    {field : 'yhlc',title : '隐患里程',width : 60,align : 'center',
		    	formatter : function(value, row, index) {
		    		return row.plan_lx_gcgjs[0].yhlc;
		    	}
		    },
		    {field:'pfztz',title:'批复总投资',width:80,align:'center'}
		]],
		onClickRow:function(rowIndex,rowDate){
			if(oldIndex!=-1){
				gridObj.datagrid("unselectRow",oldIndex);
			}
			selRow.push(rowIndex);
			gridObj.datagrid("selectRow",rowIndex);
			oldIndex=rowIndex;
		}
	};
	gridBind(grid);
}

function gclmgjxm_zjxd(jh,lx){
	var params={"jh.sbzt":jh.sbzt,"jh.spzt":jh.spzt,"jh.sbnf":jh.sbnf,"jh.jhkgsj":jh.jhkgsj,
			"jh.jhwgsj":jh.jhwgsj,"jh.pfztz":jh.pfztz,
			"lx.gydw":lx.gydw,"lx.gydwdm":lx.gydwdm,"lx.xzqhmc":lx.xzqhmc,"lx.xzqhdm":lx.xzqhdm,"lx.lxmc":lx.lxmc};
	var grid = {id : 'grid',url : '../../../jhgl/queryGcgjList.do',pagination : true,rownumbers:false,
		pageNumber : 1,pageSize : 10,height : 325,width:1070,queryParams:params,
		columns:[[
		    {field:'ck',checkbox:true},
		    {field : 'c',title : '操作',width : 150,align : 'center',
		    	formatter : function(value, row, index) {
		    		return '<a>定位<a>    ' + '<a href="javascript:openDialog('+"'gclmgj_zjxd','工程改造路面改建项目计划详情','../jhkxx/gclmgj.jsp'"+')" style="text-decoration:none;">详细</a>';
		    	}
		    },
		    {field:'zjxf',title:'资金下发',width:60,align:'center',formatter:function(value,row,index){
		    	return '<a href="javascript:openDialog('+"'gclmgj_zjxd','工程改造路面改建项目资金下达','../zjxd/gclmgj.jsp'"+')" style="text-decoration:none;">资金下发</a>';
		    }},
		    {field : 'c4',title : '建设状态',width : 80,align : 'center',
				formatter : function(value, row, index) {
					return '未开工';
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
		    {field : 'gydw',title : '管养单位',width : 150,align : 'center',
		    	formatter : function(value, row, index) {
		    		return row.plan_lx_gcgjs[0].gydw;
		    	}
		    },
		    {field:'xzqhmc',title : '行政区划名称',width : 100,align : 'center',
		    	formatter : function(value, row, index) {
		    		return row.plan_lx_gcgjs[0].xzqhmc;
		    	}
		    },
		    {field : 'lxbm',title : '路线编码',width : 80,align : 'center',
		    	formatter : function(value, row, index) {
		    		return row.plan_lx_gcgjs[0].lxbm;
		    	}
		    },
		    {field : 'lxmc',title : '路线名称',width : 80,align : 'center',
		    	formatter : function(value, row, index) {
		    		return row.plan_lx_gcgjs[0].lxmc;
		    	}
		    },
		    {field : 'qdzh',title : '起点桩号',width : 60,align : 'center',
		    	formatter : function(value, row, index) {
		    		return row.plan_lx_gcgjs[0].qdzh;
		    	}
		    },
		    {field : 'zdzh',title : '止点桩号',width : 60,align : 'center',
		    	formatter : function(value, row, index) {
		    		return row.plan_lx_gcgjs[0].zdzh;
		    	}
		    },
		    {field : 'yhlc',title : '隐患里程',width : 60,align : 'center',
		    	formatter : function(value, row, index) {
		    		return row.plan_lx_gcgjs[0].yhlc;
		    	}
		    },
		    {field:'pfztz',title:'批复总投资',width:80,align:'center'}
		]],
		onClickRow:function(rowIndex,rowDate){
			if(oldIndex!=-1){
				gridObj.datagrid("unselectRow",oldIndex);
			}
			selRow.push(rowIndex);
			gridObj.datagrid("selectRow",rowIndex);
			oldIndex=rowIndex;
		}
	};
	gridBind(grid);
}

function searchGcgj(){
	alert("管养单位代码："+$("#gydw").combo("getValue"));
	var jh={jhnf:null,sbzt:null,spzt:null};
	var lx={gydw:$("#gydw").combo("getText"),gydwdm:$("#gydw").combo("getValue"),lxmc:null,xzqhmc:null,yjsdj:null,lxbm:null};
	if($("#sbnf").combo("getValue")!=""){
		jh.sbnf=$("#sbnf").combo("getValue");
	}
	if($('#txtlxmc').val()!=""){
		lx.lxmc=$('#txtlxmc').val();
	}
	if($("#yjsdj").combo("getValue")!=""){
		lx.yjsdj= $("#yjsdj").combo("getValue");
	}
	if($("#gldj").combo("getValue")!=""){
		lx.lxbm=$("#gldj").combo("getValue");
	}
	gclmgjxm(jh,lx);
}

function queryGcgjXx(id){
	$.ajax({
		type:'post',
		url:'../../../jhgl/queryGcgjById.do',
		data:"jh.id="+id,
		dataType:'json',
		success:function(data){
			$('#lxmc').html(data.plan_lx_gcgjs[0].lxmc);
			$('#lxbm').html(data.plan_lx_gcgjs[0].lxbm);
			$('#jsdd').html(data.plan_lx_gcgjs[0].jsdd);
			$('#qdzh').html(data.plan_lx_gcgjs[0].qdzh);
			$('#zdzh').html(data.plan_lx_gcgjs[0].zdzh);
			$('#qzlc').html(data.plan_lx_gcgjs[0].qzlc);
			$('#gydwxx').html(data.plan_lx_gcgjs[0].gydw);
			$('#xzqhdm').html(data.plan_lx_gcgjs[0].xzqhdm);
			$('#xzqhmc').html(data.plan_lx_gcgjs[0].xzqhmc);
			$('#yjsdj').html(data.plan_lx_gcgjs[0].yjsdj);
			$('#ylmlx').html(data.plan_lx_gcgjs[0].ylmlx);
			$('#yhlc').html(data.plan_lx_gcgjs[0].yhlc);
			$('#bhnr').html(data.plan_lx_gcgjs[0].bhnr);
			$('#fapgdw').html(data.fapgdw);
			$('#fascdw').html(data.fascdw);
			$('#faspsj').html(data.faspsj);
			$('#spwh').html(data.spwh);
			$('#tzgs').html(data.tzgs);
			$('#jsxz').html(data.jsxz);
			$('#jsnr').html(data.jsnr);
			$('#sbnf').html(data.sbnf);
			$('#jhkgsj').html(data.jhkgsj);
			$('#jhwgsj').html(data.jhwgsj);
			$('#xdsj').html(data.xdsj);
			$('#xmmc').html(data.xmmc);
			$('#yhlb').html(data.yhlb);
			$('#sjdw').html(data.sjdw);
			$('#xmmc').html(data.xmmc);
			$('#yhlb').html(data.yhlb);
			$('#sjdw').html(data.sjdw);
			$('#sjpfdw').html(data.sjpfdw);
			$('#sjlmlx').html(data.sjlmlx);
			$('#dc').html(data.dc);
			$('#jc').html(data.jc);
			$('#mc').html(data.mc);
			$('#lmkd').html(data.lmkd);
			$('#pfwh').html(data.pfwh);
			$('#pfsj').html(data.pfsj);
			$('#pfztz').html(data.pfztz);
			$('#jhsybzje').html(data.jhsybzje);
			$('#jhsydfzcje').html(data.jhsydfzcje);
			$('#sfsqablbz').html(data.sfsqablbz);
			$('#sftqss').html(data.sftqss);
			$('#jhxdwh').html(data.jhxdwh);
			$('#gksjwh').html(data.gksjwh);
			$('#sjpfwh').html(data.sjpfwh);
			$('#sfgyhbm').html(data.sfgyhbm);
			$('#gksjwh').html(data.gksjwh);
			$('#bz').html(data.bz);
		}
	}); 
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
 * queryParams:参数
 */
function gridBind(grid){
	gridObj = $('#'+grid.id).datagrid({
	    url:grid.url,
	    queryParams:grid.queryParams,
	    striped:grid.striped,
	    pagination:grid.pagination,
	    rownumbers:grid.rownumbers,
	    pageNumber:grid.pageNumber,
	    pageSize:grid.pageSize,
	    height:grid.height,
	    width:grid.width,
	    columns:grid.columns,
	    onSelect:grid.onSelect,
	    onClickRow:grid.onClickRow
	});
}