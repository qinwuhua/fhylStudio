var obj=new Object();
var jhid=10;
function dingwei(){
	alert("在地图上定位");
}
function wqxiangxi(){
	YMLib.UI.createWindow('wqxx','红色旅游开工详情','hslyxx.jsp','wqxx',740,450);
	//window.open("wqgzxx.jsp");
}
function closes(str){
	 parent.$('#'+str).window('destroy');
}
function Showybxx(index){
	var data=$("#ybgrid").datagrid('getRows')[index];
	obj=data;
	YMLib.UI.createWindow('wqxx','红色旅游月报详情','hslyybxx.jsp','wqxx',700,430);
	//window.open("wqgzybxx.jsp");
}
function ybsb(){
	YMLib.UI.createWindow('wqxx1','红色旅游月报列表','hslyyb.jsp','wqxx1',1059,450);
	//window.open("wqgzyb.jsp");
}
function Edityb(index){
	var data=$("#ybgrid").datagrid('getRows')[index];
	obj=data;
	YMLib.UI.createWindow('wqxx','红色旅游月报编辑','hslyybxg.jsp','wqxx',650,280);
	//window.open("hslyybxg.jsp");
}
//修改
function xghslyyb(){
	//alert("xx");
	var data = "gcglhsly.bywcdc="+$("#xg_bywcdc").val()+"&gcglhsly.bywcjc="+$("#xg_bywcjc").val()+"&gcglhsly.bywcmc="+$("#xg_bywcmc").val()+"&gcglhsly.kgdl="+$("#xg_kgdl").val()
	+"&gcglhsly.qksm="+$("#xg_qksm").val()+"&gcglhsly.bfzj="+$("#xg_bfzj").val()
	+"&gcglhsly.jhid="+parent.obj.jhid+"&gcglhsly.id="+parent.obj.id;
	//alert(data);
	$.ajax({
		type:'post',
		url:'../../../../gcgl/updatehslyYb.do',
		data:data,
		dataType:'json',
		success:function(msg){
			if(Boolean(msg)){
				alert('保存成功！');
				parent.$("#ybgrid").datagrid('reload');
				closes('wqxx');
			}else{
				alert('保存失败！');
			}
		}
	});	
}

function showAll(){
	$('#datagrid').datagrid({    
	    url:'js/sh.json',
	    striped:true,
	    pagination:true,
	    rownumbers:true,
	    pageNumber:1,
	    pageSize:10,
	    height:440,
	    columns:[[
	        {field:'c',title:'操作',width:250,align:'center',formatter:function(value,row,index){
	        	return '定位    '+'<a href="#" onclick="wqxiangxi()">详细</a>    '+'<a href="#" onclick="ybsb()">月报审核</a>   ';
	        }},
	        {field:'xzqh',title:'行政区划',width:120,align:'center'},
	        {field:'jhnf',title:'计划年份',width:120,align:'center'},
	        {field:'xmmc',title:'项目名称',width:100,align:'center'},
	        {field:'jsxz',title:'建设性质',width:80,align:'center'},
	        {field:'ztz',title:'总投资',width:80,align:'center'},
	        {field:'kgn',title:'开工年',width:90,align:'center'},
	        {field:'wgn',title:'完工年',width:90,align:'center'},
	    ]]    
	}); 
}
//审核
function ybsh(index){
	var data=$("#ybgrid").datagrid('getRows')[index];
	obj=data;
	YMLib.UI.createWindow('wqxx','水毁月报审核','hslyybsh.jsp','wqxx',450,280);
}
function shhslyyb(){
	var myDate = new Date();
	var y = myDate.getFullYear();
	var m = myDate.getMonth()+1;       //获取当前月份(0-11,0代表1月)
	var d = myDate.getDate();
	var sbsj = y+"-"+m+"-"+d;
	var data = "gcglhsly.zjje="+$("#tj_zjje").val()+"&gcglhsly.xgcsyj="+$("#tj_xgcsyj").val()+"&gcglhsly.cscyj="+$("#tj_cscyj").val()
	+"&gcglhsly.shtime="+sbsj+"&gcglhsly.shuser="+"admin"+"&gcglhsly.jhid="+jhid+"&gcglhsly.id="+parent.obj.id;
	//alert(data);
	$.ajax({
		type:'post',
		url:'../../../../gcgl/shhslyYb.do',
		data:data,
		dataType:'json',
		success:function(msg){
			if(Boolean(msg)){
				alert('保存成功！');
				parent.$("#ybgrid").datagrid('reload');
				closes('wqxx');
			}else{
				alert('保存失败！');
			}
		}
	});	
}
function showYBlist(){
	$('#ybgrid').datagrid({    
	    url:'../../../../gcgl/selecthslyYbByJhid.do?jhid='+jhid,
	    striped:true,
	    pagination:true,
	    rownumbers:true,
	    pageNumber:1,
	    pageSize:10,
	    height:325,
	    columns:[
	             [
	              	{field:'c',title:'操作',width:150,align:'center',rowspan:2,formatter:function(value,row,index){
	              		if(row.shzt=='未审核')
				        	return '<a href="#" onclick="Showybxx('+index+')">详细</a>    '+'<a href="#" onclick="Edityb('+index+')">编辑</a>   '+'<a href="#" onclick="ybsh('+index+')">未审核</a>';
		              		else return '<a href="#" onclick="Showybxx('+index+')">详细</a>    '+'已审核';
			        }},
			        {field:'sbyf',title:'上报月份',width:130,align:'center',rowspan:2},
			        {field:'sbsj',title:'上报时间',width:130,align:'center',rowspan:2},
			        {field:'bywcdc',title:'本月完成垫层（m³）',width:130,align:'center',rowspan:2},
			        {field:'bywcjc',title:'本月完成基层（m³）',width:130,align:'center',rowspan:2},
			        {field:'bywcmc',title:'本月完成面层（公里）',width:130,align:'center',rowspan:2},
			        {field:'bfzj',title:'拨付资金（万元）',width:130,align:'center',rowspan:2},
			        {field:'kgdl',title:'截至开工段落',width:100,align:'center',rowspan:2},
			        {field:'qksm',title:'情况说明',width:130,align:'center',rowspan:2}
	             ]
	    ]
	});
}