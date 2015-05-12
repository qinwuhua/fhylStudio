function jckxzqhtj(){
	var jsonDate=new Array();
	$.ajax({
		type:'post',
		url:'../../../tjfx/queryJcktj.do',
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
					pageNumber:1,pageSize:20,height:355,width:1030,
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
	var jsonData=new Array();
	$.ajax({
		type:'post',
		async : false,
		url:'../../../jhgl/queryChildXzqh.do',
		data:'xzqh.id=36__00',
		dataType:'json',
		success:function(data){
			$.each(data,function(index,item){
				$.ajax({
					type:'post',
					url:'../../../tjfx/queryJhktj.do',
					async:false,
					dataType:'json',
					data:'nf='+$('#startYear').val()+'&xzqhdm='+item.id,
					success:function(result){
						var t={'xzqh':null,'xzqhdm':0,'ztz':0,'sl':0,'cgs':0,'stz':0,
								'lmsjztz':0,'lmsjsl':0,'lmsjcgs':0,'lmsjstz':0,
								'lmgjztz':0,'lmgjsl':0,'lmgjcgs':0,'lmgjstz':0,
								'shztz':0,'shsl':0,'shcgs':0,'shstz':0,
								'yhdzxztz':0,'yhdzxsl':0,'yhdzxcgs':0,'yhdzxstz':0,
								'wqgzztz':0,'wqgzsl':0,'wqgzcgs':0,'wqgzstz':0,
								'abgcztz':0,'abgcsl':0,'abgccgs':0,'abgcstz':0,
								'zhfzztz':0,'zhfzsl':0,'zhfzcgs':0,'zhfzstz':0,};
						t.xzqh=item.name;
						for(var i=0;i<result.length;i++){
							t.ztz=Number(t.ztz)+Number(result[i].text);
							t.sl=Number(t.sl)+Number(result[i].bmid);
							if(result[i].id=="安保工程"){
								t.abgcztz=result[i].text;t.abgcsl=result[i].bmid;
								t.abgccgs=result[i].name;t.abgcztz=result[i].parent;
							}else if(result[i].id=="危桥改造"){
								t.wqgzztz=result[i].text;t.wqgzsl =result[i].bmid;
								t.wqgzcgs=result[i].name;t.wqgzstz=result[i].parent;
							}else if(result[i].id=="灾害防治"){
								t.zhfzztz=result[i].text;t.zhfzsl =result[i].bmid;
								t.zhfzcgs=result[i].name;t.zhfzstz=result[i].parent;
							}else if(result[i].id=="路面升级"){
								t.lmsjztz=result[i].text;t.lmsjsl =result[i].bmid;
								t.lmsjcgs=result[i].name;t.lmsjstz=result[i].parent;
							}else if(result[i].id=="路面改建"){
								t.lmgjztz=result[i].text;t.lmgjsl =result[i].bmid;
								t.lmgjcgs=result[i].name;t.lmgjstz=result[i].parent;
							}else if(result[i].id=="水毁项目"){
								t.wqgzztz=result[i].text;t.wqgzsl =result[i].bmid;
								t.wqgzcgs=result[i].name;t.wqgzstz=result[i].parent;
							}else if(result[i].id=="养护大中修"){
								t.yhdzxztz=result[i].text;t.yhdzxsl =result[i].bmid;
								t.yhdzxcgs=result[i].name;t.yhdzxstz=result[i].parent;
							}
						}
						jsonData.push(t);
					}
				});
			});
		}
	});
	var grid={id:'grid',data:jsonData,fitColumns:false,singleSelect:true,pagination:false,rownumbers:false,
		pageNumber:1,pageSize:20,height:373,width:$('#grid').width(),
	    columns:[
		    [
			    {field:'xzqh',title:'行政区划',width:100,align:'center',rowspan:2},
			    {title:'合计',colspan:4},
			    {title:'路面升级',colspan:4},
			    {title:'路面改建',colspan:4},
			    {title:'水毁项目',colspan:4},
			    {title:'养护大中修',colspan:4},
			    {title:'危桥改造',colspan:4},
			    {title:'安保工程',colspan:4},
			    {title:'灾害防治',colspan:4}
			],
			[
			 	{field:'ztz',title:'总投资(万元)',width:100,align:'center',rowspan:1},
			    {field:'cgs',title:'车购税(万元)',width:100,align:'center',rowspan:1},
			    {field:'stz',title:'省投资(万元)',width:100,align:'center',rowspan:1},
			    {field:'sl',title:'数量',width:60,align:'center',rowspan:1},
			    {field:'lmsjztz',title:'总投资(万元)',width:100,align:'center',rowspan:1},
			    {field:'lmsjcgs',title:'车购税(万元)',width:100,align:'center',rowspan:1},
			    {field:'lmsjstz',title:'省投资(万元)',width:100,align:'center',rowspan:1},
			    {field:'lmsjsl',title:'数量',width:60,align:'center',rowspan:1},
			    {field:'lmgjztz',title:'总投资(万元)',width:100,align:'center',rowspan:1},
			    {field:'lmgjcgs',title:'车购税(万元)',width:100,align:'center',rowspan:1},
			    {field:'lmgjstz',title:'省投资(万元)',width:100,align:'center',rowspan:1},
			    {field:'lmgjsl',title:'数量',width:60,align:'center',rowspan:1},
			    {field:'shztz',title:'总投资(万元)',width:100,align:'center',rowspan:1},
			    {field:'shcgs',title:'车购税(万元)',width:100,align:'center',rowspan:1},
			    {field:'shstz',title:'省投资(万元)',width:100,align:'center',rowspan:1},
			    {field:'shsl',title:'数量',width:60,align:'center',rowspan:1},
			    {field:'yhdzxztz',title:'总投资(万元)',width:100,align:'center',rowspan:1},
			    {field:'yhdzxcgs',title:'车购税(万元)',width:100,align:'center',rowspan:1},
			    {field:'yhdzxstz',title:'省投资(万元)',width:100,align:'center',rowspan:1},
			    {field:'yhdzxsl',title:'数量',width:60,align:'center',rowspan:1},
			    {field:'wqgzztz',title:'总投资(万元)',width:100,align:'center',rowspan:1},
			    {field:'wqgzcgs',title:'车购税(万元)',width:100,align:'center',rowspan:1},
			    {field:'wqgzstz',title:'省投资(万元)',width:100,align:'center',rowspan:1},
			    {field:'wqgzsl',title:'数量',width:60,align:'center',rowspan:1},
			    {field:'abgcztz',title:'总投资(万元)',width:100,align:'center',rowspan:1},
			    {field:'abgccgs',title:'车购税(万元)',width:100,align:'center',rowspan:1},
			    {field:'abgcstz',title:'省投资(万元)',width:100,align:'center',rowspan:1},
			    {field:'abgcsl',title:'数量',width:60,align:'center',rowspan:1},
			    {field:'zhfzztz',title:'总投资(万元)',width:100,align:'center',rowspan:1},
			    {field:'zhfzcgs',title:'车购税(万元)',width:100,align:'center',rowspan:1},
			    {field:'zhfzstz',title:'省投资(万元)',width:100,align:'center',rowspan:1},
			    {field:'zhfzsl',title:'数量',width:60,align:'center',rowspan:1},
			]],
		    onSelect:function(rowIndex,rowData){
		    	//window.location.href='../jhktj/xmlxtj.jsp?xzqhdm='+rowData.xzqhdm+'&xzqh='+rowData.xzqh;
		    }
	};
	gridBind(grid);
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
		url:"../../../tjfx/queryJhktjt.do",
		dataType:'text',
		data:'nf='+$('#startYear').val()+'&xzqhdm=36__00',
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
			pageNumber:1,pageSize:20,height:255,width:$('#searchDiv').width(),
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
		    	window.location.href='../gcktj/xmxxlb.jsp?xmlx='+rowIndex+'&nf='+$('#searchYear').combo('getValue');
		    }
		};
	gridBind(grid);
}
function xmxxlist(url,columns,nf){
	var xzqhdm=$.cookie("unit").substring(5);
	if(xzqhdm=="360000")
		xzqhdm=xzqhdm.substring(0,2)+"____";
	else
		xzqhdm=xzqhdm.substring(0,4)+"__";
	queryParams={"jh.sbzt":'1',"jh.spzt":'1',
			"jh.jh_sbthcd":6,"lx.xzqhdm":xzqhdm};
	if(xmlx=="2" || xmlx=="5"){
		queryParams["jh.jhnf"]=nf;
	}else{
		queryParams["jh.sbnf"]=nf;
	}
	var grid={id:'grid',url:url,fitColumns:false,singleSelect:true,pagination:true,rownumbers:false,
			pageNumber:1,pageSize:10,height:255,width:565,queryParams:queryParams,
		    columns:columns,
		    onSelect:null,
		    onLoadSuccess:function(data){
		    	$('#xmcount').html(data.total);
		    }
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
	    onSelect:grid.onSelect,
	    onLoadSuccess:grid.onLoadSuccess
	});
}
function openDialog(id,title,href,jhid){
	bz=id.substring(id.indexOf('_')+1);
	xxId=jhid;
	$('#'+id).dialog({
		iconCls : 'icon-edit',
		href:href,
		width : 1000,
		height : 500,
		closed : true,
		cache : false,
		maximizable:true,
		modal : true,
	}).dialog("setTitle",title).dialog("open");
}