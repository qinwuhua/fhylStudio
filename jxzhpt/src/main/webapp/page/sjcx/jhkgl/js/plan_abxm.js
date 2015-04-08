var gridObj;//列表对象
var oldIndex=-1;//之前选中的
var selRow=new Array();//已选择的行号
function querySumAbgc(jh,lx){
	var param={'lx.gydwbm':lx.gydwbm,'jh.sbzt':jh.sbzt,
			'jh.spzt':jh.spzt,'jh.jh_sbthcd':jh.jh_sbthcd,"jh.jhnf":jh.jhnf};
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
			}
		}
	});
}
function abgcxm(jh,lx){
	var params={"jh.sbzt":jh.sbzt,"jh.spzt":jh.spzt,"jh.jhnf":jh.jhnf,"jh.jhkgsj":jh.jhkgsj,
			"jh.jhwgsj":jh.jhwgsj,"jh.pfztz":jh.pfztz,
			"lx.gydw":lx.gydw,"lx.gydwdm":lx.gydwdm,"lx.gydwbm":lx.gydwbm,
			"lx.xzqhmc":lx.xzqhmc,"lx.xzqhdm":lx.xzqhdm,"lx.lxmc":lx.lxmc,
			'lx.tsdq':lx.tsdq,'jh.jh_sbthcd':jh.jh_sbthcd};
	
	queryParams='&jh.sbzt='+jh.sbzt+'&jh.spzt='+jh.spzt+'&jh.sbnf='+jh.sbnf+'&jh.jhkgsj='+jh.jhkgsj+
		'&jh.jhwgsj='+jh.jhwgsj+'&jh.pfztz='+jh.pfztz+
		'&lx.gydw='+lx.gydw+'&lx.gydwdm='+lx.gydwdm+'&lx.xzqhmc='+lx.xzqhmc+'&lx.xzqhdm='+lx.xzqhdm+'&lx.lxmc='+lx.lxmc;
	
	var grid={id:'grid',url:'../../../jhgl/queryAbgcList.do',pagination:true,rownumbers:false,
	    pageNumber:1,pageSize:10,height:$(window).height()-180,width:$(window).width()-10,queryParams:params,
	    columns:[[
	        {field:'ck',checkbox:true},
	        {field:'c',title:'操作',width:120,align:'center',formatter:function(value,row,index){
	        	var result='<a href=javascript:locationXm("'+row.lxbm+'") style="text-decoration:none;color:#3399CC;">定位</a>    ';
	        	result+='<a href="javascript:openDialog('+"'abgc_xx','安保工程项目计划详情','../jhkxx/abgc.jsp'"+')" style="text-decoration:none;color:#3399CC;">详细</a>    ';
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
//	        {field:'c5',title:'资金追加',width:80,align:'center',
//	        	formatter:function(value,row,index){
//	        		var id="'"+row.id+"'";
//	        		if(row.jgzt!='1')
//	        			return '<a href="javascript:openZjxd('+"'abgc_xx'"+','+"'资金追加'"+','+"'../zjxd/zjzj.jsp'"+',500,300,'+"'"+row.id+"'"+')" style="text-decoration:none;color:#3399CC;">资金追加</a>';
//	        		else
//	        			return '资金追加';
//	        	}
//	        },
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
