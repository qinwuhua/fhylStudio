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
	var param={"jh.sbzt":jh.sbzt,"jh.spzt":jh.spzt,"jh.sbnf":jh.jhnf,"jh.jhkgsj":jh.jhkgsj,
			'jh.sfylsjl':jh.sfylsjl,'jh.jh_sbthcd':jh.jh_sbthcd,
			"lx.gydwlx":lx.gydwlx,"lx.gydwbm":lx.gydwbm,"lx.xzqhdm":lx.xzqhdm,"lx.lxmc":lx.lxmc,
			"lx.lxbm":lx.lxbm,"lx.qlmc":lx.qlmc,"lx.akjfl":lx.akjfl,"lx.jsxz":lx.jsxz,"lx.lxbm":lx.lxbm,
			"lx.jsdj":lx.jsdj,"lx.gldj":lx.gldj,"lx.tsdq":lx.tsdq,"lx.xmklx":lx.xmklx,
			"lx.xlxmc":lx.xlxmc,"lx.xlxbm":lx.xlxbm,"lx.xqlbm":lx.xqlbm,"lx.xqlmc":lx.xqlmc,"lx.qlbh":lx.qlbh};

	
	$.ajax({
		type:'post',
		url:'../../../jhgl/querySumWqgz.do',
		data:param,
		dataType:'json',
		success:function(data){
			if(data.id>0){
				$('#lblCount').html(data.id);
				if(data.pfztz!=null && data.pfztz!="")
					$('#lblZTZ').html(data.pfztz);
				if(data.jhsybzje!=null && data.jhsybzje!="")
					$('#lblBTZ').html(data.jhsybzje);
				if(data.shengbz!=null && data.shengbz!="")
					$('#shengBZ').html(data.shengbz);
				if(data.jhsydfzcje!=null && data.jhsydfzcje!="")
					$('#lblDFTZ').html(data.jhsydfzcje);
			}else{
				$('#lblCount').html("0");
				$('#lblZLC').html("0");
				$('#lblZTZ').html("0");
				$('#lblBTZ').html("0");
				$('#shengBZ').html("0");
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
	obj=id;
	YMLib.UI.createWindow('wq_xx','危桥改造',"/jxzhpt/page/jhgl/jhkxx/wqgz.jsp",'wq_xx',1000,500);
}
var obj;
function openEditWindow(id){
	obj=id;
	//YMLib.Var.jhbm=id;
	YMLib.UI.createWindow('wq_edit','危桥改造',"/jxzhpt/page/jhgl/edit/wqgz.jsp",'wq_edit',1000,500);
}
function openEditWindow1(id){
	YMLib.Var.jhbm=id;
	YMLib.UI.createWindow('wq_edit','危桥改造',"/jxzhpt/page/jhgl/edit/wqgz1.jsp",'wq_edit',1000,500);
}
function wqxm(jh,lx){
	var params={"jh.sbzt":jh.sbzt,"jh.spzt":jh.spzt,"jh.sbnf":jh.jhnf,"jh.jhkgsj":jh.jhkgsj,
			'jh.sfylsjl':jh.sfylsjl,'jh.jh_sbthcd':jh.jh_sbthcd,
			"lx.gydwlx":lx.gydwlx,"lx.gydwbm":lx.gydwbm,"lx.xzqhdm":lx.xzqhdm,"lx.lxmc":lx.lxmc,
			"lx.lxbm":lx.lxbm,"lx.qlmc":lx.qlmc,"lx.qlbh":lx.qlbh,"lx.akjfl":lx.akjfl,"lx.jsxz":lx.jsxz,"lx.lxbm":lx.lxbm,"lx.jsdj":lx.jsdj,"lx.gldj":lx.gldj,"lx.tsdq":lx.tsdq,"lx.xmklx":lx.xmklx,
			"lx.xlxmc":lx.xlxmc,"lx.xlxbm":lx.xlxbm,"lx.xqlbm":lx.xqlbm,"lx.xqlmc":lx.xqlmc};
	
	queryParams='lx.gydwlx='+lx.gydwlx+'&jh.sbzt='+jh.sbzt+'&jh.spzt='+jh.spzt+'&jh.sbnf='+jh.sbnf+'&lx.gydwbm='+lx.gydwbm+'&lx.qlbh='+lx.qlbh+
	'&lx.xzqhdm='+lx.xzqhdm+'&lx.lxmc='+lx.lxmc+"&lx.lxbm"+lx.lxbm+"&lx.lxbm"+lx.lxbm+"&lx.qlmc"+lx.qlmc+"&lx.akjfl"+lx.akjfl+"&lx.xmklx="+lx.xmklx+
	'&lx.xlxmc='+lx.xlxmc+'&lx.xlxbm='+lx.xlxbm+'&lx.xqlbm='+lx.xqlbm+'&lx.xqlmc='+lx.xqlmc;
	var grid={id:'grid',url:'../../../jhgl/queryWqgzList.do',pagination:true,rownumbers:false,
		    pageNumber:1,pageSize:10,height:$(window).height()-210,width:$('#searchField').width(),queryParams:params,
		    columns:[[
		        {field:'ck',checkbox:true},
		        {field:'c',title:'操作',width:150,align:'center',formatter:function(value,row,index){
		        	var result='<a href="javascript:locationQl('+"'"+row.jckwqgz.qlbh+"',"+"'"+row.jckwqgz.qlzxzh+"'"+')" style="text-decoration:none;color:#3399CC;">定位</a>';
		        	result+='<a href="javascript:openWindow('+"'"+row.id+"'"+')" style="text-decoration:none;color:#3399CC;">详细</a>    ';
		        	result+='<a href="javascript:openEditWindow('+"'"+row.id+"'"+')" style="text-decoration:none;color:#3399CC;">编辑</a>    ';
		        	if((roleName()=="县级" && row.jh_sbthcd==0) || (roleName()=="市级" && row.jh_sbthcd<=2) || (roleName()=="省级" && row.jh_sbthcd<=4)){
		        		//result+='<a href="javascript:openEditWindow('+"'"+row.id+"'"+')" style="text-decoration:none;color:#3399CC;">编辑</a>    ';
			        	var id="'"+row.id+"'";
			        	//result+='<a href="javascript:dropWqgzs()" style="text-decoration:none;color:#3399CC;">移除</a>';
		        	}else{
		        		//result+='<a style="text-decoration:none;color:black;">编辑</a>    ';
			        	//result+='<a style="text-decoration:none;color:black;">移除</a>';
		        	}
		        	
		        	return result;
		        }},
		        {field:'c4',title:'计划状态',width:80,align:'center',formatter:function(value,row,index){
		        	var result="";
					if(roleName()=="县级" && row.sbzt=="0" && row.jh_sbthcd==0){
						result="未上报";
					}else if((roleName()=="县级" && row.sbzt=="0" && row.jh_sbthcd==2)){
						result="已上报";
					}else if(roleName()=="市级" && row.sbzt=="0" && row.jh_sbthcd==0){
						result="待上报";
					}else if(roleName()=="市级" && row.sbzt=="0" && row.jh_sbthcd==2){
						result="未上报";
					}else if(roleName()=="市级" && row.sbzt=="1" && row.jh_sbthcd==4){
						result="已上报";
					}else if(roleName()=="省级" && row.jh_sbthcd<4){
						result="未上报";
					}else if(roleName()=="省级" && row.jh_sbthcd==4){
						result="未审核";
					}else if((row.jh_sbthcd==6)){
						result="已审核";
					}
					return result;
		        }},
		        {field:'c5',title:'资金追加',width:80,align:'center',formatter:function(value,row,index){
		        	var id="'"+row.id+"'";
	        		return '<a href="javascript:openZjzjWindow('+"'grid','editWqZj'"+')" style="text-decoration:none;color:#3399CC;">资金追加</a>';
		        }},
		        {field:'sfylsjl',title:'是否有修建记录',width:80,align:'center',formatter:function(value,row,index){
		        	if(row.sfylsjl=='无')
		        		return '无';
		        	else if(row.sfylsjl=='有')
		        		return '有';
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
		        {field:'lxbm',title:'规划路线编码',width:80,align:'center',
		        	formatter:function(value,row,index){
			        	return row.jckwqgz.lxbm;
		        	}
		        },
		        {field:'lxmc',title:'规划路线名称',width:80,align:'center',
		        	formatter:function(value,row,index){
			        	return row.jckwqgz.lxmc;
		        	}
		        },
		        {field:'qlbm',title:'规划桥梁编码',width:60,align:'center',
		        	formatter:function(value,row,index){
			        	return row.jckwqgz.qlbh;
		        	}
		       },
		        {field:'qlmc',title:'规划桥梁名称',width:60,align:'center',
		    	   formatter:function(value,row,index){
			        	return row.jckwqgz.qlmc;
		        	}
		    	},
		        {field:'pfztz',title:'批复总投资',width:80,align:'center'},
		        {field:'pfztz',title:'批复总投资',width:80,align:'center'},
		        {field:'xlxbm',title:'原路线编码',width:140,align:'center'},
		        {field:'xqlbm',title:'原桥梁编码',width:140,align:'center'},
		        {field:'xzxzh',title:'原中心桩号',width:140,align:'center'},
		  	    {field:'xlxmc',title:'原路线名称',width:140,align:'center'},
		  	    {field:'xqlmc',title:'原桥梁名称',width:140,align:'center'}
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
	var params={"jh.sbzt":jh.sbzt,"jh.spzt":jh.spzt,"jh.sbnf":jh.jhnf,"jh.jhkgsj":jh.jhkgsj,
			'jh.sfylsjl':jh.sfylsjl,'jh.jh_sbthcd':jh.jh_sbthcd,
			"lx.gydwbm":lx.gydwbm,"lx.xzqhdm":lx.xzqhdm,"lx.lxmc":lx.lxmc,
			"lx.lxbm":lx.lxbm,"lx.qlmc":lx.qlmc,"lx.akjfl":lx.akjfl,"lx.jsxz":lx.jsxz,"lx.lxbm":lx.lxbm,"lx.jsdj":lx.jsdj,"lx.gldj":lx.gldj,"lx.tsdq":lx.tsdq,"lx.xmklx":lx.xmklx};

	var grid={id:'grid',url:'../../../jhgl/queryWqgzList.do',pagination:true,rownumbers:false,
		    pageNumber:1,pageSize:10,height:$(window).height()-180,width:$('#searchField').width(),queryParams:params,
		    columns:[[
		        {field:'c',title:'操作',width:150,align:'center',formatter:function(value,row,index){
		        	var result='<a href="javascript:locationQl('+"'"+row.jckwqgz.qlbh+"',"+"'"+row.jckwqgz.qlzxzh+"'"+')" style="text-decoration:none;color:#3399CC;">定位</a>    ';
		        	result+='<a href="javascript:openWindow('+"'"+row.id+"'"+')" style="text-decoration:none;color:#3399CC;">详细</a>    ';
		        	if((roleName()=="县级" && row.jh_sbthcd==0) || (roleName()=="市级" && row.jh_sbthcd<=2) || (roleName()=="省级" && row.jh_sbthcd<=4))
		        		result+='<a href="javascript:openEditWindow('+"'"+row.id+"'"+')" style="text-decoration:none;color:#3399CC;">编辑</a>';
		        	else
		        		result+='<a style="text-decoration:none;color:black;">编辑</a>';
		        	return result;
		        }},
		        {field:'sbzt',title:'上报状态',width:80,align:'center',formatter:function(value,row,index){
		        	var result;
		        	if((roleName()=="县级" && row.jh_sbthcd==0) || (roleName()=="市级" && row.jh_sbthcd<=2)){
		        		result='<a href="javascript:sb('+"'"+row.id+"'"+','+row.jh_sbthcd+')" style="text-decoration:none;color:#3399CC;">上报</a>';
//		        		if(roleName()=="市级")
//		        			result+='        <a href="javascript:tuihui('+"'"+row.id+"'"+','+row.jh_sbthcd+')" style="text-decoration:none;color:#3399CC;">退回</a>';
//		        		result="未上报";
		        	}else{
		        		result='<a style="text-decoration:none;color:black;">已上报</a>';
		        	}
		        	return result;
		        }},
		        {field:'sfylsjl',title:'是否有修建记录',width:80,align:'center',formatter:function(value,row,index){
		        	if(row.sfylsjl=='无')
		        		return '无';
		        	else if(row.sfylsjl=='有')
		        		return '有';
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
		        {field:'pfztz',title:'批复总投资',width:80,align:'center'},
		        {field:'xlxbm',title:'原路线编码',width:140,align:'center'},
		        {field:'xqlbm',title:'原桥梁编码',width:140,align:'center'},
		        {field:'xzxzh',title:'原中心桩号',width:140,align:'center'},
		  	    {field:'xlxmc',title:'原路线名称',width:140,align:'center'},
		  	    {field:'xqlmc',title:'原桥梁名称',width:140,align:'center'}
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
	var params={"jh.sbzt":jh.sbzt,"jh.spzt":jh.spzt,"jh.sbnf":jh.jhnf,"jh.jhkgsj":jh.jhkgsj,
			'jh.sfylsjl':jh.sfylsjl,'jh.jh_sbthcd':jh.jh_sbthcd,
			"lx.gydwbm":lx.gydwbm,"lx.xzqhdm":lx.xzqhdm,"lx.lxmc":lx.lxmc,
			"lx.lxbm":lx.lxbm,"lx.qlmc":lx.qlmc,"lx.akjfl":lx.akjfl,"lx.jsxz":lx.jsxz,"lx.lxbm":lx.lxbm,"lx.jsdj":lx.jsdj,"lx.gldj":lx.gldj,"lx.tsdq":lx.tsdq,"lx.xmklx":lx.xmklx};

	var grid={id:'grid',url:'../../../jhgl/queryWqgzList.do',pagination:true,rownumbers:false,
		    pageNumber:1,pageSize:10,height:$(window).height()-190,width:$('#searchField').width(),queryParams:params,
		    columns:[[
		        {field:'c',title:'操作',width:150,align:'center',formatter:function(value,row,index){
		        	var result='<a href="javascript:locationQl('+"'"+row.jckwqgz.qlbh+"',"+"'"+row.jckwqgz.qlzxzh+"'"+')" style="text-decoration:none;color:#3399CC;">定位</a>    ';
		        	result+='<a href="javascript:openWindow('+"'"+row.id+"'"+')" style="text-decoration:none;color:#3399CC;">详细</a>    ';
		        	//if(($.cookie("unit")=="36" && row.jh_sbthcd<=4))
		        		result+='<a href="javascript:openEditWindow('+"'"+row.id+"'"+')" style="text-decoration:none;color:#3399CC;">编辑</a>';
		        	//else
		        	//	result+='<a style="text-decoration:none;color:black;">编辑</a>';
		        	return result;
		        }},
		        {field:'sbzt',title:'审批状态',width:80,align:'center',formatter:function(value,row,index){
		        	var result;
		        	if(row.spzt=="0"){
		        		result='<a href="javascript:sp('+"'"+row.id+"'"+','+row.jh_sbthcd+')" style="text-decoration:none;color:#3399CC;">审批</a>         ';
		        		result+='<a href="javascript:tuihui('+"'"+row.id+"'"+','+row.jh_sbthcd+')" style="text-decoration:none;color:#3399CC;">退回</a>';
		        	}else if(row.spzt=="1"){
		        		result="已审批";
		        	}
		        	return result;
		        }},
		        {field:'sfylsjl',title:'是否有修建记录',width:80,align:'center',formatter:function(value,row,index){
		        	if(row.sfylsjl=='无')
		        		return '无';
		        	else if(row.sfylsjl=='有')
		        		return '有';
		        }},
		        {field:'sbnf',title:'上报年份',width:80,align:'center'},
		        {field:'jhkgsj',title:'计划开工时间',width:100,align:'center'},
		        {field:'jhwgsj',title:'计划完工时间',width:100,align:'center'},
		        {field:'gydwbm',title:'交通局/公路局',width:150,align:'center',
		        	formatter:function(value, row, index){
		        		return row.jckwqgz.gydwbm.substring(0,1)=="1" ? "交通局" : "公路局";
		        	}
		        },
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
		       {field:'scqlqc',title:'审查桥梁全长',width:60,align:'center',
		    	   formatter:function(value,row,index){
		    		   return row.jckwqgz.scqlqc;
		    	   }
		       },
		       {field:'scqlqk',title:'审查桥梁全宽',width:60,align:'center',
		    	   formatter:function(value,row,index){
		    		   return row.jckwqgz.scqlqk;
		    	   }
		       },
		       {field:'pfztz',title:'批复总投资',width:80,align:'center'},
		       {field:'xlxbm',title:'原路线编码',width:140,align:'center'},
		       {field:'xqlbm',title:'原桥梁编码',width:140,align:'center'},
		       {field:'xzxzh',title:'原中心桩号',width:140,align:'center'},
		  	   {field:'xlxmc',title:'原路线名称',width:140,align:'center'},
		  	   {field:'xqlmc',title:'原桥梁名称',width:140,align:'center'}
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
function zjxf(id){
	obj=id;
	YMLib.UI.createWindow('wq_edit','危桥改造资金下达',"/jxzhpt/page/jhgl/jhkzjxd/wqgz_zj.jsp",'wq_edit',1000,500);
}
function wqxm_zjxd(jh,lx){
	var params={"jh.sbzt":jh.sbzt,"jh.spzt":jh.spzt,"jh.sbnf":jh.jhnf,"jh.jhkgsj":jh.jhkgsj,
			'jh.sfylsjl':jh.sfylsjl,'jh.jh_sbthcd':jh.jh_sbthcd,
			"lx.gydwbm":lx.gydwbm,"lx.xzqhdm":lx.xzqhdm,"lx.lxmc":lx.lxmc,
			"lx.lxbm":lx.lxbm,"lx.qlmc":lx.qlmc,"lx.akjfl":lx.akjfl,"lx.jsxz":lx.jsxz,"lx.lxbm":lx.lxbm,"lx.jsdj":lx.jsdj,"lx.gldj":lx.gldj,"lx.tsdq":lx.tsdq,"lx.xmklx":lx.xmklx};

	var grid={id:'grid',url:'../../../jhgl/queryWqgzList.do',pagination:true,rownumbers:false,
		    pageNumber:1,pageSize:10,height:$(window).height()-190,width:$('#searchField').width(),queryParams:params,
		    columns:[[
		        {field:'c',title:'操作',width:150,align:'center',formatter:function(value,row,index){
		        	var result='<a href="javascript:locationQl('+"'"+row.jckwqgz.qlbh+"',"+"'"+row.jckwqgz.akjfl+"'"+')" style="text-decoration:none;color:#3399CC;">定位</a>    ';
		        	result+='<a href="javascript:openWindow('+"'"+row.id+"'"+')" style="text-decoration:none;color:#3399CC;">详细</a>';
		        	return result;
		        }},
		        {field:'zjxf',title:'资金下达',width:80,align:'center',formatter:function(value,row,index){
		        	return '<a href="javascript:zjxf('+"'"+row.id+"'"+')" style=" text-decoration:none;color:#3399CC;">资金下达</a>';
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
		        {field:'sfylsjl',title:'是否有修建记录',width:80,align:'center',formatter:function(value,row,index){
		        	if(row.sfylsjl=='无')
		        		return '无';
		        	else if(row.sfylsjl=='有')
		        		return '有';
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
		        {field:'pfztz',title:'批复总投资',width:80,align:'center'},
//		        {field:'pfztz',title:'批复总投资',width:80,align:'center'},
		        {field:'xlxbm',title:'原路线编码',width:140,align:'center'},
		        {field:'xqlbm',title:'原桥梁编码',width:140,align:'center'},
		        {field:'xzxzh',title:'原中心桩号',width:140,align:'center'},
		  	    {field:'xlxmc',title:'原路线名称',width:140,align:'center'},
		  	    {field:'xqlmc',title:'原桥梁名称',width:140,align:'center'}
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
		url:'../../../jhgl/queryWqgzById.do',
		data:"jh.id="+id,
		dataType:'json',
		success:function(data){
			//计划
			$("#jhid").val(data.id);
			$('#jhnf').html(data.jhnf);
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
			$('#zfzc').html(data.jhsydfzcje);
			$('#sfsqablbz').html(data.sfsqablbz);
			$('#ablbzwh').html(data.ablbzsqwh);
			$('#JHRemarks').html(data.bz);
			if(data.gkbgmc!=''){
				$('#xz_gkbg').html("<a href='#' onclick='downFile1()' style='text-decoration:none;color:#3399CC;'>"+data.gkbgmc+"</a>");
			}
			if(data.sjsgtmc!=''){
				$("#xz_sjsgt").html("<a href='#' onclick='downFile2()' style='text-decoration:none;color:#3399CC;'>"+data.sjsgtmc+"</a>");
			}
			//基础和审查
			$.ajax({
				url:'../../../xmsck/selectSckwqgzById.do',
				data:"sckid="+data.sckid,
				dataType:'json',
				success:function(jcAndSc){
					if(jcAndSc!=null){
						$('#qlmc').html(jcAndSc.qlmc);
						$('#qlbm').html(jcAndSc.qlbh);
						$('#qlzxzh').html(jcAndSc.qlzxzh);
						$('#gydwxx').html(jcAndSc.gydw);
						$('#xzqhdm').html(jcAndSc.xzqhdm);
						$('#xzqhmc').html(jcAndSc.xzqhmc);
						$('#lxmc').html(jcAndSc.lxmc);
						$('#lxbm').html(jcAndSc.lxbm);
						$('#kjzc').html(jcAndSc.kjzc);
						$('#qlqc').html(jcAndSc.qlqc);
						$('#qlqk').html(jcAndSc.qlqk);
						$('#dkzdkj').html(jcAndSc.dkzdkj);
						$('#jsdjxx').html(jcAndSc.jsdj);
						$('#pddj').html(jcAndSc.pddj);
						$('#xjnd').html(jcAndSc.xjgjnd);
						$('#akjfl').html(jcAndSc.akjfl);
						$('#sbjgxs').html(jcAndSc.sbjgxs);
						$('#tsdq').html(jcAndSc.tsdq);
						$('#xmnf').html(jcAndSc.xmnf);
						$('#xmtype').html(jcAndSc.xmtype);
						$('#bhnr').html(jcAndSc.bhnr);
						$('#bz').html(jcAndSc.bz);
						//审查库信息
						$('#fapgdw').html(jcAndSc.fapgdw);
						$('#fascdw').htmll(jcAndSc.fascdw);
						$('#faspsj').html(jcAndSc.faspsj);
						$('#spwh').html(jcAndSc.spwh);
						$('#tzgs').html(jcAndSc.tzgs);
						$('#jsxz').html(jcAndSc.jsxz);
						$('#jsnr').html(jcAndSc.jsnr);
						$('#scbz').html(jcAndSc.scbz);
					}
				}
			});
		}
	});
}
function openAddWqgz(){
	openAdd('wqgz_add','添加安保工程项目','../add/wqgzAdd.jsp');
}
function dropWqgzs(){
	var sel=$('#grid').datagrid('getSelections');
	
	if(sel.length==0){
		alert("请选择要删除的计划！");
		return;
	}
	if(confirm("确认要移除选中计划？")){
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
		var params={'jh.id':id,'jh.sckid':sckid}
		$.ajax({
			type:'post',
			url:'../../../jhgl/dropWqgzById.do',
			dataType:'json',
			data:params,
			success:function(data){
				var params={"jh.sbzt":null,"jh.spzt":null,"jh.jhnf":null,
						"lx.gydwdm":null,"lx.xzqhmc":null,"lx.xzqhdm":null,"lx.lxmc":null};
				if(data.edit && data.drop){
					alert("移除成功！");
					gridObj.datagrid("reload",params);
				}
			},
			error:function(){
				alert("移除失败！");
			}
		});
	}
}
function editWqgz(){
	var jh={'jh.id':$('#jhid').val(),
			'jh.sfylrbwqk':'是',
			'jh.sbnf':$('#editjhnf').combobox('getValue'),
			'jh.jhkgsj':$('#jhkgsj').datebox('getValue'),
			'jh.jhwgsj':$('#jhwgsj').datebox('getValue'),
			//'jh.xdsj':$('#jhxdsj').datebox('getValue'),
			//'jh.jhxdwh':$('#jhxdwh').val(),
			'jh.sjdw':$('#sjdw').val(),
			'jh.sjpfdw':$('#sjpfdw').val(),
			'jh.pfwh':$('#pfwh').val(),
			'jh.pfsj':$('#pfsj').datebox('getValue'),
			'jh.pfztz':$('#jhztz').val(),
			'jh.jhsybzje':$('#bbz').val(),
			'jh.jhsydfzcje':$('#zfzc').html(),
			'jh.sfsqablbz':$("input[name='sfsqablbz']:checked").val(),
			'jh.ablbzsqwh':$('#ablbzwh').val(),
			'jh.bz':$('#JHRemarks').val(),
			'sc.scqlqk':$('#scqlqk').val(),'sc.scqlqc':$('#scqlqc').val(),
			'sc.fapgdw':$('#fapgdw').val(),'sc.fascdw':$('#fascdw').val(),
			'sc.faspsj':$('#faspsj').datebox('getValue'),'sc.spwh':$('#spwh').val(),
			'sc.tzgs':$('#tzgs').val(),'sc.jsxz':$('#jsxz').val(),'sc.sckid':$('#sckid').val(),
			'jh.sckid':$('#sckid').val(),'sc.jsnr':$('#jsnr').val(),'sc.scbz':$('#scbz').val(),
	};
	$.ajax({
		type:'post',
		url:'../../../jhgl/editWqgzById.do',
		dataType:'text',
		data:jh,
		success:function(data){
			alert("修改成功！");
			parent.$('#grid').datagrid('reload');
			parent.$('#wq_edit').window('destroy');
		}
	});
}
//
function editWqgz1(){
	var jh={'jh.id':$('#jhid').val(),
			'jh.sfylrbwqk':$('#sfylrbwqk').combobox('getValue'),
			'jh.sbnf':$('#editjhnf').combobox('getValue'),
			'jh.jhkgsj':$('#jhkgsj').datebox('getValue'),
			'jh.jhwgsj':$('#jhwgsj').datebox('getValue'),
			//'jh.xdsj':$('#jhxdsj').datebox('getValue'),
			//'jh.jhxdwh':$('#jhxdwh').val(),
			'jh.sjdw':$('#sjdw').val(),
			'jh.sjpfdw':$('#sjpfdw').val(),
			'jh.pfwh':$('#pfwh').val(),
			'jh.pfsj':$('#pfsj').datebox('getValue'),
			'jh.pfztz':$('#jhztz').val(),
			'jh.jhsybzje':$('#bbz').val(),
			'jh.jhsydfzcje':$('#zfzc').html(),
			'jh.sfsqablbz':$("input[name='sfsqablbz']:checked").val(),
			'jh.ablbzsqwh':$('#ablbzwh').val(),
			'jh.bz':$('#JHRemarks').val(),
			'sc.scqlqk':$('#scqlqk').val(),'sc.scqlqc':$('#scqlqc').val(),
			'sc.fapgdw':$('#fapgdw').val(),'sc.fascdw':$('#fascdw').val(),
			'sc.faspsj':$('#faspsj').datebox('getValue'),'sc.spwh':$('#spwh').val(),
			'sc.tzgs':$('#tzgs').val(),'sc.jsxz':$('#jsxz').val(),'sc.sckid':$('#sckid').val(),
			'jh.sckid':$('#sckid').val(),'sc.jsnr':$('#jsnr').val(),'sc.scbz':$('#scbz').val(),
	};
	$.ajax({
		type:'post',
		url:'../../../jhgl/editWqgzById.do',
		dataType:'text',
		data:jh,
		success:function(data){
			alert("修改成功！");
			parent.loadwqjhkgl();
			parent.$('#wq_edit').window('destroy');
		}
	});
}
//
function downFile1(){
	parent.window.location.href="/jxzhpt/jhgl/downWqgzFile.do?jh.gkbgmc="+'gkbg'+"&jh.id="+$('#jhid').val();
}
function downFile2(){
	parent.window.location.href="/jxzhpt/jhgl/downWqgzFile.do?jh.gkbgmc="+'sjsgt'+"&jh.id="+$('#jhid').val();
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
		url:'../../../jhgl/editWqgzStatus.do',
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
