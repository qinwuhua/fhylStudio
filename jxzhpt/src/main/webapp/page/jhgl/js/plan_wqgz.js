var gridObj;//列表对象
var oldIndex=-1;//之前选中的
var selRow=new Array();//已选择的行号
function sbnf(id){
	$('#'+id).combobox({    
	    url:'../../../jhgl/queryWqgzNfs.do',
	    valueField:'text',    
	    textField:'text'   
	}); 
}
function wqxm(jh,lx){
	var params={"jh.sbzt":jh.sbzt,"jh.spzt":jh.spzt,"jh.sbnf":jh.sbnf,"jh.jhkgsj":jh.jhkgsj,
			"jh.jhwgsj":jh.jhwgsj,"jh.pfztz":jh.pfztz,
			"lx.gydw":lx.gydw,"lx.gydwdm":lx.gydwdm,"lx.xzqhmc":lx.xzqhmc,"lx.xzqhdm":lx.xzqhdm,"lx.lxmc":lx.lxmc,
			"lx.qlmc":lx.qlmc,"lx.akjfl":lx.akjfl};
	var grid={id:'grid',url:'../../../jhgl/queryWqgzList.do',pagination:true,rownumbers:false,
		    pageNumber:1,pageSize:10,height:325,width:1070,queryParams:params,
		    columns:[[
		        {field:'ck',checkbox:true},
		        {field:'c',title:'操作',width:150,align:'center',formatter:function(value,row,index){
		        	return '定位    '+'<a href="javascript:openDialog('+"'wqgz_xx','危桥改造项目计划详情','../jhkxx/wqgz.jsp'"+')" style="text-decoration:none;">详细</a>    '+'编辑    '+'删除';
		        }},
		        {field:'c4',title:'计划状态',width:80,align:'center',formatter:function(value,row,index){
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
		        }},
		        {field:'c5',title:'资金追加',width:80,align:'center',formatter:function(value,row,index){
		        	return '资金追加';
		        }},
		        {field:'sbnf',title:'上报年份',width:80,align:'center'},
		        {field:'jhkgsj',title:'计划开工时间',width:100,align:'center'},
		        {field:'jhwgsj',title:'计划完工时间',width:100,align:'center'},
		        {field:'gydw',title:'管养单位',width:150,align:'center',
		        	formatter:function(value, row, index){
		        		return row.jckwqgz.gydw;
		        	}
		        },
		        {field:'xzqhmc',title:'行政区划名称',width:100,align:'center',
		        	formatter:function(value, row, index){
		        		return row.jckwqgz.xzqhmc;
		        	}
		        },
		        {field:'lxbm',title:'路线编码',width:80,align:'center',
		        	formatter:function(value,row,index){
			        	return row.jckwqgz.lxbm;
		        	}
		        },
		        {field:'lxmc',title:'路线名称',width:80,align:'center',
		        	formatter:function(value,row,index){
			        	return row.jckwqgz.lxmc;
		        	}
		        },
		        {field:'qlbm',title:'桥梁编码',width:60,align:'center',
		        	formatter:function(value,row,index){
			        	return row.jckwqgz.qlbh;
		        	}
		       },
		        {field:'qlmc',title:'桥梁名称',width:60,align:'center',
		    	   formatter:function(value,row,index){
			        	return row.jckwqgz.qlmc;
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
function wqxm_sb(jh,lx){
	var params={"jh.sbzt":jh.sbzt,"jh.spzt":jh.spzt,"jh.sbnf":jh.sbnf,"jh.jhkgsj":jh.jhkgsj,
			"jh.jhwgsj":jh.jhwgsj,"jh.pfztz":jh.pfztz,
			"lx.gydw":lx.gydw,"lx.gydwdm":lx.gydwdm,"lx.xzqhmc":lx.xzqhmc,"lx.xzqhdm":lx.xzqhdm,"lx.lxmc":lx.lxmc};
	var grid={id:'grid',url:'../../../jhgl/queryWqgzList.do',pagination:true,rownumbers:false,
		    pageNumber:1,pageSize:10,height:325,width:1070,queryParams:params,
		    columns:[[
		        {field:'ck',checkbox:true},
		        {field:'c',title:'操作',width:150,align:'center',formatter:function(value,row,index){
		        	return '定位    '+'<a href="javascript:openDialog('+"'wqgz_sb','危桥改造项目计划详情','../jhkxx/wqgz.jsp'"+')" style="text-decoration:none;">详细</a>    '+'编辑';
		        }},
		        {field:'sbzt',title:'上报状态',width:80,align:'center',formatter:function(value,row,index){
		        	var result;
		        	if(row.sbzt=="0"){
		        		result="<a>上报</a>"
		        	}else if(row.sbzt=="1"){
		        		result="已上报";
		        	}
		        	return result;
		        }},
		        {field:'sbnf',title:'上报年份',width:80,align:'center'},
		        {field:'jhkgsj',title:'计划开工时间',width:100,align:'center'},
		        {field:'jhwgsj',title:'计划完工时间',width:100,align:'center'},
		        {field:'gydw',title:'管养单位',width:150,align:'center',
		        	formatter:function(value, row, index){
		        		return row.jckwqgz.gydw;
		        	}
		        },
		        {field:'xzqhmc',title:'行政区划名称',width:100,align:'center',
		        	formatter:function(value, row, index){
		        		return row.jckwqgz.xzqhmc;
		        	}
		        },
		        {field:'lxbm',title:'路线编码',width:80,align:'center',
		        	formatter:function(value,row,index){
			        	return row.jckwqgz.lxbm;
		        	}
		        },
		        {field:'lxmc',title:'路线名称',width:80,align:'center',
		        	formatter:function(value,row,index){
			        	return row.jckwqgz.lxmc;
		        	}
		        },
		        {field:'qlbm',title:'桥梁编码',width:60,align:'center',
		        	formatter:function(value,row,index){
			        	return row.jckwqgz.qlbh;
		        	}
		       },
		        {field:'qlmc',title:'桥梁名称',width:60,align:'center',
		    	   formatter:function(value,row,index){
			        	return row.jckwqgz.qlmc;
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
function wqxm_sh(jh,lx){
	var params={"jh.sbzt":jh.sbzt,"jh.spzt":jh.spzt,"jh.sbnf":jh.sbnf,"jh.jhkgsj":jh.jhkgsj,
			"jh.jhwgsj":jh.jhwgsj,"jh.pfztz":jh.pfztz,
			"lx.gydw":lx.gydw,"lx.gydwdm":lx.gydwdm,"lx.xzqhmc":lx.xzqhmc,"lx.xzqhdm":lx.xzqhdm,"lx.lxmc":lx.lxmc};
	var grid={id:'grid',url:'../../../jhgl/queryWqgzList.do',pagination:true,rownumbers:false,
		    pageNumber:1,pageSize:10,height:325,width:1070,queryParams:params,
		    columns:[[
		        {field:'ck',checkbox:true},
		        {field:'c',title:'操作',width:150,align:'center',formatter:function(value,row,index){
		        	return '定位    '+'<a href="javascript:openDialog('+"'wqgz_sh','危桥改造项目计划详情','../jhkxx/wqgz.jsp'"+')" style="text-decoration:none;">详细</a>    '+'编辑';
		        }},
		        {field:'sbzt',title:'审批状态',width:80,align:'center',formatter:function(value,row,index){
		        	var result;
		        	if(row.spzt=="0"){
		        		result="<a>审批</a>"
		        	}else if(row.spzt=="1"){
		        		result="已审批";
		        	}
		        	return result;
		        }},
		        {field:'sbnf',title:'上报年份',width:80,align:'center'},
		        {field:'jhkgsj',title:'计划开工时间',width:100,align:'center'},
		        {field:'jhwgsj',title:'计划完工时间',width:100,align:'center'},
		        {field:'gydw',title:'管养单位',width:150,align:'center',
		        	formatter:function(value, row, index){
		        		return row.jckwqgz.gydw;
		        	}
		        },
		        {field:'xzqhmc',title:'行政区划名称',width:100,align:'center',
		        	formatter:function(value, row, index){
		        		return row.jckwqgz.xzqhmc;
		        	}
		        },
		        {field:'lxbm',title:'路线编码',width:80,align:'center',
		        	formatter:function(value,row,index){
			        	return row.jckwqgz.lxbm;
		        	}
		        },
		        {field:'lxmc',title:'路线名称',width:80,align:'center',
		        	formatter:function(value,row,index){
			        	return row.jckwqgz.lxmc;
		        	}
		        },
		        {field:'qlbm',title:'桥梁编码',width:60,align:'center',
		        	formatter:function(value,row,index){
			        	return row.jckwqgz.qlbh;
		        	}
		       },
		        {field:'qlmc',title:'桥梁名称',width:60,align:'center',
		    	   formatter:function(value,row,index){
			        	return row.jckwqgz.qlmc;
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
function wqxm_zjxd(jh,lx){
	var params={"jh.sbzt":jh.sbzt,"jh.spzt":jh.spzt,"jh.sbnf":jh.sbnf,"jh.jhkgsj":jh.jhkgsj,
			"jh.jhwgsj":jh.jhwgsj,"jh.pfztz":jh.pfztz,
			"lx.gydw":lx.gydw,"lx.gydwdm":lx.gydwdm,"lx.xzqhmc":lx.xzqhmc,"lx.xzqhdm":lx.xzqhdm,"lx.lxmc":lx.lxmc};
	var grid={id:'grid',url:'../../../jhgl/queryWqgzList.do',pagination:true,rownumbers:false,
		    pageNumber:1,pageSize:10,height:325,width:1070,queryParams:params,
		    columns:[[
		        {field:'ck',checkbox:true},
		        {field:'c',title:'操作',width:150,align:'center',formatter:function(value,row,index){
		        	return '定位    '+'<a href="javascript:openDialog('+"'wqgz_zjxd','危桥改造项目计划详情','../jhkxx/wqgz.jsp'"+')" style="text-decoration:none;">详细</a>';
		        }},
		        {field:'zjxf',title:'资金下发',width:80,align:'center',formatter:function(value,row,index){
		        	return '<a href="javascript:openDialog('+"'wqgz_zjxd','危桥改造资金下达','../zjxd/wqgz.jsp'"+')" style=" text-decoration:none;">资金下发</a>';
		        }},
		        {field:'sbzt',title:'建设状态',width:80,align:'center',formatter:function(value,row,index){
		        	return '未开工';
		        }},
		        {field:'sbnf',title:'上报年份',width:80,align:'center'},
		        {field:'jhkgsj',title:'计划开工时间',width:100,align:'center'},
		        {field:'jhwgsj',title:'计划完工时间',width:100,align:'center'},
		        {field:'gydw',title:'管养单位',width:150,align:'center',
		        	formatter:function(value, row, index){
		        		return row.jckwqgz.gydw;
		        	}
		        },
		        {field:'xzqhmc',title:'行政区划名称',width:100,align:'center',
		        	formatter:function(value, row, index){
		        		return row.jckwqgz.xzqhmc;
		        	}
		        },
		        {field:'lxbm',title:'路线编码',width:80,align:'center',
		        	formatter:function(value,row,index){
			        	return row.jckwqgz.lxbm;
		        	}
		        },
		        {field:'lxmc',title:'路线名称',width:80,align:'center',
		        	formatter:function(value,row,index){
			        	return row.jckwqgz.lxmc;
		        	}
		        },
		        {field:'qlbm',title:'桥梁编码',width:60,align:'center',
		        	formatter:function(value,row,index){
			        	return row.jckwqgz.qlbh;
		        	}
		       },
		        {field:'qlmc',title:'桥梁名称',width:60,align:'center',
		    	   formatter:function(value,row,index){
			        	return row.jckwqgz.qlmc;
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