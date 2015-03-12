function jckxzqhtj(){
	var jsonDate=new Array();
	$.ajax({
		type:'post',
		url:'../../../tjfx/queryJcktj.do',
		async:false,
		dataType:'json',
		success:function(data){
			for(var i=0;i<data.abgc.length;i++){
				var tr={xzqhdm:null,xzqhmc:null,wqlczj:null,wqxmzj:null,ablczj:null,
						abxmzj:null,zhlczj:null,zhxmzj:null};
				tr.xzqhdm=data.abgc[i].id;
				tr.xzqhmc=data.abgc[i].name;
				tr.wqlczj=data.wqgz[i].parent;
				tr.wqxmzj=data.wqgz[i].text;
				tr.ablczj=data.abgc[i].parent;
				tr.abxmzj=data.abgc[i].text;
				tr.zhlczj=data.zhfz[i].parent;
				tr.zhxmzj=data.zhfz[i].text;
				jsonDate.push(tr);
			}
			var grid={id:'grid',data:jsonDate,fitColumns:true,singleSelect:true,pagination:false,rownumbers:false,
					pageNumber:1,pageSize:20,height:355,width:970,
				    columns:[
					    [
					     	{field:'xzqhmc',title:'行政区划',width:100,align:'center',rowspan:2},
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
	});
}
function queryBar(){
	barChart_1= new AnyChart("/jxzhpt/widget/anyChart/swf/AnyChart.swf");    
    barChart_1.width =980;
    barChart_1.height =300;
    barChart_1.padding =0;
    barChart_1.wMode="transparent";
    barChart_1.write("anychart_div");
    $.ajax({
		type:"post",
		url:"../../../tjfx/queryJcktj1.do?xmlx="+$('#selxmlx').val(),
		dataType:'text',
		success:function(msg){
			//var right=window.parent.window.document.getElementById("rightContent").contentWindow;
			barChart_1.setData(msg);
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