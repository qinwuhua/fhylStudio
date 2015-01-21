var gridObj;//列表对象
var oldIndex=-1;//之前选中的
var selRow=new Array();//已选择的行号
function sbnf(id){
	$('#'+id).combobox({    
	    url:'../../../jhgl/queryZhfaNfs.do',
	    valueField:'text',    
	    textField:'text'   
	}); 
}
function zhfzxm(jh,lx){
	var params={"jh.sbzt":jh.sbzt,"jh.spzt":jh.spzt,"jh.jhnf":jh.jhnf,"jh.jhkgsj":jh.jhkgsj,
			"jh.jhwgsj":jh.jhwgsj,"jh.pfztz":jh.pftz,
			"lx.gydw":lx.gydw,"lx.gydwbm":lx.gydwbm,"lx.xzqhmc":lx.xzqhmc,"lx.xzqhdm":lx.xzqhdm,"lx.lxmc":lx.lxmc};
	var grid={id:'grid',url:'../../../jhgl/queryZhfzList.do',pagination:true,rownumbers:false,
		pageNumber:1,pageSize:10,height:325,width:1000,queryParams:params,
	    columns:[[
	        {field:'ck',checkbox:true},
	        {field:'c',title:'操作',width:150,align:'center',formatter:function(value,row,index){
	        	var result="";
	        	result+='<a style="text-decoration:none;color:#3399CC;">定位</a>    ';
	        	result+='<a href="javascript:openDialog('+"'zhfz_xx','灾害防治项目计划详情','../jhkxx/zhfz.jsp'"+')" style="text-decoration:none;color:#3399CC;">详细</a>    ';
	        	result+='<a href="javascript:openDialog('+"'zhfz_xx','灾害防治项目计划详情','../edit/zhfz.jsp'"+')" style="text-decoration:none;color:#3399CC;">编辑</a>    ';
	        	var id="'"+row.id+"'";
	        	result+='<a href="javascript:dropZhfz('+id+','+"'true'"+')" style="text-decoration:none;color:#3399CC;">删除</a>';
	        	return result;
	        }},
	        {field:'c4',title:'计划状态',width:80,align:'center',formatter:function(value,row,index){
	        	var result;
	        	if(row.sbzt=="0"){
	        		result="未上报";
	        	}else if(row.sbzt=="1" && row.spzt=="0"){
	        		result="上报待审批";
	        	}else if(row.sbzt=="1" && row.spzt=="1"){
	        		result="已审批";
	        	}
	        	return result;
	        }},
	        {field:'c5',title:'资金追加',width:80,align:'center',formatter:function(value,row,index){
	        	return '<a style="text-decoration:none;color:#3399CC;">资金追加</a>';
	        }},
	        {field:'sbnf',title:'上报年份',width:80,align:'center'},
	        {field:'jhkgsj',title:'计划开工时间',width:100,align:'center'},
	        {field:'jhwgsj',title:'计划完工时间',width:100,align:'center'},
	        {field:'gydw',title:'管养单位',width:150,align:'center',
	        	formatter : function(value, row, index) {
					return row.jckzhfz.gydw;
				}
	        },
	        {field:'xzqhmc',title:'行政区划名称',width:100,align:'center',
	        	formatter : function(value, row, index) {
					return row.jckzhfz.xzqhmc;
				}
	        },
	        {field:'lxbm',title:'路线编码',width:80,align:'center',
	        	formatter : function(value, row, index) {
					return row.jckzhfz.lxbm;
				}
	        },
	        {field:'lxmc',title:'路线名称',width:80,align:'center',
	        	formatter : function(value, row, index) {
					return row.jckzhfz.lxmc;
				}
	        },
	        {field:'qdzh',title:'起点桩号',width:60,align:'center',
	        	formatter : function(value, row, index) {
					return row.jckzhfz.qdzh;
				}
	       },
	        {field:'zdzh',title:'止点桩号',width:60,align:'center',
	    	   formatter : function(value, row, index) {
					return row.jckzhfz.zdzh;
				}
	    	},
	        {field:'jsgm',title:'建设规模',width:60,align:'center',
	    		formatter : function(value, row, index) {
					return row.jckzhfz.yhlc;
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
function zhfzxm_sb(jh,lx){
	var params={"jh.sbzt":jh.sbzt,"jh.spzt":jh.spzt,"jh.jhnf":jh.jhnf,"jh.jhkgsj":jh.jhkgsj,
			"jh.jhwgsj":jh.jhwgsj,"jh.pfztz":jh.pftz,
			"lx.gydw":lx.gydw,"lx.gydwbm":lx.gydwbm,"lx.xzqhmc":lx.xzqhmc,"lx.xzqhdm":lx.xzqhdm,"lx.lxmc":lx.lxmc};
	var grid={id:'grid',url:'../../../jhgl/queryZhfzList.do',pagination:true,rownumbers:false,
		pageNumber:1,pageSize:10,height:325,width:1000,queryParams:params,
	    columns:[[
	        {field:'ck',checkbox:true},
	        {field:'c',title:'操作',width:150,align:'center',formatter:function(value,row,index){
	        	var result="";
	        	result+='<a style="text-decoration:none;color:#3399CC;">定位</a>    ';
	        	result+='<a href="javascript:openDialog('+"'zhfz_sb','灾害防治项目计划详情','../jhkxx/zhfz.jsp'"+')" style="text-decoration:none;color:#3399CC;">详细</a>    ';
	        	result+='<a href="javascript:openDialog('+"'zhfz_xx','灾害防治项目计划详情','../edit/zhfz.jsp'"+')" style="text-decoration:none;color:#3399CC;">编辑</a>';
	        	return result;
	        }},
	        {field:'c4',title:'上报状态',width:80,align:'center',formatter:function(value,row,index){
	        	var result;
	        	if(row.sbzt=="0"){
	        		result='<a style="text-decoration:none;color:#3399CC;">上报</a>';
	        	}else if(row.sbzt=="1"){
	        		result="已上报";
	        	}
	        	return result;
	        }},
	        {field:'sbnf',title:'上报年份',width:80,align:'center'},
	        {field:'jhkgsj',title:'计划开工时间',width:100,align:'center'},
	        {field:'jhwgsj',title:'计划完工时间',width:100,align:'center'},
	        {field:'gydw',title:'管养单位',width:150,align:'center',
	        	formatter : function(value, row, index) {
					return row.jckzhfz.gydw;
				}
	        },
	        {field:'xzqhmc',title:'行政区划名称',width:100,align:'center',
	        	formatter : function(value, row, index) {
					return row.jckzhfz.xzqhmc;
				}
	        },
	        {field:'lxbm',title:'路线编码',width:80,align:'center',
	        	formatter : function(value, row, index) {
					return row.jckzhfz.lxbm;
				}
	        },
	        {field:'lxmc',title:'路线名称',width:80,align:'center',
	        	formatter : function(value, row, index) {
					return row.jckzhfz.lxmc;
				}
	        },
	        {field:'qdzh',title:'起点桩号',width:60,align:'center',
	        	formatter : function(value, row, index) {
					return row.jckzhfz.qdzh;
				}
	       },
	        {field:'zdzh',title:'止点桩号',width:60,align:'center',
	    	   formatter : function(value, row, index) {
					return row.jckzhfz.zdzh;
				}
	    	},
	        {field:'jsgm',title:'建设规模',width:60,align:'center',
	    		formatter : function(value, row, index) {
					return row.jckzhfz.yhlc;
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
function zhfzxm_sh(jh,lx){
	var params={"jh.sbzt":jh.sbzt,"jh.spzt":jh.spzt,"jh.jhnf":jh.jhnf,"jh.jhkgsj":jh.jhkgsj,
			"jh.jhwgsj":jh.jhwgsj,"jh.pfztz":jh.pftz,
			"lx.gydw":lx.gydw,"lx.gydwbm":lx.gydwbm,"lx.xzqhmc":lx.xzqhmc,"lx.xzqhdm":lx.xzqhdm,"lx.lxmc":lx.lxmc};
	var grid={id:'grid',url:'../../../jhgl/queryZhfzList.do',pagination:true,rownumbers:false,
		pageNumber:1,pageSize:10,height:325,width:1000,queryParams:params,
	    columns:[[
	        {field:'ck',checkbox:true},
	        {field:'c',title:'操作',width:150,align:'center',formatter:function(value,row,index){
	        	var result="";
	        	result+='<a style="text-decoration:none;color:#3399CC;">定位</a>    ';
	        	result+='<a href="javascript:openDialog('+"'zhfz_sh','灾害防治项目计划详情','../jhkxx/zhfz.jsp'"+')" style="text-decoration:none;color:#3399CC;">详细</a>    ';
	        	result+='<a href="javascript:openDialog('+"'zhfz_xx','灾害防治项目计划详情','../edit/zhfz.jsp'"+')" style="text-decoration:none;color:#3399CC;">编辑</a>';
	        	return result;
	        }},
	        {field:'c4',title:'审批状态',width:80,align:'center',formatter:function(value,row,index){
	        	var result;
	        	if(row.spzt=="0"){
	        		result='<a style="text-decoration:none;color:#3399CC;">审批</a>';
	        	}else if(row.spzt=="1"){
	        		result="已审批";
	        	}
	        	return result;
	        }},
	        {field:'c4',title:'最近年份历史修建记录',width:80,align:'center',formatter:function(value,row,index){
	        	return '有';
	        }},
	        {field:'sbnf',title:'上报年份',width:80,align:'center'},
	        {field:'jhkgsj',title:'计划开工时间',width:100,align:'center'},
	        {field:'jhwgsj',title:'计划完工时间',width:100,align:'center'},
	        {field:'gydw',title:'管养单位',width:150,align:'center',
	        	formatter : function(value, row, index) {
					return row.jckzhfz.gydw;
				}
	        },
	        {field:'xzqhmc',title:'行政区划名称',width:100,align:'center',
	        	formatter : function(value, row, index) {
					return row.jckzhfz.xzqhmc;
				}
	        },
	        {field:'lxbm',title:'路线编码',width:80,align:'center',
	        	formatter : function(value, row, index) {
					return row.jckzhfz.lxbm;
				}
	        },
	        {field:'lxmc',title:'路线名称',width:80,align:'center',
	        	formatter : function(value, row, index) {
					return row.jckzhfz.lxmc;
				}
	        },
	        {field:'qdzh',title:'起点桩号',width:60,align:'center',
	        	formatter : function(value, row, index) {
					return row.jckzhfz.qdzh;
				}
	       },
	        {field:'zdzh',title:'止点桩号',width:60,align:'center',
	    	   formatter : function(value, row, index) {
					return row.jckzhfz.zdzh;
				}
	    	},
	        {field:'jsgm',title:'建设规模',width:60,align:'center',
	    		formatter : function(value, row, index) {
					return row.jckzhfz.yhlc;
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
function zhfzxm_zjxd(jh,lx){
	var params={"jh.sbzt":jh.sbzt,"jh.spzt":jh.spzt,"jh.jhnf":jh.jhnf,"jh.jhkgsj":jh.jhkgsj,
			"jh.jhwgsj":jh.jhwgsj,"jh.pfztz":jh.pftz,
			"lx.gydw":lx.gydw,"lx.gydwbm":lx.gydwbm,"lx.xzqhmc":lx.xzqhmc,"lx.xzqhdm":lx.xzqhdm,"lx.lxmc":lx.lxmc};
	var grid={id:'grid',url:'../../../jhgl/queryZhfzList.do',pagination:true,rownumbers:false,
		pageNumber:1,pageSize:10,height:325,width:1000,queryParams:params,
	    columns:[[
	        {field:'ck',checkbox:true},
	        {field:'c',title:'操作',width:150,align:'center',formatter:function(value,row,index){
	        	var result='';
	        	result+='<a style="text-decoration:none;color:#3399CC;">定位</a>    ';
	        	result+='<a href="javascript:openDialog('+"'zhfz_zjxd','灾害防治项目计划详情','../jhkxx/zhfz.jsp'"+')" style="text-decoration:none;color:#3399CC;">详细</a>';
	        	return result;
	        }},
	        {field:'zjxf',title:'资金下发',width:80,align:'center',formatter:function(value,row,index){
	        	return '<a href="javascript:openDialog('+"'zhfz_zjxd','灾害防治项目计划详情','../zjxd/zhfz.jsp'"+')" style="text-decoration:none;color:#3399CC;">资金下发</a>';
	        }},
	        {field:'c4',title:'建设状态',width:80,align:'center',formatter:function(value,row,index){
	        	return '未开工';
	        }},
	        {field:'c4',title:'最近年份历史修建记录',width:80,align:'center',formatter:function(value,row,index){
	        	return '有';
	        }},
	        {field:'sbnf',title:'上报年份',width:80,align:'center'},
	        {field:'jhkgsj',title:'计划开工时间',width:100,align:'center'},
	        {field:'jhwgsj',title:'计划完工时间',width:100,align:'center'},
	        {field:'gydw',title:'管养单位',width:150,align:'center',
	        	formatter : function(value, row, index) {
					return row.jckzhfz.gydw;
				}
	        },
	        {field:'xzqhmc',title:'行政区划名称',width:100,align:'center',
	        	formatter : function(value, row, index) {
					return row.jckzhfz.xzqhmc;
				}
	        },
	        {field:'lxbm',title:'路线编码',width:80,align:'center',
	        	formatter : function(value, row, index) {
					return row.jckzhfz.lxbm;
				}
	        },
	        {field:'lxmc',title:'路线名称',width:80,align:'center',
	        	formatter : function(value, row, index) {
					return row.jckzhfz.lxmc;
				}
	        },
	        {field:'qdzh',title:'起点桩号',width:60,align:'center',
	        	formatter : function(value, row, index) {
					return row.jckzhfz.qdzh;
				}
	       },
	        {field:'zdzh',title:'止点桩号',width:60,align:'center',
	    	   formatter : function(value, row, index) {
					return row.jckzhfz.zdzh;
				}
	    	},
	        {field:'jsgm',title:'建设规模',width:60,align:'center',
	    		formatter : function(value, row, index) {
					return row.jckzhfz.yhlc;
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
function queryZhfzById(id){
	$.ajax({
		type:'post',
		url:'../../../jhgl/queryZhfzById.do',
		dataType:'json',
		data:'jh.id='+id,
		success:function(data){
			$.ajax({
				type : 'post',
				url : '../../../xmjck/selectZhfzById.do',
				data :"id="+data.sck_zhfz_id,
				dataType:'json',
				success:function(jcAndSc){
					if(jcAndSc!=null){
						//基础库
						$('#lxmc').html(jcAndSc.lxmc);
						$('#lxbm').html(jcAndSc.lxbm);
						$('#gydw').html(jcAndSc.gydw);
						$('#qdzh').html(jcAndSc.qdzh);
						$('#zdzh').html(jcAndSc.zdzh);
						$('#zlc').html(jcAndSc.zlc);
						$('#xzqhdm').html(jcAndSc.xzqhdm);
						$('#xzqhmc').html(jcAndSc.xzqhmc);
						$('#xjnd').html(jcAndSc.xjnd);
						$('#lxjsdjxx').html(jcAndSc.lxjsdj);
						$('#yhlc').html(jcAndSc.yhlc);
						$('#tsdq').html(jcAndSc.tsdq);
						$('#xmnf').html(jcAndSc.xmnf);
						$('#xmzt').html(jcAndSc.xmzt);
						$('#zhnr').html(jcAndSc.zhnr);
						$('#bz').html(jcAndSc.bz);
						//审查库
						$('#SCQDZH').html(jcAndSc.scqdzh);
						$('#SCZDZH').html(jcAndSc.sczdzh);
						$('#SCZLC').html(jcAndSc.sczlc);
						$('#SCYHLC').html(jcAndSc.scyhlc);
						$('#FAPGDW').html(jcAndSc.fapgdw);
						$('#FASCDW').html(jcAndSc.fascdw);
						$('#FASPSJ').html(jcAndSc.faspsj);
						$('#SPWH').html(jcAndSc.spwh);
						$('#TZGS').html(jcAndSc.tzgs);
						$('#JSXZ').html(jcAndSc.jsxz);
						$('#JSNR').html(jcAndSc.jsnr);
						$('#scbz').html(jcAndSc.scbz);
					}
				}
			});
			//计划信息
			$('#jhnf').html(data.sbnf);
			$('#jhkgsj').html(data.jhkgsj);
			$('#jhwgsj').html(data.jhwgsj);
			$('#jhxdsj').html(data.xdsj);
			$('#jhxdwh').html(data.jhxdwh);
			$('#sjdw').html(data.sjdw);
			$('#sjpfdw').html(data.sjpfdw);
			$('#pfwh').html(data.pfwh);
			$('#pfsj').html(data.pfsj);
			$('#jhztz').html(data.pfztz);
			$('#bbz').html(data.jhsybzje);
			$('#dfzc').html(data.jhsydfzcje);
			$('#sfsqablbz').html(data.sfsqablbz);
			$('#ablbzwh').html(data.ablbzsqwh);
			$('#jhbz').html(data.bz);
		}
	});
}
function openAddZhfz(){
	openAdd('zhfz_add','添加安保工程项目','../add/zhfzAdd.jsp');
}
function dropZhfz(id,readLoad){
		$.ajax({
			type:'post',
			url:'../../../jhgl/dropZhfzById.do',
			dataType:'text',
			data:'jh.id='+id,
			success:function(data){
				var params={"jh.sbzt":null,"jh.spzt":null,"jh.jhnf":null,"jh.jhkgsj":null,
						"jh.jhwgsj":null,"jh.pfztz":null,"lx.gydw":null,"lx.gydwdm":null,
						"lx.xzqhmc":null,"lx.xzqhdm":null,"lx.lxmc":null};
				if(readLoad=="true"){
					alert("删除成功！");
					gridObj.datagrid("reload",params);
				}
			},
			error:function(){
				alert("删除失败！");
			}
		});
}
function dropZhfzs(){
	if(confirm("确认要删除选中计划？")){
		var sel=gridObj.datagrid("getSelections");
		$.each(sel,function(index,item){
			dropZhfz(item.id, "false");
		});
		alert("删除成功！");
		var params={"jh.sbzt":null,"jh.spzt":null,"jh.jhnf":null,"jh.jhkgsj":null,
				"jh.jhwgsj":null,"jh.pfztz":null,"lx.gydw":null,"lx.gydwdm":null,
				"lx.xzqhmc":null,"lx.xzqhdm":null,"lx.lxmc":null};
		gridObj.datagrid("reload",params);
	}
}
function editZhfz(){
	var jh={'jh.id':$('#jhid').val(),
			'jh.sbnf':$('#editjhnf').combobox('getValue'),
			'jh.jhkgsj':$('#jhkgsj').datebox('getValue'),
			'jh.jhwgsj':$('#jhwgsj').datebox('getValue'),
			'jh.xdsj':$('#jhxdsj').datebox('getValue'),
			'jh.jhxdwh':$('#jhxdwh').val(),
			'jh.sjdw':$('#sjdw').val(),
			'jh.sjpfdw':$('#sjpfdw').val(),
			'jh.pfwh':$('#pfwh').val(),
			'jh.pfsj':$('#pfsj').datebox('getValue'),
			'jh.pfztz':$('#jhztz').val(),
			'jh.jhsybzje':$('#bbz').val(),
			'jh.jhsydfzcje':$('#zfzc').val(),
			'jh.sfsqablbz':$('#sfsqablbz').val(),
			'jh.ablbzsqwh':$('#ablbzwh').val(),
			'jh.bz':$('#jhbz').val()
	};
	$.ajax({
		type:'post',
		url:'../../../jhgl/editZhfzById.do',
		dataType:'text',
		data:jh,
		success:function(data){
			alert("修改成功！");
			$('#zhfz_xx').dialog('close');
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
	$('#'+grid.id).datagrid('resize',{width:$("body").width()*0.97});
}