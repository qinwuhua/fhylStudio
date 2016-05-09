var gridObj;//列表对象
var oldIndex=-1;//之前选中的
var selRow=new Array();//已选择的行号
/**
 * 查询资金切分
 * @param nf 年份
 */
function queryZjqf(nf){
	$.ajax({
		type:'post',
		async:false,
		url:'../../../jhgl/queryZjqfByZjqf.do',
		data:zjqf={'zjqf.gydwbm':$.cookie("unit"),'zjqf.nf':nf},
		dataType:'json',
		success:function(data){
			if(data!=null){
				$('#lblQfzj').html(data.abgc);
			}else{
				$('#lblQfzj').html("0");
			}
		}
	});
}
function querySumAbgc(jh,lx){
	
	var param={"jh.xmlx":jh.xmlx,"jh.sbzt":jh.sbzt,"jh.spzt":jh.spzt,"jh.jhnf":jh.jhnf,'jh.sfylsjl':jh.sfylsjl,
			"lx.gydwdm":lx.gydwdm,"lx.gydwbm":lx.gydwbm,"lx.xzqhdm":lx.xzqhdm,"lx.lxmc":lx.lxmc,"lx.gldj":lx.gldj,"lx.lxjsdj":lx.lxjsdj,
			"lx.lxbm":lx.lxbm,"lx.tsdq":lx.tsdq,"jh.jh_sbthcd":jh.jh_sbthcd};
	$.ajax({
		type:'post',
		url:'../../../jhgl/querySumAbgc.do',
		data:param,
		dataType:'json',
		success:function(data){
			if(data.id>0){
				$('#lblCount').html(data.id);
				if(data.jckabgc.qzlc!=null && data.jckabgc.qzlc!="")
					$('#lblZLC').html(data.jckabgc.qzlc);
				if(data.jckabgc.yhlc!=null && data.jckabgc.yhlc!="")
					$('#lblYHLC').html(data.jckabgc.yhlc);
				if(data.pfztz!=null && data.pfztz!="")
					$('#lblZTZ').html(data.pfztz);
				if(data.jhsybbzje!=null && data.jhsybbzje!="")
					$('#lblBTZ').html(data.jhsybbzje);
				if(data.jhsydfzczj!=null && data.jhsydfzczj!="")
					$('#lblDFTZ').html(data.jhsydfzczj);
			}else{
				$('#lblCount').html("0");
				$('#lblZLC').html("0");
				$('#lblYHLC').html("0");
				$('#lblZTZ').html("0");
				$('#lblBTZ').html("0");
				$('#lblDFTZ').html("0");
			}
		}
	});
}
function openWindow(id){
	YMLib.Var.jhbm=id;
	YMLib.UI.createWindow('abgc_xx','安保工程',"/jxzhpt/page/jhgl/jhkxx/abgc.jsp",'abgc_xx',1000,500);
}
function openWindow1(id){
	YMLib.Var.jhbm=id;
	YMLib.UI.createWindow('abgc_xx','安防工程',"/jxzhpt/page/jhgl/jhkxx/afgc.jsp",'abgc_xx',1000,500);
}
function openDialogs(id){
	YMLib.Var.jhbm=id;
	YMLib.UI.createWindow('abgc_xx','安防工程',"/jxzhpt/page/jhgl/zjxd/afgc.jsp",'abgc_xx',1000,500);
}
function openEditWindow(id){
	YMLib.Var.jhbm=id;
	YMLib.UI.createWindow('abgc_edit','安保工程',"/jxzhpt/page/jhgl/edit/abgc.jsp",'abgc_edit',1000,500);
}
function openEditWindow1(id){
	YMLib.Var.jhbm=id;
	YMLib.UI.createWindow('abgc_edit','安防工程',"/jxzhpt/page/jhgl/edit/afgc.jsp",'abgc_edit',1000,500);
}
function abgcxm(jh,lx){
	var params={"jh.xmlx":jh.xmlx,"jh.sbzt":jh.sbzt,"jh.spzt":jh.spzt,"jh.jhnf":jh.jhnf,'jh.sfylsjl':jh.sfylsjl,
			"lx.gydwdm":lx.gydwdm,"lx.gydwbm":lx.gydwbm,"lx.xzqhdm":lx.xzqhdm,"lx.lxmc":lx.lxmc,"lx.gldj":lx.gldj,"lx.lxjsdj":lx.lxjsdj,
			"lx.lxbm":lx.lxbm,"lx.tsdq":lx.tsdq,"jh.jh_sbthcd":jh.jh_sbthcd};
	
	queryParams='&jh.sbzt='+jh.sbzt+'&jh.spzt='+jh.spzt+'&jh.sbnf='+jh.sbnf+'&jh.jhkgsj='+jh.jhkgsj+
		'&jh.jhwgsj='+jh.jhwgsj+'&jh.pfztz='+jh.pfztz+
		'&lx.gydw='+lx.gydw+'&lx.gydwdm='+lx.gydwdm+'&lx.xzqhmc='+lx.xzqhmc+'&lx.xzqhdm='+lx.xzqhdm+'&lx.lxmc='+lx.lxmc;
	var grid={id:'grid',url:'../../../jhgl/queryAbgcList.do',pagination:true,rownumbers:false,
	    pageNumber:1,pageSize:10,height:$(window).height()-180,width:$('#searchField').width(),queryParams:params,
	    columns:[[
	        {field:'ck',checkbox:true},
	        {field:'c',title:'操作',width:150,align:'center',formatter:function(value,row,index){
	        	var result='<a href="javascript:locationXm1('+"'"+row.jckabgc.lxbm+"',"+"'"+row.jckabgc.qdzh+"',"+"'"+row.jckabgc.zdzh+"'"+')" style="text-decoration:none;color:#3399CC;">定位</a>    ';
	        	result+='<a href="javascript:openWindow('+"'"+row.id+"'"+')" style="text-decoration:none;color:#3399CC;">详细</a>    ';
	        	result+='<a href="javascript:openEditWindow('+"'"+row.id+"'"+')" style="text-decoration:none;color:#3399CC;">编辑</a>    ';
	        	if((roleName()=="县级" && row.jh_sbthcd==0) || (roleName()=="市级" && row.jh_sbthcd<=2) || (roleName()=="省级" && row.jh_sbthcd<=4)){
	        		//result+='<a href="javascript:openEditWindow('+"'"+row.id+"'"+')" style="text-decoration:none;color:#3399CC;">编辑</a>    ';
	        		var id="'"+row.id+"'";
	        		result+='<a href="javascript:dropOne('+id+')" style="text-decoration:none;color:#3399CC;">移除</a>';
	        	}
	        	else{
	        		//result+='<a style="text-decoration:none;color:black;">编辑</a>    ';
		        	result+='<a style="text-decoration:none;color:black;">移除</a>';
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
	        {field:'c5',title:'资金追加',width:80,align:'center',
	        	formatter:function(value,row,index){
	        		return '<a href="javascript:openZjzjWindow('+"'grid','editAbZj'"+')" style="text-decoration:none;color:#3399CC;">资金追加</a>';
	        	}
	        },
	        {field:'sfylsjl',title:'是否有修建记录',width:80,align:'center',formatter:function(value,row,index){
	        	if(row.sfylsjl=='无')
	        		return '无';
	        	else if(row.sfylsjl=='有')
	        		return '<a href="javascript:openLsjlWindow('+"'grid'"+",'"+index+"'"+",'abgc'"+",'安保工程历史信息'"+')" style="text-decoration:none;color:#3399CC;">是</a>';
	        }},
	        {field:'jhnf',title:'上报年份',width:80,align:'center'},
	        {field:'jhkgsj',title:'计划开工年',width:100,align:'center'},
	        {field:'jhwgsj',title:'计划完工年',width:100,align:'center'},
	        {field:'gydw',title:'管养单位',width:150,align:'center',
	        	formatter : function(value, row, index) {
					return row.jckabgc.gydw;
				}
	        },
	        {field:'xzqhmc',title:'行政区划名称',width:100,align:'center',
	        	formatter : function(value, row, index) {
					return row.jckabgc.xzqhmc;
				}
	        },
	        {field:'lxbm',title:'路线编码',width:80,align:'center',
	        	formatter : function(value, row, index) {
					return row.jckabgc.lxbm;
				}
	        },
	        {field:'lxmc',title:'路线名称',width:80,align:'center',
	        	formatter : function(value, row, index) {
					return row.jckabgc.lxmc;
				}
	        },
	        {field:'qdzh',title:'起点桩号',width:60,align:'center',
	        	formatter : function(value, row, index) {
					return row.jckabgc.qdzh;
				}
	        },
	        {field:'zdzh',title:'止点桩号',width:60,align:'center',
	        	formatter : function(value, row, index) {
					return row.jckabgc.zdzh;
				}
	        },
	        {field:'yhlc',title:'隐患里程',width:60,align:'center',
	        	formatter : function(value, row, index) {
					return row.jckabgc.scyhlc;
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
			querySumAbgc(jh,lx);
		}
	};
	gridBind(grid);
}

function afgcxm(jh,lx){
	
	var params={"jh.xmlx":jh.xmlx,"jh.sbzt":jh.sbzt,"jh.spzt":jh.spzt,"jh.jhnf":jh.jhnf,'jh.sfylsjl':jh.sfylsjl,
			"lx.gydwdm":lx.gydwdm,"lx.gydwbm":lx.gydwbm,"lx.xzqhdm":lx.xzqhdm,"lx.lxmc":lx.lxmc,"lx.gldj":lx.gldj,"lx.lxjsdj":lx.lxjsdj,
			"lx.lxbm":lx.lxbm,"lx.tsdq":lx.tsdq,"jh.jh_sbthcd":jh.jh_sbthcd};
	
	queryParams='&jh.sbzt='+jh.sbzt+'&jh.spzt='+jh.spzt+'&jh.sbnf='+jh.sbnf+'&jh.jhkgsj='+jh.jhkgsj+
		'&jh.jhwgsj='+jh.jhwgsj+'&jh.pfztz='+jh.pfztz+
		'&lx.gydw='+lx.gydw+'&lx.gydwdm='+lx.gydwdm+'&lx.xzqhmc='+lx.xzqhmc+'&lx.xzqhdm='+lx.xzqhdm+'&lx.lxmc='+lx.lxmc;
	var grid={id:'grid',url:'../../../jhgl/queryAbgcList.do',pagination:true,rownumbers:false,
	    pageNumber:1,pageSize:10,height:$(window).height()-180,width:$('#searchField').width(),queryParams:params,
	    columns:[[
	        {field:'ck',checkbox:true},
	        {field:'c',title:'操作',width:150,align:'center',formatter:function(value,row,index){
	        	var result='<a href="javascript:locationXm1('+"'"+row.jckabgc.lxbm+"',"+"'"+row.jckabgc.qdzh+"',"+"'"+row.jckabgc.zdzh+"'"+')" style="text-decoration:none;color:#3399CC;">定位</a>    ';
	        	result+='<a href="javascript:openWindow1('+"'"+row.id+"'"+')" style="text-decoration:none;color:#3399CC;">详细</a>    ';
	        	if((row.jh_sbthcd==6)){
		        	result+='编辑';

				}else{
		        	result+='<a href="javascript:openEditWindow1('+"'"+row.id+"'"+')" style="text-decoration:none;color:#3399CC;">编辑</a>    ';

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
	       /* {field:'c5',title:'资金追加',width:80,align:'center',
	        	formatter:function(value,row,index){
	        		return '<a href="javascript:openZjzjWindow('+"'grid','editAbZj'"+')" style="text-decoration:none;color:#3399CC;">资金追加</a>';
	        	}
	        },*/
	        {field:'sfylsjl',title:'是否有修建记录',width:80,align:'center',formatter:function(value,row,index){
	        	if(row.sfylsjl=='无')
	        		return '无';
	        	else if(row.sfylsjl=='有')
	        		return '<a href="javascript:openLsjlWindow('+"'grid'"+",'"+index+"'"+",'abgc'"+",'安保工程历史信息'"+')" style="text-decoration:none;color:#3399CC;">是</a>';
	        }},
	        {field:'jhnf',title:'上报年份',width:80,align:'center'},
	        {field:'jhkgsj',title:'计划开工年',width:100,align:'center'},
	        {field:'jhwgsj',title:'计划完工年',width:100,align:'center'},
	        {field:'gydw',title:'管养单位',width:150,align:'center',
	        	formatter : function(value, row, index) {
					return row.jckabgc.gydw;
				}
	        },
	        {field:'xzqhmc',title:'行政区划名称',width:100,align:'center',
	        	formatter : function(value, row, index) {
					return row.jckabgc.xzqhmc;
				}
	        },
	        {field:'lxbm',title:'路线编码',width:80,align:'center',
	        	formatter : function(value, row, index) {
					return row.jckabgc.lxbm;
				}
	        },
	        {field:'lxmc',title:'路线名称',width:80,align:'center',
	        	formatter : function(value, row, index) {
					return row.jckabgc.lxmc;
				}
	        },
	        {field:'qdzh',title:'起点桩号',width:60,align:'center',
	        	formatter : function(value, row, index) {
					return row.jckabgc.qdzh;
				}
	        },
	        {field:'zdzh',title:'止点桩号',width:60,align:'center',
	        	formatter : function(value, row, index) {
					return row.jckabgc.zdzh;
				}
	        },
	        {field:'yhlc',title:'隐患里程',width:60,align:'center',
	        	formatter : function(value, row, index) {
					return row.jckabgc.scyhlc;
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
			querySumAbgc(jh,lx);
		}
	};
	gridBind(grid);
}
function abgcxm_sb(jh,lx){
	var params={"jh.xmlx":jh.xmlx,"jh.sbzt":jh.sbzt,"jh.spzt":jh.spzt,"jh.jhnf":jh.jhnf,'jh.sfylsjl':jh.sfylsjl,
			"lx.gydwdm":lx.gydwdm,"lx.gydwbm":lx.gydwbm,"lx.xzqhdm":lx.xzqhdm,"lx.lxmc":lx.lxmc,"lx.gldj":lx.gldj,"lx.lxjsdj":lx.lxjsdj,
			"lx.lxbm":lx.lxbm,"lx.tsdq":lx.tsdq,"jh.jh_sbthcd":jh.jh_sbthcd};
	
	var grid={id:'grid',url:'../../../jhgl/queryAbgcList.do',pagination:true,rownumbers:false,
	    pageNumber:1,pageSize:10,height:$(window).height()-188,width:$('#searchField').width(),queryParams:params,
	    columns:[[
	        {field:'c',title:'操作',width:150,align:'center',formatter:function(value,row,index){
	        	var result="";
	        	result+='<a href="javascript:locationXm1('+"'"+row.jckabgc.lxbm+"',"+"'"+row.jckabgc.qdzh+"',"+"'"+row.jckabgc.zdzh+"'"+')" style="text-decoration:none;color:#3399CC;">定位</a>    ';
	        	result+='<a href="javascript:openWindow('+"'"+row.id+"'"+')" style="text-decoration:none;color:#3399CC;">详细</a>    ';
	        	if((roleName()=="县级" && row.jh_sbthcd==0) || (roleName()=="市级" && row.jh_sbthcd<=2) || (roleName()=="省级" && row.jh_sbthcd<=4)){
	        		result+='<a href="javascript:openEditWindow('+"'"+row.id+"'"+')" style="text-decoration:none;color:#3399CC;">编辑</a>';
	        	}else{
	        		result+='<a style="text-decoration:none;color:black;">编辑</a>';
	        	}
	        	return result;
	        }},
	        {field:'c4',title:'上报状态',width:80,align:'center',formatter:function(value,row,index){
	        	var result="";
				var id="'"+row.id+"'";
				if((roleName()=="县级" && row.jh_sbthcd==0) || (roleName()=="市级" && row.jh_sbthcd<=2) || (roleName()=="省级" && row.jh_sbthcd<=4)){
					result='<a href="javascript:sb('+"'"+row.id+"'"+','+row.jh_sbthcd+')" style="text-decoration:none;color:#3399CC;">未上报</a>';
					if(roleName()=="市级")
						result+='       <a href="javascript:tuihui('+"'"+row.id+"'"+','+row.jh_sbthcd+')" style="text-decoration:none;color:#3399CC;">退回</a>';
//					result="未上报";
				}else{
					result='<a style="text-decoration:none;color:black;">已上报</a>';
				}
				return result;
	        }},
	        {field:'sfylsjl',title:'是否有修建记录',width:80,align:'center',formatter:function(value,row,index){
	        	if(row.sfylsjl=='无')
	        		return '无';
	        	else if(row.sfylsjl=='有')
	        		return '<a href="javascript:openLsjlWindow('+"'grid'"+",'"+index+"'"+",'abgc'"+",'安保工程历史信息'"+')" style="text-decoration:none;color:#3399CC;">是</a>';
	        }},
	        {field:'jhnf',title:'上报年份',width:80,align:'center'},
	        {field:'jhkgsj',title:'计划开工年',width:100,align:'center'},
	        {field:'jhwgsj',title:'计划完工年',width:100,align:'center'},
	        {field:'gydw',title:'管养单位',width:150,align:'center',
	        	formatter : function(value, row, index) {
					return row.jckabgc.gydw;
				}
	        },
	        {field:'xzqhmc',title:'行政区划名称',width:100,align:'center',
	        	formatter : function(value, row, index) {
					return row.jckabgc.xzqhmc;
				}
	        },
	        {field:'lxbm',title:'路线编码',width:80,align:'center',
	        	formatter : function(value, row, index) {
					return row.jckabgc.lxbm;
				}
	        },
	        {field:'lxmc',title:'路线名称',width:80,align:'center',
	        	formatter : function(value, row, index) {
					return row.jckabgc.lxmc;
				}
	        },
	        {field:'qdzh',title:'起点桩号',width:60,align:'center',
	        	formatter : function(value, row, index) {
					return row.jckabgc.qdzh;
				}
	        },
	        {field:'zdzh',title:'止点桩号',width:60,align:'center',
	        	formatter : function(value, row, index) {
					return row.jckabgc.zdzh;
				}
	        },
	        {field:'yhlc',title:'隐患里程',width:60,align:'center',
	        	formatter : function(value, row, index) {
					return row.jckabgc.scyhlc;
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
			querySumAbgc(jh,lx);
		}
	};
	gridBind(grid);
}
//
function afgcxm_sb(jh,lx){
	var params={"jh.xmlx":jh.xmlx,"jh.sbzt":jh.sbzt,"jh.spzt":jh.spzt,"jh.jhnf":jh.jhnf,'jh.sfylsjl':jh.sfylsjl,
			"lx.gydwdm":lx.gydwdm,"lx.gydwbm":lx.gydwbm,"lx.xzqhdm":lx.xzqhdm,"lx.lxmc":lx.lxmc,"lx.gldj":lx.gldj,"lx.lxjsdj":lx.lxjsdj,
			"lx.lxbm":lx.lxbm,"lx.tsdq":lx.tsdq,"jh.jh_sbthcd":jh.jh_sbthcd};
	
	var grid={id:'grid',url:'../../../jhgl/queryAbgcList.do',pagination:true,rownumbers:false,
	    pageNumber:1,pageSize:10,height:$(window).height()-188,width:$('#searchField').width(),queryParams:params,
	    columns:[[
	        {field:'c',title:'操作',width:150,align:'center',formatter:function(value,row,index){
	        	var result="";
	        	result+='<a href="javascript:locationXm1('+"'"+row.jckabgc.lxbm+"',"+"'"+row.jckabgc.qdzh+"',"+"'"+row.jckabgc.zdzh+"'"+')" style="text-decoration:none;color:#3399CC;">定位</a>    ';
	        	result+='<a href="javascript:openWindow1('+"'"+row.id+"'"+')" style="text-decoration:none;color:#3399CC;">详细</a>    ';
	        	if((roleName()=="县级" && row.jh_sbthcd==0) || (roleName()=="市级" && row.jh_sbthcd<=2) || (roleName()=="省级" && row.jh_sbthcd<=4)){
	        		result+='<a href="javascript:openEditWindow1('+"'"+row.id+"'"+')" style="text-decoration:none;color:#3399CC;">编辑</a>';
	        	}else{
	        		result+='<a style="text-decoration:none;color:black;">编辑</a>';
	        	}
	        	return result;
	        }},
	        {field:'c4',title:'上报状态',width:80,align:'center',formatter:function(value,row,index){
	        	var result="";
				var id="'"+row.id+"'";
				if((roleName()=="县级" && row.jh_sbthcd==0) || (roleName()=="市级" && row.jh_sbthcd<=2) || (roleName()=="省级" && row.jh_sbthcd<=4)){
					result='<a href="javascript:sb('+"'"+row.id+"'"+','+row.jh_sbthcd+')" style="text-decoration:none;color:#3399CC;">未上报</a>';
					if(roleName()=="市级")
						result+='       <a href="javascript:tuihui('+"'"+row.id+"'"+','+row.jh_sbthcd+')" style="text-decoration:none;color:#3399CC;">退回</a>';
//					result="未上报";
				}else{
					result='<a style="text-decoration:none;color:black;">已上报</a>';
				}
				return result;
	        }},
	        {field:'sfylsjl',title:'是否有修建记录',width:80,align:'center',formatter:function(value,row,index){
	        	if(row.sfylsjl=='无')
	        		return '无';
	        	else if(row.sfylsjl=='有')
	        		return '<a href="javascript:openLsjlWindow('+"'grid'"+",'"+index+"'"+",'abgc'"+",'安保工程历史信息'"+')" style="text-decoration:none;color:#3399CC;">是</a>';
	        }},
	        {field:'jhnf',title:'上报年份',width:80,align:'center'},
	        {field:'jhkgsj',title:'计划开工年',width:100,align:'center'},
	        {field:'jhwgsj',title:'计划完工年',width:100,align:'center'},
	        {field:'gydw',title:'管养单位',width:150,align:'center',
	        	formatter : function(value, row, index) {
					return row.jckabgc.gydw;
				}
	        },
	        {field:'xzqhmc',title:'行政区划名称',width:100,align:'center',
	        	formatter : function(value, row, index) {
					return row.jckabgc.xzqhmc;
				}
	        },
	        {field:'lxbm',title:'路线编码',width:80,align:'center',
	        	formatter : function(value, row, index) {
					return row.jckabgc.lxbm;
				}
	        },
	        {field:'lxmc',title:'路线名称',width:80,align:'center',
	        	formatter : function(value, row, index) {
					return row.jckabgc.lxmc;
				}
	        },
	        {field:'qdzh',title:'起点桩号',width:60,align:'center',
	        	formatter : function(value, row, index) {
					return row.jckabgc.qdzh;
				}
	        },
	        {field:'zdzh',title:'止点桩号',width:60,align:'center',
	        	formatter : function(value, row, index) {
					return row.jckabgc.zdzh;
				}
	        },
	        {field:'yhlc',title:'隐患里程',width:60,align:'center',
	        	formatter : function(value, row, index) {
					return row.jckabgc.scyhlc;
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
			querySumAbgc(jh,lx);
		}
	};
	gridBind(grid);
}

function abgcxm_sh(jh,lx){
	var params={"jh.xmlx":jh.xmlx,"jh.sbzt":jh.sbzt,"jh.spzt":jh.spzt,"jh.jhnf":jh.jhnf,'jh.sfylsjl':jh.sfylsjl,
			"lx.gydwdm":lx.gydwdm,"lx.gydwbm":lx.gydwbm,"lx.xzqhdm":lx.xzqhdm,"lx.lxmc":lx.lxmc,"lx.gldj":lx.gldj,"lx.lxjsdj":lx.lxjsdj,
			"lx.lxbm":lx.lxbm,"lx.tsdq":lx.tsdq,"jh.jh_sbthcd":jh.jh_sbthcd};
	
	var grid={id:'grid',url:'../../../jhgl/queryAbgcList.do',pagination:true,rownumbers:false,
	    pageNumber:1,pageSize:10,height:$(window).height()-188,width:$('#searchField').width(),queryParams:params,
	    columns:[[
	        {field:'c',title:'操作',width:150,align:'center',formatter:function(value,row,index){
	        	var result="";
	        	result+='<a href="javascript:locationXm1('+"'"+row.jckabgc.lxbm+"',"+"'"+row.jckabgc.qdzh+"',"+"'"+row.jckabgc.zdzh+"'"+')" style="text-decoration:none;color:#3399CC;">定位</a>  ';
	        	result+='<a href="javascript:openWindow('+"'"+row.id+"'"+')" style="text-decoration:none;color:#3399CC;">详细</a>    ';
	        	//if(($.cookie("unit")=="36" && row.jh_sbthcd<=4))
	        		result+='<a href="javascript:openEditWindow('+"'"+row.id+"'"+')" style="text-decoration:none;color:#3399CC;">编辑</a>';
	        	//else
	        	//	result+='<a style="text-decoration:none;color:black;">编辑</a>';
	        	result+='  <a href="javascript:tz('+"'"+row.id+"'"+')" style="text-decoration:none;color:#3399CC;">调整</a>';
	        	return result;
	        }},
	        {field:'c4',title:'审批状态',width:80,align:'center',formatter:function(value,row,index){
	        	var result;
				if(row.spzt=='0'){
					var id="'"+row.id+"'";
					result='<a href="javascript:sp('+id+','+row.jh_sbthcd+')" style="text-decoration:none;color:#3399CC;">审批</a>         ';
					result+='<a href="javascript:tuihhui('+id+','+row.jh_sbthcd+')" style="text-decoration:none;color:#3399CC;">退回</a>';
				}
				else if(row.spzt=="1"){
					result="已审批";
				}
				return result;
	        }},
	        {field:'sfylsjl',title:'是否有修建记录',width:80,align:'center',formatter:function(value,row,index){
	        	if(row.sfylsjl=='无')
	        		return '无';
	        	else if(row.sfylsjl=='有')
	        		return '<a href="javascript:openLsjlWindow('+"'grid'"+",'"+index+"'"+",'abgc'"+",'安保工程历史信息'"+')" style="text-decoration:none;color:#3399CC;">是</a>';
	        }},
	        {field:'jhnf',title:'上报年份',width:80,align:'center'},
	        {field:'jhkgsj',title:'计划开工年',width:100,align:'center'},
	        {field:'jhwgsj',title:'计划完工年',width:100,align:'center'},
	        {field:'gydw',title:'管养单位',width:150,align:'center',
	        	formatter : function(value, row, index) {
					return row.jckabgc.gydw;
				}
	        },
	        {field:'xzqhmc',title:'行政区划名称',width:100,align:'center',
	        	formatter : function(value, row, index) {
					return row.jckabgc.xzqhmc;
				}
	        },
	        {field:'lxbm',title:'路线编码',width:80,align:'center',
	        	formatter : function(value, row, index) {
					return row.jckabgc.lxbm;
				}
	        },
	        {field:'lxmc',title:'路线名称',width:80,align:'center',
	        	formatter : function(value, row, index) {
					return row.jckabgc.lxmc;
				}
	        },
	        {field:'qdzh',title:'起点桩号',width:60,align:'center',
	        	formatter : function(value, row, index) {
					return row.jckabgc.qdzh;
				}
	        },
	        {field:'zdzh',title:'止点桩号',width:60,align:'center',
	        	formatter : function(value, row, index) {
					return row.jckabgc.zdzh;
				}
	        },
	        {field:'yhlc',title:'隐患里程',width:60,align:'center',
	        	formatter : function(value, row, index) {
					return row.jckabgc.scyhlc;
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
			querySumAbgc(jh,lx);
		}
	};
	gridBind(grid);
}
//
function afgcxm_sh(jh,lx){
	var params={"jh.xmlx":jh.xmlx,"jh.sbzt":jh.sbzt,"jh.spzt":jh.spzt,"jh.jhnf":jh.jhnf,'jh.sfylsjl':jh.sfylsjl,
			"lx.gydwdm":lx.gydwdm,"lx.gydwbm":lx.gydwbm,"lx.xzqhdm":lx.xzqhdm,"lx.lxmc":lx.lxmc,"lx.gldj":lx.gldj,"lx.lxjsdj":lx.lxjsdj,
			"lx.lxbm":lx.lxbm,"lx.tsdq":lx.tsdq,"jh.jh_sbthcd":jh.jh_sbthcd};
	
	var grid={id:'grid',url:'../../../jhgl/queryAbgcList.do',pagination:true,rownumbers:false,
	    pageNumber:1,pageSize:10,height:$(window).height()-188,width:$('#searchField').width(),queryParams:params,
	    columns:[[
	        {field:'c',title:'操作',width:150,align:'center',formatter:function(value,row,index){
	        	var result="";
	        	result+='<a href="javascript:locationXm1('+"'"+row.jckabgc.lxbm+"',"+"'"+row.jckabgc.qdzh+"',"+"'"+row.jckabgc.zdzh+"'"+')" style="text-decoration:none;color:#3399CC;">定位</a>  ';
	        	result+='<a href="javascript:openWindow1('+"'"+row.id+"'"+')" style="text-decoration:none;color:#3399CC;">详细</a>    ';
	        	//if(($.cookie("unit")=="36" && row.jh_sbthcd<=4))
	        		result+='<a href="javascript:openEditWindow1('+"'"+row.id+"'"+')" style="text-decoration:none;color:#3399CC;">编辑</a>';
	        	//else
	        	//	result+='<a style="text-decoration:none;color:black;">编辑</a>';
//	        	result+='  <a href="javascript:tz('+"'"+row.id+"'"+')" style="text-decoration:none;color:#3399CC;">调整</a>';
	        	return result;
	        }},
	        {field:'c4',title:'审批状态',width:80,align:'center',formatter:function(value,row,index){
	        	var result;
				if(row.spzt=='0'){
					var id="'"+row.id+"'";
					result='<a href="javascript:sp('+id+','+row.jh_sbthcd+')" style="text-decoration:none;color:#3399CC;">审批</a>         ';
					result+='<a href="javascript:tuihhui('+id+','+row.jh_sbthcd+')" style="text-decoration:none;color:#3399CC;">退回</a>';
				}
				else if(row.spzt=="1"){
					result="已审批";
				}
				return result;
	        }},
	        {field:'sfylsjl',title:'是否有修建记录',width:80,align:'center',formatter:function(value,row,index){
	        	if(row.sfylsjl=='无')
	        		return '无';
	        	else if(row.sfylsjl=='有')
	        		return '<a href="javascript:openLsjlWindow('+"'grid'"+",'"+index+"'"+",'abgc'"+",'安保工程历史信息'"+')" style="text-decoration:none;color:#3399CC;">是</a>';
	        }},
	        {field:'jhnf',title:'上报年份',width:80,align:'center'},
	        {field:'jhkgsj',title:'计划开工年',width:100,align:'center'},
	        {field:'jhwgsj',title:'计划完工年',width:100,align:'center'},
	        {field:'gydw',title:'管养单位',width:150,align:'center',
	        	formatter : function(value, row, index) {
					return row.jckabgc.gydw;
				}
	        },
	        {field:'xzqhmc',title:'行政区划名称',width:100,align:'center',
	        	formatter : function(value, row, index) {
					return row.jckabgc.xzqhmc;
				}
	        },
	        {field:'lxbm',title:'路线编码',width:80,align:'center',
	        	formatter : function(value, row, index) {
					return row.jckabgc.lxbm;
				}
	        },
	        {field:'lxmc',title:'路线名称',width:80,align:'center',
	        	formatter : function(value, row, index) {
					return row.jckabgc.lxmc;
				}
	        },
	        {field:'qdzh',title:'起点桩号',width:60,align:'center',
	        	formatter : function(value, row, index) {
					return row.jckabgc.qdzh;
				}
	        },
	        {field:'zdzh',title:'止点桩号',width:60,align:'center',
	        	formatter : function(value, row, index) {
					return row.jckabgc.zdzh;
				}
	        },
	        {field:'yhlc',title:'隐患里程',width:60,align:'center',
	        	formatter : function(value, row, index) {
					return row.jckabgc.scyhlc;
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
			querySumAbgc(jh,lx);
		}
	};
	gridBind(grid);
}

function abgcxm_zjxd(jh,lx){
	var params={"jh.xmlx":jh.xmlx,"jh.sbzt":jh.sbzt,"jh.spzt":jh.spzt,"jh.jhnf":jh.jhnf,'jh.sfylsjl':jh.sfylsjl,
			"lx.gydwdm":lx.gydwdm,"lx.gydwbm":lx.gydwbm,"lx.xzqhdm":lx.xzqhdm,"lx.lxmc":lx.lxmc,"lx.gldj":lx.gldj,"lx.lxjsdj":lx.lxjsdj,
			"lx.lxbm":lx.lxbm,"lx.tsdq":lx.tsdq,"jh.jh_sbthcd":jh.jh_sbthcd};
	
	var grid={id:'grid',url:'../../../jhgl/queryAbgcList.do',pagination:true,rownumbers:false,
	    pageNumber:1,pageSize:10,height:$(window).height()-158,width:$('#searchField').width(),queryParams:params,
	    columns:[[
	        {field:'c',title:'操作',width:150,align:'center',formatter:function(value,row,index){
	        	var result="";
	        	result+='<a href="javascript:locationXm1('+"'"+row.jckabgc.lxbm+"',"+"'"+row.jckabgc.qdzh+"',"+"'"+row.jckabgc.zdzh+"'"+')" style="text-decoration:none;color:#3399CC;">定位</a>    ';
	        	result+='<a href="javascript:openWindow('+"'"+row.id+"'"+')" style="text-decoration:none;color:#3399CC;">详细</a>';
	        	return result;
	        }},
	        {field:'zjxf',title:'资金下达',width:80,align:'center',formatter:function(value,row,index){
	        	return '<a href="javascript:openDialog('+"'zjxd_abgc','安保工程资金下达','../zjxd/abgc.jsp'"+')" style=" text-decoration:none;color:#3399CC;">资金下达</a>';
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
	        		return '<a href="javascript:openLsjlWindow('+"'grid'"+",'"+index+"'"+",'abgc'"+",'安保工程历史信息'"+')" style="text-decoration:none;color:#3399CC;">是</a>';
	        }},
	        {field:'jhnf',title:'上报年份',width:80,align:'center'},
	        {field:'jhkgsj',title:'计划开工年',width:100,align:'center'},
	        {field:'jhwgsj',title:'计划完工年',width:100,align:'center'},
	        {field:'gydw',title:'管养单位',width:150,align:'center',
	        	formatter : function(value, row, index) {
					return row.jckabgc.gydw;
				}
	        },
	        {field:'xzqhmc',title:'行政区划名称',width:100,align:'center',
	        	formatter : function(value, row, index) {
					return row.jckabgc.xzqhmc;
				}
	        },
	        {field:'lxbm',title:'路线编码',width:80,align:'center',
	        	formatter : function(value, row, index) {
					return row.jckabgc.lxbm;
				}
	        },
	        {field:'lxmc',title:'路线名称',width:80,align:'center',
	        	formatter : function(value, row, index) {
					return row.jckabgc.lxmc;
				}
	        },
	        {field:'qdzh',title:'起点桩号',width:60,align:'center',
	        	formatter : function(value, row, index) {
					return row.jckabgc.qdzh;
				}
	        },
	        {field:'zdzh',title:'止点桩号',width:60,align:'center',
	        	formatter : function(value, row, index) {
					return row.jckabgc.zdzh;
				}
	        },
	        {field:'yhlc',title:'隐患里程',width:60,align:'center',
	        	formatter : function(value, row, index) {
					return row.jckabgc.scyhlc;
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
//
function afgcxm_zjxd(jh,lx){
	var params={"jh.xmlx":jh.xmlx,"jh.sbzt":jh.sbzt,"jh.spzt":jh.spzt,"jh.jhnf":jh.jhnf,'jh.sfylsjl':jh.sfylsjl,
			"lx.gydwdm":lx.gydwdm,"lx.gydwbm":lx.gydwbm,"lx.xzqhdm":lx.xzqhdm,"lx.lxmc":lx.lxmc,"lx.gldj":lx.gldj,"lx.lxjsdj":lx.lxjsdj,
			"lx.lxbm":lx.lxbm,"lx.tsdq":lx.tsdq,"jh.jh_sbthcd":jh.jh_sbthcd};
	
	var grid={id:'grid',url:'../../../jhgl/queryAbgcList.do',pagination:true,rownumbers:false,
	    pageNumber:1,pageSize:10,height:$(window).height()-158,width:$('#searchField').width(),queryParams:params,
	    columns:[[
	        {field:'c',title:'操作',width:150,align:'center',formatter:function(value,row,index){
	        	var result="";
	        	result+='<a href="javascript:locationXm1('+"'"+row.jckabgc.lxbm+"',"+"'"+row.jckabgc.qdzh+"',"+"'"+row.jckabgc.zdzh+"'"+')" style="text-decoration:none;color:#3399CC;">定位</a>    ';
	        	result+='<a href="javascript:openWindow1('+"'"+row.id+"'"+')" style="text-decoration:none;color:#3399CC;">详细</a>';
	        	return result;
	        }},
	        {field:'zjxf',title:'资金下达',width:80,align:'center',formatter:function(value,row,index){
	        	return '<a href="javascript:openDialogs('+"'"+row.id+"'"+')" style=" text-decoration:none;color:#3399CC;">资金下达</a>';
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
	        		return '<a href="javascript:openLsjlWindow('+"'grid'"+",'"+index+"'"+",'abgc'"+",'安保工程历史信息'"+')" style="text-decoration:none;color:#3399CC;">是</a>';
	        }},
	        {field:'jhnf',title:'上报年份',width:80,align:'center'},
	        {field:'jhkgsj',title:'计划开工年',width:100,align:'center'},
	        {field:'jhwgsj',title:'计划完工年',width:100,align:'center'},
	        {field:'gydw',title:'管养单位',width:150,align:'center',
	        	formatter : function(value, row, index) {
					return row.jckabgc.gydw;
				}
	        },
	        {field:'xzqhmc',title:'行政区划名称',width:100,align:'center',
	        	formatter : function(value, row, index) {
					return row.jckabgc.xzqhmc;
				}
	        },
	        {field:'lxbm',title:'路线编码',width:80,align:'center',
	        	formatter : function(value, row, index) {
					return row.jckabgc.lxbm;
				}
	        },
	        {field:'lxmc',title:'路线名称',width:80,align:'center',
	        	formatter : function(value, row, index) {
					return row.jckabgc.lxmc;
				}
	        },
	        {field:'qdzh',title:'起点桩号',width:60,align:'center',
	        	formatter : function(value, row, index) {
					return row.jckabgc.qdzh;
				}
	        },
	        {field:'zdzh',title:'止点桩号',width:60,align:'center',
	        	formatter : function(value, row, index) {
					return row.jckabgc.zdzh;
				}
	        },
	        {field:'yhlc',title:'隐患里程',width:60,align:'center',
	        	formatter : function(value, row, index) {
					return row.jckabgc.scyhlc;
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
function queryAbgc(id){
	$.ajax({
		type:'post',
		url:'../../../jhgl/queryAbgcById.do',
		data:"jh.id="+id,
		dataType:'json',
		success:function(data){
			//审查库
			$.ajax({
				type:'post',
				url:'../../../xmsck/selectSckabgcById.do',
				dataType:'json',
				data:'sckid='+data.sckid,
				success:function(data){
					if(data!=null){
						//基础
						$('#lxmc').html(data.lxmc);
						$('#lxbm').html(data.lxbm);
						$('#gydwxx').html(data.gydw);
						$('#qdzh').html(data.qdzh);
						$('#zdzh').html(data.zdzh);
						$('#qzlc').html(data.qzlc);
						$('#xzqhdm').html(data.xzqhdm);
						$('#xzqhmc').html(data.xzqhmc);
						$('#xjgjnd').html(data.gjxjnd);
						$('#jsdjxx').html(data.lxjsdj);
						$('#yhlc').html(data.yhlc);
						$('#tsdq').html(data.tsdq);
						$('#xmnf').html(data.xmnf);
						$('#xmzt').html(data.xmzt);
						$('#yhnr').html(data.yhnr);
						$('#bz').html(data.bz);
						//审查
						$('#scqdzh').html(data.scqdzh);
						$('#sczdzh').html(data.sczdzh);
						$('#sczlc').html(data.sczdzh);
						$('#scyhlc').html(data.sczdzh);
						$('#fapgdw').html(data.fapgdw);
						$('#fascdw').html(data.fascdw);
						$('#faspsj').html(data.faspsj);
						$('#spwh').html(data.spwh);
						$('#tzgs').html(data.tzgs);
						$('#jsxz').html(data.jsxz);
						$('#jsnr').html(data.jsnr);
						$('#remarks').html(data.remarks);
					}
				}
			});
			//计划
			$('#jhid').val(data.id);
			$('#jhnfxx').html(data.jhnf);
			$('#JHKGSJ').html(data.jhkgsj);
			$('#JHWGSJ').html(data.jhwgsj);
			$('#JHXDSJ').html(data.xdsj);
			$('#JHWC_C').html(data.jhwc_c);
			$('#SJDW').html(data.sjdw);
			$('#SJPFDW').html(data.sjpfdw);
			$('#PFWH').html(data.pfwh);
			$('#PFSJ').html(data.pfsj);
			$('#JHZTZ').html(data.pfztz);
			$('#bbz').html(data.jhsybbzje);
			$('#DFZC').html(data.jhsydfzczj);
			$('#JHXDWH').html(data.jhxdwh);
			$('#SFSQABLBZ').html(data.sfsqablbz);
			$('#ABLBZWH').html(data.ablbzsqwh);
			$('#JHRemarks').html(data.remarks);
			if(data.gkbgmc!=''){
				$('#xz_gkbg').html("<a href='#' onclick='downFile1()' style='text-decoration:none;color:#3399CC;'>"+data.gkbgmc+"</a>");
			}
			if(data.sjsgtmc!=''){
				$("#xz_sjsgt").html("<a href='#' onclick='downFile2()' style='text-decoration:none;color:#3399CC;'>"+data.sjsgtmc+"</a>");
			}
		}
	}); 
}
function openAddAbgc(){
	openAdd('abgc_add','添加安保工程项目','../add/abgcAdd.jsp');
}
function dropOne(id){
	var sel=gridObj.datagrid("getSelections");
	if(sel.length==0){
		alert("请选择要删除的计划！");
		return;
	}
	if(confirm("确认要移除选中计划？")){
		var strId="",sckId="";
		$.each(sel,function(index,item){
			if(index==sel.length-1){
				strId+=item.id;
			}else{
				strId+=item.id+",";
			}
			if(index==sel.length-1){
				sckId+=item.sckid;
			}else{
				sckId+=item.sckid+",";
			}
		});
		$.ajax({
			type:'post',
			url:'../../../jhgl/dropAbgcById.do',
			dataType:'json',
			data:'jh.id='+strId,
			success:function(data){
				var params={"jh.sbzt":null,"jh.spzt":null,"jh.jhnf":null,"jh.jhkgsj":null,
						"jh.jhwgsj":null,"jh.pfztz":null,
						"lx.gydw":null,"lx.gydwdm":null,"lx.xzqhmc":null,"lx.xzqhdm":null,"lx.lxmc":null};
				$.ajax({
					type:'post',
					url:'../../../jhgl/updateLrztBySckid.do',
					dataType:'json',
					data:'jh.sckid='+sckId,
					success:function(up){
						if(up.result && data.result){
							gridObj.datagrid("reload",params);
						}
					}
				});
			}
		});
	}
}
function editAbgc(xmlx){
	var jh;
	if(xmlx=='af'){
		jh={'jh.xmlx':xmlx,'jh.id':$('#jhid').val(),
				'jh.jhnf':$('#editjhnf').combobox('getValue'),
				'jh.jhkgsj':$('#JHKGSJ').datebox('getValue'),
				'jh.jhwgsj':$('#JHWGSJ').datebox('getValue'),
				//'jh.xdsj':$('#JHXDSJ').datebox('getValue'),
				'jh.jhwc_c':$('#JHWC_C').val(),
				'jh.sjdw':$('#SJDW').val(),
				'jh.sjpfdw':$('#SJPFDW').val(),
				'jh.pfwh':$('#PFWH').val(),
				'jh.pfsj':$('#PFSJ').datebox('getValue'),
				'jh.pfztz':$('#JHZTZ').val(),
				'jh.jhsybbzje':$('#bbz').val(),
				'jh.jhsydfzczj':$('#DFZC').html(),
				//'jh.jhxdwh':$('#JHXDWH').val(),
				'jh.sfsqablbz':$("input[name='sfsqablbz']:checked").val(),
				'jh.ablbzsqwh':$('#ABLBZWH').val(),
				'jh.remarks':$('#JHRemarks').val()};
		}else{
		jh={'jh.xmlx':xmlx,'jh.id':$('#jhid').val(),
				'jh.jhnf':$('#editjhnf').combobox('getValue'),
				'jh.jhkgsj':$('#JHKGSJ').datebox('getValue'),
				'jh.jhwgsj':$('#JHWGSJ').datebox('getValue'),
				//'jh.xdsj':$('#JHXDSJ').datebox('getValue'),
				'jh.jhwc_c':$('#JHWC_C').val(),
				'jh.sjdw':$('#SJDW').val(),
				'jh.sjpfdw':$('#SJPFDW').val(),
				'jh.pfwh':$('#PFWH').val(),
				'jh.pfsj':$('#PFSJ').datebox('getValue'),
				'jh.pfztz':$('#JHZTZ').val(),
				'jh.jhsybbzje':$('#bbz').val(),
				'jh.jhsydfzczj':$('#DFZC').html(),
				//'jh.jhxdwh':$('#JHXDWH').val(),
				'jh.sfsqablbz':$("input[name='sfsqablbz']:checked").val(),
				'jh.ablbzsqwh':$('#ABLBZWH').val(),
				'jh.remarks':$('#JHRemarks').val(),
				'sc.scqdzh':$('#scqdzh').val(),'sc.sczdzh':$('#sczdzh').val(),
				'sc.sczlc':$('#sczlc').val(),'sc.scyhlc':$('#scyhlc').val(),
				'sc.fapgdw':$('#fapgdw').val(),'sc.fascdw':$('#fascdw').val(),
				'sc.faspsj':$('#faspsj').datebox('getValue'),'sc.spwh':$('#spwh').val(),
				'sc.tzgs':$('#tzgs').val(),'sc.jsxz':$('#jsxz').val(),
				'sc.jsnr':$('#jsnr').val(),'sc.scbz':$('#remarks').val(),
				'sc.sckid':$('#sckid').val(),'jh.sckid':$('#sckid').val()};
	}
	
	$.ajax({
		type:'post',
		url:'../../../jhgl/editAbgcById.do',
		dataType:'json',
		data:jh,
		success:function(data){
			if(data.jh && data.sc){
				alert("修改成功！");
				parent.$('#grid').datagrid('reload');
				if(xmlx=='af')
					parent.searchAbgctj();
				parent.$('#abgc_edit').window('destroy');
				searchAbgc();
			}
		}
	});
}
function downFile1(){
	parent.window.location.href="/jxzhpt/jhgl/downAbgcFile.do?jh.gkbgmc="+'gkbg'+"&jh.id="+$('#jhid').val();
}
function downFile2(){
	parent.window.location.href="/jxzhpt/jhgl/downAbgcFile.do?jh.gkbgmc="+'sjsgt'+"&jh.id="+$('#jhid').val();
}
function openXx(){
	YMLib.UI.createWindow('ql_add','桥梁项目查询','./dzdt_ql.jsp','app_add',630,330);
}
function openEdit(){
	
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
