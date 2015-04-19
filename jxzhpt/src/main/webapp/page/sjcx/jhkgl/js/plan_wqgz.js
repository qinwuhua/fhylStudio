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
			if(data.id>0){
				$('#lblCount').html(data.id);
				if(data.pfztz!=null && data.pfztz!="")
					$('#lblZTZ').html(data.pfztz);
				if(data.jhsybzje!=null && data.jhsybzje!="")
					$('#lblBTZ').html(data.jhsybzje);
				if(data.jhsydfzcje!=null && data.jhsydfzcje!="")
					$('#lblDFTZ').html(data.jhsydfzcje);
			}else{
				$('#lblCount').html("0");
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
function wqxm(jh,lx){
	var params={"jh.sbzt":jh.sbzt,"jh.spzt":jh.spzt,"jh.sbnf":jh.sbnf,"jh.jhkgsj":jh.jhkgsj,
			"jh.jhwgsj":jh.jhwgsj,"jh.pfztz":jh.pfztz,
			"lx.gydw":lx.gydw,"lx.gydwdm":lx.gydwdm,"lx.xzqhmc":lx.xzqhmc,"lx.xzqhdm":lx.xzqhdm,"lx.lxmc":lx.lxmc,
			"lx.qlmc":lx.qlmc,"lx.akjfl":lx.akjfl,'jh.jh_sbthcd':jh.jh_sbthcd};
	var grid={id:'grid',url:'../../../jhgl/queryWqgzList.do',pagination:true,rownumbers:false,
		    pageNumber:1,pageSize:10,height:$(window).height()-180,width:$(window).width()-10,queryParams:params,
		    columns:[[
		        {field:'ck',checkbox:true},
		        {field:'c',title:'操作',width:100,align:'center',formatter:function(value,row,index){
		        	var result='<a href=javascript:locationXm("'+row.qlbh+'","'+row.akjfl+'")  style="text-decoration:none;color:#3399CC;">定位</a>    ';
		        	result+='<a href="javascript:openDialog('+"'wqgz_xx','危桥改造项目计划详情','../jhkxx/wqgz.jsp'"+')" style="text-decoration:none;color:#3399CC;">详细</a>    ';     	
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

function queryWqgzById(id){
	
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
