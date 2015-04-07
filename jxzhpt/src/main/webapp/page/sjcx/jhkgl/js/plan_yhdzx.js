var gridObj;//列表对象
var oldIndex=-1;//之前选中的
var selRow=new Array();//已选择的行号
function querySumYhdzx(jh,lx){
	var param={'lx.gydwdm':lx.gydwdm,'jh.sbnf':jh.sbnf,'jh.sbzt':jh.sbzt,'jh.spzt':jh.spzt,'jh.jh_sbthcd':jh.jh_sbthcd};
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
				$('#lblXMLC').html("0");
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
function yhdzxxm(jh,lx){
	var params={'lx.gydwmc':lx.gydwmc,'lx.gydwdm':lx.gydwdm,'lx.xzqhmc':lx.xzqhmc,
			'lx.xzqhdm':lx.xzqhdm,'lx.lxmc':lx.lxmc,'lx.yjsdj':lx.yjsdj,'lx.lxbm':lx.lxbm,
			'jh.sbzt':jh.sbzt,'jh.spzt':jh.spzt,'jh.sbnf':jh.sbnf,
			'jh.jh_sbthcd':jh.jh_sbthcd,'lx.tsdq':lx.tsdq};
	var grid={id:'grid',url:'../../../jhgl/queryYhdzxList.do',pagination:true,rownumbers:false,
		pageNumber:1,pageSize:10,height:325,width:990,queryParams:params,
		columns:[[
		          {field:'ck',checkbox:true},
		          {field:'c',title:'操作',width:100,align:'center',formatter:function(value,row,index){
		        	  var result='<a href=javascript:locationXm("'+row.lxbm+'") style="text-decoration:none;color:#3399CC;">定位<a>    ';
		        	  result+='<a href="javascript:openDialog('+"'yhdzx_xx','养护大中修项目计划详情','../jhkxx/yhdzx.jsp'"+')" style="text-decoration:none;color:#3399CC;">详细</a>    ';
		        	  return result;
			      }},
			      {field:'lxbm',title:'路线编码',width:80,align:'center',
			    	  formatter:function(value,row,index){
			    		  return row.plan_lx_yhdzxs[0].lxbm;
			    	  }
			      },
			      {field:'lxmc',title:'路线名称',width:80,align:'center',
			    	  formatter:function(value,row,index){
			    		  return row.plan_lx_yhdzxs[0].lxmc;
			    	  }
			      },
			      {field:'gydw',title:'管养单位',width:150,align:'center',
			    	  formatter:function(value,row,index){
			    		  return row.plan_lx_yhdzxs[0].gydwmc;
			    	  }
			      },
			      {field:'xzqhmc',title:'行政区划名称',width:100,align:'center',
			    	  formatter:function(value,row,index){
			    		  return row.plan_lx_yhdzxs[0].xzqhmc;
			    	  }
			      },
			      {field:'qdzh',title:'起点桩号',width:60,align:'center',
			    	  formatter:function(value,row,index){
			    		  return row.plan_lx_yhdzxs[0].qdzh;
			    	  }
			      },
			      {field:'zdzh',title:'止点桩号',width:60,align:'center',
			    	  formatter:function(value,row,index){
			    		  return row.plan_lx_yhdzxs[0].zdzh;
			    	  }
			      },
			      {field:'lc',title:'起止里程',width:60,align:'center',
			    	  formatter:function(value,row,index){
			    		  return row.plan_lx_yhdzxs[0].qzlc;
			    	  }
			      },
			      {field:'hdlc',title:'核对里程',width:80,align:'center',
			    	  formatter:function(value,row,index){
			    		  return row.plan_lx_yhdzxs[0].hdlc;
			    	  }
			      },
			      {field:'jsdj',title:'技术等级',width:80,align:'center',
			    	  formatter:function(value,row,index){
			    		  return row.plan_lx_yhdzxs[0].yjsdj;
			    	  }
			      },
			      {field:'ylmkd',title:'原路面宽度',width:80,align:'center',
			    	  formatter:function(value,row,index){
			    		  return row.plan_lx_yhdzxs[0].ylmkd;
			    	  }
			      },
			      {field:'ylmlx',title:'原路面类型',width:80,align:'center',
			    	  formatter:function(value,row,index){
			    		  return row.plan_lx_yhdzxs[0].ylmlx;
			    	  }
			      },
			      {field:'gcfl',title:'工程分类',width:80,align:'center',
			    	  formatter:function(value,row,index){
			    		  return row.classify;
			    	  }
			      },
			      {field:'ztz',title:'总投资',width:80,align:'center',
			    	  formatter:function(value,row,index){
			    		  return row.totalinvest;
			    	  }
			      },
			      {field:'zbzzj',title:'总补助资金',width:100,align:'center',
			    	  formatter:function(value,row,index){
			    		  return row.totalsubsidyfund;
			    	  }
			      }
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
function queryYhdzxById(id){
	
}
