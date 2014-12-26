var checkValues;
function cxzd(jsp,w,h){
	YMLib.UI.createWindow('zd_xz','项目字段选择列表',jsp,'zd_xz',w,h);
}
//基础库管理
function zdy(){
	checkValues.split(",");
	$("#grid").datagrid({    
		 url:"../js/lwxm1.json",
		    striped:true,
		    pagination:true,
		    rownumbers:true,
		    pageNumber:1,
		    pageSize:10,
		    height:325,
		    width:1100,
	    columns:[[    
			{field:'allSel',title:'全选',width:60,align:'center',checkbox:'true'},         
			{field:'cz',title:'操作',width:130,align:'center',formatter:function(value,row,index){
				return '<a href="javascript:() style="text-decoration:none;">定位</a>  '+
				'<a href="javascript:ckJck('+"'wqgz_ck.jsp','900','500'"+')" style="text-decoration:none;">详细</a>  '+
				'<a href="javascript:xgJck('+"'wqgz_xg.jsp','900','500'"+')" style="text-decoration:none;">编辑</a>  '+'删除';
			}},  
	        {field:'shzt',title:'审核状态',width:80,align:'center'}, 
	        {field:'gydw',title:'管养单位',width:160,align:'center'},
	        {field:'xzqh',title:'行政区划',width:120,align:'center'},
	        {field:'qlbh',title:'桥梁编号',width:120,align:'center'},
	        {field:'qlmc',title:'桥梁名称',width:120,align:'center'},
	        {field:'qlzxzh',title:'桥梁中心桩号',width:120,align:'center'},
	        {field:'lxbh',title:'路线编号',width:120,align:'center'},
	        {field:'lxmc',title:'路线名称',width:120,align:'center'},
	        {field:'qlpddj',title:'桥梁评定等级',width:140,align:'center'},
	        {field:'xjnd',title:'修建/改建年度',width:140,align:'center'},
	        {field:'xmnf',title:'项目年份',width:140,align:'center'},
	    ]]    
	});  
}

