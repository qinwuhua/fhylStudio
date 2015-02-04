var gridObj;//列表对象
var oldIndex=-1;//之前选中的
var selRow=new Array();//已选择的行号
function querySumAbgc(){
	$.ajax({
		type:'post',
		url:'../../../jhgl/querySumAbgc.do',
		dataType:'json',
		success:function(data){
			$('#lblCount').html(data.id);
			$('#lblZLC').html(data.zlc);
			$('#lblYHLC').html(data.yhlc);
			$('#lblZTZ').html(data.pfztz);
			$('#lblBTZ').html(data.jhsybbzje);
			$('#lblDFTZ').html(data.jhsydfzczj);
		}
	});
}
function abgcxm(jh,lx){
	var params={"jh.sbzt":jh.sbzt,"jh.spzt":jh.spzt,"jh.jhnf":jh.jhnf,"jh.jhkgsj":jh.jhkgsj,
			"jh.jhwgsj":jh.jhwgsj,"jh.pfztz":jh.pfztz,
			"lx.gydw":lx.gydw,"lx.gydwdm":lx.gydwdm,"lx.gydwbm":lx.gydwbm,
			"lx.xzqhmc":lx.xzqhmc,"lx.xzqhdm":lx.xzqhdm,"lx.lxmc":lx.lxmc};
	
	queryParams='&jh.sbzt='+jh.sbzt+'&jh.spzt='+jh.spzt+'&jh.sbnf='+jh.sbnf+'&jh.jhkgsj='+jh.jhkgsj+
		'&jh.jhwgsj='+jh.jhwgsj+'&jh.pfztz='+jh.pfztz+
		'&lx.gydw='+lx.gydw+'&lx.gydwdm='+lx.gydwdm+'&lx.xzqhmc='+lx.xzqhmc+'&lx.xzqhdm='+lx.xzqhdm+'&lx.lxmc='+lx.lxmc;
	
	var grid={id:'grid',url:'../../../jhgl/queryAbgcList.do',pagination:true,rownumbers:false,
	    pageNumber:1,pageSize:10,height:325,width:1000,queryParams:params,
	    columns:[[
	        {field:'ck',checkbox:true},
	        {field:'c',title:'操作',width:150,align:'center',formatter:function(value,row,index){
	        	var result='<a style="text-decoration:none;color:#3399CC;">定位</a>    ';
	        	result+='<a href="javascript:openDialog('+"'abgc_xx','安保工程项目计划详情','../jhkxx/abgc.jsp'"+')" style="text-decoration:none;color:#3399CC;">详细</a>    ';
	        	if(row.jh_sbthcd>0){
	        		result+='<a style="text-decoration:none;">编辑</a>    ';
		        	result+='<a style="text-decoration:none;">删除</a>';
	        	}
	        	else{
	        		result+='<a href="javascript:openDialog('+"'abgc_xx','安保工程项目计划详情','../edit/abgc.jsp'"+')" style="text-decoration:none;color:#3399CC;">编辑</a>    ';
	        		var id="'"+row.id+"'";
		        	result+='<a href="javascript:dropOne('+id+')" style="text-decoration:none;color:#3399CC;">删除</a>';
	        	}
	        	return result;
	        }},
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
	        {field:'c5',title:'资金追加',width:80,align:'center',
	        	formatter:function(value,row,index){
	        		var id="'"+row.id+"'";
	        		if(row.jgzt!='1')
	        			return '<a href="javascript:openZjxd('+"'abgc_xx'"+','+"'资金追加'"+','+"'../zjxd/zjzj.jsp'"+',500,300,'+"'"+row.id+"'"+')" style="text-decoration:none;color:#3399CC;">资金追加</a>';
	        		else
	        			return '资金追加';
	        	}
	        },
	        {field:'jhnf',title:'上报年份',width:80,align:'center'},
	        {field:'jhkgsj',title:'计划开工时间',width:100,align:'center'},
	        {field:'jhwgsj',title:'计划完工时间',width:100,align:'center'},
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
					return row.jckabgc.yhlc;
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
function abgcxm_sb(jh,lx){
	var params={"jh.sbzt":jh.sbzt,"jh.spzt":jh.spzt,"jh.jhnf":jh.jhnf,"jh.jhkgsj":jh.jhkgsj,
			"jh.jhwgsj":jh.jhwgsj,"jh.pfztz":jh.pfztz,"jh.jh_sbthcd":jh.jh_sbthcd,
			"lx.gydw":lx.gydw,"lx.gydwdm":lx.gydwdm,"lx.gydwbm":lx.gydwbm,
			"lx.xzqhmc":lx.xzqhmc,"lx.xzqhdm":lx.xzqhdm,"lx.lxmc":lx.lxmc};
	var grid={id:'grid',url:'../../../jhgl/queryAbgcList.do',pagination:true,rownumbers:false,
	    pageNumber:1,pageSize:10,height:325,width:1070,queryParams:params,
	    columns:[[
	        {field:'ck',checkbox:true},
	        {field:'c',title:'操作',width:150,align:'center',formatter:function(value,row,index){
	        	var result="";
	        	result+='<a style="text-decoration:none;color:#3399CC;">定位</a>    ';
	        	result+='<a href="javascript:openDialog('+"'abgc_sb','安保工程项目计划详情','../jhkxx/abgc.jsp'"+')" style="text-decoration:none;color:#3399CC;">详细</a>    ';
	        	if(row.jh_sbthcd==0){
	        		result+='<a href="javascript:openDialog('+"'abgc_xx','安保工程项目计划详情','../edit/abgc.jsp'"+')" style="text-decoration:none;color:#3399CC;">编辑</a>';
	        	}else{
	        		result+='<a style="text-decoration:none;">编辑</a>';
	        	}
	        	return result;
	        }},
	        {field:'c4',title:'上报状态',width:80,align:'center',formatter:function(value,row,index){
	        	var result="";
				var id="'"+row.id+"'";
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
	        {field:'jhnf',title:'上报年份',width:80,align:'center'},
	        {field:'jhkgsj',title:'计划开工时间',width:100,align:'center'},
	        {field:'jhwgsj',title:'计划完工时间',width:100,align:'center'},
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
					return row.jckabgc.yhlc;
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
function abgcxm_sh(jh,lx){
	var params={"jh.sbzt":jh.sbzt,"jh.spzt":jh.spzt,"jh.jhnf":jh.jhnf,"jh.jhkgsj":jh.jhkgsj,
			"jh.jhwgsj":jh.jhwgsj,"jh.pfztz":jh.pfztz,"jh.jh_sbthcd":jh.jh_sbthcd,
			"lx.gydw":lx.gydw,"lx.gydwdm":lx.gydwdm,"lx.gydwbm":lx.gydwbm,
			"lx.xzqhmc":lx.xzqhmc,"lx.xzqhdm":lx.xzqhdm,"lx.lxmc":lx.lxmc};
	var grid={id:'grid',url:'../../../jhgl/queryAbgcList.do',pagination:true,rownumbers:false,
	    pageNumber:1,pageSize:10,height:325,width:1070,queryParams:params,
	    columns:[[
	        {field:'ck',checkbox:true},
	        {field:'c',title:'操作',width:150,align:'center',formatter:function(value,row,index){
	        	var result="";
	        	result+='<a style="text-decoration:none;color:#3399CC;">定位</a>  ';
	        	result+='<a href="javascript:openDialog('+"'abgc_sh','安保工程项目计划详情','../jhkxx/abgc.jsp'"+')" style="text-decoration:none;color:#3399CC;">详细</a>    ';
	        	if(row.jh_sbthcd==2)
	        		result+='<a href="javascript:openDialog('+"'abgc_xx','安保工程项目计划详情','../edit/abgc.jsp'"+')" style="text-decoration:none;color:#3399CC;">编辑</a>';
	        	else
	        		result+='<a style="text-decoration:none;">编辑</a>';
	        	return result;
	        }},
	        {field:'c4',title:'审批状态',width:80,align:'center',formatter:function(value,row,index){
	        	var result;
				if(row.spzt=='0'){
					var id="'"+row.id+"'";
					result='<a href="javascript:sp('+id+','+row.jh_sbthcd+')" style="text-decoration:none;color:#3399CC;">审批</a>    |    ';
					result+='<a href="javascript:tuihhui('+id+','+row.jh_sbthcd+')" style="text-decoration:none;color:#3399CC;">退回</a>';
				}
				else if(row.spzt=="1"){
					result="已审批";
				}
				return result;
	        }},
	        {field:'sfylsjl',title:'是否有修建记录',width:80,align:'center',formatter:function(value,row,index){
	        	if(row.sfylsjl=='0')
	        		return '无';
	        	else if(row.sfylsjl=='1')
	        		return '有';
	        }},
	        {field:'jhnf',title:'上报年份',width:80,align:'center'},
	        {field:'jhkgsj',title:'计划开工时间',width:100,align:'center'},
	        {field:'jhwgsj',title:'计划完工时间',width:100,align:'center'},
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
					return row.jckabgc.yhlc;
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
function abgcxm_zjxd(jh,lx){
	var params={"jh.sbzt":jh.sbzt,"jh.spzt":jh.spzt,"jh.jhnf":jh.jhnf,"jh.jhkgsj":jh.jhkgsj,
			"jh.jhwgsj":jh.jhwgsj,"jh.pfztz":jh.pfztz,"jh.jh_sbthcd":jh.jh_sbthcd,
			"lx.gydw":lx.gydw,"lx.gydwdm":lx.gydwdm,"lx.gydwbm":lx.gydwbm,
			"lx.xzqhmc":lx.xzqhmc,"lx.xzqhdm":lx.xzqhdm,"lx.lxmc":lx.lxmc};
	var grid={id:'grid',url:'../../../jhgl/queryAbgcList.do',pagination:true,rownumbers:false,
	    pageNumber:1,pageSize:10,height:325,width:1070,queryParams:params,
	    columns:[[
	        {field:'ck',checkbox:true},
	        {field:'c',title:'操作',width:150,align:'center',formatter:function(value,row,index){
	        	var result="";
	        	result+='<a style="text-decoration:none;color:#3399CC;">定位</a>    ';
	        	result+='<a href="javascript:openDialog('+"'zjxd_abgc','安保工程项目计划详情','../jhkxx/abgc.jsp'"+')" style="text-decoration:none;color:#3399CC;">详细</a>';
	        	return result;
	        }},
	        {field:'zjxf',title:'资金下发',width:80,align:'center',formatter:function(value,row,index){
	        	return '<a href="javascript:openDialog('+"'zjxd_abgc','安保工程资金下达','../zjxd/abgc.jsp'"+')" style=" text-decoration:none;color:#3399CC;">资金下发</a>';
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
	        {field:'jhnf',title:'上报年份',width:80,align:'center'},
	        {field:'jhkgsj',title:'计划开工时间',width:100,align:'center'},
	        {field:'jhwgsj',title:'计划完工时间',width:100,align:'center'},
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
					return row.jckabgc.yhlc;
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
	for(var i=0;i<=10;i++){
		years.push({text:(myDate.getFullYear()-i)});
	}
	$('#'+id).combobox({    
	    data:years,
	    valueField:'text',    
	    textField:'text'   
	});
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
		}
	}); 
}
function openAddAbgc(){
	openAdd('abgc_add','添加安保工程项目','../add/abgcAdd.jsp');
}
function dropOne(id){
	if(confirm("确认要删除选中计划？")){
		$.ajax({
			type:'post',
			url:'../../../jhgl/dropAbgcById.do',
			dataType:'text',
			data:'jh.id='+id,
			success:function(data){
				var params={"jh.sbzt":null,"jh.spzt":null,"jh.jhnf":null,"jh.jhkgsj":null,
						"jh.jhwgsj":null,"jh.pfztz":null,
						"lx.gydw":null,"lx.gydwdm":null,"lx.xzqhmc":null,"lx.xzqhdm":null,"lx.lxmc":null};
				if(readLoad=="true"){
					alert("删除成功！");
					gridObj.datagrid("reload",params);
				}
			}
		});
	}
}
function dropAbgcs(id,readLoad){
	if(confirm("确认要删除选中计划？")){
		var sel=gridObj.datagrid("getSelections");
		$.each(sel,function(index,item){
			dropOne(item.id, "false");
		});
		alert("删除成功！");
		var params={"jh.sbzt":null,"jh.spzt":null,"jh.jhnf":null,"jh.jhkgsj":null,
				"jh.jhwgsj":null,"jh.pfztz":null,
				"lx.gydw":null,"lx.gydwdm":null,"lx.xzqhmc":null,"lx.xzqhdm":null,"lx.lxmc":null};
		gridObj.datagrid("reload",params);
	}
}
function editAbgc(){
	var jh={'jh.id':$('#jhid').val(),
			'jh.jhnf':$('#editjhnf').combobox('getValue'),
			'jh.jhkgsj':$('#JHKGSJ').datebox('getValue'),
			'jh.jhwgsj':$('#JHWGSJ').datebox('getValue'),
			'jh.xdsj':$('#JHXDSJ').datebox('getValue'),
			'jh.jhwc_c':$('#JHWC_C').val(),
			'jh.sjdw':$('#SJDW').val(),
			'jh.sjpfdw':$('#SJPFDW').val(),
			'jh.pfwh':$('#PFWH').val(),
			'jh.pfsj':$('#PFSJ').datebox('getValue'),
			'jh.pfztz':$('#JHZTZ').val(),
			'jh.jhsybbzje':$('#bbz').val(),
			'jh.jhsydfzczj':$('#DFZC').val(),
			'jh.jhxdwh':$('#JHXDWH').val(),
			'jh.sfsqablbz':$('#SFSQABLBZ').val(),
			'jh.ablbzsqwh':$('#ABLBZWH').val(),
			'jh.remarks':$('#JHRemarks').val()};
	$.ajax({
		type:'post',
		url:'../../../jhgl/editAbgcById.do',
		dataType:'text',
		data:jh,
		success:function(data){
			alert("修改成功！");
			$('#abgc_xx').dialog('close');
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