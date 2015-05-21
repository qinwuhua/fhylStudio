var gridObj;//列表对象
var oldIndex=-1;//之前选中的
var selRow=new Array();//已选择的行号
function querySumZhfz(jh,lx){
	var param={"jh.sbzt":jh.sbzt,"jh.spzt":jh.spzt,"jh.sbnf":jh.jhnf,"jh.jhkgsj":jh.jhkgsj,'jh.sfylsjl':jh.sfylsjl,
			"lx.gydwbm":lx.gydwbm,"lx.xzqhdm":lx.xzqhdm,"lx.lxmc":lx.lxmc,'jh.jh_sbthcd':jh.jh_sbthcd};
	$.ajax({
		type:'post',
		url:'../../../jhgl/querySumZhfz.do',
		data:param,
		dataType:'json',
		success:function(data){
			$('#lblCount').html(data.id);
			if(data.id>0){
				$('#lblZLC').html(data.jckzhfz.qzlc);
				$('#lblYHLC').html(data.jckzhfz.yhlc);
				$('#lblZTZ').html(data.pfztz);
				$('#lblBTZ').html(data.jhsybzje);
				$('#lblDFTZ').html(data.jhsydfzcje);
			}else{
				$('#lblZLC').html("0");
				$('#lblYHLC').html("0");
				$('#lblZTZ').html("0");
				$('#lblBTZ').html("0");
				$('#lblDFTZ').html("0");
			}
		}
	});
}
function queryZjqf(nf){
	$.ajax({
		type:'post',
		async:false,
		url:'../../../jhgl/queryZjqfByZjqf.do',
		data:zjqf={'zjqf.gydwbm':$.cookie("unit"),'zjqf.nf':nf},
		dataType:'json',
		success:function(data){
			if(data!=null){
				$('#lblQfzj').html(data.zhfz);
			}else{
				$('#lblQfzj').html("0");
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
	YMLib.UI.createWindow('zhfz_xx','灾害防治',"/jxzhpt/page/jhgl/jhkxx/zhfz.jsp",'zhfz_xx',1000,500);
}
function openEditWindow(id){
	YMLib.Var.jhbm=id;
	YMLib.UI.createWindow('zhfz_edit','灾害防治',"/jxzhpt/page/jhgl/edit/zhfz.jsp",'zhfz_edit',1000,500);
}
function zhfzxm(jh,lx){
	var params={"jh.sbzt":jh.sbzt,"jh.spzt":jh.spzt,"jh.sbnf":jh.jhnf,"jh.jhkgsj":jh.jhkgsj,'jh.sfylsjl':jh.sfylsjl,
			"lx.gydwbm":lx.gydwbm,"lx.xzqhdm":lx.xzqhdm,"lx.lxmc":lx.lxmc,'jh.jh_sbthcd':jh.jh_sbthcd};
	var grid={id:'grid',url:'../../../jhgl/queryZhfzList.do',pagination:true,rownumbers:false,
		pageNumber:1,pageSize:10,height:$(window).height()-180,width:$('#searchField').width(),queryParams:params,
	    columns:[[
	        {field:'ck',checkbox:true},
	        {field:'c',title:'操作',width:150,align:'center',formatter:function(value,row,index){
	        	var result="";
	        	result+='<a href="javascript:locationXm('+"'"+row.jckzhfz.lxbm+"'"+')" style="text-decoration:none;color:#3399CC;">定位</a>    ';
	        	result+='<a href="javascript:openWindow('+"'"+row.id+"'"+')" style="text-decoration:none;color:#3399CC;">详细</a>    ';
	        	if((roleName()=="县级" && row.jh_sbthcd==0) || (roleName()=="市级" && row.jh_sbthcd<=2) || (roleName()=="省级" && row.jh_sbthcd<=4)){
	        		result+='<a href="javascript:openEditWindow('+"'"+row.id+"'"+')" style="text-decoration:none;color:#3399CC;">编辑</a>    ';
		        	var id="'"+row.id+"'";
		        	if(roleName()=="省级")
		        		result+='<a href="javascript:dropZhfz('+id+','+"'true'"+')" style="text-decoration:none;color:#3399CC;">移除</a>';
	        		else
	        			result+='<a style="text-decoration:none;color:black;">移除</a>';
	        	}else{
	        		result+='<a style="text-decoration:none;">编辑</a>    ';
		        	result+='<a style="text-decoration:none;">移除</a>';
	        	}
	        	return result;
	        }},
	        {field:'c4',title:'计划状态',width:80,align:'center',formatter:function(value,row,index){
	        	var result="";
				if((roleName()=="县级" && row.jh_sbthcd==0) || (roleName()=="市级" && row.jh_sbthcd==2) || (roleName()=="省级" && row.jh_sbthcd<4)){
					result="未上报";
				}else if((roleName()=="县级" && row.jh_sbthcd==2) || (roleName()=="市级" && row.jh_sbthcd==4)){
					result="已上报";
				}else if((row.jh_sbthcd==4)){
					result="未审核";
				}else if((row.jh_sbthcd==6)){
					result="已审核";
				}else if((roleName()=="市级" && row.jh_sbthcd==0)){
					result="待上报";
				}
				return result;
	        }},
	        {field:'c5',title:'资金追加',width:80,align:'center',formatter:function(value,row,index){
        		return '<a href="javascript:openZjzjWindow('+"'grid','editZhZj'"+')" style="text-decoration:none;color:#3399CC;">资金追加</a>';
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
		},
		onLoadSuccess:function(data){
			querySumZhfz(jh,lx);
		}
	};
	gridBind(grid);
}
function zhfzxm_sb(jh,lx){
	var params={"jh.sbzt":jh.sbzt,"jh.spzt":jh.spzt,"jh.sbnf":jh.jhnf,"jh.jhkgsj":jh.jhkgsj,'jh.sfylsjl':jh.sfylsjl,
			"lx.gydwbm":lx.gydwbm,"lx.xzqhdm":lx.xzqhdm,"lx.lxmc":lx.lxmc,'jh.jh_sbthcd':jh.jh_sbthcd};
	var grid={id:'grid',url:'../../../jhgl/queryZhfzList.do',pagination:true,rownumbers:false,
		pageNumber:1,pageSize:10,height:$(window).height()-180,width:$('#searchField').width(),queryParams:params,
	    columns:[[
	        {field:'c',title:'操作',width:150,align:'center',formatter:function(value,row,index){
	        	var result="";
	        	result+='<a href="javascript:locationXm('+"'"+row.jckzhfz.lxbm+"'"+')" style="text-decoration:none;color:#3399CC;">定位</a>    ';
	        	result+='<a href="javascript:openWindow('+"'"+row.id+"'"+')" style="text-decoration:none;color:#3399CC;">详细</a>    ';
	        	if((roleName()=="县级" && row.jh_sbthcd==0) || (roleName()=="市级" && row.jh_sbthcd<=2) || (roleName()=="省级" && row.jh_sbthcd<4))
	        		result+='<a href="javascript:openEditWindow('+"'"+row.id+"'"+')" style="text-decoration:none;color:#3399CC;">编辑</a>';
	        	else
	        		result+='<a style="text-decoration:none;color:black;">编辑</a>';
	        	return result;
	        }},
	        {field:'c4',title:'上报状态',width:80,align:'center',formatter:function(value,row,index){
	        	var result;
	        	if((roleName()=="县级" && row.jh_sbthcd==0) || (roleName()=="市级" && row.jh_sbthcd<=2) || (roleName()=="省级" && row.jh_sbthcd<4)){
//					result='<a href="javascript:sb('+"'"+row.id+"'"+','+row.jh_sbthcd+')" style="text-decoration:none;color:#3399CC;">上报</a>';
//					if(roleName()=="市级")
//						result+='    |    <a href="javascript:tuihui('+"'"+row.id+"'"+','+row.jh_sbthcd+')" style="text-decoration:none;color:#3399CC;">退回</a>';
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
		},
		onLoadSuccess:function(data){
			querySumZhfz(jh,lx);
		}
	};
	gridBind(grid);
}
function zhfzxm_sh(jh,lx){
	var params={"jh.sbzt":jh.sbzt,"jh.spzt":jh.spzt,"jh.sbnf":jh.sbnf,"jh.jhkgsj":jh.jhkgsj,'jh.sfylsjl':jh.sfylsjl,
			"lx.gydwbm":lx.gydwbm,"lx.xzqhdm":lx.xzqhdm,"lx.lxmc":lx.lxmc,'jh.jh_sbthcd':jh.jh_sbthcd};
	var grid={id:'grid',url:'../../../jhgl/queryZhfzList.do',pagination:true,rownumbers:false,
		pageNumber:1,pageSize:10,height:$(window).height()-190,width:$('#searchField').width(),queryParams:params,
	    columns:[[
	        {field:'c',title:'操作',width:150,align:'center',formatter:function(value,row,index){
	        	var result="";
	        	result+='<a href="javascript:locationXm('+"'"+row.jckzhfz.lxbm+"'"+')" style="text-decoration:none;color:#3399CC;">定位</a>    ';
	        	result+='<a href="javascript:openWindow('+"'"+row.id+"'"+')" style="text-decoration:none;color:#3399CC;">详细</a>    ';
	        	if((roleName()=="县级" && row.jh_sbthcd==0) || (roleName()=="市级" && row.jh_sbthcd<=2) || (roleName()=="省级" && row.jh_sbthcd<=4))
	        		result+='<a href="javascript:openEditWindow('+"'"+row.id+"'"+')" style="text-decoration:none;color:#3399CC;">编辑</a>';
	        	else
	        		result+='<a style="text-decoration:none;color:black;">编辑</a>';
	        	return result;
	        }},
	        {field:'c4',title:'审批状态',width:80,align:'center',formatter:function(value,row,index){
	        	var result;
	        	if($.cookie("unit")=="36" && row.jh_sbthcd<=4){
	        		result='<a href="javascript:sp('+"'"+row.id+"'"+','+row.jh_sbthcd+')" style="text-decoration:none;color:#3399CC;">审批</a>    |    ';
	        		result+='<a href="javascript:tuihui('+"'"+row.id+"'"+','+row.jh_sbthcd+')" style="text-decoration:none;color:#3399CC;">退回</a>';
	        	}else if(row.spzt=="1"){
	        		result="已审批";
	        	}else{
	        		result="审批   |  退回";
	        	}
	        	return result;
	        }},
	        {field:'sfylsjl',title:'是否有修建记录',width:80,align:'center',formatter:function(value,row,index){
	        	if(row.jckzhfz.bzls=='无')
	        		return '无';
	        	else if(row.jckzhfz.bzls=='有')
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
		},
		onLoadSuccess:function(data){
			querySumZhfz(jh,lx);
		}
	};
	gridBind(grid);
}
function zhfzxm_zjxd(jh,lx){
	var params={"jh.kgzt":jh.kgzt,"jh.jgzt":jh.jgzt,"jh.sbnf":jh.jhnf,"jh.jhkgsj":jh.jhkgsj,'jh.sfylsjl':jh.sfylsjl,
			"lx.lxjsdj":lx.lxjsdj,"lx.gydwbm":lx.gydwbm,"lx.xzqhdm":lx.xzqhdm,"lx.lxmc":lx.lxmc,'jh.jh_sbthcd':jh.jh_sbthcd};
	var grid={id:'grid',url:'../../../jhgl/queryZhfzList.do',pagination:true,rownumbers:false,
		pageNumber:1,pageSize:10,height:$(window).height()-150,width:$('#searchField').width(),queryParams:params,
	    columns:[[
	        {field:'c',title:'操作',width:150,align:'center',formatter:function(value,row,index){
	        	var result='';
	        	result+='<a href="javascript:locationXm('+"'"+row.jckzhfz.lxbm+"'"+')" style="text-decoration:none;color:#3399CC;">定位</a>    ';
	        	result+='<a href="javascript:openWindow('+"'"+row.id+"'"+')" style="text-decoration:none;color:#3399CC;">详细</a>';
	        	return result;
	        }},
	        {field:'zjxf',title:'资金下发',width:80,align:'center',formatter:function(value,row,index){
	        	return '<a href="javascript:openDialog('+"'zjxd_zhfz','灾害防治项目计划详情','../zjxd/zhfz.jsp'"+')" style="text-decoration:none;color:#3399CC;">资金下发</a>';
	        }},
	        {field:'c4',title:'建设状态',width:80,align:'center',
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
	        	if(row.jckzhfz.bzls=='无')
	        		return '无';
	        	else if(row.jckzhfz.bzls=='有')
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
				var params={"jh.sbzt":null,"jh.spzt":null,"jh.sbnf":null,"jh.jhkgsj":null,
						"jh.jhwgsj":null,"jh.pfztz":null,"lx.gydw":null,"lx.gydwdm":null,
						"lx.xzqhmc":null,"lx.xzqhdm":null,"lx.lxmc":null};
				if(readLoad=="true"){
					alert("移除成功！");
					gridObj.datagrid("reload",params);
				}
			},
			error:function(){
				alert("移除失败！");
			}
		});
}
function dropZhfzs(){
	var sel=gridObj.datagrid("getSelections");
	if(sel.length==0){
		alert("请选择要删除的计划！");
		return;
	}
	if(confirm("确认要移除选中计划？")){
		var id="",sckid="";
		$.each(sel,function(index,item){
			if(index==sel.length-1){
				id+=item.id;
				sckid+=item.sckid;
			}else{
				id+=item.id+",";
				sckid+=item.sckid+",";
			}
		});
		var params={'jh.id':id,'jh.sckid':sckid};
		$.ajax({
			type:'post',
			url:'../../../jhgl/dropZhfzById.do',
			dataType:'json',
			data:params,
			success:function(data){
				var params={"jh.sbzt":null,"jh.spzt":null,"jh.sbnf":null,"jh.jhkgsj":null,
						"jh.jhwgsj":null,"jh.pfztz":null,"lx.gydw":null,"lx.gydwdm":null,
						"lx.xzqhmc":null,"lx.xzqhdm":null,"lx.lxmc":null};
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
			'jh.jhsydfzcje':$('#zfzc').html(),
			'jh.sfsqablbz':$('#sfsqablbz').html(),
			'jh.ablbzsqwh':$('#ablbzwh').val(),
			'jh.bz':$('#jhbz').val(),
			'jh.sckid':$('#sckid').val(),'sc.scqdzh':$('#SCQDZH').val(),
			'sc.sczdzh':$('#SCZDZH').val(),'sc.sczlc':$('#SCZLC').val(),
			'sc.scyhlc':$('#SCYHLC').val(),'jh.jckzhfz.fapgdw':$('#FAPGDW').val(),
			'sc.fascdw':$('#FASCDW').val(),'jh.jckzhfz.faspsj':$('#FASPSJ').datebox('getValue'),
			'sc.spwh':$('#SPWH').val(),'sc.tzgs':$('#TZGS').val(),
			'sc.jsxz':$('#JSXZ').val(),'sc.jsnr':$('#JSNR').val(),
			'sc.scbz':$('#scbz').val(),'sc.sckid':$('#sckid').val()
	};
	$.ajax({
		type:'post',
		url:'../../../jhgl/editZhfzById.do',
		dataType:'json',
		data:jh,
		success:function(data){
			if(data.jh && data.sc){
				alert("修改成功！");
				parent.$('#grid').datagrid('reload');
				parent.$('#zhfz_edit').window('destroy');
			}
		}
	});
}
function downFile1(){
	parent.window.location.href="/jxzhpt/jhgl/downZhfzFile.do?jh.gkbgmc="+'gkbg'+"&jh.id="+$('#jhid').val();
}
function downFile2(){
	parent.window.location.href="/jxzhpt/jhgl/downZhfzFile.do?jh.gkbgmc="+'sjsgt'+"&jh.id="+$('#jhid').val();
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
		url:'../../../jhgl/editZhfzStatus.do',
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
