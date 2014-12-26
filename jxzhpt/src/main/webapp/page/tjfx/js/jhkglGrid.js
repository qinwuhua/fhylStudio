function xzqhtj(){
	var grid={id:'grid',url:'../js/xzqhtj.json',fitColumns:true,singleSelect:true,pagination:false,rownumbers:false,
			pageNumber:1,pageSize:20,height:353,
		    columns:[
			    [
			     	{field:'xzqh',title:'行政区划',width:100,align:'center',rowspan:2},
			     	{title:'合计',colspan:2},
			     	{title:'当年项目',colspan:2},
			     	{title:'历史项目',colspan:2},
			    ],
			    [
			     	{field:'ztz',title:'总投资(万元)',width:100,align:'center',rowspan:1},
			     	{field:'sl',title:'数量',width:100,align:'center',rowspan:1},
			     	{field:'dnztz',title:'总投资(万元)',width:100,align:'center',rowspan:1},
			     	{field:'dnsl',title:'数量',width:100,align:'center',rowspan:1},
			     	{field:'lsztz',title:'总投资(万元)',width:100,align:'center',rowspan:1},
			     	{field:'lssl',title:'数量',width:100,align:'center',rowspan:1},
			    ]
		    ],
		    onSelect:function(){
		    	window.location.href='../xmlxtj/xmlxtj.jsp';
		    }
		};
	gridBind(grid);
}

function xmlxtj(){
	var grid={id:'grid',url:'../js/xmlxtj.json',fitColumns:true,singleSelect:true,pagination:false,rownumbers:false,
			pageNumber:1,pageSize:20,height:255,
		    columns:[
			    [
			     	{field:'xmlx',title:'行政区划',width:100,align:'center',rowspan:2},
			     	{title:'合计',colspan:2},
			     	{title:'未开工项目合计',colspan:2},
			     	{title:'在建项目合计',colspan:2},
			     	{title:'竣工项目合计',colspan:2}
			    ],
			    [
			     	{field:'ztz',title:'总投资(万元)',width:100,align:'center',rowspan:1},
			     	{field:'sl',title:'数量',width:100,align:'center',rowspan:1},
			     	{field:'wkgztz',title:'总投资(万元)',width:100,align:'center',rowspan:1},
			     	{field:'wkgsl',title:'数量',width:100,align:'center',rowspan:1},
			     	{field:'zjztz',title:'总投资(万元)',width:100,align:'center',rowspan:1},
			     	{field:'zjsl',title:'数量',width:100,align:'center',rowspan:1},
			     	{field:'jgztz',title:'总投资(万元)',width:100,align:'center',rowspan:1},
			     	{field:'jgsl',title:'数量',width:100,align:'center',rowspan:1}
			    ]
		    ],
		    onSelect:function(){
		    	window.location.href='../xmlxtj/xmxxlb.jsp';
		    }
		};
	gridBind(grid);
}

function xmxxlb(type){
	var grid;
	if(type=="桥梁"){
		grid={id:'xmgrid',url:'../js/qllb.json',fitColumns:false,singleSelect:true,pagination:true,rownumbers:false,
				pageNumber:1,pageSize:10,height:308,width:570,
			    columns:[
				    [
				     	{field:'gydw',title:'管养单位',width:120,align:'center'},
				     	{field:'qlmc',title:'桥梁名称',width:100,align:'center'},
				     	{field:'qlbm',title:'桥梁编码',width:100,align:'center'},
				     	{field:'pfje',title:'批复金额',width:60,align:'center'},
				     	{field:'jhnf',title:'计划年份',width:60,align:'center'},
				     	{field:'xmjz',title:'项目进展',width:60,align:'center'},
				     	{field:'c1',title:'查看详细',width:60,align:'center',formatter:function(value,row,index){
				     		return '<a href="javascript:xmlbxx()" style="text-decoration:none;">详细</a>';
				     	}}
				    ]
			    ],
			    onSelect:function(){
			    	alert("在地图上标注对应项目地点！");
			    }
			};
	}
	else{
		grid={id:'xmgrid',url:'../js/xmlb.json',fitColumns:false,singleSelect:true,pagination:true,rownumbers:false,
				pageNumber:1,pageSize:10,height:308,width:570,
			    columns:[
				    [
				     	{field:'gydw',title:'管养单位',width:120,align:'center'},
				     	{field:'lxmc',title:'路线名称',width:100,align:'center'},
				     	{field:'lxbm',title:'路线编码',width:100,align:'center'},
				     	{field:'pfje',title:'批复金额',width:60,align:'center'},
				     	{field:'jhnf',title:'计划年份',width:60,align:'center'},
				     	{field:'xmjz',title:'项目进展',width:60,align:'center'},
				     	{field:'c1',title:'查看详细',width:60,align:'center',formatter:function(value,row,index){
				     		return '<a href="javascript:xmlbxx()" style="text-decoration:none;">详细</a>';
				     	}}
				    ]
			    ],
			    onSelect:function(){
			    	alert("在地图上标注对应项目地点！");
			    }
			};
	}
	gridBind(grid);
}

function xmlbxx(){
	alert("弹出详细信息窗口！");
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
	    onSelect:grid.onSelect
	});
}