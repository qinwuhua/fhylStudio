function dingwei(){
	alert("在地图上定位");
}
function wqxiangxi(){
	YMLib.UI.createWindow('wqxx','危桥改造开工详情','wqgzxx.jsp','wqxx',740,450);
	//window.open("wqgzxx.jsp");
}
function closes(str){
	 parent.$('#'+str).window('destroy');
}
function Showybxx(){
	YMLib.UI.createWindow('wqxx','危桥改造月报详情','wqgzybxx.jsp','wqxx',700,450);
	//window.open("wqgzybxx.jsp");
}
function ybsb(){
	YMLib.UI.createWindow('wqxx','危桥改造月报列表','wqgzyb.jsp','wqxx',1059,450);
	//window.open("wqgzyb.jsp");
}
function showAll(){
	$('#datagrid').datagrid({    
	    url:'js/wqgz.json',
	    striped:true,
	    pagination:true,
	    rownumbers:true,
	    pageNumber:1,
	    pageSize:10,
	    height:325,
	    columns:[[
	        {field:'c',title:'操作',width:250,align:'center',formatter:function(value,row,index){
	        	return '定位    '+'<a href="#" onclick="wqxiangxi()">详细</a>    '+'<a href="#" onclick="ybsb()">月报信息</a>   ';
	        }},
	        {field:'gydw',title:'管养单位',width:150,align:'center'},
	        {field:'xzqh',title:'行政区划',width:120,align:'center'},
	        {field:'qlbm',title:'桥梁编码',width:120,align:'center'},
	        {field:'qlmc',title:'桥梁名称',width:120,align:'center'},
	        {field:'qlzxzh',title:'桥梁中心桩号',width:100,align:'center'},
	        {field:'qlqk',title:'桥梁全宽',width:80,align:'center'},
	        {field:'qlqc',title:'桥梁全长',width:80,align:'center'},
	        {field:'kjzc',title:'跨径总长',width:60,align:'center'},
	        {field:'jsdj',title:'技术等级',width:60,align:'center'},
	        {field:'gjnf',title:'改建/修建年度',width:100,align:'center'}
	    ]]    
	}); 
}

function showYBlist(){
	$('#ybgrid').datagrid({    
	    url:'js/wqgzyb.json',
	    striped:true,
	    pagination:true,
	    rownumbers:true,
	    pageNumber:1,
	    pageSize:10,
	    height:325,
	    columns:[
	             [
	              	{field:'c',title:'操作',width:150,align:'center',rowspan:2,formatter:function(value,row,index){
			        	return '<a href="#" onclick="Showybxx()">详细</a>    ';
			        }},
			        {field:'sbyf',title:'上报月份',width:120,align:'center',rowspan:2},
			        {field:'sbsj',title:'上报时间',width:130,align:'center',rowspan:2},
			        {field:'bywcmc',title:'本月完成面层（公里）',width:120,align:'center',rowspan:2},
			        {field:'jzkgdl',title:'截至开工段落',width:120,align:'center',rowspan:2},
			        {title:'本月完成投资（万元）',colspan:3},
			        {title:'本月资金到位（万元）',colspan:3},
			        {field:'qksm',title:'情况说明',width:100,align:'center',rowspan:2}
	             ],
	             [
			        {field:'tzbtz',title:'部投资',width:79,align:'center',rowspan:1},
			        {field:'tzstz',title:'省投资',width:79,align:'center',rowspan:1},
			        {field:'tzqttz',title:'其他投资',width:79,align:'center',rowspan:1},
			        {field:'dwbtz',title:'部投资',width:79,align:'center',rowspan:1},
			        {field:'dwstz',title:'省投资',width:79,align:'center',rowspan:1},
			        {field:'dwqttz',title:'其他投资',width:79,align:'center',rowspan:1}
			    ]
	    ]
	});
}