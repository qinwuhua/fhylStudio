function jhtjBb(){
	var jsonDate=new Array();
	$.ajax({
		type:'post',
		url:'/jxzhpt/dbbb/jhtjBb.do',
		async:false,
		dataType:'json',
		success:function(data){
			var jxwqlczj=0,jxwqxmzj=0,jxablczj=0,jxabxmzj=0,jxzhlczj=0,jxzhxmzj=0;
			for(var i=0;i<data.abgc.length;i++){
				var tr={xzqhdm:null,xzqhmc:null,wqlczj:null,wqxmzj:null,ablczj:null,
						abxmzj:null,zhlczj:null,zhxmzj:null};
				tr.xzqhdm=data.abgc[i].id;
				tr.xzqhmc=data.abgc[i].name;
				
				tr.wqlczj=data.wqgz[i].parent;
				jxwqlczj=Number(jxwqlczj)+Number(tr.wqlczj);
				tr.wqxmzj=data.wqgz[i].text;
				jxwqxmzj=Number(jxwqxmzj)+Number(tr.wqxmzj);
				
				tr.ablczj=data.abgc[i].parent;
				jxablczj=Number(jxablczj)+Number(tr.ablczj);
				tr.abxmzj=data.abgc[i].text;
				jxabxmzj=Number(jxabxmzj)+Number(tr.abxmzj);
				
				tr.zhlczj=data.zhfz[i].parent;
				jxzhlczj=Number(jxzhlczj)+Number(tr.zhlczj);
				tr.zhxmzj=data.zhfz[i].text;
				jxzhxmzj=Number(jxzhxmzj)+Number(tr.zhxmzj);
				jsonDate.push(tr);
			}
			jsonDate[0].wqlczj=jxwqlczj;
			jsonDate[0].wqxmzj=jxwqxmzj;
			jsonDate[0].ablczj=jxablczj;
			jsonDate[0].abxmzj=jxabxmzj;
			jsonDate[0].zhlczj=jxzhlczj;
			jsonDate[0].zhxmzj=jxzhxmzj;
			var grid={id:'grid',data:jsonDate,fitColumns:true,singleSelect:true,pagination:false,rownumbers:false,
					pageNumber:1,pageSize:20,height:$(window).height()-140,width:$(window).width()-25,
				    columns:[
					    [
					     	{field:'xzqhmc',title:'行政区划',width:100,align:'center',rowspan:3},
					     	{title:'危桥改造',colspan:6},
					     	{title:'安保工程',colspan:6},
					     	{title:'灾害防治',colspan:6},
					     	{title:'总计',colspan:3},
					    ],
					    [
					     	{title:'公路局',colspan:2},
					     	{title:'交通局',colspan:2},
					     	{title:'小计',colspan:2},
					     	{title:'公路局',colspan:2},
					     	{title:'交通局',colspan:2},
					     	{title:'小计',colspan:2},
					     	{title:'公路局',colspan:2},
					     	{title:'交通局',colspan:2},
					     	{title:'小计',colspan:2},
					     	{title:'公路局'},
					     	{title:'交通局'},
					     	{title:'小计'}
					     ],
					    [
					     	{field:'wqlczj',title:'危桥长度总计(米)',width:100,align:'center',rowspan:1},
					     	{field:'wqxmzj',title:'危桥数量总计',width:100,align:'center',rowspan:1},
					     	{field:'ablczj',title:'隐患里程总计(公里)',width:100,align:'center',rowspan:1},
					     	{field:'abxmzj',title:'项目数量总计',width:100,align:'center',rowspan:1},
					     	{field:'zhlczj',title:'隐患里程总计(公里)',width:100,align:'center',rowspan:1},
					     	{field:'zhxmzj',title:'项目数量总计',width:100,align:'center',rowspan:1},
					    ]
				    ],
				};
			gridBind(grid);
		}
	});
}

/**
 * dataGrid绑定数据方法
 * @param grid 为dataGrid配置的JSON对象
 * id：table的id
 * url：数据路径
 * fitColumns：自适应列宽
 * singleSelect：是否只允许选择一行
 * striped：斑马线效果
 * pagination：是否显示分页工具栏
 * rownumbers：是否显示行号
 * pageNumber：初始化页码
 * pageSize：初始化页面大小
 * height:初始化高度
 * columns：数据
 */
function gridBind(grid){
	$('#'+grid.id).datagrid({
	    url:grid.url,
	    data:grid.data,
	    queryParams:grid.queryParams,
	    fitColumns:grid.fitColumns,
	    singleSelect:grid.singleSelect,
	    striped:grid.striped,
	    pagination:grid.pagination,
	    rownumbers:grid.rownumbers,
	    pageNumber:grid.pageNumber,
	    pageSize:grid.pageSize,
	    height:grid.height,
	    width:grid.width,
	    columns:grid.columns,
	    onSelect:grid.onSelect,
	    onLoadSuccess:grid.onLoadSuccess
	});
}