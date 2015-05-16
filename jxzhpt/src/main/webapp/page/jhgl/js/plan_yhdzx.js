var gridObj;//列表对象
var oldIndex=-1;//之前选中的
var selRow=new Array();//已选择的行号
var object=new Object();
function ckPQI(index){
	var data=$("#grid").datagrid('getRows')[index];
	object=data.plan_lx_yhdzxs;
	
	YMLib.UI.createWindow('pqi','PQI详情','/jxzhpt/page/jhgl/jhkgl/pqi.jsp','pqi',1000,450);
}
function closes(str){
	 parent.$('#'+str).window('destroy');
}
function querySumYhdzx(jh,lx){
	var param={'lx.gydwdm':lx.gydwdm,'lx.xzqhdm':lx.xzqhdm,'lx.lxmc':lx.lxmc,'lx.yjsdj':lx.yjsdj,'lx.lxbm':lx.lxbm,
			'jh.sbzt':jh.sbzt,'jh.spzt':jh.spzt,'jh.sbnf':jh.sbnf,
			'jh.jh_sbthcd':jh.jh_sbthcd,'lx.tsdq':lx.tsdq};
	$.ajax({
		type:'post',
		url:'../../../jhgl/querySumYhdzx.do',
		data:param,
		dataType:'json',
		success:function(data){
			if(data.id>0){
				$('#lblCount').html(data.id);
				$('#lblZLC').html(data.plan_lx_yhdzxs[0].qzlc);
				$('#lblHDLC').html(data.plan_lx_yhdzxs[0].hdlc);
				$('#lblZTZ').html(data.totalinvest);
				$('#lblZBZZJ').html(data.totalsubsidyfund);
			}else{
				$('#lblCount').html("0");
				$('#lblZLC').html("0");
				$('#lblHDLC').html("0");
				$('#lblZTZ').html("0");
				$('#lblZBZZJ').html("0");
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
	YMLib.UI.createWindow('yhdzx_xx','养护大中修项目计划详情',"/jxzhpt/page/jhgl/jhkxx/yhdzx.jsp",'yhdzx_xx',1000,500);
}
function openEditWindow(id){
	YMLib.Var.jhbm=id;
	YMLib.UI.createWindow('yhdzx_edit','养护大中修项目计划详情',"/jxzhpt/page/jhgl/edit/yhdzx.jsp",'yhdzx_edit',1000,500);
}
function yhdzxxm(jh,lx){
	var params={'lx.gydwdm':lx.gydwdm,'lx.xzqhdm':lx.xzqhdm,'lx.lxmc':lx.lxmc,'lx.yjsdj':lx.yjsdj,'lx.lxbm':lx.lxbm,
			'jh.sbzt':jh.sbzt,'jh.spzt':jh.spzt,'jh.sbnf':jh.sbnf,
			'jh.jh_sbthcd':jh.jh_sbthcd,'lx.tsdq':lx.tsdq};
	var grid={id:'grid',url:'../../../jhgl/queryYhdzxList.do',pagination:true,rownumbers:false,
		pageNumber:1,pageSize:10,height:$(window).height()-180,width:$('#searchField').width(),queryParams:params,
		columns:[[
		          {field:'ck',checkbox:true},
		          {field:'c',title:'操作',width:150,align:'center',formatter:function(value,row,index){
		        	  var result='<a href="javascript:locationXm('+"'"+row.plan_lx_yhdzxs[0].lxbm+"'"+')" style="text-decoration:none;color:#3399CC;">定位<a>    ';
		        	  result+='<a href="javascript:openWindow('+"'"+row.id+"'"+')" style="text-decoration:none;color:#3399CC;">详细</a>    ';
		        	  if((roleName()=="县级" && row.jh_sbthcd==0) || (roleName()=="市级" && row.jh_sbthcd<=2) || (roleName()=="省级" && row.jh_sbthcd<=4)){
		        		  result+='<a href="javascript:openEditWindow('+"'"+row.id+"'"+')" style="text-decoration:none;color:#3399CC;">编辑</a>    ';
			        	  result+='<a href="javascript:dropYhdzxs()" style="text-decoration:none;color:#3399CC;">移除</a>';
		        	  }else{
		        		  result+="编辑      移除";
		        	  }
		        	  return result;
			      }},
			      {field:'tjlx',title:'添加路线',width:80,align:'center',
			    	  formatter:function(value,row,index){
			        		if(row.jh_sbthcd==0){
				    			return '<a href="javascript:openAddSjlx('+"'"+row.id+"',"+"'"+row.sbnf+"'"+')" style="text-decoration:none;color:#3399CC;">添加路线</a>';
			        		}
				    		else{
				    			return '<a style="text-decoration:none;">添加路线</a>';
				    		}
			        	}
			      },
//			      {field:'c5',title:'资金追加',width:80,align:'center',
//			    	  formatter:function(value,row,index){
//			    		  return '<a href="javascript:openZjzjWindow('+"'grid','editYhZj'"+')" style="text-decoration:none;color:#3399CC;">资金追加</a>';
//			    	  }
//			      },
			      {field:'xmmc',title:'项目名称',width:100,align:'center'},
			      {field:'sbnf',title:'上报年份',width:80,align:'center'},
			      {field:'pqiccc',title:'PQI指标',width:80,align:'center',formatter:function(value,row,index){
			    	  return '<a href="#" style="text-decoration:none;color:#3399CC; " onclick="ckPQI('+index+')">'+row.pqi+'</a>';
			      }},
			      {field:'jhkgsj',title:'计划开工时间',width:100,align:'center'},
				  {field:'jhwgsj',title:'计划完工时间',width:100,align:'center'},
			      {field:'classify',title:'工程分类',width:80,align:'center'},
			      {field:'totalinvest',title:'总投资',width:80,align:'center'},
			      {field:'totalsubsidyfund',title:'总补助资金',width:100,align:'center'},
			      {field:'totalplacefund',title:'地方自筹资金',width:100,align:'center'}
		]],
		view: detailview,
		detailFormatter:function(index,row){   
	        return '<div style="padding:2px"><table id="table_lx' + index + '"></table></div>';   
	    },
	    onExpandRow: function(index,row){
	    	$('#table_lx'+index).datagrid({
	    		data:row.plan_lx_yhdzxs,
    			columns:[[
    			    {field:'gydwmc',title:'管养单位',width:200,align:'center'},    
    			    {field:'xzqhmc',title:'行政区划名称',width:100,align:'center'},
    			    {field:'lxmc',title:'路线名称',width:100,align:'center'},
    			    {field:'lxbm',title:'路线编码',width:100,align:'center'},
    			    {field:'ylmkd',title:'原路面宽度',width:80,align:'center'},
    			    {field:'yjsdj',title:'原技术等级',width:80,align:'center'},
    			    {field:'qdzh',title:'起点桩号',width:60,align:'center'},
    			    {field:'zdzh',title:'止点桩号',width:60,align:'center'},
    			    {field:'hdlc',title:'核对里程',width:60,align:'center'}
    			]]
	    	});
	    },
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
function openAddSjlx(id,nf){
	YMLib.Var.NF=nf;
	YMLib.Var.ID=id;
	YMLib.UI.createWindow('add_yhdzxlx','添加路线',"/jxzhpt/page/jhgl/add/yhdzxlxAdd.jsp",'addyhdzxlx',880,500);
}
function yhdzxxm_sb(jh,lx){
	var params={'lx.gydwmc':lx.gydwmc,'lx.gydwdm':lx.gydwdm,'lx.xzqhmc':lx.xzqhmc,
			'lx.xzqhdm':lx.xzqhdm,'lx.lxmc':lx.lxmc,'lx.yjsdj':lx.yjsdj,'lx.lxbm':lx.lxbm,
			'jh.sbzt':jh.sbzt,'jh.spzt':jh.spzt,'jh.sbnf':jh.sbnf,'jh.jh_sbthcd':jh.jh_sbthcd,'lx.tsdq':lx.tsdq};
	var grid={id:'grid',url:'../../../jhgl/queryYhdzxList.do',pagination:true,rownumbers:false,
		pageNumber:1,pageSize:10,height:$(window).height()-180,width:$('#searchField').width(),queryParams:params,
		columns:[[
		          {field:'ck',checkbox:true},
		          {field:'c',title:'操作',width:150,align:'center',formatter:function(value,row,index){
		        	  var result='<a href="javascript:locationXm('+"'"+row.plan_lx_yhdzxs[0].lxbm+"'"+')" style="text-decoration:none;color:#3399CC;">定位<a>    ';
		        	  result+='<a href="javascript:openWindow('+"'"+row.id+"'"+')" style="text-decoration:none;color:#3399CC;">详细</a>    ';
		        	  if((roleName()=="县级" && row.jh_sbthcd==0) || (roleName()=="市级" && row.jh_sbthcd<=2) || (roleName()=="省级" && row.jh_sbthcd<=4))
		        		  result+='<a href="javascript:openEditWindow('+"'"+row.id+"'"+')" style="text-decoration:none;color:#3399CC;">编辑</a>    ';
		        	  else
		        		  result+='编辑';
		        	  return result;
			      }},
			      {field:'sbzt',title:'上报状态',width:80,align:'center',
			    	  formatter:function(value,row,index){
			    		  var result="";
			    		  if((roleName()=="县级" && row.jh_sbthcd==0) || (roleName()=="市级" && row.jh_sbthcd<=2) || (roleName()=="省级" && row.jh_sbthcd<=4)){
			    			  result='<a href="javascript:sb('+"'"+row.id+"'"+','+row.jh_sbthcd+','+(row.plan_lx_yhdzxs[0].lmjg!="")+')" style="text-decoration:none;color:#3399CC;">上报</a>';
			    			  if(roleName()!="县级")
			    				  result+='   |    <a href="javascript:tuihui('+"'"+row.id+"'"+','+row.jh_sbthcd+')" style="text-decoration:none;color:#3399CC;">退回</a>';
			    		  }else{
			    			  result='<a style="text-decoration:none;color:black;">已上报</a>';
			    		  }
			    		  return result;
			    	  }
			      },
			      {field:'xmmc',title:'项目名称',width:100,align:'center'},
			      {field:'sbnf',title:'上报年份',width:80,align:'center'},
			      {field:'pqiccc',title:'PQI指标',width:80,align:'center',formatter:function(value,row,index){
			    	  return '<a href="#" style="text-decoration:none;color:#3399CC; " onclick="ckPQI('+index+')">'+row.pqi+'</a>';
			      }},
			      {field:'jhkgsj',title:'计划开工时间',width:100,align:'center'},
				  {field:'jhwgsj',title:'计划完工时间',width:100,align:'center'},
			      {field:'classify',title:'工程分类',width:80,align:'center'},
			      {field:'totalinvest',title:'总投资',width:80,align:'center'},
			      {field:'totalsubsidyfund',title:'总补助资金',width:100,align:'center'},
			      {field:'totalplacefund',title:'地方自筹资金',width:100,align:'center'}
		]],
		view: detailview,
		detailFormatter:function(index,row){   
	        return '<div style="padding:2px"><table id="table_lx' + index + '"></table></div>';   
	    },
	    onExpandRow: function(index,row){
	    	$('#table_lx'+index).datagrid({
	    		data:row.plan_lx_yhdzxs,
    			columns:[[
    			    {field:'gydwmc',title:'管养单位',width:200,align:'center'},    
    			    {field:'xzqhmc',title:'行政区划名称',width:100,align:'center'},
    			    {field:'lxmc',title:'路线名称',width:100,align:'center'},
    			    {field:'lxbm',title:'路线编码',width:100,align:'center'},
    			    {field:'ylmkd',title:'原路面宽度',width:80,align:'center'},
    			    {field:'yjsdj',title:'原技术等级',width:80,align:'center'},
    			    {field:'qdzh',title:'起点桩号',width:60,align:'center'},
    			    {field:'zdzh',title:'止点桩号',width:60,align:'center'},
    			    {field:'hdlc',title:'核对里程',width:60,align:'center'}
    			]]
	    	});
	    },
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
function yhdzxxm_sp(jh,lx){
	var params={'lx.gydwdm':lx.gydwdm,'lx.xzqhdm':lx.xzqhdm,'lx.lxmc':lx.lxmc,'lx.yjsdj':lx.yjsdj,'lx.lxbm':lx.lxbm,
			'jh.sbzt':jh.sbzt,'jh.spzt':jh.spzt,'jh.sbnf':jh.sbnf,'jh.jh_sbthcd':jh.jh_sbthcd,'lx.tsdq':lx.tsdq};
	var grid={id:'grid',url:'../../../jhgl/queryYhdzxList.do',pagination:true,rownumbers:false,
		pageNumber:1,pageSize:10,height:$(window).height()-180,width:$('#searchField').width(),queryParams:params,
		columns:[[
		          {field:'ck',checkbox:true},
		          {field:'c',title:'操作',width:150,align:'center',formatter:function(value,row,index){
		        	  var result='<a href="javascript:locationXm('+"'"+row.plan_lx_yhdzxs[0].lxbm+"'"+')" style="text-decoration:none;color:#3399CC;">定位<a>    ';
		        	  result+='<a href="javascript:openWindow('+"'"+row.id+"'"+')" style="text-decoration:none;color:#3399CC;">详细</a>    ';
		        	  if($.cookie("unit")=="36" && row.jh_sbthcd==4 && row.spzt=='0')
		        		  result+='<a href="javascript:openEditWindow('+"'"+row.id+"'"+')" style="text-decoration:none;color:#3399CC;">编辑</a>    ';
		        	  else
		        		  result+='编辑';
		        	  return result;
			      }},
			      {field:'sbzt',title:'上报状态',width:80,align:'center',
			    	  formatter:function(value,row,index){
			    		  var result="";
			    		  if($.cookie("unit")=="36" && row.jh_sbthcd==4 && row.spzt=='0'){
			    			  result='<a href="javascript:sp('+"'"+row.id+"'"+','+row.jh_sbthcd+')" style="text-decoration:none;color:#3399CC;">审批</a>   |    ';
			    			  result+='<a href="javascript:tuihui('+"'"+row.id+"'"+','+row.jh_sbthcd+')" style="text-decoration:none;color:#3399CC;">退回</a>';
			    		  }else if($.cookie("unit")!="36" && row.jh_sbthcd==4 && row.spzt=='0'){
			    			  result="审批      |    退回";
			    		  }else{
			    			  result='<a style="text-decoration:none;color:black;">已审批</a>';
			    		  }
			    		  return result;
			    	  }
			      },
			      {field:'xmmc',title:'项目名称',width:100,align:'center'},
			      {field:'sbnf',title:'上报年份',width:80,align:'center'},
			      {field:'pqiccc',title:'PQI指标',width:80,align:'center',formatter:function(value,row,index){
			    	  return '<a href="#" style="text-decoration:none;color:#3399CC; " onclick="ckPQI('+index+')">'+row.pqi+'</a>';
			      }},
			      {field:'jhkgsj',title:'计划开工时间',width:100,align:'center'},
				  {field:'jhwgsj',title:'计划完工时间',width:100,align:'center'},
			      {field:'classify',title:'工程分类',width:80,align:'center'},
			      {field:'totalinvest',title:'总投资',width:80,align:'center'},
			      {field:'totalsubsidyfund',title:'总补助资金',width:100,align:'center'},
			      {field:'totalplacefund',title:'地方自筹资金',width:100,align:'center'}
		]],
		view: detailview,
		detailFormatter:function(index,row){   
	        return '<div style="padding:2px"><table id="table_lx' + index + '"></table></div>';   
	    },
	    onExpandRow: function(index,row){
	    	$('#table_lx'+index).datagrid({
	    		data:row.plan_lx_yhdzxs,
    			columns:[[
    			    {field:'gydwmc',title:'管养单位',width:200,align:'center'},    
    			    {field:'xzqhmc',title:'行政区划名称',width:100,align:'center'},
    			    {field:'lxmc',title:'路线名称',width:100,align:'center'},
    			    {field:'lxbm',title:'路线编码',width:100,align:'center'},
    			    {field:'ylmkd',title:'原路面宽度',width:80,align:'center'},
    			    {field:'yjsdj',title:'原技术等级',width:80,align:'center'},
    			    {field:'qdzh',title:'起点桩号',width:60,align:'center'},
    			    {field:'zdzh',title:'止点桩号',width:60,align:'center'},
    			    {field:'hdlc',title:'核对里程',width:60,align:'center'}
    			]]
	    	});
	    },
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
function yhdzxxm_zjxd(jh,lx){
	var params={"jh.kgzt":jh.kgzt,"jh.jgzt":jh.jgzt,'lx.gydwdm':lx.gydwdm,'lx.xzqhdm':lx.xzqhdm,'lx.lxmc':lx.lxmc,'lx.yjsdj':lx.yjsdj,'lx.lxbm':lx.lxbm,
			'jh.sbzt':jh.sbzt,'jh.spzt':jh.spzt,'jh.sbnf':jh.sbnf,'jh.jh_sbthcd':jh.jh_sbthcd,'lx.tsdq':lx.tsdq};
	var grid={id:'grid',url:'../../../jhgl/queryYhdzxList.do',pagination:true,rownumbers:false,
		pageNumber:1,pageSize:10,height:$(window).height()-150,width:$('#searchField').width(),queryParams:params,
		columns:[[
		          {field:'ck',checkbox:true},
		          {field:'c',title:'操作',width:100,align:'center',formatter:function(value,row,index){
		        	  var result='<a href="javascript:locationXm('+"'"+row.plan_lx_yhdzxs[0].lxbm+"'"+')" style="text-decoration:none;color:#3399CC;">定位<a>    ';
		        	  result+='<a href="javascript:openWindow('+"'"+row.id+"'"+')" style="text-decoration:none;color:#3399CC;">详细</a>';
		        	  return result;
			      }},
			      {field:'zjxf',title:'资金下发',width:60,align:'center',
			    	  formatter:function(value,row,index){
				    	return '<a href="javascript:openDialog('+"'zjxd_yhdzx','养护大中修项目资金下达','../zjxd/yhdzx.jsp'"+')" style="text-decoration:none;color:#3399CC;">资金下发</a>';
			    	  }
			      },
			      {field:'xmmc',title:'项目名称',width:180,align:'center'},
			      {field:'sbnf',title:'上报年份',width:80,align:'center'},
			      {field:'pqiccc',title:'PQI指标',width:80,align:'center',formatter:function(value,row,index){
			    	  return '<a href="#" style="text-decoration:none;color:#3399CC; " onclick="ckPQI('+index+')">'+row.pqi+'</a>';
			      }},
			      {field:'jhkgsj',title:'计划开工时间',width:100,align:'center'},
				  {field:'jhwgsj',title:'计划完工时间',width:100,align:'center'},
			      {field:'classify',title:'工程分类',width:80,align:'center'},
			      {field:'totalinvest',title:'总投资',width:80,align:'center'},
			      {field:'totalsubsidyfund',title:'总补助资金',width:100,align:'center'},
			      {field:'totalplacefund',title:'地方自筹资金',width:100,align:'center'}
		]],
		view: detailview,
		detailFormatter:function(index,row){   
	        return '<div style="padding:2px"><table id="table_lx' + index + '"></table></div>';   
	    },
	    onExpandRow: function(index,row){
	    	$('#table_lx'+index).datagrid({
	    		data:row.plan_lx_yhdzxs,
    			columns:[[
    			    {field:'gydwmc',title:'管养单位',width:200,align:'center'},    
    			    {field:'xzqhmc',title:'行政区划名称',width:100,align:'center'},
    			    {field:'lxmc',title:'路线名称',width:100,align:'center'},
    			    {field:'lxbm',title:'路线编码',width:100,align:'center'},
    			    {field:'ylmkd',title:'原路面宽度',width:80,align:'center'},
    			    {field:'yjsdj',title:'原技术等级',width:80,align:'center'},
    			    {field:'qdzh',title:'起点桩号',width:60,align:'center'},
    			    {field:'zdzh',title:'止点桩号',width:60,align:'center'},
    			    {field:'hdlc',title:'核对里程',width:60,align:'center'}
    			]]
	    	});
	    },
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
	    view:grid.view,
	    detailFormatter:grid.detailFormatter,
	    onExpandRow:grid.onExpandRow
	});
	$('#'+grid.id).datagrid('resize',{width:$("body").width()*0.97});
}
function queryYhdzxById(id){
	$.ajax({
		type:'post',
		url:'../../../jhgl/queryYhdzxById.do',
		dataType:'json',
		data:'jh.id='+id,
		success:function(data){
			$('#lblYear').html(data.sbnf);
			$('#lbljhkgsj').html(data.jhkgsj);
			$('#lbljhwgsj').html(data.jhwgsj);
			$('#lbljhxdsj').html(data.xdsj);
			$('#lblLXMC').html(data.plan_lx_yhdzxs[0].lxmc);
			$('#lblLXBM').html(data.plan_lx_yhdzxs[0].lxbm);
			$('#lblGYDWMC').html(data.plan_lx_yhdzxs[0].gydwmc);
			$('#lblQDZH').html(data.plan_lx_yhdzxs[0].qdzh);
			$('#lblZDZH').html(data.plan_lx_yhdzxs[0].zdzh);
			$('#lblLC').html(data.plan_lx_yhdzxs[0].qzlc);
			$('#lblHDLC').html(data.plan_lx_yhdzxs[0].hdlc);
			$('#lblXZQHMC').html(data.plan_lx_yhdzxs[0].xzqhmc);
			$('#lblJSDJ').html(data.plan_lx_yhdzxs[0].yjsdj);
			$('#lblYLMKD').html(data.plan_lx_yhdzxs[0].ylmkd);
			$('#lblYLMLX').html(data.plan_lx_yhdzxs[0].ylmlx);
			$('#lblGCFL').html(data.classify);
			$('#lblSBJF').html(data.reportingfee);
			$('#lblHSJF').html(data.fee);
			$('#lblSDJF').html(data.newfee);
			$('#lblZTZ').html(data.totalinvest);
			$('#lblDFPTZTZ').html(data.totalplacefund);
			$('#lblZBZZJ').html(data.totalsubsidyfund);
			$('#lblLJBZZJ').html(data.accumulativesubsidyfund);
			$('#lblBNBZZJ').html(data.nowyearsubsidyfund);
			$('#lblDC').html(data.dianceng);
			$('#lblJC').html(data.jiceng);
			$('#lblMC').html(data.surface);
			$('#lblXJBS').html(data.mark);
			$('#lblPQI').html(data.pqi);
			$('#lblJTL').html(data.aadt);
			$('#lblSGTWH').html(data.constructnumber);
			$('#lblGKPFWH').html(data.replynumber);
			$('#lblSJPFWH').html(data.devisenumber);
			$('#lblJHXDWH').html(data.plandownnumber);
			$('#lblYLMHD').html(data.plan_lx_yhdzxs[0].ylmhd);
			$('#lblJSCZMS').html(data.description);
			$('#lblXCHSQK').html(data.xchsqk);
			$('#lblSTCBZ').html(data.remarks);
			$('#lblQTBZ').html(data.qtbz);
			
			var lmdate=$.parseJSON(data.plan_lx_yhdzxs[0].lmjg);
			if(data.plan_lx_yhdzxs[0].lmjg!=""){
				loadYhdzxcs(lmdate,"上面层","smc");
				loadYhdzxcs(lmdate,"中面层","zmc");
				loadYhdzxcs(lmdate,"下面层","xmc");
				loadYhdzxcs(lmdate,"封层","fc");
				loadYhdzxcs(lmdate,"上基层","sjc");
				loadYhdzxcs(lmdate,"中基层","zjc");
				loadYhdzxcs(lmdate,"下基层","xjc");
				loadYhdzxcs(lmdate,"垫层","dc");
				loadYhdzxcs(lmdate,"原路","yl");
			}
			if(data.plan_lx_yhdzxs[0].aym!=""){
				$.each(JSON.parse(data.plan_lx_yhdzxs[0].aym),function(index,item){
					var html='<tr align="center" id="'+item.id+'"><td align="center" height="30" style="border:1px solid #c0c0c0;"<span>'+item.xmmc+'</span></td><td align=="center" style="border:1px solid #C0C0C0;"><span>'+item.sm+'</span></td><td align="center" width="50" style="border:1px solid #C0C0C0;"><span>'+item.cd+'</span></td><td align="center" width="100" style="border:1px solid #C0C0C0;"><span>'+item.dj+'</span></td></tr>';
					$('#ymtr').after(html);
				});
			}
			if(data.plan_lx_yhdzxs[0].asl!=""){
				$.each(JSON.parse(data.plan_lx_yhdzxs[0].asl),function(index,item){
					var html='<tr align="center" id="'+item.id+'"><td align="center" height="30" style="border: 1px solid #C0C0C0;"><span>'+item.xmmc+'</span></td><td align="center" style="border: 1px solid #C0C0C0;"><span>'+item.sm+'</span></td><td align="center" width="50" style="border: 1px solid #C0C0C0;"><span>'+item.sl+'</span></td><td align="center" width="100" style="border: 1px solid #C0C0C0;"><span>'+item.dj+'</span></td></tr>';
					$('#asltr').after(html);
				});
			}
			if(data.plan_lx_yhdzxs[0].glf!=""){
				$('#seldw').val(JSON.parse(data.plan_lx_yhdzxs[0].glf).dw);
				$('#txtglfdj').html(JSON.parse(data.plan_lx_yhdzxs[0].glf).dj);
				$('#lblysdj').html(JSON.parse(data.plan_lx_yhdzxs[0].glf).ysdj);
				$('#lblpgdj').html(JSON.parse(data.plan_lx_yhdzxs[0].glf).pgdj);
			}
		}
	});
}
function dropYhdzx(id){
	$.ajax({
		type:'post',
		url:'../../../jhgl/dropYhdzxById.do',
		dataType:'json',
		data:'jh.id='+id,
		success:function(data){
			if(data.result){
				alert("移除成功！");
				searchYhdzx();
			}
		}
	});
}
function dropYhdzxs(){
	var grid =$('#grid').datagrid('getSelections');
	if(grid.length==0){
		alert("请选择要删除的计划！");
		return;
	}
	if(confirm("确定要移除所选中的计划?移除后不能回复，如有需要请重新添加！")){
		var id="";
		$.each(grid,function(index,item){
				if(index==grid.length-1){
					id+=item.id;
				}else{
					id+=item.id+",";
				}
		});
		$.ajax({
			type:'post',
			url:'../../../jhgl/dropYhdzxById.do',
			dataType:'json',
			data:'jh.id='+id,
			async:false,
			success:function(data){
				if(data.jh && data.lx){
					alert("移除成功！");
					searchYhdzx();
				}
			}
		});
	}
}
function editStatus(jh){
	var result;
	$.ajax({
		type:'post',
		url:'../../../jhgl/editYhdzxStatus.do',
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
function exportYh(filename){
	window.location.href="/jxzhpt/xtgl/getModule_jhfeiLw.do?moduleName="+filename;
}
///////////////////////////////////////养护大中修路面结构加载和计算
/**
 * 根据对应结构，加载结构的下拉信息
 */
function loadCslx(id,cslx){
	$.ajax({
		type:'post',
		url:'../../../xtgl/queryYhdzxcsByLx.do',
		dataType:'json',
		async:'false',
		data:'yhdzxcs.cslx='+cslx,
		success:function(result){
			var n={clmc:'---请选择---',id:''};
			result.splice(0,0,n);
			$('#'+id).combobox({
			    data:result,
			    valueField:'id',
			    textField:'clmc',
			    onChange:function(newValue,oldValue){
			    	var lx=id.substring(3);
			    	if(newValue!=""){
			    		$.ajax({
				    		type:'post',
							url:'../../../xtgl/queryYhdzxcsById.do',
							dataType:'json',
							data:'yhdzxcs.id='+newValue,
							success:function(result2){
								$('#txt'+lx+'dj').val(result2.lfmdj);
								$('#txt'+lx+'sddj').val(result2.sddj);
							}
				    	});
			    	}else{
			    		$('#txt'+lx+'dj').val("0");
						$('#txt'+lx+'sddj').val("0");
			    	}
			    }
			}); 
		}
	});
}
/**
 * 加载选择对应的下拉信息
 * @param date
 * @param cslx
 * @param cs
 */
function loadYhdzxcs(date,cslx,cs){
	$('#sel'+cs).combobox("setValue",date[cslx].clmc);
	$('#txt'+cs+'hd').html(date[cslx].hd);
	$('#txt'+cs+'dj').html(date[cslx].dj);
	$('#txt'+cs+'sddj').html(date[cslx].sddj);
}
/**
 * 添加延米
 */
function addym(){
	var  myDate = new Date();
	var id=myDate.getFullYear()+""+(myDate.getMonth()+1)+""+myDate.getDate()+""+
		myDate.getHours()+""+myDate.getMinutes()+""+myDate.getSeconds()+""+myDate.getMilliseconds();
	var html='<tr align="center" id="'+id+'"><td align="center" height="30" style="border: 1px solid #C0C0C0;"><input type="text" style="width: 180px;"/></td><td align="center" style="border: 1px solid #C0C0C0;"><input type="text" style="width:100px;"/></td><td align="center" width="50" style="border: 1px solid #C0C0C0;"><input type="text" style="width:50px;"/></td><td align="center" width="100" style="border: 1px solid #C0C0C0;"><input type="text" style="width:80px;"/></td><td align="center" width="100" style="border: 1px solid #C0C0C0;"><a href="javascript:removeym('+"'"+id+"'"+')" style="text-decoration: none;color: blue;">删除</a></td></tr>';
	$('#ymtr').after(html);
}
/**
 * 添加按数量
 */
function addasl(){
	var  myDate = new Date();
	var id=myDate.getFullYear()+""+(myDate.getMonth()+1)+""+myDate.getDate()+""+
		(myDate.getHours()+1)+""+(myDate.getMinutes()+1)+""+(myDate.getSeconds()+1)+""+myDate.getMilliseconds();
	var html='<tr align="center" id="'+id+'"><td align="center" height="30" style="border: 1px solid #C0C0C0;"><input type="text" style="width: 180px;"/></td><td align="center" style="border: 1px solid #C0C0C0;"><input type="text" style="width:100px;"/></td><td align="center" width="50" style="border: 1px solid #C0C0C0;"><input type="text" style="width:50px;"/></td><td align="center" width="100" style="border: 1px solid #C0C0C0;"><input type="text" style="width:80px;"/></td><td align="center" width="100" style="border: 1px solid #C0C0C0;"><a href="javascript:removeasl('+"'"+id+"'"+')" style="text-decoration: none;color: blue;">删除</a></td></tr>';
	$('#asltr').after(html);
}
/**
 * 移除延米
 * @param id
 */
function removeym(id){
	$('#'+id).remove();
}
/**
 * 移除数量
 * @param id
 */
function removeasl(id){
	$('#'+id).remove();
}
function reckonsum(){
	if($('#ztz').val()==""){
		alert("请填写总投资金额！");
		return;
	}
	var lmjg=0,ym=0,sl=0,glf=0,zjg=0;
	lmjgjson="{";//最后将路面结构、按延米、按数量、管理费的数据存储到json格式的字符串中
	var ljkdzj='"路基宽度增加":{"ljkd":"'+$('#ljkdzj').is(":checked")+'"}';
	lmjgjson+=ljkdzj+",";
	var smc= reckon($('#txtyhdzxkd').val(),$('#txtsmchd').val(),$('#txtsmcdj').val());
	var sdsmc= reckon($('#txtyhdzxkd').val(),$('#txtsmchd').val(),$('#txtsmcsddj').val());
	var smcjson='"上面层":{"clmc":"'+$('#selsmc').combobox("getValue")+
		'","hd":"'+$('#txtsmchd').val()+'","dj":"'+$('#txtsmcdj').val()+
		'","sddj":"'+$('#txtsmcsddj').val()+'"}';
	lmjgjson+=smcjson+",";
	var zmc= reckon($('#txtyhdzxkd').val(),$('#txtzmchd').val(),$('#txtzmcdj').val());
	var sdzmc= reckon($('#txtyhdzxkd').val(),$('#txtzmchd').val(),$('#txtzmcsddj').val());
	var zmcjson='"中面层":{"clmc":"'+$('#selzmc').combobox("getValue")+
	'","hd":"'+$('#txtzmchd').val()+'","dj":"'+$('#txtzmcdj').val()+
	'","sddj":"'+$('#txtzmcsddj').val()+'"}';
	lmjgjson+=zmcjson+",";
	
	var xmc= reckon($('#txtyhdzxkd').val(),$('#txtxmchd').val(),$('#txtxmcdj').val());
	var sdxmc= reckon($('#txtyhdzxkd').val(),$('#txtxmchd').val(),$('#txtxmcsddj').val());
	var xmcjson='"下面层":{"clmc":"'+$('#selxmc').combobox("getValue")+
	'","hd":"'+$('#txtxmchd').val()+'","dj":"'+$('#txtxmcdj').val()+
	'","sddj":"'+$('#txtxmcsddj').val()+'"}';
	lmjgjson+=xmcjson+",";
	
	var fc= reckon($('#txtyhdzxkd').val(),$('#txtfchd').val(),$('#txtfcdj').val());
	var sdfc= reckon($('#txtyhdzxkd').val(),$('#txtfchd').val(),$('#txtfcsddj').val());
	var fcjson='"封层":{"clmc":"'+$('#selfc').combobox("getValue")+
	'","hd":"'+$('#txtfchd').val()+'","dj":"'+$('#txtfcdj').val()+
	'","sddj":"'+$('#txtfcsddj').val()+'"}';
	lmjgjson+=fcjson+",";
	
	var sjc= reckon($('#ljkdzj').is(":checked") ?  Number($('#txtyhdzxkd').val())+Number(0.5) : $('#txtyhdzxkd').val(),
			$('#txtsjchd').val(),$('#txtsjcdj').val());
	var sdsjc= reckon($('#ljkdzj').is(":checked") ?  Number($('#txtyhdzxkd').val())+Number(0.5) : $('#txtyhdzxkd').val(),
			$('#txtsjchd').val(),$('#txtsjcsddj').val());
	var sjcjson='"上基层":{"clmc":"'+$('#selsjc').combobox("getValue")+
	'","hd":"'+$('#txtsjchd').val()+'","dj":"'+$('#txtsjcdj').val()+
	'","sddj":"'+$('#txtsjcsddj').val()+'"}';
	lmjgjson+=sjcjson+",";
	
	var zjc= reckon($('#ljkdzj').is(":checked") ?  Number($('#txtyhdzxkd').val())+Number(0.5) : $('#txtyhdzxkd').val(),
			$('#txtzjchd').val(),$('#txtzjcdj').val());
	var sdzjc= reckon($('#ljkdzj').is(":checked") ?  Number($('#txtyhdzxkd').val())+Number(0.5) : $('#txtyhdzxkd').val(),
			$('#txtzjchd').val(),$('#txtzjcsddj').val());
	var zjcjson='"中基层":{"clmc":"'+$('#selzjc').combobox("getValue")+
	'","hd":"'+$('#txtzjchd').val()+'","dj":"'+$('#txtzjcdj').val()+
	'","sddj":"'+$('#txtzjcsddj').val()+'"}';
	lmjgjson+=zjcjson+",";
	
	var xjc= reckon($('#ljkdzj').is(":checked") ?  Number($('#txtyhdzxkd').val())+Number(0.5) : $('#txtyhdzxkd').val(),
			$('#txtxjchd').val(),$('#txtxjcdj').val());
	var sdxjc= reckon($('#ljkdzj').is(":checked") ?  Number($('#txtyhdzxkd').val())+Number(0.5) : $('#txtyhdzxkd').val(),
			$('#txtxjchd').val(),$('#txtxjcsddj').val());
	var xjcjson='"下基层":{"clmc":"'+$('#selxjc').combobox("getValue")+
	'","hd":"'+$('#txtxjchd').val()+'","dj":"'+$('#txtxjcdj').val()+
	'","sddj":"'+$('#txtxjcsddj').val()+'"}';
	lmjgjson+=xjcjson+",";
	
	var dc= reckon($('#txtyhdzxkd').val(),$('#txtdchd').val(),$('#txtdcdj').val());
	var sddc= reckon($('#txtyhdzxkd').val(),$('#txtdchd').val(),$('#txtdcsddj').val());
	var dcjson='"垫层":{"clmc":"'+$('#seldc').combobox("getValue")+
	'","hd":"'+$('#txtdchd').val()+'","dj":"'+$('#txtdcdj').val()+
	'","sddj":"'+$('#txtdcsddj').val()+'"}';
	lmjgjson+=dcjson+",";
	
	var yl= reckon($('#txtyhdzxkd').val(),$('#txtylhd').val(),$('#txtyldj').val());
	var sdyl= reckon($('#txtyhdzxkd').val(),$('#txtylhd').val(),$('#txtylsddj').val());
	var yljson='"原路":{"clmc":"'+$('#selyl').combobox("getValue")+
	'","hd":"'+$('#txtylhd').val()+'","dj":"'+$('#txtyldj').val()+
	'","sddj":"'+$('#txtylsddj').val()+'"}';
	lmjgjson+=yljson+"}";
	lmjg=smc+zmc+xmc+fc+sjc+zjc+xjc+dc+yl;
	alert(lmjg);
	//获取延米集合
	ymjson=new Array();//存储延米数据的json
	var ymArray=$("#ymtab tr:gt(0)");
	$.each(ymArray,function(index,item){
		var ymMessage=$("#"+item.id+" input[type=text]");
		ym+=($(ymMessage[2]).val())*($(ymMessage[3]).val())/10000;
		var y={id:item.id,xmmc:$(ymMessage[0]).val(),sm:$(ymMessage[1]).val(),
				cd:$(ymMessage[2]).val(),dj:$(ymMessage[3]).val()};
		ymjson.push(y);
	});
	//获取数量集合，计算价格
	sljson=new Array();
	var slArray=$("#sltab tr:gt(0)");
	$.each(slArray,function(index,item){
		var slMessage=$("#"+item.id+" input[type=text]");
		sl+=($(slMessage[2]).val())*($(slMessage[3]).val())/10000;
		var s={id:item.id,xmmc:$(slMessage[0]).val(),sm:$(slMessage[1]).val(),
				sl:$(slMessage[2]).val(),dj:$(slMessage[3]).val()};
		sljson.push(s);
	});
	//计算总单价
	zjg=lmjg+ym+sl;
	//评估价格
	var pgjg=sdsmc+sdzmc+sdxmc+sdfc+sdsjc+sdzjc+sdxjc+sddc+sdyl+ym+sl;
	if($('#seldw').val()=="百分比"){
		zjg=zjg*(1+$('#txtglfdj').val()/100);
		pgjg=pgjg*(1+$('#txtglfdj').val()/100);
	}else if($('#seldw').val()=="公里"){
		zjg=zjg+$('#txtglfdj').val()/10000;
		pgjg=pgjg+$('#txtglfdj').val()/10000;
	}
	pgjg=pgjg.toFixed(3);
	glfjson={dw:$('#seldw').val(),dj:$('#txtglfdj').val(),ysdj:zjg.toFixed(3),pgdj:pgjg};
	
	$('#lblysdj').html(zjg.toFixed(3));
	$('#lblpgdj').html(pgjg);
	$('#lxhsjf').html((zjg.toFixed(3)*($('#txtHDLC').val())).toFixed(3));
	$('#lxspjf').html((pgjg*(Number($('#txtHDLC').val()))).toFixed(3));
	$('#dfptztz').html(($('#ztz').val()-$('#lxspjf').html()).toFixed(3));
	$('#zbzzj').html($('#lxspjf').html());
}
function reckon(kd,hd,dj){
	return (kd*(hd/100)*1000)*dj/10000;
}
function reckonsd(kd,hd,sddj){
	return (kd*(hd/100)*1000)*sddj/10000;
}