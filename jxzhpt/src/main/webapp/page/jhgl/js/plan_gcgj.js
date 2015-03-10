var gridObj;//列表对象
var oldIndex=-1;//之前选中的
var selRow=new Array();//已选择的行号
function uploadFile(){
	$("#uploadGk").uploadifyUpload();
}
function querySumGcgj(jh,lx){
	var param={'lx.gydwdm':lx.gydwdm,'jh.sbnf':jh.sbnf,'jh.sbzt':jh.sbzt,'jh.spzt':jh.spzt,'jh.jh_sbthcd':jh.jh_sbthcd};
	$.ajax({
		type:'post',
		url:'../../../jhgl/querySumGcgj.do',
		data:param,
		dataType:'json',
		success:function(data){
			$('#lblCount').html(data.id);
			$('#lblZLC').html(data.plan_lx_gcgjs[0].qzlc);
			$('#lblYHLC').html(data.plan_lx_gcgjs[0].yhlc);
			$('#lblZTZ').html(data.pfztz);
			$('#lblBTZ').html(data.jhsybzje);
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
/**
 * 工程路面改建列表信息
 * @param jh 计划库条件
 * @param lx 路线条件
 */
function gclmgjxm(jh,lx){
	selectRow={};//每次查询清空选择数据
	var params={"jh.sbzt":jh.sbzt,"jh.spzt":jh.spzt,"jh.sbnf":jh.sbnf,
			"lx.gydw":lx.gydw,"lx.gydwdm":lx.gydwdm,"lx.xzqhmc":lx.xzqhmc,
			"lx.xzqhdm":lx.xzqhdm,"lx.lxmc":lx.lxmc,'lx.yjsdj':lx.yjsdj,
			'lx.tsdqbm':lx.tsdqbm,'jh.jh_sbthcd':jh.jh_sbthcd};
	var grid = {id : 'grid',url : '../../../jhgl/queryGcgjList.do',queryParams:params,pagination : true,rownumbers:false,
		pageNumber : 1,pageSize : 10,height : 325,width:1070,
		columns:[[
		    {field:'ck',checkbox:true},
		    {field : 'c',title : '操作',width : 150,align : 'center',
		    	formatter : function(value, row, index) {
		    		var result='<a style="text-decoration:none;color:#3399CC;">定位<a>    ';
		    		result+='<a href="javascript:openDialog('+"'gclmgj_xx','工程改造路面改建项目计划详情','../jhkxx/gclmgj.jsp'"+')" style="text-decoration:none;color:#3399CC;">详细</a>    ';
		    		result+='<a href="javascript:openDialog('+"'gclmgj_xx','工程改造路面改建项目计划详情','../edit/gclmgj.jsp'"+')" style="text-decoration:none;color:#3399CC;">编辑</a>    ';
		    		var id="'"+row.id+"'";
		    		if((roleName()=="县级" && row.jh_sbthcd==0) || (roleName()=="市级" && row.jh_sbthcd<=2) || (roleName()=="省级" && row.jh_sbthcd<=4)){
		    			result+='<a href="javascript:openDialog('+"'gclmgj_xx','工程改造路面改建项目计划详情','../edit/gclmgj.jsp'"+')" style="text-decoration:none;color:#3399CC;">编辑</a>    ';
			    		result+='<a href="javascript:dropGcgjs()" style="text-decoration:none;color:#3399CC;">移除</a>';
		    		}else{
		    			result+='<a style="text-decoration:none;color:black;">编辑</a>    ';
			        	result+='<a style="text-decoration:none;color:black;">移除</a>';
		    		}
		    		return result;
		    	}
		    },
		    {field : 'c4',title : '计划状态',width : 80,align : 'center',
				formatter : function(value, row, index) {
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
				}
		    },
		    {field : 'id',title : '添加路线',width : 80,align : 'center',
		    	formatter : function(value, row, index) {
		    		if(row.jh_sbthcd==0)
		    			return '<a href="javascript:$('+"'#add_lx'"+').dialog('+"'open'"+');" style="text-decoration:none;color:#3399CC;">添加路线</a>';
		    		else
		    			return '<a style="text-decoration:none;">添加路线</a>';
		    	}
		    },
		    {field:'xmmc',title : '项目名称',width : 80,align : 'center'},
		    {field : 'sbnf',title : '上报年份',width : 80,align : 'center'},
		    {field : 'jhkgsj',title : '计划开工时间',width : 100,align : 'center'},
		    {field : 'jhwgsj',title : '计划完工时间',width : 100,align : 'center'},
		    {field:'pfztz',title:'批复总投资(万元)',width:100,align:'center'},
		    {field:'jhsybzje',title:'部补助金额(万元)',width:100,align:'center'},
		    {field:'jhsydfzcje',title:'地方自筹金额(万元)',width:100,align:'center'}
		]],
		view: detailview,
		detailFormatter:function(index,row){   
	        return '<div style="padding:2px"><table id="table_lx' + index + '"></table></div>';   
	    },
	    onExpandRow: function(index,row){
	    	$('#table_lx'+index).datagrid({
	    		data:row.plan_lx_gcgjs,
    			columns:[[
    			    {field:'gydw',title:'管养单位',width:100,align:'center'},    
    			    {field:'xzqhmc',title:'行政区划名称',width:100,align:'center'},
    			    {field:'lxmc',title:'路线名称',width:100,align:'center'},
    			    {field:'lxbm',title:'路线编码',width:100,align:'center'},
    			    {field:'qdzh',title:'起点桩号',width:60,align:'center'},
    			    {field:'zdzh',title:'止点桩号',width:60,align:'center'},
    			    {field:'yhlc',title:'隐患里程',width:60,align:'center'}
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
			gridObj.datagrid('expandRow',rowIndex);
			gridObj.datagrid('fixDetailRowHeight',rowIndex);
		}
	};
	gridBind(grid);
}
function gclmgjxm_sb(jh,lx){
	var params={"jh.sbzt":jh.sbzt,"jh.spzt":jh.spzt,"jh.sbnf":jh.sbnf,"jh.jh_sbthcd":jh.jh_sbthcd,
			"lx.gydw":lx.gydw,"lx.gydwdm":lx.gydwdm,"lx.xzqhmc":lx.xzqhmc,
			"lx.xzqhdm":lx.xzqhdm,"lx.lxmc":lx.lxmc,'lx.yjsdj':lx.yjsdj,'lx.tsdqbm':lx.tsdqbm};
	var grid = {id : 'grid',url : '../../../jhgl/queryGcgjList.do',pagination : true,rownumbers:false,
		pageNumber : 1,pageSize : 10,height : 325,width:1070,queryParams:params,
		columns:[[
		    {field:'ck',checkbox:true},
		    {field : 'c',title : '操作',width : 150,align : 'center',
		    	formatter : function(value, row, index) {
		    		var result="";
		    		result+='<a style="text-decoration:none;color:#3399CC;">定位<a>    ';
		    		result+='<a href="javascript:openDialog('+"'gclmgj_sb','工程改造路面改建项目计划详情','../jhkxx/gclmgj.jsp'"+')" style="text-decoration:none;color:#3399CC;">详细</a>        ';
		    		if((roleName()=="县级" && row.jh_sbthcd==0) || (roleName()=="市级" && row.jh_sbthcd<=2) || (roleName()=="省级" && row.jh_sbthcd<=4))
		    			result+='<a href="javascript:openDialog('+"'gclmgj_xx','工程改造路面改建项目计划详情','../edit/gclmgj.jsp'"+')" style="text-decoration:none;color:#3399CC;">编辑</a>';
		    		else
		    			result+="编辑";
		    		return result;
		    	}
		    },
		    {field : 'sbzt',title : '上报状态',width : 80,align : 'center',
				formatter : function(value, row, index) {
					var result="";
					if((roleName()=="县级" && row.jh_sbthcd==0) || (roleName()=="市级" && row.jh_sbthcd==2)){
						result='<a href="javascript:sb('+"'"+row.id+"'"+','+row.jh_sbthcd+')" style="text-decoration:none;color:#3399CC;">上报</a>';
						if(row.jh_sbthcd==2)
							result+='   |    <a href="javascript:tuihui('+"'"+row.id+"'"+','+row.jh_sbthcd+')" style="text-decoration:none;color:#3399CC;">退回</a>';
					}else if((roleName()=="县级" && row.jh_sbthcd==2) || (roleName()=="市级" && row.jh_sbthcd==4)){
						result+="已上报";
					}
					return result;
				}
		    },
		    {field:'xmmc',title : '项目名称',width : 80,align : 'center'},
		    {field : 'sbnf',title : '上报年份',width : 80,align : 'center'},
		    {field : 'jhkgsj',title : '计划开工时间',width : 100,align : 'center'},
		    {field : 'jhwgsj',title : '计划完工时间',width : 100,align : 'center'},
		    {field:'pfztz',title:'批复总投资(万元)',width:100,align:'center'},
		    {field:'jhsybzje',title:'部补助金额(万元)',width:100,align:'center'},
		    {field:'jhsydfzcje',title:'地方自筹金额(万元)',width:100,align:'center'}
		]],
		view: detailview,
		detailFormatter:function(index,row){   
	        return '<div style="padding:2px"><table id="table_lx' + index + '"></table></div>';   
	    },
	    onExpandRow: function(index,row){
	    	$('#table_lx'+index).datagrid({
	    		data:row.plan_lx_gcgjs,
    			columns:[[
    			    {field:'gydw',title:'管养单位',width:100,align:'center'},    
    			    {field:'xzqhmc',title:'行政区划名称',width:100,align:'center'},
    			    {field:'lxmc',title:'路线名称',width:100,align:'center'},
    			    {field:'lxbm',title:'路线编码',width:100,align:'center'},
    			    {field:'qdzh',title:'起点桩号',width:60,align:'center'},
    			    {field:'zdzh',title:'止点桩号',width:60,align:'center'},
    			    {field:'yhlc',title:'隐患里程',width:60,align:'center'}
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
			gridObj.datagrid('expandRow',rowIndex);
			gridObj.datagrid('fixDetailRowHeight',rowIndex);
		}
	};
	gridBind(grid);
}
function gclmgjxm_sh(jh,lx){
	var params={"jh.sbzt":jh.sbzt,"jh.spzt":jh.spzt,"jh.sbnf":jh.sbnf,"jh.jh_sbthcd":jh.jh_sbthcd,
			"lx.gydw":lx.gydw,"lx.gydwdm":lx.gydwdm,"lx.xzqhmc":lx.xzqhmc,
			"lx.xzqhdm":lx.xzqhdm,"lx.lxmc":lx.lxmc,'lx.yjsdj':lx.yjsdj,'lx.tsdqbm':lx.tsdqbm};
	var grid = {id : 'grid',url : '../../../jhgl/queryGcgjList.do',pagination : true,rownumbers:false,
		pageNumber : 1,pageSize : 10,height : 325,width:1070,queryParams:params,
		columns:[[
		    {field:'ck',checkbox:true},
		    {field : 'c',title : '操作',width : 150,align : 'center',
		    	formatter : function(value, row, index) {
		    		var result='';
		    		result+='<a style="text-decoration:none;color:#3399CC;">定位<a>    ';
		    		result+='<a href="javascript:openDialog('+"'gclmgj_sh','工程改造路面改建项目计划详情','../jhkxx/gclmgj.jsp'"+')" style="text-decoration:none;color:#3399CC;">详细</a>    ';
		    		if(roleName()=="省级" && row.jh_sbthcd==4 && row.spzt=="0")
		    			result+='<a href="javascript:openDialog('+"'gclmgj_xx','工程改造路面改建项目计划详情','../edit/gclmgj.jsp'"+')" style="text-decoration:none;color:#3399CC;">编辑</a>';
		    		else
		    			result+="编辑";
		    		return  result;
		    	}
		    },
		    {field : 'c4',title : '审批状态',width : 80,align : 'center',
				formatter : function(value, row, index) {
					var result;
					if(roleName()=="省级" && row.jh_sbthcd==4 && row.spzt=="0"){
						result='<a href="javascript:sp('+"'"+row.id+"'"+','+row.jh_sbthcd+')" style="text-decoration:none;color:#3399CC;">审批</a>    |    ';
						result+='<a href="javascript:tuihui('+"'"+row.id+"'"+','+row.jh_sbthcd+')" style="text-decoration:none;color:#3399CC;">退回</a>';
					}else if(roleName()!="省级" && row.jh_sbthcd==4 && row.spzt=="0"){
						result="审批      |    退回";
					}else if(row.spzt=="1"){
						result="已审批";
					}
					return result;
				}
		    },
		    {field:'sfylsjl',title:'是否有修建记录',width:80,align:'center'},
		    {field:'xmmc',title : '项目名称',width : 80,align : 'center'},
		    {field : 'sbnf',title : '上报年份',width : 80,align : 'center'},
		    {field : 'jhkgsj',title : '计划开工时间',width : 100,align : 'center'},
		    {field : 'jhwgsj',title : '计划完工时间',width : 100,align : 'center'},
		    {field:'pfztz',title:'批复总投资(万元)',width:100,align:'center'},
		    {field:'jhsybzje',title:'部补助金额(万元)',width:100,align:'center'},
		    {field:'jhsydfzcje',title:'地方自筹金额(万元)',width:100,align:'center'}
		]],
		view: detailview,
		detailFormatter:function(index,row){   
	        return '<div style="padding:2px"><table id="table_lx' + index + '"></table></div>';   
	    },
	    onExpandRow: function(index,row){
	    	$('#table_lx'+index).datagrid({
	    		data:row.plan_lx_gcgjs,
    			columns:[[
    			    {field:'gydw',title:'管养单位',width:100,align:'center'},    
    			    {field:'xzqhmc',title:'行政区划名称',width:100,align:'center'},
    			    {field:'lxmc',title:'路线名称',width:100,align:'center'},
    			    {field:'lxbm',title:'路线编码',width:100,align:'center'},
    			    {field:'qdzh',title:'起点桩号',width:60,align:'center'},
    			    {field:'zdzh',title:'止点桩号',width:60,align:'center'},
    			    {field:'yhlc',title:'隐患里程',width:60,align:'center'}
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
			gridObj.datagrid('expandRow',rowIndex);
			gridObj.datagrid('fixDetailRowHeight',rowIndex);
		}
	};
	gridBind(grid);
}
function gclmgjxm_zjxd(jh,lx){
	var params={"jh.sbzt":jh.sbzt,"jh.spzt":jh.spzt,"jh.sbnf":jh.sbnf,"jh.jh_sbthcd":jh.jh_sbthcd,
			"lx.gydw":lx.gydw,"lx.gydwdm":lx.gydwdm,"lx.xzqhmc":lx.xzqhmc,
			"lx.xzqhdm":lx.xzqhdm,"lx.lxmc":lx.lxmc,'lx.yjsdj':lx.yjsdj,'lx.tsdqbm':lx.tsdqbm};
	var grid = {id : 'grid',url : '../../../jhgl/queryGcgjList.do',pagination : true,rownumbers:false,
		pageNumber : 1,pageSize : 10,height : 325,width:1070,queryParams:params,
		columns:[[
		    {field:'ck',checkbox:true},
		    {field : 'c',title : '操作',width : 150,align : 'center',
		    	formatter : function(value, row, index) {
		    		var result='<a style="text-decoration:none;color:#3399CC;">定位</a>    ';
		    		result+='<a href="javascript:openDialog('+"'zjxd_gclmgj','工程改造路面改建项目计划详情','../jhkxx/gclmgj.jsp'"+')" style="text-decoration:none;color:#3399CC;">详细</a>';
		    		return result ;
		    	}
		    },
		    {field:'zjxf',title:'资金下发',width:60,align:'center',formatter:function(value,row,index){
		    	return '<a href="javascript:openDialog('+"'zjxd_gclmgj','工程改造路面改建项目资金下达','../zjxd/gclmgj.jsp'"+')" style="text-decoration:none;color:#3399CC;">资金下发</a>';
		    }},
		    {field : 'kgzt',title : '建设状态',width : 80,align : 'center',
				formatter : function(value, row, index) {
					if(row.kgzt=='0' && row.jgzt=='0')
						return '未开工';
					else if(row.kgzt=='1' && row.jgzt=='0')
						return '在建';
					else if(row.kgzt=='1' && row.jgzt=='1')
						return '竣工';
				}
		    },
		    {field : 'sfylsjl',title : '是否有修建记录',width : 80,align : 'center'},
		    {field:'xmmc',title : '项目名称',width : 80,align : 'center'},
		    {field : 'sbnf',title : '上报年份',width : 80,align : 'center'},
		    {field : 'jhkgsj',title : '计划开工时间',width : 100,align : 'center'},
		    {field : 'jhwgsj',title : '计划完工时间',width : 100,align : 'center'},
		    {field:'pfztz',title:'批复总投资(万元)',width:100,align:'center'},
		    {field:'jhsybzje',title:'部补助金额(万元)',width:100,align:'center'},
		    {field:'jhsydfzcje',title:'地方自筹金额(万元)',width:100,align:'center'}
		]],
		view: detailview,
		detailFormatter:function(index,row){   
	        return '<div style="padding:2px"><table id="table_lx' + index + '"></table></div>';   
	    },
	    onExpandRow: function(index,row){
	    	$('#table_lx'+index).datagrid({
	    		data:row.plan_lx_gcgjs,
    			columns:[[
    			    {field:'gydw',title:'管养单位',width:100,align:'center'},    
    			    {field:'xzqhmc',title:'行政区划名称',width:100,align:'center'},
    			    {field:'lxmc',title:'路线名称',width:100,align:'center'},
    			    {field:'lxbm',title:'路线编码',width:100,align:'center'},
    			    {field:'qdzh',title:'起点桩号',width:60,align:'center'},
    			    {field:'zdzh',title:'止点桩号',width:60,align:'center'},
    			    {field:'yhlc',title:'隐患里程',width:60,align:'center'}
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
			gridObj.datagrid('expandRow',rowIndex);
			gridObj.datagrid('fixDetailRowHeight',rowIndex);
		}
	};
	gridBind(grid);
}
function queryGcgjXx(id){
	$.ajax({
		type:'post',
		url:'../../../jhgl/queryGcgjById.do',
		data:"jh.id="+id,
		dataType:'json',
		success:function(data){
			$('#fapgdw').html(data.fapgdw);
			$('#fascdw').html(data.fascdw);
			$('#faspsj').html(data.faspsj);
			$('#spwh').html(data.spwh);
			$('#tzgs').html(data.tzgs);
			$('#jsxz').html(data.jsxz);
			$('#jsnr').html(data.jsnr);
			$('#sbnfxx').html(data.sbnf);
			$('#jhkgsj').html(data.jhkgsj);
			$('#jhwgsj').html(data.jhwgsj);
			$('#xdsj').html(data.xdsj);
			$('#xmmc').html(data.xmmc);
			$('#yhlb').html(data.yhlb);
			$('#sjdw').html(data.sjdw);
			$('#xmmc').html(data.xmmc);
			$('#yhlb').html(data.yhlb);
			$('#sjdw').html(data.sjdw);
			$('#sjpfdw').html(data.sjpfdw);
			$('#sjlmlx').html(data.sjlmlx);
			$('#dc').html(data.dc);
			$('#jc').html(data.jc);
			$('#mc').html(data.mc);
			$('#lmkd').html(data.lmkd);
			$('#pfwh').html(data.pfwh);
			$('#pfsj').html(data.pfsj);
			$('#pfztz').html(data.pfztz);
			$('#jhsybzje').html(data.jhsybzje);
			$('#jhsydfzcje').html(data.jhsydfzcje);
			$('#sfsqablbz').html(data.sfsqablbz);
			$('#sftqss').html(data.sftqss);
			$('#jhxdwh').html(data.jhxdwh);
			$('#gksjwh').html(data.gksjwh);
			$('#sjpfwh').html(data.sjpfwh);
			$('#sfgyhbm').html(data.sfgyhbm);
			$('#gksjwh').html(data.gksjwh);
			$('#bz').html(data.bz);
			if(data.gkbgmc!=null){
				var mc="'"+data.gkbgmc+"'";
				$('#td_gkbg').html('<a href="javascript:downGkwj('+mc+')">'+data.gkbgmc+'</a>');
			}
			if(data.sjsgtmc!=null){
				var mc="'"+data.sjsgtmc+"'";
				$('#td_sjt').html('<a href="javascript:downSjt('+mc+')">'+data.sjsgtmc+'</a>');
			}
			var title='<tr style="height: 25px;"><td colspan="6" style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #55BEEE; font-weight: bold; font-size: small; text-align: left; background-color: #F1F8FF; width: 15%; padding-left: 10px;">工程改造路面改建项目基本信息</td></tr>';
			$('#tr_scxx').before(title);
			$.each(data.plan_lx_gcgjs,function(index,item){
				var tr1='<tr style="height: 30px;">'+
							'<td style="background-color:#F1F8FF;padding-right:5px;color:#007DB3;font-weight:bold;font-size:small;text-align:right;border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0;">'+
							'路线名称</td>'+
							'<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">'+
								'<span id="lxmc'+index+'">'+item.lxmc+'</span></td>'+
							'<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">'+
							'路线编码</td>'+
							'<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">'+
								'<span id="lxbm'+index+'">'+item.lxbm+'</span></td>'+
							'<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">'+
							'建设地点</td>'+
							'<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 18%; text-align: left; padding-left: 10px;">'+
								'<span id="jsdd'+index+'">'+item.jsdd+'</span></td></tr>';
				var tr2='<tr style="height: 30px;">'+
							'<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">'+
								'起点桩号</td>'+
							'<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">'+
								'<span id="qdzh'+index+'">'+item.qdzh+'</span></td>'+
							'<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">'+
								'止点桩号</td>'+
							'<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">'+
								'<span id="zdzh'+index+'">'+item.zdzh+'</span></td>'+
							'<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">'+
								'起止里程</td>'+
							'<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 18%; text-align: left; padding-left: 10px;">'+
								'<span id="qzlc'+index+'">'+item.qzlc+'</span>公里</td></tr>';
				var tr3='<tr style="height: 30px;">'+
							'<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">'+
								'管养单位</td>'+
							'<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">'+
								'<span id="gydwxx'+index+'">'+item.gydw+'</span></td>'+
							'<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">'+
								'行政区划代码</td>'+
							'<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;">'+
								'<span id="xzqhdm'+index+'">'+item.xzqhdm+'</span></td>'+
							'<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">'+
								'行政区划</td>'+
							'<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 18%; text-align: left; padding-left: 10px;">'+
								'<span id="xzqhmc'+index+'">'+item.xzqhmc+'</span></td></tr>';
				var tr4='<tr style="height: 30px;">'+
							'<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">'+
								'原技术等级</td>'+
							'<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 18%; text-align: left; padding-left: 10px;">'+
								'<span id="yjsdjxx'+index+'">'+item.yjsdj+'</span></td>'+
							'<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">'+
								'原路面类型</td>'+
							'<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">'+
								'<span id="ylmlx'+index+'">'+item.ylmlx+'</span>&nbsp;</td>'+
							'<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">'+
								'隐患里程</td>'+
							'<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">'+
								'<span id="yhlc'+index+'">'+item.yhlc+'</span>公里</td></tr>';
				var tr5_6=	'<tr style="height: 50px;">'+
								'<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">'+
									'特殊地区</td>'+
								'<td colspan="5" style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;">'+
									'<span id="lblTSDQ'+index+'"></span> &nbsp;</td></tr>'+
							'<tr style="height: 50px;">'+
								'<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">'+
									'病害内容</td>'+
								'<td colspan="5" style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;">'+
									'<span id="bhnr'+index+'">'+item.bhnr+'</span> &nbsp;</td></tr>';
				$('#tr_scxx').before(tr1+tr2+tr3+tr4+tr5_6);
			});
			
		}
	}); 
}
function dropGcgj(id,readLoad){
		$.ajax({
			type:'post',
			url:'../../../jhgl/dropGcgjById.do',
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
function dropGcgjs(){
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
			url:'../../../jhgl/dropGcgjById.do',
			dataType:'json',
			data:'jh.id='+id,
			success:function(data){
				if(data.jh && data.lx){
					var params={"jh.sbzt":null,"jh.spzt":null,"jh.sbnf":null,"jh.jhkgsj":null,
							"jh.jhwgsj":null,"jh.pfztz":null,"lx.gydw":null,"lx.gydwdm":null,
							"lx.xzqhmc":null,"lx.xzqhdm":null,"lx.lxmc":null};
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
function editGcgj(){
	var jh={'jh.id':$('#jhid').val(),'jh.sbnf':$('#editsbnf').combobox('getValue'),
			'jh.jhkgsj':$('#jhkgsj').datebox('getValue'),'jh.jhwgsj':$('#jhwgsj').datebox('getValue'),
			'jh.xdsj':$('#xdsj').datebox('getValue'),'jh.xmmc':$('#xmmc').val(),
			'jh.yhlb':$('#yhlb').val(),'jh.sjdw':$('#sjdw').val(),'jh.sjpfdw':$('#sjpfdw').val(),
			'jh.sjlmlx':$('#sjlmlx').val(),'jh.dc':$('#dc').val(),'jh.jc':$('#jc').val(),
			'jh.mc':$('#mc').val(),'jh.lmkd':$('#lmkd').val(),'jh.pfwh':$('#pfwh').val(),
			'jh.pfsj':$('#pfsj').datebox('getValue'),'jh.pfztz':$('#pfztz').val(),
			'jh.jhsybzje':$('#jhsybzje').val(),'jh.jhsydfzcje':$('#jhsydfzcje').val(),
			'jh.sfsqablbz':$('#sfsqablbz').val(),'jh.ablbzsqwh':$('#ablbzsqwh').val(),
			'jh.sftqss':$('#sftqss').val(),'jh.jhxdwh':$('#jhxdwh').val(),
			'jh.gksjwh':$('#gksjwh').val(),'jh.sjpfwh':$('#sjpfwh').val(),
			'jh.sfgyhbm':$('#sfgyhbm').val(),'jh.bz':$('#bz').val(),
			'jh.fapgdw':$('#fapgdw').val(),'jh.fascdw':$('#fascdw').val(),
			'jh.faspsj':$('#faspsj').datebox('getValue'),'jh.spwh':$('#spwh').val(),
			'jh.tzgs':$('#tzgs').val(),'jh.jsxz':$('#jsxz').val(),'jh.jsnr':$('#jsnr').val()
		};
	$.ajax({
		type:'post',
		url:'../../../jhgl/editGcgjById.do',
		dataType:'text',
		data:jh,
		success:function(data){
			alert("修改成功！");
			$('#gclmgj_xx').dialog('close');
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
		url:'../../../jhgl/editGcgjStatus.do',
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
	window.location.href="/jxzhpt/jhgl/queryGjwjById.do?jh.id="+xxId+"&jh.gkbgmc="+file;
}
function downSjt(file){
	window.location.href="/jxzhpt/jhgl/queryGjwjById.do?jh.id="+xxId+"&jh.sjsgtmc="+file;
}
function exportGj(filename){
	window.location.href="/jxzhpt/xtgl/getModule_jhfeiLw.do?moduleName="+filename;
}
