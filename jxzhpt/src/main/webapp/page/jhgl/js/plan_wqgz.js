var gridObj;//列表对象
var oldIndex=-1;//之前选中的
var selRow=new Array();//已选择的行号
function queryZjqf(nf){
	//查询分到的资金
	var xzqhdm="360000";
	if(roleName()=="县级"){
		xzqhdm=$.cookie("unit").substring(5).substring(0,4)+"00";
	}
	$.ajax({
		type:'post',
		async:false,
		url:'../../../jhgl/queryZjqfByXzqh.do',
		data:{'zjqf.xzqhdm':xzqhdm,'zjqf.nf':nf},
		dataType:'json',
		success:function(data){
			$.each(JSON.parse(data.zjqf),function(index,item){
				if(item.id==$.cookie("unit").substring(5)){
					$('#lblQfzj').html(item.wqgz);
				}
			});
		}
	});
}
function querySumWqgz(jh,lx){
	var param={'lx.gydwbm':lx.gydwbm,'jh.sbzt':jh.sbzt,'jh.spzt':jh.spzt,'jh.jh_sbthcd':jh.jh_sbthcd};
	$.ajax({
		type:'post',
		url:'../../../jhgl/querySumWqgz.do',
		data:param,
		dataType:'json',
		success:function(data){
			$('#lblCount').html(data.id);
			if(data.pfztz!=null && data.pfztz!="")
				$('#lblZTZ').html(data.pfztz);
			if(data.jhsybzje!=null && data.jhsybzje!="")
				$('#lblBTZ').html(data.jhsybzje);
			if(data.jhsydfzcje!=null && data.jhsydfzcje!="")
				$('#lblDFTZ').html(data.jhsydfzcje);
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
function wqxm(jh,lx){
	var params={"jh.sbzt":jh.sbzt,"jh.spzt":jh.spzt,"jh.sbnf":jh.sbnf,"jh.jhkgsj":jh.jhkgsj,
			"lx.gydw":lx.gydw,"lx.gydwbm":lx.gydwbm,"lx.xzqhmc":lx.xzqhmc,"lx.xzqhdm":lx.xzqhdm,"lx.lxmc":lx.lxmc,
			"lx.lxbm":lx.lxbm,"lx.qlmc":lx.qlmc,"lx.akjfl":lx.akjfl,'jh.jh_sbthcd':jh.jh_sbthcd};
	var grid={id:'grid',url:'../../../jhgl/queryWqgzList.do',pagination:true,rownumbers:false,
		    pageNumber:1,pageSize:10,height:$(window).height()-180,width:$('#searchField').width(),queryParams:params,
		    columns:[[
		        {field:'ck',checkbox:true},
		        {field:'c',title:'操作',width:150,align:'center',formatter:function(value,row,index){
		        	var result='<a style="text-decoration:none;color:#3399CC;">定位</a>    ';
		        	result+='<a href="javascript:openDialog('+"'wqgz_xx','危桥改造项目计划详情','../jhkxx/wqgz.jsp'"+')" style="text-decoration:none;color:#3399CC;">详细</a>    ';
		        	if((roleName()=="县级" && row.jh_sbthcd==0) || (roleName()=="市级" && row.jh_sbthcd<=2) || (roleName()=="省级" && row.jh_sbthcd<=4)){
		        		result+='<a href="javascript:openDialog('+"'wqgz_xx','危桥改造项目计划详情','../edit/wqgz.jsp'"+')" style="text-decoration:none;color:#3399CC;">编辑</a>    ';
			        	var id="'"+row.id+"'";
			        	result+='<a href="javascript:dropWqgzs()" style="text-decoration:none;color:#3399CC;">移除</a>';
		        	}else{
		        		result+='<a style="text-decoration:none;color:black;">编辑</a>    ';
			        	result+='<a style="text-decoration:none;color:black;">移除</a>';
		        	}
		        	
		        	return result;
		        }},
		        {field:'c4',title:'计划状态',width:80,align:'center',formatter:function(value,row,index){
		        	var result="";
		        	if(row.sbzt=="0" && row.jh_sbthcd==0){
						result="未上报";
					}
					else if(row.sbzt=="0" && row.jh_sbthcd==2){
						result="已上报";
					}
					else if(row.sbzt=="1" && row.spzt=="0"){
						result="未审批";
					}
					else if(row.sbzt=="1" && row.spzt=="1"){
						result="已审批";
					}
					return result;
		        }},
//		        {field:'c5',title:'资金追加',width:80,align:'center',formatter:function(value,row,index){
//		        	var id="'"+row.id+"'";
//	        		return '<a href="javascript:openZjxd('+"'wqgz_xx'"+','+"'资金追加'"+','+"'../zjxd/zjzj.jsp'"+',500,300,'+"'"+row.id+"'"+')" style="text-decoration:none;color:#3399CC;">资金追加</a>';
//		        }},
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
			"jh.jhwgsj":jh.jhwgsj,"jh.pfztz":jh.pfztz,"jh.jh_sbthcd":jh.jh_sbthcd,
			"lx.gydw":lx.gydw,"lx.gydwbm":lx.gydwbm,"lx.xzqhmc":lx.xzqhmc,"lx.xzqhdm":lx.xzqhdm,"lx.lxmc":lx.lxmc};
	var grid={id:'grid',url:'../../../jhgl/queryWqgzList.do',pagination:true,rownumbers:false,
		    pageNumber:1,pageSize:10,height:$(window).height()-180,width:$('#searchField').width(),queryParams:params,
		    columns:[[
		        {field:'c',title:'操作',width:150,align:'center',formatter:function(value,row,index){
		        	var result='<a style="text-decoration:none;color:#3399CC;">定位</a>    ';
		        	result+='<a href="javascript:openDialog('+"'wqgz_xx','危桥改造项目计划详情','../jhkxx/wqgz.jsp'"+')" style="text-decoration:none;color:#3399CC;">详细</a>    ';
		        	if((roleName()=="县级" && row.jh_sbthcd==0) || (roleName()=="市级" && row.jh_sbthcd<=2) || (roleName()=="省级" && row.jh_sbthcd<=4))
		        		result+='<a href="javascript:openDialog('+"'wqgz_xx','危桥改造项目计划详情','../edit/wqgz.jsp'"+')" style="text-decoration:none;color:#3399CC;">编辑</a>';
		        	else
		        		result+='<a style="text-decoration:none;color:black;">编辑</a>';
		        	return result;
		        }},
		        {field:'sbzt',title:'上报状态',width:80,align:'center',formatter:function(value,row,index){
		        	var result;
		        	if((roleName()=="县级" && row.jh_sbthcd==0) || (roleName()=="市级" && row.jh_sbthcd<=2)){
//		        		result='<a href="javascript:sb('+"'"+row.id+"'"+','+row.jh_sbthcd+')" style="text-decoration:none;color:#3399CC;">上报</a>';
//		        		if(roleName()=="市级")
//		        			result+='    |    <a href="javascript:tuihui('+"'"+row.id+"'"+','+row.jh_sbthcd+')" style="text-decoration:none;color:#3399CC;">退回</a>';
		        		result="未上报";
		        	}else{
		        		result='<a style="text-decoration:none;color:black;">已上报</a>';
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
			"jh.jhwgsj":jh.jhwgsj,"jh.pfztz":jh.pfztz,"jh.jh_sbthcd":jh.jh_sbthcd,
			"lx.gydw":lx.gydw,"lx.gydwbm":lx.gydwbm,"lx.xzqhmc":lx.xzqhmc,"lx.xzqhdm":lx.xzqhdm,"lx.lxmc":lx.lxmc};
	var grid={id:'grid',url:'../../../jhgl/queryWqgzList.do',pagination:true,rownumbers:false,
		    pageNumber:1,pageSize:10,height:$(window).height()-180,width:$('#searchField').width(),queryParams:params,
		    columns:[[
		        {field:'c',title:'操作',width:150,align:'center',formatter:function(value,row,index){
		        	var result='<a style="text-decoration:none;color:#3399CC;">定位</a>    ';
		        	result+='<a href="javascript:openDialog('+"'wqgz_xx','危桥改造项目计划详情','../jhkxx/wqgz.jsp'"+')" style="text-decoration:none;color:#3399CC;">详细</a>    ';
		        	if((roleName()=="省级" && row.jh_sbthcd<=4))
		        		result+='<a href="javascript:openDialog('+"'wqgz_xx','危桥改造项目计划详情','../edit/wqgz.jsp'"+')" style="text-decoration:none;color:#3399CC;">编辑</a>';
		        	else
		        		result+='<a style="text-decoration:none;color:black;">编辑</a>';
		        	return result;
		        }},
		        {field:'sbzt',title:'审批状态',width:80,align:'center',formatter:function(value,row,index){
		        	var result;
		        	if(row.spzt=="0"){
		        		result='<a href="javascript:sp('+"'"+row.id+"'"+','+row.jh_sbthcd+')" style="text-decoration:none;color:#3399CC;">审批</a>    |    ';
		        		result+='<a href="javascript:tuihui('+"'"+row.id+"'"+','+row.jh_sbthcd+')" style="text-decoration:none;color:#3399CC;">退回</a>';
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
	var params={"jh.kgzt":jh.kgzt,"jh.jgzt":jh.jgzt,"jh.sbzt":jh.sbzt,"jh.spzt":jh.spzt,"jh.sbnf":jh.sbnf,"jh.jhkgsj":jh.jhkgsj,
			"jh.jhwgsj":jh.jhwgsj,"jh.pfztz":jh.pfztz,"jh.jh_sbthcd":jh.jh_sbthcd,'lx.akjfl':lx.akjfl,
			"lx.gydw":lx.gydw,"lx.gydwbm":lx.gydwbm,"lx.xzqhmc":lx.xzqhmc,"lx.xzqhdm":lx.xzqhdm,"lx.lxmc":lx.lxmc};
	var grid={id:'grid',url:'../../../jhgl/queryWqgzList.do',pagination:true,rownumbers:false,
		    pageNumber:1,pageSize:10,height:$(window).height()-158,width:$('#searchField').width(),queryParams:params,
		    columns:[[
		        {field:'c',title:'操作',width:150,align:'center',formatter:function(value,row,index){
		        	var result='<a style="text-decoration:none;color:#3399CC;">定位</a>    ';
		        	result+='<a href="javascript:openDialog('+"'zjxd_wqgz','危桥改造项目计划详情','../jhkxx/wqgz.jsp'"+')" style="text-decoration:none;color:#3399CC;">详细</a>';
		        	return result;
		        }},
		        {field:'zjxf',title:'资金下发',width:80,align:'center',formatter:function(value,row,index){
		        	return '<a href="javascript:openDialog('+"'zjxd_wqgz','危桥改造资金下达','../zjxd/wqgz.jsp'"+')" style=" text-decoration:none;color:#3399CC;">资金下发</a>';
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
		        	if(row.sfylsjl=='0')
		        		return '无';
		        	else if(row.sfylsjl=='1')
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
	if(confirm("确认要移除选中计划？")){
		var sel=gridObj.datagrid("getSelections");
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
			'jh.jhsydfzcje':$('#zfzc').html(),
			'jh.sfsqablbz':$('#sfsqablbz').html(),
			'jh.ablbzsqwh':$('#ablbzwh').val(),
			'jh.bz':$('#JHRemarks').val(),
			'jh.jckwqgz.fapgdw':$('#fapgdw').val(),'jh.jckwqgz.fascdw':$('#fascdw').val(),
			'jh.jckwqgz.faspsj':$('#faspsj').datebox('getValue'),'jh.jckwqgz.spwh':$('#spwh').val(),
			'jh.jckwqgz.tzgs':$('#tzgs').val(),'jh.jckwqgz.jsxz':$('#jsxz').val(),
			'jh.sckid':$('#sckid').val(),'jh.jckwqgz.jsnr':$('#jsnr').val(),'jh.jckwqgz.scbz':$('#scbz').val(),
	};
	$.ajax({
		type:'post',
		url:'../../../jhgl/editWqgzById.do',
		dataType:'text',
		data:jh,
		success:function(data){
			alert("修改成功！");
			$('#wqgz_xx').dialog('close');
			searchWqgz();
		}
	});
}
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
	    onClickRow:grid.onClickRow
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
