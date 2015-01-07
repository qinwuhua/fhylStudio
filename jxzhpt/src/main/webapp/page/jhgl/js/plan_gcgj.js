var gridObj;//列表对象
var oldIndex=-1;//之前选中的
var selRow=new Array();//已选择的行号
/**
 * 工程路面改建列表信息
 * @param jh 计划库条件
 * @param lx 路线条件
 */
function gclmgjxm(jh,lx){
	selectRow={};//每次查询清空选择数据
	var params={"jh.sbzt":jh.sbzt,"jh.spzt":jh.spzt,"jh.sbnf":jh.sbnf,"jh.jhkgsj":jh.jhkgsj,
			"jh.jhwgsj":jh.jhwgsj,"jh.pfztz":jh.pfztz,
			"lx.gydw":lx.gydw,"lx.xzqhmc":lx.xzqhmc,"lx.xzqhdm":lx.xzqhdm,"lx.lxmc":lx.lxmc};
	var grid = {id : 'grid',url : '../../../jhgl/queryGcgjList.do',queryParams:params,pagination : true,rownumbers:false,
		pageNumber : 1,pageSize : 10,height : 325,width:990,
		columns:[[
		    {field:'ck',checkbox:true},
		    {field : 'c',title : '操作',width : 150,align : 'center',
		    	formatter : function(value, row, index) {
		    		var result='<a>定位<a>    ';
		    		result+='<a href="javascript:openDialog('+"'gclmgj_xx','工程改造路面改建项目计划详情','../jhkxx/gclmgj.jsp'"+')" style="text-decoration:none;">详细</a>    ';
		    		result+='编辑    ' + '删除';
		    		return result;
		    	}
		    },
		    {field : 'c4',title : '计划状态',width : 80,align : 'center',
				formatter : function(value, row, index) {
					return '计划状态';
				}
		    },
		    {field : 'c5',title : '资金追加',width : 80,align : 'center',
				formatter : function(value, row, index) {
					return '资金追加';
				}
		    },
		    {field : 'sbnf',title : '上报年份',width : 80,align : 'center'},
		    {field : 'jhkgsj',title : '计划开工时间',width : 100,align : 'center'},
		    {field : 'jhwgsj',title : '计划完工时间',width : 100,align : 'center'},
		    {field : 'gydw',title : '管养单位',width : 150,align : 'center',
		    	formatter : function(value, row, index) {
		    		return row.plan_lx_gcgjs[0].gydw;
		    	}
		    },
		    {field:'xzqhmc',title : '行政区划名称',width : 100,align : 'center',
		    	formatter : function(value, row, index) {
		    		return row.plan_lx_gcgjs[0].xzqhmc;
		    	}
		    },
		    {field : 'lxbm',title : '路线编码',width : 80,align : 'center',
		    	formatter : function(value, row, index) {
		    		return row.plan_lx_gcgjs[0].lxbm;
		    	}
		    },
		    {field : 'lxmc',title : '路线名称',width : 80,align : 'center',
		    	formatter : function(value, row, index) {
		    		return row.plan_lx_gcgjs[0].lxmc;
		    	}
		    },
		    {field : 'qdzh',title : '起点桩号',width : 60,align : 'center',
		    	formatter : function(value, row, index) {
		    		return row.plan_lx_gcgjs[0].qdzh;
		    	}
		    },
		    {field : 'zdzh',title : '止点桩号',width : 60,align : 'center',
		    	formatter : function(value, row, index) {
		    		return row.plan_lx_gcgjs[0].zdzh;
		    	}
		    },
		    {field : 'yhlc',title : '隐患里程',width : 60,align : 'center',
		    	formatter : function(value, row, index) {
		    		return row.plan_lx_gcgjs[0].yhlc;
		    	}
		    },
		    {field:'pfztz',title:'批复总投资(万元)',width:80,align:'center'}
		]]
//		,
//		onSelect:function(rowIndex,rowDate){
//			
//		}
		,
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

function queryGcgjXx(id){
	$.ajax({
		type:'post',
		url:'../../../jhgl/queryGcgjById.do',
		data:"jh.id="+id,
		dataType:'json',
		success:function(data){
			$('#lxmc').html(data.plan_lx_gcgjs[0].lxmc);
			$('#lxbm').html(data.plan_lx_gcgjs[0].lxbm);
			$('#jsdd').html(data.plan_lx_gcgjs[0].jsdd);
			$('#qdzh').html(data.plan_lx_gcgjs[0].qdzh);
			$('#zdzh').html(data.plan_lx_gcgjs[0].zdzh);
			$('#qzlc').html(data.plan_lx_gcgjs[0].qzlc);
			$('#gydwxx').html(data.plan_lx_gcgjs[0].gydw);
			$('#xzqhdm').html(data.plan_lx_gcgjs[0].xzqhdm);
			$('#xzqhmc').html(data.plan_lx_gcgjs[0].xzqhmc);
			$('#yjsdj').html(data.plan_lx_gcgjs[0].yjsdj);
			$('#ylmlx').html(data.plan_lx_gcgjs[0].ylmlx);
			$('#yhlc').html(data.plan_lx_gcgjs[0].yhlc);
			$('#bhnr').html(data.plan_lx_gcgjs[0].bhnr);
			$('#fapgdw').html(data.fapgdw);
			$('#fascdw').html(data.fascdw);
			$('#faspsj').html(data.faspsj);
			$('#spwh').html(data.spwh);
			$('#tzgs').html(data.tzgs);
			$('#jsxz').html(data.jsxz);
			$('#jsnr').html(data.jsnr);
			$('#sbnf').html(data.sbnf);
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
}