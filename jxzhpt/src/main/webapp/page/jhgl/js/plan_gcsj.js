var gridObj;//列表对象
var oldIndex=-1;//之前选中的
var selRow=new Array();//已选择的行号
function queryGcsjSum(jh,lx){
	var param={"jh.sbzt":jh.sbzt,"jh.spzt":jh.spzt,"jh.jhnf":jh.jhnf,'jh.sfylsjl':jh.sfylsjl,'jh.jh_sbthcd':jh.jh_sbthcd,
			"lx.gydw":lx.gydw,"lx.gydwdm":lx.gydwdm,"lx.xzqhmc":lx.xzqhmc,"lx.xzqhdm":lx.xzqhdm,
			"lx.lxmc":lx.lxmc,'lx.yjsdj':lx.yjsdj,'lx.tsdqbm':lx.tsdqbm};
	$.ajax({
		type:'post',
		url:'../../../jhgl/queryGcsjSum.do',
		data:param,
		dataType:'json',
		success:function(data){
			if(data.id>0){
				$('#lblCount').html(data.id);
				$('#lblZLC').html(data.plan_lx_gcsjs[0].qzlc);
				$('#lblXMLC').html(data.plan_lx_gcsjs[0].xmlc);
				$('#lblZTZ').html(data.pftz);
				$('#lblBTZ').html(data.jhsybbzje);
				$('#lblDFTZ').html(data.jhsydfzczj);
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
function openWindow(id){
	YMLib.Var.jhbm=id;
	YMLib.UI.createWindow('gclmsj_xx','工程改造路面升级项目计划详情',"/jxzhpt/page/jhgl/jhkxx/gclmsj.jsp",'gclmsj_xx',1000,500);
}
function openEditWindow(id){
	YMLib.Var.jhbm=id;
	YMLib.UI.createWindow('gclmsj_edit','工程改造路面升级项目计划详情',"/jxzhpt/page/jhgl/edit/gclmsj.jsp",'gclmsj_edit',1000,500);
}
function openLsjlWindow(id,index){
	YMLib.Var.Row = $('#'+id).datagrid("getSelected");
	YMLib.UI.createWindow('sjlsxx','工程改造路面升级历史信息',"/jxzhpt/page/jhgl/jhkgl/sjlsxx.jsp",'sjlsxx',1000,300);
}
//工程路面升级
function gclmsjxm(jh,lx){
	selectRow={};//每次查询清空选择数据
	var params={"jh.sbzt":jh.sbzt,"jh.spzt":jh.spzt,"jh.jhnf":jh.jhnf,'jh.sfylsjl':jh.sfylsjl,'jh.jh_sbthcd':jh.jh_sbthcd,
			"lx.gydw":lx.gydw,"lx.gydwdm":lx.gydwdm,"lx.xzqhdm":lx.xzqhdm,
			"lx.lxmc":lx.lxmc,'lx.yjsdj':lx.yjsdj,'lx.tsdqbm':lx.tsdqbm};
	var grid={id:'grdab',url:'../../../jhgl/queryGcsjList.do',pagination:true,queryParams:params,
		rownumbers:false,pageNumber:1,pageSize:10,height:$(window).height()-180,width:$('#searchField').width(),
		columns:[[
		    {field:'ck',checkbox:true},
			{field:'c',title:'操作',width:150,align:'center',formatter:function(value,row,index){
				var result='<a href="javascript:locationXm('+"'"+row.plan_lx_gcsjs[0].lxbm+"'"+')" style="text-decoration:none;color:#3399CC;">定位</a>    ';
				result+='<a href="javascript:openWindow('+"'"+row.id+"'"+')" style="text-decoration:none;color:#3399CC;">详细</a>    ';
				if((roleName()=="县级" && row.jh_sbthcd==0) || (roleName()=="市级" && row.jh_sbthcd<=2) || (roleName()=="省级" && row.jh_sbthcd<=4)){
					var id="'"+row.id+"'";
					result+='<a href="javascript:openEditWindow('+"'"+row.id+"'"+')" style="text-decoration:none;color:#3399CC;">编辑</a>    ';
					result+='<a href="javascript:dropGcsjs()" style="text-decoration:none;color:#3399CC;">移除</a>';
				}else{
					result+="编辑          移除";
				}
				return result;
			}},
			{field:'lxtj',title:'添加路线',width:80,align:'center',
				formatter:function(value,row,index){
					if(row.jh_sbthcd==0)
		    			return '<a href="javascript:openAddSjlx('+"'"+row.id+"',"+"'"+row.jhnf+"'"+')" style="text-decoration:none;color:#3399CC;">添加路线</a>';
		    		else
		    			return '<a style="text-decoration:none;">添加路线</a>';
				}
			},
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
//			{field:'c5',title:'资金追加',width:80,align:'center',formatter:function(value,row,index){
//				var id="'"+row.id+"'";
//        		return '<a href="javascript:openZjxd('+"'gclmsj_xx'"+','+"'资金追加'"+','+"'../zjxd/zjzj.jsp'"+',500,300,'+"'"+row.id+"'"+')" style="text-decoration:none;color:#3399CC;">资金追加</a>';
//			}},
		  	{field:'jhnf',title:'上报年份',width:80,align:'center'},
		  	{field:'sfylsjl',title:'是否有历史记录',width:100,align:'center',
		  		formatter:function(value,row,index){
		  			if(value=="是"){
		  				return '<a href="javascript:openLsjlWindow('+"'grdab'"+",'"+index+"'"+')" style="text-decoration:none;color:#3399CC;">是</a>';
		  			}else{
		  				return "否";
		  			}
		  		}
		  	},
		  	{field:'jhkgsj',title:'计划开工时间',width:100,align:'center'},
		  	{field:'jhwgsj',title:'计划完工时间',width:100,align:'center'},
		    {field:'pftz',title:'批复总投资',width:80,align:'center'},
		    {field:'jhsybbzje',title:'部补助资金',width:80,align:'center'},
		    {field:'jhsydfzczj',title:'地方自筹资金',width:80,align:'center'}
	    ]],
	    view: detailview,
		detailFormatter:function(index,row){   
	        return '<div style="padding:2px"><table id="table_lx' + index + '"></table></div>';   
	    },
	    onExpandRow: function(index,row){
	    	$('#table_lx'+index).datagrid({
	    		data:row.plan_lx_gcsjs,
    			columns:[[
    			    {field:'gydw',title:'管养单位',width:200,align:'center'},
    			    {field:'xzqhmc',title:'行政区划名称',width:100,align:'center'},
    			    {field:'lxmc',title:'路线名称',width:100,align:'center'},
    			    {field:'lxbm',title:'路线编码',width:100,align:'center'},
    			    {field:'qdzh',title:'起点桩号',width:60,align:'center'},
    			    {field:'zdzh',title:'止点桩号',width:60,align:'center'},
    			    {field:'xmlc',title:'项目里程',width:60,align:'center'}
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
	YMLib.UI.createWindow('add_sjlx','添加路线',"/jxzhpt/page/jhgl/add/lmsjlxAdd.jsp",'addsjlx',900,380);
}
function gclmsjxm_sb(jh,lx){
	var params={"jh.sbzt":jh.sbzt,"jh.spzt":jh.spzt,"jh.jhnf":jh.jhnf,"jh.jh_sbthcd":jh.jh_sbthcd,'jh.sfylsjl':jh.sfylsjl,
			"lx.gydw":lx.gydw,"lx.gydwdm":lx.gydwdm,"lx.xzqhmc":lx.xzqhmc,
			"lx.xzqhdm":lx.xzqhdm,"lx.lxmc":lx.lxmc,'lx.yjsdj':lx.yjsdj,'lx.tsdqbm':lx.tsdqbm};
	var grid={id:'grdab',url:'../../../jhgl/queryGcsjList.do',striped:true,pagination:true,
		rownumbers:false,pageNumber:1,pageSize:10,height:$(window).height()-180,width:$('#searchField').width(),queryParams:params,
		columns:[[
		    {field:'ck',checkbox:true},
			{field:'c',title:'操作',width:150,align:'center',formatter:function(value,row,index){
				var result="";
				result+='<a href="javascript:locationXm('+"'"+row.plan_lx_gcsjs[0].lxbm+"'"+')" style="text-decoration:none;color:#3399CC;">定位</a>    ';
				result+='<a href="javascript:openWindow('+"'"+row.id+"'"+')" style="text-decoration:none;color:#3399CC;">详细</a>    ';
				if((roleName()=="县级" && row.jh_sbthcd==0) || (roleName()=="市级" && row.jh_sbthcd<=2) || (roleName()=="省级" && row.jh_sbthcd<=4))
					result+='<a href="javascript:openEditWindow('+"'"+row.id+"'"+')" style="text-decoration:none;color:#3399CC;">编辑</a>';
				else
					result+='编辑';
				return result;
			}},
			{field:'c4',title:'上报状态',width:80,align:'center',formatter:function(value,row,index){
				var result="";
				if((roleName()=="县级" && row.jh_sbthcd==0) || (roleName()=="市级" && row.jh_sbthcd<=2) || (roleName()=="省级" && row.jh_sbthcd<=4)){
					result='<a href="javascript:sb('+"'"+row.id+"'"+','+row.jh_sbthcd+')" style="text-decoration:none;color:#3399CC;">上报</a>';
					if(roleName()=="市级" && row.jh_sbthcd==2)
						result+='    |    <a href="javascript:tuihui('+"'"+row.id+"'"+','+row.jh_sbthcd+')" style="text-decoration:none;color:#3399CC;">退回</a>';
				}else{
					result="已上报";
				}
				return result;
			}},
		  	{field:'jhnf',title:'上报年份',width:80,align:'center'},
		  	{field:'jhkgsj',title:'计划开工时间',width:100,align:'center'},
		  	{field:'jhwgsj',title:'计划完工时间',width:100,align:'center'},
		    {field:'pftz',title:'批复总投资',width:80,align:'center'},
		    {field:'jhsybbzje',title:'部补助资金',width:80,align:'center'},
		    {field:'jhsydfzczj',title:'地方自筹资金',width:80,align:'center'}
	    ]],
	    view: detailview,
		detailFormatter:function(index,row){   
	        return '<div style="padding:2px"><table id="table_lx' + index + '"></table></div>';   
	    },
	    onExpandRow: function(index,row){
	    	$('#table_lx'+index).datagrid({
	    		data:row.plan_lx_gcsjs,
    			columns:[[
    			    {field:'gydw',title:'管养单位',width:200,align:'center'},
    			    {field:'xzqhmc',title:'行政区划名称',width:100,align:'center'},
    			    {field:'lxmc',title:'路线名称',width:100,align:'center'},
    			    {field:'lxbm',title:'路线编码',width:100,align:'center'},
    			    {field:'qdzh',title:'起点桩号',width:60,align:'center'},
    			    {field:'zdzh',title:'止点桩号',width:60,align:'center'},
    			    {field:'xmlc',title:'项目里程',width:60,align:'center'}
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
function gclmsjxm_sh(jh,lx){
	var params={"jh.sbzt":jh.sbzt,"jh.spzt":jh.spzt,"jh.jhnf":jh.jhnf,"jh.jh_sbthcd":jh.jh_sbthcd,'jh.sfylsjl':jh.sfylsjl,
			"lx.gydw":lx.gydw,"lx.gydwdm":lx.gydwdm,"lx.xzqhmc":lx.xzqhmc,
			"lx.xzqhdm":lx.xzqhdm,"lx.lxmc":lx.lxmc,'lx.yjsdj':lx.yjsdj,'lx.tsdqbm':lx.tsdqbm};
	var grid={id:'grdab',url:'../../../jhgl/queryGcsjList.do',striped:true,pagination:true,
		rownumbers:false,pageNumber:1,pageSize:10,height:$(window).height()-180,width:$('#searchField').width(),queryParams:params,
		columns:[[
		    {field:'ck',checkbox:true},
			{field:'c',title:'操作',width:150,align:'center',formatter:function(value,row,index){
				var result='<a href="javascript:locationXm('+"'"+row.plan_lx_gcsjs[0].lxbm+"'"+')" style="text-decoration:none;color:#3399CC;">定位</a>   ';
				result+='<a href="javascript:openWindow('+"'"+row.id+"'"+')" style="text-decoration:none;color:#3399CC;">详细</a>    ';
				if($.cookie("unit")=="36" && row.jh_sbthcd==4)
					result+='<a href="javascript:openEditWindow('+"'"+row.id+"'"+')" style="text-decoration:none;color:#3399CC;">编辑</a>';
				else
					result+='编辑';
				return result;
			}},
			{field:'c1',title:'审批状态',width:80,align:'center',formatter:function(value,row,index){
				var result="";
				if($.cookie("unit")=="36" && row.jh_sbthcd==4 && row.spzt=="0"){
					result='<a href="javascript:sp('+"'"+row.id+"'"+','+row.jh_sbthcd+')" style="text-decoration:none;color:#3399CC;">审批</a>    |    ';
					result+='<a href="javascript:tuihui('+"'"+row.id+"'"+','+row.jh_sbthcd+')" style="text-decoration:none;color:#3399CC;">退回</a>';
				}else if($.cookie("unit")!="36" && row.jh_sbthcd==4 && row.spzt=="0"){
					result="审批      |    退回";
				}else if(row.spzt=="1"){
					result="已审批";
				}
				return result;
			}},
			{field:'sfylsjl',title:'是否有修建记录',width:80,align:'center'},
		  	{field:'jhnf',title:'上报年份',width:80,align:'center'},
		  	{field:'jhkgsj',title:'计划开工时间',width:100,align:'center'},
		  	{field:'jhwgsj',title:'计划完工时间',width:100,align:'center'},
		    {field:'pftz',title:'批复总投资',width:80,align:'center'},
		    {field:'jhsybbzje',title:'部补助资金',width:80,align:'center'},
		    {field:'jhsydfzczj',title:'地方自筹资金',width:80,align:'center'}
	    ]],
	    view: detailview,
		detailFormatter:function(index,row){   
	        return '<div style="padding:2px"><table id="table_lx' + index + '"></table></div>';   
	    },
	    onExpandRow: function(index,row){
	    	$('#table_lx'+index).datagrid({
	    		data:row.plan_lx_gcsjs,
    			columns:[[
    			    {field:'gydw',title:'管养单位',width:200,align:'center'},
    			    {field:'xzqhmc',title:'行政区划名称',width:100,align:'center'},
    			    {field:'lxmc',title:'路线名称',width:100,align:'center'},
    			    {field:'lxbm',title:'路线编码',width:100,align:'center'},
    			    {field:'qdzh',title:'起点桩号',width:60,align:'center'},
    			    {field:'zdzh',title:'止点桩号',width:60,align:'center'},
    			    {field:'xmlc',title:'项目里程',width:60,align:'center'}
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
function gclmsjxm_zjxd(jh,lx){
	var params={"jh.kgzt":jh.kgzt,"jh.jgzt":jh.jgzt,"jh.sbzt":jh.sbzt,"jh.spzt":jh.spzt,
			"jh.jhnf":jh.jhnf,"jh.jh_sbthcd":jh.jh_sbthcd,'jh.sfylsjl':jh.sfylsjl,
			"lx.gydw":lx.gydw,"lx.gydwdm":lx.gydwdm,"lx.xzqhmc":lx.xzqhmc,"lx.lxbm":lx.lxbm,
			"lx.xzqhdm":lx.xzqhdm,"lx.lxmc":lx.lxmc,'lx.yjsdj':lx.yjsdj,'lx.tsdqbm':lx.tsdqbm};
	var grid={id:'grdab',url:'../../../jhgl/queryGcsjList.do',striped:true,pagination:true,
		rownumbers:false,pageNumber:1,pageSize:10,height:$(window).height()-150,width:$('#searchField').width(),queryParams:params,
		columns:[[
		    {field:'ck',checkbox:true},
			{field:'c',title:'操作',width:150,align:'center',formatter:function(value,row,index){
				var result='<a href="javascript:locationXm('+"'"+row.plan_lx_gcsjs[0].lxbm+"'"+')" style="text-decoration:none;color:#3399CC;">定位</a>    ';
				result+='<a href="javascript:openWindow('+"'"+row.id+"'"+')" style="text-decoration:none;color:#3399CC;">详细</a>';
				return result;
			}},
			{field:'c1',title:'资金下发',width:80,align:'center',formatter:function(value,row,index){
				return '<a href="javascript:openDialog('+"'zjxd_gclmsj','工程改造路面升级项目资金下达','../zjxd/gclmsj.jsp'"+')" style="text-decoration:none;color:#3399CC;">资金下发</a>';
			}},
			{field:'kgzt',title:'建设状态',width:80,align:'center',
				formatter:function(value,row){
					if(value=='0' && row.jgzt=='0')
						return '未开工';
					else if(value=='1' && row.jgzt=='0')
						return '在建';
					else if(value=='1' && row.jgzt=='1')
						return '竣工';
				}
			},
			{field:'sfylsjl',title:'是否有修建记录',width:80,align:'center'},
		  	{field:'jhnf',title:'上报年份',width:80,align:'center'},
		  	{field:'jhkgsj',title:'计划开工时间',width:100,align:'center'},
		  	{field:'jhwgsj',title:'计划完工时间',width:100,align:'center'},
		    {field:'pftz',title:'批复总投资',width:80,align:'center'},
		    {field:'jhsybbzje',title:'部补助资金',width:80,align:'center'},
		    {field:'jhsydfzczj',title:'地方自筹资金',width:80,align:'center'}
	    ]],
	    view: detailview,
		detailFormatter:function(index,row){   
	        return '<div style="padding:2px"><table id="table_lx' + index + '"></table></div>';   
	    },
	    onExpandRow: function(index,row){
	    	$('#table_lx'+index).datagrid({
	    		data:row.plan_lx_gcsjs,
    			columns:[[
    			    {field:'gydw',title:'管养单位',width:200,align:'center'},
    			    {field:'xzqhmc',title:'行政区划名称',width:100,align:'center'},
    			    {field:'lxmc',title:'路线名称',width:100,align:'center'},
    			    {field:'lxbm',title:'路线编码',width:100,align:'center'},
    			    {field:'qdzh',title:'起点桩号',width:60,align:'center'},
    			    {field:'zdzh',title:'止点桩号',width:60,align:'center'},
    			    {field:'xmlc',title:'项目里程',width:60,align:'center'}
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
function queryGcsjXx(id){
	
}
function dropGcsjs(){
	if(confirm("确认要移除选中计划？")){
		var sel=gridObj.datagrid("getSelections");
		var id="";
		$.each(sel,function(index,item){
			if(index==sel.length-1){
				id+=item.id;
			}else{
				id+=item.id+",";
			}
		});
		$.ajax({
			type:'post',
			url:'../../../jhgl/dropGcsjById.do',
			dataType:'json',
			data:'jh.id='+id,
			success:function(data){
				if(data.jh && data.lx){
					var params={"jh.sbzt":null,"jh.spzt":null,"jh.jhnf":null,"jh.jhkgsj":null,
							"jh.jhwgsj":null,"jh.pfztz":null,
							"lx.gydw":null,"lx.gydwdm":null,"lx.xzqhmc":null,"lx.xzqhdm":null,"lx.lxmc":null};
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
function editGcsj(){
	if(lxztz()){
		var jh={'jh.id':$('#jhid').val() ,'jh.jhnf':$('#editjhnf').combobox('getValue'),
				'jh.jhkgsj':$('#jhkgsj').datebox("getValue"),'jh.jhwgsj':$('#jhwgsj').datebox("getValue"),
				'jh.xdsj':$('#xdsj').datebox("getValue"),'jh.xmwybh':$('#xmwybh').val(),
				'jh.xmmc':$('#xmmc').val(),'jh.sjdw':$('#sjdw').val(),'jh.sjpfdw':$('#sjpfdw').val(),
				'jh.jsjsbz':$('#jsjsbz').val(),'jh.ql':$('#ql').val(),'jh.ql_m':$('#ql_m').val(),
				'jh.sd':$('#sd').val(),'jh.sd_m':$('#sd_m').val(),'jh.hd':$('#hd').val(),
				'jh.ljtsf':$('#ljtsf').val(),'jh.dc':$('#dc').val(),'jh.jc':$('#jc').val(),
				'jh.lqlm':$('#lqlm').val(),'jh.snlm':$('#snlm').val(),'jh.gjhjsdj':$('#gjhjsdj').val,
				'jh.sftqss':$("input[name='sftqss']:checked").val(),'jh.pfwh':$('#pfwh').val(),'jh.pfsj':$('#pfsj').datebox('getValue'),
				'jh.pftz':$('#pftz').val(),'jh.jhsybbzje':$('#jhsybbzje').val(),
				'jh.jhsydfzczj':$('#jhsysbzje').val(),'jh.jhxdwh':$('#jhxdwh').val(),
				'jh.sfsqablbz':$("input[name='sfsqablbz']:checked").val(),'jh.ablbzsqwh':$('#ablbzsqwh').val(),
				'jh.gksjwh':$('#gksjwh').val(),'jh.sjpfwh':$('#sjpfwh').val(),'jh.sfgyhbm':$('#sfgyhbm').val(),
				'jh.remarks':$('#remarks').val()
			};
		$.ajax({
			type:'post',
			url:'../../../jhgl/editGcsjById.do',
			dataType:'text',
			data:jh,
			success:function(data){
				alert("修改成功！");
				parent.$('#grdab').datagrid('reload');
				parent.$('#gclmsj_edit').window('destroy');
			}
		});
	}else{
		alert("总投资计算有误");
	}
}
function lxztz(){
	var lxCount = ($('#tr_scxx').index()-1)/7;
	var result=false,fdbz=0,ztz=0.0;//result：是否符合标准;fdbz：投资金额的浮动标准;ztz：总投资金额，每条路线累计相加
	for(var i=0;i<lxCount;i++){
		var lx={'lx.lxbm':$('#lxbm'+i).html(),'lx.qdzh':$('#qdzh'+i).html(),'lx.zdzh':$('#zdzh'+i).html(),
				'lx.gydwdm':$.cookie("unit"),'lx.yhlc':$('#xmlc'+i).html(),'lx.qzlc':$('#qzlc'+i).html(),
				'lx.jhid':$('#editjhnf').combobox('getValue'),'lx.xzqhdm':$('#xzqhdm'+i).html(),
				'lx.yjsdj':$('#yjsdjxx'+i).html(),'xmlx':'工程改造路面升级'};
		$.ajax({
			type:'post',
			url:'../../../jhgl/verifyLx.do',
			async:false,
			data:lx,
			dataType:'json',
			success:function(data){
				ztz=Number(ztz)+Number(data.je);
				fdbz=data.fdbz;
			}
		});
	}
	if($('#pftz').val()>=(ztz-fdbz) && $('#pftz').val()<=(Number(ztz)+Number(fdbz))){
		result=true;
	}else{
		result=false;
		return result;
	}
	if($('#pftz').val()==Number($('#jhsybbzje').val())+Number($('#jhsysbzje').val())){
		result=true;
	}else{
		result=false;
	}
	return result;
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
	    view:grid.view,
	    detailFormatter:grid.detailFormatter,
	    onExpandRow:grid.onExpandRow
	});
	$('#'+grid.id).datagrid('resize',{width:$("body").width()*0.97});
}
function editStatus(jh){
	var result;
	$.ajax({
		type:'post',
		url:'../../../jhgl/editGcsjStatus.do',
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
function downGkwj(file){
	window.location.href="/jxzhpt/jhgl/queryWjById.do?jh.id="+xxId+"&jh.gkbgmc="+file;
}
function downSjt(file){
	window.location.href="/jxzhpt/jhgl/queryWjById.do?jh.id="+xxId+"&jh.sjsgtmc="+file;
}
function exportSj(filename){
	window.location.href="/jxzhpt/xtgl/getModule_jhfeiLw.do?moduleName="+filename;
}
