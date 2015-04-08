var gridObj;//列表对象
var oldIndex=-1;//之前选中的
var selRow=new Array();//已选择的行号
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
		pageNumber : 1,pageSize : 10,height:$(window).height()-180,width:$(window).width()-10,
		columns:[[
		    {field:'ck',checkbox:true},
		    {field : 'c',title : '操作',width : 100,align : 'center',
		    	formatter : function(value, row, index) {
		    		var result='<a href=javascript:locationXm("'+row.lxbm+'") style="text-decoration:none;color:#3399CC;">定位<a>    ';
		    		result+='<a href="javascript:openDialog('+"'gclmgj_xx','工程改造路面改建项目计划详情','../jhkxx/gclmgj.jsp'"+')" style="text-decoration:none;color:#3399CC;">详细</a>    ';
		    		var id="'"+row.id+"'";  		
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
		    {field:'xmmc',title : '项目名称',width : 80,align : 'center'},
		    {field : 'sbnf',title : '上报年份',width : 80,align : 'center'},
		    {field : 'jhkgsj',title : '计划开工时间',width : 100,align : 'center'},
		    {field : 'jhwgsj',title : '计划完工时间',width : 100,align : 'center'},
		    {field:'pfztz',title:'批复总投资(万元)',width:100,align:'center'},
		    {field:'jhsybzje',title:'部补助金额(万元)',width:100,align:'center'},
		    {field:'jhsydfzcje',title:'地方自筹金额(万元)',width:100,align:'center'}
		]],
	
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
