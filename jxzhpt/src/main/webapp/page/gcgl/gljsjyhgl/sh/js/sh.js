var obj=new Object();
function dingwei(){
	alert("在地图上定位");
}
function wqxiangxi(){
	YMLib.UI.createWindow('wqxx','水毁项目开工详情','shxx.jsp','wqxx',740,450);
	//window.open("shxx.jsp");
}
function closes(str){
	 parent.$('#'+str).window('destroy');
}
function sfkaigong(){
	if(confirm("确认开工吗？"))
		return;
}
function ybsb(){
	YMLib.UI.createWindow('wqxx1','水毁项目月报上报','shyb.jsp','wqxx1',1059,450);
	//window.open("shyb.jsp");
}
function AddInfo(){
	YMLib.UI.createWindow('wqxx','水毁项目月报添加','shybtj.jsp','wqxx',680,360);
	//window.open("shybtj.jsp");
}
function Showybxx(index){
	var data=$("#ybgrid").datagrid('getRows')[index];
	obj=data;
	YMLib.UI.createWindow('wqxx','水毁项目月报详情','shybxx.jsp','wqxx',700,430);
	//window.open("shybxx.jsp");
}
function Edityb(index){
	var data=$("#ybgrid").datagrid('getRows')[index];
	obj=data;
	YMLib.UI.createWindow('wqxx','水毁项目月报编辑','shybxg.jsp','wqxx',680,360);
	//window.open("shybxg.jsp");
}
function Delyb(index){
	var data1=$("#ybgrid").datagrid('getRows')[index];
	var data="gcglsh.id="+data1.id;
	if(confirm("确认删除吗？")){
		$.ajax({
			type:'post',
			url:'../../../../gcgl/deleteshYb.do',
			data:data,
			dataType:'json',
			success:function(msg){
				if(Boolean(msg)){
					alert('删除成功！');
					$("#ybgrid").datagrid('reload');
				}else{
					alert('删除失败！');
				}
			}
		});	
	}	
}
//月报添加
var jhid=10;
function tjshyb(){
	//alert("xx");
	var myDate = new Date();
	var y = myDate.getFullYear();
	var m = myDate.getMonth()+1;       //获取当前月份(0-11,0代表1月)
	var d = myDate.getDate();
	var sbsj = y+"-"+m+"-"+d;
	var sbyf = y+"-"+m;
	var data = "gcglsh.wc_btz="+$("#tj_wc_btz").val()+"&gcglsh.wc_stz="+$("#tj_wc_stz").val()+"&gcglsh.wc_qttz="+$("#tj_wc_qttz").val()
	+"&gcglsh.zjdw_btz="+$("#tj_zjdw_btz").val()+"&gcglsh.zjdw_stz="+$("#tj_zjdw_stz").val()+"&gcglsh.zjdw_qttz="+$("#tj_zjdw_qttz").val()
	+"&gcglsh.bywcdc="+$("#tj_bywcdc").val()+"&gcglsh.bywcjc="+$("#tj_bywcjc").val()+"&gcglsh.bywcmc="+$("#tj_bywcmc").val()+"&gcglsh.kgdl="+$("#tj_kgdl").val()
	+"&gcglsh.qksm="+$("#tj_qksm").val()+"&gcglsh.wcqk="+$("#tj_wcqk").val()
	+"&gcglsh.sbsj="+sbsj+"&gcglsh.sbyf="+sbyf+"&gcglsh.jhid="+jhid;
	//alert(data);
	$.ajax({
		type:'post',
		url:'../../../../gcgl/insertshYb.do',
		data:data,
		dataType:'json',
		success:function(msg){
			if(Boolean(msg)){
				alert('保存成功！');
				parent.$("#ybgrid").datagrid('reload');
				closes('wqxx');
			}else{
				alert('该月月报可能已存在，保存失败！');
			}
		}
	});	
}
//修改
function xgshyb(){
	//alert("xx");
	var data = "gcglsh.wc_btz="+$("#xg_wc_btz").val()+"&gcglsh.wc_stz="+$("#xg_wc_stz").val()+"&gcglsh.wc_qttz="+$("#xg_wc_qttz").val()
	+"&gcglsh.zjdw_btz="+$("#xg_zjdw_btz").val()+"&gcglsh.zjdw_stz="+$("#xg_zjdw_stz").val()+"&gcglsh.zjdw_qttz="+$("#xg_zjdw_qttz").val()
	+"&gcglsh.bywcdc="+$("#xg_bywcdc").val()+"&gcglsh.bywcjc="+$("#xg_bywcjc").val()+"&gcglsh.bywcmc="+$("#xg_bywcmc").val()+"&gcglsh.kgdl="+$("#xg_kgdl").val()
	+"&gcglsh.qksm="+$("#xg_qksm").val()+"&gcglsh.wcqk="+$("#xg_wcqk").val()
	+"&gcglsh.jhid="+parent.obj.jhid+"&gcglsh.id="+parent.obj.id;
	//alert(data);
	$.ajax({
		type:'post',
		url:'../../../../gcgl/updateshYb.do',
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
	var gydw=$("#gydw").combobox("getText");
	if(gydw=='36'||gydw=='江西省')
		gydw='';
	var kgzt=$("#kgzt").combobox("getValue");
	var lxmc=$("#lxmc").val();
	$('#datagrid').datagrid({    
	    url:'../../../../gcgl/selectShjhList.do',
	    striped:true,
	    pagination:true,
	    rownumbers:true,
	    pageNumber:1,
	    pageSize:10,
	    height:440,
	    queryParams: {
	    	gydw: gydw,
	    	kgzt: kgzt,
	    	lxmc:lxmc,
		},
	    columns:[[
			{field:'c',title:'操作',width:250,align:'center',formatter:function(value,row,index){
				if(row.kgzt=='1'){
					return '定位    '+'<a href="#" onclick="wqxiangxi('+index+')">详细</a>    '+'已开工  '+'<a href="#" onclick="ybsb('+index+')">月报</a>   '+'<a href="#" onclick="wangong('+index+')">完工</a>  '+'<a href="#" onclick="wwangong('+index+')">未完工</a>  ';
				}else
				return '定位    '+'<a href="#" onclick="wqxiangxi('+index+')">详细</a>    '+'<a href="#" onclick="kaigong('+index+')">开工</a>  ';
			}},
	        {field:'c1',title:'是否全线开工',width:80,align:'center',formatter:function(value,row,index){
	        	return '<a href="#" onclick="sfqxkg('+index+')">否</a>    ';
	        }},
	        {field:'gydw',title:'管养单位',width:130,align:'center'},
	        {field:'xzqhmc',title:'行政区划',width:120,align:'center'},
	        {field:'lxbm',title:'路线编码',width:120,align:'center'},
	        {field:'lxmc',title:'路线名称',width:100,align:'center'},
	        {field:'qdzh',title:'起点桩号',width:60,align:'center'},
	        {field:'zdzh',title:'止点桩号',width:60,align:'center'},
	        {field:'qzlc',title:'总里程',width:80,align:'center'},
	        {field:'yhlc',title:'隐患里程',width:80,align:'center'},
	        {field:'ylmlx',title:'原路面类型',width:100,align:'center'},
	    ]]    
	}); 
}
var jhid=10;
function showYBlist(){
	$('#ybgrid').datagrid({    
	    url:'../../../../gcgl/selectshYbByJhid.do?jhid='+jhid,
	    striped:true,
	    pagination:true,
	    rownumbers:true,
	    pageNumber:1,
	    pageSize:10,
	    height:325,
	    columns:[
	             [
	              	{field:'c',title:'操作',width:200,align:'center',rowspan:2,formatter:function(value,row,index){
	              		if(row.shzt=='未审核')
				        	return '<a href="#" onclick="Showybxx('+index+')">详细</a>    '+'<a href="#" onclick="Edityb('+index+')">编辑</a>   '+'<a href="#" onclick="Delyb('+index+')">删除</a>';
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