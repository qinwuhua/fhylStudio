function dingwei(){
	alert("在地图上定位");
}
function wqxiangxi(){
	YMLib.UI.createWindow('wqxx','养护大中修开工详情','yhdzxxx.jsp','wqxx',740,450);
	//window.open("wqgzxx.jsp");
}
function closes(str){
	 parent.$('#'+str).window('destroy');
}
function Showybxx(){
	YMLib.UI.createWindow('wqxx','养护大中修月报详情','yhdzxybxx.jsp','wqxx',700,450);
	//window.open("wqgzybxx.jsp");
}
function ybsb(){
	YMLib.UI.createWindow('wqxx','养护大中修月报列表','yhdzxyb.jsp','wqxx',1059,540);
	//window.open("wqgzyb.jsp");
}

function showAll(){
	$('#datagrid').datagrid({    
	    url:'js/yhdzx.json',
	    striped:true,
	    pagination:true,
	    rownumbers:true,
	    pageNumber:1,
	    pageSize:10,
	    height:325,
	    columns:[[
	        {field:'c',title:'操作',width:250,align:'center',formatter:function(value,row,index){
	        	return '定位    '+'<a href="#" onclick="wqxiangxi()">详细</a>    '+'<a href="#" onclick="ybsb()">月报审核</a>   ';
	        }},
	        {field:'gydw',title:'管养单位',width:130,align:'center'},
	        {field:'xzqh',title:'行政区划',width:120,align:'center'},
	        {field:'lxbm',title:'路线编码',width:120,align:'center'},
	        {field:'lxmc',title:'路线名称',width:100,align:'center'},
	        {field:'qdzh',title:'起点桩号',width:60,align:'center'},
	        {field:'zdzh',title:'止点桩号',width:60,align:'center'},
	        {field:'zlc',title:'总里程',width:80,align:'center'},
	        {field:'hdlc',title:'核对里程',width:60,align:'center'},
	        {field:'jsdj',title:'技术等级',width:80,align:'center'},
	        {field:'ylmkd',title:'原路面宽度',width:80,align:'center'},
	        {field:'gcfl',title:'工程分类',width:80,align:'center'},
	        {field:'ztz',title:'总投资',width:60,align:'center'},
	        {field:'zbzzj',title:'总补助资金',width:90,align:'center'}
	    ]]    
	}); 
}

function showYBlist(){
	$('#ybgrid').datagrid({    
	    url:'js/yhdzxyb.json',
	    striped:true,
	    pagination:true,
	    rownumbers:true,
	    pageNumber:1,
	    pageSize:10,
	    height:325,
	    columns:[
	             [
	              	{field:'c',title:'操作',width:150,align:'center',rowspan:2,formatter:function(value,row,index){
			        	return '<a href="#" onclick="Showybxx()">详细</a>    '+'<a href="#" onclick="Edityb()">编辑</a>   '+'<a href="#" onclick="ybsh()">未审核</a>';
			        }},
			        {field:'sbyf',title:'上报月份',width:100,align:'center',rowspan:2},
			        {field:'sbsj',title:'上报时间',width:100,align:'center',rowspan:2},
			        {field:'bywcdc',title:'本月完成垫层（m³）',width:100,align:'center',rowspan:2},
			        {field:'bywcjc',title:'本月完成基层（m³）',width:100,align:'center',rowspan:2},
			        {field:'bywcmc',title:'本月完成面层（公里）',width:100,align:'center',rowspan:2},
			        {field:'jzkgdl',title:'截至开工段落',width:100,align:'center',rowspan:2},
			        {title:'本月完成投资（万元）',colspan:3},
			        {title:'本月资金到位（万元）',colspan:3},
			        {field:'qksm',title:'情况说明',width:150,align:'center',rowspan:2}
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