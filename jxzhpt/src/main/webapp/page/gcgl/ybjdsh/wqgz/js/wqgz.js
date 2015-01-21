var obj=new Object();
var obj1=new Object();
function dingwei(){
	alert("在地图上定位");
}
function wqxiangxi(index){
	var data=$("#datagrid").datagrid('getRows')[index];
	obj1=data;
	YMLib.UI.createWindow('wqxx','危桥改造开工详情','wqgzxx.jsp','wqxx',740,450);
	//window.open("wqgzxx.jsp");
}
function closes(str){
	 parent.$('#'+str).window('destroy');
}
function Showybxx(index){
	var data=$("#ybgrid").datagrid('getRows')[index];
	obj=data;
	YMLib.UI.createWindow('wqxx','危桥改造月报详情','wqgzybxx.jsp','wqxx',700,430);
}
function ybsb(index){
	var data=$("#datagrid").datagrid('getRows')[index];
	obj1=data;
	YMLib.UI.createWindow('wqxx1','危桥改造月报列表','wqgzyb.jsp','wqxx1',1059,450);
	//window.open("wqgzyb.jsp");
}
function Edityb(index){
	var data=$("#ybgrid").datagrid('getRows')[index];
	obj=data;
	YMLib.UI.createWindow('wqxx','危桥改造月报编辑','wqgzybxg.jsp','wqxx',650,350);
}

//审核
function ybsh(index){
	var data=$("#ybgrid").datagrid('getRows')[index];
	obj=data;
	YMLib.UI.createWindow('wqxx','危桥改造月报审核','wqgzybsh.jsp','wqxx',450,280);
}
function shwqgzyb(){
	var myDate = new Date();
	var y = myDate.getFullYear();
	var m = myDate.getMonth()+1;       //获取当前月份(0-11,0代表1月)
	var d = myDate.getDate();
	var sbsj = y+"-"+m+"-"+d;
	var data = "gcglwqgz.zjje="+$("#tj_zjje").val()+"&gcglwqgz.xgcsyj="+$("#tj_xgcsyj").val()+"&gcglwqgz.cscyj="+$("#tj_cscyj").val()
	+"&gcglwqgz.shtime="+sbsj+"&gcglwqgz.shuser="+$.cookie("truename") +"&gcglwqgz.jhid="+parent.obj.jhid+"&gcglwqgz.id="+parent.obj.id;
	//alert(data);
	$.ajax({
		type:'post',
		url:'../../../../gcgl/shWqgzYb.do',
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

function xgwqgzyb(){
	var data = "gcglwqgz.wc_btz="+$("#xg_wc_btz").val()+"&gcglwqgz.wc_stz="+$("#xg_wc_stz").val()+"&gcglwqgz.wc_qttz="+$("#xg_wc_qttz").val()
	+"&gcglwqgz.zjdw_btz="+$("#xg_zjdw_btz").val()+"&gcglwqgz.zjdw_stz="+$("#xg_zjdw_stz").val()+"&gcglwqgz.zjdw_qttz="+$("#xg_zjdw_qttz").val()
	+"&gcglwqgz.bywcmc="+$("#xg_bywcmc").val()+"&gcglwqgz.kgdl="+$("#xg_kgdl").val()+"&gcglwqgz.qksm="+$("#xg_qksm").val()+"&gcglwqgz.wcqk="+$("#xg_wcqk").val()
	+"&gcglwqgz.jhid="+parent.obj.jhid+"&gcglwqgz.id="+parent.obj.id;
//	alert(data);
	$.ajax({
		type:'post',
		url:'../../../../gcgl/updateWqgzYb.do',
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
//显示所有
var wqData;
function showAll(){
	var gydw=$("#gydw").combobox("getText");
	if(gydw=='36'||gydw=='江西省')
		gydw='';
	var kgzt='1';
	var jgzt='0';
	var lxmc=$("#lxmc").val();
	var qlmc=$("#qlmc").val();
	$('#datagrid').datagrid({    
	    url:'../../../../gcgl/selectWqgzjhList.do',
	    striped:true,
	    pagination:true,
	    rownumbers:true,
	    pageNumber:1,
	    pageSize:10,
	    height:440,
	    queryParams: {
	    	gydw: gydw,
	    	kgzt: kgzt,
	    	jgzt: jgzt,
	    	lxmc:lxmc,
	    	qlmc:qlmc,
		},
	    columns:[[
	        {field:'c',title:'操作',width:250,align:'center',formatter:function(value,row,index){
	        	return '定位    '+'<a href="#" onclick="wqxiangxi('+index+')">详细</a>    '+'<a href="#" onclick="ybsb('+index+')">月报审核</a>    ';
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
var jhid=10;
function showYBlist(){
	$('#ybgrid').datagrid({    
	    url:'../../../../gcgl/selectWqgzYbByJhid1.do?jhid='+parent.obj1.jhid,
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
			        	return '<a href="#" onclick="Showybxx('+index+')">详细</a>    '+'<a href="#" onclick="Edityb('+index+')">编辑</a>   '+'<a href="#" onclick="ybsh('+index+')">未审核</a>   '+'<a href="#" onclick="thsjyb('+index+')">退回</a>';
	              		else return '<a href="#" onclick="Showybxx('+index+')">详细</a>    '+'编辑   '+'已审核   '+'退回   ';
	              	}},
			        {field:'sbyf',title:'上报月份',width:120,align:'center',rowspan:2},
			        {field:'sbsj',title:'上报时间',width:130,align:'center',rowspan:2},
			        {field:'bywcmc',title:'本月完成面层（公里）',width:120,align:'center',rowspan:2},
			        {field:'kgdl',title:'截至开工段落',width:120,align:'center',rowspan:2},
			        {title:'本月完成投资（万元）',colspan:3},
			        {title:'本月资金到位（万元）',colspan:3},
			        {field:'qksm',title:'情况说明',width:100,align:'center',rowspan:2}
	             ],
	             [
			        {field:'wc_btz',title:'部投资',width:79,align:'center',rowspan:1},
			        {field:'wc_stz',title:'省投资',width:79,align:'center',rowspan:1},
			        {field:'wc_qttz',title:'其他投资',width:79,align:'center',rowspan:1},
			        {field:'zjdw_btz',title:'部投资',width:79,align:'center',rowspan:1},
			        {field:'zjdw_stz',title:'省投资',width:79,align:'center',rowspan:1},
			        {field:'zjdw_qttz',title:'其他投资',width:79,align:'center',rowspan:1}
			    ]
	    ]
	});
}
function thsjyb(index){
	var data1=$("#ybgrid").datagrid('getRows')[index];
	var data="gcglwqgz.id="+data1.id+"&gcglwqgz.sfsj=是"+"&gcglwqgz.sfth=是";
	if(confirm("确认退回吗？")){
		$.ajax({
			type:'post',
			url:'../../../../gcgl/sbWqgzYb.do',
			data:data,
			dataType:'json',
			success:function(msg){
				if(Boolean(msg)){
					alert('退回成功！');
					$("#ybgrid").datagrid('reload');
				}else{
					alert('退回失败！');
				}
			}
		});	
	}	
}