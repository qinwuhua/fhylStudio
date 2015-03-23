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
				    	//window.location.href='../jcktj/xmlxtj.jsp';
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
function jhkxzqhtj(){
	$.ajax({
		type:'post',
		url:'../../../tjfx/queryJhktj.do?nf='+$('#startYear').val(),
		async:false,
		dataType:'json',
		success:function(data){
			var jsonData=new Array();
			for(var i=0;i<data.gcsj.length;i++){
				var t={'xzqh':null,'xzqhdm':null,'ztz':null,'sl':null,'lmsjztz':null,'lmsjsl':null,
						'lmgjztz':null,'lmgjsl':null,'shztz':null,'shsl':null,
						'yhdzxztz':null,'yhdzxsl':null,'wqgzztz':null,'wqgzsl':null,
						'abgcztz':null,'abgcsl':null,'zhfzztz':null,'zhfzsl':null};
				t.xzqh=data.gcsj[i].name;
				t.xzqhdm=data.gcsj[i].id;
				t.ztz=parseFloat(data.gcsj[i].text)+parseFloat(data.gcgj[i].text)+
						parseFloat(data.shuih[i].text)+parseFloat(data.yhdzx[i].text)+
						parseFloat(data.abgc[i].text)+parseFloat(data.wqgz[i].text)+
						parseFloat(data.zhfz[i].text);
				t.sl=parseInt(data.gcsj[i].parent)+parseInt(data.gcgj[i].parent)+
						parseInt(data.shuih[i].parent)+parseInt(data.yhdzx[i].parent)+
						parseInt(data.abgc[i].parent)+parseInt(data.wqgz[i].parent)+
						parseInt(data.zhfz[i].parent);
				t.lmsjztz=data.gcsj[i].text;
				t.lmsjsl=data.gcsj[i].parent;
				t.lmgjztz=data.gcgj[i].text;
				t.lmgjsl=data.gcgj[i].parent;
				t.shztz=data.shuih[i].text;
				t.shsl=data.shuih[i].parent;
				t.yhdzxztz=data.yhdzx[i].text;
				t.yhdzxsl=data.yhdzx[i].parent;
				t.wqgzztz=data.wqgz[i].text;
				t.wqgzsl=data.wqgz[i].parent;
				t.abgcztz=data.abgc[i].text;
				t.abgcsl=data.abgc[i].parent;
				t.zhfzztz=data.zhfz[i].text;
				t.zhfzsl=data.zhfz[i].parent;
				jsonData.push(t);
			}
			var grid={id:'grid',data:jsonData,fitColumns:false,singleSelect:true,pagination:false,rownumbers:false,
					pageNumber:1,pageSize:20,height:373,width:$('#grid').width(),
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
				    ],
				    onSelect:function(rowIndex,rowData){
				    	//window.location.href='../jhktj/xmlxtj.jsp?xzqhdm='+rowData.xzqhdm+'&xzqh='+rowData.xzqh;
				    }
				};
			gridBind(grid);
		}
	});
}
function queryjhkBar(){
	barChart_1= new AnyChart("/jxzhpt/widget/anyChart/swf/AnyChart.swf");    
    barChart_1.width =980;
    barChart_1.height =300;
    barChart_1.padding =0;
    barChart_1.wMode="transparent";
    barChart_1.write("anychart_div");
    $.ajax({
		type:"post",
		url:"../../../tjfx/queryJhktjt.do?nf="+$('#startYear').val(),
		dataType:'text',
		success:function(msg){
			//var right=window.parent.window.document.getElementById("rightContent").contentWindow;
			barChart_1.setData(msg);
		}
	});
}
function gckxzqhtj(data){
	var grid={id:'grid',data:data,fitColumns:false,singleSelect:true,pagination:false,rownumbers:false,
			pageNumber:1,pageSize:20,height:372,width:$('#grid').width(),
		    columns:[
			    [
			     	{field:'xzqh',title:'行政区划',width:100,align:'center',rowspan:2},
			     	{title:'合计',colspan:3},
			     	{title:'未开工项目',colspan:2},
			     	{title:'在建项目',colspan:3},
			     	{title:'竣工项目',colspan:3}
			    ],
			    [
			     	{field:'ztz',title:'总投资(万元)',width:100,align:'center',rowspan:1},
			     	{field:'wctz',title:'完成投资(万元)',width:100,align:'center',rowspan:1},
			     	{field:'sl',title:'数量',width:100,align:'center',rowspan:1},
			     	{field:'wkgztz',title:'总投资(万元)',width:100,align:'center',rowspan:1},
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
function gckxmlxtj(data){
	var grid={id:'grid',data:data,fitColumns:true,singleSelect:true,pagination:false,rownumbers:false,
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
		    onSelect:function(rowIndex, rowData){
		    	window.location.href='../gcktj/xmxxlb.jsp?xmlx='+rowIndex;
		    }
		};
	gridBind(grid);
}
function xmxxlist(url,columns){
	var xzqhdm=$.cookie("unit").substring(5);
	if(xzqhdm=="360000")
		xzqhdm=xzqhdm.substring(0,2)+"____";
	else
		xzqhdm=xzqhdm.substring(0,4)+"__";
	queryParams={"jh.sbzt":'1',"jh.spzt":'1',
			"jh.jh_sbthcd":6,"lx.xzqhdm":xzqhdm};
	var grid={id:'grid',url:url,fitColumns:false,singleSelect:true,pagination:true,rownumbers:false,
			pageNumber:1,pageSize:10,height:255,width:565,queryParams:queryParams,
		    columns:columns,
		    onSelect:null
		};
	gridBind(grid);
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
	    onSelect:grid.onSelect
	});
}