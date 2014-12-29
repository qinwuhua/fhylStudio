//------------------------------基础库
function jckxzqhtj(){
	var grid={id:'grid',url:'../js/jckxzqh.json',fitColumns:true,singleSelect:true,pagination:false,rownumbers:false,
			pageNumber:1,pageSize:20,height:355,width:970,
		    columns:[
			    [
			     	{field:'xzqh',title:'行政区划',width:100,align:'center',rowspan:2},
			     	{title:'危桥改造',colspan:2},
			     	{title:'安保工程',colspan:2},
			     	{title:'灾害防治',colspan:2},
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
		    onSelect:function(){
		    	window.location.href='../jcktj/xmlxtj.jsp';
		    }
		};
	gridBind(grid);
}
function jckxmlxtj(){
	var colYears =[],colZj=[];
	for (var i=$('#startYear').val();i<=$('#endYear').val();i++){
		var year ={title:i+'年',width:160,align:'center',colspan:2};
		var lczj={field:i+'lczj',title:'规模(米/公里)',width:80,align:'center'};
		colZj.push(lczj);
		var xmzj={field:i+'xmzj',title:'项目总计',width:80,align:'center'};
		colZj.push(xmzj);
		colYears.push(year);
	}
	var zjtitle={title:'各年份项目路程和数量统计',colspan:colYears.length*2,width:800};
	var grid={id:'grid',url:'../js/jckxmlxtj.json',fitColumns:false,singleSelect:true,pagination:false,rownumbers:false,
			pageNumber:1,pageSize:20,height:155,width:970,
		    columns:[
			    [
			     	{field:'xmlx',title:'项目类型',width:80,align:'center',rowspan:3,fixed:true},
			     	zjtitle
			    ],
			    colYears,colZj
		    ],
		    onSelect:function(){
		    	window.location.href='../jcktj/xmxxlb.jsp';
		    }
		};
	gridBind(grid);
}
//-----------------------计划库
function xzqhtj(){
	var grid={id:'grid',url:'../js/xzqhtj.json',fitColumns:false,singleSelect:true,pagination:false,rownumbers:false,
			pageNumber:1,pageSize:20,height:373,width:970,
		    columns:[
			    [
			     	{field:'xzqh',title:'行政区划',width:100,align:'center',rowspan:2},
			     	{title:'合计',colspan:2},
			     	{title:'路面升级',colspan:2},
			     	{title:'路面改建',colspan:2},
			     	{title:'水毁项目',colspan:2},
			     	{title:'养护大中修',colspan:2},
			     	{title:'危桥改造',colspan:2},
			     	{title:'安保工程',colspan:2},
			     	{title:'灾害防治',colspan:2}
			    ],
			    [
			     	{field:'ztz',title:'总投资(万元)',width:100,align:'center',rowspan:1},
			     	{field:'sl',title:'数量',width:60,align:'center',rowspan:1},
			     	{field:'lmsjztz',title:'总投资(万元)',width:100,align:'center',rowspan:1},
			     	{field:'lmsjsl',title:'数量',width:60,align:'center',rowspan:1},
			     	{field:'lmgjztz',title:'总投资(万元)',width:100,align:'center',rowspan:1},
			     	{field:'lmgjsl',title:'数量',width:60,align:'center',rowspan:1},
			     	{field:'shztz',title:'总投资(万元)',width:100,align:'center',rowspan:1},
			     	{field:'shsl',title:'数量',width:60,align:'center',rowspan:1},
			     	{field:'yhdzxztz',title:'总投资(万元)',width:100,align:'center',rowspan:1},
			     	{field:'yhdzxsl',title:'数量',width:60,align:'center',rowspan:1},
			     	{field:'wqgzztz',title:'总投资(万元)',width:100,align:'center',rowspan:1},
			     	{field:'wqgzsl',title:'数量',width:60,align:'center',rowspan:1},
			     	{field:'abgcztz',title:'总投资(万元)',width:100,align:'center',rowspan:1},
			     	{field:'abgcsl',title:'数量',width:60,align:'center',rowspan:1},
			     	{field:'zhfzztz',title:'总投资(万元)',width:100,align:'center',rowspan:1},
			     	{field:'zhfzsl',title:'数量',width:60,align:'center',rowspan:1},
			    ]
		    ]
		};
	gridBind(grid);
}

function xmlxtj(){
	var grid={id:'grid',url:'../js/xmlxtj.json',fitColumns:true,singleSelect:true,pagination:false,rownumbers:false,
			pageNumber:1,pageSize:20,height:255,width:970,
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
		    	window.location.href='../jhktj/xmxxlb.jsp';
		    }
		};
	gridBind(grid);
}
//------------------------项目趋势统计
function xzqhtjqsfx(){
	var colYears =[],colZj=[];
	for (var i=$('#startYear').val();i<=$('#endYear').val();i++){
		var year ={title:i+'年',width:160,align:'center',colspan:2};
		var lczj={field:i+'je',title:'金额总计(万元)',width:90,align:'center'};
		colZj.push(lczj);
		var xmzj={field:i+'xmzj',title:'项目总计(个)',width:80,align:'center'};
		colZj.push(xmzj);
		colYears.push(year);
	}
	var zjtitle={title:'各年份项目金额和数量统计',colspan:colYears.length*2,width:800};
	var grid={id:'grid',url:'../js/qstj.json',fitColumns:false,singleSelect:true,pagination:false,rownumbers:false,
			pageNumber:1,pageSize:20,height:380,width:970,
		    columns:[
			    [
			     	{field:'xzqh',title:'行政区划',width:80,align:'center',rowspan:3,fixed:true},
			     	zjtitle
			    ],
			    colYears,colZj
		    ]
	};
	gridBind(grid);
}

function jhklxQsSearch(){
	xzqhtjqsfx();
}

function xmlxqstj(){
	var colTitle =[],colZj=[];
	colTitle.push({field:'xmlx',title:'项目类型',width:100,align:'center',rowspan:2});
	for (var i=$('#startYear').val();i<=$('#endYear').val();i++){
		var year ={title:i+'年',width:160,align:'center',colspan:3,rowspan:1};
		var lczj={field:i+'je',title:'总投资(万元)',width:90,align:'center'};
		colZj.push(lczj);
		var xmzj={field:i+'xmzj',title:'项目总计(个)',width:80,align:'center'};
		colZj.push(xmzj);
		var gm = {field:i+'gm',title:'规模(公里/米)',width:100,align:'center'};
		colZj.push(gm);
		colTitle.push(year);
	}
	var grid={id:'grid',url:'../js/xmlxqstj.json',fitColumns:false,singleSelect:true,pagination:false,rownumbers:false,
			pageNumber:1,pageSize:20,height:255,width:970,
		    columns:[
			    colTitle,colZj
		    ]
	};
	gridBind(grid);
}
function xmlxQsSearch(){
	xmlxqstj();
}
//--------------------------------工程库
function gckxzqhtj(){
	var grid={id:'grid',url:'../js/gckxzqhtj.json',fitColumns:false,singleSelect:true,pagination:false,rownumbers:false,
			pageNumber:1,pageSize:20,height:372,width:970,
		    columns:[
			    [
			     	{field:'xzqh',title:'行政区划',width:100,align:'center',rowspan:2},
			     	{title:'合计',colspan:3},
			     	{title:'未开工项目',colspan:3},
			     	{title:'在建项目',colspan:3},
			     	{title:'竣工项目',colspan:3}
			    ],
			    [
			     	{field:'ztz',title:'总投资(万元)',width:100,align:'center',rowspan:1},
			     	{field:'wctz',title:'完成投资(万元)',width:100,align:'center',rowspan:1},
			     	{field:'sl',title:'数量',width:100,align:'center',rowspan:1},
			     	{field:'wkgztz',title:'总投资(万元)',width:100,align:'center',rowspan:1},
			     	{field:'wkgwctz',title:'完成投资(万元)',width:100,align:'center',rowspan:1},
			     	{field:'wkgsl',title:'数量',width:100,align:'center',rowspan:1},
			     	{field:'zjztz',title:'总投资(万元)',width:100,align:'center',rowspan:1},
			     	{field:'zjwctz',title:'完成投资(万元)',width:100,align:'center',rowspan:1},
			     	{field:'zjsl',title:'数量',width:100,align:'center',rowspan:1},
			     	{field:'jgztz',title:'总投资(万元)',width:100,align:'center',rowspan:1},
			     	{field:'jgwctz',title:'完成投资(万元)',width:100,align:'center',rowspan:1},
			     	{field:'jgsl',title:'数量',width:100,align:'center',rowspan:1}
			    ]
		    ],
		    onSelect:function(){
		    	window.location.href='../gcktj/xmlxtj.jsp';
		    }
		};
	gridBind(grid);
}
function gckxmlxtj(){
	var grid={id:'grid',url:'../js/xmlxtj.json',fitColumns:true,singleSelect:true,pagination:false,rownumbers:false,
			pageNumber:1,pageSize:20,height:255,width:970,
		    columns:[
			    [
			     	{field:'xmlx',title:'项目类型',width:100,align:'center',rowspan:2},
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
		    	window.location.href='../gcktj/xmxxlb.jsp';
		    }
		};
	gridBind(grid);
}

//-------------------------
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
				     		return '<a href="javascript:openDialog('+"'xmxx_xx','危桥改造项目计划详情','../../jhgl/jhkxx/wqgz.jsp'"+')" style="text-decoration:none;">详细</a>';
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

//-------------------------------------------------查询单击事件
function jhkxmlxSearch(){
	jckxmlxtj();
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