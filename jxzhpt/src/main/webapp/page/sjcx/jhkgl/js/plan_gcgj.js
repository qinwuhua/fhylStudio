var gridObj;//列表对象
var oldIndex=-1;//之前选中的
var selRow=new Array();//已选择的行号
function querySumGcgj(jh,lx){
	var param={"jh.sbzt":jh.sbzt,"jh.spzt":jh.spzt,"jh.sbnf":jh.sbnf,'jh.jh_sbthcd':jh.jh_sbthcd,'jh.sfylsjl':jh.sfylsjl,
			"lx.gydwdm":lx.gydwdm,"lx.xzqhdm":lx.xzqhdm,"lx.lxmc":lx.lxmc,'lx.yjsdj':lx.yjsdj,
			'lx.tsdqbm':lx.tsdqbm};
	$.ajax({
		type:'post',
		url:'/jxzhpt/jhgl/querySumGcgj.do',
		data:param,
		dataType:'json',
		success:function(data){
			if(data.id>0){
				$('#lblCount').html(data.id);
				$('#lblZLC').html(data.plan_lx_gcgjs[0].qzlc);
				$('#lblYHLC').html(data.plan_lx_gcgjs[0].yhlc);
				$('#lblZTZ').html(data.pfztz);
				$('#lblBTZ').html(data.jhsybzje);
				$('#lblDFTZ').html(data.jhsydfzcje);
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
	var params={"jh.sbzt":jh.sbzt,"jh.spzt":jh.spzt,"jh.sbnf":jh.sbnf,'jh.jh_sbthcd':jh.jh_sbthcd,'jh.sfylsjl':jh.sfylsjl,
			"lx.gydwdm":lx.gydwdm,"lx.xzqhdm":lx.xzqhdm,"lx.lxmc":lx.lxmc,'lx.yjsdj':lx.yjsdj,
			'lx.tsdqbm':lx.tsdqbm};
	var grid = {id:'grid',url : '/jxzhpt/jhgl/queryGcgjList.do',queryParams:params,
			pagination:true,rownumbers:false,
			pageNumber:1,pageSize:10,height:$(window).height()-180,width:$('#searchField').width(),
		columns:[[
		    {field : 'c',title : '操作',width : 150,align : 'center',
		    	formatter : function(value, row, index) {
		    		var result='<a style="text-decoration:none;color:#3399CC;">定位<a>    ';
		    		result+='<a href="javascript:openWindow('+"'"+row.id+"'"+')" style="text-decoration:none;color:#3399CC;">详细</a>    ';
		    		return result;
		    	}
		    },
		    {field : 'c4',title : '计划状态',width : 80,align : 'center',
				formatter : function(value, row, index) {
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
				}
		    },
		    {field:'xmmc',title : '项目名称',width : 110,align : 'center'},
		    {field : 'sbnf',title : '上报年份',width : 80,align : 'center'},
		    {field : 'jhkgsj',title : '计划开工时间',width : 110,align : 'center'},
		    {field : 'jhwgsj',title : '计划完工时间',width : 110,align : 'center'},
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
    			    {field:'gydw',title:'管养单位',width:200,align:'center'},    
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
function openWindow(id){
	YMLib.Var.jhbm=id;
	YMLib.UI.createWindow('gclmgj_xx','工程改造路面改建项目计划详情',"/jxzhpt/page/jhgl/jhkxx/gclmgj.jsp",'gclmgj_xx',1000,500);
}
