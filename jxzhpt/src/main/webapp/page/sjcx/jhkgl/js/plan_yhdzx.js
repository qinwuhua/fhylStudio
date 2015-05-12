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
		pageNumber:1,pageSize:10,height:$(window).height()-170,width:$('#searchField').width(),queryParams:params,
		columns:[[
		          {field:'ck',checkbox:true},
		          {field:'c',title:'操作',width:150,align:'center',formatter:function(value,row,index){
		        	  var result='<a href="javascript:locationXm('+"'"+row.plan_lx_yhdzxs[0].lxbm+"'"+')" style="text-decoration:none;color:#3399CC;">定位<a>    ';
		        	  result+='<a href="javascript:openWindow('+"'"+row.id+"'"+')" style="text-decoration:none;color:#3399CC;">详细</a>    ';
		        	  return result;
			      }},
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
	YMLib.UI.createWindow('add_yhdzxlx','添加路线',"/jxzhpt/page/jhgl/add/yhdzxlxAdd.jsp",'addyhdzxlx',880,330);
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
	if(confirm("确定要移除所选中的计划?移除后不能回复，如有需要请重新添加！")){
		var grid =$('#grid').datagrid('getSelections');
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
