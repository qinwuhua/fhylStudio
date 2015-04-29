var obj=new Object();
var obj1=new Object();
function dingwei(index){
	var data=$("#datagrid").datagrid('getRows')[index];
	locationXm(data.lxbm,"");
}
function wqxiangxi(index){
	var data=$("#datagrid").datagrid('getRows')[index];
	obj1=data;
	YMLib.Var.jhbm=data.id;
	YMLib.UI.createWindow('yhdzx_xx','养护大中修项目计划详情',"/jxzhpt/page/jhgl/jhkxx/yhdzx.jsp",'yhdzx_xx',1000,500);
	//window.open("wqgzxx.jsp");
}
function closes(str){
	 parent.$('#'+str).window('destroy');
}
function Showybxx(index){
	var data=$("#ybgrid").datagrid('getRows')[index];
	parent.obj=data;
	parent.YMLib.UI.createWindow('wqxx','养护大中修月报详情','yhdzxybxx.jsp','wqxx',800,450);
	//window.open("wqgzybxx.jsp");
}
function ybsb(index){
	var data=$("#datagrid").datagrid('getRows')[index];
	obj1=data;
	YMLib.UI.createWindow('wqxx1','养护大中修月报列表','yhdzxyb.jsp','wqxx1',1059,480);
	//window.open("wqgzyb.jsp");
}

function showAll(){
	var xmnf=$("#ddlYear").val();
	var gydw1=$("#gydw").combotree("getValues");
	if(gydw1.length==0||gydw1.length==1){
		gydw1str=$.cookie("unit2");
	}else{
		gydw1str=gydw1.join(',');
	}
	var jgzt='1';
	var kgzt='1';
	var lxmc=$("#lxmc").val();
	$('#datagrid').datagrid({    
	    url:'../../../../gcgl/selectYhdzxjhList.do',
	    striped:true,
	    pagination:true,
	    rownumbers:true,
	    pageNumber:1,
	    pageSize:10,
	    height:$(window).height()-$(window).height()*0.22,
	    width:$(window).width()-$(window).width()*0.019,
	    queryParams: {
	    	gydw: gydw1str,
	    	kgzt: kgzt,
	    	jgzt: jgzt,
	    	lxmc:lxmc,
	    	ybzt:'',
	    	sfsj:7,
	    	xmnf:xmnf
		},
	    columns:[[
	        {field:'c',title:'操作',width:250,align:'center',formatter:function(value,row,index){
	        	return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dingwei('+index+')">定位</a>    '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="wqxiangxi('+index+')">详细</a>    '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="ybsb('+index+')">月报信息</a>   ';
	        }},
	        {field:'sbnf',title:'上报年份',width:80,align:'center'},
	        {field:'xmmc',title:'项目名称',width:200,align:'center'},
 	        {field:'c5',title:'管养单位',width:200,align:'center',formatter:function(value,row,index){
 		    	return row.plan_lx_yhdzxs[0].gydwmc;
 		    }},
	        {field:'jhkgsj',title:'计划开工时间',width:100,align:'center'},
	        {field:'jhwgsj',title:'计划完工时间',width:100,align:'center'},
	        {field:'totalinvest',title:'批复总投资',width:80,align:'center'},
	        {field:'totalsubsidyfund',title:'部补助金额(万元)',width:100,align:'center'},
		    {field:'totalplacefund',title:'地方自筹金额(万元)',width:100,align:'center'}
	    ]],
	    view: detailview,
		detailFormatter:function(index,row){   
	        return '<div style="padding:2px"><table id="table_lx' + index + '"></table></div>';   
	    },
	    onExpandRow: function(index,row){
	    	$('#table_lx'+index).datagrid({
	    		data:row.plan_lx_yhdzxs,
  			columns:[[
  			    {field:'gydwmc',title:'管养单位',width:200,align:'center'},
  			    {field:'xzqhmc',title:'行政区划名称',width:100,align:'center'},
  			    {field:'lxmc',title:'路线名称',width:100,align:'center'},
  			    {field:'lxbm',title:'路线编码',width:100,align:'center'},
  			    {field:'qdzh',title:'起点桩号',width:60,align:'center'},
  			    {field:'zdzh',title:'止点桩号',width:60,align:'center'},
  			    {field:'hdlc',title:'隐患里程',width:60,align:'center'}
  			]]
	    	});
	    }    
	}); 
}

function showYBlist(){
	$('#ybgrid').datagrid({    
	    url:'../../../../gcgl/selectYhdzxYbByJhid1.do?jhid='+parent.obj1.id,
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
function jiazai(ooo){
//	alert(ooo);
	var data=ooo;

	$.ajax({
		type:'post',
		url:'../../../../gcgl/selectYhdzxjhFile.do',
		data:data,
		dataType:'json',
		async:false,
		success:function(msg){
			if(msg.sgxkwj!=''){
				$("#xz_sgxkwj").text(msg.sgxkwj);
				$("#xz_sgxkwj").attr("style",'color: #2C7ED1;cursor:pointer;');
				$("#xz_sgxkwj").attr("href",'/jxzhpt/gcgl/downYhdzxFile.do?type=sgxkwj'+"&jhid="+parent.obj1.id);
			}
			if(msg.jgtcwj!=''){
				$("#xz_jgtcwj").text(msg.jgtcwj);
				$("#xz_jgtcwj").attr("style",'color: #2C7ED1;cursor:pointer;');
				$("#xz_jgtcwj").attr("href",'/jxzhpt/gcgl/downYhdzxFile.do?type=jgtcwj'+"&jhid="+parent.obj1.id);
			}
			if(msg.jgyswj!=''){
				$("#xz_jgyswj").text(msg.jgyswj);
				$("#xz_jgyswj").attr("style",'color: #2C7ED1;cursor:pointer;');
				$("#xz_jgyswj").attr("href",'/jxzhpt/gcgl/downYhdzxFile.do?type=jgyswj'+"&jhid="+parent.obj1.id);
			}
			}
	});	
}