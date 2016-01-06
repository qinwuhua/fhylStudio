var gridObj;//列表对象
var oldIndex=-1;//之前选中的
var selRow=new Array();//已选择的行号
function queryZjqf(nf){
	$.ajax({
		type:'post',
		async:false,
		url:'../../../jhgl/queryZjqfByZjqf.do',
		data:zjqf={'zjqf.gydwbm':$.cookie("unit"),'zjqf.nf':nf},
		dataType:'json',
		success:function(data){
			if(data!=null){
				$('#lblQfzj').html(data.wqgz);
			}else{
				$('#lblQfzj').html("0");
			}
		}
	});
}
function querySumWqgz(jh,lx){
	var param={"jh.sbzt":jh.sbzt,"jh.spzt":jh.spzt,"jh.sbnf":jh.jhnf,
			'jh.jh_sbthcd':jh.jh_sbthcd,
			"lx.gydwbm":lx.gydwbm,"lx.xzqhdm":lx.xzqhdm,"lx.lxmc":lx.lxmc,
			"lx.lxbm":lx.lxbm,"lx.sdmc":lx.sdmc,"lx.sddm":lx.sddm,"lx.acdfl":lx.acdfl,"lx.jsdj":lx.jsdj,"lx.tbbmbm":$.cookie("unit2"),
			"jh.shFlag":jh.shFlag,"jh.jh_sdzt":jh.jh_sdzt};
	$.ajax({
		type:'post',
		url:'/jxzhpt/jhgl/querySumBhsd.do',
		data:param,
		dataType:'json',
		success:function(data){
			if(data.id>0){
				$('#lblCount').html(data.id);
				if(data.pfztz!=null && data.pfztz!="")
					$('#lblZTZ').html(data.pfztz);
				if(data.jhsybzje!=null && data.jhsybzje!="")
					$('#lblBTZ').html(data.jhsybzje);
				if(data.jhsydfzcje!=null && data.jhsydfzcje!="")
					$('#lblDFTZ').html(data.jhsydfzcje);
			}else{
				$('#lblCount').html("0");
				$('#lblZTZ').html("0");
				$('#lblBTZ').html("0");
				$('#lblDFTZ').html("0");
			}
		}
	});
}

function sbnf(id){
	var myDate = new Date();
	var years=[];
	var first;
	for(var i=0;i<=10;i++){
		if(i==0)
			first=myDate.getFullYear()-i;
		years.push({text:(myDate.getFullYear()-i)});
	}
	$('#'+id).combobox({    
	    data:years,
	    valueField:'text',    
	    textField:'text'   
	});
	$('#'+id).combobox("setValue",first);
}

function openWindow(id){
	YMLib.Var.jhbm=id;
	YMLib.UI.createWindow('wq_xx','病害隧道',"/jxzhpt/page/jhgl/jhkxx/bhsd.jsp",'wq_xx',1000,500);
}
function viewJhkxx(id,tzType){
	YMLib.Var.jhbm=id;
	YMLib.Var.tzType=tzType;
	YMLib.UI.createWindow('wq_xx','病害隧道',"/jxzhpt/page/jhgl/jhkxx/bhsd.jsp",'wq_xx',1000,500);
}

function openEditWindow(id){
	YMLib.Var.jhbm=id;
	YMLib.UI.createWindow('wq_edit','病害隧道',"/jxzhpt/page/jhgl/edit/bhsd.jsp",'wq_edit',1000,500);
}
function openZjxdWindow(id){
	YMLib.Var.jhbm=id;
	YMLib.UI.createWindow('zjxd_bhsd','病害隧道资金下达',"/jxzhpt/page/jhgl/zjxd/bhsd.jsp",'zjxd_bhsd',1000,500);
}
function wqxm(jh,lx){
	var params={"jh.sbzt":jh.sbzt,"jh.spzt":jh.spzt,"jh.sbnf":jh.jhnf,
			'jh.jh_sbthcd':jh.jh_sbthcd,
			"lx.gydwbm":lx.gydwbm,"lx.xzqhdm":lx.xzqhdm,"lx.lxmc":lx.lxmc,
			"lx.lxbm":lx.lxbm,"lx.sdmc":lx.sdmc,"lx.sddm":lx.sddm,"lx.acdfl":lx.acdfl,"lx.jsdj":lx.jsdj,
			"lx.tbbmbm":$.cookie("unit2"),"jh.shFlag":jh.shFlag,"jh.jh_sdzt":jh.jh_sdzt};
	var grid={
	        id:'grid',
	        url:'/jxzhpt/jhgl/queryBhsdList.do',
			pagination:true,
			rownumbers:false,
		    pageNumber:1,
		    pageSize:10,
		    height:$(window).height()-180,
		    width:$('#searchField').width(),
		    queryParams:params,
		    columns:[[
		        {field:'ck',checkbox:true},
		        {field:'c',title:'操作',width:150,align:'center',formatter:function(value,row,index){
		        	var result='<a href="javascript:locationXm('+"'"+row.sddm+"',"+"'"+row.sdzxzh+"'"+')" style="text-decoration:none;color:#3399CC;">定位</a>    ';
		        	result+='<a href="javascript:openWindow('+"'"+row.id+"'"+')" style="text-decoration:none;color:#3399CC;">详细</a>    ';
		        	if((roleName()=="县级" && row.jh_sbthcd==11 && (row.spzt==''||row.spzt==null||row.spzt=='0')) 
		        			|| (roleName()=="市级" && row.jh_sbthcd==9 && (row.spzt==''||row.spzt==null||row.spzt=='0')) 
		        			|| (roleName()=="省级" && row.jh_sbthcd==7 && (row.spzt==''||row.spzt==null||row.spzt=='0'))){
		        		result+='<a href="javascript:openEditWindow('+"'"+row.id+"'"+')" style="text-decoration:none;color:#3399CC;">编辑</a>    ';
			        	result+='<a href="javascript:dropWqgzs1('+"'"+row.id+"'"+",'"+row.sckid+"'"+')" style="text-decoration:none;color:#3399CC;">删除</a>';
		        	}else{
		        		result+='<a style="text-decoration:none;color:black;">编辑</a>    ';
			        	result+='<a style="text-decoration:none;color:black;">删除</a>';
		        	}
		        	
		        	return result;
		        }},
//		        {field:'c4',title:'计划状态',width:80,align:'center',formatter:function(value,row,index){
//		        	var result="";
//		        	if(row.sbzt=="0"&& $.cookie("unit2").length!=7){
//		        		if(row.jh_thyj==""||row.jh_thyj==null){
//		        		result='<a href=javascript:shangB1("'+row.id+'","'+row.sbzt+'"); style="text-decoration:none;color:#3399CC; ">未上报</a>  ';
//		        		}else {
//		        			result='<a href=javascript:shangB1("'+row.id+'","'+row.sbzt+'"); style="text-decoration:none;color:#3399CC; " title="退回意见：'+row.jh_thyj+'">未上报(退回)</a>  ';	
//						}
//		        		}
//		        	else if(row.sbzt=="0"&& $.cookie("unit2").length==7){
//		        		result="未上报";
//		        	}
//		        	else if(row.sbzt=="1"){result="已上报";}
//					return result;
//		        }},
//		        {field:'spzt',title:'审批状态',width:80,align:'center',formatter:function(value,row,index){
//		        	var result="";
//		        	if(row.spzt==''|| row.spzt==null||row.spzt=='0'){result="未审核";}
//		        	else if(row.spzt=='1'){result="已审核";}
//					return result;
//		        }},
//		        {field:'c5',title:'资金追加',width:80,align:'center',formatter:function(value,row,index){
//		        	var id="'"+row.id+"'";
//	        		return '<a href="javascript:openZjzjWindow('+"'grid','editBhZj'"+')" style="text-decoration:none;color:#3399CC;">资金追加</a>';
//		        }},
//		        {field:'sfylsjl',title:'是否有修建记录',width:80,align:'center',formatter:function(value,row,index){
//		        	if(row.sfylsjl=='无')
//		        		return '无';
//		        	else if(row.sfylsjl=='有')
//		        		return '有';
//		        }},
		        {field:'sbnf',title:'计划年份',width:80,align:'center'},
		        {field:'gydw',title:'管养单位',width:150,align:'center',
		        	formatter:function(value, row, index){
		        		return row.gydw;
		        	}
		        },
		        {field:'xzqhmc',title:'行政区划名称',width:100,align:'center',
		        	formatter:function(value, row, index){
		        		return row.xzqhmc;
		        	}
		        },
		        {field:'lxbm',title:'路线编码',width:80,align:'center',
		        	formatter:function(value,row,index){
			        	return row.lxbm;
		        	}
		        },
		        {field:'lxmc',title:'路线名称',width:80,align:'center',
		        	formatter:function(value,row,index){
			        	return row.lxmc;
		        	}
		        },
		        {field:'sddm',title:'隧道代码',width:60,align:'center',
		        	formatter:function(value,row,index){
			        	return row.sddm;
		        	}
		       },
		        {field:'qlmc',title:'隧道名称',width:60,align:'center',
		    	   formatter:function(value,row,index){
			        	return row.sdmc;
		        	}
		    	},
		        {field:'pfztz',title:'批复总投资',width:80,align:'center'},
		        {field:'jhkgsj',title:'计划开工时间',width:100,align:'center'},
		        {field:'jhwgsj',title:'计划完工时间',width:100,align:'center'}
		    ]],
		    onClickRow:function(rowIndex,rowDate){
				if(oldIndex!=-1){
					gridObj.datagrid("unselectRow",oldIndex);
				}
				selRow.push(rowIndex);
				gridObj.datagrid("selectRow",rowIndex);
				oldIndex=rowIndex;
			},
			onLoadSuccess:function(data){
				querySumWqgz(jh,lx);
			}
	};
	gridBind(grid);
}

function wqxm_sb(jh,lx){
	var params={"jh.sbzt":jh.sbzt,"jh.spzt":jh.spzt,"jh.sbnf":jh.jhnf,
			'jh.jh_sbthcd':jh.jh_sbthcd,
			"lx.gydwbm":lx.gydwbm,"lx.xzqhdm":lx.xzqhdm,"lx.lxmc":lx.lxmc,
			"lx.lxbm":lx.lxbm,"lx.sdmc":lx.sdmc,"lx.sddm":lx.sddm,"lx.acdfl":lx.acdfl,"lx.jsdj":lx.jsdj,
			"lx.tbbmbm":$.cookie("unit2"),"jh.shFlag":jh.shFlag,"jh.jh_sdzt":jh.jh_sdzt};
	
	var grid={id:'grid',
			  url:'../../../jhgl/queryBhsdList.do',
			  pagination:true,
			  rownumbers:false,
		      pageNumber:1,
		      pageSize:10,
		      height:$(window).height()-180,
		      width:$('#searchField').width(),
		      queryParams:params,
		      columns:[[
                {field:'ck',checkbox:true},
		        {field:'c',title:'操作',width:150,align:'center',formatter:function(value,row,index){
		        	var result='<a href="javascript:locationXm('+"'"+row.sddm+"',"+"'"+row.sdzxzh+"'"+')" style="text-decoration:none;color:#3399CC;">定位</a>    ';
		        	result+='<a href="javascript:openWindow('+"'"+row.id+"'"+')" style="text-decoration:none;color:#3399CC;">详细</a>    ';
		        	if((roleName()=="县级" && row.jh_sbthcd==11 && (row.spzt==''||row.spzt==null||row.spzt=='0')) 
		        			|| (roleName()=="市级" && row.jh_sbthcd==9 && (row.spzt==''||row.spzt==null||row.spzt=='0')) 
		        			|| (roleName()=="省级" && row.jh_sbthcd==7 && (row.spzt==''||row.spzt==null||row.spzt=='0'))){
		        		result+='<a href="javascript:openEditWindow('+"'"+row.id+"'"+')" style="text-decoration:none;color:#3399CC;">编辑</a>    ';
			        	result+='<a href="javascript:dropWqgzs1('+"'"+row.id+"'"+",'"+row.sckid+"'"+')" style="text-decoration:none;color:#3399CC;">删除</a>';
		        	}else{
		        		result+='<a style="text-decoration:none;color:black;">编辑</a>    ';
			        	result+='<a style="text-decoration:none;color:black;">删除</a>';
		        	}
		        	
		        	return result;
		        }},
		        {field:'c4',title:'计划状态',width:80,align:'center',formatter:function(value,row,index){
		        	var result="";
		        	if(row.sbzt=="0"&& $.cookie("unit2").length!=7){
		        		if(row.jh_thyj==""||row.jh_thyj==null){
		        		result='<a href=javascript:shangB1("'+row.id+'","'+row.sbzt+'"); style="text-decoration:none;color:#3399CC; ">未上报</a>  ';
		        		}else {
		        			result='<a href=javascript:shangB1("'+row.id+'","'+row.sbzt+'"); style="text-decoration:none;color:#3399CC; " title="退回意见：'+row.jh_thyj+'">未上报(退回)</a>  ';	
						}
		        		}
		        	else if(row.sbzt=="0"&& $.cookie("unit2").length==7){
		        		result="未上报";
		        	}
		        	else if(row.sbzt=="1"){result="已上报";}
					return result;
		        }},
		        {field:'spzt',title:'审批状态',width:80,align:'center',formatter:function(value,row,index){
		        	var result="";
		        	if(row.spzt==''|| row.spzt==null||row.spzt=='0'){result="未审核";}
		        	else if(row.spzt=='1'){result="已审核";}
					return result;
		        }},
		        {field:'sbnf',title:'计划年份',width:80,align:'center'},
		        {field:'gydw',title:'管养单位',width:150,align:'center',
		        	formatter:function(value, row, index){
		        		return row.gydw;
		        	}
		        },
		        {field:'xzqhmc',title:'行政区划名称',width:100,align:'center',
		        	formatter:function(value, row, index){
		        		return row.xzqhmc;
		        	}
		        },
		        {field:'lxbm',title:'路线编码',width:80,align:'center',
		        	formatter:function(value,row,index){
			        	return row.lxbm;
		        	}
		        },
		        {field:'lxmc',title:'路线名称',width:80,align:'center',
		        	formatter:function(value,row,index){
			        	return row.lxmc;
		        	}
		        },
		        {field:'sddm',title:'隧道代码',width:60,align:'center',
		        	formatter:function(value,row,index){
			        	return row.sddm;
		        	}
		       },
		        {field:'qlmc',title:'隧道名称',width:60,align:'center',
		    	   formatter:function(value,row,index){
			        	return row.sdmc;
		        	}
		    	},
		        {field:'pfztz',title:'批复总投资',width:80,align:'center'},
		        {field:'jhkgsj',title:'计划开工时间',width:100,align:'center'},
		        {field:'jhwgsj',title:'计划完工时间',width:100,align:'center'}
		    ]],
		    onClickRow:function(rowIndex,rowDate){
				if(oldIndex!=-1){
					gridObj.datagrid("unselectRow",oldIndex);
				}
				selRow.push(rowIndex);
				gridObj.datagrid("selectRow",rowIndex);
				oldIndex=rowIndex;
			},
			onLoadSuccess:function(data){
				querySumWqgz(jh,lx);
			}
	};
	gridBind(grid);
}

function wqxm_sh(jh,lx){
	var params={"jh.sbzt":jh.sbzt,"jh.spzt":jh.spzt,"jh.sbnf":jh.jhnf,
			'jh.jh_sbthcd':jh.jh_sbthcd,
			"lx.gydwbm":lx.gydwbm,"lx.xzqhdm":lx.xzqhdm,"lx.lxmc":lx.lxmc,
			"lx.lxbm":lx.lxbm,"lx.sdmc":lx.sdmc,"lx.acdfl":lx.acdfl,"lx.jsdj":lx.jsdj,
			"lx.tbbmbm":$.cookie("unit2"),"jh.shFlag":jh.shFlag,"jh.jh_sdzt":jh.jh_sdzt};
	
	var grid={id:'grid',url:'../../../jhgl/queryBhsdList.do',pagination:true,rownumbers:false,
		    pageNumber:1,pageSize:10,height:$(window).height()-180,width:$('#searchField').width(),queryParams:params,
		    columns:[[
		        {field:'allSel',title:'全选',width:60,align:'center',checkbox:'true'},
		        {field:'c',title:'操作',width:150,align:'center',formatter:function(value,row,index){
		        	var result='<a href="javascript:locationXm('+"'"+row.sddm+"',"+"'"+row.sdzxzh+"'"+')" style="text-decoration:none;color:#3399CC;">定位</a>    ';
		        	result+='<a href="javascript:openWindow('+"'"+row.id+"'"+')" style="text-decoration:none;color:#3399CC;">详细</a>    ';
		        	if(row.jh_sbthcd==7 &&
		        			(row.spzt=="0" || row.spzt=='' || row.spzt==null))
		        		result+='<a href="javascript:openEditWindow('+"'"+row.id+"'"+')" style="text-decoration:none;color:#3399CC;">编辑</a>';
		        	else
		        		result+='<a style="text-decoration:none;color:black;">编辑</a>'+
		        			'    <a href=javascript:tzPlanbhsd("'+row.id+'") style="text-decoration:none;color:#3399CC; ">调整</a>  ';
		        	return result;
		        }},
		        {field:'sbzt',title:'审批状态',width:80,align:'center',formatter:function(value,row,index){
		        	var result;
		        	if((row.spzt=="0" || row.spzt=='' || row.spzt==null) 
		        			&& row.jh_sbthcd==7){
		        		result='<a href="javascript:sp('+"'"+row.id+"'"+','+row.jh_sbthcd+')" style="text-decoration:none;color:#3399CC;">审批</a>';
//		        		result+='<a href=javascript:th_jhksh("bhsd_th.jsp","500","200"); style="text-decoration:none;color:#3399CC;">退回</a>';
		        	}else if(row.spzt=="1"){
		        		result="已审批";
		        	}else{
		        		result='<a style="text-decoration:none;color:black;">审批</a>';
//		        		result+='<a  style="text-decoration:none;color:black;">退回</a>';
		        	}
		        	return result;
		        }},
//		        {field:'sfylsjl',title:'是否有修建记录',width:80,align:'center',formatter:function(value,row,index){
//		        	if(row.sfylsjl=='无')
//		        		return '无';
//		        	else if(row.sfylsjl=='有')
//		        		return '有';
//		        }},
		        {field:'sbnf',title:'计划年份',width:80,align:'center'},
		        {field:'jhkgsj',title:'计划开工时间',width:100,align:'center'},
		        {field:'jhwgsj',title:'计划完工时间',width:100,align:'center'},
		        {field:'gydw',title:'管养单位',width:150,align:'center',
		        	formatter:function(value, row, index){
		        		return row.gydw;
		        	}
		        },
		        {field:'xzqhmc',title:'行政区划名称',width:100,align:'center',
		        	formatter:function(value, row, index){
		        		return row.xzqhmc;
		        	}
		        },
		        {field:'lxbm',title:'路线编码',width:80,align:'center',
		        	formatter:function(value,row,index){
			        	return row.lxbm;
		        	}
		        },
		        {field:'lxmc',title:'路线名称',width:80,align:'center',
		        	formatter:function(value,row,index){
			        	return row.lxmc;
		        	}
		        },
		        {field:'sddm',title:'隧道代码',width:60,align:'center',
		        	formatter:function(value,row,index){
			        	return row.sddm;
		        	}
		       },
		        {field:'sdmc',title:'隧道名称',width:60,align:'center',
		    	   formatter:function(value,row,index){
			        	return row.sdmc;
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
			},
			onLoadSuccess:function(data){
				querySumWqgz(jh,lx);
			}
	};
	gridBind(grid);
}

function wqxm_sd(jh,lx){
	var params={"jh.sbzt":jh.sbzt,"jh.spzt":jh.spzt,"jh.sbnf":jh.jhnf,"jh.jhkgsj":jh.jhkgsj,
			'jh.jh_sbthcd':jh.jh_sbthcd,
			"lx.gydwbm":lx.gydwbm,"lx.xzqhdm":lx.xzqhdm,"lx.lxmc":lx.lxmc,
			"lx.lxbm":lx.lxbm,"lx.sdmc":lx.sdmc,"lx.acdfl":lx.acdfl,"lx.jsdj":lx.jsdj,
			"lx.tbbmbm":$.cookie("unit2"),"jh.shFlag":jh.shFlag,"jh.jh_sdzt":jh.jh_sdzt};
	
	var grid={id:'grid',url:'../../../jhgl/queryBhsdList.do',pagination:true,rownumbers:false,
		    pageNumber:1,pageSize:10,height:$(window).height()-180,width:$('#searchField').width(),queryParams:params,
		    columns:[[
//		        {field:'allSel',title:'全选',width:60,align:'center',checkbox:'true'},
		        {field:'c',title:'操作',width:150,align:'center',formatter:function(value,row,index){
		        	var result='<a href="javascript:locationXm('+"'"+row.sddm+"',"+"'"+row.sdzxzh+"'"+')" style="text-decoration:none;color:#3399CC;">定位</a>    ';
		        	result+='<a href="javascript:openWindow('+"'"+row.id+"'"+')" style="text-decoration:none;color:#3399CC;">详细</a>    ';
		        	return result;
		        }},
		        {field:'c4',title:'审定状态',width:80,align:'center',formatter:function(value,row,index){
		        	var result;
		        	if((row.jh_sdzt=='0' || row.jh_sdzt=='' || row.jh_sdzt==null)){
		        		result='未审定';
		        	}else{
		        		result="已审定";
		        	}
		        	return result;
		        }},
//		        {field:'sfylsjl',title:'是否有修建记录',width:80,align:'center',formatter:function(value,row,index){
//		        	if(row.sfylsjl=='无')
//		        		return '无';
//		        	else if(row.sfylsjl=='有')
//		        		return '有';
//		        }},
		        {field:'sbnf',title:'计划年份',width:80,align:'center'},
		        {field:'jhkgsj',title:'计划开工时间',width:100,align:'center'},
		        {field:'jhwgsj',title:'计划完工时间',width:100,align:'center'},
		        {field:'gydw',title:'管养单位',width:150,align:'center',
		        	formatter:function(value, row, index){
		        		return row.gydw;
		        	}
		        },
		        {field:'xzqhmc',title:'行政区划名称',width:100,align:'center',
		        	formatter:function(value, row, index){
		        		return row.xzqhmc;
		        	}
		        },
		        {field:'lxbm',title:'路线编码',width:80,align:'center',
		        	formatter:function(value,row,index){
			        	return row.lxbm;
		        	}
		        },
		        {field:'lxmc',title:'路线名称',width:80,align:'center',
		        	formatter:function(value,row,index){
			        	return row.lxmc;
		        	}
		        },
		        {field:'sddm',title:'隧道代码',width:60,align:'center',
		        	formatter:function(value,row,index){
			        	return row.sddm;
		        	}
		       },
		        {field:'sdmc',title:'隧道名称',width:60,align:'center',
		    	   formatter:function(value,row,index){
			        	return row.sdmc;
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
			},
			onLoadSuccess:function(data){
				querySumWqgz(jh,lx);
			}
	};
	gridBind(grid);
}

function wqxm_zjxd(jh,lx){
	var params={"jh.kgzt":jh.kgzt,"jh.jgzt":jh.jgzt,"jh.sbnf":jh.jhnf,"jh.jhkgsj":jh.jhkgsj,
			'jh.sfylsjl':jh.sfylsjl,'jh.jh_sbthcd':jh.jh_sbthcd,
			"lx.gydwbm":lx.gydwbm,"lx.xzqhdm":lx.xzqhdm,"lx.lxmc":lx.lxmc,
			"lx.lxbm":lx.lxbm,"lx.qlmc":lx.qlmc,"lx.akjfl":lx.akjfl};
	
	var grid={id:'grid',
			url:'../../../jhgl/queryBhsdList.do',
			pagination:true,
			rownumbers:false,
		    pageNumber:1,
		    pageSize:10,
		    height:$(window).height()-158,
		    width:$('#searchField').width(),
		    queryParams:params,
		    columns:[[
		        {field:'c',title:'操作',width:150,align:'center',formatter:function(value,row,index){
		        	var result='<a href="javascript:locationXm('+"'"+row.sddm+"',"+"'"+row.sdzxzh+"'"+')" style="text-decoration:none;color:#3399CC;">定位</a>    ';
		        	result+='<a href="javascript:openWindow('+"'"+row.id+"'"+')" style="text-decoration:none;color:#3399CC;">详细</a>';
		        	return result;
		        }},
		        {field:'zjxf',title:'资金下发',width:80,align:'center',formatter:function(value,row,index){
		        	return '<a href="javascript:openDialog('+"'zjxd_bhsd','病害隧道资金下达','../zjxd/bhsd.jsp'"+')" style=" text-decoration:none;color:#3399CC;">资金下发</a>';
		        }},
		        {field:'kgzt',title:'建设状态',width:80,align:'center',
		        	formatter:function(value,row,index){
		        		if(row.kgzt=='0' && row.jgzt=='0')
		        			return '未开工';
		        		else if(row.kgzt=='1' && row.jgzt=='0')
		        			return '在建';
		        		else if(row.kgzt=='1' && row.jgzt=='1')
		        			return '竣工';
		        	}
		        },
//		        {field:'sfylsjl',title:'是否有修建记录',width:80,align:'center',formatter:function(value,row,index){
//		        	if(row.sfylsjl=='无')
//		        		return '无';
//		        	else if(row.sfylsjl=='有')
//		        		return '有';
//		        }},
		        {field:'sbnf',title:'计划年份',width:80,align:'center'},
		        {field:'gydw',title:'管养单位',width:150,align:'center',
		        	formatter:function(value, row, index){
		        		return row.gydw;
		        	}
		        },
		        {field:'xzqhmc',title:'行政区划名称',width:100,align:'center',
		        	formatter:function(value, row, index){
		        		return row.xzqhmc;
		        	}
		        },
		        {field:'lxbm',title:'路线编码',width:80,align:'center',
		        	formatter:function(value,row,index){
			        	return row.lxbm;
		        	}
		        },
		        {field:'lxmc',title:'路线名称',width:80,align:'center',
		        	formatter:function(value,row,index){
			        	return row.lxmc;
		        	}
		        },
		        {field:'sddm',title:'隧道代码',width:60,align:'center',
		        	formatter:function(value,row,index){
			        	return row.sddm;
		        	}
		       },
		        {field:'qlmc',title:'隧道名称',width:60,align:'center',
		    	   formatter:function(value,row,index){
			        	return row.sdmc;
		        	}
		    	},
		        {field:'pfztz',title:'批复总投资',width:80,align:'center'},
		        {field:'jhkgsj',title:'计划开工时间',width:100,align:'center'},
		        {field:'jhwgsj',title:'计划完工时间',width:100,align:'center'}
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

function queryWqgzById(id){
	$.ajax({
		url:'../../../jhgl/queryBhsdById.do',
		data:"jh.id="+id,
		dataType:'json',
		success:function(data){
			//计划
			$("#jhid").val(data.id);
			$('#jhnf').html(data.jhnf);
			$('#jhkgsj').html(data.jhkgsj);
			$('#jhwgsj').html(data.jhwgsj);
			$('#jhztz').html(data.pfztz);
			$('#bbz').html(data.jhsybzje);
			$('#zfzc').html(data.jhsydfzcje);
			$('#qtzj').html(data.qtzj);
			$('#zczjyls').html(data.zczjyls);
			$('#JHRemarks').html(data.bz);
			if(data.gkbgmc!=''){
				$('#xz_gkbg').html("<a href='#' onclick='downFile1()' style='text-decoration:none;color:#3399CC;'>"+data.gkbgmc+"</a>");
			}
			if(data.sjsgtmc!=''){
				$("#xz_sjsgt").html("<a href='#' onclick='downFile2()' style='text-decoration:none;color:#3399CC;'>"+data.sjsgtmc+"</a>");
			}
			//基础和审查
			$.ajax({
				url:'../../../xmsck/selectSckbhsdById.do',
				data:"sckid="+data.sckid,
				dataType:'json',
				success:function(msg){
					if(msg!=null){
						$("#sddm").html(msg.sddm);
						$("#sdmc").html(msg.sdmc);
						$("#sdzxzh").html(msg.sdzxzh);
						$("#gydw").html(msg.gydw);
						$("#xzqhdm").html(msg.xzqhdm);
						$("#xzqhmc").html(msg.xzqhmc);
						$("#lxbm").html(msg.lxbm);
						$("#lxmc").html(msg.lxmc);
						$("#sdcd").html(msg.sdcd);
						$("#sdkd").html(msg.sdkd);
						$("#sdgd").html(msg.sdgd);
						$("#jsdj").html(msg.jsdj);
						$("#pddj").html(msg.pddj);
						$("#pdtime").html(msg.pdtime);
						$("#jsjd").html(msg.jsjd);
						$("#jswd").html(msg.jswd);
						$("#xjgjnd").html(msg.xjgjnd);
						$("#acdfl").html(msg.acdfl);
						$("#xmnf").html(msg.xmnf);
						$("#bhbw").html(msg.bhbw);
						$("#bhnr").html(msg.bhnr);
						$("#bz").html(msg.bz);
						$("#xmmc").html(msg.xmmc);
						$("#jsxz").html(msg.jsxz);
						$("#nsddm").html(msg.nsddm);
						$("#nlxbm").html(msg.nlxbm);
						$("#nlxmc").html(msg.nlxmc);
						$("#nsdzxzh").html(msg.nsdzxzh);
						
						$("#sck_sdcd").html(msg.sck_sdcd);
						$("#sck_sdkd").html(msg.sck_sdkd);
						$("#sck_sdgd").html(msg.sck_sdgd);
						$("#sck_xmnf").html(msg.sck_xmnf);
						$("#spwh").html(msg.spwh);
						$("#spdw").html(msg.spdw);
						$("#sjdw").html(msg.sjdw);
						$("#tzgs").html(msg.tzgs);
						$("#sck_jsxz").html(msg.sck_jsxz);
						$("#zyjsnr").html(msg.zyjsnr);
						$("#scbz").html(msg.scbz);
						$("#sck_nsddm").html(msg.sck_nsddm);
						$("#sck_nlxbm").html(msg.sck_nlxbm);
						$("#sck_nlxmc").html(msg.sck_nlxmc);
						$("#sck_nsdzxzh").html(msg.sck_nsdzxzh);
					}
				}
			});
		}
	});
}


function dropWqgzs(){
	var sel=gridObj.datagrid("getSelections");
	if(sel.length==0){
		alert("请选择要删除的计划！");
		return;
	}
	
	for(var i=0;i<sel.length;i++){
		if(sel[i].spzt=='1'){
			alert("该项目已审核，不能执行删除操作！");
			return;
		}
	}
	
	if(confirm("确认要删除选中计划？")){
		var id="",sckid="";
		$.each(sel,function(index,item){
			if(index==(sel.length)){
				id+=item.id;
			}else{
				id+=item.id+",";
			}
			if(index==(sel.length)){
				sckid+=item.sckid;
			}else{
				sckid+=item.sckid+",";
			}
		});
		var params={'jh.id':id,'jh.sckid':sckid};
		$.ajax({
			type:'post',
			url:'../../../jhgl/dropBhsdById.do',
			dataType:'json',
			data:params,
			success:function(data){
				if(data.edit && data.drop){
					alert("删除成功！");
					$("#grid").datagrid('reload');
				}
			},
			error:function(){
				alert("删除失败！");
			}
		});
	}
}
function dropWqgzs1(id,sckid){
	if(confirm("确认要删除选中计划？")){
		
		var params={'jh.id':id,'jh.sckid':sckid};
		$.ajax({
			type:'post',
			url:'../../../jhgl/dropBhsdById.do',
			dataType:'json',
			data:params,
			success:function(data){
				if(data.edit && data.drop){
					alert("删除成功！");
					 $("#grid").datagrid('reload');
				}
			},
			error:function(){
				alert("删除失败！");
			}
		});
	}
}

function editWqgz(){
	//验证--start
	if(isNaN($("#jhztz").val())|| $("#jhztz").val()==""){
		alert("请正确填写批复总投资金额！");
		$("#jhztz").val("");
		$("#jhztz").focus();
		return;
	}
	if(isNaN($("#bbz").val()) || $("#bbz").val()==""){
		alert("请正确填写补助金额");
		$("#bbz").val("");
		$("#bbz").focus();
		return;
	}
	if(isNaN($("#zfzc").val())|| $("#zfzc").val()==""){
		alert("请正确填写计划使用地方自筹资金！");
		$("#zfzc").val("");
		$("#zfzc").focus();
		return;
	}
	//验证--end
	var jh={'jh.id':$('#jhid').val(),
			'jh.sbnf':$('#editjhnf').combobox('getValue'),
			'jh.jhkgsj':$('#jhkgsj').datebox('getValue'),
			'jh.jhwgsj':$('#jhwgsj').datebox('getValue'),
//			'jh.sjdw':$('#sjdw').val(),
//			'jh.sjpfdw':$('#sjpfdw').val(),
//			'jh.pfwh':$('#pfwh').val(),
//			'jh.pfsj':$('#pfsj').datebox('getValue'),
			'jh.pfztz':$('#jhztz').val(),
			'jh.jhsybzje':$('#bbz').val(),
			'jh.jhsydfzcje':$('#zfzc').val(),
			'jh.qtzj':$('#qtzj').html(),
//			'jh.sfsqablbz':$("input[name='sfsqablbz']:checked").val(),
//			'jh.ablbzsqwh':$('#ablbzwh').val(),
			'jh.bz':$('#JHRemarks').val(),
			'jh.sckid':$('#sckid').val()
	};
	$.ajax({
		type:'post',
		url:'../../../jhgl/editBhsdById.do',
		dataType:'text',
		data:jh,
		success:function(data){
			alert("修改成功！");
			parent.$('#grid').datagrid('reload');
			parent.$('#wq_edit').window('destroy');
		}
	});
}
function downFile1(){
	parent.window.location.href="/jxzhpt/jhgl/downBhsdFile.do?jh.gkbgmc="+'gkbg'+"&jh.id="+$('#jhid').val();
}
function downFile2(){
	parent.window.location.href="/jxzhpt/jhgl/downBhsdFile.do?jh.gkbgmc="+'sjsgt'+"&jh.id="+$('#jhid').val();
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
	    onClickRow:grid.onClickRow,
		onLoadSuccess:grid.onLoadSuccess
	});
	$('#'+grid.id).datagrid('resize',{width:$("body").width()*0.97});
}
function editStatus(jh){
	var result;
	$.ajax({
		type:'post',
		url:'../../../jhgl/editBhsdStatus.do',
		dataType:'json',
		data:jh,
		async:false,
		success:function(data){
			if(data.result){
				result = true;
			}else{
				result = false;
			}
		},
		error:function(){
			result=false;
		}
	});
	return result;
}

//调整bhsd
function tzPlanbhsd(ck_id){
	rowid=ck_id;
	YMLib.UI.createWindow('plan_ck','调整项目详情','/jxzhpt/page/jhgl/jhksh/bhsd_tz.jsp','plan_ck',500,200);
}

function tzTh(id){
	if(confirm('您确定退回该项目？')){
		$.ajax({
			 type : "POST",
			 url : "/jxzhpt/jhgl/bhsdTzth.do",
			 dataType : 'json',
			 data : 'jh.id=' +id,
			 success : function(msg){
				 if(msg){
					 alert('退回成功！');
					 $("#grid").datagrid('reload');
					 searchWqgz();
				 }else{
					 alert('退回失败！');
				 }
			 },
			 error : function(){
				 YMLib.Tools.Show('服务器请求无响应！error code = 404',3000);
			 }
		});
}
}

function openEditWindowTz(id){
	YMLib.Var.jhbm=id;
	YMLib.UI.createWindow('wq_edit','病害隧道',"/jxzhpt/page/jhgl/jhksh/bhsdxg.jsp",'wq_edit',1000,500);
}

function wqxmTz(jh,lx){
	var params={"jh.sbzt":jh.sbzt,"jh.spzt":jh.spzt,"jh.sbnf":jh.jhnf,
			'jh.jh_sbthcd':jh.jh_sbthcd,
			"lx.gydwbm":lx.gydwbm,"lx.xzqhdm":lx.xzqhdm,"lx.lxmc":lx.lxmc,
			"lx.lxbm":lx.lxbm,"lx.sdmc":lx.sdmc,"lx.sddm":lx.sddm,"lx.acdfl":lx.acdfl,"lx.jsdj":lx.jsdj,
			"lx.tbbmbm":$.cookie("unit2"),"jh.shFlag":jh.shFlag,"jh.jh_sdzt":jh.jh_sdzt,"jh.tz_type":jh.tz_type};
	var grid={
	        id:'grid',
	        url:'/jxzhpt/jhgl/queryBhsdListTz.do',
			pagination:true,
			rownumbers:false,
		    pageNumber:1,
		    pageSize:10,
		    height:$(window).height()-180,
		    width:$('#searchField').width(),
		    queryParams:params,
		    columns:[[
		        {field:'ck',checkbox:true},
		        {field:'c',title:'操作',width:150,align:'center',formatter:function(value,row,index){
		        	var result='<a href="javascript:locationXm('+"'"+row.sddm+"',"+"'"+row.sdzxzh+"'"+')" style="text-decoration:none;color:#3399CC;">定位</a>    ';
		        	result+='<a href="javascript:viewJhkxx('+"'"+row.id+"',"+"'"+row.tz_type+"'"+')" style="text-decoration:none;color:#3399CC;">详细</a>    ';
		        	if(row.tz_type!="0"){
		        		result+='<a href="javascript:openEditWindowTz('+"'"+row.id+"'"+')" style="text-decoration:none;color:#3399CC;">编辑</a>    ';
		        	}else{
		        		result+='<a style="text-decoration:none;color:black;">编辑</a>    ';
		        	}
		        	result+='<a href="javascript:tzTh('+"'"+row.id+"'"+')" style="text-decoration:none;color:#3399CC;">退回</a>    ';
		        	
		        	return result;
		        }},
//		        {field:'c5',title:'资金追加',width:80,align:'center',formatter:function(value,row,index){
//		        	var id="'"+row.id+"'";
//	        		return '<a href="javascript:openZjzjWindow('+"'grid','editBhZj'"+')" style="text-decoration:none;color:#3399CC;">资金追加</a>';
//		        }},
		        {field:'sbnf',title:'计划年份',width:80,align:'center'},
		        {field:'gydw',title:'管养单位',width:150,align:'center',
		        	formatter:function(value, row, index){
		        		return row.gydw;
		        	}
		        },
		        {field:'xzqhmc',title:'行政区划名称',width:100,align:'center',
		        	formatter:function(value, row, index){
		        		return row.xzqhmc;
		        	}
		        },
		        {field:'lxbm',title:'路线编码',width:80,align:'center',
		        	formatter:function(value,row,index){
			        	return row.lxbm;
		        	}
		        },
		        {field:'lxmc',title:'路线名称',width:80,align:'center',
		        	formatter:function(value,row,index){
			        	return row.lxmc;
		        	}
		        },
		        {field:'sddm',title:'隧道代码',width:60,align:'center',
		        	formatter:function(value,row,index){
			        	return row.sddm;
		        	}
		       },
		        {field:'qlmc',title:'隧道名称',width:60,align:'center',
		    	   formatter:function(value,row,index){
			        	return row.sdmc;
		        	}
		    	},
		        {field:'pfztz',title:'批复总投资',width:80,align:'center'},
		        {field:'jhkgsj',title:'计划开工时间',width:100,align:'center'},
		        {field:'jhwgsj',title:'计划完工时间',width:100,align:'center'}
		    ]],
		    onClickRow:function(rowIndex,rowDate){
				if(oldIndex!=-1){
					gridObj.datagrid("unselectRow",oldIndex);
				}
				selRow.push(rowIndex);
				gridObj.datagrid("selectRow",rowIndex);
				oldIndex=rowIndex;
			},
			onLoadSuccess:function(data){
				querySumWqgzTz(jh,lx);
			}
	};
	gridBind(grid);
}

function querySumWqgzTz(jh,lx){
	var param={"jh.sbzt":jh.sbzt,"jh.spzt":jh.spzt,"jh.sbnf":jh.jhnf,
			'jh.jh_sbthcd':jh.jh_sbthcd,
			"lx.gydwbm":lx.gydwbm,"lx.xzqhdm":lx.xzqhdm,"lx.lxmc":lx.lxmc,
			"lx.lxbm":lx.lxbm,"lx.sdmc":lx.sdmc,"lx.sddm":lx.sddm,"lx.acdfl":lx.acdfl,"lx.jsdj":lx.jsdj,"lx.tbbmbm":$.cookie("unit2"),
			"jh.shFlag":jh.shFlag,"jh.jh_sdzt":jh.jh_sdzt,"jh.tz_type":jh.tz_type};
	$.ajax({
		type:'post',
		url:'/jxzhpt/jhgl/querySumBhsdTz.do',
		data:param,
		dataType:'json',
		success:function(data){
			if(data.id>0){
				$('#lblCount').html(data.id);
				if(data.pfztz!=null && data.pfztz!="")
					$('#lblZTZ').html(data.pfztz);
				if(data.jhsybzje!=null && data.jhsybzje!="")
					$('#lblBTZ').html(data.jhsybzje);
				if(data.jhsydfzcje!=null && data.jhsydfzcje!="")
					$('#lblDFTZ').html(data.jhsydfzcje);
			}else{
				$('#lblCount').html("0");
				$('#lblZTZ').html("0");
				$('#lblBTZ').html("0");
				$('#lblDFTZ').html("0");
			}
		}
	});
}