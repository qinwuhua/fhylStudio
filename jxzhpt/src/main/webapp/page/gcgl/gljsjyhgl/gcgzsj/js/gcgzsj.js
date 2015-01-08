var obj=new Object();
var jhid=10;
function dingwei(){
	alert("在地图上定位");
}
function wqxiangxi(){
	YMLib.UI.createWindow('wqxx','工程改造路面升级开工详情','gcgzsjxx.jsp','wqxx',740,450);
	//window.open("gcgzsjxx.jsp");
}
function closes(str){
	 parent.$('#'+str).window('destroy');
}
function sfkaigong(){
	if(confirm("确认开工吗？"))
		return;
}
function ybsb(){
	YMLib.UI.createWindow('wqxx1','工程改造路面升级月报上报','gcgzsjyb.jsp','wqxx1',1059,450);
	//window.open("gcgzsjyb.jsp");
}
function AddInfo(){
	YMLib.UI.createWindow('wqxx','工程改造路面升级月报添加','gcgzsjybtj.jsp','wqxx',900,400);
	//window.open("gcgzsjybtj.jsp");
}
function Showybxx(index){
	var data=$("#ybgrid").datagrid('getRows')[index];
	obj=data;
	YMLib.UI.createWindow('wqxx','工程改造路面升级月报详情','gcgzsjybxx.jsp','wqxx',900,430);
	//window.open("gcgzsjybxx.jsp");
}
function Edityb(index){
	var data=$("#ybgrid").datagrid('getRows')[index];
	obj=data;
	YMLib.UI.createWindow('wqxx','工程改造路面升级月报编辑','gcgzsjybxg.jsp','wqxx',900,400);
	//window.open("gcgzsjybxg.jsp");
}
function Delyb(index){
	var data1=$("#ybgrid").datagrid('getRows')[index];
	var data="gcglgcgzsj.id="+data1.id;
	if(confirm("确认删除吗？")){
		$.ajax({
			type:'post',
			url:'../../../../gcgl/deletegcgzsjYb.do',
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
//添加月报
function tjgcgzsjyb(){
	//alert("xx");
	var myDate = new Date();
	var y = myDate.getFullYear();
	var m = myDate.getMonth()+1;       //获取当前月份(0-11,0代表1月)
	var d = myDate.getDate();
	var sbsj = y+"-"+m+"-"+d;
	var sbyf = y+"-"+m;
	var data = "gcglgcgzsj.qlwcqk_z="+$("#tj_qlwcqk_z").val()+"&gcglgcgzsj.qlwcqk_ym="+$("#tj_qlwcqk_ym").val()+"&gcglgcgzsj.sdwcqk_z="+$("#tj_sdwcqk_z").val()+"&gcglgcgzsj.sdwcqk_ym="+$("#tj_sdwcqk_ym").val()+"&gcglgcgzsj.hdwcqk_m="+$("#tj_hdwcqk_m").val()
	+"&gcglgcgzsj.ljtsfwcqk="+$("#tj_ljtsfwcqk").val()+"&gcglgcgzsj.dcwcqk="+$("#tj_dcwcqk").val()+"&gcglgcgzsj.jcwcqk="+$("#tj_jcwcqk").val()+"&gcglgcgzsj.bywcmc="+$("#tj_bywcmc").val()+"&gcglgcgzsj.lqlmwcqk="+$("#tj_lqlmwcqk").val()+"&gcglgcgzsj.snlmwcqk="+$("#tj_snlmwcqk").val()
	+"&gcglgcgzsj.zycgs="+$("#tj_zycgs").val()+"&gcglgcgzsj.dfbz="+$("#tj_dfbz").val()+"&gcglgcgzsj.yhdk="+$("#tj_yhdk").val()+"&gcglgcgzsj.sttxdk="+$("#tj_sttxdk").val()+"&gcglgcgzsj.qtzj="+$("#tj_qtzj").val()
	+"&gcglgcgzsj.kgdl="+$("#tj_kgdl").val()+"&gcglgcgzsj.qksm="+$("#tj_qksm").val()+"&gcglgcgzsj.bywctze="+$("#tj_bywctze").val()+"&gcglgcgzsj.bywcgzl="+$("#tj_bywcgzl").val()
	+"&gcglgcgzsj.sbsj="+sbsj+"&gcglgcgzsj.sbyf="+sbyf+"&gcglgcgzsj.jhid="+jhid;
	//alert(data);
	$.ajax({
		type:'post',
		url:'../../../../gcgl/insertgcgzsjYb.do',
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
function xggcgzsjyb(){
	//alert("xx");
	var data = "gcglgcgzsj.qlwcqk_z="+$("#xg_qlwcqk_z").val()+"&gcglgcgzsj.qlwcqk_ym="+$("#xg_qlwcqk_ym").val()+"&gcglgcgzsj.sdwcqk_z="+$("#xg_sdwcqk_z").val()+"&gcglgcgzsj.sdwcqk_ym="+$("#xg_sdwcqk_ym").val()+"&gcglgcgzsj.hdwcqk_m="+$("#xg_hdwcqk_m").val()
	+"&gcglgcgzsj.ljtsfwcqk="+$("#xg_ljtsfwcqk").val()+"&gcglgcgzsj.dcwcqk="+$("#xg_dcwcqk").val()+"&gcglgcgzsj.jcwcqk="+$("#xg_jcwcqk").val()+"&gcglgcgzsj.bywcmc="+$("#xg_bywcmc").val()+"&gcglgcgzsj.lqlmwcqk="+$("#xg_lqlmwcqk").val()+"&gcglgcgzsj.snlmwcqk="+$("#xg_snlmwcqk").val()
	+"&gcglgcgzsj.zycgs="+$("#xg_zycgs").val()+"&gcglgcgzsj.dfbz="+$("#xg_dfbz").val()+"&gcglgcgzsj.yhdk="+$("#xg_yhdk").val()+"&gcglgcgzsj.sttxdk="+$("#xg_sttxdk").val()+"&gcglgcgzsj.qtzj="+$("#xg_qtzj").val()
	+"&gcglgcgzsj.kgdl="+$("#xg_kgdl").val()+"&gcglgcgzsj.qksm="+$("#xg_qksm").val()+"&gcglgcgzsj.bywctze="+$("#xg_bywctze").val()+"&gcglgcgzsj.bywcgzl="+$("#xg_bywcgzl").val()
	+"&gcglgcgzsj.jhid="+parent.obj.jhid+"&gcglgcgzsj.id="+parent.obj.id;
	//alert(data);
	$.ajax({
		type:'post',
		url:'../../../../gcgl/updategcgzsjYb.do',
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
	        	return '定位    '+'<a href="#" onclick="wqxiangxi()">详细</a>    '+'开工    '+'删除    '+'<a href="#" onclick="ybsb()">月报上报</a>   '+'完工   '+'未完工   ';
	        }},
	        {field:'c1',title:'是否全线开工',width:80,align:'center',formatter:function(value,row,index){
	        	return '<a href="#" onclick="Showybxx()">否</a>    ';
	        }},
	        {field:'gydw',title:'管养单位',width:130,align:'center'},
	        {field:'xzqh',title:'行政区划',width:120,align:'center'},
	        {field:'lxbm',title:'路线编码',width:120,align:'center'},
	        {field:'lxmc',title:'路线名称',width:100,align:'center'},
	        {field:'qdzh',title:'起点桩号',width:60,align:'center'},
	        {field:'zdzh',title:'止点桩号',width:60,align:'center'},
	        {field:'zlc',title:'总里程',width:80,align:'center'},
	        {field:'yhlc',title:'隐患里程',width:80,align:'center'},
	        {field:'jsdj',title:'技术等级',width:100,align:'center'},
	    ]]    
	}); 
}

function showYBlist(){
	$('#ybgrid').datagrid({    
	    url:'../../../../gcgl/selectgcgzsjYbByJhid.do?jhid='+jhid,
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
			        {field:'qtzj',title:'其他资金',width:79,align:'center',rowspan:1},
			    ]
	    ]
	});
}