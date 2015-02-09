var gridObj;//列表对象
var oldIndex=-1;//之前选中的
var selRow=new Array();//已选择的行号
function querySumShuih(){
	$.ajax({
		type:'post',
		url:'../../../jhgl/querySumShuih.do',
		dataType:'json',
		success:function(data){
			$('#lblCount').html(data.id);
			$('#lblZLC').html(data.shuihs[0].qzlc);
			$('#lblXMLC').html(data.shuihs[0].yhlc);
			$('#lblZTZ').html(data.pfztz);
			$('#lblBTZ').html(data.jhsybzje);
			$('#lblDFTZ').html(data.jhsydfzcje);
		}
	});
}
function sbnf(id){
	var myDate = new Date();
	var years=[];
	for(var i=0;i<=10;i++){
		years.push({text:(myDate.getFullYear()-i)});
	}
	$('#'+id).combobox({    
	    data:years,
	    valueField:'text',    
	    textField:'text'   
	});
}
function shxm(jh,lx){
	var params={"jh.sbzt":jh.sbzt,"jh.spzt":jh.spzt,"jh.sbnf":jh.sbnf,
			"lx.gydw":lx.gydw,"lx.gydwdm":lx.gydwdm,"lx.xzqhmc":lx.xzqhmc,
			"lx.xzqhdm":lx.xzqhdm,"lx.lxmc":lx.lxmc,'lx.yjsdj':lx.yjsdj,
			'lx.tsdqbm':lx.tsdqbm,'jh.jh_sbthcd':jh.jh_sbthcd};
	var grid={id:'grid',url:'../../../jhgl/queryShuihList.do',pagination:true,rownumbers:false,
	    pageNumber:1,pageSize:10,height:325,width:1070,queryParams:params,
	    columns:[[
	        {field:'ck',checkbox:true},
	        {field:'c',title:'操作',width:150,align:'center',formatter:function(value,row,index){
	        	var result='<a style="text-decoration:none;color:#3399CC;">定位</a>    ';
	        	result+='<a href="javascript:openDialog('+"'shxm_xx','水毁项目计划详情','../jhkxx/shxm.jsp'"+')" style="text-decoration:none;color:#3399CC;">详细</a>    ';
	        	result+='<a href="javascript:openDialog('+"'shxm_xx','水毁项目计划详情','../edit/shxm.jsp'"+')" style="text-decoration:none;color:#3399CC;">编辑</a>    ';
	        	var id="'"+row.id+"'";
	        	result+='<a href="javascript:dropShuihs()" style="text-decoration:none;color:#3399CC;">移除</a>';
	        	return result;
	        }},
//	        {field:'c5',title:'资金追加',width:80,align:'center',formatter:function(value,row,index){
//	        	var id="'"+row.id+"'";
//        		return '<a href="javascript:openZjxd('+"'shxm_xx'"+','+"'资金追加'"+','+"'../zjxd/zjzj.jsp'"+',500,300,'+"'"+row.id+"'"+')" style="text-decoration:none;color:#3399CC;">资金追加</a>';
//	        }},
	        {field:'c4',title:'计划状态',width:80,align:'center',formatter:function(value,row,index){
	        	var result;
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
	        {field:'sbnf',title:'上报年份',width:80,align:'center'},
	        {field:'jhkgsj',title:'计划开工时间',width:100,align:'center'},
	        {field:'jhwgsj',title:'计划完工时间',width:100,align:'center'},
	        {field : 'gydw',title : '管养单位',width : 150,align : 'center',
		    	formatter : function(value, row, index) {
		    		return row.shuihs[0].gydw;
		    	}
		    },
		    {field:'xzqhmc',title : '行政区划名称',width : 100,align : 'center',
		    	formatter : function(value, row, index) {
		    		return row.shuihs[0].xzqhmc;
		    	}
		    },
		    {field : 'lxbm',title : '路线编码',width : 80,align : 'center',
		    	formatter : function(value, row, index) {
		    		return row.shuihs[0].lxbm;
		    	}
		    },
		    {field : 'lxmc',title : '路线名称',width : 80,align : 'center',
		    	formatter : function(value, row, index) {
		    		return row.shuihs[0].lxmc;
		    	}
		    },
		    {field : 'qdzh',title : '起点桩号',width : 60,align : 'center',
		    	formatter : function(value, row, index) {
		    		return row.shuihs[0].qdzh;
		    	}
		    },
		    {field : 'zdzh',title : '止点桩号',width : 60,align : 'center',
		    	formatter : function(value, row, index) {
		    		return row.shuihs[0].zdzh;
		    	}
		    },
		    {field : 'yhlc',title : '隐患里程',width : 60,align : 'center',
		    	formatter : function(value, row, index) {
		    		return row.shuihs[0].yhlc;
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
function shxm_sb(jh,lx){
	var params={"jh.sbzt":jh.sbzt,"jh.spzt":jh.spzt,"jh.sbnf":jh.sbnf,"jh.jh_sbthcd":jh.jh_sbthcd,
			"lx.gydw":lx.gydw,"lx.gydwdm":lx.gydwdm,"lx.xzqhmc":lx.xzqhmc,
			"lx.xzqhdm":lx.xzqhdm,"lx.lxmc":lx.lxmc,'lx.yjsdj':lx.yjsdj,'lx.tsdqbm':lx.tsdqbm};
	var grid={id:'grid',url:'../../../jhgl/queryShuihList.do',pagination:true,rownumbers:false,
	    pageNumber:1,pageSize:10,height:325,width:1070,queryParams:params,
	    columns:[[
	        {field:'ck',checkbox:true},
	        {field:'c',title:'操作',width:150,align:'center',formatter:function(value,row,index){
	        	var result='<a style="text-decoration:none;color:#3399CC;">定位</a>    ';
	        	result+='<a href="javascript:openDialog('+"'shxm_sb','水毁项目计划详情','../jhkxx/shxm.jsp'"+')" style="text-decoration:none;color:#3399CC;">详细</a>    ';
	        	if(row.jh_sbthcd==0)
	        		result+='<a href="javascript:openDialog('+"'shxm_xx','水毁项目计划详情','../edit/shxm.jsp'"+')" style="text-decoration:none;color:#3399CC;">编辑</a>';
	        	else
	        		result+='<a style="text-decoration:none;">编辑</a>';
	        	return result;
	        }},
	        {field:'sbzt',title:'上报状态',width:80,align:'center',formatter:function(value,row,index){
	        	var result;
        		var xian1=new RegExp("^[0-9]{9}[0-9][1-9]$");
				var xian2=new RegExp("^[0-9]{9}[1-9][0-9]$");
				if(!xian1.test($.cookie("unit")) && !xian2.test($.cookie("unit"))  && row.jh_sbthcd==2){
					result='<a href="javascript:sb('+"'"+row.id+"'"+','+row.jh_sbthcd+')" style="text-decoration:none;color:#3399CC;">上报</a>    |    ';
					result+='<a href="javascript:tuihui('+"'"+row.id+"'"+','+row.jh_sbthcd+')" style="text-decoration:none;color:#3399CC;">退回</a>';
				}else if(!xian1.test($.cookie("unit")) && !xian2.test($.cookie("unit")) && row.jh_sbthcd==4){
					result='<a style="text-decoration:none;">已上报</a>';
				}
				
				if((xian1.test($.cookie("unit")) || xian2.test($.cookie("unit"))) && row.jh_sbthcd==0){
					result='<a href="javascript:sb('+"'"+row.id+"'"+','+row.jh_sbthcd+')" style="text-decoration:none;color:#3399CC;">上报</a>';
				}else if((xian1.test($.cookie("unit")) || xian2.test($.cookie("unit"))) && row.jh_sbthcd==2){
					result='<a style="text-decoration:none;">已上报</a>';
				}
	        	return result;
	        }},
	        {field:'sbnf',title:'上报年份',width:80,align:'center'},
	        {field:'jhkgsj',title:'计划开工时间',width:100,align:'center'},
	        {field:'jhwgsj',title:'计划完工时间',width:100,align:'center'},
	        {field : 'gydw',title : '管养单位',width : 150,align : 'center',
		    	formatter : function(value, row, index) {
		    		return row.shuihs[0].gydw;
		    	}
		    },
		    {field:'xzqhmc',title : '行政区划名称',width : 100,align : 'center',
		    	formatter : function(value, row, index) {
		    		return row.shuihs[0].xzqhmc;
		    	}
		    },
		    {field : 'lxbm',title : '路线编码',width : 80,align : 'center',
		    	formatter : function(value, row, index) {
		    		return row.shuihs[0].lxbm;
		    	}
		    },
		    {field : 'lxmc',title : '路线名称',width : 80,align : 'center',
		    	formatter : function(value, row, index) {
		    		return row.shuihs[0].lxmc;
		    	}
		    },
		    {field : 'qdzh',title : '起点桩号',width : 60,align : 'center',
		    	formatter : function(value, row, index) {
		    		return row.shuihs[0].qdzh;
		    	}
		    },
		    {field : 'zdzh',title : '止点桩号',width : 60,align : 'center',
		    	formatter : function(value, row, index) {
		    		return row.shuihs[0].zdzh;
		    	}
		    },
		    {field : 'yhlc',title : '隐患里程',width : 60,align : 'center',
		    	formatter : function(value, row, index) {
		    		return row.shuihs[0].yhlc;
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
function shxm_sh(jh,lx){
	var params={"jh.sbzt":jh.sbzt,"jh.spzt":jh.spzt,"jh.sbnf":jh.sbnf,"jh.jh_sbthcd":jh.jh_sbthcd,
			"lx.gydw":lx.gydw,"lx.gydwdm":lx.gydwdm,"lx.xzqhmc":lx.xzqhmc,
			"lx.xzqhdm":lx.xzqhdm,"lx.lxmc":lx.lxmc,'lx.yjsdj':lx.yjsdj,'lx.tsdqbm':lx.tsdqbm};
	var grid={id:'grid',url:'../../../jhgl/queryShuihList.do',pagination:true,rownumbers:false,
	    pageNumber:1,pageSize:10,height:325,width:1070,queryParams:params,
	    columns:[[
	        {field:'ck',checkbox:true},
	        {field:'c',title:'操作',width:150,align:'center',formatter:function(value,row,index){
	        	var result='<a style="text-decoration:none;color:#3399CC;">定位</a>    ';
	        	result+='<a href="javascript:openDialog('+"'shxm_sh','水毁项目计划详情','../jhkxx/shxm.jsp'"+')" style="text-decoration:none;color:#3399CC;">详细</a>    ';
	        	if(row.jh_sbthcd==2)
	        		result+='<a href="javascript:openDialog('+"'shxm_xx','水毁项目计划详情','../edit/shxm.jsp'"+')" style="text-decoration:none;color:#3399CC;">编辑</a>';
	        	else
	        		result+='<a style="text-decoration:none;">编辑</a>';
	        	return result;
	        }},
	        {field:'sbzt',title:'审批状态',width:80,align:'center',formatter:function(value,row,index){
	        	var result;
	        	if(row.spzt=="0"){
	        		result='<a href="javascript:sp('+"'"+row.id+"'"+','+row.jh_sbthcd+')" style="text-decoration:none;color:#3399CC;">审批</a>    |    ';
	        		result+='<a href="javascript:tuihui('+"'"+row.id+"'"+','+row.jh_sbthcd+')" style="text-decoration:none;color:#3399CC;">退回</a>'
	        	}else if(row.spzt=="1"){
	        		result="已审批";
	        	}
	        	return result;
	        }},
	        {field:'sfylsjl',title:'是否有修建记录',width:80,align:'center'},
	        {field:'sbnf',title:'上报年份',width:80,align:'center'},
	        {field:'jhkgsj',title:'计划开工时间',width:100,align:'center'},
	        {field:'jhwgsj',title:'计划完工时间',width:100,align:'center'},
	        {field : 'gydw',title : '管养单位',width : 150,align : 'center',
		    	formatter : function(value, row, index) {
		    		return row.shuihs[0].gydw;
		    	}
		    },
		    {field:'xzqhmc',title : '行政区划名称',width : 100,align : 'center',
		    	formatter : function(value, row, index) {
		    		return row.shuihs[0].xzqhmc;
		    	}
		    },
		    {field : 'lxbm',title : '路线编码',width : 80,align : 'center',
		    	formatter : function(value, row, index) {
		    		return row.shuihs[0].lxbm;
		    	}
		    },
		    {field : 'lxmc',title : '路线名称',width : 80,align : 'center',
		    	formatter : function(value, row, index) {
		    		return row.shuihs[0].lxmc;
		    	}
		    },
		    {field : 'qdzh',title : '起点桩号',width : 60,align : 'center',
		    	formatter : function(value, row, index) {
		    		return row.shuihs[0].qdzh;
		    	}
		    },
		    {field : 'zdzh',title : '止点桩号',width : 60,align : 'center',
		    	formatter : function(value, row, index) {
		    		return row.shuihs[0].zdzh;
		    	}
		    },
		    {field : 'yhlc',title : '隐患里程',width : 60,align : 'center',
		    	formatter : function(value, row, index) {
		    		return row.shuihs[0].yhlc;
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
function shxm_zjxd(jh,lx){
	var params={"jh.sbzt":jh.sbzt,"jh.spzt":jh.spzt,"jh.sbnf":jh.sbnf,"jh.jh_sbthcd":jh.jh_sbthcd,
			"lx.gydw":lx.gydw,"lx.gydwdm":lx.gydwdm,"lx.xzqhmc":lx.xzqhmc,
			"lx.xzqhdm":lx.xzqhdm,"lx.lxmc":lx.lxmc,'lx.yjsdj':lx.yjsdj,'lx.tsdqbm':lx.tsdqbm};
	var grid={id:'grid',url:'../../../jhgl/queryShuihList.do',pagination:true,rownumbers:false,
	    pageNumber:1,pageSize:10,height:325,width:1070,queryParams:params,
	    columns:[[
	        {field:'ck',checkbox:true},
	        {field:'c',title:'操作',width:150,align:'center',formatter:function(value,row,index){
	        	var result='<a style="text-decoration:none;color:#3399CC;">定位</a>    ';
	        	result+='<a href="javascript:openDialog('+"'zjxd_shxm','水毁项目计划详情','../jhkxx/shxm.jsp'"+')" style="text-decoration:none;color:#3399CC;">详细</a>';
	        	return result;
	        }},
	        {field:'zjxf',title:'资金下发',width:80,align:'center',formatter:function(value,row,index){
	        	return '<a href="javascript:openDialog('+"'zjxd_shxm','水毁项目计划详情','../zjxd/shxm.jsp'"+')" style="text-decoration:none;color:#3399CC;">资金下发</a>';
	        }},
	        {field:'sbzt',title:'建设状态',width:80,align:'center',
	        		formatter:function(value,row,index){
	        			if(row.kgzt=='0' && row.jgzt=='0')
	        				return '未开工';
	        			else if(row.kgzt=='1' && row.jgzt=='0')
	        				return '在建';
	        			else if(row.kgzt=='1' && row.jgzt=='1')
	        				return '竣工';
	        		}
	        },
	        {field:'sfylsjl',title:'是否有修建记录',width:80,align:'center'},
	        {field:'sbnf',title:'上报年份',width:80,align:'center'},
	        {field:'jhkgsj',title:'计划开工时间',width:100,align:'center'},
	        {field:'jhwgsj',title:'计划完工时间',width:100,align:'center'},
	        {field : 'gydw',title : '管养单位',width : 150,align : 'center',
		    	formatter : function(value, row, index) {
		    		return row.shuihs[0].gydw;
		    	}
		    },
		    {field:'xzqhmc',title : '行政区划名称',width : 100,align : 'center',
		    	formatter : function(value, row, index) {
		    		return row.shuihs[0].xzqhmc;
		    	}
		    },
		    {field : 'lxbm',title : '路线编码',width : 80,align : 'center',
		    	formatter : function(value, row, index) {
		    		return row.shuihs[0].lxbm;
		    	}
		    },
		    {field : 'lxmc',title : '路线名称',width : 80,align : 'center',
		    	formatter : function(value, row, index) {
		    		return row.shuihs[0].lxmc;
		    	}
		    },
		    {field : 'qdzh',title : '起点桩号',width : 60,align : 'center',
		    	formatter : function(value, row, index) {
		    		return row.shuihs[0].qdzh;
		    	}
		    },
		    {field : 'zdzh',title : '止点桩号',width : 60,align : 'center',
		    	formatter : function(value, row, index) {
		    		return row.shuihs[0].zdzh;
		    	}
		    },
		    {field : 'yhlc',title : '隐患里程',width : 60,align : 'center',
		    	formatter : function(value, row, index) {
		    		return row.shuihs[0].yhlc;
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
function queryShuihById(id){
	$.ajax({
		type:'post',
		url:'../../../jhgl/queryShuihById.do',
		dataType:'json',
		data:"jh.id="+id,
		success:function(data){
			//基础
			$('#lxmc').html(data.shuihs[0].lxmc);
			$('#lxbm').html(data.shuihs[0].lxbm);
			$('#jsdd').html(data.shuihs[0].jsdd);
			$('#qdzh').html(data.shuihs[0].qdzh);
			$('#zdzh').html(data.shuihs[0].zdzh);
			$('#qzlc').html(data.shuihs[0].qzlc);
			$('#gydwxx').html(data.shuihs[0].gydw);
			$('#xzqhdm').html(data.shuihs[0].xzqhdm);
			$('#xzqhmc').html(data.shuihs[0].xzqhmc);
			$('#yjsdj').html(data.shuihs[0].yjsdj);
			$('#ylmlx').html(data.shuihs[0].ylmlx);
			$('#yhlc').html(data.shuihs[0].yhlc);
			$('#bhnr').html(data.shuihs[0].bhnr);
			
			//计划
			$('#jhnf').html(data.sbnf);
			$('#jhkgsj').html(data.jhkgsj);
			$('#jhwgsj').html(data.jhwgsj);
			$('#jhxdsj').html(data.xdsj);
			$('#xmmc').html(data.xmmc);
			$('#yhlb').html(data.yhlb);
			$('#sjdw').html(data.sjdw);
			$('#sjpfdw').html(data.sjpfdw);
			$('#dc').html(data.dc);
			$('#jc').html(data.jc);
			$('#mc').html(data.mc);
			$('#lmkd').html(data.lmkd);
			$('#pfwh').html(data.pfwh);
			$('#pfsj').html(data.pfsj);
			$('#pfztz').html(data.pfztz);
			$('#bbz').html(data.jhsybzje);
			$('#dfzc').html(data.jhsydfzcje);
			$('#lblSFSQABLBZ').html(data.sfsqablbz);
			$('#lblABLBZWH').html(data.ablbzsqwh);
			$('#sftqss').html(data.sftqss);
			$('#jhxdwh').html(data.jhxdwh);
			$('#gkpfwh').html(data.gksjwh);
			$('#sjpfwh').html(data.sjpfwh);
			$('#sfgydbm').html(data.sfgydbm);
			$('#lblJHRemarks').html(data.jhbz);
			if(data.gkbgmc!=null){
				var mc="'"+data.gkbgmc+"'";
				$('#td_gkbg').html('<a href="javascript:downGkwj('+mc+')">'+data.gkbgmc+'</a>');
			}
			if(data.sjsgtmc!=null){
				var mc="'"+data.sjsgtmc+"'";
				$('#td_sjt').html('<a href="javascript:downSjt('+mc+')">'+data.sjsgtmc+'</a>');
			}
		}
	});
}
function dropShuih(id,readLoad){
	if(confirm("确认要移除选中计划？")){
		$.ajax({
			type:'post',
			url:'../../../jhgl/dropShuihById.do',
			dataType:'text',
			data:'jh.id='+id,
			success:function(data){
				var params={"jh.sbzt":null,"jh.spzt":null,"jh.jhnf":null,"jh.jhkgsj":null,
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
}
function dropShuihs(){
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
			url:'../../../jhgl/dropShuihById.do',
			dataType:'json',
			data:'jh.id='+id,
			success:function(data){
				if(data.jh && data.lx){
					var params={"jh.sbzt":null,"jh.spzt":null,"jh.jhnf":null,"lx.gydw":null,
							"lx.gydwdm":null,"lx.xzqhmc":null,"lx.xzqhdm":null,"lx.lxmc":null};
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
function editShuih(){
	var jh={'jh.id':$('#jhid').val(),'jh.sbnf':$('#editsbnf').combobox('getValue'),
			'jh.jhkgsj':$('#jhkgsj').datebox('getValue'),'jh.jhwgsj':$('#jhwgsj').datebox('getValue'),
			'jh.xdsj':$('#jhxdsj').datebox('getValue'),'jh.xmmc':$('#xmmc').val(),
			'jh.yhlb':$('#yhlb').val(),'jh.sjdw':$('#sjdw').val(),'jh.sjpfdw':$('#sjpfdw').val(),
			'jh.sjlmlx':$('#sjlmlx').val(),'jh.dc':$('#dc').val(),'jh.jc':$('#jc').val(),
			'jh.mc':$('#mc').val(),'jh.lmkd':$('#lmkd').val(),'jh.pfwh':$('#pfwh').val(),
			'jh.pfsj':$('#pfsj').datebox('getValue'),'jh.pfztz':$('#pfztz').val(),
			'jh.jhsybzje':$('#bbz').val(),'jh.jhsydfzcje':$('#dfzc').val(),
			'jh.sfsqablbz':$('#lblSFSQABLBZ').val(),'jh.ablbzsqwh':$('#lblABLBZWH').val(),
			'jh.sftqss':$('#sftqss').val(),'jh.jhxdwh':$('#jhxdwh').val(),
			'jh.gksjwh':$('#gkpfwh').val(),'jh.sjpfwh':$('#sjpfwh').val(),
			'jh.sfgyhbm':$('#sfgyhbm').val(),'jh.jhbz':$('#lblJHRemarks').val()
	};
	$.ajax({
		type:'post',
		url:'../../../jhgl/editShuihById.do',
		dataType:'text',
		data:jh,
		success:function(data){
			alert("修改成功！");
			$('#shxm_xx').dialog('close');
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
function editStatus(jh){
	var result;
	$.ajax({
		type:'post',
		url:'../../../jhgl/editShuihStatus.do',
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
	window.location.href="/jxzhpt/jhgl/queryShuihwjById.do?jh.id="+xxId+"&jh.gkbgmc="+file;
}
function downSjt(file){
	window.location.href="/jxzhpt/jhgl/queryShuihwjById.do?jh.id="+xxId+"&jh.sjsgtmc="+file;
}
function exportSh(filename){
	window.location.href="/jxzhpt/xtgl/getModule_jhfeiLw.do?moduleName="+filename;
}