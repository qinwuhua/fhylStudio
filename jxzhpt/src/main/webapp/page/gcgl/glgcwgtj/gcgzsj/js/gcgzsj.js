var obj=new Object();
var obj1=new Object();
function dingwei(){
	alert("在地图上定位");
}
function wqxiangxi(index){
	var data=$("#datagrid").datagrid('getRows')[index];
	obj1=data;
	YMLib.UI.createWindow('wqxx','工程改造路面升级完工详情','gcgzsjxx.jsp','wqxx',740,450);
	//window.open("wqgzxx.jsp");
}
function closes(str){
	 parent.$('#'+str).window('destroy');
}
function Showybxx(index){
	var data=$("#ybgrid").datagrid('getRows')[index];
	obj=data;
	YMLib.UI.createWindow('wqxx','工程改造路面升级月报详情','gcgzsjybxx.jsp','wqxx',700,450);
	//window.open("wqgzybxx.jsp");
}
function ybsb(index){
	var data=$("#datagrid").datagrid('getRows')[index];
	obj1=data;
	YMLib.UI.createWindow('wqxx1','工程改造路面升级月报列表','gcgzsjyb.jsp','wqxx1',1059,450);
	//window.open("wqgzyb.jsp");
}

function showAll(){
	var gydw=$("#gydw").combobox("getValue");
	if(gydw=='36')
		gydw='';
	var jgzt='1';
	var kgzt='1';
	var lxmc=$("#lxmc").val();
	var qlmc=$("#qlmc").val();
	$('#datagrid').datagrid({    
	    url:'../../../../gcgl/selectGcgzsjjhList.do',
	    striped:true,
	    pagination:true,
	    rownumbers:true,
	    pageNumber:1,
	    pageSize:10,
	    height:$(window).height()-$(window).height()*0.22,
	    width:$(window).width()-$(window).width()*0.019,
	    queryParams: {
	    	gydw: gydw,
	    	kgzt: kgzt,
	    	jgzt: jgzt,
	    	lxmc:lxmc,
	    	qlmc:qlmc,
	    	ybzt:'',
	    	sfsj:7
		},
	    columns:[[
	        {field:'c',title:'操作',width:250,align:'center',formatter:function(value,row,index){
	        	return '定位    '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="wqxiangxi('+index+')">详细</a>    '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="ybsb('+index+')">月报信息</a>   ';
	        }},
	        {field:'gydw',title:'管养单位',width:130,align:'center'},
	        {field:'xzqhmc',title:'行政区划',width:120,align:'center'},
	        {field:'lxbm',title:'路线编码',width:120,align:'center'},
	        {field:'lxmc',title:'路线名称',width:100,align:'center'},
	        {field:'qdzh',title:'起点桩号',width:60,align:'center'},
	        {field:'zdzh',title:'止点桩号',width:60,align:'center'},
	        {field:'qzlc',title:'总里程',width:80,align:'center'},
	        {field:'xmlc',title:'项目里程',width:80,align:'center'},
	        {field:'yjsdj',title:'技术等级',width:100,align:'center'}
	    ]]    
	}); 
}

function showYBlist(){
	$('#ybgrid').datagrid({    
	    url:'../../../../gcgl/selectgcgzsjYbByJhid.do?jhid='+parent.obj1.id,
	    striped:true,
	    pagination:true,
	    rownumbers:true,
	    pageNumber:1,
	    pageSize:10,
	    height:325,
	    columns:[
	             [
	              	{field:'c',title:'操作',width:150,align:'center',rowspan:2,formatter:function(value,row,index){
	              		return '<a href="#" onclick="Showybxx('+index+')">详细</a>    ';
			        }},
			        {field:'sbyf',title:'上报月份',width:100,align:'center',rowspan:2},
					{field:'sbsj',title:'上报时间',width:100,align:'center',rowspan:2},
					{field:'dcwcqk',title:'本月完成垫层（m³）',width:130,align:'center',rowspan:2},
					{field:'jcwcqk',title:'本月完成基层（m³）',width:130,align:'center',rowspan:2},
					{field:'bywcmc',title:'本月完成面层（公里）',width:130,align:'center',rowspan:2},
					{field:'kgdl',title:'截至开工段落',width:100,align:'center',rowspan:2},
					{title:'本月完成投资（万元）',colspan:5},
					{field:'qksm',title:'情况说明',width:120,align:'center',rowspan:2}
					],
					[
					{field:'zycgs',title:'中央车购税 ',width:79,align:'center',rowspan:1},
					{field:'dfbz',title:'地方补助 ',width:79,align:'center',rowspan:1},
					{field:'yhdk',title:'银行贷款',width:79,align:'center',rowspan:1},
					{field:'sttxdk',title:'省厅贴息',width:79,align:'center',rowspan:1},
					{field:'qtzj',title:'其他资金',width:79,align:'center',rowspan:1}
			    ]
	    ]
	});
}
function downFile(str){
	if($("#xz_"+str).text()=='下载附件'){
		parent.window.location.href="../../../../gcgl/downGcgzsjFile.do?type="+str+"&jhid="+parent.obj1.id;
	}
	else return;
}