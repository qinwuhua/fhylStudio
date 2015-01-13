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
function Showybxx(index){
	var data=$("#ybgrid").datagrid('getRows')[index];
	obj=data;
	YMLib.UI.createWindow('wqxx','养护大中修月报详情','yhdzxybxx.jsp','wqxx',700,430);
	//window.open("wqgzybxx.jsp");
}
function ybsb(){
	YMLib.UI.createWindow('wqxx1','养护大中修月报列表','yhdzxyb.jsp','wqxx1',1059,450);
	//window.open("wqgzyb.jsp");
}
function Edityb(index){
	var data=$("#ybgrid").datagrid('getRows')[index];
	obj=data;
	YMLib.UI.createWindow('wqxx','养护大中修月报编辑','yhdzxybxg.jsp','wqxx',680,360);
	//window.open("yhdzxybxg.jsp");
}
//修改
function xgyhdzxyb(){
	var data = "gcglyhdzx.wc_btz="+$("#xg_wc_btz").val()+"&gcglyhdzx.wc_stz="+$("#xg_wc_stz").val()+"&gcglyhdzx.wc_qttz="+$("#xg_wc_qttz").val()
	+"&gcglyhdzx.zjdw_btz="+$("#xg_zjdw_btz").val()+"&gcglyhdzx.zjdw_stz="+$("#xg_zjdw_stz").val()+"&gcglyhdzx.zjdw_qttz="+$("#xg_zjdw_qttz").val()
	+"&gcglyhdzx.bywcdc="+$("#xg_bywcdc").val()+"&gcglyhdzx.bywcjc="+$("#xg_bywcjc").val()+"&gcglyhdzx.bywcmc="+$("#xg_bywcmc").val()+"&gcglyhdzx.kgdl="+$("#xg_kgdl").val()
	+"&gcglyhdzx.qksm="+$("#xg_qksm").val()+"&gcglyhdzx.wcqk="+$("#xg_wcqk").val()
	+"&gcglyhdzx.jhid="+parent.obj.jhid+"&gcglyhdzx.id="+parent.obj.id;
//	alert(data);
	$.ajax({
		type:'post',
		url:'../../../../gcgl/updateYhdzxYb.do',
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
//审核
function ybsh(index){
	var data=$("#ybgrid").datagrid('getRows')[index];
	obj=data;
	YMLib.UI.createWindow('wqxx','养护大中修月报审核','yhdzxybsh.jsp','wqxx',450,280);
}
function shyhdzxyb(){
	var myDate = new Date();
	var y = myDate.getFullYear();
	var m = myDate.getMonth()+1;       //获取当前月份(0-11,0代表1月)
	var d = myDate.getDate();
	var sbsj = y+"-"+m+"-"+d;
	var data = "gcglyhdzx.zjje="+$("#tj_zjje").val()+"&gcglyhdzx.xgcsyj="+$("#tj_xgcsyj").val()+"&gcglyhdzx.cscyj="+$("#tj_cscyj").val()
	+"&gcglyhdzx.shtime="+sbsj+"&gcglyhdzx.shuser="+$.cookie("truename")+"&gcglyhdzx.jhid="+jhid+"&gcglyhdzx.id="+parent.obj.id;
	//alert(data);
	$.ajax({
		type:'post',
		url:'../../../../gcgl/shYhdzxYb.do',
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


var jhid=10;
function showAll(){
	$('#datagrid').datagrid({    
	    url:'js/yhdzx.json',
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
	    url:'../../../../gcgl/selectYhdzxYbByJhid.do?jhid='+jhid,
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
			        {field:'sbyf',title:'上报月份',width:100,align:'center',rowspan:2},
			        {field:'sbsj',title:'上报时间',width:100,align:'center',rowspan:2},
			        {field:'bywcdc',title:'本月完成垫层（m³）',width:120,align:'center',rowspan:2},
			        {field:'bywcjc',title:'本月完成基层（m³）',width:120,align:'center',rowspan:2},
			        {field:'bywcmc',title:'本月完成面层（公里）',width:120,align:'center',rowspan:2},
			        {field:'kgdl',title:'截至开工段落',width:100,align:'center',rowspan:2},
			        {title:'本月完成投资（万元）',colspan:3},
			        {title:'本月资金到位（万元）',colspan:3},
			        {field:'qksm',title:'情况说明',width:150,align:'center',rowspan:2}
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